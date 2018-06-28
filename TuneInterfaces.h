//---------------------------------------------------------------------------

#ifndef TuneInterfacesH
#define TuneInterfacesH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>

//#include "SysConfMaster.h"

class TSysConfMaster;

//---------------------------------------------------------------------------
class TForm_Interfaces_Tune : public TForm
{
__published:	// IDE-managed Components
        TPageControl *PageControl1;
        TButton *Button_save;
        TTabSheet *TabSheet1;
        TTabSheet *TabSheet2;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit_modbus_port;
        TLabel *Label2;
        TCheckBox *CheckBox2;
        TLabel *Label3;
        TButton *Button_exit;
        TTimer *Timer1;
        TSpeedButton *SpeedButton1;
        TSpeedButton *SpeedButton2;
        void __fastcall Button_exitClick(TObject *Sender);
        void __fastcall Button_saveClick(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
        void __fastcall SpeedButton2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_Interfaces_Tune(TComponent* Owner);

        TSysConfMaster* master;
        SetViewTimer();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm_Interfaces_Tune *Form_Interfaces_Tune;
//---------------------------------------------------------------------------
#endif
