//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_IND3_Tune *Form_IND3_Tune;
//---------------------------------------------------------------------------
__fastcall TForm_IND3_Tune::TForm_IND3_Tune(TComponent* Owner)
        : TForm(Owner)
{
       ComPort=NULL;
       tServiceMode=NULL;
       pServiceMode=NULL;
}
//---------------------------------------------------------------------------

void TForm_IND3_Tune::StartTuning(void)
{

//        cport.Open(true,3,NULL);
//        ComPort=&cport;

        this->Button_Apply->Enabled=false;                                                                                                                 

        Timer_exec->Enabled=false;

        gtimeout=200;

        this->ComboBox_baud_rate->Enabled=false;

        this->Button_check_addr->Enabled=false;

        ComPort->ServiceMode=true;

        this->ComboBox_com_number->Text=IntToStr(ComPort->st.p+1);
        this->ComboBox_com_number->Enabled=false;

        this->ComboBox_com_baud_rate->ItemIndex=-1;

        this->ComboBox_com_baud_rate->Clear();
        this->ComboBox_com_baud_rate->Items->Add(115200);
        this->ComboBox_com_baud_rate->Items->Add(57600);
        this->ComboBox_com_baud_rate->Items->Add(38400);
        this->ComboBox_com_baud_rate->Items->Add(19200);
        this->ComboBox_com_baud_rate->Items->Add(9600);
        this->ComboBox_com_baud_rate->Items->Add(4800);
        this->ComboBox_com_baud_rate->Items->Add(2400);
        this->ComboBox_com_baud_rate->Items->Add(1200);

        switch(ComPort->st.baud)
        {

                case 115200:
                        this->ComboBox_com_baud_rate->ItemIndex=0;
                        gtimeout=25;
                break;

                case 57600:
                        this->ComboBox_com_baud_rate->ItemIndex=1;
                        gtimeout=25;
                break;

                case 38400:
                        this->ComboBox_com_baud_rate->ItemIndex=2;
                        gtimeout=50;
                break;

                case 19200:
                        this->ComboBox_com_baud_rate->ItemIndex=3;
                        gtimeout=50;
                break;

                case 9600:
                        this->ComboBox_com_baud_rate->ItemIndex=4;
                        gtimeout=100;
                break;

                case 4800:
                        this->ComboBox_com_baud_rate->ItemIndex=5;
                        gtimeout=100;
                break;

                case 2400:
                        this->ComboBox_com_baud_rate->ItemIndex=6;
                        gtimeout=150;
                break;

                case 1200:
                        this->ComboBox_com_baud_rate->ItemIndex=7;
                        gtimeout=200;
                break;

        }


//        this->ComboBox_com_baud_rate->Text=IntToStr(ComPort->st.baud);

        this->ComboBox_com_baud_rate->Enabled=false;

        if (ComPort->st.on) this->Button_com_open->Caption="Закрыть";
        else                this->Button_com_open->Caption="Открыть";

        this->Button_com_open->Enabled=false;

        if (Pr211==NULL)
        {
                Pr211=new TProtocol_211;
        }

        this->ComboBox_addr->Clear();

        Pr211->sensorsList->Clear();
        this->ProgressBar1->Min=0;
        this->ProgressBar1->Max=255;
        this->ProgressBar1->Position=0;
        scan_addr=0;
        sfaddr="";
        sfname="";
        this->Label2->Caption="Ждите! Идет сканирование датчиков на линии";
        scount=0;
        manualstop=true;


        this->ComboBox_averaging_tacts->Clear();
        this->ComboBox_averaging_tacts->Items->Add("1");
        this->ComboBox_averaging_tacts->Items->Add("2");
        this->ComboBox_averaging_tacts->Items->Add("4");
        this->ComboBox_averaging_tacts->Items->Add("8");
        this->ComboBox_averaging_tacts->Items->Add("16");
        this->ComboBox_averaging_tacts->Items->Add("32");

        this->ComboBox_averaging_period->Clear();
        this->ComboBox_averaging_period->Items->Add("10");
        this->ComboBox_averaging_period->Items->Add("20");
        this->ComboBox_averaging_period->Items->Add("50");
        this->ComboBox_averaging_period->Items->Add("100");

        this->ComboBox_baud_rate->Clear();
        this->ComboBox_baud_rate->Items->Add("115200");
        this->ComboBox_baud_rate->Items->Add("57600");
        this->ComboBox_baud_rate->Items->Add("38400");
        this->ComboBox_baud_rate->Items->Add("19200");
        this->ComboBox_baud_rate->Items->Add("9600");
        this->ComboBox_baud_rate->Items->Add("4800");
        this->ComboBox_baud_rate->Items->Add("2400");
        this->ComboBox_baud_rate->Items->Add("1200");

        Button_stop_scanClick(NULL);

        processflag=true;

        offset_X=0;
        offset_Y=0;

}

