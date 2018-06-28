// BTCOM.h
//---------------------------------------------------------------------------
#ifndef BTCOMH
#define BTCOMH
//-----------------------------------------------------------------------------
#include <windows.h>
#include <Classes.hpp>
#include "ScktComp.hpp"

#include "Protocol_211.h"


//-----------------------------------------------------------------------------
//#include "BS4I1Def.h"
//-----------------------------------------------------------------------------

//Тип датчиков в скоторыми работает канал
typedef enum
{
   PRT_DEFAULT  = 0x00,
   PRT_AND3_100 = 0x01,
   PRT_IND3_211 = 0x02

}  CHAN_PROTOCOL_TYPE;


typedef struct
{

  int p;
  bool on;
  bool run;
  bool res;
  int cmd;  //
  int baud;

} SCOMState;
//-----------------------------------------------------------------------------
extern double DTime(bool set);
extern double CoreTime(void);
//-----------------------------------------------------------------------------
class TCOMPort
{
  protected:
  COMMTIMEOUTS to;
  void InitDCB(DCB* PortDCB);
  TServerSocket* PServerSocket;
  public:
  BYTE buf4100[4100];
  DCB  dcb;
  HANDLE h;
  SCOMState st;
  long int br;long int bw;DWORD lbr;DWORD er;DWORD ew;DWORD ec;DWORD eo;DWORD lerr;DWORD cmdnum;
  DWORD Nr;
  DWORD Nw;
  double TmOpen,TmClose;
  bool  Open(bool clr_err,DWORD port=255,TServerSocket* PSrvSocket=NULL);
  bool  VOpen(bool clr_err,HANDLE h_opend,DWORD port);
  bool  Close(void);
  bool  VClose();
  bool  PortNWrite(DWORD n,BYTE *b);
  bool  PortNRead(DWORD n,BYTE *b);
  bool  SetTimeouts(DWORD rtime,DWORD wtime);
  bool  Purge();
  void  PurgeCom();
  void  Clr();
  bool  CSend(int n,BYTE *pb,DWORD rtime,DWORD wtime);
  bool  CReceive(int n,BYTE *pb,DWORD rtime,DWORD wtime);

  BYTE* BS4I1_Cmd(BYTE adr,BYTE cmd,BYTE dat1,BYTE dat2,int nr,DWORD wtime,DWORD rtime);

//Транзакция запрос-ответ для протокола 2.11
  BYTE* BS4I1_Cmd_211_request(BYTE addr, ind3_common_request_type request);

  WORD  Calc_CITT16(int n,BYTE *b);

  WORD  CRC16CCITT(WORD n,BYTE *b);

  TCOMPort();

  virtual ~TCOMPort() { Close();};

//Тип датчиков на канале
  CHAN_PROTOCOL_TYPE s_protocol_type;

//Протокол для опроса ИН-Д3
  TProtocol_211* Protocol211;

//Если канал назначается для ИН-Д3 создаем экземпляр протокола 2.11
  void CreateProtocol211(void);

//Добавить датчик ИН-Д3 в список протокола 2.11
  int AddIND3Sensor(unsigned char addr);

//Безусловнаязапись в порт
bool PortNWriteTune(DWORD n,BYTE *b);

bool BytesAvilable(void);
bool ServiceMode;

};
//-----------------------------------------------------------------------------
WORD CRC16CCITT(WORD n,BYTE *b);
//-----------------------------------------------------------------------------
#endif
//-----------------------------------------------------------------------------

