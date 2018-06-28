//---------------------------------------------------------------------------

#ifndef TuneSystemH
#define TuneSystemH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Grids.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <ImgList.hpp>
#include <Buttons.hpp>
#include <jpeg.hpp>

//#include "SysConfMaster.h"

class TSysConfMaster;

//---------------------------------------------------------------------------
class TForm_SYSTEM_Tune : public TForm
{
__published:	// IDE-managed Components
        TButton *Button_exit;
        TPageControl *PCTuneSystem;
        TTabSheet *TabSheet1;
        TTabSheet *TabSheet2;
        TPageControl *PageControl1;
        TTabSheet *TabSheet3;
        TTabSheet *TabSheet4;
        TTabSheet *TabSheet5;
        TTabSheet *TabSheet6;
        TTabSheet *TabSheet7;
        TButton *Button_save;
        TButton *Button_apply;
        TLabel *Label1;
        TEdit *Edit_program_title;
        TLabel *Label2;
        TEdit *Edit_system_name;
        TLabel *Label3;
        TComboBox *ComboBox_system_ports_num;
        TLabel *Label4;
        TCheckBox *CheckBox_canhide;
        TLabel *Label5;
        TCheckBox *CheckBox_canclose;
        TLabel *Label6;
        TEdit *Edit_modbusTCP;
        TLabel *Label7;
        TEdit *Edit2;
        TLabel *Label8;
        TCheckBox *CheckBox_show_advanced;
        TLabel *Label9;
        TCheckBox *CheckBox_can_copy;
        TLabel *Label10;
        TCheckBox *CheckBox_can_save;
        TLabel *Label11;
        TComboBox *ComboBox_records_memo_view;
        TLabel *Label12;
        TComboBox *ComboBox_records_memo_delete;
        TLabel *Label13;
        TComboBox *ComboBox_bufsize;
        TLabel *Label14;
        TComboBox *ComboBox_ac_file_num;
        TLabel *Label15;
        TCheckBox *CheckBox_can_info;
        TLabel *Label16;
        TCheckBox *CheckBox_opc_da;
        TLabel *Label17;
        TLabel *Label18;
        TLabel *Label19;
        TLabel *Label20;
        TLabel *Label21;
        TLabel *Label22;
        TLabel *Label23;
        TLabel *Label24;
        TLabel *Label25;
        TLabel *Label26;
        TLabel *Label27;
        TLabel *Label28;
        TLabel *Label29;
        TLabel *Label30;
        TButton *Button_default;
        TTimer *Timer1;
        TComboBox *ComboBox_timers_update_int;
        TComboBox *ComboBox_timers_run;
        TComboBox *ComboBox_timers_start;
        TComboBox *ComboBox_timers_save;
        TComboBox *ComboBox_pauses_tick;
        TComboBox *ComboBox_pauses_reopen;
        TComboBox *ComboBox_pauses_close;
        TComboBox *ComboBox_pauses_exit;
        TComboBox *ComboBox_tout_rcom;
        TComboBox *ComboBox_tout_wcom;
        TComboBox *ComboBox_tout_rdat;
        TComboBox *ComboBox_tout_wdat;
        TComboBox *ComboBox_rerr;
        TComboBox *ComboBox_cerr;
        TLabel *Label31;
        TLabel *Label32;
        TLabel *Label33;
        TLabel *Label34;
        TComboBox *ComboBox_pause_addr;
        TComboBox *ComboBox_pause_cycle;
        TComboBox *ComboBox_pause_r;
        TComboBox *ComboBox_pause_c;
        TImage *Image_system;
        TImageList *ImageList1;
        TSpeedButton *SpeedButton_save;
        TSpeedButton *SpeedButton_exit;
        TCheckBox *CheckBox_canmodbus;
        TLabel *Label35;
        void __fastcall Button_exitClick(TObject *Sender);
        void __fastcall TabSheet1ContextPopup(TObject *Sender,
          TPoint &MousePos, bool &Handled);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button_applyClick(TObject *Sender);
        void __fastcall Button_saveClick(TObject *Sender);
        void __fastcall SpeedButton_saveMouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall FormMouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall SpeedButton_saveClick(TObject *Sender);
        void __fastcall SpeedButton_exitClick(TObject *Sender);
        void __fastcall SpeedButton_exitMouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_SYSTEM_Tune(TComponent* Owner);

        TSysConfMaster* master;
        void SetViewTimer();

};
//---------------------------------------------------------------------------
extern PACKAGE TForm_SYSTEM_Tune *Form_SYSTEM_Tune;
//---------------------------------------------------------------------------
#endif