void TForm_IND3_Tune::StopTuning(void)
{
/*
        if (Pr211!=NULL)
        {
         delete Pr211;
         Pr211=NULL;
        }
*/
}

void __fastcall TForm_IND3_Tune::FormClose(TObject *Sender,
      TCloseAction &Action)
{
        StopTuning();
}
//---------------------------------------------------------------------------

int is_number(char smb);

void __fastcall TForm_IND3_Tune::Button_ApplyClick(TObject *Sender)
{

this->Button_Apply->Enabled=false;
processflag=true;

char cpar[64];
int res=0;
int ipar=0;
unsigned long  ulpar=0;
unsigned short uspar=0;
unsigned int   uipar=0;
double offX,offY=0;
BYTE uX,uY=0;
AnsiString spar("");
unsigned char ucpar=0;

this->Label2->Caption="Ждите! Идет выполнение операций!";
this->Update();

ComPort->PurgeCom();

Pr211->ReadIND3SensorMeterName(scan_addr,cpar);

spar=this->LabeledEdit_name->Text;

if (strcmp(spar.c_str(),cpar)!=0)
{
    strcpy(cpar,spar.c_str());
    SetMeterName(scan_addr,cpar);
}


Pr211->ReadIND3SensorAveragingTacts(scan_addr,&ipar);
if (ipar!=StrToInt(this->ComboBox_averaging_tacts->Text))
{
   ipar=StrToInt(this->ComboBox_averaging_tacts->Text);
   SetAveragingTacts(scan_addr,ipar);
}

Pr211->ReadIND3SensorAveragingPeriod(scan_addr,&ipar);
if (ipar!=StrToInt(this->ComboBox_averaging_period->Text))
{
   ipar=StrToInt(this->ComboBox_averaging_period->Text);
   SetAveragingPeriod(scan_addr,ipar);
}


if ((Pr211->ReadIND3SensorBaudRate(scan_addr,&ipar))!=0) return;
if (ipar!=StrToInt(this->ComboBox_baud_rate->Text))
{
    ipar=StrToInt(this->ComboBox_baud_rate->Text);
    SetBaudRate(scan_addr,ipar);
    processflag=false;
    return;//После смены скорости связи с датчиком не будет
}

if ((offset_X!=LabeledEdit_offset_X->Text)||(offset_Y!=LabeledEdit_offset_Y->Text))
{

double xx=0,yy=0;
BYTE uux=0,uuy=0;
char dbuf[64];
bool point=false;
bool seconds=false;
char sm;

strcpy(dbuf,this->LabeledEdit_offset_X->Text.c_str());
//if (strstr(dbuf,"''")) uux=0;
//else  uux=1;

for (int i=0; i<strlen(dbuf); i++)
{
     sm=dbuf[i];

     if (sm=='.')
       dbuf[i]=',';
     if (sm=='\'')
       dbuf[i]=0;

}


        try
        {
                xx=StrToFloat(dbuf);
        }
        catch (...)
        {
                ShowMessage("Неправильный десятичный формат!");
                return;
        }


strcpy(dbuf,this->LabeledEdit_offset_Y->Text.c_str());
//if (strstr(dbuf,"''''")) uuy=0;
//else  uuy=1;

for (int i=0; i<strlen(dbuf); i++)
{
      sm=dbuf[i];

      if (sm=='.')
       dbuf[i]=',';
      if (sm=='\'')
       dbuf[i]=0;
}


        try
        {
                yy=StrToFloat(dbuf);
        }
        catch (...)
        {
                ShowMessage("Неправильный десятичный формат!");
                return;
        }


this->SetZeroOffset(scan_addr,xx,yy,uux,uuy);

}

AllRequest(scan_addr);


this->Timer_exec->Interval=500;
this->Timer_exec->Enabled=true;

//this->Label2->Caption="";
//processflag=false;

}
//---------------------------------------------------------------------------

void TForm_IND3_Tune::WriteComPort(BYTE* buf, int len)
{

        bool bres=false;
        for(int i=0; i<len; i++)
        {
                bres=ComPort->PortNWrite(1,&buf[i]);
        }

}

void __fastcall TForm_IND3_Tune::Button_exitClick(TObject *Sender)
{
      if(tServiceMode!=NULL) *tServiceMode=false;
      if(pServiceMode!=NULL) *pServiceMode=false;

//        this->Hide();
//this->Visible=false;
      Close();
}


int TForm_IND3_Tune::ReadContinue(int* len)
{
        int idx=*len;

/*
        while(ComPort->BytesAvilable())
        {
             ComPort->PortNRead(1,&buf[idx]);
             idx++;
        }

        *len=idx;
        return 0;//!!!
*/

        while (buf[idx-1]!=0x7E)
        {
                ComPort->PortNRead(1,&buf[idx]);
                if (buf[idx]==0x7E) break;
                idx++;
                if (idx>100) return -1;
        }
        idx++;
        *len=idx;

        return 0;
}

