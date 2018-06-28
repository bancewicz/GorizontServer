//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TunePort.h"
#include "SysConfMaster.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_PORT_Tune *Form_PORT_Tune;

bool SAVEFLAG=false;

//---------------------------------------------------------------------------
__fastcall TForm_PORT_Tune::TForm_PORT_Tune(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm_PORT_Tune::Button_exitClick(TObject *Sender)
{
        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);
        Close();
}
//---------------------------------------------------------------------------

int NATIVECOMPORT=0;

void __fastcall TForm_PORT_Tune::Timer1Timer(TObject *Sender)
{
     this->Timer1->Enabled=false;

     this->Color=RGB(250,250,250);

    NATIVECOMPORT=this->comport->st.p+1;

    this->ComboBox_com->Items->Clear();
    for (int i=1; i<255; i++) this->ComboBox_com->Items->Add(i);

/*
    for (int i=1; i<255; i++)
    {

        AnsiString sect("");
        AnsiString com("");
        sect.printf("PORT%d",i);

        com=this->master->gIniFile->ReadString(sect,"Num","None");

        if ((com!="None")&&(com!=NATIVECOMPORT))
        {
                 this->ComboBox_com->Items->Delete(StrToInt(com)-1);
        }

    }
*/

       AnsiString s;

       s.printf("Настройка конфигурации системы мониторинга [ПОРТ №%d]",*nPortSelected);

       this->Caption=s;

       master->ViewPort();

       this->Button_save->Enabled=true;
       this->Button_apply->Visible=false;

       SAVEFLAG=true;

}
//---------------------------------------------------------------------------


void TForm_PORT_Tune::SetViewTimer(void)
{
        //TODO: Add your source code here

        this->Timer1->Interval=10;
        this->Timer1->Enabled=true;
}
void __fastcall TForm_PORT_Tune::FormCreate(TObject *Sender)
{
  this->Timer1->Enabled=false;
  nPortSelected=NULL;

  this->ComboBox_name->Items->Add("Стандартный СОМ-порт");
//  this->ComboBox_name->Items->Add("Moxa UPort 1150");
//  this->ComboBox_name->Items->Add("Ethernet");
//  this->ComboBox_name->Items->Add("BS4I1 N2 port");
//  this->ComboBox_name->Items->Add("Модем GPRS");

  for (int i=1; i<256; i++)
  {
     this->ComboBox_com->Items->Add(i);
  }

  this->ComboBox_baud->Items->Add(115200);
  this->ComboBox_baud->Items->Add(9600);
  this->ComboBox_baud->Items->Add(57600);
  this->ComboBox_baud->Items->Add(38400);
  this->ComboBox_baud->Items->Add(19200);
  this->ComboBox_baud->Items->Add(4800);
  this->ComboBox_baud->Items->Add(2400);
  this->ComboBox_baud->Items->Add(1200);


}
//---------------------------------------------------------------------------


void __fastcall TForm_PORT_Tune::Button_applyClick(TObject *Sender)
{
        master->ApplyPort();
        this->Button_save->Enabled=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm_PORT_Tune::Button_saveClick(TObject *Sender)
{
    BYTE ports[255];
    memset(ports,0,255);
    BYTE p=0;
    int ii=0;

    bool rport=false;

    for (int i=1; i<255; i++)
    {

        AnsiString comselected("");

        comselected=this->ComboBox_com->Text;

        AnsiString sect("");
        AnsiString com("");
        sect.printf("PORT%d",i);
        com=this->master->gIniFile->ReadString(sect,"Num","None");
        if (com=="None")
        {
         break;
        }
        else
        {
            if (com==comselected)
            {
                if (i!=*this->nPortSelected)
                {
                        ShowMessage("СОМ-порт с таким номером уже существует в системе!");
                        return;
                }
            }
            ports[ii]=StrToInt(com);
            ii++;
        }

    }


    master->ApplyPort();

   this->Button_save->Enabled=true;
   master->SaveIniParPort();

   SAVEFLAG=false;
}
//---------------------------------------------------------------------------



void __fastcall TForm_PORT_Tune::SpeedButton_saveClick(TObject *Sender)
{
    BYTE ports[255];
    memset(ports,0,255);
    BYTE p=0;
    int ii=0;

    bool rport=false;

    for (int i=1; i<255; i++)
    {

        AnsiString comselected("");

        comselected=this->ComboBox_com->Text;

        AnsiString sect("");
        AnsiString com("");
        sect.printf("PORT%d",i);
        com=this->master->gIniFile->ReadString(sect,"Num","None");
        if (com=="None")
        {
         break;
        }
        else
        {
            if (com==comselected)
            {
                if (i!=*this->nPortSelected)
                {
                        ShowMessage("СОМ-порт с таким номером уже существует в системе!");
                        return;
                }
            }
            ports[ii]=StrToInt(com);
            ii++;
        }

    }


   master->ApplyPort();
   this->Button_save->Enabled=true;
   master->SaveIniParPort();

   SAVEFLAG=false;

}
//---------------------------------------------------------------------------

void __fastcall TForm_PORT_Tune::SpeedButton_exitClick(TObject *Sender)
{
//        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);
        if (fCreate)
        {
                if (ComNumCheck()==0) return;
                else
                {
                   master->ApplyPort();
                   this->Button_save->Enabled=true;
                   master->SaveIniParPort();
                   SAVEFLAG=false;
                }
        }


        Close();

}
//---------------------------------------------------------------------------


int TForm_PORT_Tune::ComNumCheck()
{
        //TODO: Add your source code here

    BYTE ports[255];
    memset(ports,0,255);
    BYTE p=0;
    int ii=0;

    bool rport=false;

    for (int i=1; i<255; i++)
    {

        AnsiString comselected("");

        comselected=this->ComboBox_com->Text;

        AnsiString sect("");
        AnsiString com("");
        sect.printf("PORT%d",i);
        com=this->master->gIniFile->ReadString(sect,"Num","None");
        if (com=="None")
        {
         break;
        }
        else
        {
            if (com==comselected)
            {
                if (i!=*this->nPortSelected)
                {
                        ShowMessage("СОМ-порт с таким номером уже существует в системе!");
                        return 0;
                }
            }
            ports[ii]=StrToInt(com);
            ii++;
        }

    }


        return 1;
}
