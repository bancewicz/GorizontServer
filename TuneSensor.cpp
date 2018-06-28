//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TuneSensor.h"
#include "SysConfMaster.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_SENSOR_Tune *Form_SENSOR_Tune;
bool SAVEFLAG=false;
//---------------------------------------------------------------------------
__fastcall TForm_SENSOR_Tune::TForm_SENSOR_Tune(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm_SENSOR_Tune::Button_exitClick(TObject *Sender)
{
        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);
        Close();
}
//---------------------------------------------------------------------------

int NATIVESENSORADDR=0;

void __fastcall TForm_SENSOR_Tune::Timer1Timer(TObject *Sender)
{
this->Timer1->Enabled=false;

this->Color=RGB(250,250,250);

NATIVESENSORADDR=this->sensor->adr;

         this->ComboBox_adr->Items->Clear();

         AnsiString sect("");
         sect.printf("PORT%d",*this->nPortSelected);
         AnsiString ad("");
         AnsiString key("");

         for (int i=1; i<255; i++)
         {
            key.printf("adr%d",i);
            ad=this->master->gIniFile->ReadString(sect,key,"None");
            //  if ((ad=="None")||(ad==NATIVESENSORADDR))
            {
                this->ComboBox_adr->Items->Add(i);
            }

         }
         
AnsiString s("");

s.printf("Настройка конфигурации системы мониторинга [ПОРТ №%d] [ДАТЧИК №%d]", *nPortSelected, *nSensSelected);
this->Caption=s;

this->master->ViewSensor();

        s=this->ComboBox_name->Text;
        if (s.Pos("ускорение")>0)  this->CheckBox_ac->Checked=true;
        else                       this->CheckBox_ac->Checked=false;


        this->ComboBox_name->Items->Clear();

        if (comport->Protocol211!=NULL)
        {
                 this->ComboBox_name->Items->Add("ИН-Д3");
                 this->CheckBox_ac->Visible=false;
                 this->Label_ac->Visible=false;
                 this->Edit_to->Visible=false;
                 this->Label_to->Visible=false;

                 this->CheckBox_accelOn->Visible=false;
                 this->Label_accOn->Visible=false;

        }
        else
        {
//                this->ComboBox_name->Items->Add("АН-Д3 (ускорение)");
                this->ComboBox_name->Items->Add("АН-Д3");

                if (m_ListEmpty==1)
                {
                     this->ComboBox_name->Items->Add("ИН-Д3");
                }


//                this->ComboBox_name->Items->Add("Прочие устройства");

                 //this->CheckBox_ac->Visible=true;
                 //this->Label_ac->Visible=true;

                 this->Edit_to->Visible=true;
                 this->Label_to->Visible=true;

                 this->CheckBox_accelOn->Visible=true;
                 this->Label_accOn->Visible=true;

        }

    this->Button_save->Enabled=true;
    this->Button_apply->Visible=false;
    SAVEFLAG=true;                    

}
//---------------------------------------------------------------------------

void __fastcall TForm_SENSOR_Tune::TabSheet1ContextPopup(TObject *Sender,
      TPoint &MousePos, bool &Handled)
{
this->Timer1->Enabled=false;
this->Timer1->Interval=10;

}
//---------------------------------------------------------------------------


void TForm_SENSOR_Tune::SetViewTimer()
{
        //TODO: Add your source code here
        Timer1->Enabled=true;
}
void __fastcall TForm_SENSOR_Tune::FormCreate(TObject *Sender)
{
        this->Timer1->Enabled=false;
        this->Timer1->Interval=10;

/*
        this->ComboBox_name->Items->Add("АН-Д3 (измеряется ускорение)");
        this->ComboBox_name->Items->Add("АН-Д3");
        this->ComboBox_name->Items->Add("ИН-Д3");
        this->ComboBox_name->Items->Add("Прочие устройства");
*/

        for (int i=1; i<255; i++)
        {
           this->ComboBox_adr->Items->Add(i);
        }


        this->ComboBox_adr->Items->Delete(100);

        this->Button_save->Enabled=false;
}
//---------------------------------------------------------------------------




