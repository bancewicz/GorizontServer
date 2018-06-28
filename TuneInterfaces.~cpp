//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TuneInterfaces.h"

#include "SysConfMaster.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_Interfaces_Tune *Form_Interfaces_Tune;

bool SAVEFLAG=true;

//---------------------------------------------------------------------------
__fastcall TForm_Interfaces_Tune::TForm_Interfaces_Tune(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm_Interfaces_Tune::Button_exitClick(TObject *Sender)
{
        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);
        Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm_Interfaces_Tune::Button_saveClick(TObject *Sender)
{

        master->Apply();
        master->SaveIniPar();
        SAVEFLAG=false;
}
//---------------------------------------------------------------------------


TForm_Interfaces_Tune::SetViewTimer()
{
        //TODO: Add your source code here
        this->Timer1->Enabled=true;
        this->Color=RGB(250,250,250);


}

void __fastcall TForm_Interfaces_Tune::Timer1Timer(TObject *Sender)
{
         this->Timer1->Enabled=false;
         SAVEFLAG=true;
         this->master->View();
}
//---------------------------------------------------------------------------

void __fastcall TForm_Interfaces_Tune::SpeedButton1Click(TObject *Sender)
{

        master->Apply();
        master->SaveIniPar();
        SAVEFLAG=false;
        
}
//---------------------------------------------------------------------------

void __fastcall TForm_Interfaces_Tune::SpeedButton2Click(TObject *Sender)
{
        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);
        Close();
        
}
//---------------------------------------------------------------------------

