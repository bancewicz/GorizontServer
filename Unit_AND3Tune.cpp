//---------------------------------------------------------------------------

#include <vcl.h>                                                                                                                                                                                          
#pragma hdrstop

#include "Unit_AND3Tune.h"


//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_AND3_Tune *Form_AND3_Tune;
//---------------------------------------------------------------------------
__fastcall TForm_AND3_Tune::TForm_AND3_Tune(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

//////////////////////////GLOBALS////////////////////////////////////////////

BYTE    MADDR=0;
BYTE    buf[1024];
DWORD   tm1=100, tm2=100;
BYTE*   res=NULL;
int     idx=0;
short   x=0,y=0;
short   tempr=0;
short   tacho=0;
short   powr=0;
double  X=0, Y=0;
double  TEMPR,TACHO,POWR=0;
WORD    DSW=0;
WORD    MODE=0;
WORD    OLDMODE=1;
DWORD   TOTALM=0;

AND3cmd AND3cmd_buf[64];
int     AND3cmd_idx=0;

DWORD   tcount=0;

BYTE SCANADDR=1;

bool SCANFLAG=false;
bool FULLSCAN=false;

int TOTALSENS=0;
int gtimeout=0;

bool MONFLAG=true;

BYTE OLDADDR=0;

#define SETCHECKED(X,Y)     {if (MODE&(1<<X)) Y->State=cbChecked; else Y->State=cbUnchecked;}
#define DSWSETCHECKED(X,Y)  {if (DSW&(1<<X)) Y->State=cbChecked; else Y->State=cbUnchecked;}

BYTE ADDREXIST[256];
int ADDREXISTIDX=0;

//////////////////////////////STACK READ/////////////////////////////////////


AND3_packet MYSTACK[1024];
unsigned short  CURBUFADDR=0;
DWORD           RECORDSDONE=0;

DWORD           CURSTARTTIME=0;
DWORD           PREVENDTIME =0;

unsigned int    MYSTACKidx=0;
unsigned short  RBUFidx=0;

/////////////////////////////////////////////////////////////////////////////

void TForm_AND3_Tune::SetModePar (TCheckBox* c, int bit)
{
        if (MONFLAG==false) return;

        this->Timer_cmon->Enabled=false;

                c->Update();
                if (c->Checked==true)
                   this->AND3_AddCmd(MADDR,50,bit,1,0);
                else
                   this->AND3_AddCmd(MADDR,50,bit,0,0);

//        this->Button_GetAll->SetFocus();
        this->Timer_cmon->Interval=1000;
        this->Timer_cmon->Enabled=true;
}


void TForm_AND3_Tune::AND3_AddCmd(BYTE addr, BYTE cmd, BYTE data1, BYTE data2, int rlen)
{
        if (AND3cmd_idx>63) return;

        AND3cmd* cd=&AND3cmd_buf[AND3cmd_idx];

        cd->addr=addr;
        cd->cmd=cmd;
        cd->data1=data1;
        cd->data2=data2;
        cd->rlen=rlen;

        AND3cmd_idx++;
}

void TForm_AND3_Tune::AND3_CurCmd(void)
{

     if (MONFLAG==false) return;

     if (AND3cmd_idx>0)
     {
        AND3cmd* cmd=&AND3cmd_buf[AND3cmd_idx-1];
        ComPort->BS4I1_Cmd(cmd->addr,cmd->cmd,cmd->data1,cmd->data2,cmd->rlen,tm1,tm2);
        AND3cmd_idx--;
     }
     else
     {
        AND3_GetAll();
     }
}


void TForm_AND3_Tune::AND3_GetAll(void)
{
    AnsiString spar("");

    if (ComPort==NULL) return;
    if (MONFLAG==false) return;


                this->LabeledEdit_X->Text="";
                this->LabeledEdit_Y->Text="";

                this->LabeledEdit_tempr->Text="";
                this->LabeledEdit_tacho->Text="";
                this->LabeledEdit_powr->Text="";


        if (res=ComPort->BS4I1_Cmd(MADDR,201,0,0,18,tm1,tm2))
        {
                tcount++;

                if (tcount&0x01) this->Edit_cmon->Color=clSilver;
                else             this->Edit_cmon->Color=clLime;

                memset(buf,0,1024);
                memcpy(buf,res,18+2+2);
                idx=0;

                x=*(short*)(&buf[idx]); idx+=2;
                y=*(short*)(&buf[idx]); idx+=2;

                tempr=*(short*)(&buf[idx]); idx+=2;
                tacho=*(short*)(&buf[idx]); idx+=2;
                powr =*(short*)(&buf[idx]); idx+=2;

                X=(double)x/8.0;
                Y=(double)y/8.0;

                TEMPR = (double)tempr/250.;
                TACHO = (double)tacho/8.;
                POWR  = (double)powr/10.;

                DSW       = *(WORD*)  (&buf[idx]);  idx+=2;
                TOTALM    = *(DWORD*) (&buf[idx]);  idx+=4;
                MODE      = *(WORD*)  (&buf[idx]);  idx+=2;

                spar.printf("%.2f",X);   this->LabeledEdit_X->Text=spar;
                spar.printf("%.2f",Y);   this->LabeledEdit_Y->Text=spar;

                spar.printf("%.2f °C",TEMPR);   this->LabeledEdit_tempr->Text=spar;
                spar.printf("%.2f",TACHO);      this->LabeledEdit_tacho->Text=spar;
                spar.printf("%.2f %%",POWR);    this->LabeledEdit_powr->Text=spar;

                spar.printf("%d",TOTALM);    this->LabeledEdit_mtotal->Text=spar;

/*
                if (MODE&(1<<6))
                {
                        CheckBox_buf->State=cbChecked;
                        this->Button_buffill->Caption="ВКЛ. заполнение";
                        this->Edit_bufon->Color=clSilver;
                }
                else
                {
                        CheckBox_buf->State=cbUnchecked;
                        this->Button_buffill->Caption="ОТКЛ. заполнение";
                        if (tcount&0x01) this->Edit_bufon->Color=clSilver;
                        else             this->Edit_bufon->Color=clLime;
                }
*/

//Индикация режима

//                if (OLDMODE!=MODE)
                {

                        SETCHECKED(0,CheckBox_f1off);
                        SETCHECKED(1,CheckBox_f2off);
                        SETCHECKED(2,CheckBox_idleoff);
                        SETCHECKED(3,CheckBox_toutoff);
                        SETCHECKED(4,CheckBox_tavr);
                        SETCHECKED(5,CheckBox_termoff);
                        SETCHECKED(6,CheckBox_buf);
                        SETCHECKED(7,CheckBox_addrdetectoff);
                        SETCHECKED(8,CheckBox_acompoff);
                        SETCHECKED(9,CheckBox_fl3off);
                        SETCHECKED(10,CheckBox_dpwroff);
                        SETCHECKED(11,CheckBox_msoff);
                        SETCHECKED(12,CheckBox_toutrequest);

//!!!                        SETCHECKED(13,CheckBox_br115200);

                        SETCHECKED(14,CheckBox_tout10);

                        if (MODE&(1<<13)) this->ComboBox_baud_rate->Text="115200";
                        else              this->ComboBox_baud_rate->Text="нет данных";

                        OLDMODE=MODE;
                }

//Индикация слова состояния

                this->CheckBox_reset->Checked=(DSW&(1<<0));

                DSWSETCHECKED(0,CheckBox_reset);
                DSWSETCHECKED(1,CheckBox_dataready);
                DSWSETCHECKED(2,CheckBox_readytemp);
                DSWSETCHECKED(3,CheckBox_readyfan);
                DSWSETCHECKED(4,CheckBox_readerr);
                DSWSETCHECKED(5,CheckBox_crcerr);
                DSWSETCHECKED(6,CheckBox_rangerr);

                DSWSETCHECKED(8,CheckBox_temperr);
                DSWSETCHECKED(9,CheckBox_rtemperr);
                DSWSETCHECKED(10,CheckBox_fanerr);
                DSWSETCHECKED(11,CheckBox_termerr);
                DSWSETCHECKED(12,CheckBox_addrseek);
                DSWSETCHECKED(13,CheckBox_termon);

                ComPort->Purge();

//                this->Button_exit->SetFocus();

        }


}



void __fastcall TForm_AND3_Tune::FormCreate(TObject *Sender)
{
        ComPort=NULL;
        Timer_cmon->Enabled=false;
        Timer_cmon->Interval=1000;
        this->Timer_and2scan->Enabled=false;
        this->Timer_gstart->Enabled=false;
        this->Timer_reset->Enabled=false;
        this->Timer_reset->Interval=5000;



this->Button_bufreset->ShowHint=true;
this->Button_bufreset->Hint="Команда [206]";

this->Button_buffill->ShowHint=true;
this->Button_buffill->Hint="Бит [6] режима работы";

this->Button_bufsetup->ShowHint=true;
this->Button_bufsetup->Hint="Команда [205]";

        this->ComboBox_d3na->Clear();

        for (BYTE ad=1; ad<255; ad++)
        {
          ComboBox_d3na->Items->Add(ad);
        }
        ComboBox_d3na->Text=1;

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_GetAllClick(TObject *Sender)
{
//            Timer_cmon->Enabled=true;
        //    AND3_GetAll();
        //AND3_CurCmd();

        StartScan();
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Timer_cmonTimer(TObject *Sender)
{
    if (MONFLAG==false)
    {
        Timer_cmon->Enabled=false;;
    }


    this->AND3_CurCmd();
    Timer_cmon->Interval=1000;
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_bufresetClick(TObject *Sender)
{
         this->AND3_AddCmd(MADDR,206,0,0,0);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_bufClick(TObject *Sender)
{
/*
        this->Timer_cmon->Enabled=false;

                CheckBox_buf->Update();
                if (this->CheckBox_buf->Checked==true)
                   this->AND3_AddCmd(MADDR,50,6,1,0);
                else
                   this->AND3_AddCmd(MADDR,50,6,0,0);

        this->Button_GetAll->SetFocus();
        this->Timer_cmon->Enabled=true;
*/

       SetModePar (CheckBox_buf, 6);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_f3offClick(TObject *Sender)
{
/*
        this->Timer_cmon->Enabled=false;

                CheckBox_f3off->Update();
                if (this->CheckBox_f3off->Checked==true)
                   this->AND3_AddCmd(MADDR,50,9,1,0);
                else
                   this->AND3_AddCmd(MADDR,50,9,0,0);

        this->Button_GetAll->SetFocus();
        this->Timer_cmon->Enabled=true;
*/

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_buffillClick(TObject *Sender)
{
        if (MODE&(1<<6))  this->AND3_AddCmd(MADDR,50,6,0,0);
        else              this->AND3_AddCmd(MADDR,50,6,1,0);
}
//---------------------------------------------------------------------------


void __fastcall TForm_AND3_Tune::Button_bufsetupClick(TObject *Sender)
{

unsigned short thrshld=0;
BYTE b1,b2=0;

thrshld=StrToInt(this->MaskEdit_bufthreshold->Text);
thrshld&=0x3fff;

b1=(BYTE)(thrshld&0x00ff);
b2=(BYTE)(thrshld>>8);

if (this->CheckBox_bufclear->Checked==true) b2|=(1<<6);
if (this->CheckBox_bufstart->Checked==true) b2|=(1<<7);

this->AND3_AddCmd(MADDR,205,b1,b2,0);

}
//---------------------------------------------------------------------------



void __fastcall TForm_AND3_Tune::CheckBox_f1offClick(TObject *Sender)
{
        SetModePar (CheckBox_f1off, 0);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_f2offClick(TObject *Sender)
{
        SetModePar (CheckBox_f2off, 1);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_idleoffClick(TObject *Sender)
{
        SetModePar (CheckBox_idleoff, 2);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_toutoffClick(TObject *Sender)
{
        SetModePar (CheckBox_toutoff, 3);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_tavrClick(TObject *Sender)
{
        SetModePar (CheckBox_tavr, 4);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_termoffClick(TObject *Sender)
{
        SetModePar (CheckBox_termoff, 5);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_fl3offClick(TObject *Sender)
{
        SetModePar (CheckBox_fl3off, 9);
}
//---------------------------------------------------------------------------


void __fastcall TForm_AND3_Tune::CheckBox_addrdetectoffClick(
      TObject *Sender)
{
        SetModePar (CheckBox_addrdetectoff, 7);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_acompoffClick(TObject *Sender)
{
        SetModePar (CheckBox_acompoff, 8);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_dpwroffClick(TObject *Sender)
{
        SetModePar (CheckBox_dpwroff, 10);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_msoffClick(TObject *Sender)
{
        SetModePar (CheckBox_msoff, 11);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_toutrequestClick(TObject *Sender)
{
        SetModePar (CheckBox_toutrequest, 12);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_br115200Click(TObject *Sender)
{
        SetModePar (CheckBox_br115200, 13);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::CheckBox_tout10Click(TObject *Sender)
{
        SetModePar (CheckBox_tout10, 14);
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::BitBtn_sysClick(TObject *Sender)
{
        GetSysConf(0);
}
//---------------------------------------------------------------------------

void TForm_AND3_Tune::GetSysConf(int par)
{
     BYTE conf[32];
     BYTE* res=NULL;
     DWORD SYSFR=0;
     BYTE AADDR=0;
     BYTE D3ADDR=0;
     int idx=0;
     AnsiString spar;
     WORD N50=0;

        this->LabeledEdit_corefr->Text="";
        this->LabeledEdit_acaddr->Text="";
        this->LabeledEdit_d3addr->Text="";
        this->LabeledEdit_fdevider->Text="";

     this->Timer_cmon->Enabled=false;
     Sleep(10);
     res=ComPort->BS4I1_Cmd(MADDR,221,0,0,32,tm1,tm2);
     if (res)
     {
        memcpy(conf,res,32);
        SYSFR=*(DWORD*)(&conf[idx]); idx+=4;

        AADDR=conf[idx]; idx++;
        D3ADDR=conf[idx]; idx++;

        spar.printf("%.3f МГц",(float)SYSFR/1000000.);
        this->LabeledEdit_corefr->Text=spar;

        N50=*(WORD*)(&conf[28]);

        this->LabeledEdit_acaddr->Text=StrToInt(AADDR);
        this->LabeledEdit_d3addr->Text=StrToInt(D3ADDR);
        this->LabeledEdit_fdevider->Text=StrToInt(N50);

     }

     this->Timer_cmon->Enabled=true;

}


void TForm_AND3_Tune::StartScan(void)
{

        memset(ADDREXIST,0,256);
        ADDREXISTIDX=0;

        Button_writea->Enabled=false;
        this->Timer_reset->Enabled=false;
//        Button_writed->Enabled=false;

        for (BYTE ad=1; ad<255; ad++)
        {
          this->ComboBox_a4nad->Items->Add(ad);
        }
        ComboBox_a4nad->Text=1;

        this->ComboBox_com_number->Text=IntToStr(ComPort->st.p+1);
        this->ComboBox_com_number->Enabled=false;

        this->ComboBox_com_baud_rate->Enabled=false;
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


        MONFLAG==false;
        Timer_cmon->Enabled=false;

        TOTALSENS=0;
        this->ComboBox_and3addr->Clear();
        this->ComboBox_and3addr->Text="";

        this->Button_scan->Caption="Остановить";
        SCANFLAG=true;
        FULLSCAN=false;
        this->Label2->Caption="ЖДИТЕ! Идет сканирование датчиков на линии";
        SCANADDR=1;
        MADDR=0;
        this->ProgressBar_scan->Min=0;
        this->ProgressBar_scan->Max=255;
        this->ProgressBar_scan->Position=0;
        Timer_and2scan->Interval=50;
        Timer_and2scan->Enabled=true;

}


void __fastcall TForm_AND3_Tune::Timer_and2scanTimer(TObject *Sender)
{
       BYTE* res;
       AnsiString ss;

       res=ComPort->BS4I1_Cmd(SCANADDR,201,0,0,18,100,100);

       if (res)
       {
                this->ComboBox_and3addr->Items->Add(SCANADDR);
                this->ComboBox_and3addr->Text=SCANADDR;
                if (MADDR==0) MADDR=SCANADDR;
                TOTALSENS++;
                this->Edit_cmon->Color=clSilver;

                ADDREXIST [ADDREXISTIDX]=SCANADDR; ADDREXISTIDX++;
       }

       SCANADDR++;
       this->ProgressBar_scan->Position=SCANADDR;

       ss.printf("Ждите! Идет сканирование датчиков на линии [%d]",SCANADDR);
       this->Label2->Caption=ss;

       if ((SCANADDR>253)||(SCANFLAG==false))
       {

            SCANFLAG=false;    

            ComboBox_a4nad->Clear();
            BYTE nnewad=0;

            for (int i=1; i<255; i++)
            {
                for (int j=0; j<=ADDREXISTIDX; j++)
                {
                   if (ADDREXIST[j]==i)
                   {
                      goto addrexist;
                   }
                }

                ComboBox_a4nad->Items->Add(i);
                if (nnewad==0) nnewad=i;
                addrexist:
            }

            ComboBox_a4nad->Text=nnewad;

            if (SCANADDR==254)
            {
                FULLSCAN=true;
                Button_writea->Enabled=true;
//                Button_writed->Enabled=true;
            }

            Timer_and2scan->Enabled=false;
            this->ProgressBar_scan->Position=0;
            this->Label2->Caption="";
            GetSysConf(0);
            Timer_cmon->Enabled=true;
            MONFLAG=true;
            this->Button_scan->Caption="Сканировать";
            ss.printf("Всего обнаружено датчиков на линии [%d]",TOTALSENS);
            this->Label2->Caption=ss;

       }

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_exitClick(TObject *Sender)
{
        Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_scanClick(TObject *Sender)
{
        if (SCANFLAG==false)
        {
            StartScan();
        }
        else
        {
            SCANFLAG=false;
        }
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::ComboBox_and3addrChange(TObject *Sender)
{

        this->Timer_and2scan->Enabled=false;
        MONFLAG=false;
        Sleep(100);

        BYTE ad=StrToInt(this->ComboBox_and3addr->Text);

        if (ad)
        {
           MADDR=ad;
           GetSysConf(0);
        }

        MONFLAG=true;
        this->Timer_and2scan->Enabled=true;
}
//---------------------------------------------------------------------------

void TForm_AND3_Tune::Start(void)
{
   Timer_gstart->Enabled=true;
}

void __fastcall TForm_AND3_Tune::Timer_gstartTimer(TObject *Sender)
{
        this->Timer_gstart->Enabled=false;


        StartScan();
}
//---------------------------------------------------------------------------


void __fastcall TForm_AND3_Tune::FormClose(TObject *Sender,
      TCloseAction &Action)
{
        SCANFLAG=false;
        MONFLAG=false;
        Sleep(100);

        *ComServiceMode=false;
        *ThrServiceMode=false;
}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_adrind3Click(TObject *Sender)
{


        this->Timer_cmon->Enabled=false;

        if (BYTE* res=ComPort->BS4I1_Cmd(MADDR,90,10,0,0,tm1,tm2))
        {
                Sleep(1);
        }

        this->Timer_cmon->Enabled=true;

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_copytmpClick(TObject *Sender)
{

        this->Timer_cmon->Enabled=false;

        if (BYTE* res=ComPort->BS4I1_Cmd(MADDR,225,0,0,0,5000,5000))
        {
                Sleep(1);
        }

        this->Timer_cmon->Enabled=true;

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_writeClick(TObject *Sender)
{
        this->Timer_cmon->Enabled=false;

        if (BYTE* res=ComPort->BS4I1_Cmd(MADDR,220,66,99,2,tm1,tm2))
        {
                Sleep(1);
        }

        this->Timer_cmon->Enabled=true;

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_settmpClick(TObject *Sender)
{
        this->Timer_cmon->Enabled=false;

        if (BYTE* res=ComPort->BS4I1_Cmd(MADDR,224,5,5,0,tm1,tm2))
        {
                Sleep(1);
        }

        this->Timer_cmon->Enabled=true;

}
//---------------------------------------------------------------------------


void __fastcall TForm_AND3_Tune::Button_resetClick(TObject *Sender)
{
        this->Timer_cmon->Enabled=false; MONFLAG=false;

/*
        if (BYTE* res=ComPort->BS4I1_Cmd(MADDR,99,66,99,0,tm1,tm2))
        {

        }
        Sleep(2000);

        if (BYTE* res=ComPort->BS4I1_Cmd(MADDR,99,66,99,0,tm1,tm2))
        {

        }
        Sleep(2000);


        this->GetSysConf(0);

        this->Timer_cmon->Enabled=true;
*/
        Sleep(100);

        ComPort->BS4I1_Cmd(OLDADDR,99,66,99,0,tm1,tm2);

        this->Timer_reset->Enabled=true;

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_writedClick(TObject *Sender)
{
        this->Timer_cmon->Enabled=false; MONFLAG=false;

        BYTE newd3ad=StrToInt(this->ComboBox_d3na->Text);
        BYTE* res=0;

//копируем в темп
        if ((res=ComPort->BS4I1_Cmd(MADDR,225,0,0,0,tm1,tm2))==NULL)
        {
                ShowMessage("Ошибка записи!"); return;
        }

//ставим байт 5 в темп
        if ((res=ComPort->BS4I1_Cmd(MADDR,224,5,newd3ad,0,tm1,tm2))==NULL)
        {
                ShowMessage("Ошибка записи!"); return;
        }

//пишем NVM
        if ((res=ComPort->BS4I1_Cmd(MADDR,220,66,99,2,tm1,tm2))==NULL)
        {
                ShowMessage("Ошибка записи!"); return;
        }
        
        OLDADDR=MADDR;

        ShowMessage("Новый адрес ИН-Д3 записан. Необходимо выполнить сброс системы."); return;

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Button_writeaClick(TObject *Sender)
{
        OLDADDR=MADDR;

        BYTE newd3ad=StrToInt(this->ComboBox_a4nad->Text);
        BYTE* res=0;

        this->Timer_cmon->Enabled=false; MONFLAG=false;

//копируем в темп
        if ((res=ComPort->BS4I1_Cmd(MADDR,225,0,0,0,tm1,tm2))==NULL)
        {
                ShowMessage("Ошибка записи!"); return;
        }

//ставим байт 5 в темп
        if ((res=ComPort->BS4I1_Cmd(MADDR,224,4,newd3ad,0,tm1,tm2))==NULL)
        {
                ShowMessage("Ошибка записи!"); return;
        }

//пишем NVM
        if ((res=ComPort->BS4I1_Cmd(MADDR,220,66,99,2,tm1,tm2))==NULL)
        {
                ShowMessage("Ошибка записи!"); return;
        }

        this->ComboBox_and3addr->Text=newd3ad;
        MADDR=newd3ad;
        ShowMessage("Новый адрес АН-Д3 записан. Необходимо нажать кнопку ПРИМЕНИТЬ и повторное сканирование."); return;

}
//---------------------------------------------------------------------------

void __fastcall TForm_AND3_Tune::Timer_resetTimer(TObject *Sender)
{
        this->Timer_reset->Enabled=false;

        GetSysConf(0);
        Sleep(100);
        GetSysConf(0);
        MONFLAG=true;
        this->Timer_cmon->Enabled=true;

}
//---------------------------------------------------------------------------

void TForm_AND3_Tune::StartBufRead(void)
{

AND3_packet MYSTACK[1024];
  CURBUFADDR=0;
  RECORDSDONE=0;

  CURSTARTTIME = 0;
  PREVENDTIME  = 0;

  MYSTACKidx=0;
  RBUFidx=0;

Timer_bufread->Interval=1000;
Timer_bufread->Enabled=true;

                  
}

