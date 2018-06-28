//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TuneSystem.h"
#include "SysConfMaster.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm_SYSTEM_Tune *Form_SYSTEM_Tune;

bool SAVEFLAG=true;

//---------------------------------------------------------------------------
__fastcall TForm_SYSTEM_Tune::TForm_SYSTEM_Tune(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm_SYSTEM_Tune::Button_exitClick(TObject *Sender)
{

        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);

        Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm_SYSTEM_Tune::TabSheet1ContextPopup(TObject *Sender,
      TPoint &MousePos, bool &Handled)
{
     //this->Edit_system_name->Text=this->master->ConfSysMain.Caption.msVal;
  
}
//---------------------------------------------------------------------------


void __fastcall TForm_SYSTEM_Tune::Timer1Timer(TObject *Sender)
{
//http://radio-hobby.org/modules/instruction/borland-c-builder-6/svoystvo-color

#define mColor RGB(250,250,250)

   this->Timer1->Enabled=false;
   this->Color=mColor;
   //clMenu;
   //clMedGray;
   //clGradientInactiveCaption;//*
   //clGradientActiveCaption;
   //cl3DLight;//*
   //clWindow;
   //clNone;
   //clNavy;
   //clMoneyGreen;
   //clMedGray;
   //clCaptionText;
   //clGradientActiveCaption;
   //this->Color=clBtnFace;

   //this->Button_save->ControlStyle=csFlat;

/*
//отображаем текущие значения настроек
   this->master->ConfSysMain.Caption.View();
   this->master->ConfSysMain.Name.View();
   this->master->ConfSysMain.NumOfPorts.View();
   this->master->ConfSysMain.CanHide.View();
   this->master->ConfSysMain.CanClose.View();
*/

//Число портов в всистеме регулим автоматически пока не вручную
   this->ComboBox_system_ports_num->Enabled=false;

/*
//Отображаем текущие значения настроек система расширенные
   this->master->ConfSysAdd.IPPort1.View();
   this->master->ConfSysAdd.MemoCount.View();
   this->master->ConfSysAdd.MemoDel.View();
   this->master->ConfSysAdd.SrsBufSize.View();
   this->master->ConfSysAdd.SrsBufToSave.View();
//   this->master->ConfSysAdd.ShowAdvanced.View();
   this->master->ConfSysAdd.CanCopy.View();
   this->master->ConfSysAdd.CanSave.View();
   this->master->ConfSysAdd.CanInfo.View();
   this->master->ConfSysAdd.CanOPCDA.View();
*/

    this->master->View();
    this->Button_save->Enabled=true;
    this->Button_apply->Visible=false;

    SAVEFLAG=true;

}
//---------------------------------------------------------------------------

void __fastcall TForm_SYSTEM_Tune::FormCreate(TObject *Sender)
{
Timer1->Interval=10;
Timer1->Enabled=false;

 this->ComboBox_system_ports_num->Items->Add(1);
 this->ComboBox_system_ports_num->Items->Add(2);
 this->ComboBox_system_ports_num->Items->Add(3);
 this->ComboBox_system_ports_num->Items->Add(4);
 this->ComboBox_system_ports_num->Items->Add(5);
 this->ComboBox_system_ports_num->Items->Add(6);
 this->ComboBox_system_ports_num->Items->Add(7);
 this->ComboBox_system_ports_num->Items->Add(8);

 this->ComboBox_records_memo_view->Items->Add(60);
 this->ComboBox_records_memo_view->Items->Add(30);
 this->ComboBox_records_memo_view->Items->Add(20);
 this->ComboBox_records_memo_view->Items->Add(10);
 this->ComboBox_records_memo_view->Items->Add(5);

 this->ComboBox_records_memo_delete->Items->Add(1);
 this->ComboBox_records_memo_delete->Items->Add(5);
 this->ComboBox_records_memo_delete->Items->Add(10);

 this->ComboBox_bufsize->Items->Add(8192*2*2*2);
 this->ComboBox_bufsize->Items->Add(8192*2*2);
 this->ComboBox_bufsize->Items->Add(8192*2);
 this->ComboBox_bufsize->Items->Add(8192);
 this->ComboBox_bufsize->Items->Add(8192/2);
 this->ComboBox_bufsize->Items->Add(8192/4);
 this->ComboBox_bufsize->Items->Add(8192/8);

 this->ComboBox_ac_file_num->Items->Add(1);
 this->ComboBox_ac_file_num->Items->Add(2);
 this->ComboBox_ac_file_num->Items->Add(5);
 this->ComboBox_ac_file_num->Items->Add(10);

 this->ComboBox_timers_update_int->Items->Add(100);
 this->ComboBox_timers_update_int->Items->Add(1000);
 this->ComboBox_timers_update_int->Items->Add(5000);
 this->ComboBox_timers_update_int->Items->Add(10000);

 this->ComboBox_timers_run->Items->Add(100);
 this->ComboBox_timers_run->Items->Add(1000);
 this->ComboBox_timers_run->Items->Add(5000);
 this->ComboBox_timers_run->Items->Add(10000);

 this->ComboBox_timers_start->Items->Add(100);
 this->ComboBox_timers_start->Items->Add(1000);
 this->ComboBox_timers_start->Items->Add(5000);
 this->ComboBox_timers_start->Items->Add(10000);

 this->ComboBox_timers_save->Items->Add(100);
 this->ComboBox_timers_save->Items->Add(1000);
 this->ComboBox_timers_save->Items->Add(5000);
 this->ComboBox_timers_save->Items->Add(10000);

 this->ComboBox_pauses_tick->Items->Add(100);
 this->ComboBox_pauses_tick->Items->Add(1000);
 this->ComboBox_pauses_tick->Items->Add(5000);
 this->ComboBox_pauses_tick->Items->Add(10000);

 this->ComboBox_pauses_reopen->Items->Add(100);
 this->ComboBox_pauses_reopen->Items->Add(1000);
 this->ComboBox_pauses_reopen->Items->Add(5000);
 this->ComboBox_pauses_reopen->Items->Add(10000);

 this->ComboBox_pauses_close->Items->Add(100);
 this->ComboBox_pauses_close->Items->Add(1000);
 this->ComboBox_pauses_close->Items->Add(5000);
 this->ComboBox_pauses_close->Items->Add(10000);

 this->ComboBox_pauses_exit->Items->Add(100);
 this->ComboBox_pauses_exit->Items->Add(1000);
 this->ComboBox_pauses_exit->Items->Add(5000);
 this->ComboBox_pauses_exit->Items->Add(10000);


 this->ComboBox_tout_rcom->Items->Add(100);
 this->ComboBox_tout_rcom->Items->Add(1000);
 this->ComboBox_tout_rcom->Items->Add(5000);
 this->ComboBox_tout_rcom->Items->Add(10000);

 this->ComboBox_tout_wcom->Items->Add(100);
 this->ComboBox_tout_wcom->Items->Add(1000);
 this->ComboBox_tout_wcom->Items->Add(5000);
 this->ComboBox_tout_wcom->Items->Add(10000);

 this->ComboBox_tout_rdat->Items->Add(100);
 this->ComboBox_tout_rdat->Items->Add(1000);
 this->ComboBox_tout_rdat->Items->Add(5000);
 this->ComboBox_tout_rdat->Items->Add(10000);

 this->ComboBox_tout_wdat->Items->Add(100);
 this->ComboBox_tout_wdat->Items->Add(1000);
 this->ComboBox_tout_wdat->Items->Add(5000);
 this->ComboBox_tout_wdat->Items->Add(10000);

 this->ComboBox_rerr->Items->Add(1);
 this->ComboBox_rerr->Items->Add(5);
 this->ComboBox_rerr->Items->Add(10);
 this->ComboBox_rerr->Items->Add(15);
 this->ComboBox_rerr->Items->Add(20);

 this->ComboBox_cerr->Items->Add(1);
 this->ComboBox_cerr->Items->Add(5);
 this->ComboBox_cerr->Items->Add(10);
 this->ComboBox_cerr->Items->Add(15);
 this->ComboBox_cerr->Items->Add(20);



 ComboBox_pause_c->Items->Add(1);
 ComboBox_pause_c->Items->Add(5);
 ComboBox_pause_c->Items->Add(10);
 ComboBox_pause_c->Items->Add(100);
 ComboBox_pause_c->Items->Add(500);
 ComboBox_pause_c->Items->Add(1000);

 ComboBox_pause_r->Items->Add(1);
 ComboBox_pause_r->Items->Add(5);
 ComboBox_pause_r->Items->Add(10);
 ComboBox_pause_r->Items->Add(100);
 ComboBox_pause_r->Items->Add(500);
 ComboBox_pause_r->Items->Add(1000);

 ComboBox_pause_addr->Items->Add(1);
 ComboBox_pause_addr->Items->Add(5);
 ComboBox_pause_addr->Items->Add(10);
 ComboBox_pause_addr->Items->Add(100);
 ComboBox_pause_addr->Items->Add(500);
 ComboBox_pause_addr->Items->Add(1000);

 ComboBox_pause_cycle->Items->Add(1);
 ComboBox_pause_cycle->Items->Add(5);
 ComboBox_pause_cycle->Items->Add(10);
 ComboBox_pause_cycle->Items->Add(100);
 ComboBox_pause_cycle->Items->Add(500);
 ComboBox_pause_cycle->Items->Add(1000);

}
//---------------------------------------------------------------------------


void TForm_SYSTEM_Tune::SetViewTimer()
{
        //TODO: Add your source code here
        Timer1->Enabled=true;
        this->Button_save->Enabled=false;
        this->Button_default->Enabled=false;
}

void __fastcall TForm_SYSTEM_Tune::Button_applyClick(TObject *Sender)
{

/*
    this->master->SaveFlag=true;


    this->master->ConfSysMain.Caption.Apply();
    this->master->ConfSysMain.Name.Apply();

    this->master->ConfSysMain.CanHide.Apply();
    this->master->ConfSysMain.CanClose.Apply();

//---------------------------------------------------------------------------
    this->master->ConfSysAdd.IPPort1.Apply();
    this->master->ConfSysAdd.MemoCount.Apply();
    this->master->ConfSysAdd.MemoDel.Apply();
    this->master->ConfSysAdd.SrsBufSize.Apply();
    this->master->ConfSysAdd.SrsBufToSave.Apply();
    this->master->ConfSysAdd.ShowAdvanced.Apply();
    this->master->ConfSysAdd.CanCopy.Apply();
    this->master->ConfSysAdd.CanSave.Apply();
    this->master->ConfSysAdd.CanInfo.Apply();
    this->master->ConfSysAdd.CanOPCDA.Apply();

//---------------------------------------------------------------------------
*/

    this->master->Apply();
    this->Button_save->Enabled=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm_SYSTEM_Tune::Button_saveClick(TObject *Sender)
{
   //this->Button_exit->Enabled=false;

   SAVEFLAG=false;

   this->master->Apply();
   this->master->SaveIniPar();

   //this->Button_exit->Enabled=true;
}
//---------------------------------------------------------------------------


void __fastcall TForm_SYSTEM_Tune::SpeedButton_saveMouseMove(
      TObject *Sender, TShiftState Shift, int X, int Y)
{
        //this->SpeedButton_save->Font->Color=clBlue;
}
//---------------------------------------------------------------------------

void __fastcall TForm_SYSTEM_Tune::FormMouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
        this->SpeedButton_save->Font->Color=clBlack;
        this->SpeedButton_exit->Font->Color=clBlack;

}
//---------------------------------------------------------------------------

void __fastcall TForm_SYSTEM_Tune::SpeedButton_saveClick(TObject *Sender)
{

   SAVEFLAG=false;
   this->master->Apply();
   this->master->SaveIniPar();
        
}
//---------------------------------------------------------------------------

void __fastcall TForm_SYSTEM_Tune::SpeedButton_exitClick(TObject *Sender)
{

//        if (SAVEFLAG) if (MessageBox(NULL,"Сохранить изменения?","ВНИМАНИЕ!",1)==IDOK) Button_saveClick(NULL);

        Close();

}
//---------------------------------------------------------------------------

void __fastcall TForm_SYSTEM_Tune::SpeedButton_exitMouseMove(
      TObject *Sender, TShiftState Shift, int X, int Y)
{
        //this->SpeedButton_exit->Font->Color=clBlue;

}
//---------------------------------------------------------------------------



