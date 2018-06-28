//---------------------------------------------------------------------------

#ifndef TuneSensorH
#define TuneSensorH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>

#include "BTCOM.h"
#include "Sensor.h"
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <Buttons.hpp>

class TSysConfMaster;

//---------------------------------------------------------------------------
class TForm_SENSOR_Tune : public TForm
{
__published:	// IDE-managed Components
        TButton *Button_apply;
        TButton *Button_save;
        TButton *Button_default;
        TButton *Button_exit;
        TPageControl *PageControl1;
        TTabSheet *TabSheet1;
        TTabSheet *TabSheet2;
        TLabel *Label1;
        TComboBox *ComboBox_name;
        TLabel *Label_ac;
        TCheckBox *CheckBox_ac;
        TLabel *Label4;
        TComboBox *ComboBox_gnum;
        TLabel *Label5;
        TCheckBox *CheckBox_on;
        TLabel *Label6;
        TComboBox *ComboBox_adr;
        TLabel *Label7;
        TEdit *Edit_snd3;
        TLabel *Label8;
        TLabel *Label9;
        TEdit *Edit3;
        TComboBox *ComboBox4;
        TGroupBox *GroupBox1;
        TEdit *Edit_xo;
        TLabel *Label10;
        TEdit *Edit_yo;
        TLabel *Label11;
        TLabel *Label_to;
        TEdit *Edit_to;
        TLabel *Label13;
        TCheckBox *CheckBox_invy;
        TLabel *Label14;
        TEdit *Edit_rotx;
        TLabel *Label15;
        TEdit *Edit_setdata;
        TLabel *Label16;
        TEdit *Edit_adjdata;
        TLabel *Label17;
        TEdit *Edit_note;
        TTimer *Timer1;
        TEdit *Edit_place;
        TLabel *Label2;
        TCheckBox *CheckBox_accelOn;
        TLabel *Label_accOn;
        TImage *Image_sensor;
        TSpeedButton *SpeedButton1;
        TSpeedButton *SpeedButton_exit;
        void __fastcall Button_exitClick(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall TabSheet1ContextPopup(TObject *Sender,
          TPoint &MousePos, bool &Handled);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button_applyClick(TObject *Sender);
        void __fastcall Button_saveClick(TObject *Sender);
        void __fastcall ComboBox_nameChange(TObject *Sender);
        void __fastcall CheckBox_acClick(TObject *Sender);
        void __fastcall CheckBox_accelOnClick(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
        void __fastcall SpeedButton_exitClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_SENSOR_Tune(TComponent* Owner);

        TSysConfMaster* master;
        TCOMPort* comport;
        TBTSensor* sensor;
        void SetViewTimer();

        int* nSensSelected;
        int* nPortSelected;

        int m_ListEmpty;
        bool fCreate;
        int CheckSensorAddr();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm_SENSOR_Tune *Form_SENSOR_Tune;
//---------------------------------------------------------------------------
#endif