int TForm_IND3_Tune::NameRequest(unsigned char addr, char* name)
{

char cpar[64];
bool bres=false;
int len=0;
int res=0;

        memset(cpar,0,64);
//        ComPort->SetTimeouts(20,20);

        ComPort->SetTimeouts(gtimeout,gtimeout);

        memset(buf,0,1024);
        Pr211->RequestSensorMeterName(addr,buf,&len);
        bres=ComPort->PortNWriteTune(len,buf);
        memset(buf,0,1024);
        len=6;
        ComPort->PortNRead(len,buf);
        if (buf[0]!=0x7E) return - 1;

        if (ReadContinue(&len)==0)
                 Pr211->AddIND3Sensor(addr);

         res=Pr211->packet_proc(buf,len);

         if (res==0)
         {
              Pr211->ReadIND3SensorMeterName(addr,cpar);
              memcpy(name,cpar,strlen(cpar));
              return 0;
         }
         else return res;
}

//---------------------------------------------------------------------------

int TForm_IND3_Tune::MeterVersionRequest(unsigned char addr, char* cres)
{

char cpar[64];
bool bres=false;
int len=0;
int res=0;

        memset(cpar,0,64);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        memset(buf,0,1024);
        Pr211->RequestMeterVerion(addr,buf,&len);
        bres=ComPort->PortNWriteTune(len,buf);
        memset(buf,0,1024);
        len=6;
        ComPort->PortNRead(len,buf);
        if (buf[0]!=0x7E) return - 1;

         ReadContinue(&len);

         res=Pr211->packet_proc(buf,len);

         if (res==0)
         {
              Pr211->ReadIND3SensorMeterVerion(addr,cpar);
              memcpy(cres,cpar,5);
              return 0;
         }
         else return res;


}

//---------------------------------------------------------------------------

int TForm_IND3_Tune::BaudRateRequest(unsigned char addr, int* ires)
{
char cpar[64];
bool bres=false;
int len=0;
int res=0;

        memset(cpar,0,64);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        memset(buf,0,1024);
        Pr211->RequestSensorBaudRate(addr,buf,&len);
        bres=ComPort->PortNWriteTune(len,buf);
        memset(buf,0,1024);
        len=6;
        ComPort->PortNRead(len,buf);
        if (buf[0]!=0x7E) return - 1;

        ReadContinue(&len);
        res=Pr211->packet_proc(buf,len);

        if (res==0)
        {
              Pr211->ReadIND3SensorBaudRate(addr,ires);
              return 0;
        }
        else return res;
}

//---------------------------------------------------------------------------


void __fastcall TForm_IND3_Tune::Timer_scanTimer(TObject *Sender)
{
char cpar[64];

this->Timer_scan->Enabled=false;
scan_addr++;
AnsiString spar("");

spar.printf("Ждите! Идет сканирование датчиков [%d]", scan_addr);

        memset(cpar,0,64);
        this->Label2->Caption=spar;
        this->ProgressBar1->Position=scan_addr;

        if (NameRequest(scan_addr,cpar)==0)
        {
             this->LabeledEdit_name->Text=cpar;
             this->ComboBox_addr->Items->Add(IntToStr(scan_addr));
             this->ComboBox_addr->Text=IntToStr(scan_addr);

             if (sfaddr=="") sfaddr=IntToStr(scan_addr);
             if (sfname=="") sfname=cpar;

             this->LabeledEdit_name->Text=cpar;
             scount++;
        }
        else
        {
                Sleep(5);
                if (NameRequest(scan_addr,cpar)==0)
                {
                     this->LabeledEdit_name->Text=cpar;
                     this->ComboBox_addr->Items->Add(IntToStr(scan_addr));
                     this->ComboBox_addr->Text=IntToStr(scan_addr);

                     if (sfaddr=="") sfaddr=IntToStr(scan_addr);
                     if (sfname=="") sfname=cpar;

                     this->LabeledEdit_name->Text=cpar;
                     scount++;
                }
                else
                {/*
                        Sleep(10);
                        if (NameRequest(scan_addr,cpar)==0)
                        {
                             this->LabeledEdit_name->Text=cpar;
                             this->ComboBox_addr->Items->Add(IntToStr(scan_addr));
                             this->ComboBox_addr->Text=IntToStr(scan_addr);

                             if (sfaddr=="") sfaddr=IntToStr(scan_addr);
                             if (sfname=="") sfname=cpar;

                             this->LabeledEdit_name->Text=cpar;
                             scount++;
                        }*/
                }


        }

        if ((scan_addr>253)||(manualstop==true))
        {
               this->Button_stop_scan->Caption="Сканировать";

               this->Timer_scan->Enabled=false;

//               this->Button_Apply->Enabled=true;
               this->Button_exit->Enabled=true;
               this->ComboBox_addr->Enabled=true;
               this->LabeledEdit_name->Enabled=true;

               //this->Label1->Enabled=true;


               this->ProgressBar1->Position=0;
               this->Label2->Caption="";

               this->ComboBox_addr->Text=sfaddr;
               this->LabeledEdit_name->Text=sfname;

               spar.printf("Всего обнаружено датчиков на линии [%d]", scount);

               memset(cpar,0,64);
               this->Label2->Caption=spar;
               manualstop=true;

               if (scan_addr>253) this->Button_check_addr->Enabled=true;

               if (sfaddr!="")
               {
                    scan_addr=(unsigned char)StrToInt(sfaddr);
                    AllRequest((unsigned char)StrToInt(sfaddr));
                    this->Button_Apply->Enabled=false;
                    processflag=false;
               }

        }
        else
        {
             this->Timer_scan->Interval=25;
             this->Timer_scan->Enabled=true;
        }

}
//---------------------------------------------------------------------------

