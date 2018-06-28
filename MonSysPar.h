/*
        ����� ��������� ������������ ������� �����������
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

// ��� ���������
 MonSysIniParType muParType;

//������ � ini �����
 AnsiString msSection;

//�������� � ini �����
 AnsiString msPar;

//�������� ��������� � ini �����
 AnsiString msVal;

//��������� �� ����������� �������� ����������-��������� � �������
void* mvSysParameter;

//��������� �� ���������� ��������� �����������-����������
void* muParCtrl;

 public:

 TMonSysPar(void);
 ~TMonSysPar(void);

//������������� syspar ������ ��������� �� �������� �������� � �������

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