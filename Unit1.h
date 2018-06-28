//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>

#include "BTCOM.h"
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
//#include "Protocol_211.h"
//---------------------------------------------------------------------------
class TForm_IND3_Tune : public TForm
{
__published:	// IDE-managed Components
        TProgressBar *ProgressBar1;
        TButton *Button_exit;
        TButton *Button_Apply;
        TTimer *Timer_scan;
        TComboBox *ComboBox_addr;
        TLabeledEdit *LabeledEdit_name;
        TLabel *Label2;
        TButton *Button_stop_scan;
        TLabeledEdit *LabeledEdit_meter_version;
        TLabeledEdit *LabeledEdit_baud_rate;
        TLabeledEdit *LabeledEdit_offset_X;
        TLabeledEdit *LabeledEdit_offset_Y;
        TLabeledEdit *LabeledEdit_soft_ver;
        TLabeledEdit *LabeledEdit_serial_number;
        TLabeledEdit *LabeledEdit_averaging_tacts;
        TLabeledEdit *LabeledEdit_averaging_period;
        TGroupBox *GroupBox1;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Label5;
        TGroupBox *GroupBox2;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label8;
        TGroupBox *GroupBox3;
        TLabel *Label_offsetX;
        TLabel *Label9;
        TLabel *Label10;
        TLabel *Label11;
        TComboBox *ComboBox_averaging_tacts;
        TComboBox *ComboBox_averaging_period;
        TComboBox *ComboBox_baud_rate;
        TGroupBox *GroupBox4;
        TComboBox *ComboBox_com_baud_rate;
        TLabel *Label12;
        TComboBox *ComboBox_com_number;
        TLabel *Label13;
        TButton *Button_com_open;
        TButton *Button_check_addr;
        TTimer *Timer_start;
        TTimer *Timer_exec;
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall Button_ApplyClick(TObject *Sender);
        void __fastcall Button_exitClick(TObject *Sender);
        void __fastcall Timer_scanTimer(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button_stop_scanClick(TObject *Sender);
        void __fastcall ComboBox_addrChange(TObject *Sender);
        void __fastcall LabeledEdit_nameChange(TObject *Sender);
        void __fastcall ComboBox_baud_rateChange(TObject *Sender);
        void __fastcall ComboBox_averaging_tactsChange(TObject *Sender);
        void __fastcall ComboBox_averaging_periodChange(TObject *Sender);
        void __fastcall LabeledEdit_offset_YChange(TObject *Sender);
        void __fastcall LabeledEdit_offset_XChange(TObject *Sender);
        void __fastcall Button_check_addrClick(TObject *Sender);
        void __fastcall Timer_startTimer(TObject *Sender);
        void __fastcall Timer_execTimer(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_IND3_Tune(TComponent* Owner);


TCOMPort* ComPort;
TProtocol_211* Pr211;
void StartTuning(void);
void StopTuning(void);

unsigned char scan_addr;
void WriteComPort(BYTE* buf, int len);

BYTE buf[1024];

int NameRequest(unsigned char addr, char* name);
int MeterVersionRequest(unsigned char addr, char* cres);
int BaudRateRequest(unsigned char addr, int* ires);
int SoftVersionRequest(unsigned char addr, unsigned short* ulres);
int SerialNumberRequest(unsigned char addr,unsigned int* uipar);
int ZeroOffsetRequest(unsigned char addr,double* offX,double* offY, BYTE* uX, BYTE* uY);
int AveragingTactsRequest(unsigned char addr,int* ipar);
int AveragingPeriodRequest(unsigned char addr,int* ipar);
int AllRequest(unsigned char addr);

int SetMeterName(unsigned char addr,char* newname);
int SetBaudRate(unsigned char addr,int baud);
int SetAveragingTacts(unsigned char addr,int tacts);
int SetAveragingPeriod(unsigned char addr,int tacts);
int SetZeroOffset(unsigned char addr,double xx, double yy, BYTE ux, BYTE uy);

int ReadContinue(int* len);

AnsiString sfaddr;
AnsiString sfname;

int scount;
bool manualstop;

bool* tServiceMode;
bool* pServiceMode;

bool processflag;

AnsiString offset_X;
AnsiString offset_Y;

//TCOMPort cport;

int SetNewAddr(unsigned char addr,unsigned char new_addr);

int gtimeout;


void TForm_IND3_Tune::StartTuningTimer(void);

};
//---------------------------------------------------------------------------
extern PACKAGE TForm_IND3_Tune *Form_IND3_Tune;
//---------------------------------------------------------------------------
#endif
