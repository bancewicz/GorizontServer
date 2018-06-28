//---------------------------------------------------------------------------
#ifndef MainH
#define MainH             Add
//---------------------------------------------------------------------------

#include <IdResourceStrings.hpp>

#include <IniFiles.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include "trayicon.h"
#include <ActnList.hpp>
#include <AppEvnts.hpp>
#include <Buttons.hpp>
#include <Chart.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <ImgList.hpp>
#include <Mask.hpp>
#include <Menus.hpp>
#include <ScktComp.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <TeeShape.hpp>
#include <ToolWin.hpp>
#include <Classes.hpp>
//---------------------------------------------------------------------------
class TConfig;
class TOPC;

#include <String.h>

#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "trayicon.h"
#include <AppEvnts.hpp>
#include <Menus.hpp>
#include <ImgList.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
#include "BS4I1Thr.h"
#include "BTCOM.h"
#include "BTPorts.h"
#include "Sensor.h"

#include "Unit3.h"

#include <ActnList.hpp>
#include <Buttons.hpp>
#include <Chart.hpp>
#include <Dialogs.hpp>
#include <Graphics.hpp>
#include <Mask.hpp>
#include <ScktComp.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <TeeShape.hpp>
#include <ToolWin.hpp>
#include <DdeMan.hpp>
#include <ScktComp.hpp>
#include <Graphics.hpp>
#include <Mask.hpp>
#include <Buttons.hpp>
#include <ActnList.hpp>
#include <Chart.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <ToolWin.hpp>
#include <TeeShape.hpp>
#include <Dialogs.hpp>

#include "SysConfMaster.h"

//---------------------------------------------------------------------------
class TFMain : public TForm
{
__published:	// IDE-managed Components
        TTrayIcon *Tray;
        TApplicationEvents *AppEvents;
        TPopupMenu *TrayMenu;
        TMenuItem *MTState;
        TMenuItem *MTExit;
        TTimer *TmHideExit;

//Формирование контекстного меню
        TPopupMenu *PortsMenu;
        TMenuItem *MPortOn;
        TMenuItem *MPortAdd;
        TMenuItem *MClose;
        TMenuItem *MPortDel;

        TMenuItem *N2;//???

        TMenuItem *MSensOn;
        TMenuItem *MSensDel;
        TMenuItem *MSensAdd;

        TMenuItem *N8;//???


        TTimer *TmUpdate;
        TImageList *Images16x16;
        TImageList *Images32x32;
        TMenuItem *N3;
        TPanel *PanelTV;
        TSplitter *SplitterTV;
        TPanel *Panel3;
        TPanel *Panel4;
        TSplitter *Splitter2;
        TPanel *Panel5;
        TPageControl *PC;
        TTabSheet *TSLog;

        TTreeView *TreeView;

        TTabSheet *TSSetup;


