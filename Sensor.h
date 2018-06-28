// Sensor.h
//---------------------------------------------------------------------------
#ifndef SENSOR
#define SENSOR
//-----------------------------------------------------------------------------
#include "BTCOM.h"
#include <stdio.h>
//-----------------------------------------------------------------------------
typedef struct
{
  DWORD GetAll:1;
  DWORD Reset:1;
  DWORD SetAdr:1;
  DWORD GetStp:1;
  DWORD WriteStp:1;
  DWORD CopyStp:1;
  DWORD NVMState:1;
  DWORD SetTmp:1;

  DWORD Prog:1;
  DWORD D3Set:1;
  DWORD ResErr:1;
  DWORD GetXYCur:1;
  DWORD d3stat:1;
  DWORD t5stat:1;
  DWORD wstat:1;
  DWORD wres:1;

  DWORD GetInfo:1;
  DWORD MODE:1;
  DWORD StackOn:1;
  DWORD StackSOn:1;
  DWORD StackOff:1;
  DWORD Setn50:1;
  DWORD SetTmax:1;
  DWORD SetPulse:1;

  DWORD r4:1;
  DWORD r5:1;
  DWORD r6:1;
  DWORD r7:1;
  DWORD r8:1;
  DWORD r9:1;
  DWORD r10:1;
  DWORD r11:1;
} BS4I1_UserCmdSet;
//-----------------------------------------------------------------------------------------
typedef struct
{
  BS4I1_UserCmdSet cs;
  int  adr;
  int  tstp;
  int  infoix;
  DWORD info;
  WORD n50;
  char Tmax;

  DWORD tick_rate;
  DWORD puls_time;
  BYTE  del_type;

  BYTE mode_com;
  BYTE mode_on;

  bool SClrOn;      // ������� ���������� ���� ��� �������
  bool SClrOff;     // ������� ���������� ���� ��� ���������
  bool SProgClrOn;  // ������� ����������� ���� ��� �������
  bool SProgClrOff; // ������� ����������� ���� ��� ���������
  WORD nGroup;      // 1.0.2 1...16383 - ������������� ����� ������ ������ nGroup �������

  bool bsadr;
} BS4I1_UserCmd;
//-----------------------------------------------------------------------------------------
typedef struct
{
  WORD te; // ������ ������ �������
  WORD ce; // ������ CRC �������
  WORD re; // ������ ��������� �������
  WORD dr; // ������� ��������� c ����������� ������� ��� ����� 
  WORD drz;// ������� ��������� � �������������� ��� ���������
} BS4I1_NResErr;
//-----------------------------------------------------------------------------------------
typedef struct
{
  DWORD sn;
  WORD  te;
  WORD  ce;
  WORD  re;
} BS4I1_d3stat;
//-----------------------------------------------------------------------------------------
typedef struct
{
  DWORD sn;
  WORD  te;
  WORD  re;
  WORD  ae;
} BS4I1_t5stat;
//-----------------------------------------------------------------------------------------
typedef struct
{
  short U;
  short V;
  BYTE  s;
} BS4I1_wres;
//-----------------------------------------------------------------------------------------
typedef struct
{
  DWORD  sn; // ���������� ��������
  WORD   te; // ������ TimeOut
  WORD   ce; // ������ CRC
  WORD   se; // ������ �������
} BS4I1_wstat;
//-----------------------------------------------------------------------------------------
typedef struct
{
  WORD nofir1:1;   // ��������� ������ 1
  WORD nofir2:1;   // ��������� ������ 2
  WORD noidle:1;   // ��������� IDLE
  WORD nod3:1;     // ��������� ��������

  WORD not5av:1;   // �� ��������� �� �����������
  WORD notrm:1;    // ��������� ��������������
  WORD nostack:1;  // �� ��������� ����� �������������
  WORD noadrdet:1; // �� ������������� ����� �������

  WORD noacmp:1;   // �� �������������� ��������� �� 0 �������
  WORD nofir3:1;   // ��������� ������ 3
  WORD nopwr:1;    // ��������� ������� �������� ��� ��
  WORD nometeo:1;  // ��������� ������������

   // WORD reserved:4;
  WORD  tostart:1;  // ������ �� ��������      // !!! 1.202
  WORD    br115:1;  // �������� 115200         // !!! 1.202
  WORD     to10:1;  // ������� 10 �� (��� 5 ��)// !!! 1.202
  WORD reserved:1;
} BS4I1_MODE;
//-----------------------------------------------------------------------------------------
typedef struct
{
  WORD  frst:1; // ������������
  WORD   fdr:1; // ���������� ������ �������
  WORD ft5dr:1; // ���������� ������ �����������
  WORD fthdr:1; // ���������� ������ �����������

  WORD   fte:1; // ������ ������ �������
  WORD   fce:1; // ������ CRC �������
  WORD   fre:1; // ������ ��������� �������
  WORD    r1:1; // ������

  WORD ft5te:1; // ������ ������ �����������
  WORD ft5re:1; // ������ ��������� �����������
  WORD fthre:1; // ������ ������� �����������
  WORD ftrme:1; // ������ ���������������

  WORD  fadr:1; // ���� ����� ������
  WORD  ftrm:1; // �������������� �������
  WORD    r2:1; // ������
  WORD    r3:1; // ������
} BS4I1_SW;
//-----------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
// ����� /////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------
// 1.0.1
//#define NUM_PACKS 16
//#define PACK_SIZE 256
// 1.0.2
#define NUM_PACKS 128
#define PACK_SIZE 32
#define TCP_MAX_SIZE  8192
extern int SrsBufPSize,SrsBufToSave;
//-----------------------------------------------------------------------------------------
typedef struct
{
  short   x[PACK_SIZE];
  short   y[PACK_SIZE];
  DWORD stCT; // ������ ������ CoreTime
  DWORD spCT; // ����� ������ CoreTime
  DWORD tmpCT;// 1.0.2 CoreTime*tmCT
  WORD  ne;   // 1.0.2 ���������� ������
  WORD drz;   // ������� ��������� � �������������� ��� ��������� �� ����� ������
  short  AX;  // 1.0.2
  short  AY;  //
} BS4I1_D3Packet;
//-----------------------------------------------------------------------------------------
//  TSBuf
//-----------------------------------------------------------------------------------------
class TSBuf
{
  private:
  public:
  bool on;
  //****************************************************************************
  FILE* fx;
  FILE* fy;