void __fastcall TForm_IND3_Tune::FormCreate(TObject *Sender)
{
this->Timer_scan->Enabled=false;
this->Timer_start->Enabled=false;
this->Timer_start->Interval=250;
}
//---------------------------------------------------------------------------

void __fastcall TForm_IND3_Tune::Button_stop_scanClick(TObject *Sender)
{
    AnsiString spar;

    if (manualstop==false)
    {
       manualstop=true;
       this->Button_stop_scan->Caption="Сканировать";
       this->LabeledEdit_name->Text="";


       /*
       this->Timer_scan->Enabled=true;
       this->Button_Apply->Enabled=true;
       this->Button_exit->Enabled=true;
       this->ComboBox_addr->Enabled=true;
       this->LabeledEdit_name->Enabled=true;
       this->Label1->Enabled=true;
       this->ProgressBar1->Position=0;
       this->Label2->Caption="";
       this->ComboBox_addr->Text=sfaddr;
       spar.printf("Всего обнаружено датчиков на линии [%d]", scount);
       this->Label2->Caption=spar;
       */

       return;
    }
    else
    {

        this->ComboBox_addr->Clear();

        this->Button_Apply->Enabled=false;
        this->Button_exit->Enabled=false;
        this->ComboBox_addr->Enabled=false;
        this->LabeledEdit_name->Enabled=false;

        //this->Label1->Enabled=false;

        manualstop=false;
        this->Button_stop_scan->Caption="Остановить";

        Pr211->sensorsList->Clear();
        this->ProgressBar1->Min=0;
        this->ProgressBar1->Max=255;
        this->ProgressBar1->Position=0;
        scan_addr=0;
        sfaddr="";
        sfname="";
        this->Label2->Caption="Ждите! Идет сканирование датчиков на линии";

        this->LabeledEdit_name->Text="";
        this->ComboBox_averaging_period->Text="";
        this->ComboBox_averaging_tacts->Text="";
        this->LabeledEdit_meter_version->Text="";
        this->ComboBox_baud_rate->Text="";
        this->LabeledEdit_offset_X->Text="";
        this->LabeledEdit_offset_Y->Text="";
        this->LabeledEdit_soft_ver->Text="";
        this->LabeledEdit_serial_number->Text="";


        scount=0;

        this->Button_check_addr->Enabled=false;

        this->Timer_scan->Enabled=true;

       return;
    }
}
//---------------------------------------------------------------------------

int TForm_IND3_Tune::SoftVersionRequest(unsigned char addr, unsigned short* usres)
{
char cpar[64];
bool bres=false;
int len=0;
int res=0;

        memset(cpar,0,64);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        memset(buf,0,1024);
        Pr211->RequestSensorSoftVersion(addr,buf,&len);
        bres=ComPort->PortNWriteTune(len,buf);
        memset(buf,0,1024);
        len=6;
        ComPort->PortNRead(len,buf);
        if (buf[0]!=0x7E) return - 1;

        ReadContinue(&len);
        res=Pr211->packet_proc(buf,len);

        if (res==0)
        {
              Pr211->ReadIND3SensorSoftVersion(addr, usres);
              return 0;
        }
        else return res;
}


int TForm_IND3_Tune::SerialNumberRequest(unsigned char addr,unsigned int* uipar)
{
char cpar[64];
bool bres=false;
int len=0;
int res=0;

        memset(cpar,0,64);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        memset(buf,0,1024);
        Pr211->RequestSensorMeterSerialNumber(addr,buf,&len);
        bres=ComPort->PortNWriteTune(len,buf);
        memset(buf,0,1024);
        len=6;
        ComPort->PortNRead(len,buf);
        if (buf[0]!=0x7E) return - 1;

        ReadContinue(&len);
        res=Pr211->packet_proc(buf,len);

        if (res==0)
        {
              Pr211->ReadIND3SensorSerialNumber(addr, uipar);
              return 0;
        }
        else return res;
}