        TStatusBar *StatusBar;
        TTabSheet *TSTest;
        TRichEdit *RichEdit;
        TTimer *TmRun;
        TServerSocket *Server1;
        TTreeView *TVSrv;
        TImage *Image2;
        TImage *Image1;
        TTimer *TmStart;
        TTabSheet *TSSrsLog;
        TMemo *Memo;
        TTimer *TmSave;
        TTreeView *TVPrt;
        TTreeView *TVSrs;
        TMenuItem *MSetup;
        TMenuItem *N6;
        TServerSocket *Server2;
        TPageControl *PCW;
        TTabSheet *TSStat;
        TTabSheet *TabSheet2;
        TGroupBox *GroupBox2;
        TLabeledEdit *Eprtm;
        TLabeledEdit *Epdrz;
        TLabeledEdit *Epne;
        TLabeledEdit *Epr1;
        TGroupBox *GroupBox9;
        TLabeledEdit *Esn;
        TLabeledEdit *Ete;
        TLabeledEdit *Ece;
        TLabeledEdit *Ere;
        TGroupBox *GroupBox1;
        TLabeledEdit *Eedr;
        TLabeledEdit *Eete;
        TLabeledEdit *Eece;
        TLabeledEdit *Eere;
        TGroupBox *GroupBox10;
        TLabeledEdit *Etsn;
        TLabeledEdit *Ette;
        TLabeledEdit *Etre;
        TLabeledEdit *Etae;
        TPanel *Panel1;
        TButton *BOpen;
        TCheckBox *CBRes;
        TButton *BClose;
        TButton *BWrite;
        TButton *BRead;
        TEdit *ETime;
        TEdit *EWBytes;
        TEdit *EWTOut;
        TEdit *ERBytes;
        TEdit *ERTOut;
        TButton *BPurge;
        TButton *BCheck;
        TEdit *ECOM;
        TGroupBox *GroupBox4;
        TLabeledEdit *EWsn;
        TLabeledEdit *EWte;
        TLabeledEdit *EWce;
        TLabeledEdit *EWse;
        TEdit *EInfo;
        TComboBox *CBXInfo;
        TCheckBox *CBStat;
        TLabel *Label1;
        TPanel *Panel6;
        TLabeledEdit *ETmSave;
        TLabeledEdit *ETmRun;
        TCheckBox *CBFile;
        TPanel *Panel2;
        TCheckBox *CBFIR1;
        TButton *BFIR1;
        TButton *BFIR2;
        TCheckBox *CBFIR2;
        TCheckBox *CBIdle;
        TButton *BIdle;
        TButton *BTOut;
        TCheckBox *CBTOut;
        TButton *Bn50;
        TEdit *En50;
        TButton *Bt5av;
        TCheckBox *CBt5av;
        TButton *BTermo;
        TCheckBox *CBTermo;
        TButton *BDAdr;
        TCheckBox *CBDAdr;
        TButton *BAcmp;
        TCheckBox *CBAcmp;
        TButton *BFIR3;
        TCheckBox *CBFIR3;
        TButton *BPwr;
        TCheckBox *CBPwr;
        TMaskEdit *MEPass;
        TButton *BFile;
        TButton *BHide;
        TGroupBox *GroupBox5;
        TCheckBox *CBCRCErr;
        TCheckBox *CBWErr;
        TGroupBox *GroupBox6;
        TButton *BWriteStp;
        TButton *BGetStpC;
        TButton *BINI;
        TButton *BGetStpT;
        TButton *BGetStpN;
        TGroupBox *GroupBox7;
        TEdit *EVolC;
        TButton *BVolSN;
        TEdit *EVolD;
        TLabeledEdit *ERStp;
        TButton *BReset0;
        TButton *BReset;
        TButton *BProg;
        TButton *BBSAdr;
        TButton *BAdr;
        TEdit *EAdr;
        TEdit *EBSAdr;
        TButton *BRQAdr;
        TEdit *ERQAdr;
        TButton *BSetTmp;
        TEdit *EB1;
        TEdit *EB2;
        TEdit *Ecpn;
        TEdit *EdpCT;
        TStaticText *StaticText1;
        TStaticText *StaticText2;
        TStaticText *StaticText3;
        TEdit *Eptm;
        TSpeedButton *SBLens;
        TGroupBox *GroupBox3;
        TLabeledEdit *Etr;
        TLabeledEdit *Ept;
        TButton *BPulse;
        TEdit *Edtype;
        TButton *BStackOn;
        TCheckBox *CBStack;
        TButton *BStack0On;
        TGroupBox *GroupBox8;
        TButton *BStackOff;
        TButton *BStack0Off;
        TCheckBox *CBSClrOn;
        TCheckBox *CBSClrOff;
        TCheckBox *CBSProgClrOff;
        TCheckBox *CBSProgClrOn;
        TEdit *ESNGroup;
        TSpeedButton *SBGrid;
        TCheckBox *CBMStack;
        TButton *BStack;
        TCheckBox *CBMeteo;
        TButton *BMeteo;
        TButton *BCopyStp;
        TCheckBox *CBAver2;
        TComboBox *CBServer2;
        TCheckBox *CB128;
        TCheckBox *CBisX;
        TButton *BD3Set;
        TEdit *ETmax;
        TButton *BTmax;
        TButton *Bto10;
        TCheckBox *CBto10;
        TCheckBox *CBtostart;
        TButton *Btostart;
        TServerSocket *GPRSServer;
        TCheckBox *CBTCP;
        TButton *BTCP;
        TEdit *ETCP;
        TTabSheet *TSAcc;

        TImageList *ImageList;

