/*
//---------------------------------------------------------------------------
//#define MVER  1                                                                                                
//#define SVER  1
//#define BUILD 120
*/

#define MVER  2
#define SVER  3
#define BUILD 7

//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include <Log.h>
#include "ConfigU.h";
#include "OPCU.h"

//---------------------------------------------------------------------------
#include <IniFiles.hpp>
#include <Registry.hpp>

//---------------------------------------------------------------------------
#include <stdio.h>
#include <math.h>
#include <math.hpp>
#include <DateUtils.hpp>
#include "Main.h"
#include "ChartDlg.h"
#include "Proc.h"

//#include "SysConfMaster.h"

#include "OPCMap.h"
#include "TuneSystem.h"
#include "TuneDataProc.h"
#include "TuneInterfaces.h"
#include "TunePort.h"
#include "TuneSensor.h"
#include "About.h"

#include "Unit_enter_password.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "trayicon"
#pragma link "trayicon"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
// Поиск !!! ??? 1.0.2 1.0.1 gluk >>>  WTest
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------

//TSensOPCMap gSensOPCMap;

//--------------------------------------------------------------------------

char MainCurrentDirectory[1024];

bool GRestartFlag=false;

bool CanInfo=false;

bool FORCETREEREDRAW=false;

//TSysConfMaster SysConfMaster;

TFMain *FMain; // 936x752
bool SERVER_SECURITY=false; // ??? SERVER_SECURITY
//bool SERVER_SECURITY=true;
//bool TRIAL=true; // !!! 1.120
bool TRIAL=false;   // !!! 1.120
int TrialSrs=2;
//---------------------------------------------------------------------------
int MEMO_COUNT=60,MEMO_DEL=1;
//---------------------------------------------------------------------------
bool fCanclose=true,fClose=false,fStop=false,fOpenHid=false;

bool CanSave=true;

/////////////////
bool SaveAccTxt=false;
/////////////////

int SAdrChange=16,SRError=0,SCRCError=500,SIdle=1,
    PExit=5000,PPauseTick=100,PReOpen=2000,PClose=1000,
    TORCom=100,TOWCom=100,TORDat=4000,TOWDat=4000;
    DWORD NumRErrSrs=10,NumCErrSrs=10;
int SrsBufPSize=4096,SrsBufToSave=1; // пакетов
TBSData BSD; // !!! FFT+

bool CanOPCDA=false;
bool CanModbus=false;
bool ConfSave=false;

//Компоненты навигации по дереву системы
typedef enum {

        MENU_NONSELECTED,
        MENU_SYSTEM,
        MENU_PORT,
        MENU_SENSOR
}       MainMenuSelectPoint;


AnsiString sPortSelected("");
int iPortSelected=0;
int nPortSelected=0;

int nSensSelected=0;
TBTSensor* sSensSelected=NULL;
int nSensorOnPort=0;

TCOMPort* cPortSelected=NULL;
MainMenuSelectPoint mmselect=MENU_NONSELECTED;


//---------------------------------------------------------------------------
TCOMPort COMPortTest;
//---------------------------------------------------------------------------

AnsiString CCaption("");

//Глобальный список портов системы
TBTPorts BTPrs;

//Глобальный список всех датчиковсистемы
//По сути  BTSrs указатель на начало глобального списка датчиков
TBTSensor BTSrs[MaxNumSrs];
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include "INI.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
UINT WM_EXIT;
//---------------------------------------------------------------------------
TServerSocket *PGPRSServer; // !!! GPRS
//---------------------------------------------------------------------------


void f1 (void)
{
  FMain->HotRestart();
}


__fastcall TFMain::TFMain(TComponent* Owner):TForm(Owner)
{

  GetCurrentDirectory(1024,MainCurrentDirectory);

  AnsiString s;
  AnsiString ss;

  // !!! Gorizont
  //Application->Title="BS4I1 Сервер";
  //Tray->Hint="BS4I1 Сервер";
  PGPRSServer=GPRSServer;//PGPRSServer->Active=false;

  INI(true);

  this->SysConfMaster.HotRestart=f1;


  //void (*fun)();

  //fun=f1;

//---------------------------------------------------------------------------
OPCTagsCreate();
//---------------------------------------------------------------------------

  BSD.Init(SrsBufPSize*PACK_SIZE);
  Application->Title=Caption;
  Tray->Hint=Caption;
  // Меню
  for(int i=0;i<MaxPrsSel;i++)
  {
    if(i==16) break;
    TMenuItem* MCOMS=new TMenuItem(this);
    MCOMS->OnClick=MCOMClick;
    MCOMS->Caption=(s="COM")+(i+1);

    //!!!MPortAdd->Add(MCOMS);
  }

  if(MaxPrsSel>16)
  {
    TMenuItem* More=new TMenuItem(this);
    More->Caption="More...";
    //!!!MPortAdd->Add(More);
    for(int i=16;i<MaxPrsSel;i++)
    {
      TMenuItem* MCOMS=new TMenuItem(this);
      MCOMS->OnClick=MCOMClick;
      MCOMS->Caption=(s="COM")+(i+1);
      More->Add(MCOMS);
    }
  }

  for(int i=0;i<MaxNumSrs;i++)
  {
    TMenuItem* MCOMS=new TMenuItem(this);
    MCOMS->OnClick=MSrsClick;
    MCOMS->Caption=(s="Датчик")+(i+1);
    //!!!MSensAdd->Add(MCOMS);
  }
  WM_EXIT=RegisterWindowMessage("TD232SrvExit");

  s=MVER;s+=".";s+=SVER;s+=".";s+=BUILD;
  StatusBar->Panels->Items[2]->Text=s;

//???
  TSTest->TabVisible=false;

}