int TForm_IND3_Tune::ZeroOffsetRequest(unsigned char addr,double* offX,double* offY, BYTE* uX, BYTE* uY)
{
char cpar[64];
bool bres=false;
int len=0;
int res=0;

        memset(cpar,0,64);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        memset(buf,0,1024);

        Pr211->RequestSensorZeroOffset(addr,buf,&len);

        bres=ComPort->PortNWriteTune(len,buf);
        memset(buf,0,1024);
        len=6;
        ComPort->PortNRead(len,buf);
        if (buf[0]!=0x7E) return - 1;

        ReadContinue(&len);
        res=Pr211->packet_proc(buf,len);

        if (res==0)
        {
              Pr211->ReadIND3SensorZeroOffset(addr,offX,offY,uX,uY);
              return 0;
        }
        else return res;
}


int TForm_IND3_Tune::AveragingTactsRequest(unsigned char addr,int* ipar)
{
char cpar[64];
bool bres=false;
int len=0;
int res=0;

        memset(cpar,0,64);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        memset(buf,0,1024);
        Pr211->RequestSensorAveragingTacts(addr,buf,&len);
        bres=ComPort->PortNWriteTune(len,buf);
        memset(buf,0,1024);
        len=6;
        ComPort->PortNRead(len,buf);
        if (buf[0]!=0x7E) return - 1;

        ReadContinue(&len);
        res=Pr211->packet_proc(buf,len);

        if (res==0)
        {
              Pr211->ReadIND3SensorAveragingTacts(addr, ipar);
              return 0;
        }
        else return res;
}

int TForm_IND3_Tune::AveragingPeriodRequest(unsigned char addr,int* ipar)
{
char cpar[64];
bool bres=false;
int len=0;
int res=0;

        memset(cpar,0,64);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        memset(buf,0,1024);
        Pr211->RequestSensorAveragingPeriod(addr,buf,&len);
        bres=ComPort->PortNWriteTune(len,buf);
        memset(buf,0,1024);
        len=6;
        ComPort->PortNRead(len,buf);
        if (buf[0]!=0x7E) return - 1;

        ReadContinue(&len);
        res=Pr211->packet_proc(buf,len);

        if (res==0)
        {
              Pr211->ReadIND3SensorAveragingPeriod(addr, ipar);
              return 0;
        }
        else return res;
}

#define RPAUSE 50