        TActionList *ActionList;
        TAction *AOpen;
        TAction *ASave;
        TAction *APrint;
        TAction *AQuit;
        TAction *ASetup;
        TAction *AGo;
        TAction *AStop;
        TAction *ARes;
        TAction *AClear;
        TAction *ACopy;
        TAction *AAbout;
        TAction *AMeasStp;
        TAction *AChartDlg;
        TAction *ADel;
        TAction *ASelAll;
        TAction *AUndo;
        TAction *AShowRes;
        TToolBar *ToolBar;
        TToolButton *TBOpen;
        TToolButton *TBSave;
        TToolButton *TBPrint;
        TToolButton *ToolButton3;
        TToolButton *TBUndo;
        TToolButton *TBCopy;
        TToolButton *TBDel;
        TToolButton *ToolButton7;
        TToolButton *TBTest;
        TToolButton *TBMeasStp;
        TToolButton *TBChart;
        TToolButton *TBShowRes;
        TToolButton *ToolButton10;
        TToolButton *TBRes;
        TToolButton *ToolButton8;
        TToolButton *TBStart;
        TPanel *PAcc;
        TPopupMenu *PMMeas;
        TMenuItem *MMeasT1;
        TMenuItem *MMeasT0;
        TMenuItem *MMeasT2;
        TComboBox *CBProc;
        TChart *Chart;
        TLineSeries *Series3;
        TLineSeries *Series4;
        TLineSeries *Series5;
        TLineSeries *Series6;
        TLineSeries *Series7;
        TLineSeries *Series8;
        TLineSeries *Series9;
        TLineSeries *Series10;
        TLineSeries *Series11;
        TLineSeries *Series12;
        TLineSeries *Series13;
        TLineSeries *Series14;
        TLineSeries *Series15;
        TLineSeries *Series16;
        TLineSeries *Series17;
        TLineSeries *Series18;
        TLineSeries *Series19;
        TLineSeries *Series20;
        TLineSeries *Series21;
        TLineSeries *Series22;
        TLineSeries *Series23;
        TLineSeries *Series24;
        TLineSeries *Series25;
        TLineSeries *Series26;
        TLineSeries *Series27;
        TLineSeries *Series28;
        TLineSeries *Series29;
        TLineSeries *Series30;
        TLineSeries *Series31;
        TLineSeries *Series32;
        TFastLineSeries *LSTime;
        TChartShape *BSelect;

//Стандартный диалог выбора файла        
        TOpenDialog *OpenDialog;

