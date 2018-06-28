//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TuneDataProc.h"
#include "SysConfMaster.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_DataProc_Tune *Form_DataProc_Tune;
bool SAVEFLAG=false;
//---------------------------------------------------------------------------
__fastcall TForm_DataProc_Tune::TForm_DataProc_Tune(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm_DataProc_Tune::Button_saveClick(TObject *Sender)
{

   Update();

   master->Apply();
   master->SaveIniPar();
   SAVEFLAG=false;

}
//---------------------------------------------------------------------------

TForm_DataProc_Tune::SetViewTimer()
{
        //TODO: Add your source code here
        this->Timer1->Enabled=true;
        this->Color=RGB(250,250,250);
}
void __fastcall TForm_DataProc_Tune::Timer1Timer(TObject *Sender)
{
        this->Timer1->Enabled=false;
        this->master->View();
        SAVEFLAG=true;

        if (this->CheckBox_saveacctxt->Checked==true)
        {
                this->RadioButton_bin->Checked=false;
                this->RadioButton_txt->Checked=true;
        }
        else
        {
                this->RadioButton_bin->Checked=true;
                this->RadioButton_txt->Checked=false;
        }


//        this->master->View();

        this->master->ConfSysAdd.SrsBufToSave.View();

}
//---------------------------------------------------------------------------

void __fastcall TForm_DataProc_Tune::Button_exitClick(TObject *Sender)
{
        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);
        Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm_DataProc_Tune::RadioButton_binClick(TObject *Sender)
{
        Update();

        if (RadioButton_bin->Checked==true)
        {
                this->RadioButton_txt->Checked=false;
                this->CheckBox_saveacctxt->Checked=false;
        }
        else
        {
                this->RadioButton_txt->Checked=true;
                this->CheckBox_saveacctxt->Checked=true;
        }

}
//---------------------------------------------------------------------------

void __fastcall TForm_DataProc_Tune::RadioButton_txtClick(TObject *Sender)
{
        Update();

        if (RadioButton_txt->Checked==true)
        {
                this->RadioButton_bin->Checked=false;
                this->CheckBox_saveacctxt->Checked=true;
        }
        else
        {
                this->RadioButton_bin->Checked=true;
                this->CheckBox_saveacctxt->Checked=false;
        }
}
//---------------------------------------------------------------------------



void __fastcall TForm_DataProc_Tune::SpeedButton1Click(TObject *Sender)
{

   Update();

   master->Apply();
   master->SaveIniPar();
   SAVEFLAG=false;
        
}
//---------------------------------------------------------------------------

void __fastcall TForm_DataProc_Tune::SpeedButton2Click(TObject *Sender)
{
//        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);
        Close();

}
//---------------------------------------------------------------------------



void __fastcall TForm_DataProc_Tune::FormCreate(TObject *Sender)
{
        this->ComboBox_ac_file_num->Items->Add(1);
        this->ComboBox_ac_file_num->Items->Add(5);
        this->ComboBox_ac_file_num->Items->Add(10);                        
}
//---------------------------------------------------------------------------

