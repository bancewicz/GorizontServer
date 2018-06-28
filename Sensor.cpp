// Sensor.cpp
//-----------------------------------------------------------------------------
#include "Sensor.h"                                                                
#include "math.h"
//-----------------------------------------------------------------------------
extern int PPauseTick,PReOpen,PClose,TORCom,TOWCom,TORDat,TOWDat;
//-----------------------------------------------------------------------------
// TBTSensor
//-----------------------------------------------------------------------------
int TBTSensor::ReOpen(TCOMPort* P)
{
  if(P->st.res)    return 1;
  if(P->st.cmd==3) {er++;return 3;}      // Ошибка чтения
  if(P->st.cmd==7) {ec++;er=0;return 7;} // Ошибка CRC
  return 0;
}
//-----------------------------------------------------------------------------
int TBTSensor::GetTCur(TCOMPort* P)
{
//запрос температуры термодатчика
  int *i001=(int*)P->BS4I1_Cmd(adr,35,0,0,4,TOWCom,TORCom);
  if(i001==NULL) {}
  else TCur=*i001/1000.0;
  return ReOpen(P);
}
//-----------------------------------------------------------------------------

int TBTSensor::GetXYCur(TCOMPort* P)
{
//запрос значений углов
  double X,Y;
  BYTE *b=P->BS4I1_Cmd(adr,108,0,0,8,TOWCom,TORCom);
  if(b==NULL) {}
  else
  {
    X=(*(short*)b)/8.0;b+=2;
    Y=(*(short*)b)/8.0;b+=2;
    d3r_tm=*(DWORD*)b;
    double anl=RotX*M_PI/180.0;
    if(InvY) Y=-Y;// else anl=-anl;
    // InvY==0 - вращение новой левой системы координат по часовой стрелке
    // InvY==1 - вращение новой правой системы координат против часовой стрелки
    XCur=+X*cos(anl)+Y*sin(anl)-X0;
    YCur=-X*sin(anl)+Y*cos(anl)-Y0;
  }
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::GetThCur(TCOMPort* P)
{
//запрос показаний тахометра
  BYTE *b=P->BS4I1_Cmd(adr,134,0,0,2,TOWCom,TORCom);
  if(b==NULL) {}
  else ThCur=(*(WORD*)b)/8;
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::GetPwCur(TCOMPort* P)
{
//запрос мощности термостата
  BYTE *b=P->BS4I1_Cmd(adr,36,2,0,4,TOWCom,TORCom);
  if(b==NULL) {}
  else PwCur=(*(WORD*)b)/10.0;
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::ResErr(TCOMPort* P)
{
//запрос //???

  BYTE *b=P->BS4I1_Cmd(adr,202,0,0,10,TOWCom,TORCom);
  if(b==NULL) {}
  else res_err=*((BS4I1_NResErr*)b);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::Getd3Stat(TCOMPort* P)
{
//запрос //???
  BYTE *b=P->BS4I1_Cmd(adr,87,0,0,10,TOWCom,TORCom);
  if(b==NULL) {}
  else d3stat=*((BS4I1_d3stat*)b);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::Gett5Stat(TCOMPort* P)
{

//запрос //???
  BYTE *b=P->BS4I1_Cmd(adr,135,0,0,10,TOWCom,TORCom);
  if(b==NULL) {}
  else t5stat=*((BS4I1_t5stat*)b);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::SetAdr(TCOMPort* P,BYTE a,BYTE c)
{

  if(!UCmd.bsadr) P->BS4I1_Cmd(adr,90,a,c,0,TOWCom,TORCom);
  else            P->BS4I1_Cmd(adr,222,a,0,0,TOWCom,TORCom); // 1.0.2
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::Setn50(TCOMPort* P,WORD n)
{

  P->BS4I1_Cmd(adr,204,n&0xFF,n/256,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::SetTmax(TCOMPort* P,char T)
{

  P->BS4I1_Cmd(adr,40,T,0,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::GetStp(TCOMPort* P,BYTE tstp)
{

  BYTE *b=P->BS4I1_Cmd(adr,221,tstp,0,sizeof(BS4I1_STP),TOWCom,TORCom);
  if(b==NULL) {}
  else stp=*((BS4I1_STP*)b);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::WriteStp(TCOMPort* P)
{

  BYTE *b=P->BS4I1_Cmd(adr,220,66,99,2,TOWCom,TORCom);
  if(b==NULL) {}
  else {NVMCur=b[0];NVMSize=b[1];}
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::CopyStp(TCOMPort* P)
{

  P->BS4I1_Cmd(adr,225,0,0,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::NVMState(TCOMPort* P)
{

  BYTE *b=P->BS4I1_Cmd(adr,223,0,0,2,TOWCom,TORCom);
  if(b==NULL) {}
  else {NVMCur=b[0];NVMSize=b[1];}
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::SetTmp(TCOMPort* P)
{

  BYTE *b=P->BS4I1_Cmd(adr,224,B1,B2,0,TOWCom,TORCom);
  if(b==NULL) {}
  else {}
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::GetInfo(TCOMPort* P,int ix)
{
//запрос //???
  BYTE *b=P->BS4I1_Cmd(adr,36,ix,0,4,TOWCom,TORCom);
  if(b==NULL) {}
  else UCmd.info=*((DWORD*)b);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::MODE(TCOMPort* P)
{

  P->BS4I1_Cmd(adr,50,UCmd.mode_com,UCmd.mode_on,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::ClrReset(TCOMPort* P)
{

  P->BS4I1_Cmd(adr,50,101,1,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::SetPulse(TCOMPort* P)
{

  BYTE *b=(byte*)&UCmd.tick_rate;
  if(P->BS4I1_Cmd(adr,91,b[0],b[1],0,TOWCom,TORCom)==0)       return ReOpen(P);
  if(P->BS4I1_Cmd(adr,92,b[2],b[3],0,TOWCom,TORCom)==0)       return ReOpen(P);
  b=(byte*)&UCmd.puls_time;
  if(P->BS4I1_Cmd(adr,93,b[0],b[1],0,TOWCom,TORCom)==0)       return ReOpen(P);
  if(P->BS4I1_Cmd(adr,94,b[2],b[3],0,TOWCom,TORCom)==0)       return ReOpen(P);
  if(P->BS4I1_Cmd(adr,95,UCmd.del_type,0,0,TOWCom,TORCom)==0) return ReOpen(P);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
int TBTSensor::Prog(TCOMPort* P)
{

  BYTE *b=P->BS4I1_Cmd(adr,99,66,99,0,TOWCom,TORCom);
  Sleep(50);
  b=P->BS4I1_Cmd(0x55,66,99,66,2,TOWCom,TORCom);
  if(b==NULL) {}
  else        {}
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::D3Set(TCOMPort* P)
{

  P->BS4I1_Cmd(adr,67,99,66,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::Reset(TCOMPort* P)
{

  P->BS4I1_Cmd(adr,99,66,99,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
//int TBTSensor::Reset(TCOMPort* P)  // !!! write flash
//{
//  P->BS4I1_Cmd(adr,236,66,99,0,TOWCom,TORCom);
//  return ReOpen(P);
//}
//-----------------------------------------------------------------------------
int TBTSensor::StackOn(TCOMPort* P,bool on,bool clr,WORD nGroup)
{

  byte b1=nGroup&0xFF,b2=on*128+clr*64+((nGroup/256)&0x3F);
  P->BS4I1_Cmd(adr,205,b1,b2,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::StackSOn(TCOMPort* P)
{

  P->BS4I1_Cmd(adr,207,0,0,0,TOWCom,TORCom);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::StackOff(TCOMPort* P)
{

  P->BS4I1_Cmd(adr,206,0,0,0,TOWCom,TORCom);
  return ReOpen(P);
}
//****************************************************************************
// GetAll
//****************************************************************************
int TBTSensor::GetMWRes(TCOMPort* P)
{

  BYTE *b=P->BS4I1_Cmd(adr,137,0,0,5,TOWCom,TORCom);
  if(b==NULL) {}
  else mwres=*((BS4I1_wres*)b);
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::GetMWStat(TCOMPort* P)
{

  BYTE *b=P->BS4I1_Cmd(adr,136,0,0,10,TOWCom,TORCom);
  double tm=Now();
  if(b==NULL) return ReOpen(P);
  mwstat=*((BS4I1_wstat*)b);
  SWBuf.res_pn=mwstat.sn;
  SWBuf.nmeas=SWBuf.res_pn/PACK_SIZE;
  Tm_Wpn=tm;Wpn_Tm=SWBuf.res_pn;
  return ReOpen(P);
}
//-----------------------------------------------------------------------------
int TBTSensor::GetAll(TCOMPort* P)
{

  BYTE *b=P->BS4I1_Cmd(adr,201,0,0,18,TOWCom,TORCom);
  double X,Y,tm=Now();
  if(b==NULL) return ReOpen(P);

        X=(*(short*)b)/8.0;b+=2;
        Y=(*(short*)b)/8.0;b+=2;

  double anl=RotX*M_PI/180.0;
  if(InvY) Y=-Y; // else anl=-anl;
  // InvY==0 - вращение новой левой системы координат по часовой стрелке
  // InvY==1 - вращение новой правой системы координат против часовой стрелки
  XCur=+X*cos(anl)+Y*sin(anl)-X0;
  YCur=-X*sin(anl)+Y*cos(anl)-Y0;

  TCur=(*(short*)b)/250.0-T0;b+=2;
  ThCur=(*(WORD*)b)/8;
  b+=2;
  PwCur=(*(WORD*)b)/10.0;b+=2;

//Обновление слова состояния
  sw=(*(BS4I1_SW*)b);
  b+=sizeof(BS4I1_SW);

  SBuf.res_pn=*(DWORD*)b;b+=4;
  SBuf.nmeas=SBuf.res_pn/PACK_SIZE;
  md=(*(BS4I1_MODE*)b);
  Tm_pn=tm;pn_Tm=SBuf.res_pn;if(sw.fdr) Tm_fdr=tm;
  return ReOpen(P);
}
//****************************************************************************
#define SAFETY_PACKS 8   // ??? предотвращение переполнения буфера за время чтения
//#define READ_PACKS  32 // для уменьшения времени опроса каждого датчика
#define READ_PACKS  16   // !!! GPRS для уменьшения времени опроса каждого датчика
#define   N_PACKS    1   // !!! GPRS считывать нескоько пакетрв сразу READ_PACKS должно быть кратно N_PACKS
#define TIME_AVER   60   // время усреднения
#define MINP_AVER   10   // минимальное количество пакетов для усреднения (1 мин - 19)
//****************************************************************************
int TBTSensor::GetPackets(TCOMPort* P)
{

  int bufidx=0;      

  int to_read=SBuf.nmeas-SBuf.nread-SBuf.nmiss;               //!!!По этой разнице знаем сколько есть новых пакетов для чтения

  if(to_read==0) return ReOpen(P); // Нет новых данных

  if(to_read<0)                    // Очистка буфера датчика или перезагрузка
  {
    to_read=SBuf.nmeas;
    SBuf.Clr();
    SBuf.nmeas=to_read;
  }

  if(to_read>=(NUM_PACKS-SAFETY_PACKS))       //!!!Это переполнение и надосбрасывать буфер
  {
    to_read=NUM_PACKS-SAFETY_PACKS;
    SBuf.nmiss=SBuf.nmeas-SBuf.nread-to_read;
    if((SBuf.nmiss%N_PACKS)>0) SBuf.nmiss=(SBuf.nmiss/N_PACKS)*N_PACKS+N_PACKS;
  }

  if(to_read>READ_PACKS) to_read=READ_PACKS;

  to_read=to_read-to_read%N_PACKS;

  for(int i=0;i<to_read/N_PACKS;i++)
  {
    BS4I1_D3Packet *pP=(BS4I1_D3Packet*)P->BS4I1_Cmd
      (adr,203,(SBuf.nread+SBuf.nmiss)%NUM_PACKS,N_PACKS,sizeof(BS4I1_D3Packet)*N_PACKS,TOWCom,TORCom);
    if(pP==NULL) break;
    for(int j=0;j<N_PACKS;j++)
    {
      SBuf.Packet_buf[SBuf.nread%SrsBufPSize]=*(pP+j);
      SBuf.nmeas_buf[SBuf.nread%SrsBufPSize]=SBuf.nread+1+SBuf.nmiss;
      SBuf.nread++;
    }
  }
  //if(to_read>=(NUM_PACKS-SAFETY_PACKS))
  //{
  //  to_read=NUM_PACKS-SAFETY_PACKS;
  //  SBuf.nmiss=SBuf.nmeas-SBuf.nread-to_read;
  //}
  //if(to_read>READ_PACKS) to_read=READ_PACKS;
  //for(int i=0;i<to_read;i++)
  //{
  //  BS4I1_D3Packet *pP=(BS4I1_D3Packet*)P->BS4I1_Cmd(adr,203,(SBuf.nread+SBuf.nmiss)%NUM_PACKS,0,sizeof(BS4I1_D3Packet),TOWCom,TORCom);
  //  if(pP==NULL) break;
  //  SBuf.Packet_buf[SBuf.nread%SrsBufPSize]=*pP;
  //  SBuf.nmeas_buf[SBuf.nread%SrsBufPSize]=SBuf.nread+1+SBuf.nmiss;
  //  SBuf.nread++;
  //}
  return ReOpen(P);
}
//****************************************************************************
int TBTSensor::GetWPackets(TCOMPort* P)
{

  int to_read=SWBuf.nmeas-SWBuf.nread-SWBuf.nmiss;
  if(to_read==0) return ReOpen(P); // Нет новых данных
  if(to_read<0)                    // Очистка буфера датчика или перезагрузка
  {
    to_read=SWBuf.nmeas;
    SWBuf.Clr();
    SWBuf.nmeas=to_read;
  }
  if(to_read>=(NUM_PACKS-SAFETY_PACKS))
  {
    to_read=NUM_PACKS-SAFETY_PACKS;
    SWBuf.nmiss=SWBuf.nmeas-SWBuf.nread-to_read;
  }
  if(to_read>READ_PACKS) to_read=READ_PACKS;
  for(int i=0;i<to_read;i++)
  {
    BS4I1_WPacket *pP=(BS4I1_WPacket*)P->BS4I1_Cmd(adr,213,(SWBuf.nread+SWBuf.nmiss)%NUM_PACKS,0,sizeof(BS4I1_WPacket),TOWCom,TORCom);
    if(pP==NULL) break;
    SWBuf.Packet_buf[SWBuf.nread%SrsBufPSize]=*pP;
    SWBuf.nmeas_buf[SWBuf.nread%SrsBufPSize]=SWBuf.nread+1+SWBuf.nmiss;
    SWBuf.nread++;
  }
  return ReOpen(P);
}
//****************************************************************************
//****************************************************************************
//****************************************************************************
// CalcPacket
//****************************************************************************
//-----------------------------------------------------------------------------------------------
BYTE ValPacket(BS4I1_D3Packet* P)
{
  BYTE s=0;
  if(P->drz<324)  s|=1<<0; // заполнение FIR1 c ошибками 324 - n50==50 300 - n50==46
  if(P->ne>0)     s|=1<<1; // ошибки при заполнении
  if(P->AX>=32767)s|=1<<2; // FIR2 не заполнен (!sw.fdr)
  return s;
  //||(SBP[i%MAXP].dCT*25.0*1e-6/PACK_SIZE>100.1)
  //||(SBP[i%MAXP].dCT*25.0*1e-6/PACK_SIZE<99.9)
  //||(SBP[i%MAXP].dCT*25.0*1e-6/PACK_SIZE>2.176)
  //||(SBP[i%MAXP].dCT*25.0*1e-6/PACK_SIZE<2.174)
}
//-----------------------------------------------------------------------------------------------
void TBTSensor::CalcPacket(void)
{

//Преобразование в инт с округлкнием

  extern int rint(double d);

//Указатель на хранилище пакетов в стеке
  BS4I1_D3Packet* SBP=SBuf.Packet_buf;

//Перебираем все необсчитанные пакеты
  for(int i=SBuf.ncalc;i<SBuf.nread;i++,SBuf.ncalc++)
  {

//Движение по кругу - индекс кратный размеру хранилища пакетов
    int ix=i%SrsBufPSize;

//pn_Tm=SBuf.res_pn присвоилось при получении пакета   DWORD res_pn;// Количество измерений GetAll
//SBuf.nmeas_buf[SBuf.nread%SrsBufPSize]=SBuf.nread+1+SBuf.nmiss;


    //-----------------------------------------------------------------------------------------------
    // Время конца пакета с коррекция 0.1 с на иззмерение // ??? 0.25 с при таймауте не учтено
    double tmBS=(pn_Tm-SBuf.nmeas_buf[ix]*PACK_SIZE)*0.1/3600.0/24.0; // Коррекция 0.1 с на измерение

    //
    SBuf.Time_buf[ix]=Tm_pn-tmBS;
    //-----------------------------------------------------------------------------------------------
    // Запись в линейный массив X,Y
    for(int j=0;j<PACK_SIZE;j++)
    {
      SBuf.X[ix*PACK_SIZE+j]=SBP[ix].x[j];
      SBuf.Y[ix*PACK_SIZE+j]=SBP[ix].y[j];
    }
    //-----------------------------------------------------------------------------------------------
    // Validate packet
    BYTE s=ValPacket(SBP+ix);
    SBuf.s[ix]=s;

    if(s>0)
    {
      SBuf.ecount++;
      SBuf.XAver[ix]=0.0;SBuf.YAver[ix]=0.0;
      SBuf.XMax[ix]= 0.0;SBuf.YMax[ix]= 0.0;
      SBuf.XRms[ix]= 0.0;SBuf.YRms[ix]= 0.0; SBuf.XYRms[ix]=0.0;
      continue;
    }
    //-----------------------------------------------------------------------------------------------

    // обработка- вычисление ускорений

    double k=-1.0/8.0/3600.0/180.0*M_PI*9.81347*1000.0; // Minsk g=9.81347; инверсия знака

    double AX=SBP[ix].AX,AY=SBP[ix].AY; // FIR 2, если = 32767 - фильтр не заполнен

    double X,Y,XAver=0,YAver=0,Max=0,XMax=0,YMax=0,XRms=0,YRms=0,XYRms=0;
    //-----------------------------------------------------------------------------------------------
    for(int j=0;j<PACK_SIZE;j++)
    {
      //-------------------------------------------------------------------------
      X=SBuf.X[ix*PACK_SIZE+j]*k;
      Y=SBuf.Y[ix*PACK_SIZE+j]*k;
      //-------------------------------------------------------------------------
      if(md.noacmp) {X-=AX*k;Y-=AY*k;} // >>> компенсация 0
      //-------------------------------------------------------------------------
      double anl=RotX*M_PI/180.0,x=X,y=Y; // вращение
      if(InvY) Y=-Y; // else anl=-anl;
      //  InvY==0 - вращение новой левой системы координат по часовой стрелке
      //  InvY==1 - вращение новой правой системы координат против часовой стрелки
      X=+x*cos(anl)+y*sin(anl);
      Y=-x*sin(anl)+y*cos(anl);
      //-------------------------------------------------------------------------
      XAver+=X;YAver+=Y;
      XRms+=X*X;YRms+=Y*Y;XYRms+=X*Y;
      if(sqrt(X*X+Y*Y)>=Max) {Max=sqrt(X*X+Y*Y);XMax=X;YMax=Y;}
    }
    SBuf.XAver[ix]=XAver/PACK_SIZE;
    SBuf.YAver[ix]=YAver/PACK_SIZE;
    SBuf.XMax[ix]=XMax;
    SBuf.YMax[ix]=YMax;
    SBuf.XRms[ix]=sqrt(XRms/PACK_SIZE);
    SBuf.YRms[ix]=sqrt(YRms/PACK_SIZE);
    SBuf.XYRms[ix]=XYRms/PACK_SIZE/(SBuf.XRms[ix]+1e-30)/(SBuf.YRms[ix]+1e-30);
  }
}
//-----------------------------------------------------------------------------------------------
double GetAngle(double x,double y,bool is360)
{
  double a;
  x=fabs(x)<1e-30?1e-30:x;
  a=atan(y/x);if(x<0.0) a+=(y>=0.0)?M_PI:-M_PI;
  a*=180.0/M_PI;
  if(is360) if(a<0.0) a+=360.0;
  return a;
}
//-----------------------------------------------------------------------------------------------
void TBTSensor::Calc_FA(void)
{
  double time=Now(),tm1s=1.0/24.0/3600.0,XAver=0,YAver=0,Max=0,XMax=0,YMax=0,XRms=0,YRms=0,XYRms=0;
  //----------------------------------------------------------------------------
  int n=0;
  for(int i=SBuf.ncalc-1;i>=0;i--)
  {
    int ix=i%SrsBufPSize;
    if((time-SBuf.Time_buf[ix])>tm1s*TIME_AVER) break;
    n++;
  }
  if(n==0) {Adataon=false;return;}
  //----------------------------------------------------------------------------
  int N=n;n=0;
  for(int i=0;i<N;i++)
  {
    int ix=(SBuf.ncalc-N+i)%SrsBufPSize;
    if(SBuf.s[ix]>0) continue;
    n++;
    XAver+=SBuf.XAver[ix];YAver+=SBuf.YAver[ix];
    double X=SBuf.XMax[ix],Y=SBuf.YMax[ix],XY;
    if(sqrt(X*X+Y*Y)>=Max) {Max=sqrt(X*X+Y*Y);XMax=X;YMax=Y;}
    X=SBuf.XRms[ix];Y=SBuf.YRms[ix];XY=SBuf.XYRms[ix];
    XRms+=X*X;YRms+=Y*Y;XYRms+=XY*X*Y;
  }
  if(n<MINP_AVER) { Adataon=false;return;}
  //----------------------------------------------------------------------------
  Adataon=true;
  //----------------------------------------------------------------------------
  AXAver=XAver/n;AYAver=YAver/n;
  //----------------------------------------------------------------------------
  AXMax=XMax;AYMax=YMax;
  AMaxAbs=sqrt(XMax*XMax+YMax*YMax);
  AMaxAng=GetAngle(XMax,YMax,true);
  //----------------------------------------------------------------------------
  AXRms=sqrt(XRms/n);AYRms=sqrt(YRms/n);
  AXYRms=XYRms/n/(AXRms+1e-30)/(AYRms+1e-30);
  //----------------------------------------------------------------------------
}
//-----------------------------------------------------------------------------------------------
//****************************************************************************
// CalcWPacket
//****************************************************************************
bool Val(BYTE s) {return !(((s<11)&&(s>0))||(s>=128));}
//----------------------------------------------------------------------------
void TBTSensor::CalcWPacket(void)
{
  BS4I1_WPacket* SBP=SWBuf.Packet_buf;
  for(int i=SWBuf.ncalc;i<SWBuf.nread;i++,SWBuf.ncalc++)
  {
    int ix=i%SrsBufPSize;
    //-----------------------------------------------------------------------------------------------
    // Время конца пакета с коррекция 0.1 с на измерение // ??? 0.15 с при таймауте не учтено
    double tmBS=(Wpn_Tm-SWBuf.nmeas_buf[ix]*PACK_SIZE)*0.1/3600.0/24.0;
    SWBuf.Time_buf[ix]=Tm_Wpn-tmBS;
    //-----------------------------------------------------------------------------------------------
    // Запись в линейный массив U,V
    int nerr=0;        // Количество ошибок пакета
    BYTE serr,snoerr;  // Последний статус с ошибкой, без ошибки
    double U,V,UAver=0,VAver=0,Max=0,UMax=0,VMax=0;
    for(int j=0;j<PACK_SIZE;j++)
    {
      extern int rint(double d);
      //------------------------------------------------------------------------
      // WTest
      //U=SWBuf.U[ix*PACK_SIZE+j]=rint(1000+1000*sin(2.0*M_PI*1.23456/10.0*(ix*PACK_SIZE+j)));
      //V=SWBuf.V[ix*PACK_SIZE+j]=rint(rand()%2001);
      //BYTE s=60;
      //------------------------------------------------------------------------
      U=SWBuf.U[ix*PACK_SIZE+j]=SBP[ix].u[j];
      V=SWBuf.V[ix*PACK_SIZE+j]=SBP[ix].v[j];
      BYTE s=SBP[ix].s[j];
      //------------------------------------------------------------------------
      extern bool isCB128;if(isCB128) s=128;
      //------------------------------------------------------------------------
      if(!Val(s)) {nerr++;serr=s;continue;}
      //------------------------------------------------------------------------
      snoerr=s;
      UAver+=U;VAver+=V;
      if(sqrt(U*U+V*V)>=Max) {Max=sqrt(U*U+V*V);UMax=U;VMax=V;}
      //------------------------------------------------------------------------
    }
    // ??? Допустимое количество ошибок
    if(nerr<=PACK_SIZE/2)
    {
      //------------------------------------------------------------------------
      SWBuf.UAver[ix]=UAver/(PACK_SIZE-nerr);SWBuf.VAver[ix]=VAver/(PACK_SIZE-nerr);
      SWBuf.UMax[ix]=UMax;SWBuf.VMax[ix]=VMax;
      SWBuf.s[ix]=snoerr;
      //------------------------------------------------------------------------
    }
    else
    {
      //------------------------------------------------------------------------
      SWBuf.UAver[ix]=0.0;SWBuf.VAver[ix]=0.0;
      SWBuf.UMax[ix]=0.0; SWBuf.VMax[ix]=0.0;
      SWBuf.URms[ix]=0.0; SWBuf.VRms[ix]=0.0;
      SWBuf.s[ix]=serr;
      SWBuf.ecount++;
      //------------------------------------------------------------------------
    }
  }
  //CalcW();
}
void TBTSensor::Calc_FW(void)
{
  double time=Now(),tm1s=1.0/24.0/3600.0,UAver=0,VAver=0,Max=0,UMax=0,VMax=0;
  //----------------------------------------------------------------------------
  int n=0;
  for(int i=SWBuf.ncalc-1;i>=0;i--)
  {
    int ix=i%SrsBufPSize;
    if((time-SWBuf.Time_buf[ix])>tm1s*TIME_AVER) break;
    n++;
  }
  if(n==0) {wstatus=0;Wdataon=false;return;}
  //----------------------------------------------------------------------------
  int N=n;n=0;
  for(int i=0;i<N;i++)
  {
    int ix=(SWBuf.ncalc-N+i)%SrsBufPSize;
    wstatus=SWBuf.s[ix];if(!Val(wstatus)) continue;
    //-----------------------------------------------
    UAver+=SWBuf.UAver[ix];VAver+=SWBuf.VAver[ix];
    double U=SWBuf.UMax[ix],V=SWBuf.VMax[ix];
    if(sqrt(U*U+V*V)>=Max) {Max=sqrt(U*U+V*V);UMax=U;VMax=V;}
    n++;
    //-----------------------------------------------
  }
  if(n<MINP_AVER) { Wdataon=false;return;}
  //-----------------------------------------------
  WUAver=UAver/n;WVAver=VAver/n;
  WUMax=UMax;WVMax=VMax;
  Wdataon=true;
  //----------------------------------------------------------------------------
  // RMS
  //----------------------------------------------------------------------------
  n=0;double UR=0.0,VR=0.0;
  for(int i=0;i<N;i++)
  {
    int ix=(SWBuf.ncalc-N+i)%SrsBufPSize;if(!Val(SWBuf.s[ix])) continue;
    double U,V,URms=0.0,VRms=0.0;
    int m=0;
    for(int j=0;j<PACK_SIZE;j++)
    {
      if(!Val(SWBuf.Packet_buf[ix].s[j])) continue;
      //if(!Val(60)) continue; // WTest
      U=SWBuf.U[ix*PACK_SIZE+j]-WUAver;V=SWBuf.V[ix*PACK_SIZE+j]-WVAver;
      URms+=U*U;VRms+=V*V;
      m++;
    }
    U=SWBuf.URms[ix]=sqrt(URms/m);V=SWBuf.VRms[ix]=sqrt(VRms/m);
    UR+=U*U;VR+=V*V;
    n++;
  }
  WURms=sqrt(UR/n);WVRms=sqrt(VR/n);
}
//****************************************************************************
// TSBuf
//****************************************************************************
void TSBuf::Clr(void)
{

  return;//!!!

  nread=0;
  nmiss=0;
  ncalc=0;
  ecount=0;
  nsave=0;
  res_pn=0;
  nmeas=0;
  sw=0;
  if(fx!=NULL) {fclose(fx);fx=NULL;}
  if(fy!=NULL) {fclose(fy);fy=NULL;}
}
//-----------------------------------------------------------------------------
bool TSBuf::SaveBuf(AnsiString dirname,int srs)
{
  AnsiString s,name=dirname;
//  AnsiString txname,tyname;

  FILE* fxt=NULL;
  FILE* fyt=NULL;

  extern bool SaveAccTxt;

  if(!on)
  {
   return true;
  }

  if(nsave>=ncalc)
  {
   return true;
  }

  name+="\\History\\Adata\\";

  if(!DirectoryExists(name))
  {
   if(!CreateDir(name))
   {
    return false;
   }
  }

  if(nsave%(SrsBufToSave*SrsBufPSize)==0) // Ограничение размера файла
  {
    name+="\\";
    name+=FormatDateTime("yy_mm_dd_hh_nn_ss_",Now());
    name+=(s=srs);

     xname=name+"X.wrd";
     yname=name+"Y.wrd";

     txname=name+"X.wrt";
     tyname=name+"Y.wrt";
  }

  fx=fopen(xname.c_str(),"ab");if(fx==NULL) {           return false;}
  fy=fopen(yname.c_str(),"ab");if(fy==NULL) {fclose(fx);return false;}

  if (SaveAccTxt)
  {
          fxt=fopen(txname.c_str(),"ab");
                if(fxt==NULL)
                {
                       return false;
                }

          fyt=fopen(tyname.c_str(),"ab");

          if(fyt==NULL)
          {
                fclose(fxt);
                return false;
          }

  }


  for(;nsave<ncalc;nsave++)
  {


    if (SaveAccTxt==false)
    {
            if (fwrite(X+(nsave%SrsBufPSize)*PACK_SIZE,sizeof(short),PACK_SIZE,fx)!=PACK_SIZE)
            {
                fclose(fx);
                fclose(fy);
                return false;
            }

            if(fwrite(Y+(nsave%SrsBufPSize)*PACK_SIZE,sizeof(short),PACK_SIZE,fy)!=PACK_SIZE)
            {
                fclose(fx);
                fclose(fy);
                return false;
            }
    }

    if (SaveAccTxt)
    {

        short* ax=X+(nsave%SrsBufPSize)*PACK_SIZE;
        short* ay=Y+(nsave%SrsBufPSize)*PACK_SIZE;

        char c[64];

        for (long i=0; i<PACK_SIZE; i++)
        {
            sprintf(c,"%.2f\r\n",((double)((short)(*ax)))/8.0);
            fwrite(c,strlen(c),1,fxt);

            sprintf(c,"%.2f\r\n",((double)((short)(*ay)))/8.0);
            fwrite(c,strlen(c),1,fyt);

            ax++;
            ay++;
        }

    }


    if((nsave+1)%(SrsBufToSave*SrsBufPSize)==0)
    {
        nsave++;
        break;
    }

  }


  fclose(fx);
  fclose(fy);
  
  fclose(fxt);
  fclose(fyt);

  return true;
}
//****************************************************************************
// TSWBuf
//****************************************************************************
void TSWBuf::Clr(void)
{
    return;//!!!

  nread=0;nmiss=0;ncalc=0;ecount=0;nsave=0;res_pn=0;nmeas=0;
  if(fx!=NULL) {fclose(fx);fx=NULL;}
  if(fy!=NULL) {fclose(fy);fy=NULL;}
}
//-----------------------------------------------------------------------------
bool TSWBuf::SaveBuf(AnsiString dirname,int srs)
{
  AnsiString s,name=dirname;
  if(!on) return true;
  if(nsave>=ncalc) return true;
  if(nsave%(SrsBufToSave*SrsBufPSize)==0) // Ограничение размера файла
  {
    name+="\\History\\Bin\\";
    if(!DirectoryExists(name)) if(!CreateDir(name)) return false;
    name+="\\";
    name+=FormatDateTime("yy_mm_dd_hh_nn_ss_",Now());
    name+=(s=srs);
    xname=name+"U.wrd";
    yname=name+"V.wrd";
  }
  fx=fopen(xname.c_str(),"ab");if(fx==NULL) {           return false;}
  fy=fopen(yname.c_str(),"ab");if(fy==NULL) {fclose(fx);return false;}
  for(;nsave<ncalc;nsave++)
  {
    if(fwrite(U+(nsave%SrsBufPSize)*PACK_SIZE,sizeof(short),PACK_SIZE,fx)!=PACK_SIZE) {fclose(fx);fclose(fy);return false;}
    if(fwrite(V+(nsave%SrsBufPSize)*PACK_SIZE,sizeof(short),PACK_SIZE,fy)!=PACK_SIZE) {fclose(fx);fclose(fy);return false;}
    if((nsave+1)%(SrsBufToSave*SrsBufPSize)==0) {nsave++;break;}
  }
  fclose(fx);fclose(fy);
  return true;
}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
int TBTSensor::ExecComs(TCOMPort* CPrt)
{
  int res=1;
  //*******************************************************************************************************************************
  // Команды таймера
  //*******************************************************************************************************************************
  //CalcFA();CalcFW();
  //-------------------------------------------------------------------------------------------------------------------------------
  // GetAll+
  //-------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.GetAll)
  {
    double D1,D2;

    D1=CoreTime();

    res=GetAll(CPrt);

    D2=CoreTime();DTm_GetAll=D2-D1;

    ;if(res!=1) return res; UCmd.cs.GetAll=false;
    if(isAccel) if(!md.nostack) SBuf.on=true;
    if(SBuf.on)
    {
      res=GetPackets(CPrt);
      CalcPacket(); // часть пакетов может быть прочитана
      if(res!=1) return res;
    }
    if(sw.frst==0) res=ClrReset(CPrt);if(res!=1) return res; // была перезагрузка
  }
  //-------------------------------------------------------------------------------------------------------------------------------
  // isMeteo
  //-------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.wstat)
  {
    res=GetMWStat(CPrt);if(res!=1) return res;UCmd.cs.wstat=false;
    if(isMeteo) if(!md.nometeo) SWBuf.on=true;else SWBuf.on=false;
    if(SWBuf.on)
    {
      res=GetWPackets(CPrt);
      CalcWPacket(); // часть пакетов может быть прочитана
      if(res!=1) return res;
    }
  }
  //-------------------------------------------------------------------------------------------------------------------------------
  // CBStat->Checked
  //-------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.d3stat) {res=Getd3Stat(CPrt);          if(res!=1) return res;UCmd.cs.d3stat=false; }
  if(UCmd.cs.t5stat) {res=Gett5Stat(CPrt);          if(res!=1) return res;UCmd.cs.t5stat=false; }
  if(UCmd.cs.ResErr) {res=ResErr(CPrt);             if(res!=1) return res;UCmd.cs.ResErr=false; }
  if(UCmd.cs.GetInfo){res=GetInfo(CPrt,UCmd.infoix);if(res!=1) return res;UCmd.cs.GetInfo=false;}
  //-------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.GetXYCur){res=GetXYCur(CPrt); if(res!=1) return res;UCmd.cs.GetXYCur=false;} // !isBS
  if(UCmd.cs.wres)    {res=GetMWRes(CPrt); if(res!=1) return res;UCmd.cs.wres=false;    } // isMeteo
  //*******************************************************************************************************************************
  // Ручные команды
  //*******************************************************************************************************************************
  if(UCmd.cs.GetStp)   {res=GetStp(CPrt,UCmd.tstp);if(res!=1) return res;UCmd.cs.GetStp=false;  }
  if(UCmd.cs.NVMState) {res=NVMState(CPrt);        if(res!=1) return res;UCmd.cs.NVMState=false;}
  if(UCmd.cs.SetTmp)   {res=SetTmp(CPrt);          if(res!=1) return res;UCmd.cs.SetTmp=false;  }
  if(UCmd.cs.CopyStp)  {res=CopyStp(CPrt);         if(res!=1) return res;UCmd.cs.CopyStp=false; }
  //-------------------------------------------------------------------------------------------------------------------------------
  // Критическая команда: всегда UCmd.cs.WriteStp=false
  //-------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.WriteStp) {res=WriteStp(CPrt);UCmd.cs.WriteStp=false;if(res!=1) return res;}
  //-------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.SetAdr) {res=SetAdr(CPrt,UCmd.adr,0x01);if(res!=1) return res;UCmd.cs.SetAdr=false; }
  if(UCmd.cs.Setn50) {res=Setn50(CPrt,UCmd.n50);     if(res!=1) return res;UCmd.cs.Setn50=false; }
  if(UCmd.cs.SetTmax) {res=SetTmax(CPrt,UCmd.Tmax); if(res!=1) return res;UCmd.cs.SetTmax=false;}
  //-------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.MODE)    {res=MODE(CPrt);    if(res!=1) return res;UCmd.cs.MODE=false;    }
  if(UCmd.cs.SetPulse){res=SetPulse(CPrt);if(res!=1) return res;UCmd.cs.SetPulse=false;}
  //------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.Reset)  {res=Reset(CPrt);if(res!=1) return res;UCmd.cs.Reset=false;}
  //------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.StackOff)
  {
    res=StackOn(CPrt,false,UCmd.SClrOff,UCmd.nGroup);if(res!=1) return res;UCmd.cs.StackOff=false;
    SBuf.on=false;
    if(UCmd.SProgClrOff) SBuf.Clr();
  }
  //------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.StackOn)
  {
    res=StackOn(CPrt,true,UCmd.SClrOn,UCmd.nGroup);if(res!=1) return res;UCmd.cs.StackOn=false;
    if(UCmd.SProgClrOn) SBuf.Clr();
    SBuf.on=true;
    StackStartTime=Now();
  }
  //------------------------------------------------------------------------------------------------------------------------------
  if(UCmd.cs.StackSOn)
  {
    res=StackSOn(CPrt);if(res!=1) return res;UCmd.cs.StackSOn=false;
    SBuf.Clr();SBuf.on=true;
    StackStartTime=Now();
  }
  //------------------------------------------------------------------------------------------------------------------------------
  return res;
}

//-----------------------------------------------------------------------------

int TBTSensor::GetXYCur_IND3(TCOMPort* P)
{
  BYTE* cmdrespond=NULL;
  BYTE unitsx, unitsy;

//Тут прописываем запрос и обработку показаний углов из ИН-Д3
       cmdrespond=P->BS4I1_Cmd_211_request(adr, cMEAS_VAL);

       if (cmdrespond!=NULL)
       {
//Почитали углы и единицы измерения
         P->Protocol211->ReadIND3SensorMeasureResult(adr,&XCur,&YCur,&unitsx,&unitsy);
//переводим все в секунды
       if (unitsx) XCur*=60;
       if (unitsy) YCur*=60;
       }

  return ReOpen(P);
}



int TBTSensor::ExecComs_IND3(TCOMPort* CPrt)
{
/*
       int res=1;

       res=GetXYCur_IND3(CPrt);

   return res;
*/


       int res=1;

         if(UCmd.cs.GetAll)
         {
                double D1,D2;
                D1=CoreTime();
                res=GetXYCur_IND3(CPrt);
                if (res!=1)    return res;

                D2=CoreTime();
                DTm_GetAll=D2-D1;

                UCmd.cs.GetAll=false;

//Для ИН-Д3 параметры отсутствуют

                UCmd.cs.d3stat=false;
                UCmd.cs.t5stat=false;
                UCmd.cs.ResErr=false;
                UCmd.cs.GetInfo=false;

//                *(DWORD*)(&UCmd.cs)=0; //???
                if (this->sw.fdr!=1)  this->sw.fdr=1;        //???
                dataon=false;          //???

        }

   return res;


}

//-----------------------------------------------------------------------------

