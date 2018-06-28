//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
#include <mmsystem.h>
#include "Main.h"
//---------------------------------------------------------------------------
#include "BS4I1Thr.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
__fastcall TTDThread::TTDThread(bool CreateSuspended,DWORD P,bool *ON,bool *RUN,TCOMPort *CPRT,double *TmCLOSE,int NUMSRS,TBTSensor** SRS)
        : TThread(CreateSuspended)
{
  FreeOnTerminate=true;
  p=P;on=ON;run=RUN;CPrt=CPRT;TmClose=TmCLOSE;
  NumTSrs=NUMSRS;Srs=SRS;*on=true;
  ServiceMode=false;
}
//---------------------------------------------------------------------------
void TTDThread::SetName()
{
  THREADNAME_INFO info;
  info.dwType = 0x1000;
  info.szName = "BS4I1SrvThread";
  info.dwThreadID = -1;
  info.dwFlags = 0;
  __try
  {
    RaiseException(0x406D1388,0,sizeof(info)/sizeof(DWORD),(DWORD*)&info );
  }
  __except (EXCEPTION_CONTINUE_EXECUTION)
  {
  }
}
//---------------------------------------------------------------------------
extern int PPauseTick,PReOpen,PClose,TORCom,TOWCom,TORDat,TOWDat,
           SAdrChange,SRError,SCRCError,SIdle;