//---------------------------------------------------------------------------
void __fastcall TFMain::AppEventsMessage(tagMSG &Msg,
      bool &Handled)
{
  if(Msg.message==WM_EXIT)
  {
    Handled=true;
    fCanclose=true;
    bool c;
    FormCloseQuery(NULL,c);
  }
}
//---------------------------------------------------------------------------
void __fastcall TFMain::TmHideExitTimer(TObject *Sender)
{
  static int i=1;
  if(fStop)
  {
    int nt=0;
    for(int i=0;i<BTPrs.NumPrs;i++) if(BTPrs.Ps[i].on) nt++;
    if(nt==0) { fClose=true;Close();}
    PExit-=TmHideExit->Interval;
    if(PExit<0) { fClose=true;Close();}
    return;
  }
  i--;if(i==0) {TmHideExit->Enabled=false;Hide();}
}
//---------------------------------------------------------------------------
void __fastcall TFMain::FormCloseQuery(TObject *Sender, bool &CanClose)
{

  //if(!fCanclose) { Hide();CanClose=false;return;}

  //if (ConfSave==true)

  if (SysConfMaster.SaveFlag==true)
  {
        if (MessageBox(NULL,"Конфигурация системы мониторинга изменена! Сохранить новую конфигурацию?","ВНИМАНИЕ!",1)==IDOK)
         SysConfMaster.SaveIniPar();
         ::Sleep(1);
  }


  int res=mrYes;

  if(!fCanclose)
  {
          if(!TmHideExit->Enabled)
          {
            MTExit->Enabled=false;
            MTState->Enabled=false;
//    res=MessageDlg("Завершить работу сервера канала инклинометров?",mtCustom,TMsgDlgButtons()<<mbYes<<mbNo,0);

            res=MessageDlg("Завершить работу программы?",mtCustom,TMsgDlgButtons()<<mbYes<<mbNo,0);

            MTExit->Enabled=true;
            MTState->Enabled=true;
          }

  }

  if(res!=mrYes) {CanClose=false;return;}

  if(!fStop)
  {
    for(int i=0;i<BTPrs.NumPrs;i++) if(BTPrs.Ps[i].on) BTPrs.Stop(i);
    fStop=true;
    if(PExit==0) { CanClose=true;return;}
    CanClose=false;
    TmHideExit->Enabled=true;
    return;
  }

  if(fStop)
  {
        CanClose=true;
        return;
  }
  if(!fClose)
 {
   CanClose=false;
   return;
 }

 CanClose=true;


}
//---------------------------------------------------------------------------
void __fastcall TFMain::MTExitClick(TObject *Sender) { fCanclose=true;Close();}
//---------------------------------------------------------------------------
void __fastcall TFMain::MTStateClick(TObject *Sender)
{
  Application->Restore();
  Show();
}
//---------------------------------------------------------------------------
void __fastcall TFMain::TrayClick(TObject *Sender)
{
  Application->Restore();
  Show();
}
//---------------------------------------------------------------------------
#include "Update.h"
#include "Menu.h"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void __fastcall TFMain::TreeViewDblClick(TObject *Sender)
{

  TreeView->Selected->Expanded=!TreeView->Selected->Expanded;
  MSetupClick(NULL);
  return;//!!!

  AnsiString s;

  if(!TSTest->TabVisible) return;

  int ix=TreeView->Selected->StateIndex;
  if(ix==0)
  {
    BTPrs.on=!BTPrs.on;
    for(int i=0;i<BTPrs.NumSens();i++) if(BTPrs.on) BTSrs[i].dataon=false;else *(WORD*)&BTSrs[i].UCmd.cs=0;
    TmRun->Enabled=BTPrs.on;
    if(!BTPrs.on)
    {
      AddMessage(0,"Сервер: Опрос датчиков отключен");
      if(Server1->Active)
      {
        Server1->Active=false;
        Server2->Active=false;
        AddMessage(0,"Сервер: IP порт "+(s=Server1->Port)+" отключен");
        //!!!AddMessage(0,"Сервер: IP порт "+(s=Server2->Port)+" отключен");
      }
    }
    else
    {
      if((!SERVER_SECURITY)||TRIAL)
      {
        try {if(!Server1->Active) Server1->Active=true;}catch (...) {}
        try {if(!Server2->Active) Server2->Active=true;}catch (...) {}
      }

      if (CanModbus)
      {
              if(Server1->Active) AddMessage(1,"Сервер: IP порт "+(s=Server1->Port)+" включен");
              else                AddMessage(3,"Сервер: IP порт "+(s=Server1->Port)+" занят");
      }

      //!!!if(Server2->Active) AddMessage(1,"Сервер: IP порт "+(s=Server2->Port)+" включен");
      //!!!else                AddMessage(3,"Сервер: IP порт "+(s=Server2->Port)+" занят");

      AddMessage(1,"Сервер: Опрос датчиков включен");
    }
  }
  else
  {
    if(ix<=255) MPortOnClick(NULL);
    else        MSensOnClick(NULL);
  }
  TreeView->Selected->Expanded=!TreeView->Selected->Expanded;
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
// Тест одного порта
//---------------------------------------------------------------------------
void __fastcall TFMain::BOpenClick(TObject *Sender)
{
   AnsiString s;
   //if(PortsList->Selected==NULL) return;
   //int ix=PortsList->Selected->Index;
   int ix=TreeView->Selected->StateIndex;
   if(ix==0) return;if(ix>255) return;
   ix=(ix-1)&0xFF;
   Screen->Cursor=crHourGlass;
   CBRes->Checked=false;ETime->Text="";
   ECOM->Text="";
   DTime(true);
   if(BTPrs.Ps[ix].p==499) CBRes->Checked=COMPortTest.Open(true,500,PGPRSServer);
   else                    CBRes->Checked=COMPortTest.Open(true,BTPrs.Ps[ix].p);
   s.printf("%.4f",DTime(false));ETime->Text=s;
   if(CBRes->Checked)
   {
     s=(s="COM")+(BTPrs.Ps[ix].p+1);
     ECOM->Text=s;
   }
   Screen->Cursor=crDefault;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::BCloseClick(TObject *Sender)
{
   AnsiString s;
   Screen->Cursor=crHourGlass;
   CBRes->Checked=false;ETime->Text="";
   DTime(true);
   CBRes->Checked=COMPortTest.Close();
   s.printf("%.4f",DTime(false));ETime->Text=s;
   if(CBRes->Checked) ECOM->Text="";
   Screen->Cursor=crDefault;
}
//---------------------------------------------------------------------------
unsigned char buf1MB[1024*1024];
void __fastcall TFMain::BWriteClick(TObject *Sender)
{
   AnsiString s;
   COMPortTest.SetTimeouts(EWTOut->Text.ToInt(),EWTOut->Text.ToInt());
   int n=EWBytes->Text.ToInt();
   if(n==8) for(int i=0;i<n;i++) buf1MB[i]=i;
   if(n==6) {buf1MB[0]=0x01;buf1MB[1]=0xC9;buf1MB[2]=0x00;buf1MB[3]=0x00;buf1MB[4]=0x12;buf1MB[5]=0x4A;}
   Screen->Cursor=crHourGlass;
   CBRes->Checked=false;ETime->Text="";
   DTime(true);
   CBRes->Checked=COMPortTest.PortNWrite(n,buf1MB);
   s.printf("%.4f",DTime(false));ETime->Text=s;
   Screen->Cursor=crDefault;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::BReadClick(TObject *Sender)
{
   AnsiString s;
   COMPortTest.SetTimeouts(ERTOut->Text.ToInt(),ERTOut->Text.ToInt());
   int n=ERBytes->Text.ToInt();
   Screen->Cursor=crHourGlass;
   CBRes->Checked=false;ETime->Text="";
   DTime(true);
   CBRes->Checked=COMPortTest.PortNRead(n,buf1MB);
   s.printf("%.4f",DTime(false));ETime->Text=s;
   Screen->Cursor=crDefault;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::BPurgeClick(TObject *Sender)
{
   AnsiString s;
   Screen->Cursor=crHourGlass;
   CBRes->Checked=false;ETime->Text="";

   DTime(true);
   CBRes->Checked=COMPortTest.Purge();
   s.printf("%.4f",DTime(false));ETime->Text=s;
   Screen->Cursor=crDefault;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::BCheckClick(TObject *Sender)
{
   AnsiString s;
   Screen->Cursor=crHourGlass;
   CBRes->Checked=false;ETime->Text="";
   DTime(true);
   CBRes->Checked=COMPortTest.SetTimeouts(ERTOut->Text.ToInt(),ERTOut->Text.ToInt());
   s.printf("%.4f",DTime(false));ETime->Text=s;
   Screen->Cursor=crDefault;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::PortsListSelectItem(TObject *Sender,
      TListItem *Item, bool Selected)
{
  PortsList->Selected=NULL;PortsList->ItemFocused=NULL;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::COMListSelectItem(TObject *Sender, TListItem *Item,
      bool Selected)
{
  COMList->Selected=NULL;COMList->ItemFocused=NULL;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::SensListSelectItem(TObject *Sender,
      TListItem *Item, bool Selected)
{
  SensList->Selected=NULL;SensList->ItemFocused=NULL;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::SrsListSelectItem(TObject *Sender, TListItem *Item,
      bool Selected)
{
  SrsList->Selected=NULL;SrsList->ItemFocused=NULL;
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
// Сервер
//---------------------------------------------------------------------------
bool TFMain::AddMessage(int type,AnsiString s)
{
  TColor c;double time=Now();
  switch(type)
  {
    case 0:c=clBlue;break;    // Отключение
    case 1:c=clGreen;break;   // Включение
    case 2:c=clBlack;break;   // Информация
    case 3:c=clRed;break;     // Ошибка
    case 4:c=clBlack;break;   // Разделитель
    default: c=clYellow;break;
  }
  RichEdit->SelStart=RichEdit->Text.Length();
  RichEdit->SelAttributes->Color=c;
  if(type==4) RichEdit->Lines->Add(s);
  else        RichEdit->Lines->Add(s=FormatDateTime("hh:nn:ss dd.mm.yy",time)+"   "+s);
  if(RichEdit->Lines->Count>MEMO_COUNT)
  {
    RichEdit->Lines->BeginUpdate();
    for(int i=0;i<MEMO_DEL;i++) RichEdit->Lines->Delete(0);
    RichEdit->Lines->EndUpdate();
  }
  if(!CanSave) return true;
  AnsiString name=ExtractFileDir(Application->ExeName);
  name+="\\History";
  bool res=true;
  if(!DirectoryExists(name)) res=CreateDir(name);
  if(res)
  {
    name+="\\";name+=FormatDateTime("yyyy_mm",time);name+="_log.txt";
    s+="\n";
    AnsiString s1=type;if(type!=4) s=s1+" "+s;
    FILE* f;
    f=fopen(name.c_str(),"at");
    if(f!=NULL) { if(fputs(s.c_str(),f)>0) { fclose(f);return true;};fclose(f);}
  }
  RichEdit->SelStart=RichEdit->Text.Length();
  RichEdit->SelAttributes->Color=clRed;
  RichEdit->Lines->Add(FormatDateTime("hh:nn:ss dd.mm.yy",time)+"   "+"Сервер: Ошибка записи журнала событий в файл");
  return false;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::Server1Accept(TObject *Sender,
      TCustomWinSocket *Socket)
{
  AddMessage(1,"Сервер: "+Socket->RemoteAddress+" подключился");
}
//---------------------------------------------------------------------------
void __fastcall TFMain::Server1ClientDisconnect(TObject *Sender,
      TCustomWinSocket *Socket)
{
  AddMessage(0,"Сервер: "+Socket->RemoteAddress+" отключился");
}
//---------------------------------------------------------------------------
void __fastcall TFMain::Server1ClientError(TObject *Sender,
      TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
  AddMessage(3,"Сервер: Ошибка соединения с "+Socket->RemoteAddress);
  ErrorCode=0;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::Server2Accept(TObject *Sender,
      TCustomWinSocket *Socket)
{
  AddMessage(1,"Сервер: "+Socket->RemoteAddress+" подключился");
}
//---------------------------------------------------------------------------
void __fastcall TFMain::Server2ClientDisconnect(TObject *Sender,
      TCustomWinSocket *Socket)
{
  AddMessage(0,"Сервер: "+Socket->RemoteAddress+" отключился");
}
//---------------------------------------------------------------------------
void __fastcall TFMain::Server2ClientError(TObject *Sender,
      TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
  AddMessage(3,"Сервер: Ошибка соединения с "+Socket->RemoteAddress);
  ErrorCode=0;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::GPRSServerAccept(TObject *Sender,
      TCustomWinSocket *Socket)
{
  AddMessage(1,"Сервер: "+Socket->RemoteAddress+" подключился");
  if(Socket!=this->GPRSServer->Socket->Connections[0])
     this->GPRSServer->Socket->Connections[0]->Close();
  //int n=PServerSocket->Socket->ActiveConnections;
  //for(int i=n-1;i>=1;i--) PServerSocket->Socket->Connections[0]->Close();
}
//---------------------------------------------------------------------------
void __fastcall TFMain::GPRSServerClientError(TObject *Sender,
      TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
  AddMessage(3,"Сервер: Ошибка соединения с "+Socket->RemoteAddress);
  ErrorCode=0;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::GPRSServerClientDisconnect(TObject *Sender,
      TCustomWinSocket *Socket)
{
  AddMessage(0,"Сервер: "+Socket->RemoteAddress+" отключился");
}
//---------------------------------------------------------------------------
int rint(double d)
{
  int n;n=(int)d;
  if((d-n)>=0.5) { n++;return n;}
  if((n-d)> 0.5) { n--;return n;}
  return n;
}
//---------------------------------------------------------------------------
int Calc_FH(double *HX,double *HY,double *HXMax,double *HYMax,WORD *s) /// >>>
{
  int n;static double X[MaxNumSrs],Y[MaxNumSrs],XAv,YAv,XMax,YMax;TBTSensor *S=BTSrs;
  //----------------------------------------------------------------------------
  n=0;*HX=0.0;*HY=0.0;*HXMax=0.0;*HYMax=0.0;*s=0;XMax=0.0;YMax=0.0;
  //----------------------------------------------------------------------------
  for(int i=0;i<MaxNumSrs;i++)
  {
    if(S[i].porton&&S[i].on&&S[i].isHoriz&&S[i].dataon&&S[i].sw.fdr)
    {
      X[n]=S[i].XCur;Y[n]=S[i].YCur;n++;
    }
  }
  //----------------------------------------------------------------------------
  if(n<3) {*s=1;return n;} // Мало подключенных датчиков, данные не готовы // ???
  //----------------------------------------------------------------------------
  // Расчет
  //----------------------------------------------------------------------------
  double H=79.900,k=H*1000.0/3600.0/180.0*M_PI; // Уровень кровли
  //----------------------------------------------------------------------------
  XAv=0.0;YAv=0.0;
  for(int i=0;i<n;i++)
  {
    XAv+=X[i]/n;YAv+=Y[i]/n;
    if(fabs(X[i])>XMax) {XMax=fabs(X[i]);*HXMax=X[i]*k;}
    if(fabs(Y[i])>YMax) {YMax=fabs(Y[i]);*HYMax=Y[i]*k;}
  }
  //----------------------------------------------------------------------------
  *HX=XAv*k;*HY=YAv*k;
  //----------------------------------------------------------------------------
  return n;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::Server1ClientRead(TObject *Sender,TCustomWinSocket *Socket)
{
  AnsiString s;static byte buf2048[2048];
  int n=Socket->ReceiveLength();int adr;
  // Размер запроса
  if((n<12)||(n>2048))
  {
    AddMessage(3,"Сервер: 1 Неизвестный размер ("+(s=n)+" байт) запроса "+Socket->RemoteAddress);
    Socket->ReceiveBuf(buf2048,256);
    return;
  }
  Socket->ReceiveBuf(buf2048,n);
  byte *b=buf2048;
  // Поле длины запроса
  WORD wtmp=b[4]*256+b[5];
  if(wtmp!=6)   { AddMessage(3,"Сервер: Неизвестное поле ("+(s=wtmp)+" байт) длины запроса "+Socket->RemoteAddress);return;}
  adr=b[6];
  if(!((adr==3)||(adr==4)||(adr==5)||(adr==6)))
  {
    AddMessage(3,"Сервер: Неизвестный идентификатор ("+(s=b[6])+") устройства запроса "+Socket->RemoteAddress);return;
  }
  if(b[7]!=4) { AddMessage(3,"Сервер: Неизвестный код ("+(s=b[7])+") функции запроса "+Socket->RemoteAddress);return;}
  wtmp=b[8]*256+b[9];
  if(wtmp!=1) { AddMessage(3,"Сервер: Неизвестный адрес ("+(s=wtmp)+") начального регистра запроса "+Socket->RemoteAddress);return;}
  // Количество датчиков
  int nsrs,nbuf,nbytes=(b[10]*256+b[11])*2; // количество байт запроса
  switch(adr)
  {
    case 3: nsrs=(nbytes-4)/8 ;nbuf=9+4+nsrs* 8;break; // инклинометры
    //case 4: nsrs=(nbytes-4)/10;nbuf=9+4+nsrs*10;break; // ветер
    case 4: nsrs=(nbytes-4)/14;nbuf=9+4+nsrs*14;break; // ветер  1.0.116
    case 5: nsrs=(nbytes-0)/6; nbuf=9+0+nsrs*6;break;  // смещения
    //case 6: nsrs=(nbytes-4)/6 ;nbuf=9+4+nsrs* 6;break; // ускорения
    case 6: nsrs=(nbytes-4)/10 ;nbuf=9+4+nsrs* 10;break; // ускорения 1.0.116
  }
  if(nsrs>MaxNumSrs) { AddMessage(3,"Сервер: Неизвестное количество ("+(s=nsrs)+") датчиков запроса "+Socket->RemoteAddress);return;}
  // Идентификатор - 4 байта возвращается
  b[4]=  nbuf-9+3;b[5]=0;  // Количество следующих байтов // Tsuk !!!
  //b[4]=0;b[5]=  nbuf-9+3;    // Количество следующих байтов // Stas
  b[8]=  nbuf-9;             // Количество байт данных
  b=buf2048+9;
  *(DWORD*)b=BTPrs.wstate;b+=sizeof(DWORD); // состояние портов
  //----------------------------------------------------------------------------
  int nh;double HX,HY,HXMax,HYMax;WORD sh;
  if(adr==5) nh=Calc_FH(&HX,&HY,&HXMax,&HYMax,&sh);
  if(adr==4) nsrs=MaxNumSrs; // ветер // 1.0.114
  //----------------------------------------------------------------------------
  for(int i=0;i<nsrs;i++) /// >>> Server 1
  {
    WORD w=GetSensWState(BTSrs+i);
    double xa,ya,xm,ym,absa,anga,absm,angm,xrms,yrms;
    switch(adr) // Tsuk
    {
      // инклинометры
      case 3: *(short*)b=(short)rint(BTSrs[i].XCur/3600.0*1000.0);b+=sizeof(short); // X 1000
              *(short*)b=(short)rint(BTSrs[i].YCur/3600.0*1000.0);b+=sizeof(short); // Y 1000
              *(short*)b=(short)rint(BTSrs[i].TCur*100.0);b+=sizeof(short);         // T 100
              *(WORD*)b=w;b+=sizeof(WORD);
              break;
      // ветер
      case 4: if(!BTSrs[i].isMeteo) break;
              //-----------------------------------------------------------------------------
              w=GetWWState(BTSrs+i);
              //-----------------------------------------------------------------------------
              xa=BTSrs[i].WVAver /100.0;ya=-BTSrs[i].WUAver /100.0;
              xm=BTSrs[i].WVMax  /100.0; ym=-BTSrs[i].WUMax /100.0;
              xrms=BTSrs[i].WVRms/100.0; yrms=BTSrs[i].WURms/100.0;
              //-----------------------------------------------------------------------------
              extern double GetAngle(double x,double y,bool is360);
              absa=sqrt(xa*xa+ya*ya);anga=GetAngle(xa,ya,true);
              absm=sqrt(xm*xm+ym*ym);angm=GetAngle(xm,ym,true);
              //-----------------------------------------------------------------------------
              *(short*)b=(short)rint(absa*100.0);b+=sizeof(short);
              *(short*)b=(short)rint(anga*10.0);b+=sizeof(short);
              *(short*)b=(short)rint(absm*100.0);b+=sizeof(short);
              *(short*)b=(short)rint(angm*10.0);b+=sizeof(short);
              *(short*)b=(short)rint(xrms*100.0);b+=sizeof(short);
              *(short*)b=(short)rint(yrms*100.0);b+=sizeof(short);
              *(WORD*) b=w;b+=sizeof(WORD);
              break;
      // отклонения
      case 5: b=buf2048+9;
              *(WORD*)b=sh;b+=sizeof(WORD); // state
              *(short*)b=(short)rint(HX*100.0);b+=sizeof(short); // HX 100
              *(short*)b=(short)rint(HY*100.0);b+=sizeof(short); // HY 100
              break;
      // ускорения
      case 6: *(short*)b=(short)rint(BTSrs[i].AMaxAbs*100.0);b+=sizeof(short); //
              *(short*)b=(short)rint(BTSrs[i].AMaxAng*10.0 );b+=sizeof(short); //
              *(short*)b=(short)rint(BTSrs[i].AXRms*100.0);b+=sizeof(short);   //
              *(short*)b=(short)rint(BTSrs[i].AYRms*100.0 );b+=sizeof(short);  //
              *(WORD*)b=w;b+=sizeof(WORD);
              break;
    }
  }
  Socket->SendBuf(buf2048,nbuf);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::Server2ClientRead(TObject *Sender,TCustomWinSocket *Socket)
{
  AnsiString s;static byte tcp_buf[TCP_MAX_SIZE*8+32];
  int l=Socket->ReceiveLength();
  // Размер запроса
  if(l!=13)
  {
    AddMessage(3,"Сервер: 2 Неизвестный размер ("+(s=l)+" байт) запроса "+Socket->RemoteAddress);
    Socket->ReceiveBuf(tcp_buf,256);
    return;
  }
  Socket->ReceiveBuf(tcp_buf,l);
  byte *bf=tcp_buf;
  byte adr=*bf,com=*(bf+1),sm=*(bf+2),type=*(bf+3);DWORD pnum=*(DWORD*)(bf+5),psize=*(DWORD*)(bf+9);
  if(psize>TCP_MAX_SIZE) psize=TCP_MAX_SIZE;if(psize==0) psize=1;
  if(adr!=1) { AddMessage(3,"Сервер: Неизвестный адрес ("+(s=adr)+") устройства запроса "+Socket->RemoteAddress);return;}

  int ix=TreeView->Selected->StateIndex;
  TBTSensor* S;
  if(ix<=255) S=BTPrs.Ps[0].Srs[0];else S=BTPrs.Ps[(ix-1)&0xFF].Srs[(ix-1)/256-1];

  WORD sw=S->SBuf.sw;
  DWORD count;
  type=CBServer2->ItemIndex;bool isX=CBisX->Checked;
  // 0 X, Y
  // 1 XAver, YAver
  // 2 XMax, YMax
  // 3 XRms, YRms
  // 4 XYRms
  // 5 Time
  // 6 U, V
  // 7 UAver, VAver
  // 8 UMax, VMax
  // 9  WS
  // 10 WTime
  switch(type)
  {
    //--------------------------------------------
    case 0: count=S->SBuf.ncalc*PACK_SIZE;break;
    case 1: count=S->SBuf.ncalc;break;
    case 2: count=S->SBuf.ncalc;break;
    case 3: count=S->SBuf.ncalc;break;
    case 4: count=S->SBuf.ncalc;break;
    case 5: count=S->SBuf.ncalc;break;
    //--------------------------------------------
    case 6: count=S->SWBuf.ncalc*PACK_SIZE;break;
    case 7: count=S->SWBuf.ncalc;break;
    case 8: count=S->SWBuf.ncalc;break;
    case 9: count=S->SWBuf.ncalc;break;
    case 10: count=S->SWBuf.ncalc;break;
    //--------------------------------------------
  }
  double *k=(double*)(bf+8);*k=1.0;
  double *f=(double*)(bf+8+8);*f=50.0/En50->Text.ToIntDef(50); // !!! En50
  //double *f=(double*)(bf+8+8);*f=1.0;
  switch(com) /// >>> Server 2
  {
    case 1: *(DWORD*)(bf+2)=count;
            Socket->SendBuf(bf,2+sizeof(DWORD));
            break;
    case 3: *(WORD*) (bf+2)=sw;
            *(DWORD*)(bf+4)=count;
            if((count/psize)<=pnum) {Socket->SendBuf(bf,8);break;}
            switch(type)
            {
              case 0: *(BYTE*)(bf+2)=2;*k/=8.0;*f*=10.0;
                      if(isX) memcpy(bf+8+8+8,S->SBuf.X+pnum*psize,psize*sizeof(short));
                      else    memcpy(bf+8+8+8,S->SBuf.Y+pnum*psize,psize*sizeof(short));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(short));
                      break;
              case 1: *(BYTE*)(bf+2)=6;*k/=1.0;*f*=10.0/32.0;
                      if(isX) memcpy(bf+8+8+8,S->SBuf.XAver+pnum*psize,psize*sizeof(float));
                      else    memcpy(bf+8+8+8,S->SBuf.YAver+pnum*psize,psize*sizeof(float));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(float));
                      break;
              case 2: *(BYTE*)(bf+2)=6;*k/=1.0;*f*=10.0/32.0;
                      if(isX) memcpy(bf+8+8+8,S->SBuf.XMax+pnum*psize,psize*sizeof(float));
                      else    memcpy(bf+8+8+8,S->SBuf.YMax+pnum*psize,psize*sizeof(float));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(float));
                      break;
              case 3: *(BYTE*)(bf+2)=6;*k/=1.0;*f*=10.0/32.0;
                      if(isX) memcpy(bf+8+8+8,S->SBuf.XRms+pnum*psize,psize*sizeof(float));
                      else    memcpy(bf+8+8+8,S->SBuf.YRms+pnum*psize,psize*sizeof(float));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(float));
                      break;
              case 4: *(BYTE*)(bf+2)=6;*k/=1.0;*f*=10.0/32.0;
                      memcpy(bf+8+8+8,S->SBuf.XYRms+pnum*psize,psize*sizeof(float));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(float));
                      break;
              case 5: *(BYTE*)(bf+2)=8;*k=1.0;*f*=10.0/32.0;
                      memcpy(bf+8+8+8,S->SBuf.Time_buf+pnum*psize,psize*sizeof(double));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(double));
                      break;
              //---------------------------------------------------------------------------
              case 6: *(BYTE*)(bf+2)=2;*k/=100.0;*f*=10.0;
                      if(isX) memcpy(bf+8+8+8,S->SWBuf.U+pnum*psize,psize*sizeof(short));
                      else    memcpy(bf+8+8+8,S->SWBuf.V+pnum*psize,psize*sizeof(short));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(short));
                      break;
              case 7: *(BYTE*)(bf+2)=6;*k/=100.0;*f*=10.0/32.0;
                      if(isX) memcpy(bf+8+8+8,S->SWBuf.UAver+pnum*psize,psize*sizeof(float));
                      else    memcpy(bf+8+8+8,S->SWBuf.VAver+pnum*psize,psize*sizeof(float));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(float));
                      break;
              case 8: *(BYTE*)(bf+2)=6;*k/=100.0;*f*=10.0/32.0;
                      //if(isX) memcpy(bf+8+8+8,S->SWBuf.UMax+pnum*psize,psize*sizeof(float));
                      //else    memcpy(bf+8+8+8,S->SWBuf.VMax+pnum*psize,psize*sizeof(float));
                      if(isX) memcpy(bf+8+8+8,S->SWBuf.UMax+pnum*psize,psize*sizeof(float));
                      else    memcpy(bf+8+8+8,S->SWBuf.VMax+pnum*psize,psize*sizeof(float));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(float));
                      break;
              case 9: *(BYTE*)(bf+2)=1;*k/=1.0;*f*=10.0/32.0;
                      memcpy(bf+8+8+8,S->SWBuf.s+pnum*psize,psize*sizeof(BYTE));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(BYTE));
                      break;
              case 10:*(BYTE*)(bf+2)=8;*k=1.0;*f*=10.0/32.0;
                      memcpy(bf+8+8+8,S->SWBuf.Time_buf+pnum*psize,psize*sizeof(double));
                      Socket->SendBuf(bf,8+8+8+psize*sizeof(double));
                      break;
            }
            break;
    default: AddMessage(3,"Сервер: Неизвестный код ("+(s=com)+") функции запроса "+Socket->RemoteAddress);break;
  }
}
//---------------------------------------------------------------------------
bool TFMain::WriteRes(double time,AnsiString s,AnsiString t)
{
  AnsiString name=ExtractFileDir(Application->ExeName);
  name+="\\History";
  if(!DirectoryExists(name)) if(!CreateDir(name)) return false;
  name+="\\";name+=FormatDateTime("yyyy_mm",time);name+=t;
  s=s+"\n";
  FILE* f;
  f=fopen(name.c_str(),"at");
  if(f==NULL) return false;
  if(fputs(s.c_str(),f)>0) { fclose(f);return true;}
  fclose(f);return false;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::TmSaveTimer(TObject *Sender)
{

  AnsiString s,ds,ws,as,hs,is;TDateTime time=Now();int NS=BTPrs.NumSens();static int n;
  bool isMet=false;bool isAcc=false;bool isHor=false;

  if(BTPrs.on)
  {

//Тут идет отображение данных

    s.printf("%s\t%1d%1d%1d%1d",FormatDateTime("hh:nn:ss dd.mm.yy",time),
              BTPrs.GetWState(3),BTPrs.GetWState(2),BTPrs.GetWState(1),BTPrs.GetWState(0));
    ds=s;ws=s;as=s;hs=s;is=s;
    //for(int i=0;i<NS;i++)

//?? Она идет по общему списку датчиков в системе для отображения данных

    for(int i=0;i<MaxNumSrs;i++)  // !!! MaxNumSrs
    {
      WORD w;
      // 1.0.2 Для записи неготовых результатов (флаг sw.fdr)
      if(BTSrs[i].Name!="") // !!! MaxNumSrs
      {
        BTSrs[i].dataon?s.printf("\t%8.1f",BTSrs[i].XCur):s.printf("\t");ds=ds+s;
        BTSrs[i].dataon?s.printf("\t%8.1f",BTSrs[i].YCur):s.printf("\t");ds=ds+s;

        if((!BTSrs[i].dataon)||(!BTSrs[i].sw.ft5dr)) s.printf("\t");else s.printf("\t%8.2f",BTSrs[i].TCur);ds=ds+s;
        if(!BTSrs[i].dataon) s.printf("\t");else s.printf("\t%8.1f",BTSrs[i].PwCur);ds=ds+s;
        w=GetSensWState(BTSrs+i);
        s.printf("\t%2d ",w>>12);for(int i=4;i<16;i++) {if(w&(32768>>i)) s+="1";else s+="0";if((i==3)||(i==7)||(i==11)) s+=" ";}ds=ds+s;
      }
      if(BTSrs[i].isMeteo)
      {
        isMet=true;
        BTSrs[i].Wdataon?s.printf("\t%8.3f",BTSrs[i].WUAver/100.0):s.printf("\t");ws=ws+s;
        BTSrs[i].Wdataon?s.printf("\t%8.3f",BTSrs[i].WVAver/100.0):s.printf("\t");ws=ws+s;
        BTSrs[i].Wdataon?s.printf("\t%8.2f", BTSrs[i].WUMax/100.0):s.printf("\t");ws=ws+s;
        BTSrs[i].Wdataon?s.printf("\t%8.2f", BTSrs[i].WVMax/100.0):s.printf("\t");ws=ws+s;
        BTSrs[i].Wdataon?s.printf("\t%8.3f", BTSrs[i].WURms/100.0):s.printf("\t");ws=ws+s;
        BTSrs[i].Wdataon?s.printf("\t%8.3f", BTSrs[i].WVRms/100.0):s.printf("\t");ws=ws+s;
        w=GetWWState(BTSrs+i);
        s.printf("\t%2d ",w>>12);for(int i=4;i<16;i++) {if(w&(32768>>i)) s+="1";else s+="0";if((i==3)||(i==7)||(i==11)) s+=" ";}ws=ws+s;
      }
      if(BTSrs[i].isAccel)
      {
        isAcc=true;
        BTSrs[i].Adataon?s.printf("\t%8.2f", BTSrs[i].AXMax):s.printf("\t");as=as+s;
        BTSrs[i].Adataon?s.printf("\t%8.2f", BTSrs[i].AYMax):s.printf("\t");as=as+s;
        BTSrs[i].Adataon?s.printf("\t%8.2f", BTSrs[i].AXRms):s.printf("\t");as=as+s;
        BTSrs[i].Adataon?s.printf("\t%8.2f", BTSrs[i].AYRms):s.printf("\t");as=as+s;
        w=GetSensWState(BTSrs+i);
        s.printf("\t%2d ",w>>12);for(int i=4;i<16;i++) {if(w&(32768>>i)) s+="1";else s+="0";if((i==3)||(i==7)||(i==11)) s+=" ";}as=as+s;
      }
    }
    //---------------------------------------------------------------------------
    int nh;double HX,HY,HXMax,HYMax;WORD w;
    nh=Calc_FH(&HX,&HY,&HXMax,&HYMax,&w);isHor=(nh>0);
    (w==0)?s.printf("\t%8.2f", HX):s.printf("\t");hs=hs+s;
    (w==0)?s.printf("\t%8.2f", HY):s.printf("\t");hs=hs+s;
    (w==0)?s.printf("\t%8.2f", HXMax):s.printf("\t");hs=hs+s;
    (w==0)?s.printf("\t%8.2f", HYMax):s.printf("\t");hs=hs+s;
    s.printf("\t%2d ",w>>12);for(int i=4;i<16;i++) {if(w&(32768>>i)) s+="1";else s+="0";if((i==3)||(i==7)||(i==11)) s+=" ";}hs=hs+s;
    //---------------------------------------------------------------------------
    int ix;
    //ix=Memo->Lines->Add(hs);
    ix=Memo->Lines->Add(ds);
    //ix=Memo->Lines->Add(ws);
    //ix=Memo->Lines->Add(as);
    if(Memo->Lines->Count>MEMO_COUNT)
    {
      Memo->Lines->BeginUpdate();
      for(int i=0;i<1;i++) Memo->Lines->Delete(0);
      Memo->Lines->EndUpdate();
   }
  }


//
  if(CanSave)
  {
    if(BTPrs.on)
    {
      if(!WriteRes(time,ds,"_data.txt")) AddMessage(3,"Сервер: Ошибка записи измерений углов в файл");
      if(isMet) if(!WriteRes(time,ws,"_wdata.txt")) AddMessage(3,"Сервер: Ошибка записи измерений ветра в файл");

      if(isAcc) if(!WriteRes(time,as,"_adata.txt")) AddMessage(3,"Сервер: Ошибка записи измерений ускорений в файл");

      if(isHor) if(!WriteRes(time,hs,"_hdata.txt")) AddMessage(3,"Сервер: Ошибка записи измерений гориз. отклонений в файл");
      is+="\t"+EInfo->Text;
      if(!WriteRes(time,is,"_info.txt")) AddMessage(3,"Сервер: Ошибка записи info файл");
    }
    //for(int i=0;i<NS;i++)
    for(int i=0;i<MaxNumSrs;i++)  // !!! MaxNumSrs
    {
      //if(!BTSrs[i].SBuf.SaveBuf(ExtractFileDir(Application->ExeName),BTSrs[i].SND3))

      if(!BTSrs[i].SBuf.SaveBuf(ExtractFileDir(Application->ExeName),i+1)) // 1.0.116

      if (SaveAccTxt==0) AddMessage(3,"Сервер: Ошибка записи буфера акселерометра в файл");

      if(!BTSrs[i].isMeteo) continue;
      if(!BTSrs[i].SWBuf.SaveBuf(ExtractFileDir(Application->ExeName),i+1)) // 1.0.116

        AddMessage(3,"Сервер: Ошибка записи буфера метеостанции в файл");
    }
  }

 //---------------------------------------------------------------------------

 //После сохранения в файле обновляем значения в тэгах OPC DA
 SetOPCVals();

 //---------------------------------------------------------------------------

}

//---------------------------------------------------------------------------
void __fastcall TFMain::TVSrvCustomDrawItem(TCustomTreeView *Sender,
      TTreeNode *Node, TCustomDrawState State, bool &DefaultDraw)
{
  TTreeView* TV=(TTreeView*)Sender;
  TRect R,R2;int W=300;
  DefaultDraw = false;
  TV->Canvas->Font->Color=clBlack;
  TV->Canvas->Brush->Color=clWhite;
  R=Node->DisplayRect(false);
  if(Node->Level==0)
  {
    TV->Canvas->Font->Style=TFontStyles()<<fsBold;
    if(Node->Expanded) TV->Canvas->Draw(R.Left+2,R.Top+2,Image2->Picture->Bitmap);
    else               TV->Canvas->Draw(R.Left+2,R.Top+2,Image1->Picture->Bitmap);
  }
  R.Left=R.Left+TV->Indent;
  R2=R;R2.Right=W+TV->Indent;R2.Top+=0;R2.Bottom-=0;
  TV->Canvas->FillRect(R2);
  TV->Canvas->TextRect(R2,R2.Left+4, R2.Top, Node->Text);
  if(Node->Data!=NULL)
  {
    TV->Canvas->Font->Color=clBlack;
    TV->Canvas->Brush->Color=clWhite;
    TV->Canvas->Brush->Style=bsSolid;
    R2.Left+=W;R2.Right=TV->Width+10;
    TV->Canvas->TextRect(R2,R2.Left+4, R2.Top,*(AnsiString*)Node->Data);
  }
  TV->Canvas->Pen->Color=(TColor)RGB(180,180,180);  //clGray;
  TV->Canvas->MoveTo(R.Right,R.Bottom);
  TV->Canvas->LineTo(R.Left,R.Bottom);
  TV->Canvas->MoveTo(R.Right,R.Top);
  TV->Canvas->LineTo(R.Left,R.Top);
  TV->Canvas->MoveTo(R.Left,R.Bottom);
  TV->Canvas->LineTo(R.Left,R.Top);
  TV->Canvas->MoveTo(R.Left+W,R.Bottom);
  TV->Canvas->LineTo(R.Left+W,R.Top);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::FormResize(TObject *Sender) {TVSrv->Repaint();}
//---------------------------------------------------------------------------
void __fastcall TFMain::TmStartTimer(TObject *Sender)
{
  AnsiString s;
  TmStart->Enabled=false;
  //if(!BTPrs.on) {BTPrs.on=true;TmRun->Enabled=true;} // gluk 2
  if(!BTPrs.on)
  {
    BTPrs.on=true;
    TmRun->Enabled=true;
    TmRunTimer(NULL);
  }

  if (((!SERVER_SECURITY)||TRIAL)&&(CanModbus==true))
  {
    try {if(!Server1->Active) Server1->Active=true;}catch (...) {}
//Второй сервер отрубаем по определению
//!!!    try {if(!Server2->Active) Server2->Active=true;}catch (...) {}
  }

  AddMessage(4,"***********************************************************************************");

  if (CanModbus)
  {
          if(Server1->Active) AddMessage(1,"Сервер: IP порт "+(s=Server1->Port)+" включен");
          else                AddMessage(3,"Сервер: IP порт "+(s=Server1->Port)+" занят");
  }

  //!!!if(Server2->Active) AddMessage(1,"Сервер: IP порт "+(s=Server2->Port)+" включен");
  //else                AddMessage(3,"Сервер: IP порт "+(s=Server2->Port)+" занят");

  AddMessage(1,"Сервер: Опрос датчиков включен");
  TmHideExit->Enabled=fOpenHid;
}
//---------------------------------------------------------------------------
DWORD TFMain::GetSensWState(TBTSensor *S)
{
  // Ошибки портов
  for(int i=0;i<BTPrs.NumPrs;i++)
  {
    int wstate=BTPrs.GetWState(i);
    if(wstate==0) continue;
    for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++)
    {
      if(BTPrs.Ps[i].Srs[j]==S)
      {
        S->dataon=false;
        if(!S->on)    return 0x0F00; // Датчик отключен
        if(wstate==3) return 0x1700; // Порт отключен
        return 0x2700;               // Ошибки порта
      }
    }
  }
  // *Опрос отключен
  if(!S->on) return 0x0F00;
  // *Ошибки CRC
  if(S->ec>=NumCErrSrs) {S->dataon=false;return 0x4700;}
  // *Ошибки чтения
  if(S->er>=NumRErrSrs) {S->dataon=false;return 0x3700;}
  // *Данные еще не получены
  if(!S->dataon) return 0x0700;

  DWORD w=0x0000;
  // *11 - время установления температуры термостата превысило допустимое значение
  if(S->sw.ftrme) w=0xB000;
  // *10 - не работает вентилятор термостата
  if(S->sw.fthre) w=0xA000;
  // ?9 - ошибки диапазона датчика температуры термостата
  if(S->sw.ft5re) w=0x9200;
  // *8 - не работает датчик температуры термостата
  if(S->sw.ft5te) w=0x8200;
  // *7 - ошибки диапазона датчика ИН-Д3
  if(S->sw.fre) w=0x7400;
  // *6 - ошибки CRC при приеме пакетов от датчика ИН-Д3
  if(S->sw.fce) w=0x6400;
  // *5 - датчик ИН-Д3 не отвечает
  if(S->sw.fte) w=0x5400;
  // *Данные углов не готовы
  if(!S->sw.fdr) w|=0x0400;
  // *Данные температуры не готовы
  if(!S->sw.ft5dr) w|=0x0200;
  // *Данные ускорений не готовы
  if(!S->Adataon) w|=0x0100;
  // *Готовность данных датчика после перезагрузки (был первый результат)
  if(!S->sw.frst) w|=32;
  // *Бит 2	Максимальная мощность нагрева	термостата (быстрый нагрев) ( бит 4 = 1)
  if(S->PwCur>99.9) {w|=4;w|=16;}
  // *Бит 3	Минимальная  мощность нагрева термостата (быстрое охлаждение)( бит 4 = 1)
  if(S->PwCur<0.1) {w|=8;w|=16;}
  return w;
}
//---------------------------------------------------------------------------
WORD TFMain::GetWWState(TBTSensor *S)
{
   extern bool Val(BYTE);
   typedef struct {WORD r:12;WORD s:4;} SWS;SWS* sws;
   WORD w=GetSensWState(S);sws=(SWS*)&w;
   if(sws->s>4) sws->s=0;
   w=w&~(256+512+1024);
   if(!S->Wdataon||!S->on||(sws->s>0)) w|=256;
  *(BYTE*)&w=S->wstatus;
  return w;
}
//---------------------------------------------------------------------------
int TFMain::SrsState(TBTSensor *S,AnsiString* s)
{
  DWORD w=GetSensWState(S);
  if(!S->on)     {S->SrsState=0;if(s!=NULL) *s="Опрос отключен";return 18;}
  if(!S->porton) {S->SrsState=1;if(s!=NULL) *s="Пауза";        return 14;}
  if(w==0x4700)  {S->SrsState=2;if(s!=NULL) *s="Ошибки CRC";   return 11;};
  if(w==0x3700)  {S->SrsState=3;if(s!=NULL) *s="Ошибки чтения";return 11;};
  if(!S->dataon) {S->SrsState=4;if(s!=NULL) *s="Ожидание";     return 15;}
  {S->SrsState=5;if(s!=NULL) *s="Опрос";return 12;}
}
//-----------------------------------------------------------------------------
// ??? run,res,cmd
int TFMain::COMState(TBTPortState *PS,AnsiString* s)
{
  if(!PS->on)
  {
   *s="Отключен";
   BTPrs.SetWState(PS-BTPrs.Ps,3);
   return 8;
   }

  // Run
  if(PS->CPrt->st.run)
  {
    switch(PS->CPrt->st.cmd)    //1
    {
      case  1:*s="Открытие";return 4;
      case  2:*s="Закрытие";return 4;
      case  3:*s="Чтение";return 5;    //*
      case  4:*s="Запись";return 3;
      case  5:*s="Настройка";return 6;
      case  6:*s="Очистка";return 6;
      default:*s="Неизвестное состояние";BTPrs.SetWState(PS-BTPrs.Ps,3);return 1;
    }
  }
  // Pause
  if(PS->CPrt->st.res)          //false
  {

    if (PS->CPrt->ServiceMode)
    {
     *s="Сервисный режим";BTPrs.SetWState(PS-BTPrs.Ps,0);return 2;
    }
    else
    {
            switch(PS->CPrt->st.cmd)    //1
            {
              case  1:*s="Пауза после открытия";BTPrs.SetWState(PS-BTPrs.Ps,0);return 2;
              case  2:*s="Пауза после закрытия";return 1;
              case  3:*s="Пауза после чтения";BTPrs.SetWState(PS-BTPrs.Ps,0);return 2;            //*
              case  4:*s="Пауза после записи";BTPrs.SetWState(PS-BTPrs.Ps,0);return 2;
              case  5:*s="Пауза после настройки";BTPrs.SetWState(PS-BTPrs.Ps,0);return 2;
              case  6:*s="Пауза после очистки";BTPrs.SetWState(PS-BTPrs.Ps,0);return 2;

//      case  7:*s="Сервисный режим";BTPrs.SetWState(PS-BTPrs.Ps,0);return 2;

             default:*s="Неизвестная пауза";BTPrs.SetWState(PS-BTPrs.Ps,3);return 1;
            }
    }
  }
  // Error

 if (PS->CPrt->ServiceMode)
 {
     *s="Сервисный режим";BTPrs.SetWState(PS-BTPrs.Ps,0);return 2;
 }
 else
  switch(PS->CPrt->st.cmd)       //1
  {
    case  1:*s="Пауза после ошибки открытия";BTPrs.SetWState(PS-BTPrs.Ps,1);return 1;
    case  2:*s="Пауза после ошибки закрытия";BTPrs.SetWState(PS-BTPrs.Ps,1);return 1;
    case  3:*s="Пауза после ошибки чтения";BTPrs.SetWState(PS-BTPrs.Ps,0);return 1;
    case  4:*s="Пауза после ошибки записи";BTPrs.SetWState(PS-BTPrs.Ps,2);return 1;
    case  5:*s="Пауза после ошибки настройки";BTPrs.SetWState(PS-BTPrs.Ps,2);return 1;
    case  6:*s="Пауза после ошибки очистки";BTPrs.SetWState(PS-BTPrs.Ps,2);return 1;
    case  7:*s="Пауза после ошибки CRC";BTPrs.SetWState(PS-BTPrs.Ps,0);return 1;
    default:*s="Неизвестная пауза после ошибки";BTPrs.SetWState(PS-BTPrs.Ps,3);return 1;
  }
}
//-----------------------------------------------------------------------------
bool CRCErr=false,WErr=false;
void __fastcall TFMain::CBCRCErrClick(TObject *Sender)
{
  CRCErr=CBCRCErr->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::CBWErrClic(TObject *Sender)
{
  WErr=CBWErr->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::TmRunTimer(TObject *Sender)
{

  for(int i=0;i<BTPrs.NumPrs;i++)
  {
    for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++)
    {
      TBTSensor* S=BTPrs.Ps[i].Srs[j];
      S->Calc_FA();S->Calc_FW();
      S->UCmd.cs.GetAll=true;
      S->UCmd.cs.d3stat=  CBStat->Checked;
      S->UCmd.cs.t5stat=  CBStat->Checked;
      S->UCmd.cs.ResErr=  CBStat->Checked;
      //S->UCmd.cs.GetXYCur=CBStat->Checked&&!S->isBS;  // 1.0.2 // Для поддержки старого БС
      S->UCmd.cs.wstat=   CBStat->Checked&&S->isMeteo;  // 1.0.2 // Для поддержки старого БС
      S->UCmd.cs.wres=    CBStat->Checked&&S->isMeteo;
      if(CBStat->Checked) {S->UCmd.cs.GetInfo=true;S->UCmd.infoix=CBXInfo->ItemIndex;}
    }
  }

}
//---------------------------------------------------------------------------
void __fastcall TFMain::BResetClick(TObject *Sender)
{
  int ix=TreeView->Selected->StateIndex;
  if(ix<=255) return;
  TBTSensor* S=BTPrs.Ps[(ix-1)&0xFF].Srs[(ix-1)/256-1];
  TTDThread* Th=BTPrs.Ps[(ix-1)&0xFF].CThr;

  if(Sender==BReset0) {Th->UCmd.cs.Reset=true;return;}
  if(Sender==BReset)  { S->UCmd.cs.Reset=true;return;}
  if(Sender==BStackOn)
  {
    S->UCmd.SClrOn=CBSClrOn->Checked;
    S->UCmd.SProgClrOn=CBSProgClrOn->Checked;
    S->UCmd.nGroup=ESNGroup->Text.ToIntDef(0);
    if(S->UCmd.del_type==3) S->UCmd.cs.StackSOn=true;
    else                    S->UCmd.cs.StackOn=true;
    return;
  }
  if(Sender==BStackOff)
  {
    S->UCmd.SClrOff=CBSClrOff->Checked;
    S->UCmd.SProgClrOff=CBSProgClrOff->Checked;
    S->UCmd.nGroup=ESNGroup->Text.ToIntDef(0);
    S->UCmd.cs.StackOff=true;
    return;
  }
  if(Sender==BStack0On)
  {
    Th->UCmd.SClrOn=CBSClrOn->Checked;
    Th->UCmd.SProgClrOn=CBSProgClrOn->Checked;
    Th->UCmd.nGroup=ESNGroup->Text.ToIntDef(0);
    if(S->UCmd.del_type==3) Th->UCmd.cs.StackSOn=true;
    else                    Th->UCmd.cs.StackOn=true;
    return;
  }
  if(Sender==BStack0Off)
  {
    Th->UCmd.SClrOff=CBSClrOff->Checked;
    Th->UCmd.SProgClrOff=CBSProgClrOff->Checked;
    Th->UCmd.nGroup=ESNGroup->Text.ToIntDef(0);
    Th->UCmd.cs.StackOff=true;
    return;
  }
  if(Sender==BAdr)
  {
    S->UCmd.adr=EAdr->Text.ToIntDef(5);
    S->UCmd.bsadr=false;
    S->UCmd.cs.SetAdr=true;return;
  }
  if(Sender==BBSAdr)
  {
    S->UCmd.adr=EBSAdr->Text.ToIntDef(99);
    S->UCmd.bsadr=true;
    S->UCmd.cs.SetAdr=true;return;
  }
  if(Sender==BRQAdr)
  {
    S->adr=ERQAdr->Text.ToIntDef(12);
    return;
  }
  if(Sender==BGetStpC)
  {
    S->UCmd.tstp=0;
    S->UCmd.cs.GetStp=true;
    S->UCmd.cs.NVMState=true;
    return;
  }
  if(Sender==BGetStpT)
  {
    S->UCmd.tstp=1;
    S->UCmd.cs.GetStp=true;
    S->UCmd.cs.NVMState=true;
    return;
  }
  if(Sender==BGetStpN)
  {
    S->UCmd.tstp=2;
    S->UCmd.cs.GetStp=true;
    S->UCmd.cs.NVMState=true;
    return;
  }
  if(Sender==BWriteStp)
  {
    S->UCmd.cs.WriteStp=true;return;
  }
  if(Sender==BCopyStp)
  {
    S->UCmd.cs.CopyStp=true;return;
  }
  if(Sender==BSetTmp)
  {
    S->B1=EB1->Text.ToIntDef(4);
    S->B2=EB2->Text.ToIntDef(99);
    S->UCmd.cs.SetTmp=true;
    return;
  }
  if(Sender==Bn50)
  {
    S->UCmd.n50=En50->Text.ToIntDef(50);
    S->UCmd.cs.Setn50=true;return;
  }
  if(Sender==BTmax)
  {
    S->UCmd.Tmax=ETmax->Text.ToIntDef(50);
    S->UCmd.cs.SetTmax=true;return;
  }
  if(Sender==BPulse)
  {
    S->UCmd.del_type=Edtype->Text.ToIntDef(1);
    if(S->UCmd.del_type==3)
    {
      S->UCmd.tick_rate=Etr->Text.ToIntDef(100);
      S->UCmd.puls_time=Ept->Text.ToIntDef(50);
    }
    else
    {
      S->UCmd.tick_rate=Etr->Text.ToIntDef(1000)*40*1000;
      S->UCmd.puls_time=Ept->Text.ToIntDef(500)*1000*20.0/(10.0-5.9);
    }
    S->UCmd.cs.SetPulse=true;return;
  }
  if(Sender==BProg)
  {
    S->UCmd.cs.Prog=true;
    // Prog.txt
    AnsiString s,name=ExtractFileDir(Application->ExeName);double time=Now();
    name+="\\";name+="Prog.txt";
    s=FormatDateTime("hh:nn:ss dd.mm.yy",time)+"\t"+(s=S->adr)+
                     "\t"+(s=MVER)+"."+(s=SVER)+"."+(s=BUILD)+"\n";
    FILE* f=fopen(name.c_str(),"at");
    if(f!=NULL) { fputs(s.c_str(),f);fclose(f);}
    return;
  }
  if(Sender==BD3Set)
  {
    S->UCmd.cs.D3Set=true;
    return;
  }
  if(Sender==BFIR1)  {S->UCmd.mode_com= 0;S->UCmd.mode_on=!S->md.nofir1;S->UCmd.cs.MODE=true;return;}
  if(Sender==BFIR2)  {S->UCmd.mode_com= 1;S->UCmd.mode_on=!S->md.nofir2;S->UCmd.cs.MODE=true;return;}
  if(Sender==BIdle)  {S->UCmd.mode_com= 2;S->UCmd.mode_on=!S->md.noidle;S->UCmd.cs.MODE=true;return;}
  if(Sender==BTOut)  {S->UCmd.mode_com= 3;S->UCmd.mode_on=!S->md.nod3;S->UCmd.cs.MODE=true;return;}
  if(Sender==Bt5av)  {S->UCmd.mode_com= 4;S->UCmd.mode_on=!S->md.not5av;S->UCmd.cs.MODE=true;return;}
  if(Sender==BTermo) {S->UCmd.mode_com= 5;S->UCmd.mode_on=!S->md.notrm;S->UCmd.cs.MODE=true;return;}
  if(Sender==BStack) {S->UCmd.mode_com= 6;S->UCmd.mode_on=!S->md.nostack;S->UCmd.cs.MODE=true;return;}
  if(Sender==BDAdr)  {S->UCmd.mode_com= 7;S->UCmd.mode_on=!S->md.noadrdet;S->UCmd.cs.MODE=true;return;}
  if(Sender==BAcmp)  {S->UCmd.mode_com= 8;S->UCmd.mode_on=!S->md.noacmp;S->UCmd.cs.MODE=true;return;}
  if(Sender==BFIR3)  {S->UCmd.mode_com= 9;S->UCmd.mode_on=!S->md.nofir3;S->UCmd.cs.MODE=true;return;}
  if(Sender==BPwr)   {S->UCmd.mode_com=10;S->UCmd.mode_on=!S->md.nopwr; S->UCmd.cs.MODE=true;return;}
  if(Sender==BMeteo) {S->UCmd.mode_com=11;S->UCmd.mode_on=!S->md.nometeo;S->UCmd.cs.MODE=true;return;}

  if(Sender==Btostart) {S->UCmd.mode_com=12;S->UCmd.mode_on=!S->md.tostart;S->UCmd.cs.MODE=true;return;}
  //if(Sender==Bbr115) {S->UCmd.mode_com=13;S->UCmd.mode_on=!S->md.br115;S->UCmd.cs.MODE=true;return;}
  if(Sender==Bto10) {S->UCmd.mode_com=14;S->UCmd.mode_on=!S->md.to10;S->UCmd.cs.MODE=true;return;}

}
//---------------------------------------------------------------------------
void __fastcall TFMain::ETmRunChange(TObject *Sender)
{
  TmRun->Interval=ETmRun->Text.ToIntDef(TmRun->Interval);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::ETmSaveChange(TObject *Sender)
{
  TmSave->Interval=ETmSave->Text.ToIntDef(TmSave->Interval);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::TreeViewKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
  //if(Key==VK_F8) if(Shift.Contains(ssAlt)) if(Shift.Contains(ssCtrl)) TSTest->TabVisible=!TSTest->TabVisible;
  if(Key=='P') if(Shift.Contains(ssCtrl))
  {
    MEPass->Visible=!MEPass->Visible;
    if(MEPass->Visible==true) MEPass->Text="";
  }

  if(Key=='Y') if(Shift.Contains(ssCtrl))
  {
      SetExtendedMode();
  }


}
//---------------------------------------------------------------------------
void __fastcall TFMain::MEPassChange(TObject *Sender)
{
  if(MEPass->Text=="1234")  // Password
  {
    MEPass->Visible=false;

    TSTest->TabVisible=true;

    Memo->ReadOnly=false;
    RichEdit->ReadOnly=false;
  }
}
//---------------------------------------------------------------------------
void __fastcall TFMain::FormDestroy(TObject *Sender)
{
  AddMessage(0,"Сервер: Опрос датчиков отключен");
  AddMessage(0,"Сервер: IP порты отключены");
  AddMessage(4,"***********************************************************************************");

   if (GRestartFlag==true)
   {
           GRestartFlag=false;
           //char dir[1024];
           //GetCurrentDirectory(1024,dir);
           SetCurrentDirectory(MainCurrentDirectory);
           strcat(MainCurrentDirectory,"\\GSStarter.exe");
           ShellExecute(NULL,NULL,MainCurrentDirectory,NULL,NULL,0);
           //::Sleep(500);
           //exit(0);
   }

}
//---------------------------------------------------------------------------
void __fastcall TFMain::BVolSNClick(TObject *Sender)
{
  AnsiString s;
  EVolC->Text=s.IntToHex(GetVolumeSN("C:\\"),8);
  EVolD->Text=s.IntToHex(GetVolumeSN("D:\\"),8);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::BFileClick(TObject *Sender)
{
  CanSave=!CanSave;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::BHideClick(TObject *Sender)
{
  MEPass->Visible=false;
  TSTest->TabVisible=false;
  Memo->ReadOnly=true;
  RichEdit->ReadOnly=true;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::StatusBarDrawPanel(TStatusBar *StatusBar,
      TStatusPanel *Panel, const TRect &Rect)
{
  //AnsiString s="Запись в файл ";s+=TmSave->Interval/1000.0;s+=" с";
  AnsiString s=TmSave->Interval/1000.0;s+=" с";
  int w=StatusBar->Canvas->TextWidth(s);
  int h=StatusBar->Canvas->TextHeight(s);
  if(CanSave)
  {
    StatusBar->Canvas->Brush->Color=(TColor)RGB(0,128,0);
    StatusBar->Canvas->Font->Color=(TColor)RGB(255,255,255);
  }
  else s="";
  StatusBar->Canvas->TextRect(Rect,Rect.left+(Rect.Width()-w)/2,Rect.Top+(Rect.Height()-h)/2,s);

}
//---------------------------------------------------------------------------
void __fastcall TFMain::BINIClick(TObject *Sender)
{
  INI(false);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::PCChange(TObject *Sender)
{
   UpdateTV();
}
//---------------------------------------------------------------------------
void __fastcall TFMain::SBLensClick(TObject *Sender)
{
  TSLens->TabVisible=!TSLens->TabVisible;
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
bool isAver2=false;
void __fastcall TFMain::CBAver2Click(TObject *Sender)
{
  isAver2=CBAver2->Checked;
}
//---------------------------------------------------------------------------
bool isCB128=false;
void __fastcall TFMain::CB128Click(TObject *Sender)
{
  isCB128=CB128->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::StatusBarMouseDown(TObject *Sender, // 1.0.116
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  if((X>200)&&(X<260))
    if(Shift.Contains(ssCtrl))
      if(Shift.Contains(ssShift)) CanSave=!CanSave;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::BTCPClick(TObject *Sender)
{
  if(GPRSServer->Active==false) try {GPRSServer->Active=true;return;} catch (...) {return;};
  try
  {
    if(GPRSServer->Socket->ActiveConnections==1) GPRSServer->Socket->Connections[0]->Close();
    GPRSServer->Active=false;
  } catch (...) {};
}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// !!! FFT+
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
double FNameToTime(AnsiString name)
{
  return EncodeDateTime
  (
    name.SubString(1,2).ToIntDef(0)+2000,
    name.SubString(4,2).ToIntDef(1),
    name.SubString(7,2).ToIntDef(1),
    name.SubString(10,2).ToIntDef(0),
    name.SubString(13,2).ToIntDef(0),
    name.SubString(16,2).ToIntDef(0),
    0
  );
}
//-----------------------------------------------------------------------------
void __fastcall TFMain::BPlotClick(TObject *Sender)
{
  AnsiString s;
  TBTSensor* S;int ix=TreeView->Selected->StateIndex;
  if(ix<=255) S=BTPrs.Ps[0].Srs[0];else S=BTPrs.Ps[(ix-1)&0xFF].Srs[(ix-1)/256-1];
  WORD sw=S->SBuf.sw;DWORD count;
  byte type=CBServer2->ItemIndex;bool isX=TBXY->ImageIndex==33;
  // 0 X, Y        // 1 XAver, YAver // 2 XMax, YMax   // 3 XRms, YRms
  // 4 XYRms       // 5 Time         // 6 U, V         // 7 UAver, VAver
  // 8 UMax, VMax  // 9  WS          // 10 WTime
  if((type==0)||(type==6)) count=S->SBuf.ncalc*PACK_SIZE;
  else                     count=S->SWBuf.ncalc;
  double k=1.0,f=500.0/En50->Text.ToIntDef(50); // !!! En50
  switch(type)
  {
    case 0:
      k=1.0/8.0;
      if(CBTest->Checked) count=8192*1;
      BSD.SetCount(count,true,false);
      for(int i=0;i<BSD.count;i++)
      {
        if(CBTest->Checked) BSD.WD1[i]=1*cos(1.0/4.0*BSD.count*2.0*M_PI*i/BSD.count)+1;
        else                BSD.WD1[i]=isX?k*S->SBuf.X[i]:k*S->SBuf.Y[i];
      }
      //------------------------------------------
      BSD.WTime=S->StackStartTime;
      s=(S->N+1);isX?s+="X":s+="Y";
      StatusBar1->Panels->Items[3]->Text=s;
      StatusBar1->Panels->Items[4]->Text="RAM";
      TmChart->Enabled=true;
      break;
  }
}
//---------------------------------------------------------------------------
void __fastcall TFMain::AGoExecute(TObject *Sender)
{
  int ix;DWORD n;
  ix=CBSNGroup->ItemIndex;
  if(ix<0) { ix=0;CBSNGroup->ItemIndex=ix;}
  if(ix==0) ESNGroup->Text=0;
  else      ESNGroup->Text=(16<<ix)/32;
  BResetClick(BStackOn);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::AStopExecute(TObject *Sender)
{
   BResetClick(BStackOff);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::AChartDlgExecute(TObject *Sender)
{
  BPlotClick(NULL);
}
//---------------------------------------------------------------------------
int MType=1;
void __fastcall TFMain::MMeasT0Click(TObject *Sender)
{
  MType=0;
  if(Sender==MMeasT0) {MType=0;MMeasT0->Checked=true;}
  if(Sender==MMeasT1) {MType=1;MMeasT1->Checked=true;}
  if(Sender==MMeasT2) {MType=2;MMeasT2->Checked=true;}
}
//---------------------------------------------------------------------------
void TFMain::SetEnAct(TBTSensor *S)
{
  if(S==NULL)
  {
    AChartDlg->Enabled=false;
    TBStart->Action=AGo;AGo->Enabled=false;AStop->Enabled=false;
    StatusBar1->Panels->Items[0]->Text="";
    StatusBar1->Panels->Items[1]->Text="";
    return;
  }
  AChartDlg->Enabled=(S->SBuf.ncalc>0);
  StatusBar1->Panels->Items[0]->Text=S->SBuf.ncalc*PACK_SIZE;
  StatusBar1->Panels->Items[1]->Text=S->SBuf.nsave*PACK_SIZE;
  if(!S->dataon)
  {
    TBStart->Action=AGo;AGo->Enabled=false;AStop->Enabled=false;
    return;
  }
  if(S->md.nostack)
  {
    TBStart->Action=AGo;AGo->Enabled=true;AStop->Enabled=false;
    return;
  }
  TBStart->Action=AStop;AGo->Enabled=false;AStop->Enabled=true;

  //AStop->Enabled=!S->md.nostack;AGo->Enabled=!AStop->Enabled;
  //AChartDlg->Enabled=!(ix<=255);
  //BStart->Action=(stop)?AGo:AStop;

  // Start, Stop
  //if(stop) {TBStart->DropdownMenu=PMMeas;TBStart->Style=(TToolButtonStyle)2;}
  //else     {TBStart->DropdownMenu=NULL;  TBStart->Style=(TToolButtonStyle)0;}
  //TBStart->DropdownMenu=NULL;TBStart->Style=(TToolButtonStyle)0;
  //if(stop) TBStart->Action=AGo;
  //else     TBStart->Action=AStop;
  //if(MType==0) { AGo->ImageIndex=29;MMeasT0->Checked=true;}
  //if(MType==1) { AGo->ImageIndex=30;MMeasT1->Checked=true;}
  //if(MType==2) { AGo->ImageIndex=31;MMeasT2->Checked=true;}
  //AClear->Enabled=stop;
  //AOpen->Enabled=stop;
  //AMeasStp->Enabled=stop;
  //ASetup->Enabled=stop&&(!ARes->Checked);
  //AChartDlg->Enabled=ARes->Checked;
  //ADel->Enabled=ARes->Checked;
  //ACopy->Enabled=ARes->Checked;
  //ASelAll->Enabled=ARes->Checked;
  //AUndo->Enabled=ARes->Checked&&(UDItems.N>0);
  //ASave->Enabled=true;
  //APrint->Enabled=true;
  //AQuit->Enabled=true;
}
//---------------------------------------------------------------------------
AnsiString LastName="";
//---------------------------------------------------------------------------
void __fastcall TFMain::ACopyExecute(TObject *Sender)
{
  OpenDialog->Title="Конвертировать";
  AOpenExecute(NULL);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::AOpenExecute(TObject *Sender)
{
  OpenDialog->FileName=LastName;
  OpenDialog->InitialDir=ExtractFilePath(Application->ExeName);
  if(!OpenDialog->Execute()) {OpenDialog->Title="Открыть";return;}
  StatusBar1->Panels->Items[3]->Text="_"+ExtractFileName(OpenDialog->FileName).SubString(19,7);
  StatusBar1->Panels->Items[4]->Text=ExtractFilePath(OpenDialog->FileName);
  LastName=OpenDialog->FileName;
  OpenDialog->Title="Открыть";
}
//---------------------------------------------------------------------------
bool ConvertWRD(bool &CanClose)
{
  int h;AnsiString msg,name,s;DWORD count;int i;double Time;
  Screen->Cursor=crHourGlass;
  name=FMain->OpenDialog->FileName;
  for(i=0;i<FMain->OpenDialog->Files->Count;i++)
  {
    name=FMain->OpenDialog->Files->Strings[i];
    if((h=FileOpen(name,fmOpenRead))==-1)
    {
      Screen->Cursor=crDefault;
      msg="Программа не может найти или открыть файл \'"+name+"\'.";
      MessageDlg(msg,mtWarning,TMsgDlgButtons()<<mbOK,0);
      CanClose=false;return false;
    }
    count=FileSeek(h,0,2)/sizeof(short);FileSeek(h,0,0);
    if(count<2) {FileClose(h);continue;}
    if(count>BSD.size) count=BSD.size;
    FileRead(h,BSD.WS,count*sizeof(short));
    FileClose(h);

    Time=FNameToTime(ExtractFileName(name));
    name=ChangeFileExt(name,".csv");
    if((h=FileCreate(name))==-1)
    {
      Screen->Cursor=crDefault;
      msg="Программа не может создать файл \'"+name+"\'.";
      MessageDlg(msg,mtWarning,TMsgDlgButtons()<<mbOK,0);
      CanClose=false;return false;
    }
    s.printf("%s;%s\n",FormatDateTime("hh:nn:ss dd.mm.yy",Time),ExtractFileName(name).SubString(19,2));
    FileWrite(h,s.c_str(),s.Length());
    for(int j=0;j<count;j++)
    {
      s.printf(";%.2f\n",BSD.WS[j]/8.0);
      FileWrite(h,s.c_str(),s.Length());
    }
    //FileWrite(h,BSD.WS,count*sizeof(short));
    FileClose(h);
  }
  Screen->Cursor=crDefault;
  CanClose=true;return true;
}
//---------------------------------------------------------------------------
bool OpenWRD(bool &CanClose)
{
  int h;AnsiString msg,name;DWORD sz,id; BYTE ver,sver;DWORD count,count_tmp;int i;
  Screen->Cursor=crHourGlass;
  name=FMain->OpenDialog->FileName;
  count_tmp=0;
  for(i=0;i<FMain->OpenDialog->Files->Count;i++)
  {
    if((h=FileOpen(FMain->OpenDialog->Files->Strings[i],fmOpenRead))==-1)
    {
      Screen->Cursor=crDefault;
      msg="Программа не может найти или открыть файл \'"+name+"\'.";
      MessageDlg(msg,mtWarning,TMsgDlgButtons()<<mbOK,0);
      CanClose=false;return false;
    }
    count=FileSeek(h,0,2)/sizeof(short);FileSeek(h,0,0);
    if(count<2) {FileClose(h);continue;}
    BSD.SetCount(count_tmp+count,true,false);
    FileRead(h,BSD.WS+count_tmp,(BSD.count-count_tmp)*sizeof(short));
    FileClose(h);
    double k=1.0/8.0;
    for(int j=count_tmp;j<BSD.count;j++) BSD.WD1[j]=k*BSD.WS[j];
    count_tmp=BSD.count;
    BSD.WTime=FNameToTime(ExtractFileName(FMain->OpenDialog->Files->Strings[i]));
    if(BSD.count==BSD.size) break;
  }
  //BSD.SetCount(BSD.count,true,true);
  FMain->TmChart->Enabled=true;
  Screen->Cursor=crDefault;
  CanClose=true;return true;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::OpenDialogCanClose(TObject *Sender, bool &CanClose)
{
  if(OpenDialog->Title=="Открыть") OpenWRD(CanClose);
  else                             ConvertWRD(CanClose);
}
//---------------------------------------------------------------------------
void __fastcall TFMain::TmChartTimer(TObject *Sender)
{
  TmChart->Enabled=false;
  Series1->Clear();
  double f=10.0;DWORD i;
  Screen->Cursor=crHourGlass;
  switch(CBProc->ItemIndex)
  {

    case 0: Chart->BottomAxis->DateTimeFormat="hh:mm:ss dd.MM.yy";
            Series1->XValues->DateTime=true;
            for(i=0;i<BSD.count;i++)    Series1->AddXY(BSD.WTime+i/f/3600.0/24.0,BSD.WD1[i],"",clRed);
            break;
    case 1: BSD.count=ExP2(BSD.count);
            Series1->XValues->DateTime=false;
            ReAbsFT(BSD.WD1,BSD.WD2,BSD.count);BSD.WD2[0]=0;
            for(i=0;i<BSD.count/2;i++ ) Series1->AddXY(i*f/BSD.count,BSD.WD2[i],"",clBlue);
            break;
    case 2: Series1->XValues->DateTime=false;
            ReAbsFT(BSD.WD1,BSD.WD2,BSD.count);BSD.WD2[0]=0;
            for(i=0;i<BSD.count/2;i++ ) Series1->AddXY(i*f/BSD.count,BSD.WD2[i],"",clBlue);
            break;
  }
  StatusBar1->Panels->Items[2]->Text=BSD.count;
  Screen->Cursor=crDefault;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::TBXYClick(TObject *Sender)
{
  if(TBXY->ImageIndex==33) TBXY->ImageIndex=34;
  else                     TBXY->ImageIndex=33;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::ACanSaveExecute(TObject *Sender)
{
  CanSave=!CanSave;
}
//---------------------------------------------------------------------------
void __fastcall TFMain::ToolButton1Click(TObject *Sender)
{
  if(FChartDlg->ShowModal()!=mrOk) return;
}
//---------------------------------------------------------------------------


void __fastcall TFMain::Button_Tst1Click(TObject *Sender)
{
//        this->SrsIND3List->AddItem("IND3 #1",NULL);
}


float fres=0;

TStrings* __fastcall TFMain::SetOPCVals(void)
{

  if (CanOPCDA==false)
  return NULL;

  Vals->Clear();
  TBTSensor*            S=NULL;
  int                   tagidx=0;
  bool                  tdstate=false;
  double                fval=0;
  unsigned short        sw=0;

  AnsiString now = Now();

  for(int i=0;i<BTPrs.NumPrs;i++)
  {
          for(int k=0;k<BTPrs.Ps[i].NumPSrs;k++)
          {
//Берем датчик из общего списка
            S=BTPrs.Ps[i].Srs[k];

            sw=*((unsigned short*)&S->sw);

            tdstate=((sw&(1<<0))!=0); //перезагрузка
            Vals->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

            tdstate=((sw&(1<<1))!=0); //готовность данных датчика
            Vals->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

            tdstate=((sw&(1<<2))!=0); //готовность данных температуры
            Vals->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

            tdstate=((sw&(1<<4))!=0); //ошибки чтениядатчика
            Vals->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

            tdstate=((sw&(1<<5))!=0); //ошибки CRC датчика
            Vals->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

            tdstate=((sw&(1<<6))!=0); //ошибки CRC датчика


            Vals->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

            tdstate=((sw&(1<<7))!=0); //ошибки чтеия температуры
            Vals->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

            tdstate=((sw&(1<<8))!=0); //ошибки диапазона температуры
            Vals->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

//Текущее значение угла по X
            fval=S->XCur;
            Vals->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Текущее значение угла по Y
            fval=S->YCur;
            Vals->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Макс. ускорение по X
            fval=S->AXMax;
            Vals->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Макс. ускорение по Y
            fval=S->AYMax;
            Vals->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Текущее значение ускорения по X
            fval=S->AXRms;
            Vals->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Текущее значение ускорения по Y
            fval=S->AYRms;
            Vals->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Температура
            fval=S->TCur;
            Vals->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Резерв
            Vals->Add(TOPCGate::FormatVal(++tagidx, fres, true, now));

          }
  }

  fres+=1;
  OPC->SetValues(Vals);
  return Vals;


/*
  int j=0;

  for (int i=0; i<8; i++)
  {
          Vals->Add(TOPCGate::FormatVal(++j, true, true, Now()));
  }

  for (int i=0; i<8; i++)
  {

         Vals->Add(TOPCGate::FormatVal(++j, 5555, true, Now()));
  }

  for (int i=0; i<8; i++)
  {
          Vals->Add(TOPCGate::FormatVal(++j, true, true, Now()));
  }

  for (int i=0; i<8; i++)
  {

         Vals->Add(TOPCGate::FormatVal(++j, 7777, true, Now()));
  }

  OPC->SetValues(Vals);


/*
    if (CanOPCDA==false) return NULL;

    try
    {
               gSensOPCMap.SetValues(Vals);
               OPC->SetValues(Vals);

    }
    catch (...)
    {

    }

    return Vals;
*/
}


//---------------------------------------------------------------------------
void TFMain::OPCTagsCreate()
{

        //TODO: Add your source code here

//-------------------------------------------------------------------------
//Перебираем все датчики в системе
//Глобальный список портов системы
//TBTPorts BTPrs;
//Глобальный список всех датчиковсистемы
//По сути  BTSrs указатель на начало глобального списка датчиков
//TBTSensor BTSrs[MaxNumSrs];


  if (CanOPCDA==false) return;

  AddMessage(0,"Сервер: инициализация OPC DA интерфейса");

  TBTSensor* S=NULL;

//Формируем карту ТЭГов по всем датчикам

#define MMAX 1

/*
for (int m=0; m<MMAX; m++)  {

  for(int i=0;i<BTPrs.NumPrs;i++)
  {
          for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++)
          {
            s=BTPrs.Ps[i].Srs[j];
            gSensOPCMap.AddSensMap(s);
          }
  }

}
*/

//Теперь знаем сколько дискретных и аналоговых
//  int DiscrtTagsCnt=gSensOPCMap.gDiscrtTagNum-1;
//  int AnalogTagsCnt=gSensOPCMap.gAnalogTagNum-1;

  Log = new TLog(ChangeFileExt(__argv[0], ".log"));
  Config = new TConfig();
  Tags = new TStringList();
  Vals = new TStringList();

  int j = 0;
  int i=0;
  int total=0;

  fval=0;



/*

	for (i = 1; i <= DiscrtTagsCnt; ++i) {
  	Tags->Add(AnsiString(++j) + " Sensor_1_AND3.Tag_DSW" + i + " b r");
    Vals->Add(TOPCGate::FormatVal(j, false, true, now)); total++;

  }



	for (i = 1; i <=AnalogTagsCnt ; ++i) {
  	Tags->Add(AnsiString(++j) + " Analog.Tag" + i + " r8 r");
    Vals->Add(TOPCGate::FormatVal(j, fval, true, now));  total++;

  }

*/


/*
	Tags->Add(AnsiString(++j) + " Discrete1.Tag" + " b r");

  	Tags->Add(AnsiString(++j) + " Analog1.Tag"   + " r8 r");


	Tags->Add(AnsiString(++j) + " Discrete2.Tag"  + " b r");

  	Tags->Add(AnsiString(++j) + " Analog2.Tag"    + " r8 r");
*/




  AnsiString par_grup("Discrete");
  AnsiString par_name("");

  j=0;

/*
     	     Tags->Add(AnsiString(++j) + par_grup + ".Restart "  + " r8 r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".ReadyAngl" + " r8 r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".ReadyTmpr" + " r8 r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".ReadErr"   + " r8 r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".CRCErr"    + " r8 r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".RangdErr"  + " r8 r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".TReadErr"  + " r8 r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".TRangErr"  + " r8 r");

*/

  int igroup=0;

  for(int i=0;i<BTPrs.NumPrs;i++)
  {
          for(int k=0;k<BTPrs.Ps[i].NumPSrs;k++)
          {
//Берем датчик из общего списка
            S=BTPrs.Ps[i].Srs[k];

//Создаем имя группы дискретных данных
            if (S->isInd3_211)
            par_grup.printf(" [COM%d].Sensor_%03d[IND3][Addr:%03d]",BTPrs.Ps[i].p+1,S->N+1,S->adr);
            else
            par_grup.printf(" [COM%d].Sensor_%03d[AND3][Addr:%03d]",BTPrs.Ps[i].p+1,S->N+1,S->adr);

//Добавляемтэги слова состояния

      	     Tags->Add(AnsiString(++j) + par_grup + ".STATE" + ".Restart "  + " b r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".STATE" +  ".ReadyAngl" + " b r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".STATE" +  ".ReadyTmpr" + " b r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".STATE" +  ".ReadErr"   + " b r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".STATE" +  ".CRCErr"    + " b r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".STATE" +  ".RangdErr"  + " b r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".STATE" +  ".TReadErr"  + " b r");
      	     Tags->Add(AnsiString(++j) + par_grup + ".STATE" +  ".TRangErr"  + " b r");

             /*
             if (S->isInd3_211)
             par_grup.printf(" Sensor%03d_IND3_DATA",S->N+1);
             else
             par_grup.printf(" Sensor%03d_AND3_DATA",S->N+1);
             */

    	     Tags->Add(AnsiString(++j) + par_grup +  ".DATA" +  ".Angl_X"  + " r8 r");
    	     Tags->Add(AnsiString(++j) + par_grup +  ".DATA" +  ".Angl_Y"  + " r8 r");

             if (S->isInd3_211)
             {
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +  ".3_Reserv"  + " r8 r");
    	             Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".4_Reserv"  + " r8 r");
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".5_Reserv"  + " r8 r");
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".6_Reserv"  + " r8 r");
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".7_Reserv"  + " r8 r");
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".8_Reserv"  + " r8 r");
             }
             else
             {
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".AMax_X"  + " r8 r");
    	             Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".AMax_Y"  + " r8 r");
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".ARms_X"  + " r8 r");
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".ARms_Y"  + " r8 r");
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".Temper"  + " r8 r");
            	     Tags->Add(AnsiString(++j) + par_grup + ".DATA" +   ".8_Reserv"  + " r8 r");
             }

          }
  }

  OPC = Config->GetSSL() ?
	  new TOPC(Config, Config->GetCertFile(), Config->GetKeyFile(),
    		Config->GetRootCertFile()) :
  new TOPC(Config);

  OPC->Start();

  OPC->SetValues(Vals);

  this->Timer_SetVals->Interval=1000;
  this->Timer_SetVals->Enabled=false;

//Если запускалась под админом конфигурируем внешние компоненты OPC
        if (IsAppRunningAsAdminMode())
        {

/*
          AnsiString sdir("");
          char cmd[2048];
          char cdir[1024];
          ::GetCurrentDirectory(1024,cdir);
          sdir=sdir+cdir+"\\";


          system ("echo off");

//Убиваем процесс OPC Gate
          system ("taskkill /f /im opcgate.exe");         ::Sleep(100);

//Убиваем регистрацию OPC Gate

         sprintf (cmd,"%sOPCGate.exe -u", sdir);
         system  (cmd);  ::Sleep(100);

         wchar_t wdir[1024];
         ::GetCurrentDirectoryW(1024,wdir);

//         AnsiString scmd("");

//         scmd=scmd+wdir;
//         scmd=scmd+L"\\OPCGate.exe -r";


          ShellExecuteW(NULL,NULL,L"OPCGate.exe",L" -u",wdir,0);           ::Sleep(100);
          ShellExecuteW(NULL,NULL,L"OPCGate.exe",L" -r",wdir,0);           ::Sleep(100);
          ShellExecuteW(NULL,NULL,L"delete",L"OPCGate.tag",wdir,0);        ::Sleep(100);
          ShellExecuteW(NULL,NULL,L"OPCGate.exe",L" -t",wdir,0);           ::Sleep(100);
//          ShellExecuteW(NULL,NULL,L"OPCGate.exe",L"",wdir,0);              ::Sleep(100);

//         sprintf (cmd,"%sOPCGate.exe -r", sdir);
//         system  (cmd);  ::Sleep(100);

//        ShellExecute(NULL,NULL,"OPCGate.exe"," -r",scmd,0);    ::Sleep(1000);

//         sprintf (cmd,"%sOPCGate.exe -t", sdir);
//         system  (cmd);  ::Sleep(100);

//        ShellExecute(NULL,NULL,"OPCGate.exe"," -t",cdir,0);      ::Sleep(1000);
//        system  (cmd);  ::Sleep(100);

//        system ("OPCGate.exe -u");                      ::Sleep(100);
//        system ("OPCGate.exe -r");                      ::Sleep(100);
//        system ("OPCGate.exe -t");                      ::Sleep(100);
*/

//         TOPCInstallForm->ShowModal();


          TimerOPCInstall->Interval=100;
          TimerOPCInstall->Enabled=true;

        }

}


TStrings* __fastcall TFMain::GetVals(void)
{
    return Vals;
}


/*
Выясняем с какими правами запущена программа /админа?/
*/

BOOL TFMain::IsAppRunningAsAdminMode(void)
{
    BOOL fIsRunAsAdmin = FALSE;


    DWORD dwError = ERROR_SUCCESS;
    PSID pAdministratorsGroup = NULL;

    // Allocate and initialize a SID of the administrators group.

    SID_IDENTIFIER_AUTHORITY NtAuthority = SECURITY_NT_AUTHORITY;

    if (!AllocateAndInitializeSid(
        &NtAuthority,
        2,
        SECURITY_BUILTIN_DOMAIN_RID,
        DOMAIN_ALIAS_RID_ADMINS,
        0, 0, 0, 0, 0, 0,
        &pAdministratorsGroup))
    {
        dwError = GetLastError();
        goto Cleanup;
    }


    // Determine whether the SID of administrators group is enabled in
 
    // the primary access token of the process.
 
    if (!CheckTokenMembership(NULL, pAdministratorsGroup, &fIsRunAsAdmin))
    {
        dwError = GetLastError();
        goto Cleanup;
    }

Cleanup:
    // Centralized cleanup for all allocated resources.
 
    if (pAdministratorsGroup)
    {
        FreeSid(pAdministratorsGroup);
        pAdministratorsGroup = NULL;
    }

    // Throw the error if something failed in the function.
 
    if (ERROR_SUCCESS != dwError)
    {
        throw dwError;
    }

    return fIsRunAsAdmin;
}
void __fastcall TFMain::TimerOPCInstallTimer(TObject *Sender)
{
        TimerOPCInstall->Enabled=false;
        TOPCInstallForm->Timer1Start();
        TOPCInstallForm->ShowModal();
}
//---------------------------------------------------------------------------


void __fastcall TFMain::MPortAddClick(TObject *Sender)
{
        //ShowMessage("Добавить порт");
        this->SysConfMaster.PortAdd();       
}
//---------------------------------------------------------------------------


void __fastcall TFMain::MSetupClick(TObject *Sender)
{
     ConfSave=true;

     GetTreeViewPar();

     TSysConfMaster* master=&SysConfMaster;
     master->gIniFile=gIniFile;
     TEdit* editpar=NULL;
     TComboBox* combo=NULL;
     TCheckBox* check=NULL;

     AnsiString mycap=Caption;
     AnsiString myname=BTPrs.Name;
     AnsiString myports("");
     myports.printf("%d",BTPrs.NumPrs);
     AnsiString s("");
     AnsiString ss("");
     int iport=0;
     int ipar=0;
     AnsiString spar("");
     bool bpar;
     bool CanOPCDAtmp=false;

     TMonSysPar* monsyspar=NULL;

     switch (mmselect)
     {
        case MENU_SYSTEM:

//Инициализируем для закладки БАЗОВЫЕ
        editpar=Form_SYSTEM_Tune->Edit_program_title;
        //void Init(MonSysIniParType type, AnsiString section, AnsiString par, AnsiString val, void* syspar, void* ctrl);
        master->ConfSysMain.Caption.Init(INIPAR_STRING,"COMMON","Caption",CCaption,(AnsiString*)&mycap,(TEdit*)editpar);

        editpar=Form_SYSTEM_Tune->Edit_system_name;
        master->ConfSysMain.Name.Init(INIPAR_STRING,"COMMON","Name",myname,(AnsiString*)&myname,(TEdit*)editpar);

        iport=BTPrs.NumPrs;
        combo=Form_SYSTEM_Tune->ComboBox_system_ports_num;
        master->ConfSysMain.NumOfPorts.Init(INIPAR_INTIDX,"COMMON","NumOfPorts",myports,&iport,(TComboBox*)combo);

        if (fOpenHid) s="1"; else s="0";
        check=Form_SYSTEM_Tune->CheckBox_canhide;
        master->ConfSysMain.CanHide.Init(INIPAR_BOOL,"COMMON","CanHide",s,&fOpenHid,(TCheckBox*)check);


        if (fCanclose) s="1"; else s="0";
        check=Form_SYSTEM_Tune->CheckBox_canclose;
        master->ConfSysMain.CanClose.Init(INIPAR_BOOL,"COMMON","CanClose",s,&fCanclose,(TCheckBox*)check);

//Инициализируем для закладки  РАСШИРЕННЫЕ СИСТЕМА

//ipport MODBUS
        iport=Server1->Port;
        editpar=Form_SYSTEM_Tune->Edit_modbusTCP;
        master->ConfSysAdd.IPPort1.Init(INIPAR_INT,"COMMON","IPPort1",iport,(int*)&iport,(TEdit*)editpar);

//

//      ipar=MEMO_COUNT;
        combo=Form_SYSTEM_Tune->ComboBox_records_memo_view;
        master->ConfSysAdd.MemoCount.Init(INIPAR_INTIDX,"COMMON","MemoCount",MEMO_COUNT,&MEMO_COUNT,(TComboBox*)combo);

        combo=Form_SYSTEM_Tune->ComboBox_records_memo_delete;
        master->ConfSysAdd.MemoDel.Init(INIPAR_INTIDX,"COMMON","MemoDel",MEMO_DEL,&MEMO_DEL,(TComboBox*)combo);

        combo=Form_SYSTEM_Tune->ComboBox_bufsize;
        master->ConfSysAdd.SrsBufSize.Init(INIPAR_INTIDX,"COMMON","SrsBufSize",SrsBufPSize,&SrsBufPSize,(TComboBox*)combo);

        combo=Form_SYSTEM_Tune->ComboBox_ac_file_num;
        master->ConfSysAdd.SrsBufToSave.Init(INIPAR_INTIDX,"COMMON","SrsBufToSave",SrsBufToSave,&SrsBufToSave,(TComboBox*)combo);

        editpar=Form_SYSTEM_Tune->Edit_system_name;
        master->ConfSysMain.Name.Init(INIPAR_STRING,"COMMON","Name",myname,(AnsiString*)&myname,(TEdit*)editpar);

        if (TSTest->TabVisible) s="1"; else s="0";
        bpar=TSTest->TabVisible;
        check=Form_SYSTEM_Tune->CheckBox_show_advanced;
        master->ConfSysAdd.ShowAdvanced.Init(INIPAR_BOOL,"COMMON","ShowAdvanced",s,&bpar,(TCheckBox*)check);

//bool CanCopy;

        if (CanCopy) s="1"; else s="0";
        check=Form_SYSTEM_Tune->CheckBox_can_copy;
        master->ConfSysAdd.CanCopy.Init(INIPAR_BOOL,"COMMON","CanCopy",s,&CanCopy,(TCheckBox*)check);

        if (CanSave) s="1"; else s="0";
        check=Form_SYSTEM_Tune->CheckBox_can_save;
        master->ConfSysAdd.CanSave.Init(INIPAR_BOOL,"COMMON","CanSave",s,&CanSave,(TCheckBox*)check);

        if (CBStat->Checked) s="1"; else s="0";
        check=Form_SYSTEM_Tune->CheckBox_can_info;
        master->ConfSysAdd.CanInfo.Init(INIPAR_BOOL,"COMMON","CanInfo",s,&CanInfo,(TCheckBox*)check);


        if (CanOPCDA) s="1"; else s="0";
        check=Form_SYSTEM_Tune->CheckBox_opc_da;
        CanOPCDAtmp=CanOPCDA;
        master->ConfSysAdd.CanOPCDA.Init(INIPAR_BOOL,"COMMON","CanOPCDA",s,&CanOPCDAtmp,(TCheckBox*)check);

        if (CanModbus) s="1"; else s="0";
        check=Form_SYSTEM_Tune->CheckBox_canmodbus;
        CanOPCDAtmp=CanOPCDA;
        master->ConfSysAdd.CanModbus.Init(INIPAR_BOOL,"COMMON","CanModbus",s,&CanOPCDAtmp,(TCheckBox*)check);


 //Инициализируем для закладки  ТАЙМЕРЫ

//      TmUpdateInt
        combo=Form_SYSTEM_Tune->ComboBox_timers_update_int;
        ipar=TmUpdate->Interval;
        master->ConfSysTimers.TmUpdateInt.Init(INIPAR_INTIDX,"TIMERS","TmUpdateInt",ipar,&ipar,(TComboBox*)combo);

//TmRun
        combo=Form_SYSTEM_Tune->ComboBox_timers_run;
        ipar=TmRun->Interval;
        master->ConfSysTimers.TmRun.Init(INIPAR_INTIDX,"TIMERS","TmRun",ipar,&ipar,(TComboBox*)combo);
//TmStart
        combo=Form_SYSTEM_Tune->ComboBox_timers_start;
        ipar=TmStart->Interval;
        master->ConfSysTimers.TmStart.Init(INIPAR_INTIDX,"TIMERS","TmStart",ipar,&ipar,(TComboBox*)combo);
//TmSave
        combo=Form_SYSTEM_Tune->ComboBox_timers_save;
        ipar=TmSave->Interval;
        master->ConfSysTimers.TmSave.Init(INIPAR_INTIDX,"TIMERS","TmSave",ipar,&ipar,(TComboBox*)combo);

//Инициализируем для закладки  ПАУЗЫ

//PPauseTick=100

        combo=Form_SYSTEM_Tune->ComboBox_pauses_tick;
        ipar=PPauseTick;
        master->ConfSysPauses.PPauseTick.Init(INIPAR_INTIDX,"PAUSES","PPauseTick",ipar,&ipar,(TComboBox*)combo);

//PReOpen=5000
        combo=Form_SYSTEM_Tune->ComboBox_pauses_reopen;
        ipar=PReOpen;
        master->ConfSysPauses.PReOpen.Init(INIPAR_INTIDX,"PAUSES","PReOpen",ipar,&ipar,(TComboBox*)combo);

//PClose=5000
        combo=Form_SYSTEM_Tune->ComboBox_pauses_close;
        ipar=PClose;
        master->ConfSysPauses.PClose.Init(INIPAR_INTIDX,"PAUSES","PClose",ipar,&ipar,(TComboBox*)combo);

//PExit=10000

        combo=Form_SYSTEM_Tune->ComboBox_pauses_exit;
        ipar=PExit;
        master->ConfSysPauses.PExit.Init(INIPAR_INTIDX,"PAUSES","PExit",ipar,&ipar,(TComboBox*)combo);


//Инициализируем для закладки  ТАЙМАУТЫ

//TORCom=1000
        combo=Form_SYSTEM_Tune->ComboBox_tout_rcom;
        ipar=TORCom;
        master->ConfSysTouts.TORCom.Init(INIPAR_INTIDX,"TIMEOUTS","TORCom",ipar,&ipar,(TComboBox*)combo);
//TOWCom=1000
        combo=Form_SYSTEM_Tune->ComboBox_tout_wcom;
        ipar=TOWCom;
        master->ConfSysTouts.TOWCom.Init(INIPAR_INTIDX,"TIMEOUTS","TOWCom",ipar,&ipar,(TComboBox*)combo);
//TORDat=1000
        combo=Form_SYSTEM_Tune->ComboBox_tout_rdat;
        ipar=TORDat;
        master->ConfSysTouts.TORDat.Init(INIPAR_INTIDX,"TIMEOUTS","TORDat",ipar,&ipar,(TComboBox*)combo);
//TOWDat=1000
        combo=Form_SYSTEM_Tune->ComboBox_tout_wdat;
        ipar=TOWDat;
        master->ConfSysTouts.TOWDat.Init(INIPAR_INTIDX,"TIMEOUTS","TOWDat",ipar,&ipar,(TComboBox*)combo);

//Инициализируем для закладки  ОШИБКИ

//NumRErrSrs=13
        combo=Form_SYSTEM_Tune->ComboBox_rerr;
        ipar=NumRErrSrs;
        master->ConfSysErrs.NumRErrSrs.Init(INIPAR_INTIDX,"ERRORS","NumRErrSrs",ipar,&ipar,(TComboBox*)combo);

//NumCErrSrs=13
        combo=Form_SYSTEM_Tune->ComboBox_cerr;
        ipar=NumCErrSrs;
        master->ConfSysErrs.NumCErrSrs.Init(INIPAR_INTIDX,"ERRORS","NumCErrSrs",ipar,&ipar,(TComboBox*)combo);

//Инициализируем для закладки  sleeps
//SAdrChange=16

        combo=Form_SYSTEM_Tune->ComboBox_pause_addr;
        ipar=SAdrChange;
        master->ConfSysSleeps.SAdrChange.Init(INIPAR_INTIDX,"SLEEPS","SAdrChange",ipar,&ipar,(TComboBox*)combo);

//SIdle=1

        combo=Form_SYSTEM_Tune->ComboBox_pause_cycle;
        ipar=SIdle;
        master->ConfSysSleeps.SIdle.Init(INIPAR_INTIDX,"SLEEPS","SIdle",ipar,&ipar,(TComboBox*)combo);

//SRError=0

        combo=Form_SYSTEM_Tune->ComboBox_pause_r;
        ipar=SRError;
        master->ConfSysSleeps.SRError.Init(INIPAR_INTIDX,"SLEEPS","SRError",ipar,&ipar,(TComboBox*)combo);


//SCRCError=600

        combo=Form_SYSTEM_Tune->ComboBox_pause_c;
        ipar=SCRCError;
        master->ConfSysSleeps.SCRCError.Init(INIPAR_INTIDX,"SLEEPS","SCRCError",ipar,&ipar,(TComboBox*)combo);


//------------------------------------------------------------------------------

//Запускаем форму настройки параметров системы
        Form_SYSTEM_Tune->master=master;
        Form_SYSTEM_Tune->SetViewTimer();

        Form_SYSTEM_Tune->ShowModal();

/*
//Применяем новое значение заголовка программы

        mycap+="[";
        mycap+=this->SysConfMaster.gIniFilePath;
        mycap+="]"

        Caption=mycap;
        Application->Title=Caption;
        Tray->Hint=Caption;

//Применяем новое значение имени системы
        BTPrs.Name=myname;
*/

//Применяем значения расширенных настроек системы

//Применяем номерпорта modbus
//Нужно останавливать сервер по ка неясно лучше перезапустить прогу
//!!!        Server1->Port=iport;

//        MEMO_COUNT=ipar;

//------------------------------------------------------------------------------


//Перерисовка дерева
        //FORCETREEREDRAW=true;
        //UpdateTree();
//        UpdateTV();

        break;

        case MENU_PORT:

//         sPortSelected="COM"; sPortSelected+=(BTPrs.Ps[ix-1].p+1);
//         iPortSelected=(BTPrs.Ps[ix-1].p+1);
//nPortSelected

             Form_PORT_Tune->comport=cPortSelected;
             Form_PORT_Tune->master=master;


             s.printf("PORT%d",nPortSelected);

             spar=BTPrs.Ps[nPortSelected-1].Name;
             combo=Form_PORT_Tune->ComboBox_name;
             master->ConfSysPort.Name.Init(INIPAR_STRIDX,s,"Name",spar,NULL,(TComboBox*)combo);

             spar.printf("%d",BTPrs.Ps[nPortSelected-1].CPrt->st.baud);
             combo=Form_PORT_Tune->ComboBox_baud;
             master->ConfSysPort.BaudRate.Init(INIPAR_INTIDX,s,"BaudRate",spar,NULL,(TComboBox*)combo);

             spar.printf("%d",iPortSelected);
             combo=Form_PORT_Tune->ComboBox_com;
             master->ConfSysPort.Num.Init(INIPAR_INTIDX,s,"Num",spar,NULL,(TComboBox*)combo);

             if (BTPrs.Ps[nPortSelected-1].on) spar="1"; else spar="0";
             check=Form_PORT_Tune->CheckBox_on;
             master->ConfSysPort.On.Init(INIPAR_BOOL,s,"On",spar,NULL,(TCheckBox*)check);

             spar.printf("%d",BTPrs.Ps[nPortSelected-1].NumPSrs);
             combo=Form_PORT_Tune->ComboBox_sensors_num;
             master->ConfSysPort.NumOfSensors.Init(INIPAR_INTIDX,s,"NumOfSensors",spar,NULL,(TComboBox*)combo);


             Form_PORT_Tune->nPortSelected=&nPortSelected;
             Form_PORT_Tune->SetViewTimer();
             Form_PORT_Tune->fCreate=false;
             Form_PORT_Tune->ShowModal();

             RestartPort(cPortSelected,nPortSelected);

        break;

        case MENU_SENSOR:

             Form_SENSOR_Tune->comport=cPortSelected;
             Form_SENSOR_Tune->sensor=sSensSelected;
             Form_SENSOR_Tune->master=master;
             Form_SENSOR_Tune->nSensSelected=&nSensSelected;
             Form_SENSOR_Tune->nPortSelected=&nPortSelected;
             Form_SENSOR_Tune->m_ListEmpty=0;

             s.printf("PORT%d",nPortSelected);

             //ss.printf("Name%d",nSensSelected);
             ss.printf("Name%d",nSensorOnPort);

             spar=sSensSelected->Name;
             combo=Form_SENSOR_Tune->ComboBox_name;
             master->ConfSysSensor.Namex.Init(INIPAR_STRIDX,s,ss,spar,NULL,(TComboBox*)combo);

             spar.printf("%d",sSensSelected->N+1);
             ss.printf("N%d",nSensorOnPort);
             combo=Form_SENSOR_Tune->ComboBox_gnum;
             master->ConfSysSensor.Nx.Init(INIPAR_INTIDX,s,ss,spar,NULL,(TComboBox*)combo);

             ss.printf("On%d",nSensorOnPort);
             if (sSensSelected->on) spar.printf("1"); else spar.printf("0");
             check=Form_SENSOR_Tune->CheckBox_on;
             master->ConfSysSensor.Onx.Init(INIPAR_BOOL,s,ss,spar,NULL,(TCheckBox*)check);

//Измерение ускорений
             ss.printf("AccelOn%d",nSensorOnPort);
             if (sSensSelected->isAccel) spar.printf("1"); else spar.printf("0");
             check=Form_SENSOR_Tune->CheckBox_accelOn;
             master->ConfSysSensor.AccelOnx.Init(INIPAR_BOOL,s,ss,spar,NULL,(TCheckBox*)check);


             spar.printf("%d",sSensSelected->adr);
             ss.printf("adr%d",nSensorOnPort);
             combo=Form_SENSOR_Tune->ComboBox_adr;
             master->ConfSysSensor.adrx.Init(INIPAR_INTIDX,s,ss,spar,NULL,(TComboBox*)combo);

//---

             spar.printf("%s",sSensSelected->Place);
             ss.printf("Place%d",nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_place;
             master->ConfSysSensor.Placex.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);


             spar.printf("%d",sSensSelected->SND3);
             ss.printf("SND3%d",nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_snd3;
             master->ConfSysSensor.SND3x.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",(int)sSensSelected->X0);
             ss.printf("Xo%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_xo;
             master->ConfSysSensor.Xox.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",(int)sSensSelected->Y0);
             ss.printf("Yo%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_yo;
             master->ConfSysSensor.Yox.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",(int)sSensSelected->T0);
             ss.printf("To%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_to;
             master->ConfSysSensor.Tox.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",(int)sSensSelected->InvY);
             ss.printf("InvY%d",(int)nSensorOnPort);
             check=Form_SENSOR_Tune->CheckBox_invy;
             master->ConfSysSensor.InvYx.Init(INIPAR_BOOL,s,ss,spar,NULL,(TCheckBox*)check);

             spar.printf("%d",(int)sSensSelected->RotX);
             if (spar=="(null)") spar="";
             ss.printf("RotX%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_rotx;
             master->ConfSysSensor.RotXx.Init(INIPAR_INT,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%s",sSensSelected->SetData);
             ss.printf("SetData%d",(int)nSensorOnPort);
             if (spar=="(null)") spar="";
             editpar=Form_SENSOR_Tune->Edit_setdata;
             master->ConfSysSensor.SetDatax.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%s",sSensSelected->AdjData);
             if (spar=="(null)") spar="";
             ss.printf("AdjData%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_adjdata;
             master->ConfSysSensor.AdjDatax.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%s",sSensSelected->Note);
             if (spar=="(null)") spar="";
             ss.printf("Note%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_note;
             master->ConfSysSensor.Notex.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);


             Form_SENSOR_Tune->SetViewTimer();
             Form_SENSOR_Tune->fCreate=false;
             Form_SENSOR_Tune->ShowModal();

             RestartSensor(sSensSelected, nSensSelected);

        break;

        default:
        ShowMessage("Ошибка выбора элемента системы!");

     }

        //!!!if (this->SysConfMaster.SaveCompleteFlag) HotRestart();
        //Надо предметно разбираться есть ли повод для перезагрузки

        RestartSystem(0);

}
//---------------------------------------------------------------------------


void __fastcall TFMain::MSM_aboutClick(TObject *Sender)
{
//#define MVER  2
//#define SVER  1
//#define BUILD 12

AnsiString s;
s.printf("Версия: %d.%d.%d", MVER, SVER, BUILD);
Form_about->SetVersion(s);
Form_about->ShowModal();

}
//---------------------------------------------------------------------------

void __fastcall TFMain::N5Click(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------


void __fastcall TFMain::N4Click(TObject *Sender)
{
//        if (MessageBox(NULL,"Вы действительно хотите сохранить текущую конфигурацию системы мониторинга?","ВНИМАНИЕ!",1)==IDOK) SaveSystemConf();

         AnsiString sfile;
         this->SaveDialog_conf->Filter="*.ini|*.ini";
         this->SaveDialog_conf->FileName=this->SysConfMaster.gIniFilePath;
         this->SaveDialog_conf->Execute();
         sfile=SaveDialog_conf->FileName;

         if (sfile==this->SysConfMaster.gIniFilePath) return;


         char cr[1024];
         char cw[1024];

         sprintf(cr,"%s",this->SysConfMaster.gIniFilePath);
         sprintf(cw,"%s",sfile);

         FILE* rr=fopen(cw,"rb");

         if (rr)
         {
                if (MessageBox(NULL,"Выбранный файл существует! Перезаписать?","ВНИМАНИЕ!",1)!=IDOK)
                {
                   fclose(rr);
                   return;
                }
         }



         FILE* r=fopen(cr,"rb");
         FILE* w=fopen(cw,"wb");

//Если исходного файла не было в папке
         if (r==NULL)
         {
//                TIniFile* ini=new TIniFile(cr);
//                ini->Write

                this->SysConfMaster.SaveIniPar();
                this->SysConfMaster.SaveIniParPort();
                this->SysConfMaster.SaveIniParSensor();

         }

         if (w==NULL)
         {
                ShowMessage("Ошибка открытия файла!");
                return;
         }

         if (!r==NULL)
         {
                 BYTE b=0;
                 while (fread(&b,1,1,r)) fwrite(&b,1,1,w);

                 fclose(r);
                 fclose(w);
         }

         this->SysConfMaster.gIniFilePath=sfile;

         //ShowMessage("Для работы с новой конфигурацией перезапустите программу!");

         //Close();
         this->SysConfMaster.SaveCompleteFlag=true;
         HotRestart();

}
//---------------------------------------------------------------------------




void TFMain::GetTreeViewPar(void)
{

//  MMenu_ind3->Enabled=false;
//  MMenu_and3->Enabled=false;

//Зануляем все данные по выбранному порту
  iPortSelected=0;
  cPortSelected=NULL;
  nPortSelected=0;

  AnsiString s;

  TTreeNode* sel=NULL;
  TTreeNode* presel=NULL;
  int iix=-1;

  sSensSelected=NULL;

  if(TreeView->Selected!=NULL) TreeView->Selected=TreeView->Selected;

  sel=TreeView->Selected;
  if (sel)
  {
        //presel=sel->GetPrev();

        presel=sel->Parent;

        if (presel)
        {
           iix=presel->StateIndex;
        }
  }

  MPortOn->Visible=false;MPortDel->Visible=false;MPortAdd->Visible=false;
  MSensOn->Visible=false;MSensDel->Visible=false;MSensAdd->Visible=false;

  if ((TreeView->Focused())&&(TreeView->Selected!=NULL))
  {
    int ix=TreeView->Selected->StateIndex;
    // Сервер
    if(ix==0)
    {
        mmselect=MENU_SYSTEM;
    }

    int miix=-1;

    // Порт
    if((ix>=1)&&(ix<=255))      miix=ix;
    if (ix>255)                 miix=iix;

    if (miix>0)
    {

         mmselect=MENU_PORT;
         sPortSelected="COM"; sPortSelected+=(BTPrs.Ps[miix-1].p+1);
         iPortSelected=(BTPrs.Ps[miix-1].p+1);
         cPortSelected=BTPrs.Ps[miix-1].CPrt;
         nPortSelected=miix;


         /*
         mmselect=MENU_PORT;
         sPortSelected="COM"; sPortSelected+=(BTPrs.Ps[ix-1].p+1);
         iPortSelected=(BTPrs.Ps[ix-1].p+1);
         cPortSelected=BTPrs.Ps[ix-1].CPrt;
         nPortSelected=ix;
         */
    }

    // Датчик
    if(ix>255)
    {
         mmselect=MENU_SENSOR;
        int j=(ix-1)/256-1;int i=(ix-1)&0xFF;
        //s="датчик ";s+=(BTPrs.Ps[i].Srs[j]->N+1);
        nSensSelected=(BTPrs.Ps[i].Srs[j]->N+1);
        sSensSelected=(BTPrs.Ps[i].Srs[j]);

        nSensorOnPort=j+1;

        ::Sleep(1);



        /*
//      MSetup->Enabled=true;
//      MSetup->Caption="Настройка конфигурации системы мониторинга [Датчик]";

      MSensOn->Visible=true;MSensDel->Visible=true;MSensDel->Enabled=true;
      int j=(ix-1)/256-1;int i=(ix-1)&0xFF;
      s="датчик ";s+=(BTPrs.Ps[i].Srs[j]->N+1);
      MSensOn->Enabled=true;
      MSensOn->Caption=(BTPrs.Ps[i].Srs[j]->on)?("Отключить "+s):("Подключить "+s);
      MSensDel->Caption="Удалить "+s;
      MSensDel->Enabled=!BTPrs.Ps[i].on;
        */

      }

  }

       return;
}
void __fastcall TFMain::TreeViewClick(TObject *Sender)
{
        GetTreeViewPar();
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MMenu_ind3Click(TObject *Sender)
{

        TCOMPort* com_port=NULL;
        int threadnum=0;

        if (iPortSelected==0)
        {
            ShowMessage("Необходимо выбрать порт в древовидном списке!");
            return;
        }


         //Ищем порт в общем списке
          AnsiString lport_name("");
          if (sPortSelected!="")
          {
               for (int i=0; i<BTPrs.NumPrs; i++)
               {
                   lport_name.printf("COM%d",BTPrs.Ps[i].p+1);

                   if (lport_name==sPortSelected)
                   {
                          com_port=BTPrs.Ps[i].CPrt;
                          threadnum=i;
                          break;
                    }
                }
          }


        if (com_port!=NULL)
        {

            AnsiString smsg;
            smsg.printf("Мониторинг для линии [%s] будет остановлен! Хотите продолжить?",lport_name);

            if (MessageBox(NULL,smsg.c_str(),"ВНИМАНИЕ!",1)!=IDOK)
            {
                return;
            }

             if (com_port->Protocol211!=NULL)
             {

                    if (BTPrs.Ps[threadnum].CThr)
                    {
                         BTPrs.Ps[threadnum].CThr->ServiceMode=true;
                         Form_IND3_Tune->tServiceMode=&BTPrs.Ps[threadnum].CThr->ServiceMode;
                     }

                     Form_IND3_Tune->pServiceMode=&com_port->ServiceMode;
                     com_port->ServiceMode=true;

                     Form_IND3_Tune->ComPort=com_port;
                     Form_IND3_Tune->StartTuningTimer();
                     ::Sleep(100);
                     Form_IND3_Tune->ShowModal();

             }
             else
             {
                ShowMessage("На данной линии отсутствуют устройства АН-Д3!");
             }


         }
         else
         {
                ShowMessage("Ошибка выбора порта!");
         }



}
//---------------------------------------------------------------------------

void __fastcall TFMain::MMenu_and3Click(TObject *Sender)
{
        TCOMPort* com_port=NULL;
        int threadnum=0;

        if (iPortSelected==0)
        {
            ShowMessage("Необходимо выбрать порт в древовидном списке!");
            return;
        }


         //Ищем порт в общем списке
          AnsiString lport_name("");
          if (sPortSelected!="")
          {
               for (int i=0; i<BTPrs.NumPrs; i++)
               {
                   lport_name.printf("COM%d",BTPrs.Ps[i].p+1);

                   if (lport_name==sPortSelected)
                   {
                          com_port=BTPrs.Ps[i].CPrt;
                          threadnum=i;
                          break;
                    }
                }
          }


        if (com_port!=NULL)
        {

            AnsiString smsg;
            smsg.printf("Мониторинг для линии [%s] будет остановлен! Хотите продолжить?",lport_name);

            if (MessageBox(NULL,smsg.c_str(),"ВНИМАНИЕ!",1)!=IDOK)
            {
                return;
            }

             if (com_port->Protocol211==NULL)
             {

                             if (BTPrs.Ps[threadnum].CThr)
                             {
                                BTPrs.Ps[threadnum].CThr->ServiceMode=true;
                                Form_AND3_Tune->ThrServiceMode=&BTPrs.Ps[threadnum].CThr->ServiceMode;
                             }

                         Form_AND3_Tune->ComServiceMode=&com_port->ServiceMode;
                         com_port->ServiceMode=true;


                        Form_AND3_Tune->ComPort=com_port;
                        Form_AND3_Tune->Start();
                        ::Sleep(100);
                        Form_AND3_Tune->ShowModal();
             }
             else
             {
                ShowMessage("На данной линии отсутствуют устройства АН-Д3!");
             }


         }
         else
         {
                ShowMessage("Ошибка выбора порта!");
         }

}
//---------------------------------------------------------------------------


void TFMain::PortsAudit(void)
{
        //TODO: Add your source code here

TCOMPort* com_port=NULL;
AnsiString lport_name("");
TMenuItem* PortsMenuItem[8];
AnsiString spar("");

PortsMenuItem[0]=MSM_port1;
PortsMenuItem[1]=MSM_port2;
PortsMenuItem[2]=MSM_port3;
PortsMenuItem[3]=MSM_port4;
PortsMenuItem[4]=MSM_port5;
PortsMenuItem[5]=MSM_port6;
PortsMenuItem[6]=MSM_port7;
PortsMenuItem[7]=MSM_port8;


for (int i=0; i<8; i++) PortsMenuItem[i]->Visible=false;



        for (int i=0; i<BTPrs.NumPrs; i++)
        {
             lport_name.printf("COM%d",BTPrs.Ps[i].p+1);
             com_port=BTPrs.Ps[i].CPrt;

             spar.printf("Порт%d",i+1);
             spar+=" [";
             spar+=lport_name;
             spar+="] ";

             if (com_port->Protocol211==NULL) spar+="[АН-Д3]";
             else                             spar+="[ИН-Д3]";

             PortsMenuItem[i]->Caption=spar;
             PortsMenuItem[i]->Visible=true;

         }

        return;
}

void TFMain::PortScanAndSensorAdjust(int iport)
{
        //TODO: Add your source code here
        TCOMPort* com_port=NULL;
        com_port=BTPrs.Ps[iport-1].CPrt;

        if (com_port==NULL)
        {
            ShowMessage("Ошибка выбора порта!");
            return;
        }

        if (com_port->h==INVALID_HANDLE_VALUE)
        {
            ShowMessage("Для запуска данного сервиса СОМ-порт должен быть включен в опрос и открыт!");
            return;
        }

                      AnsiString lport_name;
                     lport_name.printf("COM%d",BTPrs.Ps[iport-1].p+1);
                     int threadnum=iport-1;

                     AnsiString smsg;
                     smsg.printf("Мониторинг для линии [%s] будет остановлен! Хотите продолжить?",lport_name);

                     if (MessageBox(NULL,smsg.c_str(),"ВНИМАНИЕ!",1)!=IDOK)
                     {
                          return;
                     }

                     if (com_port->Protocol211==NULL)
                     {

                             if (BTPrs.Ps[threadnum].CThr)
                             {
                                BTPrs.Ps[threadnum].CThr->ServiceMode=true;
                                Form_AND3_Tune->ThrServiceMode=&BTPrs.Ps[threadnum].CThr->ServiceMode;
                             }

                         Form_AND3_Tune->ComServiceMode=&com_port->ServiceMode;
                         com_port->ServiceMode=true;


                        Form_AND3_Tune->ComPort=com_port;
                        Form_AND3_Tune->Start();
                        ::Sleep(100);
                        Form_AND3_Tune->ShowModal();

                     }
                     else
                     {

                             if (BTPrs.Ps[threadnum].CThr)
                             {
                                BTPrs.Ps[threadnum].CThr->ServiceMode=true;
                                Form_IND3_Tune->tServiceMode=&BTPrs.Ps[threadnum].CThr->ServiceMode;
                             }
                             Form_IND3_Tune->pServiceMode=&com_port->ServiceMode;
                             com_port->ServiceMode=true;

                             Form_IND3_Tune->ComPort=com_port;
                             Form_IND3_Tune->StartTuningTimer();
                             ::Sleep(100);
                             Form_IND3_Tune->ShowModal();
                     }



        return;


}


void __fastcall TFMain::MSM_manualClick(TObject *Sender)
{
    wchar_t wdir[1024];
    ::GetCurrentDirectoryW(1024,wdir);

    ShellExecuteW(NULL,NULL,L"GorizontServer.pdf",L"",wdir,0);

//    ShellExecuteW(NULL,NULL,L"http://www.ntpgorizont.ru/wp-content/uploads/%D0%A0%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE-%D0%BF%D0%BE-%D1%8D%D0%BA%D1%81%D0%BF%D0%BB%D1%83%D0%B0%D1%82%D0%B0%D1%86%D0%B8%D0%B8-%D0%90%D0%9D-%D0%943R5.pdf",L"",wdir,0);

//    http://www.ntpgorizont.ru/wp-content/uploads/%D0%A0%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE-%D0%BF%D0%BE-%D1%8D%D0%BA%D1%81%D0%BF%D0%BB%D1%83%D0%B0%D1%82%D0%B0%D1%86%D0%B8%D0%B8-%D0%90%D0%9D-%D0%943R5.pdf

//    ::Sleep(100);
//     system("GorizontServer.pdf");
}
//---------------------------------------------------------------------------


void __fastcall TFMain::MSM_port1Click(TObject *Sender)
{
   PortScanAndSensorAdjust(1);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MSM_port2Click(TObject *Sender)
{
   PortScanAndSensorAdjust(2);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MSM_port3Click(TObject *Sender)
{
   PortScanAndSensorAdjust(3);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MSM_port4Click(TObject *Sender)
{
   PortScanAndSensorAdjust(4);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MSM_port5Click(TObject *Sender)
{
   PortScanAndSensorAdjust(5);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MSM_port6Click(TObject *Sender)
{
   PortScanAndSensorAdjust(6);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MSM_port7Click(TObject *Sender)
{
   PortScanAndSensorAdjust(7);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MSM_port8Click(TObject *Sender)
{
   PortScanAndSensorAdjust(8);
}
//---------------------------------------------------------------------------


void TFMain::SaveSystemConf(void)
{
   //TODO: Add your source code here

   ShowMessage("Навая конфигурация системы мониторинга сохранена!");

   ConfSave=false;
}

TFMain::SysConfMasterInit()
{
/*
        //TODO: Add your source code here
        TSysConfMaster* master=&SysConfMaster;

        TEdit* editpar=NULL;
        editpar=Form_SYSTEM_Tune->Edit_program_title;

        //void Init(MonSysIniParType type, AnsiString section, AnsiString par, AnsiString val, void* syspar, void* ctrl);
        master->ConfSysMain.Caption.Init(INIPAR_STRING,"COMMON","Caption","Gorizont Server",NULL,(TEdit*)editpar);
*/
}

void __fastcall TFMain::N14Click(TObject *Sender)
{
         AnsiString sfile;
         this->OpenDialog_conf->Filter="*.ini|*.ini";
         this->OpenDialog_conf->FileName=this->SysConfMaster.gIniFilePath;
         this->OpenDialog_conf->Execute();
         sfile=OpenDialog_conf->FileName;

         if (sfile==this->SysConfMaster.gIniFilePath) return;


          /*
         char cr[1024];
         char cw[1024];

         sprintf(cr,"%s",this->SysConfMaster.gIniFilePath);
         sprintf(cw,"%s",sfile);

         FILE* rr=fopen(cw,"rb");

         if (rr)
         {
                MessageBox(NULL,"Выбранный файл существует!","ВНИМАНИЕ!",0);
                {
                   fclose(rr);
                   return;
                }
         }



         FILE* r=fopen(cr,"rb");
         FILE* w=fopen(cw,"wb");

         if ((r==NULL)||(w==NULL))
         {
                ShowMessage("Ошибка открытияфайла!");
                return;
         }

         BYTE b=0;


         while (fread(&b,1,1,r)) fwrite(&b,1,1,w);

         fclose(r);
         fclose(w);
           */


         if (sfile.Pos(".ini")==0) sfile=sfile+".ini";

         this->SysConfMaster.gIniFilePath=sfile;

         //ShowMessage("Для работы с новой конфигурацией перезапустите программу!");

         //Close();

         SysConfMaster.SaveCompleteFlag=true;       
         HotRestart();


}
//---------------------------------------------------------------------------
/*
 Доавить новый датчик к списку на данном порту
*/
void __fastcall TFMain::MSensAddClick(TObject *Sender)
{
//Опрос выделенных компонент дерева
    GetTreeViewPar();
//Номер порта в системе к которому добавим датчик
    int nport=nPortSelected;
//Указатель на порт к которому добавляем датчик
    TCOMPort* cport=cPortSelected;


    if (nport==0)
    {
        ShowMessage("Ошибка выбора порта в системе!");
        return;
    }

//Вызов добавления датчика

    this->SysConfMaster.SensorAdd(nport,cport);


}
//---------------------------------------------------------------------------


void TFMain::HotRestart()
{
        //TODO: Add your source code here

        if (this->SysConfMaster.SaveCompleteFlag==false) return;

        ShowMessage("Для всупленияв силу изменений в конфигурации программа будет перезапущена!");
        GRestartFlag=true;

           //strcat(MainCurrentDirectory,"\\GSStarter.exe");
           //ShellExecute(NULL,NULL,MainCurrentDirectory,NULL,NULL,0);
 //          ::Sleep(500);
//           exit(0);



        Close();
}


void __fastcall TFMain::MFile_newClick(TObject *Sender)
{

         char dir[1024];
         GetCurrentDirectory(1024,dir);

         strcat(dir,"\\Config\\NewGorizontServer.ini");

         AnsiString sfile;
         this->SaveDialog_conf->Filter="*.ini|*.ini";
         this->SaveDialog_conf->FileName=dir;//this->SysConfMaster.gIniFilePath;
         if (this->SaveDialog_conf->Execute()!=IDOK) return;
         sfile=SaveDialog_conf->FileName;

         if (sfile==this->SysConfMaster.gIniFilePath) return;


         char cr[1024];
         char cw[1024];

         sprintf(cr,"%s",this->SysConfMaster.gIniFilePath);
         sprintf(cw,"%s",sfile);

         FILE* rr=fopen(cw,"rb");



         if (rr)
         {
                MessageBox(NULL,"Выбранный файл уже используется!","ВНИМАНИЕ",0);
                {
                   fclose(rr);
                   return;
                }
         }


         fclose (rr);

/*
         FILE* r=fopen(cr,"rb");
         FILE* w=fopen(cw,"wb");

         if ((r==NULL)||(w==NULL))
         {
                ShowMessage("Ошибка открытия файла!");
                return;
         }

         BYTE b=0;


         while (fread(&b,1,1,r)) fwrite(&b,1,1,w);

         fclose(r);
         fclose(w);
*/



         char dd[1024];
         sprintf(dd,"%s",sfile);

         if (strstr(dd,"\\NewGorizontServer.ini"))
         {
                MessageBox(NULL,"Данное имя файла зарезервировано! Выберите другое имя файла.","ВНИМАНИЕ!",0);
                return;
         }


         this->SysConfMaster.gIniFilePath=sfile;

         this->SysConfMaster.lIniFile->WriteString("GLOBALS","ConfPath",sfile);

         TIniFile* ini=new TIniFile(sfile);

         this->gIniFile=ini;

         ini->WriteString  ("Common","Caption","Новая система");
         ini->WriteString  ("Common","Name","Новая система");
         ini->WriteInteger ("Common","NumOfPorts",0);
         //ini->WriteInteger ("Common","CanClose",1);



//         ini->WriteInteger ("Common","CanCopy",1);

         //ini->WriteInteger ("Port1","BaudRate",115200);
         //ini->WriteInteger ("Port1","Num",1);

        //this->SysConfMaster.SaveIniPar();

         /*
         ini->WriteInteger ("Port1","NumOfSensors",0);
         ini->WriteInteger ("Port1","Num",1);
         ini->WriteInteger ("Port1","On",0);
         AnsiString spar   ("Стандартный СОМ-порт");
         ini->WriteString  ("Port1","Name",spar);
         */

         //ShowMessage("Для работы с новой конфигурацией перезапустите программу!");

         //Close();
        this->SysConfMaster.SaveCompleteFlag=true;
        HotRestart();

}
//---------------------------------------------------------------------------

void __fastcall TFMain::N_backupClick(TObject *Sender)
{
        this->SysConfMaster.BackUp(1);
        this->SysConfMaster.SaveCompleteFlag=true;
        HotRestart();
}
//---------------------------------------------------------------------------

void __fastcall TFMain::MM_dataprocClick(TObject *Sender)
{

        AnsiString s;
        TCheckBox* check;
        TCheckBox* check1;
        bool tmpSaveAccTxt;
        TComboBox* combo;

        combo=Form_DataProc_Tune->ComboBox_ac_file_num;
        SysConfMaster.ConfSysAdd.SrsBufToSave.Init(INIPAR_INTIDX,"COMMON","SrsBufToSave",SrsBufToSave,&SrsBufToSave,(TComboBox*)combo);

        check=Form_DataProc_Tune->CheckBox_cansave;
        if (CanSave) s="1"; else s="0";
        SysConfMaster.ConfSysAdd.CanSave.Init(INIPAR_BOOL,"COMMON","CanSave",s,&CanSave,(TCheckBox*)check);

        check1=Form_DataProc_Tune->CheckBox_saveacctxt;
        if (SaveAccTxt) s="1"; else s="0";
        SysConfMaster.ConfSysAdd.SaveAccTxt.Init(INIPAR_BOOL,"COMMON","SaveAccTxt",s,&tmpSaveAccTxt,(TCheckBox*)check1);

        Form_DataProc_Tune->master=&this->SysConfMaster;
        Form_DataProc_Tune->SetViewTimer();
        Form_DataProc_Tune->ShowModal();

        //HotRestart();
        RestartSystem(0);

}
//---------------------------------------------------------------------------


void __fastcall TFMain::N7Click(TObject *Sender)
{
        //ipport MODBUS

        int iport=0;
        TEdit* editpar;
        AnsiString s("");
        TCheckBox* check;

        iport=Server1->Port;
        editpar=Form_Interfaces_Tune->Edit_modbus_port;
        SysConfMaster.ConfSysAdd.IPPort1.Init(INIPAR_INT,"COMMON","IPPort1",iport,(int*)&iport,(TEdit*)editpar);

        if (CanModbus) s="1"; else s="0";
        check=Form_Interfaces_Tune->CheckBox1;
        bool CanOPCDAtmp=CanOPCDA;
        SysConfMaster.ConfSysAdd.CanModbus.Init(INIPAR_BOOL,"COMMON","CanModbus",s,&CanOPCDAtmp,(TCheckBox*)check);


        Form_Interfaces_Tune->master=&this->SysConfMaster;
        Form_Interfaces_Tune->SetViewTimer();
        Form_Interfaces_Tune->ShowModal();
        //HotRestart();
        RestartSystem(0);

}
//---------------------------------------------------------------------------



void TFMain::RestartSystem(int par)
{
//TODO: Add your source code here

//INI(true);
//return;//!!!

AnsiString stmp("");
TTreeNode  *LI;

int oldportmbus=0;
int newserverport=0;

int oldbufsize=0;
int newbufsize=0;
int newSrsBufToSave=0;

int newtimer=0;

bool newSaveAccTxt=false;

        switch (par)
        {
//----------------Базовые параметры систмеы-------------------------
           case 0:
//----------------Заголовок главного окна программы-------------------------
                //Из текущего ини читаем заголовок главного окна программы
                    stmp=ChangeFileExt(ExtractFileName(Application->ExeName),"");
                    Caption=gIniFile->ReadString("Common","Caption",stmp+" (Создана новая система "+stmp+".ini)");
                //Дополнительное хранилище оно понадобится при настройке параметров системы
                    CCaption=Caption;
                //Применяем в главном окне
                    Caption=Caption+" [";
                    Caption=Caption+this->SysConfMaster.gIniFilePath;
                    Caption=Caption+"]";

                //BTPorts - это "куст" СОМ портов от одного BT загружаем имя куста
                    BTPrs.Name=gIniFile->ReadString("Common","Name","Новая система");
                    LI=TreeView->Items->GetFirstNode();
                    LI->Text=BTPrs.Name;

                //сворачивать в трей при запуске
                fOpenHid=gIniFile->ReadBool("Common","CanHide",false); //

                //сворачивать в трей при запуске
                fCanclose=gIniFile->ReadBool("Common","CanClose",false); //

                //сворачивать в трей при запуске
                CanModbus=gIniFile->ReadBool("Common","CanModbus",false); //

                newSaveAccTxt=gIniFile->ReadBool("Common","SaveAccTxt",false);

                if (CanModbus==true)
                {
                   Server1->Active=true;
                }
                else
                {
                   Server1->Active=false;
                   Server1->Close();
                }

                oldportmbus=Server1->Port;
                newserverport=gIniFile->ReadInteger("Common","IPPort1",502);
                MEMO_COUNT=gIniFile->ReadInteger("Common","MemoCount",60);
                //количество записей во вкладке измерений, которые удаляются после переполнения
                MEMO_DEL=gIniFile->ReadInteger("Common","MemoDel",1);

                // Размер в пакетах циклического буфера акселерометра. Каждый пакет содержит измерения ускорений по двум каналам X и Y
                newbufsize=gIniFile->ReadInteger("Common","SrsBufSize",8192);
                newSrsBufToSave=gIniFile->ReadInteger("Common","SrsBufToSave",1);

                CanSave=gIniFile->ReadBool("Common","CanSave",true);
                CanCopy=gIniFile->ReadBool("Common","CanCopy",true);

                // Таймеры -----------------------------------------
                newtimer=gIniFile->ReadInteger("Timers","TmUpdateInt",100);
                if (TmUpdate->Interval!=newtimer)                 HotRestart();

                newtimer=gIniFile->ReadInteger("Timers","TmSave",1000);
                if (TmSave->Interval!=newtimer)                   HotRestart();

                newtimer=gIniFile->ReadInteger("Timers","TmRun",1000);
                if (TmRun->Interval!=newtimer)                    HotRestart();

                newtimer=gIniFile->ReadInteger("Timers","TmStart",1000);
                if (TmStart->Interval!=newtimer)                  HotRestart();

                //  Паузы-------------------------------------------
                PPauseTick=gIniFile->ReadInteger("Pauses","PPauseTick",100);
                PReOpen=gIniFile->ReadInteger("Pauses","PReOpen",5000);
                PClose=gIniFile->ReadInteger("Pauses","PClose",5000);
                PExit=gIniFile->ReadInteger("Pauses","PExit",0);

               //  Задержки-------------------------------------------
                SAdrChange=gIniFile->ReadInteger("Sleeps","SAdrChange",16);
                SIdle=gIniFile->ReadInteger("Sleeps","SIdle",1);
                SRError=gIniFile->ReadInteger("Sleeps","SRError",0);
                SCRCError=gIniFile->ReadInteger("Sleeps","SCRCError",600);

                //  Таймауты-------------------------------------------
                TORCom=gIniFile->ReadInteger("TimeOuts","TORCom",200);
                TOWCom=gIniFile->ReadInteger("TimeOuts","TOWCom",100);
                TORDat=gIniFile->ReadInteger("TimeOuts","TORDat",4000);
                TOWDat=gIniFile->ReadInteger("TimeOuts","TOWDat",2000);

                //  Ошибки-------------------------------------------
                NumRErrSrs=gIniFile->ReadInteger("Errors","NumRErrSrs",10);
                NumCErrSrs=gIniFile->ReadInteger("Errors","NumCErrSrs",10);

            break;

//----------------Базовые параметры систмеы-------------------------
            case 1:

            break;

            case 2:

            break;
        }

        if (oldportmbus!=newserverport)                   HotRestart();
        if (SrsBufPSize!=newbufsize)                      HotRestart();
        if (newSrsBufToSave!=SrsBufToSave)                HotRestart();
        if (newSaveAccTxt!=SaveAccTxt)                HotRestart();

}

void TFMain::RestartPort(TCOMPort* port, int pnum)
{
        //TODO: Add your source code here
//Закрываем выбранный СОМ-порт

        if (port==NULL) return;
        port->Close();

        AnsiString section;
        section.printf("PORT%d",pnum);

//Читаем скорость
      long num=gIniFile->ReadInteger(section,"Num",1);
      BTPrs.Ps[pnum-1].p=num-1;

//Читаем скорость
      DWORD BaudRate=gIniFile->ReadInteger(section,"BaudRate",115200);
//      BTPrs.Ps[pnum-1].CPrt->br=BaudRate;
      BTPrs.Ps[pnum-1].CPrt->dcb.BaudRate=BaudRate;
      BTPrs.Ps[pnum-1].CPrt->st.baud=BaudRate;

//Читаем комментарий, все заносим в структуру
      BTPrs.Ps[pnum-1].Name=gIniFile->ReadString(section,"Name","Стандартный СОМ-порт");
//Смотрим включен ли в опрос
      bool run=gIniFile->ReadBool(section,"On",false);
      BTPrs.Ps[pnum-1].on=run;

}

void TFMain::RestartSensor(TBTSensor* sensor, int snum)
{
        //TODO: Add your source code here

        if (sensor==NULL) return;

        AnsiString section;
        AnsiString key;

        section.printf("PORT%d",nPortSelected);

        key.printf("Name%d",nSensorOnPort);
        sensor->Name=gIniFile->ReadString(section,key,"ИН-Д3");

        key.printf("On%d",nSensorOnPort);
        sensor->on=gIniFile->ReadBool(section,key,false);

        key.printf("AccelOn%d",nSensorOnPort);
        sensor->isAccel=gIniFile->ReadBool(section,key,false);

        key.printf("Adr%d",nSensorOnPort);
        sensor->adr=gIniFile->ReadInteger(section,key,false);

        key.printf("Place%d",nSensorOnPort);
        sensor->Place=gIniFile->ReadString(section,key,"ИН-Д3");


        key.printf("Xo%d",nSensorOnPort);
        sensor->X0=gIniFile->ReadFloat(section,key,0);

        key.printf("Yo%d",nSensorOnPort);
        sensor->Y0=gIniFile->ReadFloat(section,key,0);

        key.printf("To%d",nSensorOnPort);
        sensor->T0=gIniFile->ReadFloat(section,key,0);

        key.printf("InvY%d",nSensorOnPort);
        sensor->InvY=gIniFile->ReadBool(section,key,false);

        key.printf("RotX%d",nSensorOnPort);
        sensor->RotX=gIniFile->ReadBool(section,key,false);

        key.printf("SetData%d",nSensorOnPort);
        sensor->SetData=gIniFile->ReadString(section,key,"Нет данных");

        key.printf("AdjData%d",nSensorOnPort);
        sensor->AdjData=gIniFile->ReadString(section,key,"Нет данных");

        key.printf("Note%d",nSensorOnPort);
        sensor->Note=gIniFile->ReadString(section,key,"Нет данных");


        return;
}

void TFMain::SetExtendedMode()
{
        //TODO: Add your source code here
        AnsiString psw("");
        Form_enter_password->psw=&psw;
        Form_enter_password->ShowModal();

        if (psw=="321456")
        {
             Form_SYSTEM_Tune->TabSheet2->TabVisible=true;
             ShowMessage("Режим администратора включен!");
        }
}