  AnsiString xname;
  AnsiString yname;

  AnsiString txname;
  AnsiString tyname;

  //****************************************************************************
  DWORD res_pn;// ���������� ��������� GetAll
  DWORD nmeas; // �������� �������
  DWORD nsave; // ��������� �������
  DWORD nread; // ������� � �������� ������� � �����
  int   nmiss; // ��������� �������
  DWORD ncalc; // ���������� �������
  DWORD ecount;// ���������� ������� � ��������
  WORD   sw;   // ����� ��������� // TODO
  //****************************************************************************
  // ������ new // 1.0.2
  //****************************************************************************
  //BS4I1_WPacket* Packet_buf; // ������������ ������
  //short* U;                  // Server2 type==5
  //short* V;                  // Server2 type==6
  //double* Time_buf;          // Server2 type==7
  //DWORD* nmeas_buf;          // Server2 type==8 ��� ������������� ������� ��� � PC
  //float *UAver,*VAver,*UMax,*VMax;
  //BYTE* s;
  BS4I1_D3Packet* Packet_buf; // ������������ ������
  short *X,*Y;         // type==0,type==1
  double* Time_buf;    // type==4
  DWORD* nmeas_buf;    // ��� ������������� ������� ��� � PC
  //float* AccXYrms_buf; // type==3
  float *XAver,*YAver,*XMax,*YMax,*XRms,*YRms,*XYRms;
  BYTE* s;             // status
  //****************************************************************************
  bool SaveBuf(AnsiString dirname,int srs);
  
