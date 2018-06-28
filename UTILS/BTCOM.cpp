// BTCOM.cpp
//-----------------------------------------------------------------------------
#include <windows.h>
#include <stdio.h>
#include <sys\timeb.h>
#include <time.h>
//-----------------------------------------------------------------------------
#include "BTCOM.h"
//-----------------------------------------------------------------------------
DWORD DbgSleep=0; // для отладки
//-----------------------------------------------------------------------------
TCOMPort::TCOMPort()
{
  h=INVALID_HANDLE_VALUE;
  st.p=255;
  br=0;bw=0;er=0;ew=0;ec=0;eo=0;lerr=0;
  st.on=false;st.run=false;st.res=true;st.cmd=0;
  to.ReadIntervalTimeout=0;
  to.ReadTotalTimeoutMultiplier=0;
  to.ReadTotalTimeoutConstant=500;
  to.WriteTotalTimeoutMultiplier=0;
  to.WriteTotalTimeoutConstant=500;
  InitDCB(&dcb);
  TmOpen=Now();TmClose=TmOpen;

//Поумолчанию канал работаетс датчиками АН-Д3 (протокол поумолчанию)
  s_protocol_type=PRT_DEFAULT;

  Protocol211=NULL;
  ServiceMode=false;

  st.baud=115200;
}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
/*
bool TCOMPort::Close(void)
{
  st.run=true;st.cmd=2;
  if(!st.on) { st.res=true;st.run=false;TmClose=Now();return true;}
  Sleep(DbgSleep);
  if(PServerSocket==NULL) {st.res=CloseHandle(h);h=INVALID_HANDLE_VALUE;}
  else
  {
    try { PServerSocket->Active=false;st.res=true;}catch (...) { st.res=false;}
  }
  st.on=false;st.run=false;TmClose=Now();return st.res;
}
*/
//-----------------------------------------------------------------------------
bool TCOMPort::VClose(void)
{
  st.run=true;st.cmd=2;
  if(!st.on) { st.res=true;st.run=false;TmClose=Now();return true;}
  st.res=true;h=INVALID_HANDLE_VALUE;
  st.on=false;st.run=false;TmClose=Now();return st.res;
}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
/*
bool TCOMPort::Open(bool clr_err,DWORD port,TServerSocket* PSrvSocket)
{
  char Name[200];
  PServerSocket=PSrvSocket;
  if(st.on) Close();
  st.p=port;if(PServerSocket!=NULL) PServerSocket->Port=port;
  if(clr_err) {br=0;bw=0;er=0;ew=0;ec=0;lerr=0;}
  st.run=true;st.cmd=1;
  Sleep(DbgSleep);
  if(PServerSocket==NULL)
  {
    sprintf(Name,"\\\\.\\COM%d",st.p+1);
    h=CreateFile(Name,GENERIC_READ|GENERIC_WRITE,0,NULL,OPEN_EXISTING,
                      FILE_ATTRIBUTE_NORMAL|FILE_FLAG_NO_BUFFERING,NULL);
    if(!(st.res=(h!=INVALID_HANDLE_VALUE)))
    {
      TmOpen=Now();TmClose=TmOpen;
      eo++;st.run=false;st.res=false;return st.res;
    }
    st.res=(SetCommState(h,&dcb)&&SetCommTimeouts(h,&(to)));
    if(st.res)
    {
      st.cmd=1;st.run=false;st.on=true;
      TmOpen=Now();TmClose=TmOpen-1.0/24.0/3600.0/1000.0;
      return st.res;
    }
    Close();
    eo++;st.cmd=1;st.run=false;st.res=false;return st.res;
  }
  else
  {
    try { PServerSocket->Active=true;st.res=true;} catch (...) { st.res=false;}
    if(!st.res)
    {
      TmOpen=Now();TmClose=TmOpen;
      eo++;st.run=false;return st.res;
    }
    else
    {
      st.cmd=1;st.run=false;st.on=true;
      TmOpen=Now();TmClose=TmOpen-1.0/24.0/3600.0/1000.0;
      return st.res;
    }
  }
}
*/
bool TCOMPort::Close(void)
{
  st.run=true;st.cmd=2;
  if(!st.on) { st.res=true;st.run=false;TmClose=Now();return true;}
  Sleep(DbgSleep);
  if(PServerSocket==NULL) {st.res=CloseHandle(h);h=INVALID_HANDLE_VALUE;}
  else
  {
    try
    {
      //int n=PServerSocket->Socket->ActiveConnections;
      //for(int i=n-1;i>=1;i--) PServerSocket->Socket->Connections[0]->Close();
      if(PServerSocket->Socket->ActiveConnections==1) PServerSocket->Socket->Connections[0]->Close();
      //if(PServerSocket->Active) PServerSocket->Active=false;
      st.res=true;
    }
    catch (...) { st.res=false;}
  }
  st.on=false;st.run=false;TmClose=Now();return st.res;

  if (Protocol211) delete Protocol211;

}


