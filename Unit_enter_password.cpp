//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit_enter_password.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_enter_password *Form_enter_password;
//---------------------------------------------------------------------------
__fastcall TForm_enter_password::TForm_enter_password(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm_enter_password::Button_okClick(TObject *Sender)
{
        this->Edit1->Update();
        *psw=Edit1->Text;
        Close();        
}
//---------------------------------------------------------------------------
void __fastcall TForm_enter_password::FormKeyPress(TObject *Sender,
      char &Key)
{
        if (Key==13) Button_okClick(NULL);
}
//---------------------------------------------------------------------------
void __fastcall TForm_enter_password::Edit1KeyPress(TObject *Sender,
      char &Key)
{
        if (Key==13) Button_okClick(NULL);
}
//---------------------------------------------------------------------------