        TTimer *TmChart;
        TStatusBar *StatusBar1;
        TToolButton *TBXY;
        TToolButton *TBCanSave;
        TAction *ACanSave;
        TCheckBox *CBTest;
        TComboBox *CBSNGroup;
        TToolButton *ToolButton1;
        TLineSeries *Series1;
        TLineSeries *Series2;
        TPageControl *PageControl2;
        TTabSheet *TSPrs;
        TListView *PortsList;
        TTabSheet *TSSens;
        TListView *SensList;
        TTabSheet *TSCOM;
        TListView *COMList;
        TTabSheet *TSSrs;
        TListView *SrsList;
        TTabSheet *TSLens;
        TLabel *Label2;
        TLabel *Label3;
        TEdit *ELX;
        TEdit *ELY;
        TTimer *Timer_SetVals;
        TTimer *Timer_OPCDataFill;
        TTimer *TimerOPCInstall;
        TMainMenu *MainMenu_server;
        TMenuItem *N1;
        TMenuItem *N4;
        TMenuItem *N5;
        TMenuItem *N9;
        TMenuItem *MSM_about;
        TMenuItem *N11;
        TMenuItem *N12;
        TMenuItem *MSM_port1;
        TMenuItem *MSM_port2;
        TMenuItem *MSM_port3;
        TMenuItem *MSM_port4;
        TMenuItem *MSM_port5;
        TMenuItem *MSM_port6;
        TMenuItem *MSM_port7;
        TMenuItem *MSM_port8;
        TMenuItem *MSM_manual;
        TMenuItem *N7;
        TMenuItem *MM_dataproc;
        TOpenDialog *OpenDialog_conf;
        TSaveDialog *SaveDialog_conf;
        TMenuItem *N14;
        TMenuItem *MFile_new;
        TMenuItem *N_backup;
        TImage *Image3;
        void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
        void __fastcall MTStateClick(TObject *Sender);
        void __fastcall MTExitClick(TObject *Sender);
        void __fastcall BOpenClick(TObject *Sender);
        void __fastcall TmHideExitTimer(TObject *Sender);
        void __fastcall MPortOnClick(TObject *Sender);
        void __fastcall MCOMClick(TObject *Sender);
        void __fastcall MSrsClick(TObject *Sender);
        void __fastcall PortsMenuPopup(TObject *Sender);
        void __fastcall BCloseClick(TObject *Sender);
        void __fastcall BWriteClick(TObject *Sender);
        void __fastcall BReadClick(TObject *Sender);
        void __fastcall BPurgeClick(TObject *Sender);
        void __fastcall BCheckClick(TObject *Sender);
        void __fastcall MPortDelClick(TObject *Sender);
        void __fastcall TmUpdateTimer(TObject *Sender);
        void __fastcall AppEventsMessage(tagMSG &Msg,
          bool &Handled);
        void __fastcall TrayClick(TObject *Sender);
        void __fastcall MSensOnClick(TObject *Sender);
        void __fastcall MSensDelClick(TObject *Sender);
        void __fastcall TreeViewDblClick(TObject *Sender);
        void __fastcall PortsListSelectItem(TObject *Sender,
          TListItem *Item, bool Selected);
        void __fastcall COMListSelectItem(TObject *Sender, TListItem *Item,
          bool Selected);
        void __fastcall SensListSelectItem(TObject *Sender,
          TListItem *Item, bool Selected);
        void __fastcall SrsListSelectItem(TObject *Sender, TListItem *Item,
          bool Selected);
        void __fastcall TmRunTimer(TObject *Sender);
        void __fastcall Server1Accept(TObject *Sender,TCustomWinSocket *Socket);
        void __fastcall Server1ClientDisconnect(TObject *Sender,TCustomWinSocket *Socket);
        void __fastcall Server1ClientError(TObject *Sender,TCustomWinSocket *Socket, TErrorEvent ErrorEvent,int &ErrorCode);
        void __fastcall Server1ClientRead(TObject *Sender,TCustomWinSocket *Socket);
        void __fastcall TVSrvCustomDrawItem(TCustomTreeView *Sender,
          TTreeNode *Node, TCustomDrawState State, bool &DefaultDraw);
        void __fastcall FormResize(TObject *Sender);
        void __fastcall TmStartTimer(TObject *Sender);
        void __fastcall TmSaveTimer(TObject *Sender);
        void __fastcall CBCRCErrClick(TObject *Sender);
        void __fastcall BResetClick(TObject *Sender);
        void __fastcall ETmRunChange(TObject *Sender);
        void __fastcall ETmSaveChange(TObject *Sender);
        void __fastcall CBWErrClic(TObject *Sender);
        void __fastcall TreeViewKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
        void __fastcall FormDestroy(TObject *Sender);
        void __fastcall Server2ClientRead(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall Server2Accept(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall Server2ClientDisconnect(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall Server2ClientError(TObject *Sender,
          TCustomWinSocket *Socket, TErrorEvent ErrorEvent,
          int &ErrorCode);
        void __fastcall BVolSNClick(TObject *Sender);
        void __fastcall MEPassChange(TObject *Sender);
        void __fastcall BFileClick(TObject *Sender);
        void __fastcall BHideClick(TObject *Sender);
        void __fastcall StatusBarDrawPanel(TStatusBar *StatusBar,
          TStatusPanel *Panel, const TRect &Rect);
        void __fastcall BINIClick(TObject *Sender);
        void __fastcall PCChange(TObject *Sender);
        void __fastcall SBLensClick(TObject *Sender);
        void __fastcall CBAver2Click(TObject *Sender);
        void __fastcall CB128Click(TObject *Sender);
        void __fastcall StatusBarMouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
        void __fastcall GPRSServerAccept(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall GPRSServerClientError(TObject *Sender,
          TCustomWinSocket *Socket, TErrorEvent ErrorEvent,
          int &ErrorCode);
        void __fastcall GPRSServerClientDisconnect(TObject *Sender,
          TCustomWinSocket *Socket);
        void __fastcall BTCPClick(TObject *Sender);
        void __fastcall BPlotClick(TObject *Sender);
        void __fastcall AGoExecute(TObject *Sender);
        void __fastcall MMeasT0Click(TObject *Sender);
        void __fastcall AOpenExecute(TObject *Sender);
        void __fastcall OpenDialogCanClose(TObject *Sender,
          bool &CanClose);
        void __fastcall TmChartTimer(TObject *Sender);
        void __fastcall AStopExecute(TObject *Sender);
        void __fastcall AChartDlgExecute(TObject *Sender);
        void __fastcall TBXYClick(TObject *Sender);
        void __fastcall ACanSaveExecute(TObject *Sender);
        void __fastcall ToolButton1Click(TObject *Sender);
        void __fastcall ACopyExecute(TObject *Sender);
        void __fastcall Button_Tst1Click(TObject *Sender);
        void __fastcall TimerOPCInstallTimer(TObject *Sender);
        void __fastcall MPortAddClick(TObject *Sender);
        void __fastcall MSetupClick(TObject *Sender);
        void __fastcall MSM_aboutClick(TObject *Sender);
        void __fastcall N5Click(TObject *Sender);
        void __fastcall N4Click(TObject *Sender);
        void __fastcall TreeViewClick(TObject *Sender);
        void __fastcall MMenu_ind3Click(TObject *Sender);
        void __fastcall MMenu_and3Click(TObject *Sender);
        void __fastcall MSM_manualClick(TObject *Sender);
        void __fastcall MSM_port1Click(TObject *Sender);
        void __fastcall MSM_port2Click(TObject *Sender);
        void __fastcall MSM_port3Click(TObject *Sender);
        void __fastcall MSM_port4Click(TObject *Sender);
        void __fastcall MSM_port5Click(TObject *Sender);
        void __fastcall MSM_port6Click(TObject *Sender);
        void __fastcall MSM_port7Click(TObject *Sender);
        void __fastcall MSM_port8Click(TObject *Sender);
        void __fastcall N14Click(TObject *Sender);
        void __fastcall MSensAddClick(TObject *Sender);
        void __fastcall MFile_newClick(TObject *Sender);
        void __fastcall N_backupClick(TObject *Sender);
        void __fastcall MM_dataprocClick(TObject *Sender);
        void __fastcall N7Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TFMain(TComponent* Owner);
        void __fastcall UpdatePortsList(void);
        void __fastcall UpdateSensList(void);
        void __fastcall UpdateSrs(void);
        void __fastcall UpdatePort(void);
        //void __fastcall UpdateTray(void);
        void __fastcall UpdateTree(void);
        void __fastcall UpdateStat(void);
        void __fastcall UpdateTV(void);
        void __fastcall UpdateLog(void);
        DWORD GetSensWState(TBTSensor *S);
        WORD GetWWState(TBTSensor *S);
        int COMState(TBTPortState *PS,AnsiString* s);
        int SrsState(TBTSensor *S,AnsiString* s);
        void INI(bool read);
        bool WriteRes(double time,AnsiString s,AnsiString t);
        bool AddMessage(int type,AnsiString s);
        void SetEnAct(TBTSensor *S);

        void TFMain::IND3Tune(TTreeNode*  node);

private:

          TConfig *Config;
          TOPC *OPC;
          //TStringList *Tags, *Vals;
          TStrings *Tags, *Vals;

//Флаг - признак передачи данных клиенту OPC
//bool      OPCDataSentFlag;
//Флаг - данные для передачи клиенту OPC готовы
//bool      OPCDataFillFlag;

          void OPCDataFill(void);

public:
          TStrings* __fastcall GetTags() {return Tags;}

          TStrings* __fastcall GetVals(void);
          TStrings* __fastcall SetOPCVals(void);

          float tval;

          float fval;

          void OPCTagsCreate(void);

          BOOL IsAppRunningAsAdminMode(void);
          void GetTreeViewPar(void);
          void PortsAudit(void);
          void PortScanAndSensorAdjust(int iport);
          void SaveSystemConf(void);
          SysConfMasterInit();

          TSysConfMaster SysConfMaster;

          TIniFile* gIniFile;
          
          void HotRestart();

          void RestartSystem(int par);
          void RestartPort(TCOMPort* port, int pnum);
          void RestartSensor(TBTSensor* sensor, int snum);
          void SetExtendedMode();


};
//---------------------------------------------------------------------------
extern PACKAGE TFMain *FMain;
//---------------------------------------------------------------------------
#endif
