//---------------------------------------------------------------------------

#ifndef Unit_AND3TuneH
#define Unit_AND3TuneH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>

#include "BTCOM.h"
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include <Mask.hpp>
#include <ComCtrls.hpp>

//---------------------------------------------------------------------------

#define AND3_PACKLEN 32
#define AND3_PACKLIM 1

typedef struct {

  short   x[AND3_PACKLEN];
  short   y[AND3_PACKLEN];
  DWORD stCT; // Начало пакета CoreTime
  DWORD spCT; // Конец пакета CoreTime
  DWORD tmpCT;// 1.0.2 CoreTime*tmCT
  WORD  ne;   // 1.0.2 количество ошибок
  WORD drz;   // удачные измерения с замораживанием для ускорений до конца пакета
  short  AX;  // 1.0.2
  short  AY;  //

} AND3_packet;




typedef struct {

 BYTE addr;
 BYTE cmd;
 BYTE data1;
 BYTE data2;
 int  rlen;

} AND3cmd;


//---------------------------------------------------------------------------
class TForm_AND3_Tune : public TForm
{
__published:	// IDE-managed Components
        TButton *Button_GetAll;
        TGroupBox *GroupBox1;
        TLabeledEdit *LabeledEdit_X;
        TLabeledEdit *LabeledEdit_Y;
        TGroupBox *GroupBox2;
        TLabeledEdit *LabeledEdit_mtotal;
        TGroupBox *GroupBox3;
        TLabeledEdit *LabeledEdit_tempr;
        TLabeledEdit *LabeledEdit_tacho;
        TLabeledEdit *LabeledEdit_powr;
        TTimer *Timer_cmon;
        TButton *Button_bufreset;
        TGroupBox *GroupBox4;
        TCheckBox *CheckBox_buf;
        TGroupBox *GroupBox5;
        TLabel *Label12;
        TLabel *Label13;
        TComboBox *ComboBox_com_baud_rate;
        TComboBox *ComboBox_com_number;
        TButton *Button_com_open;
        TGroupBox *GroupBox6;
        TLabel *Label3;
        TLabel *Label5;
        TComboBox *ComboBox_baud_rate;
        TButton *Button_check_addr;
        TComboBox *ComboBox_and3addr;
        TButton *Button_buffill;
        TEdit *Edit_bufon;
        TGroupBox *GroupBox7;
        TButton *Button_bufsetup;
        TCheckBox *CheckBox_bufclear;
        TCheckBox *CheckBox_bufstart;
        TGroupBox *GroupBox8;
        TMaskEdit *MaskEdit_bufthreshold;
        TLabel *Label1;
        TCheckBox *CheckBox_reset;
        TCheckBox *CheckBox_dataready;
        TCheckBox *CheckBox_readytemp;
        TCheckBox *CheckBox_readyfan;
        TCheckBox *CheckBox_readerr;
        TCheckBox *CheckBox_crcerr;
        TCheckBox *CheckBox_rangerr;
        TCheckBox *CheckBox_temperr;
        TCheckBox *CheckBox_rtemperr;
        TCheckBox *CheckBox_fanerr;
        TCheckBox *CheckBox_termerr;
        TCheckBox *CheckBox_addrseek;
        TCheckBox *CheckBox_termon;
        TCheckBox *CheckBox_f1off;
        TCheckBox *CheckBox_f2off;
        TCheckBox *CheckBox_idleoff;
        TCheckBox *CheckBox_toutoff;
        TCheckBox *CheckBox_tavr;
        TCheckBox *CheckBox_termoff;
        TCheckBox *CheckBox_addrdetectoff;
        TCheckBox *CheckBox_acompoff;
        TCheckBox *CheckBox_fl3off;
        TCheckBox *CheckBox_dpwroff;
        TCheckBox *CheckBox_msoff;
        TGroupBox *GroupBox9;
        TCheckBox *CheckBox_toutrequest;
        TCheckBox *CheckBox_br115200;
        TCheckBox *CheckBox_tout10;
        TGroupBox *GroupBox10;
        TLabeledEdit *LabeledEdit_corefr;
        TLabeledEdit *LabeledEdit_acaddr;
        TLabeledEdit *LabeledEdit_d3addr;
        TLabeledEdit *LabeledEdit_fdevider;
        TBitBtn *BitBtn_sys;
        TProgressBar *ProgressBar_scan;
        TLabel *Label2;
        TTimer *Timer_and2scan;
        TButton *Button_exit;
        TButton *Button_scan;
        TTimer *Timer_gstart;
        TEdit *Edit_cmon;
        TLabel *Label4;
        TButton *Button_adrind3;
        TComboBox *ComboBox_a4nad;
        TComboBox *ComboBox_d3na;
        TButton *Button_copytmp;
        TButton *Button_settmp;
        TButton *Button_write;
        TLabel *Label6;
        TButton *Button_writea;
        TButton *Button_writed;
        TButton *Button_reset;
        TTimer *Timer_reset;
        TTimer *Timer_bufread;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button_GetAllClick(TObject *Sender);
        void __fastcall Timer_cmonTimer(TObject *Sender);
        void __fastcall Button_bufresetClick(TObject *Sender);
        void __fastcall CheckBox_bufClick(TObject *Sender);
        void __fastcall CheckBox_f3offClick(TObject *Sender);
        void __fastcall Button_buffillClick(TObject *Sender);
        void __fastcall Button_bufsetupClick(TObject *Sender);
        void __fastcall CheckBox_f1offClick(TObject *Sender);
        void __fastcall CheckBox_f2offClick(TObject *Sender);
        void __fastcall CheckBox_idleoffClick(TObject *Sender);
        void __fastcall CheckBox_toutoffClick(TObject *Sender);
        void __fastcall CheckBox_tavrClick(TObject *Sender);
        void __fastcall CheckBox_termoffClick(TObject *Sender);
        void __fastcall CheckBox_fl3offClick(TObject *Sender);
        void __fastcall CheckBox_addrdetectoffClick(TObject *Sender);
        void __fastcall CheckBox_acompoffClick(TObject *Sender);
        void __fastcall CheckBox_dpwroffClick(TObject *Sender);
        void __fastcall CheckBox_msoffClick(TObject *Sender);
        void __fastcall CheckBox_toutrequestClick(TObject *Sender);
        void __fastcall CheckBox_br115200Click(TObject *Sender);
        void __fastcall CheckBox_tout10Click(TObject *Sender);
        void __fastcall BitBtn_sysClick(TObject *Sender);
        void __fastcall Timer_and2scanTimer(TObject *Sender);
        void __fastcall Button_exitClick(TObject *Sender);
        void __fastcall Button_scanClick(TObject *Sender);
        void __fastcall ComboBox_and3addrChange(TObject *Sender);
        void __fastcall Timer_gstartTimer(TObject *Sender);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall Button_adrind3Click(TObject *Sender);
        void __fastcall Button_copytmpClick(TObject *Sender);
        void __fastcall Button_writeClick(TObject *Sender);
        void __fastcall Button_settmpClick(TObject *Sender);
        void __fastcall Button_resetClick(TObject *Sender);
        void __fastcall Button_writedClick(TObject *Sender);
        void __fastcall Button_writeaClick(TObject *Sender);
        void __fastcall Timer_resetTimer(TObject *Sender);

private:	// User declarations
public:		// User declarations
        __fastcall TForm_AND3_Tune(TComponent* Owner);

        TCOMPort* ComPort;

void AND3_GetAll(void);
void AND3_AddCmd(BYTE addr, BYTE cmd, BYTE data1, BYTE data2, int rlen);
void AND3_CurCmd(void);
void SetModePar (TCheckBox* c, int bit);
void GetSysConf(int par);
void StartScan(void);
void Start(void);
void StartBufRead(void);


bool*   ComServiceMode;
bool*  ThrServiceMode;

};
//---------------------------------------------------------------------------
extern PACKAGE TForm_AND3_Tune *Form_AND3_Tune;
//---------------------------------------------------------------------------
#endif
