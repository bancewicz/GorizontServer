//---------------------------------------------------------------------------
#ifndef TD232ThrH
#define TD232ThrH
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------
//#include "..\\BTCOM.h"

#include <BTCOM.h>

#include "Sensor.h"
#include <sys\timeb.h>
//---------------------------------------------------------------------------
class TTDThread : public TThread
{

  typedef struct tagTHREADNAME_INFO
  {
    DWORD dwType;     // must be 0x1000
    LPCSTR szName;    // pointer to name (in user addr space)
    DWORD dwThreadID; // thread ID (-1=caller thread)
    DWORD dwFlags;    // reserved for future use, must be zero
  } THREADNAME_INFO;

private:
  void SetName();
protected:

//Запустить поток на выполнение
  void __fastcall Execute();

  bool Pause(int del);
  bool PortClose(void);
  void RunSlave(void);
  // Общие команды с адресом 0
  int Reset(void);
  int StackOn(bool on,bool clr,WORD nGroup);
  int StackSOn(void);
  int StackOff(void);
public:
  DWORD p;
  bool *on;

//???Поток работает  
  bool *run;

  TCOMPort *CPrt;
  double *TmClose;
  int NumTSrs;

//Указатель на список датчиков
  TBTSensor** Srs;

  BS4I1_UserCmd UCmd;

  __fastcall TTDThread(bool CreateSuspended,DWORD P,bool *ON,bool *RUN,TCOMPort *CPRT,double *TmCLOSE,int NUMSRS,TBTSensor** SRS);

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

   bool ServiceMode;

};
//---------------------------------------------------------------------------
#endif