int TForm_IND3_Tune::AllRequest(unsigned char addr)
{

char cpar[64];
int res=0;
int ipar=0;
unsigned long  ulpar=0;
unsigned short uspar=0;
unsigned int   uipar=0;
double offX,offY=0;
BYTE uX,uY=0;
AnsiString spar("");
unsigned char ucpar=0;

//if (Pr211->sensorsList->GetIND3Sensor(addr)==NULL) return -1;

ComPort->PurgeCom();

this->LabeledEdit_name->Text="";
this->LabeledEdit_meter_version->Text="";
this->LabeledEdit_soft_ver->Text="";
this->ComboBox_baud_rate->Text="";
this->LabeledEdit_serial_number->Text="";
this->ComboBox_averaging_tacts->Text="";
this->LabeledEdit_offset_X->Text="";
this->LabeledEdit_offset_Y->Text="";
this->ComboBox_averaging_period->Text="";

memset(cpar,0,64);
res=NameRequest(addr,cpar);
        if (res==0) this->LabeledEdit_name->Text=cpar;
        else
        {
              Sleep(RPAUSE);
              res=NameRequest(addr,cpar);
              if (res==0) this->LabeledEdit_name->Text=cpar;
              else
              {
                      Sleep(RPAUSE);
                      res=NameRequest(addr,cpar);
                      if (res==0) this->LabeledEdit_name->Text=cpar;
                      else
                      {
                        ShowMessage("Датчик не отвечает!");
                        return -1;
                      }
              }
        }


Sleep(RPAUSE);

ComPort->PurgeCom();


memset(cpar,0,64);
res=MeterVersionRequest(addr,cpar);
if (res==0) this->LabeledEdit_meter_version->Text=cpar;
Sleep(RPAUSE);

ComPort->PurgeCom();

memset(cpar,0,64);
res=BaudRateRequest(addr,&ipar);

        this->ComboBox_baud_rate->ItemIndex=-1;
        if (res==0)
        {
//                 this->ComboBox_baud_rate->Text=IntToStr(ipar);
                switch (ipar)
                {

                        case 115200:
                                this->ComboBox_baud_rate->ItemIndex=0;
                        break;

                        case 57600:
                                this->ComboBox_baud_rate->ItemIndex=1;
                        break;

                        case 38400:
                                this->ComboBox_baud_rate->ItemIndex=2;
                        break;

                        case 19200:
                                this->ComboBox_baud_rate->ItemIndex=3;
                        break;

                        case 9600:
                                this->ComboBox_baud_rate->ItemIndex=4;
                        break;

                        case 4800:
                                this->ComboBox_baud_rate->ItemIndex=5;
                        break;

                        case 2400:
                                this->ComboBox_baud_rate->ItemIndex=6;
                        break;

                        case 1200:
                                this->ComboBox_baud_rate->ItemIndex=7;
                        break;


                }

        }


Sleep(RPAUSE);

ComPort->PurgeCom();


memset(cpar,0,64);
res=SoftVersionRequest(addr,&uspar);
if (res==0) this->LabeledEdit_soft_ver->Text=IntToStr(uspar);
Sleep(RPAUSE);

ComPort->PurgeCom();

memset(cpar,0,64);
res=SerialNumberRequest(addr,&uipar);
if (res==0) this->LabeledEdit_serial_number->Text=IntToStr(uipar);
Sleep(RPAUSE);

ComPort->PurgeCom();

memset(cpar,0,64);
res=ZeroOffsetRequest(addr,&offX,&offY,&uX,&uY);

if (res==0) {

if (uX) offX*=60;
if (uY) offY*=60;

spar.printf("%.3f",offX);
this->LabeledEdit_offset_X->Text=spar;
spar.printf("%.3f",offY);
this->LabeledEdit_offset_Y->Text=spar;

//if (res==0) {

//if (uX) LabeledEdit_offset_X->Text=LabeledEdit_offset_X->Text+" '";
//else    LabeledEdit_offset_X->Text=LabeledEdit_offset_X->Text+" ''";

//if (uY) LabeledEdit_offset_Y->Text=LabeledEdit_offset_Y->Text+" '";
//else    LabeledEdit_offset_Y->Text=LabeledEdit_offset_Y->Text+" ''"; }

offset_X=LabeledEdit_offset_X->Text;
offset_Y=LabeledEdit_offset_Y->Text;
}


Sleep(RPAUSE);

ComPort->PurgeCom();

memset(cpar,0,64);
res=AveragingTactsRequest(addr,&ipar);


//if (res==0) this->ComboBox_averaging_tacts->Text=IntToStr(ipar);

this->ComboBox_averaging_tacts->ItemIndex=-1;

        if (res==0)
        {
                switch (ipar)
                {
                        case 1:
                        this->ComboBox_averaging_tacts->ItemIndex=0;
                        break;

                        case 2:
                        this->ComboBox_averaging_tacts->ItemIndex=1;
                        break;

                        case 4:
                        this->ComboBox_averaging_tacts->ItemIndex=2;
                        break;

                        case 8:
                        this->ComboBox_averaging_tacts->ItemIndex=3;
                        break;

                        case 16:
                        this->ComboBox_averaging_tacts->ItemIndex=4;
                        break;

                        case 32:
                        this->ComboBox_averaging_tacts->ItemIndex=5;
                        break;

                }
        }


Sleep(RPAUSE);

ComPort->PurgeCom();

memset(cpar,0,64);
res=AveragingPeriodRequest(addr,&ipar);

this->ComboBox_averaging_period->ItemIndex=-1;

        if (res==0)
        {
//         this->ComboBox_averaging_period->Text=IntToStr(ipar);
                switch (ipar)
                {
                        case 10:
                        this->ComboBox_averaging_period->ItemIndex=0;
                        break;

                        case  20:
                        this->ComboBox_averaging_period->ItemIndex=1;
                        break;

                        case 50:
                        this->ComboBox_averaging_period->ItemIndex=2;
                        break;

                        case 100:
                        this->ComboBox_averaging_period->ItemIndex=3;
                        break;
                }

         }

Sleep(RPAUSE);

return 0;
}

void __fastcall TForm_IND3_Tune::ComboBox_addrChange(TObject *Sender)
{

     unsigned char newaddr=(unsigned char)StrToInt(this->ComboBox_addr->Text);
     scan_addr=newaddr;
     AllRequest(scan_addr);
}
//---------------------------------------------------------------------------


int TForm_IND3_Tune::SetMeterName(unsigned char addr,char* newname)
{

BYTE buf[64];
int len;
bool bres;

        memset(buf,0,64);
        ComPort->PurgeCom();

        Pr211->SetSensorName(addr, newname, buf, &len);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        bres=ComPort->PortNWriteTune(len,buf);
        Sleep(RPAUSE);
        memset(buf,0,64);
        ComPort->PortNRead(6,buf);
        NameRequest(addr,buf);
        Sleep(RPAUSE);

}


int TForm_IND3_Tune::SetAveragingTacts(unsigned char addr,int tacts)
{

BYTE buf[64];
int len;
bool bres;
int ires=0;

        memset(buf,0,64);
        ComPort->PurgeCom();

        ind3_averaging_tacts itacts=averaging_tacts_1;

        switch (tacts)
        {
                case 1:
                        itacts=averaging_tacts_1;
                break;

                case 2:
                	itacts=averaging_tacts_2;
                break;

                case 4:
	                itacts=averaging_tacts_4;
                break;

                case 8:
        	        itacts=averaging_tacts_8;
                break;

                case 16:
                	itacts=averaging_tacts_16;
                break;

                case 32:
                	itacts=averaging_tacts_32;
                break;
        }


        Pr211->SetSensorAveragingTacts(addr,itacts,buf,&len);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        bres=ComPort->PortNWriteTune(len,buf);
        Sleep(RPAUSE);
        memset(buf,0,64);
        ComPort->PortNRead(6,buf);

}