bool TCOMPort::Open(bool clr_err,DWORD port,TServerSocket* PSrvSocket)
{
  char Name[200];
  PServerSocket=PSrvSocket;
  if(st.on) Close();
  st.p=port;if(PServerSocket!=NULL) PServerSocket->Port=port;
  if(clr_err) {br=0;bw=0;er=0;ew=0;ec=0;lerr=0;}
  st.run=true;st.cmd=1;
  Sleep(DbgSleep);
  if(PServerSocket==NULL)
  {
    sprintf(Name,"\\\\.\\COM%d",st.p+1);
    h=CreateFile(Name,GENERIC_READ|GENERIC_WRITE,0,NULL,OPEN_EXISTING,
                      FILE_ATTRIBUTE_NORMAL|FILE_FLAG_NO_BUFFERING,NULL);
    if(!(st.res=(h!=INVALID_HANDLE_VALUE)))
    {
      TmOpen=Now();TmClose=TmOpen;
      eo++;st.run=false;st.res=false;return st.res;
    }
    st.res=(SetCommState(h,&dcb)&&SetCommTimeouts(h,&(to)));
    if(st.res)
    {
      st.cmd=1;st.run=false;st.on=true;
      TmOpen=Now();TmClose=TmOpen-1.0/24.0/3600.0/1000.0;
      return st.res;
    }
    Close();
    eo++;st.cmd=1;st.run=false;st.res=false;return st.res;
  }
  else
  {
    //int n=PServerSocket->Socket->ActiveConnections;
    //try
    //{
    //  for(int i=n-1;i>=1;i--) PServerSocket->Socket->Connections[0]->Close();
    //}
    //catch (...) {}
    //if(PServerSocket->Socket->ActiveConnections==1) PServerSocket->Socket->Connections[0]->Close();
    //if(!PServerSocket->Active) PServerSocket->Active=true;

    st.res=(PServerSocket->Socket->ActiveConnections==1);
    if(!st.res)
    {
      TmOpen=Now();TmClose=TmOpen;
      eo++;st.run=false;return st.res;
    }
    else
    {
      PurgeCom();
      st.cmd=1;st.run=false;st.on=true;
      TmOpen=Now();TmClose=TmOpen-1.0/24.0/3600.0/1000.0;
      return st.res;
    }
  }
}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
bool TCOMPort::VOpen(bool clr_err,HANDLE h_opend,DWORD port)
{
  if(st.on) VClose();
  if(port<255) st.p=port;
  if(clr_err) {br=0;bw=0;er=0;ew=0;ec=0;lerr=0;}
  st.run=true;st.cmd=1;
  h=h_opend;
  st.res=true;
  st.cmd=1;st.run=false;st.on=true;
  TmOpen=Now();TmClose=TmOpen-1.0/24.0/3600.0/1000.0;
  return true;
}
//-----------------------------------------------------------------------------
bool TCOMPort::PortNRead(DWORD n,BYTE *b)
{
  Nr=0;
  double d1,d2;
  st.run=true;
  st.cmd=3;

  Sleep(DbgSleep);

  if(!st.on)
  {
   st.res=false;
   st.run=false;
   return st.res;
   }

  if(PServerSocket==NULL)
  {
    st.res=ReadFile(h,b,n,&Nr,0);br+=Nr;lbr=Nr;
    st.res=st.res&&(Nr==n);
  }
  else
  {
    if(PServerSocket->Socket->ActiveConnections!=1)
    {
            st.res=false;
            st.run=false;
            return st.res;
    }


    d1=d2=Now();
    try
    {
      while((d2-d1)<to.ReadTotalTimeoutConstant/24.0/3600.0/1000.0)
      {
        Nr=PServerSocket->Socket->Connections[0]->ReceiveLength();if(Nr>4100) Nr=4100;
        if(Nr>0) {PServerSocket->Socket->Connections[0]->ReceiveBuf(b,Nr);break;}
        Sleep(1);
        d2=Now();
      }
      br+=Nr;lbr=Nr;
      st.res=(Nr==n);
    }
    catch (...)
    {
     st.res=false;
    }
  }

  st.run=false;

  return st.res;
}
//-----------------------------------------------------------------------------
extern bool CRCErr,WErr;
//-----------------------------------------------------------------------------
bool TCOMPort::PortNWrite(DWORD n,BYTE *b)
{
  Nw=0;st.run=true;st.cmd=4;
  Sleep(DbgSleep);
  if(!st.on) { st.res=false;st.run=false;return st.res;}
  if(PServerSocket==NULL)
  {
    st.res=WriteFile(h,b,n,&Nw,NULL);bw+=Nw;if(WErr) st.res=false;
    st.res=st.res&&(Nw==n);
  }
  else
  {
    if(PServerSocket->Socket->ActiveConnections!=1) {st.run=false;st.res=false;return st.res;}
    try { PServerSocket->Socket->Connections[0]->SendBuf(b,n);Nw=n;bw+=Nw;st.res=true;if(WErr) st.res=false;}
    catch (...) { st.res=false;}
  }
  st.run=false;return st.res;
}
//-----------------------------------------------------------------------------
bool TCOMPort::SetTimeouts(DWORD rtime,DWORD wtime)
{
  //st.cmd=5;
  //Sleep(1); Сервер: Ошибка записи в порт COM7
  //st.run=true;
  st.run=true;st.cmd=5; // 1.0.2 Ошибка записи в порт COM7
  Sleep(DbgSleep);
  if(!st.on) { st.res=false;st.run=false;return false;}
  to.ReadIntervalTimeout=0;
  to.ReadTotalTimeoutMultiplier=0;
  to.ReadTotalTimeoutConstant=rtime;
  to.WriteTotalTimeoutMultiplier=0;
  to.WriteTotalTimeoutConstant=wtime;
  if(PServerSocket==NULL) st.res=SetCommTimeouts(h,&(to));else st.res=true;
  st.run=false;return st.res;
}
//-----------------------------------------------------------------------------
bool TCOMPort::Purge()
{
  st.run=true;st.cmd=6;
  Sleep(DbgSleep);
  if(!st.on) { st.res=false;st.run=false;return st.res;}
  if(PServerSocket==NULL) st.res=PurgeComm(h,PURGE_TXCLEAR|PURGE_RXCLEAR);
  else
  {
    if(PServerSocket->Socket->ActiveConnections!=1) {st.res=false;st.run=false;return st.res;}
    try
    {
      Nr=PServerSocket->Socket->Connections[0]->ReceiveLength();if(Nr>4100) Nr=4100;
      if(Nr>0) PServerSocket->Socket->Connections[0]->ReceiveBuf(buf4100,Nr);
      st.res=true;
    }
    catch (...) { st.res=false;}
  }
  st.run=false;return st.res;
}
//-----------------------------------------------------------------------------
void TCOMPort::PurgeCom()
{
  if(PServerSocket==NULL) PurgeComm(h,PURGE_TXCLEAR|PURGE_RXCLEAR);
  else
  {
    if(PServerSocket->Socket->ActiveConnections!=1) return;
    try
    {
      Nr=PServerSocket->Socket->Connections[0]->ReceiveLength();if(Nr>4100) Nr=4100;
      if(Nr>0) PServerSocket->Socket->Connections[0]->ReceiveBuf(buf4100,Nr);
    }
    catch (...) { return;}
  }
}
//-----------------------------------------------------------------------------
void  TCOMPort::Clr()
{
  unsigned long N;BYTE b;
  if(PServerSocket==NULL)
  {
    for(int i=0;i<1000;i++) if((!ReadFile(h,&b,1,&N,0))||(N==0)) return;
  }
  else
  {
    if(PServerSocket->Socket->ActiveConnections!=1) return;
    try
    {
      Nr=PServerSocket->Socket->Connections[0]->ReceiveLength();if(Nr>4100) Nr=4100;
      if(Nr>0) PServerSocket->Socket->Connections[0]->ReceiveBuf(buf4100,Nr);
      return;
    }
    catch (...) { return;}
  }
}
//-----------------------------------------------------------------------------
bool TCOMPort::CSend(int n,BYTE *pb,DWORD rtime,DWORD wtime)
{
  WORD crc,rcrc;
  crc=CRC16CCITT(n,pb);
  if(!SetTimeouts(rtime,wtime))  { ew++;lerr=0*100+1;return false;}
  if(!PortNWrite(n,pb))          { ew++;lerr=n*100+2;return false;}
  if(!PortNWrite(2,(byte*)&crc)) { ew++;lerr=2*100+3;return false;}
  if(!PortNRead(2,(byte*)&rcrc)) { er++;lerr=2*100+5;return false;}
  if(crc!=rcrc)                  { ec++;lerr=2*100+6;st.cmd=7;st.res=false;return false;}
  return true;
}
//-----------------------------------------------------------------------------
bool TCOMPort::CReceive(int n,BYTE *pb,DWORD rtime,DWORD wtime)
{
  WORD crc,rcrc;
  if(!SetTimeouts(rtime,wtime))  { ew++;lerr=0*100+11;return false;}
  if(!PortNRead(n,pb))           { er++;lerr=n*100+14;return false;}
  if(!PortNRead(2,(byte*)&rcrc)) { er++;lerr=2*100+15;return false;}
  crc=CRC16CCITT(n,pb);
  if(crc!=rcrc)                  { ec++;lerr=2*100+16;st.cmd=7;st.res=false;return false;}
  if(!PortNWrite(2,(byte*)&rcrc)){ ew++;lerr=2*100+13;return false;}
  return true;
}


