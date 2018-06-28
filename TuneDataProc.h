//---------------------------------------------------------------------------

#ifndef TuneDataProcH
#define TuneDataProcH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>

class TSysConfMaster;

//---------------------------------------------------------------------------
class TForm_DataProc_Tune : public TForm
{
__published:	// IDE-managed Components
        TButton *Button_save;
        TPageControl *PC_DataProcAdjust;
        TTabSheet *TabSheet1;
        TTabSheet *TabSheet2;
        TCheckBox *CheckBox_cansave;
        TLabel *Label1;
        TGroupBox *GroupBox1;
        TRadioButton *RadioButton_bin;
        TRadioButton *RadioButton_txt;
        TGroupBox *GroupBox2;
        TButton *Button1;
        TButton *Button2;
        TButton *Button3;
        TButton *Button_exit;
        TTimer *Timer1;
        TCheckBox *CheckBox_saveacctxt;
        TSpeedButton *SpeedButton1;
        TSpeedButton *SpeedButton2;
        TComboBox *ComboBox_ac_file_num;
        TLabel *Label2;
        void __fastcall Button_saveClick(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall Button_exitClick(TObject *Sender);
        void __fastcall RadioButton_binClick(TObject *Sender);
        void __fastcall RadioButton_txtClick(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
        void __fastcall SpeedButton2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_DataProc_Tune(TComponent* Owner);

        TSysConfMaster* master;
        SetViewTimer();

};
//---------------------------------------------------------------------------
extern PACKAGE TForm_DataProc_Tune *Form_DataProc_Tune;
//---------------------------------------------------------------------------
#endif