int TForm_IND3_Tune::SetAveragingPeriod(unsigned char addr,int tacts)
{

BYTE buf[64];
int len;
bool bres;
int ires=0;

        memset(buf,0,64);
        ComPort->PurgeCom();

        ind3_averaging_period iperiod=averaging_period_10;

        switch (tacts)
        {
                case 10:
                        iperiod=averaging_period_10;
                break;

                case 20:
                	iperiod=averaging_period_20;
                break;

                case 50:
	                iperiod=averaging_period_50;
                break;

                case 100:
        	        iperiod=averaging_period_100;
                break;

        }


        Pr211->SetSensorAveragingPeriod(addr,iperiod,buf,&len);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        bres=ComPort->PortNWriteTune(len,buf);
        Sleep(RPAUSE);
        memset(buf,0,64);
        ComPort->PortNRead(6,buf);

}


int TForm_IND3_Tune::SetBaudRate(unsigned char addr,int baud)
{

BYTE buf[64];
int len;
bool bres;
int ires;

        memset(buf,0,64);
        ComPort->PurgeCom();

        ind3_baudrate ibaud=baud_1200;

        switch(baud)
        {
                case 115200:
                ibaud=baud_115200;
                break;

                case 57600:
                ibaud=baud_57600;
                break;

                case 38400:
                ibaud=baud_38400;
                break;

                case 19200:
                ibaud=baud_19200;
                break;

                case 9600:
                ibaud=baud_9600;
                break;

                case 4800:
                ibaud=baud_4800;
                break;

                case 2400:
                ibaud=baud_2400;
                break;

                case 1200:
                ibaud=baud_1200;
                break;

        }


        Pr211->SetSensorBaudRate(addr,ibaud,buf, &len);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        bres=ComPort->PortNWriteTune(len,buf);
        Sleep(RPAUSE);
        memset(buf,0,64);
        ComPort->PortNRead(6,buf);

           AnsiString msg;
           msg.printf("Скорость обмена установлена в %d. Для продолжения работы установите такуюже скорость COM-порта!",baud);
           ShowMessage(msg);

}


int TForm_IND3_Tune::SetZeroOffset(unsigned char addr,double xx, double yy, BYTE ux, BYTE uy)
{

BYTE buf[64];
int len;
bool bres;
int ires;
double xxx=0, yyy=0;
BYTE   uux=0, uuy=0;

        memset(buf,0,64);
        ComPort->PurgeCom();

/*
        if (xx>100)
        {
           xx/=60;
           ux=1;
        }

        if (yy>100)
        {
           yy/=60;
           uy=1;
        }
*/


        Pr211->SetsensorZeroOffset(addr,xx,yy,ux,uy,buf,&len);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        bres=ComPort->PortNWriteTune(len,buf);
        Sleep(RPAUSE);
        memset(buf,0,64);
        ComPort->PortNRead(6,buf);
//        this->ZeroOffsetRequest(addr,&xxx, &yyy, &uux, &uuy);

}

//---------------------------------------------------------------------
void __fastcall TForm_IND3_Tune::LabeledEdit_nameChange(TObject *Sender)
{
      if (processflag==false) this->Button_Apply->Enabled=true;

      int pos=LabeledEdit_name->SelStart;
      char cpar[64];
      memset(cpar,0,64);
      strcpy(cpar,LabeledEdit_name->Text.c_str());
      if (strlen(cpar)>16)
      {
        cpar[16]='\0';
        LabeledEdit_name->Text=cpar;
        LabeledEdit_name->SelStart=pos;
      }
}
//---------------------------------------------------------------------------

