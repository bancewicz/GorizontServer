// BPorts.cpp
//-----------------------------------------------------------------------------
#include <windows.h>
#include <stdio.h>
#include <sys\timeb.h>
#include <SyncObjs.hpp>
//-----------------------------------------------------------------------------
#include "BTPorts.h"
//-----------------------------------------------------------------------------
TBTPorts::TBTPorts(void) { wstate=oldwstate=0xFFFFFFFF;}
//-----------------------------------------------------------------------------
void TBTPorts::SetWState(int i,DWORD ws) { wstate=(wstate&(~(3<<(i*2))))+((ws&3)<<(i*2));}
DWORD TBTPorts::GetWState(int i) { return ((3<<(i*2))&wstate)>>((i*2));}
DWORD TBTPorts::GetOldWState(int i) { return ((3<<(i*2))&oldwstate)>>((i*2));}
//-----------------------------------------------------------------------------
int TBTPorts::NumSens(void)
{
  int n=0;
  
          for(int i=0;i<NumPrs;i++)
          {
                  n+=Ps[i].NumPSrs;
          }

  return n;
}
//-----------------------------------------------------------------------------
void TBTPorts::Add(int port,DWORD rate)
{
//���� ������ ���������� �������� ������
  if(NumPrs>=MaxNumPrs) return;

//���� ������ � ������� ������ ����������� ������ ����� �������� ������
  if(NumPrs>=MaxPrsSel) return;

//��������� ���� � ������
  Ps[NumPrs].p=port;Ps[NumPrs].on=false;Ps[NumPrs].NumPSrs=0;
//������� ��������� ��� �����, ������������� ��������
  Ps[NumPrs].CPrt=new TCOMPort;Ps[NumPrs].CPrt->dcb.BaudRate=rate;
//??? ����� �������� ����� ����� �������� �����
  Ps[NumPrs].TmOpen=Now();Ps[NumPrs].TmClose=Ps[NumPrs].TmOpen;


// ��-�3  
  Ps[NumPrs].CPrt->st.baud=rate;

  NumPrs++;
}
//-----------------------------------------------------------------------------
void TBTPorts::Delete(int ix)
{
//���� ���� ������� � ����� ������� ������
  if(Ps[ix].on) return;

//���� � ������� ��� ������ ������� ������
  if(NumPrs==0) return;

//������� ������ ����� �� ������ ix
  delete Ps[ix].CPrt;

//���������� ������ �� ���������� �����  �� ����� ������
  for(int i=ix;i<NumPrs-1;i++)
  {
    Ps[i]=Ps[i+1];

//���� ������� ������ ���� ������� ������� ��������� �� ������ ������������
    if(Ps[i].CThr!=NULL)
    {
      Ps[i].CThr->on=&(Ps[i].on);
      Ps[i].CThr->run=&(Ps[i].run);
      Ps[i].CThr->TmClose=&(Ps[i].TmClose);
      Ps[i].CThr->CPrt=Ps[i].CPrt;
      Ps[i].CThr->Srs=Ps[i].Srs;
    }
  }

  NumPrs--;
}
//-----------------------------------------------------------------------------
void TBTPorts::Run(int i)
{
//���� ��� ������������
  if(Ps[i].on) return;

//��������� ����� ��� ��������� �����
  Ps[i].CThr=new TTDThread(false,Ps[i].p,&(Ps[i].on),&(Ps[i].run),Ps[i].CPrt,&(Ps[i].TmClose),Ps[i].NumPSrs,Ps[i].Srs);

//��������� ������������� �����
  Ps[i].TmOpen=Now();Ps[i].TmClose=Ps[i].TmOpen-1.0/24.0/3600.0/1000.0;

//???
  Ps[i].CPrt->br=Ps[i].CPrt->bw=Ps[i].CPrt->er=Ps[i].CPrt->ew=Ps[i].CPrt->ec=Ps[i].CPrt->eo=Ps[i].CPrt->lerr=Ps[i].CPrt->lbr=Ps[i].CPrt->cmdnum=0;

//�������� ���� �������� � ������ ����� ��� ���� ������ � ���������� �������
  for(int j=0;j<Ps[i].NumPSrs;j++)
  {
        Ps[i].Srs[j]->porton=true;
        Ps[i].Srs[j]->dataon=false;
  }

}
//-----------------------------------------------------------------------------
void TBTPorts::Stop(int i)
{
  if(!Ps[i].on) return;
//������������� ����� ��� ��������� �����
  __try { Ps[i].CThr->Terminate();}
  catch(...) {};
  for(int j=0;j<Ps[i].NumPSrs;j++) Ps[i].Srs[j]->porton=false;
}
//-----------------------------------------------------------------------------

AnsiString TBTPorts::StrTm(int i)
{
  AnsiString s;
  if(i>=NumPrs) return "*";

  double dt,TmM=Now(),to=Ps[i].CPrt->TmOpen,tc=Ps[i].CPrt->TmClose;

  if(tc>=to) dt=tc-to;else dt=TmM-to;
  int hs=dt*24.0;s=hs;s+=FormatDateTime(":nn:ss",dt-hs/24.0);
  return s;
}
//-----------------------------------------------------------------------------
AnsiString TBTPorts::StrTmOn(int i)
{
  AnsiString s;
  if(i>=NumPrs) return "*";
  double dt,TmM=Now(),to=Ps[i].TmOpen,tc=Ps[i].TmClose;
  if(tc>=to) dt=tc-to;else dt=TmM-to;
  int hs=dt*24.0;s=hs;s+=FormatDateTime(":nn:ss",dt-hs/24.0);
  return s;
}
//-----------------------------------------------------------------------------