//Это основная функция обмена с устройством!
//-----------------------------------------------------------------------------
BYTE* TCOMPort::BS4I1_Cmd(BYTE adr,BYTE cmd,BYTE dat1,BYTE dat2,int nr,DWORD wtime,DWORD rtime)
{
//Похоже, тут надо смотреть с каким протоколом работаем

  buf4100[0]=adr;buf4100[1]=cmd;buf4100[2]=dat1;buf4100[3]=dat2;

  *((WORD*)(buf4100+2+2))=CRC16CCITT(2+2,buf4100);

  if(!SetTimeouts(rtime,wtime))     { ew++;lerr=     0*100+5;PurgeCom();return NULL;}

  if(!PortNWrite(6,buf4100))        { ew++;lerr=     6*100+4;PurgeCom();return NULL;}
  if(adr==0) return buf4100+2;
  if(!PortNRead(nr+4,buf4100))      { er++;lerr=lbr*10000000+(nr+4)*100+3;PurgeCom();    return NULL;}
  //----------------------------------------------------------------------------
  // !!! GPRS
  //----------------------------------------------------------------------------
  //if(buf4100[0]!=adr)               { ec++;lerr=     1*100+8;st.cmd=7;st.res=false;Clr();return NULL;}
  if(buf4100[0]!=adr)
  {
     if(*((WORD*)(buf4100+2+nr))!=CRC16CCITT(2+nr,buf4100))
    {
      ec++;lerr=     1*100+8;st.cmd=7;st.res=false;Clr();return NULL;
    }
    if(!PortNRead(nr+4,buf4100))    { er++;lerr=lbr*10000000+(nr+4)*100+3;PurgeCom();    return NULL;}
  }
  if(buf4100[0]!=adr)               { ec++;lerr=     1*100+8;st.cmd=7;st.res=false;Clr();return NULL;}
  //if(buf4100[1]!=cmd)               { ec++;lerr=     1*100+9;st.cmd=7;st.res=false;Clr();return NULL;}
  if(buf4100[1]!=cmd)
  {
    if(*((WORD*)(buf4100+2+nr))!=CRC16CCITT(2+nr,buf4100))
    {
      ec++;lerr=     1*100+9;st.cmd=7;st.res=false;Clr();return NULL;
    }
    if(!PortNRead(nr+4,buf4100))    { er++;lerr=lbr*10000000+(nr+4)*100+3;PurgeCom();    return NULL;}
  }
  if(buf4100[0]!=adr)               { ec++;lerr=     1*100+8;st.cmd=7;st.res=false;Clr();return NULL;}
  if(buf4100[1]!=cmd)               { ec++;lerr=     1*100+9;st.cmd=7;st.res=false;Clr();return NULL;}
  //----------------------------------------------------------------------------
  if(*((WORD*)(buf4100+2+nr))!=CRC16CCITT(2+nr,buf4100))
                                    { ec++;lerr=(nr+4)*100+7;st.cmd=7;st.res=false;Clr();return NULL;}
  if(CRCErr)
                                    { ec++;lerr=(nr+4)*100+7;st.cmd=7;st.res=false;Clr();return NULL;}
  return buf4100+2;

}
//-----------------------------------------------------------------------------