void __fastcall TForm_IND3_Tune::ComboBox_baud_rateChange(
      TObject *Sender)
{
      if (processflag==false) this->Button_Apply->Enabled=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm_IND3_Tune::ComboBox_averaging_tactsChange(
      TObject *Sender)
{
      if (processflag==false) this->Button_Apply->Enabled=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm_IND3_Tune::ComboBox_averaging_periodChange(
      TObject *Sender)
{
      if (processflag==false) this->Button_Apply->Enabled=true;
}
//---------------------------------------------------------------------------




int is_number(char smb)
{

if (
    (smb!='0')&&
    (smb!='1')&&
    (smb!='2')&&
    (smb!='3')&&
    (smb!='4')&&
    (smb!='5')&&
    (smb!='6')&&
    (smb!='7')&&
    (smb!='8')&&
    (smb!='9')
    )

    return 1;

return 0;
}
void __fastcall TForm_IND3_Tune::LabeledEdit_offset_YChange(
      TObject *Sender)
{
      if (processflag==true) return;

      this->Button_Apply->Enabled=true;

      bool point=false;
      bool minus=false;
      char cpar[64];
      char ccpar[64];
      int j=0;
      memset (ccpar,0,64);
      char sm;
      strcpy(cpar,LabeledEdit_offset_Y->Text.c_str());
      int ap=0;

      for (int i=0; i<strlen(cpar); i++)
      {

        sm=cpar[i];
        if  ((is_number(sm))&&(sm!='.')&&(sm!=',')&&(sm!='-'))
        {
            continue;
        }

        if (sm=='-')
        {
            if ((i>0)||(minus==true)) continue;
        }


        if ((point==false)&&(i>4)&&(sm!='.')&&(sm!=',')) continue;
        if ((point==true )&&((sm=='.')||(sm==','))) continue;
        if ((point==true )&&(i>8)) continue;
        if (ap>3) continue;

                  ccpar[j]=sm;
                  j++;
                  if ((sm=='.')||(sm==',')) point=true;
                  if (point==true) ap++;
                  if (sm=='-') minus=true;

       }

            LabeledEdit_offset_Y->Text=ccpar;
            LabeledEdit_offset_Y->SetFocus();
            LabeledEdit_offset_Y->SelStart=strlen(cpar);
}
//---------------------------------------------------------------------------

void __fastcall TForm_IND3_Tune::LabeledEdit_offset_XChange(
      TObject *Sender)
{
      if (processflag==true) return;

      this->Button_Apply->Enabled=true;

      bool point=false;
      bool minus=false;
      char cpar[64];
      char ccpar[64];
      int j=0;
      memset (ccpar,0,64);
      char sm;
      strcpy(cpar,LabeledEdit_offset_X->Text.c_str());
      int ap=0;

      for (int i=0; i<strlen(cpar); i++)
      {

        sm=cpar[i];


        if  ((is_number(sm))&&(sm!='.')&&(sm!=',')&&(sm!='-'))
        {
            continue;
        }

        if (sm=='-')
        {
            if ((i>0)||(minus==true)) continue;
        }

        if ((point==false)&&(i>4)&&(sm!='.')&&(sm!=',')) continue;
        if ((point==true )&&((sm=='.')||(sm==','))) continue;
        if ((point==true )&&(i>8)) continue;
        if (ap>3) continue;

                  ccpar[j]=sm;
                  j++;
                  if ((sm=='.')||(sm==',')) point=true;
                  if (point==true) ap++;
                  if (sm=='-') minus=true;

       }

            LabeledEdit_offset_X->Text=ccpar;
            LabeledEdit_offset_X->SetFocus();
            LabeledEdit_offset_X->SelStart=strlen(cpar);

}
//---------------------------------------------------------------------------

void __fastcall TForm_IND3_Tune::Button_check_addrClick(TObject *Sender)
{
        unsigned char new_addr=0;
        Form_new_addr->Pr211=this->Pr211;
        Form_new_addr->new_addr=&new_addr;
        Form_new_addr->Start();
        Form_new_addr->ShowModal();

        SetNewAddr(scan_addr,new_addr);
}
//---------------------------------------------------------------------------


int TForm_IND3_Tune::SetNewAddr(unsigned char addr,unsigned char new_addr)
{

BYTE buf[64];
int len;
bool bres;
int ires;

        if ((new_addr==0)||(new_addr>254)) return -1;

        memset(buf,0,64);
        ComPort->PurgeCom();
        Pr211->SetSensorNewAddress(addr,new_addr,buf,&len);
        ComPort->SetTimeouts(gtimeout,gtimeout);
        bres=ComPort->PortNWriteTune(len,buf);
        Sleep(RPAUSE);
        this->ComboBox_addr->Items->Add(IntToStr(new_addr));
        this->ComboBox_addr->Text=IntToStr(new_addr);
        scan_addr=new_addr;
        Sleep(RPAUSE);
                if (NameRequest(new_addr,buf)==0)
                {
                    AnsiString spar("");
                    spar.printf("%s",buf);
                    this->LabeledEdit_name->Text=spar;
                }

        Sleep(RPAUSE);
        AllRequest(new_addr);

        ShowMessage("Рекомендуется выполнить сканирование линии повторно.");
}

void __fastcall TForm_IND3_Tune::Timer_startTimer(TObject *Sender)
{
        Timer_start->Enabled=false;
        StartTuning();
}
//---------------------------------------------------------------------------

void TForm_IND3_Tune::StartTuningTimer(void)
{
 this->Timer_start->Enabled=true;
}
void __fastcall TForm_IND3_Tune::Timer_execTimer(TObject *Sender)
{
        Timer_exec->Enabled=false;
        this->Label2->Caption="";
        processflag=false;
        this->Button_Apply->Enabled=false;

}
//---------------------------------------------------------------------------

