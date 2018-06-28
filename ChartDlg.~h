//----------------------------------------------------------------------------
#ifndef ChartDlgH
#define ChartDlgH
//----------------------------------------------------------------------------
#include <vcl\System.hpp>
#include <vcl\Windows.hpp>
#include <vcl\SysUtils.hpp>
#include <vcl\Classes.hpp>
#include <vcl\Graphics.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Controls.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\ExtCtrls.hpp>
#include <ComCtrls.hpp>
#include <Mask.hpp>
#include <vcl.h>
//----------------------------------------------------------------------------
typedef struct
{
  byte ChOn;
  // Линия
  TColor LCol;
  byte   LWidth;
  byte   LStyle;
  byte   LOn;
  // Маркер
  TColor PCol;
  byte   PWidth;
  byte   PHeight;
  byte   PStyle;
  byte   POn;
  // Кромка
  byte   BWidth;
  TColor BCol;
  byte   BOn;
  // 22 байта
  byte reserve[100-22];
} SStpSrs;
//----------------------------------------------------------------------------
typedef struct
{
  // Шкала
  byte AXMin;
  byte AXMax;
  double XMin;
  double XMax;
  double XDiv;
  byte AYMin;
  byte AYMax;
  double YMin;
  double YMax;
  double YDiv;
  // Легенда
  byte LOn;
  byte LPos;
  byte LTop;
  byte LWidth;
  byte LLines;
  byte TFmt;
  // 58 байт
  byte reserve1[200-58];
  SStpSrs Srs[32];
  byte reserve2[5000-200-32*100];
} SStpChart;
//----------------------------------------------------------------------------
class TFChartDlg : public TForm
{
__published:        
	TButton *OKBtn;
	TButton *CancelBtn;
        TPageControl *PCDiagram;
        TTabSheet *TSLine;
        TLabel *Label12;
        TLabel *Label13;
        TLabel *Label14;
        TColorBox *CBLCol;
        TComboBox *CBLStyle;
        TCheckBox *CBPOn;
        TUpDown *UpLWidth;
        TTabSheet *TSPoint;
        TLabel *Label15;
        TLabel *Label16;
        TLabel *Label17;
        TLabel *Label18;
        TLabel *Label19;
        TLabel *Label20;
        TColorBox *CBPCol;
        TCheckBox *CBPtOn;
        TUpDown *UDPWidth;
        TUpDown *UDPHeight;
        TComboBox *CBPStyle;
        TUpDown *UDBWidth;
        TColorBox *CBBCol;
        TCheckBox *CBBOn;
        TTabSheet *TSScale;
        TGroupBox *GBX;
        TLabel *Label1;
        TCheckBox *CBXMin;
        TCheckBox *CBXMax;
        TEdit *EXMin;
        TEdit *EXMax;
        TGroupBox *GBY;
        TLabel *Label4;
        TCheckBox *CBYMin;
        TCheckBox *CBYMax;
        TEdit *EYMin;
        TEdit *EYMax;
        TEdit *ELnWidth;
        TEdit *EPWidth;
        TEdit *EPHeight;
        TEdit *EBWidth;
        TComboBox *CBCh1;
        TLabel *Label7;
        TBevel *Bevel1;
        TBevel *Bevel3;
        TBevel *Bevel5;
        TCheckBox *CBChOn1;
        TBevel *Bevel4;
        TLabel *Label8;
        TComboBox *CBCh2;
        TCheckBox *CBChOn2;
        TTabSheet *TSLeg;
        TBevel *Bevel6;
        TCheckBox *CBLOn;
        TLabel *Label9;
        TComboBox *CBLPos;
        TLabel *Label10;
        TEdit *ELTop;
        TUpDown *UDLTop;
        TEdit *ELWidth;
        TUpDown *UDLWidth;
        TLabel *Label11;
        TCheckBox *CBLLines;
        TCheckBox *CBXDiv;
        TEdit *EXDiv;
        TCheckBox *CBYDiv;
        TEdit *EYDiv;
        TComboBox *CBYType;
        TComboBox *CBXType;
        TDateTimePicker *DXMin;
        TDateTimePicker *TXMin;
        TLabel *Label2;
        TLabel *Label3;
        TDateTimePicker *DXMax;
        TDateTimePicker *TXMax;
        TComboBox *CBTFmt;
        TLabel *LTFmt;
        TComboBox *CBFormat;
        TLabel *Label5;
        TLabel *Label6;
        TComboBox *CBCWidth;
        void __fastcall EXMinChange(TObject *Sender);
        void __fastcall EXMaxChange(TObject *Sender);
        void __fastcall EYMinChange(TObject *Sender);
        void __fastcall EYMaxChange(TObject *Sender);
        void __fastcall FormActivate(TObject *Sender);
        void __fastcall OKBtnClick(TObject *Sender);
        void __fastcall EXDivChange(TObject *Sender);
        void __fastcall EYDivChange(TObject *Sender);
        void __fastcall CBCh1Change(TObject *Sender);
        void __fastcall CBCh2Change(TObject *Sender);
        void __fastcall CBChOn1Click(TObject *Sender);
        void __fastcall CBChOn2Click(TObject *Sender);
        void __fastcall CBLColChange(TObject *Sender);
        void __fastcall CBLStyleChange(TObject *Sender);
        void __fastcall UpLWidthClick(TObject *Sender, TUDBtnType Button);
        void __fastcall CBPOnClick(TObject *Sender);
        void __fastcall CBPColChange(TObject *Sender);
        void __fastcall UDPWidthClick(TObject *Sender, TUDBtnType Button);
        void __fastcall UDPHeightClick(TObject *Sender, TUDBtnType Button);
        void __fastcall CBPStyleChange(TObject *Sender);
        void __fastcall CBPtOnClick(TObject *Sender);
        void __fastcall UDBWidthClick(TObject *Sender, TUDBtnType Button);
        void __fastcall CBBColChange(TObject *Sender);
        void __fastcall CBBOnClick(TObject *Sender);
        void __fastcall CBLPosChange(TObject *Sender);
        void __fastcall UDLTopClick(TObject *Sender, TUDBtnType Button);
        void __fastcall UDLWidthClick(TObject *Sender, TUDBtnType Button);
        void __fastcall CBLLinesClick(TObject *Sender);
        void __fastcall CBLOnClick(TObject *Sender);
        void __fastcall CBXTypeChange(TObject *Sender);
        void __fastcall DXMinChange(TObject *Sender);
        void __fastcall TXMinChange(TObject *Sender);
        void __fastcall DXMaxChange(TObject *Sender);
        void __fastcall TXMaxChange(TObject *Sender);
        void __fastcall TXDivChange(TObject *Sender);
        void __fastcall CBTFmtChange(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CBFormatChange(TObject *Sender);
        void __fastcall CBCWidthChange(TObject *Sender);
private:
public:
	virtual __fastcall TFChartDlg(TComponent* AOwner);
	void InitStpChart(SStpChart *S);
	void SetChart(SStpChart *S,bool set);
};
//----------------------------------------------------------------------------
extern PACKAGE TFChartDlg *FChartDlg;
//----------------------------------------------------------------------------
#endif    