void TCOMPort::InitDCB(DCB* PortDCB)
{
  PortDCB->DCBlength=sizeof(DCB);
  // Specifies the length, in bytes, of the DCB structure.
  //PortDCB->BaudRate=19200;
  //PortDCB->BaudRate=38400;
  //PortDCB->BaudRate=57600;
  PortDCB->BaudRate=115200;
  //PortDCB->BaudRate=230400;
  //PortDCB->BaudRate=460800;
  //PortDCB->BaudRate=921600;
  // Specifies the baud rate at which the communications device operates.
  // This member can be an actual baud rate value
  PortDCB->fBinary=1;
  // Specifies whether binary mode is enabled. The Win32 API does not support 
  // nonbinary mode transfers, so this member should be TRUE. Trying to use 
  // FALSE will not work.
  // Under Windows 3.1, if this member is FALSE, nonbinary mode is enabled, 
  // and the character specified by the EofChar member is recognized on input 
  // and remembered as the end of data. 
  PortDCB->fParity=0;
  // Specifies whether parity checking is enabled. If this member is TRUE,
  // parity checking is performed and errors are reported. 

  //PortDCB->fOutxCtsFlow=1;
  PortDCB->fOutxCtsFlow=0;
  // Specifies whether the CTS (clear-to-send) signal is monitored for output
  // flow control. If this member is TRUE and CTS is turned off, output is
  // suspended until CTS is sent again.
  PortDCB->fOutxDsrFlow=0;
  // Specifies whether the DSR (data-set-ready) signal is monitored for output
  // flow control. If this member is TRUE and DSR is turned off, output is 
  // suspended until DSR is sent again.
  PortDCB->fDtrControl=0;
  // Specifies the DTR (data-terminal-ready) flow control. This member can
  // be one of the following values:
  // DTR_CONTROL_DISABLE   0x00	Disables the DTR line when the device is opened and 
  //                            leaves it disabled.
  // DTR_CONTROL_ENABLE	   0x01 Enables the DTR line when the device is opened
  //                            and leaves it on.
  // DTR_CONTROL_HANDSHAKE 0x02	Enables DTR handshaking. If handshaking is
  //                            enabled, it is an error for the application 
  //                            to adjust the line by using the 
  //                            EscapeCommFunction function.
  PortDCB->fDsrSensitivity=0;
  // Specifies whether the communications driver is sensitive to the state of
  // the DSR signal. If this member is TRUE, the driver ignores any bytes 
  // received, unless the DSR modem input line is high.
  PortDCB->fTXContinueOnXoff=0;
  // Specifies whether transmission stops when the input buffer is full and
  // the driver has transmitted the XoffChar character. If this member is TRUE, transmission
  // continues after the input buffer has come within XoffLim bytes of being full and 
  // the driver has transmitted the XoffChar character to stop receiving bytes. If this 
  // member is FALSE, transmission does not continue until the input buffer is within 
  // XonLim bytes of being empty and the driver has transmitted the XonChar character to
  // resume reception.
  PortDCB->fOutX=0;
  // Specifies whether XON/XOFF flow control is used during transmission. If this 
  // member is TRUE, transmission stops when the XoffChar character is received and 
  // starts again when the XonChar character is received.
  PortDCB->fInX=0;
  // Specifies whether XON/XOFF flow control is used during reception. If this member is 
  // TRUE, the XoffChar character is sent when the input buffer comes within XoffLim bytes 
  // of being full, and the XonChar character is sent when the input buffer comes within
  // XonLim bytes of being empty.
  PortDCB->fErrorChar=0;
  // Specifies whether bytes received with parity errors are replaced with the character
  // specified by the ErrorChar member. If this member is TRUE and the fParity member is TRUE,
  // replacement occurs.
  PortDCB->fNull=0;
  // Specifies whether null bytes are discarded. If this member is TRUE, null bytes
  // are discarded when received.
  //PortDCB->fRtsControl=0x02;
  PortDCB->fRtsControl=0x0;
  // Specifies the RTS (request-to-send) flow control. If this value is zero,
  // the default is RTS_CONTROL_HANDSHAKE. This member can be one of the following values:
  // RTS_CONTROL_DISABLE	0x00   Disables the RTS line when the device is opened and
  //                               leaves it disabled.
  // RTS_CONTROL_ENABLE	    0x01   Enables the RTS line when the device is opened and
  //                               leaves it on.
  // RTS_CONTROL_HANDSHAKE	0x02   Enables RTS handshaking. The driver raises the RTS line
  //                               when the "type-ahead" (input) buffer is less
  //                               than one-half full and lowers the RTS line when the
  //                               buffer is more than three-quarters full. If handshaking
  //                               is enabled, it is an error for the application to adjust
  //                               the line by using the EscapeCommFunction function.
  // RTS_CONTROL_TOGGLE	    0x03   Specifies that the RTS line will be high if bytes are
  //                               available for transmission. After all buffered bytes
  //                               have been sent, the RTS line will be low.
  PortDCB->fAbortOnError=0;
  // Specifies whether read and write operations are terminated if an error occurs.
  // If this member is TRUE, the driver terminates all read and write operations with
  // an error status if an error occurs. The driver will not accept any further
  // communications operations until the application has acknowledged the error by
  // calling the ClearCommError function.
  PortDCB->fDummy2=0;
  // Reserved; do not use.
  //PortDCB->wReserved=0;
  // Not used; must be set to zero.
  PortDCB->XonLim=0;
  // Specifies the minimum number of bytes allowed in the input buffer before the XON
  // character is sent.
  PortDCB->XoffLim=0;
  // Specifies the maximum number of bytes allowed in the input buffer before the XOFF
  // character is sent. The maximum number of bytes allowed is calculated by subtracting
  // this value from the size, in bytes, of the input buffer.
  PortDCB->ByteSize=8;
  // Specifies the number of bits in the bytes transmitted and received.
  PortDCB->Parity=0;
  // Specifies the parity scheme to be used. This member can be one of the following values:
  // EVENPARITY	 2  Even
  // MARKPARITY	 3  Mark
  // NOPARITY	 0  No parity
  // ODDPARITY	 1  Odd
  // SPACEPARITY 4  Space
  PortDCB->StopBits=0;
  //Specifies the number of stop bits to be used. This member can be one of the following 
  // values:
  // ONESTOPBIT	        0  1 stop bit
  // ONE5STOPBITS	1  1.5 stop bits
  // TWOSTOPBITS	2  2 stop bits
  PortDCB->XonChar=0;
  // Specifies the value of the XON character for both transmission and reception.
  PortDCB->XoffChar=0;
  // Specifies the value of the XOFF character for both transmission and reception.
  PortDCB->ErrorChar=0;
  // Specifies the value of the character used to replace bytes received with a 
  // parity error.
  PortDCB->EofChar=0;
  // Specifies the value of the character used to signal the end of data.
  PortDCB->EvtChar=0;
  // Specifies the value of the character used to signal an event.
  PortDCB->wReserved1=0;
  //Reserved; do not use.
}
//-----------------------------------------------------------------------------
//double DTime(bool set)
//{
//  TDateTime t=Now();
//  static TDateTime dt0;
//  if(set) dt0=t;
//  return (double(t-dt0)*24.0*3600.0);
//}
//-----------------------------------------------------------------------------
double DTime(bool set)
{
  LARGE_INTEGER t,frq;
  QueryPerformanceCounter(&t);
  static LARGE_INTEGER dt0;
  if(set) { dt0=t;return 0.0;}
  LARGE_INTEGER freq;QueryPerformanceFrequency(&freq);
  return ((double)(t.QuadPart-dt0.QuadPart)/(double)freq.QuadPart);
}
//-----------------------------------------------------------------------------
double CoreTime(void)
{
  LARGE_INTEGER t;QueryPerformanceCounter(&t);
  LARGE_INTEGER freq;QueryPerformanceFrequency(&freq);
  return ((double)t.QuadPart/(double)freq.QuadPart);
}
//-----------------------------------------------------------------------------
/*
double DTime(bool set)
{
  struct timeb t;ftime(&t);
  static double dt0;
  double dt=(double)t.time+(double)t.millitm/1000.0;
  if(set) dt0=dt;
  return dt-dt0;
}
*/
//-----------------------------------------------------------------------------
static const WORD crc_16_table[256] =
{
    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
    0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
    0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
    0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
    0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
    0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
    0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
    0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
    0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
    0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
    0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
    0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
    0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
    0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
    0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
    0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
    0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
    0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
    0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
    0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
    0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
    0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
    0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
    0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
    0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
    0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
    0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
    0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
    0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
    0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
    0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0
};
WORD Calc_CRC(WORD start, WORD stop, int n,BYTE *b)
{
  WORD sum;int i;
  sum=start;
  for(i=0;i<n;i++) sum=(sum<<8)^crc_16_table[((sum>>8)^b[i])&0xff];
  return sum^stop;
}
WORD Calc_CRC16(int n,BYTE *b)  { return Calc_CRC(0,0,n,b);}
WORD TCOMPort::Calc_CITT16(int n,BYTE *b) { return Calc_CRC(0xffff,0,n,b);}
WORD Calc_CSum(int n,BYTE *b) { WORD res;int i;res=0;for(i=0;i<n;i++) res+=b[i];return res;}
//-----------------------------------------------------------------------------
WORD TCOMPort::CRC16CCITT(WORD n,BYTE *b) // Проверено, совпадает с Calc_CITT16
{
  WORD crc=0xFFFF;
  while (n--) crc=(crc<<8)^crc_16_table[(crc>>8)^*b++];
  return crc;
}
//-----------------------------------------------------------------------------
WORD CRC16CCITT(WORD n,BYTE *b) // Проверено, совпадает с Calc_CITT16
{
  WORD crc=0xFFFF;
  while (n--) crc=(crc<<8)^crc_16_table[(crc>>8)^*b++];
  return crc;
}


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// ИН-Д3
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------


