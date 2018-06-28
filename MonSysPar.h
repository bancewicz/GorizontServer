/*
        Класс параметра конфигурации системы мониторинга
*/


//---------------------------------------------------------------------------

#ifndef MonSysParH
#define MonSysParH
//---------------------------------------------------------------------------
#endif

#include <vcl.h>
#include <IniFiles.hpp>

typedef enum {

    INIPAR_BOOL,
    INIPAR_STRING,
    INIPAR_REAL,
    INIPAR_INT,
    INIPAR_INTIDX,
    INIPAR_STRIDX,
    INIPAR_VOID

} MonSysIniParType;



class TMonSysPar
{

 public:

// Тип параметра
 MonSysIniParType muParType;

//Секция в ini файле
 AnsiString msSection;

//Параметр в ini файле
 AnsiString msPar;

//Значение параметра в ini файле
 AnsiString msVal;

//Указатель на днйствующее значение переменной-параметра в системе
void* mvSysParameter;

//Указатель на визуальный компонент отображения-управления
void* muParCtrl;

 public:

 TMonSysPar(void);
 ~TMonSysPar(void);

//Инициализация syspar должен указывать на реальный параметр в системе

 void  Init(MonSysIniParType type, AnsiString section, AnsiString par, AnsiString val, void* syspar, void* ctrl);
 void  View();
 void  Apply();
 void  SaveToIniFile(TIniFile *ini);

/*
 int ReadSysParameter(bool* par);
 int ReadSysParameter(int* par);
 int ReadSysParameter(double* par);
 int ReadSysParameter(AnsiString* par);
*/


//
  bool InitFlag;      

};