//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdint.h>
#include "MonSysPar.h"
#include <IniFiles.hpp>

#include "BTCOM.h"


#ifndef SysConfMasterH
#define SysConfMasterH
//---------------------------------------------------------------------------
#endif

/*
typedef struct {

  Caption=Gorizont Server
  Name=Gorizont Server
  IPPort1=502
  IPPort2=503
  ShowAdvanced=1
  NumOfPorts=1
  CanCopy=0
  CanHide=0
  CanClose=0
  CanSave=1
  MemoCount=60
  MemoDel=1
  SrsBufSize=65536
  SrsBufToSave=1
  SerialNumber=168514497
  CanInfo=1
  CanOPCDA=0

};

*/

//Базовые настройки
typedef struct {

  TMonSysPar    Caption;//=GorizontServer (демонстрационная версия)
  TMonSysPar    Name;//=Gorizont Server
  TMonSysPar    NumOfPorts;//=1
  TMonSysPar    CanHide;//=0
  TMonSysPar    CanClose;//=0
} stConfSysMain;


//расширенные система
typedef struct {

  TMonSysPar    IPPort1;
  TMonSysPar    IPPort2;
  TMonSysPar    MemoCount;
  TMonSysPar    MemoDel;
  TMonSysPar    SrsBufSize;
  TMonSysPar    SrsBufToSave;
  TMonSysPar    SerialNumber;
  TMonSysPar    ShowAdvanced;
  TMonSysPar    CanCopy;
  TMonSysPar    CanSave;
  TMonSysPar    CanInfo;
  TMonSysPar    CanOPCDA;
  TMonSysPar    CanModbus;  
  TMonSysPar    SaveAccTxt;

} stConfSysAdd;

//расширенные Таймеры
typedef struct {

  TMonSysPar    TmUpdateInt;
  TMonSysPar    TmRun;
  TMonSysPar    TmStart;
  TMonSysPar    TmSave;

} stConfSysTimers;


//расширенные Паузы
typedef struct {

  TMonSysPar    PPauseTick;
  TMonSysPar    PReOpen;
  TMonSysPar    PClose;
  TMonSysPar    PExit;

} stConfSysPauses;

//расширенные Паузы
typedef struct {

  TMonSysPar    TORCom;
  TMonSysPar    TOWCom;
  TMonSysPar    TORDat;
  TMonSysPar    TOWDat;

} stConfSysTouts;

//расширенные ошибки
typedef struct {

  TMonSysPar    NumRErrSrs;
  TMonSysPar    NumCErrSrs;

} stConfSysErrs;

typedef struct {

  TMonSysPar    SAdrChange;
  TMonSysPar    SIdle;
  TMonSysPar    SRError;
  TMonSysPar    SCRCError;

} stConfSysSleeps;

//------------------------------------------------------------------------

typedef struct {

  TMonSysPar   Name;
  TMonSysPar   BaudRate;
  TMonSysPar   Num;
  TMonSysPar   On;
  TMonSysPar   NumOfSensors;
} stConfSysPort;

typedef struct {

  TMonSysPar   Namex;
  TMonSysPar   Nx;
  TMonSysPar   Onx;
  TMonSysPar   adrx;
  TMonSysPar   SND3x;

  TMonSysPar   Xox;
  TMonSysPar   Yox;
  TMonSysPar   Tox;

  TMonSysPar   InvYx;
  TMonSysPar   RotXx;

  TMonSysPar   SetDatax;
  TMonSysPar   AdjDatax;
  TMonSysPar   Notex;
  TMonSysPar   Placex;

  TMonSysPar   AccelOnx;

} stConfSysSensor;


//------------------------------------------------------------------------

typedef enum {

  opt_none,
  opt_view,
  opt_apply,
  opt_save

} list_opt;

class TSysConfMaster
{

 public:

 TSysConfMaster(void);
 ~TSysConfMaster(void);

  stConfSysMain         ConfSysMain;
  stConfSysAdd          ConfSysAdd;
  stConfSysTimers       ConfSysTimers;
  stConfSysPauses       ConfSysPauses;
  stConfSysTouts        ConfSysTouts;
  stConfSysErrs         ConfSysErrs;
  stConfSysSleeps       ConfSysSleeps;
  stConfSysPort         ConfSysPort;
  stConfSysSensor       ConfSysSensor;

 private:

 AnsiString ConfFilePath;

 public:

 TIniFile* gIniFile;

 void  SaveIniPar();

 bool SaveFlag;
 bool SaveCompleteFlag;
 void Apply(void);
 void View(void);

 void ProcList(TMonSysPar* list, int len, list_opt opt);

 void ViewPort(void);
 void ApplyPort(void);
 void SaveIniParPort(void);

 void ViewSensor(void);
 void ApplySensor(void);
 void SaveIniParSensor(void);

 AnsiString gIniFilePath;
 AnsiString bakIniFilePath;

 TIniFile *lIniFile;

 void  SensNumUpdate();
 void TSysConfMaster::SensorDelete(int port, int sensor);
 void SensorAdd(int port,  TCOMPort* cport);
 void PortDelete(int port);
 void PortAdd();

 void (*HotRestart)(void);

 bool ConfChanged;

        int BackUp(int par);
        TMenuItem* BackUpMenuItem;
        void CheckBackUp();

};