void __fastcall TForm_SENSOR_Tune::Button_applyClick(TObject *Sender)
{

        AnsiString s("");
        s=this->ComboBox_name->Text;
        if (s.Pos("ускорение")>0)  this->CheckBox_ac->Checked=true;

        if (this->m_ListEmpty==0)
        {
                if (comport->Protocol211!=NULL)
                {
                        if ((s.Pos("ускорение")>0)||(s.Pos("АН-Д3")>0))
                        {
                                ShowMessage("Имя датчика типа ИНКЛИНОМЕТР не должно содержать ключевых слов <ускорение>, <АН-Д3>, <AN-D3>");
                                return;

                        }

                        if ((s.Pos("IN-D3")==0)&&(s.Pos("ИН-Д3")==0))
                        {
                                ShowMessage("Имя датчика типа ИНКЛИНОМЕТР должно содержать ключевые слова <IN-D3> или <ИН-Д3>");
                                return;
                        }

                }
                else
                {
                //if (this->)

                        if ((s.Pos("IN-D3")>0)||(s.Pos("ИН-Д3")>0))
                        {
                                ShowMessage("Имя датчика типа АКСЕЛЕРОМЕТР не должно содержать ключевых слов <IN-D3>, <ИН-Д3>");
                                return;
                        }

                        if ((s.Pos("ускорение")==0)&&(s.Pos("АН-Д3")==0))
                        {
                                ShowMessage("Имя датчика типа АКСЕЛЕРОМЕТР должно содержать ключевые слова <АН-Д3> или <AN-D3>");
                                return;

                        }

                }
        }


/*
        if (this->CheckBox_ac->Checked==true)
        {
           if (s.Pos("ускорение")==0)
           {
             s+=" ускорение";
           }
        }
        else
        {
           if (s.Pos("ускорение")>0)
           {
             s.Delete(s.Pos("ускорение"),strlen("ускорение"));
           }
        }

        this->ComboBox_name->Text=s;
*/

        master->ApplySensor();
        this->Button_save->Enabled=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm_SENSOR_Tune::Button_saveClick(TObject *Sender)
{

         Button_applyClick(NULL);

         AnsiString sect("");
         sect.printf("PORT%d",*this->nPortSelected);
         AnsiString ad("");
         AnsiString key("");

         for (int i=1; i<255; i++)
         {
            key.printf("adr%d",i);
            ad=this->master->gIniFile->ReadString(sect,key,"None");
            if (ad=="None") break;
            else
            {
                if (ad==this->master->ConfSysSensor.adrx.msVal)
                {
                        if (ad!=NATIVESENSORADDR)
                        {
                                ShowMessage("Датчик с таким адресом уже существует на линии!");
                                return;
                        }
                }
            }

         }


         master->SaveIniParSensor();
         //this->Button_save->Enabled=false;
         SAVEFLAG=false;
}
//---------------------------------------------------------------------------

void __fastcall TForm_SENSOR_Tune::ComboBox_nameChange(TObject *Sender)
{
        AnsiString s("");
        s=this->ComboBox_name->Text;
        if (s.Pos("ускорение")>0)  this->CheckBox_ac->Checked=true;
        else                       this->CheckBox_ac->Checked=false;
}
//---------------------------------------------------------------------------

void __fastcall TForm_SENSOR_Tune::CheckBox_acClick(TObject *Sender)
{
        AnsiString s("");
        s=this->ComboBox_name->Text;
//        if (s.Pos("ускорение")>0)  this->CheckBox_ac->Checked=true;


        if (this->CheckBox_ac->Checked==true)
        {
           if (s.Pos("ускорение")==0)
           {
             while(s.Pos("()")) s.Delete(s.Pos("()"),2);

             s+="(ускорение)";
           }
        }
        else
        {
           if (s.Pos("ускорение")>0)
           {
             s.Delete(s.Pos("ускорение"),strlen("ускорение"));
           }
        }

        this->ComboBox_name->Text=s;

}
//---------------------------------------------------------------------------


void __fastcall TForm_SENSOR_Tune::CheckBox_accelOnClick(TObject *Sender)
{

        this->CheckBox_accelOn->Update();

        if (this->CheckBox_accelOn->Checked==false)
        {
                MessageBox(NULL,"Измерение ускорения для выбранного датчика будет отключено!", "ВНИМАНИЕ!",0);
                this->sensor->isAccel=false;
        }
        else
        {
                this->sensor->isAccel=true;
        }

}
//---------------------------------------------------------------------------

void __fastcall TForm_SENSOR_Tune::SpeedButton1Click(TObject *Sender)
{

         Button_applyClick(NULL);

         AnsiString sect("");
         sect.printf("PORT%d",*this->nPortSelected);
         AnsiString ad("");
         AnsiString key("");

         for (int i=1; i<255; i++)
         {
            key.printf("adr%d",i);
            ad=this->master->gIniFile->ReadString(sect,key,"None");
            if (ad=="None") break;
            else
            {
                if (ad==this->master->ConfSysSensor.adrx.msVal)
                {
                        if (ad!=NATIVESENSORADDR)
                        {
                                ShowMessage("Датчик с таким адресом уже существует на линии!");
                                return;
                        }
                }
            }

         }


         master->SaveIniParSensor();
         //this->Button_save->Enabled=false;
         SAVEFLAG=false;
        
}
//---------------------------------------------------------------------------

void __fastcall TForm_SENSOR_Tune::SpeedButton_exitClick(TObject *Sender)
{
//        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);

        if (fCreate)
        {
              if (CheckSensorAddr()==0)
              {
                return;
              }
              else
              {
                 master->SaveIniParSensor();
                 //this->Button_save->Enabled=false;
                 SAVEFLAG=false;
              }
        }

        Close();
}
//---------------------------------------------------------------------------


int TForm_SENSOR_Tune::CheckSensorAddr()
{
        //TODO: Add your source code here
         Button_applyClick(NULL);

         AnsiString sect("");
         sect.printf("PORT%d",*this->nPortSelected);
         AnsiString ad("");
         AnsiString key("");

         for (int i=1; i<255; i++)
         {
            key.printf("adr%d",i);
            ad=this->master->gIniFile->ReadString(sect,key,"None");
            if (ad=="None") break;
            else
            {
                if (ad==this->master->ConfSysSensor.adrx.msVal)
                {
                        if (ad!=NATIVESENSORADDR)
                        {
                                ShowMessage("Датчик с таким адресом уже существует на линии!");
                                return 0;
                        }
                }
            }

         }

         return 1;
}
