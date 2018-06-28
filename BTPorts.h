// BTPorts.h
//---------------------------------------------------------------------------
#ifndef BTPortsH
#define BTPortsH
//-----------------------------------------------------------------------------
#include <windows.h>
#include <Classes.hpp>
//-----------------------------------------------------------------------------
#include "BTCOM.h"
#include "BS4I1Thr.h"
#include "Sensor.h"
//-----------------------------------------------------------------------------
//#define MaxNumPrs 4
#define MaxNumPrs 8
//!!!

//#define MaxNumSrs 16
//!!!
#define MaxNumSrs 24

#define MaxPrsSel 254
#define MaxPrsSel 511
//-----------------------------------------------------------------------------
/*

Вот это и есть канал. У него есть

- Имя
- СОМ порт
- Список датчиков
- Поток выполнения

*/

//Структура описания порта
typedef struct
{
  DWORD p;
//Включен в опрос
  bool on;
//Запущен мониторинг
  bool run;
//Указаель на СОМ порт
  TCOMPort*  CPrt;
//Указатель на поток обработки
  TTDThread* CThr;
//Время открытия закрытия
  double TmOpen,TmClose;
//???Число датчиков на порту
  int NumPSrs;
//???Имя порта - комментарий из INI
  AnsiString Name;

//Список указателей датчиков на порту
  TBTSensor* Srs[MaxNumSrs];

} TBTPortState;
//-----------------------------------------------------------------------------

/*
Группа СОМ портов
через BT адаптер
*/

class TBTPorts
{
  private:
  public:

//Имя "куста СОМ портов" адаптера BT
  AnsiString Name;

//Мониторинг в системе включен
  bool on;

//Общее число поров в системе
  int NumPrs;

//состояние, предыдущее состояние
  DWORD wstate,oldwstate;

//Список всех портов в системе
  TBTPortState Ps[MaxNumPrs];

//Удалить порт из системы
  void Delete(int ix);

//Добавить порт в систему
  void Add(int port,DWORD rate=115200); // !!! 1.202

//Запуск мониторинга для заданного порта
  void Run(int i);

//Стоп мониторинга
  void Stop(int i);

//Подсчет общего числа датчиков в системе
  int  NumSens(void);


  AnsiString StrTm(int i);

  AnsiString StrTmOn(int i);

  void SetWState(int i,DWORD ws);

  DWORD GetOldWState(int i);

  DWORD GetWState(int i);

  TBTPorts(void);

  virtual ~TBTPorts() {};

};
//-----------------------------------------------------------------------------
#endif
//-----------------------------------------------------------------------------