  void InitBuf(bool isNew)
  {
    if((isNew)&&(X==NULL))  X=new short[SrsBufPSize*PACK_SIZE];
    if((isNew)&&(Y==NULL))  Y=new short[SrsBufPSize*PACK_SIZE];
    //if((isNew)&&(AccXYrms_buf==NULL)) AccXYrms_buf=new float[SrsBufPSize];
    if((isNew)&&(Time_buf==NULL)) Time_buf=new double[SrsBufPSize];
    if((isNew)&&(Packet_buf==NULL))   Packet_buf=new BS4I1_D3Packet[SrsBufPSize];
    if((isNew)&&(nmeas_buf==NULL)) nmeas_buf=new DWORD[SrsBufPSize];

    if((isNew)&&(XAver==NULL)) XAver=new float[SrsBufPSize];
    if((isNew)&&(YAver==NULL)) YAver=new float[SrsBufPSize];
    if((isNew)&&(XMax==NULL))  XMax=new float[SrsBufPSize];
    if((isNew)&&(YMax==NULL))  YMax=new float[SrsBufPSize];
    if((isNew)&&(XRms==NULL))  XRms=new float[SrsBufPSize];
    if((isNew)&&(YRms==NULL))  YRms=new float[SrsBufPSize];
    if((isNew)&&(XYRms==NULL)) XYRms=new float[SrsBufPSize];
    if((isNew)&&(s==NULL))     s=new BYTE[SrsBufPSize];

    if((!isNew)&&(X!=NULL)) {delete[] X;X=NULL;}
    if((!isNew)&&(Y!=NULL)) {delete[] Y;Y=NULL;}
    //if((!isNew)&&(AccXYrms_buf!=NULL)){delete[] AccXYrms_buf;AccXYrms_buf=NULL;}
    if((!isNew)&&(Time_buf!=NULL)){delete[] Time_buf;Time_buf=NULL;}
    if((!isNew)&&(Packet_buf!=NULL)){delete[] Packet_buf;Packet_buf=NULL;}
    if((!isNew)&&(nmeas_buf!=NULL)){delete[] nmeas_buf;nmeas_buf=NULL;}

    if((!isNew)&&(XAver!=NULL)){delete[] XAver;XAver=NULL;}
    if((!isNew)&&(YAver!=NULL)){delete[] YAver;YAver=NULL;}
    if((!isNew)&&(XMax!=NULL)) {delete[] XMax; XMax=NULL;}
    if((!isNew)&&(YMax!=NULL)) {delete[] YMax; YMax=NULL;}
    if((!isNew)&&(XRms!=NULL)) {delete[] XRms; XRms=NULL;}
    if((!isNew)&&(YRms!=NULL)) {delete[] YRms; YRms=NULL;}
    if((!isNew)&&(XYRms!=NULL)){delete[] XYRms;XYRms=NULL;}

    if((!isNew)&&(s!=NULL)) {delete[] s;s=NULL;}
  }
  void Clr(void);
  TSBuf(void) {on=false;Clr();};
  virtual ~TSBuf() {InitBuf(false);if(fx!=NULL) fclose(fx);if(fy!=NULL) fclose(fy);};
};
//-----------------------------------------------------------------------------------------
//  TSWBuf
//-----------------------------------------------------------------------------------------
typedef struct
{
  short   u[PACK_SIZE],v[PACK_SIZE];
  BYTE    s[PACK_SIZE];
  DWORD stCT;  // start CoreTime
  DWORD spCT;  // stop  CoreTime
  DWORD tmpCT; // CoreTime*tmpCT
} BS4I1_WPacket;
//-----------------------------------------------------------------------------------------
class TSWBuf
{
  private:
  public:
  bool on;
  //****************************************************************************
  FILE* fx;
  FILE* fy;
  AnsiString xname;
  AnsiString yname;
  //****************************************************************************
  DWORD res_pn;// ���������� ��������� GetMWStat
  DWORD nmeas; // �������� �������
  DWORD nsave; // ��������� �������
  DWORD nread; // ������� � �������� ������� � �����
  int   nmiss; // ��������� �������
  DWORD ncalc; // ���������� �������
  DWORD ecount;// ���������� ������� � ��������
  //****************************************************************************
  // ������ new // 1.0.2
  //****************************************************************************
  BS4I1_WPacket* Packet_buf; // ������������ ������
  short* U;                  // Server2 type==5
  short* V;                  // Server2 type==6
  double* Time_buf;          // Server2 type==7
  DWORD* nmeas_buf;          // Server2 type==8 ��� ������������� ������� ��� � PC
  float *UAver,*VAver,*UMax,*VMax,*URms,*VRms;
  BYTE* s;
  //****************************************************************************
  bool SaveBuf(AnsiString dirname,int srs);