//---------------------------------------------------------------------------
extern bool CRCErr;
//---------------------------------------------------------------------------
extern TServerSocket *PGPRSServer;
//---------------------------------------------------------------------------
void __fastcall TTDThread::Execute()
{
  SetName();bool Terminat=false;

  while((!Terminated)&&(!Terminat))
  {

      while (ServiceMode)
      {
        Sleep(SIdle);
      }


    // Попытка открыть порт если не открыт, повторная попытка через PReOpen мс //PReOpen=5000; // Тест
    if(p!=499) {if(!CPrt->st.on) if(!CPrt->Open(false,p))               { Pause(PReOpen);continue;}} // GPRS
    else       {if(!CPrt->st.on) if(!CPrt->Open(false,500,PGPRSServer)) { Pause(PReOpen);continue;}} // GPRS
    //if(!CPrt->st.on) if(!CPrt->Open(false,p)) { Pause(PReOpen);continue;}
    if(Terminated) break;
    // Тест //if(p==7) { RunSlave();continue;} // COM8
    //int res; // gluk 1
    int res=1;
    //---------------------------------------------------------------------------------------------------
    // Общие команды
    //---------------------------------------------------------------------------------------------------
    if(*(DWORD*)(&UCmd.cs)>0)
    {
      if(Terminated) break;
      Sleep(SAdrChange); // Переключение адреса >10 мс
      //------------------------------------------------------------------------------------------------------------------------------
      if(res==1) if(UCmd.cs.Reset)  {res=Reset();UCmd.cs.Reset=false;}
      //------------------------------------------------------------------------------------------------------------------------------
      if(res==1) if(UCmd.cs.StackOff)
      {
        res=StackOn(false,UCmd.SClrOff,UCmd.nGroup);UCmd.cs.StackOff=false;
        if(res==1) for(int j=0;j<NumTSrs;j++) if(Srs[j]->on) {Srs[j]->SBuf.on=false;if(UCmd.SProgClrOff) Srs[j]->SBuf.Clr();}
      }
      //------------------------------------------------------------------------------------------------------------------------------
      if(res==1) if(UCmd.cs.StackOn)
      {
        res=StackOn(true,UCmd.SClrOn,UCmd.nGroup);UCmd.cs.StackOn=false;
        if(res==1) for(int j=0;j<NumTSrs;j++) if(Srs[j]->on)
        {
          if(UCmd.SProgClrOn) Srs[j]->SBuf.Clr();Srs[j]->SBuf.on=true;
          Srs[j]->StackStartTime=Now();
        }
      }
      //------------------------------------------------------------------------------------------------------------------------------
      if(res==1) if(UCmd.cs.StackSOn)
      {
        res=StackSOn();UCmd.cs.StackSOn=false;
        if(res==1) for(int j=0;j<NumTSrs;j++) if(Srs[j]->on)
        {
          Srs[j]->SBuf.Clr();Srs[j]->SBuf.on=true;
          Srs[j]->StackStartTime=Now();
        }
      }
      //------------------------------------------------------------------------------------------------------------------------------
    }

    //---------------------------------------------------------------------------------------------------
    // Индивидуальные команды
    //---------------------------------------------------------------------------------------------------
    if(res==1)

//перебираем все датчики списка датчиков данного порта
    for(int i=0;i<NumTSrs;i++)
    {
      if(Terminated) break;
      if(!Srs[i]->on) continue;
      bool run=*(DWORD*)(&Srs[i]->UCmd.cs)>0;

      if(run)
      {
         Srs[i]->Tm_Start=Srs[i]->Tm_Stop;
         Srs[i]->Tm_Stop=CoreTime();
      }
      else
      {
       Sleep(SIdle);
       continue;
      }

      Sleep(SAdrChange); // Переключение адреса >10 мс

//Тут заказывается съем показаний датчика углов

      if (CPrt->Protocol211!=NULL)
      {
        res=Srs[i]->ExecComs_IND3(CPrt);
      }
      else
      {
        res=Srs[i]->ExecComs(CPrt);
      }

      //-------------------------------------------------------------------------------------------------------------------------------
      // Прошивка
      //-------------------------------------------------------------------------------------------------------------------------------
      if(res==1) if(Srs[i]->UCmd.cs.Prog)
      {
        res=Srs[i]->Prog(CPrt);
        //if(res==1) Srs[i]->UCmd.cs.Prog=false;
        Srs[i]->UCmd.cs.Prog=false; // !!! GPRS
        if(CPrt->st.res) { Terminat=true;for(int j=0;j<NumTSrs;j++) Srs[j]->porton=false;}
      }
      //------------------------------------------------------------------------------------------------------------------------------
      // Настройка датчика
      //-------------------------------------------------------------------------------------------------------------------------------
      if(res==1) if(Srs[i]->UCmd.cs.D3Set)
      {
        res=Srs[i]->D3Set(CPrt);if(res==1) Srs[i]->UCmd.cs.D3Set=false;
        if(CPrt->st.res) { Terminat=true;for(int j=0;j<NumTSrs;j++) Srs[j]->porton=false;}
      }
      //------------------------------------------------------------------------------------------------------------------------------

      extern DWORD NumRErrSrs,NumCErrSrs;

      //!!!Съем данных с датчика заказывается в этой строке
      if(res==1)
      {
                if(Srs[i]->on)
                {
                        Srs[i]->dataon=true;
                }
       Srs[i]->Tm_dataon=Now();
       Srs[i]->er=0;
       Srs[i]->ec=0;
      }

      if(res==3) if((Srs[i]->er%NumRErrSrs)==0) *(WORD*)(&Srs[i]->UCmd.cs)=0; // Ошибка чтения
      if(res==7) if((Srs[i]->ec%NumCErrSrs)==0) *(WORD*)(&Srs[i]->UCmd.cs)=0; // Ошибка CRC
      if(res==0) break;
    }

    if(res==0) {PortClose();Pause(PReOpen);continue;}
    if(res==3) {Sleep(SRError);  continue;} // Ошибка чтения
    if(res==7) {Sleep(SCRCError);continue;} // Ошибка CRC
    Sleep(SIdle);
  }

  PortClose();*TmClose=Now();*on=false;
}
//---------------------------------------------------------------------------
void TTDThread::RunSlave(void)
{
  if(!CPrt->PortNRead(6,CPrt->buf4100)) return;
  if(CRCErr) CPrt->buf4100[0]=1; // Тест CRC
  int n;
  switch(CPrt->buf4100[1])
  {
    case  35: n=4;
              *(int*)(CPrt->buf4100+2)=33.33*1000;
              *(WORD*)(CPrt->buf4100+2+n)=CRC16CCITT(2+n,CPrt->buf4100);
              if(CPrt->PortNWrite(2+2+n,CPrt->buf4100)) return;
              break;
    case 108: n=8;
              *(short*)(CPrt->buf4100+2)=11.1*8*36.0;
              *(short*)(CPrt->buf4100+2+2)=22.2*8*36.0;
              *(WORD*)(CPrt->buf4100+2+n)=CRC16CCITT(2+n,CPrt->buf4100);
              if(CPrt->PortNWrite(2+2+n,CPrt->buf4100)) return;
              break;
    case 134: n=2;
              *(WORD*)(CPrt->buf4100+2)=44*8;
              *(WORD*)(CPrt->buf4100+2+n)=CRC16CCITT(2+n,CPrt->buf4100);
              if(CPrt->PortNWrite(2+2+n,CPrt->buf4100)) return;
              break;
    case  36: n=4;
              *(WORD*)(CPrt->buf4100+2)=0;
              *(WORD*)(CPrt->buf4100+2+n)=CRC16CCITT(2+n,CPrt->buf4100);
              if(CPrt->PortNWrite(2+2+n,CPrt->buf4100)) return;
              break;
    case 201: n=12;
              *(WORD*)(CPrt->buf4100+2)=0;
              *(WORD*)(CPrt->buf4100+2+n)=CRC16CCITT(2+n,CPrt->buf4100);
              if(CPrt->PortNWrite(2+2+n,CPrt->buf4100)) return;
              break;
    case 202: n=8;
              *(WORD*)(CPrt->buf4100+2)=0;
              *(WORD*)(CPrt->buf4100+2+n)=CRC16CCITT(2+n,CPrt->buf4100);
              if(CPrt->PortNWrite(2+2+n,CPrt->buf4100)) return;
              break;
  }
  PortClose();Pause(PReOpen);
  return;
}
//---------------------------------------------------------------------------
// Пауза del мс по PPauseTick мс для реакции на Terminated
//---------------------------------------------------------------------------
bool TTDThread::Pause(int del)
{
  int n=del/PPauseTick;
  for(int i=0;i<n;i++)
  {
    if(Terminated) return false;
    Sleep(PPauseTick);
  }
  return true;
}
//---------------------------------------------------------------------------
// Закрывает порт не раньше, чем через PClose мс после открытия
//---------------------------------------------------------------------------
bool TTDThread::PortClose(void)
{
  // PClose=5000; // Тест
  if(!CPrt->st.on) return true;
  double dt=((double)Now()-CPrt->TmOpen)*24.0*3600.0;
  if(dt<(PClose/1000.0)) Sleep(((PClose/1000.0)-dt)*1000);
  return CPrt->Close();
}
//---------------------------------------------------------------------------
// Общие команды с адресом 0
//---------------------------------------------------------------------------
int TTDThread::Reset(void)
{
  CPrt->BS4I1_Cmd(0,99,66,99,0,TOWCom,TORCom);
  return CPrt->st.res;
}
//-----------------------------------------------------------------------------
int TTDThread::StackOn(bool on,bool clr,WORD nGroup)
{
  byte b1=nGroup&0xFF,b2=on*128+clr*64+((nGroup/256)&0x3F);
  CPrt->BS4I1_Cmd(  0,205,b1,b2,0,TOWCom,TORCom);
  return CPrt->st.res;
}
//-----------------------------------------------------------------------------
int TTDThread::StackSOn(void)
{
  CPrt->BS4I1_Cmd(  0,207,0,0,0,TOWCom,TORCom);
  return CPrt->st.res;
}
//-----------------------------------------------------------------------------
int TTDThread::StackOff(void)
{
  CPrt->BS4I1_Cmd(  0,206,0,0,0,TOWCom,TORCom);
  return CPrt->st.res;
}
//-----------------------------------------------------------------------------

