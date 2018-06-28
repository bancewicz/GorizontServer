//---------------------------------------------------------------------------

#ifndef TunePortH
#define TunePortH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>

#include "BTCom.h"
//#include "SysConfMaster.h"

#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TSysConfMaster;

class TForm_PORT_Tune : public TForm
{
__published:	// IDE-managed Components
        TButton *Button_apply;
        TButton *Button_save;
        TButton *Button_default;
        TButton *Button_exit;
        TLabel *Label1;
        TLabel *Label2;
        TComboBox *ComboBox_com;
        TLabel *Label3;
        TLabel *Label4;
        TComboBox *ComboBox_baud;
        TLabel *Label5;
        TCheckBox *CheckBox_on;
        TComboBox *ComboBox_name;
        TLabel *Label6;
        TComboBox *ComboBox_sensors_num;
        TTimer *Timer1;
        TImage *Image_port;
        TSpeedButton *SpeedButton_save;
        TSpeedButton *SpeedButton_exit;
        void __fastcall Button_exitClick(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button_applyClick(TObject *Sender);
        void __fastcall Button_saveClick(TObject *Sender);
        void __fastcall SpeedButton_saveClick(TObject *Sender);
        void __fastcall SpeedButton_exitClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_PORT_Tune(TComponent* Owner);

        TCOMPort* comport;
        TSysConfMaster* master;

        void SetViewTimer(void);
        int* nPortSelected;
        int ComNumCheck();

        bool fCreate;

};
//---------------------------------------------------------------------------
extern PACKAGE TForm_PORT_Tune *Form_PORT_Tune;
//---------------------------------------------------------------------------
#endif