  void InitBuf(bool isNew)
  {
    if((isNew)&&(U==NULL))  U=new short[SrsBufPSize*PACK_SIZE];
    if((isNew)&&(V==NULL))  V=new short[SrsBufPSize*PACK_SIZE];
    if((isNew)&&(Time_buf==NULL))  Time_buf=new double[SrsBufPSize];
    if((isNew)&&(Packet_buf==NULL))Packet_buf=new BS4I1_WPacket[SrsBufPSize];
    if((isNew)&&(nmeas_buf==NULL)) nmeas_buf=new DWORD[SrsBufPSize];

    if((isNew)&&(UAver==NULL)) UAver=new float[SrsBufPSize];
    if((isNew)&&(VAver==NULL)) VAver=new float[SrsBufPSize];
    if((isNew)&&(UMax==NULL))  UMax=new float[SrsBufPSize];
    if((isNew)&&(VMax==NULL))  VMax=new float[SrsBufPSize];
    if((isNew)&&(URms==NULL))  URms=new float[SrsBufPSize];
    if((isNew)&&(VRms==NULL))  VRms=new float[SrsBufPSize];
    if((isNew)&&(s==NULL))     s=new BYTE[SrsBufPSize];

    if((!isNew)&&(U!=NULL)) {delete[] U;U=NULL;}
    if((!isNew)&&(V!=NULL)) {delete[] V;V=NULL;}
    if((!isNew)&&(Time_buf!=NULL)){delete[] Time_buf;Time_buf=NULL;}
    if((!isNew)&&(Packet_buf!=NULL)){delete[] Packet_buf;Packet_buf=NULL;}
    if((!isNew)&&(nmeas_buf!=NULL)){delete[] nmeas_buf;nmeas_buf=NULL;}

    if((!isNew)&&(UAver!=NULL)){delete[] UAver;UAver=NULL;}
    if((!isNew)&&(VAver!=NULL)){delete[] VAver;VAver=NULL;}
    if((!isNew)&&(UMax!=NULL)) {delete[] UMax;UMax=NULL;}
    if((!isNew)&&(VMax!=NULL)) {delete[] VMax;VMax=NULL;}
    if((!isNew)&&(URms!=NULL)) {delete[] URms;URms=NULL;}
    if((!isNew)&&(VRms!=NULL)) {delete[] VRms;VRms=NULL;}
    if((!isNew)&&(s!=NULL))    {delete[] s;s=NULL;}
  }
  void Clr(void);
  TSWBuf(void) {on=false;Clr();};
  virtual ~TSWBuf() {InitBuf(false);if(fx!=NULL) fclose(fx);if(fy!=NULL) fclose(fy);};
};
//-----------------------------------------------------------------------------------------
// ��������� //////////////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------------------
typedef struct
{
  // ����
  DWORD sys_frq; //  0:4 ������� ����
  // �����
  BYTE adr;      //  4:1 ����� ����������
  // ������ ��-�3
  BYTE d3adr;    //  5:1 ����� ������� ��-�3 (��� ������� 5 ���� - �� 0 �� 124)
  BYTE d3maxadr; //  6:1 ������������ ����� ������� ��-�3
  BYTE rb1;      //  7:1 ������
  // �����������
  WORD t5nav;    //  8:2 ���������� ����� ���������� �� �����������
  WORD t5nerr;   // 10:2 ���������� ���������� ������ �� ����������� ��� ����������
  WORD t5hmin;   // 12:2 ����������� ���������� ������� �������� �������� �����������
  // ������
  WORD neadr;    // 14:2 ������� ����� ����� ������� �� ����������� ����� sw.fte
  WORD nte;      // 16:2 ������ ������ �� ����������� ����� sw.fte
  WORD nce;      // 18:2 ������ CRC �� ����������� ����� sw.fce
  WORD nre;      // 20:2 ������ ��������� �� ����������� ����� sw.fre
  WORD ndr;      // 22:2 ������� ��������� �� ����������� ����� sw.fdr

  WORD ntrm;     // 24:2 ������ ������������������ �� ����������� ����� sw.ftrme
  WORD nthrd;    // 26:2 ������ ��������� ������� ��������� �� ����������� ����� sw.fthdr

  WORD n50;      // 28:2 �������� �������
  // Mode
  BS4I1_MODE md; // 1.0.2
  // 32 ����� 24.10.2014
} BS4I1_STP;
//-----------------------------------------------------------------------------------------