void TCOMPort::CreateProtocol211(void)
{
//Создаемэкземпляр протокола 2.11
        this->Protocol211=new TProtocol_211;
//Указываем порту на тип протокола
        s_protocol_type=PRT_IND3_211;
}

int TCOMPort::AddIND3Sensor(unsigned char addr)
{
    if (this->Protocol211==NULL) return -1;
    Protocol211->AddIND3Sensor(addr);
    return 0;
}


//Транзакция запрос-ответ для протокола 2.11
BYTE* TCOMPort::BS4I1_Cmd_211_request(BYTE addr, ind3_common_request_type request)
{
int nr=0;//???

   this->PurgeCom();
   this->SetTimeouts(100,100);


//Ту тформируем запрос для датчика ИН-Д3
  int len=0;
//Ожидаемая длина ответа
  int len_respond=32;

  BYTE extrasmb=0;

//Проверяем наличие экземплярапротокола
  if (Protocol211==NULL) return NULL;


  switch (request)
  {
          case cMEAS_VAL:
                Protocol211->RequestMeasureResult(addr,buf4100,&len);
                len=12;
          break;

          case cGET_NAME:
                Protocol211->RequestSensorMeterName(addr,buf4100,&len);
                len=6;
          break;

  }


//Отправляем запрос в СОМ порт
  if(!PortNWrite(6,buf4100))
  { ew++;
    lerr=     6*100+4;PurgeCom();
    return NULL;
  }

//Читаем ответ
  memset(buf4100,0,100);
  int res=0;

  if (request==cMEAS_VAL)
  {
          if (!PortNRead(len,buf4100))
          {
            er++;
            lerr=lbr*10000000+(nr+4)*100+3;
            PurgeCom();
           return NULL;
         }
  }
  else
  {
      PortNRead(40,buf4100);
      return buf4100;
  }

  if (buf4100[len-1]!=0x7E)
  {
        for (int i=0; i<12; i++)
        {
                  if (!PortNRead(1,&extrasmb))
                  {
                           er++;
                           lerr=lbr*10000000+(nr+4)*100+3;
                           PurgeCom();
                           return NULL;
                  }

                  buf4100[len]=extrasmb;len++;

                  if (extrasmb==0x7E)
                  {
                    break;
                  }

                  if (i>10)
                  {
                           er++;
                           lerr=lbr*10000000+(nr+4)*100+3;
                           PurgeCom();
                           return NULL;
                  }

        }
  }

  if (request!=cMEAS_VAL) return buf4100;

  res=Protocol211->packet_proc(buf4100,len) ;
  {
       if (res==0)
       {
                return buf4100;
       }
       else
       {
                if (res==-6)
                {
                        ec++;                    //Ошибка контрольной суммы
                        lerr=(nr+4)*100+7;       //??? как это формровать
                }
                else
                {
                       er++;                     //Ошибка чтения
                       lerr=lbr*10000000+(nr+4)*100+3; //???
                }

                PurgeCom();
                return NULL;
        }
  }


}

//------------------------------------------------------------------------------
bool TCOMPort::PortNWriteTune(DWORD n,BYTE *b)
{
//    PurgeComm(h,PURGE_TXCLEAR|PURGE_RXCLEAR);

    st.res=WriteFile(h,b,n,&Nw,NULL);bw+=Nw;if(WErr) st.res=false;
    st.res=st.res&&(Nw==n);
    return st.res;
}

//------------------------------------------------------------------------------
bool TCOMPort::BytesAvilable(void)
{
 if (h==NULL) return false;

 COMSTAT comstat;
 DWORD dummy;

 ClearCommError(h, &dummy, &comstat);
 return comstat.cbInQue;
}



//------------------------------------------------------------------------------
