//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_new_addr *Form_new_addr;
//---------------------------------------------------------------------------
__fastcall TForm_new_addr::TForm_new_addr(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm_new_addr::Button_cancelClick(TObject *Sender)
{
Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm_new_addr::FormCreate(TObject *Sender)
{
     Timer_start->Enabled=false;
}
//---------------------------------------------------------------------------
void __fastcall TForm_new_addr::Timer_startTimer(TObject *Sender)
{
    if (Pr211!=NULL)
    {
            this->ComboBox_new_addr->Clear();
            Timer_start->Enabled=false;
            unsigned char start_ad=0;

            for (unsigned char ad=1; ad<255; ad++)
            {
                if (this->Pr211->GetIND3Sensor(ad)==NULL)
                {
                   this->ComboBox_new_addr->Items->Add(IntToStr(ad));
                   if (start_ad==0) start_ad=ad;
                }
            }

            this->ComboBox_new_addr->Text=IntToStr(start_ad);
    }

}
//---------------------------------------------------------------------------


void TForm_new_addr::Start(void)
{
        //TODO: Add your source code here
        Timer_start->Enabled=true;
}
void __fastcall TForm_new_addr::Button_applyClick(TObject *Sender)
{
    if (new_addr!=NULL) *new_addr=StrToInt(this->ComboBox_new_addr->Text);
    Close();
}
//---------------------------------------------------------------------------