//��������� �������� �������
//??? ��� � ��������� �������!
typedef struct
{

//����� P_211 ������ �������� � ����� ������������ ��� �������

//  TProtocol_211* prt_211;

//������ ������� � �����
  bool on;

//����-������������� � �����
  bool porton;

  bool dataon;  // ���� �������, ����� ��� �������, ��� ����� ���,
                // ������ ������ � CRC ������ NumRErrSrs NumCErrSrs

  bool Adataon; // is Accel ���������� ���������

  bool Wdataon; // is Meteo ���������� �������� �����
  //****************************************************************************
  double StackStartTime;
  double Tm_Start;
  double Tm_Stop;
  double Tm_dataon;
  double Tm_fdr;

  double Tm_pn; DWORD  pn_Tm; // ��� ������������� ������� ��� � PC + nmeas_buf

  double Tm_Wpn;DWORD Wpn_Tm; // ��� ������������� ������� ��� � PC + nmeas_buf
  double DTm_GetAll;
  DWORD  d3r_tm;              // d3r.tm
  //****************************************************************************
  AnsiString Name;
  AnsiString SetData;
  AnsiString AdjData;
  AnsiString Note;
  AnsiString Place;
  //****************************************************************************
//???��������������� � �������
  int N;
//�����
  byte adr;
//��������� �����
  int SND3;
  //****************************************************************************
//---------------��� ��-�3 ������ ���-------------------------------------------
  double  XCur; // ������� ��������� ������� �� X
  double  YCur; // ������� ��������� ������� �� Y
//------------------------------------------------------------------------------

  double  TCur; // ������� ��������� �����������
  WORD   ThCur; // ������� ��������� ���������, ��
  double PwCur; // ������� ��������
  //****************************************************************************
  double T0;   //��������� 0 ������������������
  double X0;   //�������� 0 �� Y
  double Y0;   //�������� 0 �� X
  bool   InvY; //������������� ���Y ������� ��������� �������
  double RotX; // ���� �������� ������� ��������� ������� �� ��������� � ������� ��������� �������, ���. ����.
  //****************************************************************************
  double AXAver,AYAver,AXMax,AYMax,AMaxAbs,AMaxAng,AXRms,AYRms,AXYRms;
  //****************************************************************************
  double WUAver,WVAver,WUMax,WVMax,WURms,WVRms;

  //???
  BYTE wstatus;

  //****************************************************************************
  int SrsState,oldSrsState;

  BS4I1_SW  sw,oldsw;   // ����� ���������

  BS4I1_MODE md,oldmd;  // �����
  DWORD er;DWORD ec;    // ������ ����� ���������
  BS4I1_NResErr res_err;// ������� ������ ���������
  BS4I1_d3stat d3stat;
  BS4I1_t5stat t5stat;
  BS4I1_wres mwres;
  BS4I1_wstat mwstat;

  BS4I1_UserCmd UCmd;    // ����������� �������

  BS4I1_STP stp;
  byte NVMCur;
  byte NVMSize;
  byte B1;
  byte B2;
  //****************************************************************************
  bool isBS;    // ���� ����������
  bool isTermo; // ��������� �����������
  bool isTMP05; // ��������� ������ �����������
  bool isMeteo; // ���������� ������������
  bool isAccel; // ��������� ������������
  bool isHoriz; // ��������� �������������� ���������� // >>>

  bool isInd3_211;  // ������ ��-�3 �������� 2.11

  //****************************************************************************
  TSBuf   SBuf;  // ����� �������
  TSWBuf SWBuf;  // ����� �������
  //****************************************************************************
  // ������� � �������������� �������
  //****************************************************************************
  int ReOpen(TCOMPort* P);
  int GetTCur(TCOMPort* P);
  int GetXYCur(TCOMPort* P);

  int GetXYCur_IND3(TCOMPort* P);

  int GetThCur(TCOMPort* P);
  int GetPwCur(TCOMPort* P);
  int GetAll(TCOMPort* P);
  int SetAdr(TCOMPort* P,BYTE a,BYTE c);
  int GetStp(TCOMPort* P,BYTE tstp);
  int WriteStp(TCOMPort* P);
  int CopyStp(TCOMPort* P);
  int SetTmp(TCOMPort* P);
  int NVMState(TCOMPort* P);
  int Setn50(TCOMPort* P,WORD n);
  int SetTmax(TCOMPort* P,char T);
  int Prog(TCOMPort* P);
  int D3Set(TCOMPort* P);
  int ResErr(TCOMPort* P);
  int Getd3Stat(TCOMPort* P);
  int Gett5Stat(TCOMPort* P);
  int GetMWStat(TCOMPort* P);
  int GetMWRes(TCOMPort* P);
  int GetInfo(TCOMPort* P,int ix);
  int MODE(TCOMPort* P);
  int ClrReset(TCOMPort* P);
  int SetPulse(TCOMPort* P);
  //****************************************************************************
  // ����� ������� � ������� 0
  //****************************************************************************
  int Reset(TCOMPort* P);
  int StackOn(TCOMPort* P,bool on,bool clr,WORD nGroup);
  int StackSOn(TCOMPort* P);
  int StackOff(TCOMPort* P);
  //****************************************************************************
  // 1.0.2
  //****************************************************************************
  int GetPackets(TCOMPort* P);
  int GetWPackets(TCOMPort* P);
  int ExecComs(TCOMPort* CPrt);
  void CalcPacket(void);
  void CalcWPacket(void);
  void Calc_FA(void);
  void Calc_FW(void);

  int ExecComs_IND3(TCOMPort* CPrt);


  //****************************************************************************
} TBTSensor;
//-----------------------------------------------------------------------------------------
extern DWORD ExP2(DWORD l);
class TBSData // !!! FFT+
{
  private:
  public:
  DWORD size;
  DWORD count;
  double WTime;
  short  *WS;
  double *WD1;
  double *WD2;
  Init(DWORD sz) {size=sz;WS =new  short[sz];WD1=new double[sz];WD2=new double[sz];};
  SetCount(DWORD cnt,bool even,bool n2)
  {
    if(cnt>size) cnt=size;
    if(even) if(cnt%2>0) cnt--;
    if(n2)   cnt=ExP2(cnt);
    count=cnt;
  }
  TBSData(void) {size=0;count=0;};
  virtual ~TBSData() {if(size>0) {delete[] WS;delete[] WD1;delete[] WD2;}};
};
//-----------------------------------------------------------------------------------------
#endif
//-----------------------------------------------------------------------------

