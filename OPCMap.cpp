//---------------------------------------------------------------------------

#pragma hdrstop
#include "OPCMap.h"
#include "OPCU.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

_fastcall TSensOPCMap::TSensOPCMap()
{

  gDiscrtTagNum=1;
  gAnalogTagNum=1;
  gTagsMapVal=0;

   for (int i=0; i<TAGSMAPVAL; i++)
   {
        TagsMap[i]=NULL;
   }

}

_fastcall TSensOPCMap::~TSensOPCMap()
{

   int i=0;

   while (TagsMap[i])
   {
        delete TagsMap[i];
        if (i>=TAGSMAPVAL-1) break;
        i++;
   }

}

/*
#define DISCRTTAGS      8
#define ANALOGTAGS      212
��������� ����� ����� ��� ������ �������
*/

int TSensOPCMap::AddSensMap(TBTSensor* s)
{

//������� ����� ����� �����
    SensOPCMap* map = new SensOPCMap;

//�������������� ��������
    for (int i=0; i<DISCRTTAGS; i++) map->DTags[i]=0;
    for (int j=0; j<ANALOGTAGS; j++) map->ATags[j]=0;

//��������� ��������� �� ������
    map->S=s;

//����������� ������ ���������� �����
    for (int i=0; i<DISCRTTAGS; i++) map->DTags[i]=gDiscrtTagNum++;

//����������� ������ ���������� �����
    for (int j=0; j<ANALOGTAGS; j++) map->ATags[j]=gAnalogTagNum++;

//�������� � ����� �������
    TagsMap[gTagsMapVal]=map;

//������� ����� ���������� ���� 
    gTagsMapVal++;

}


//TStrings* TSensOPCMap::SetValues()
void TSensOPCMap::SetValues(TStrings* res)
{

     int i=0;
     int j=0;
     int analogtagidx=1;
     int discrttegidx=1;

//!!!     TStrings* res=new TStringList();

     res->Clear();

//     
     int  sensidx=0;

     bool tdstate=false;

//���������� ������� ����� OPC �������
     int  tagidx=0;

     int  localtagidx=0;

     AnsiString now = Now();

     unsigned short sw=0;

//��������� ���������� ����
     for (i=0; i<gTagsMapVal; i++)
     {

        sw=*((unsigned short*)&TagsMap[sensidx]->S->sw);


/*
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
*/

        tdstate=((sw&(1<<0))!=0); //������������
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<1))!=0); //���������� ������ �������
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<2))!=0); //���������� ������ �����������
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<4))!=0); //������ �������������
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<5))!=0); //������ CRC �������
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<6))!=0); //������ CRC �������
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<7))!=0); //������ ����� �����������
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<8))!=0); //������ ��������� �����������
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        sensidx++;
     }


//��������� ���������� ����
     double fval=0;
     DWORD  dval=0;

     sensidx=0;

     for (i=0; i<gTagsMapVal; i++)
     {

//������� �������� ���� �� X
            fval=TagsMap[sensidx]->S->XCur;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//������� �������� ���� �� Y
            fval=TagsMap[sensidx]->S->YCur;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//����. ��������� �� X
            fval=TagsMap[sensidx]->S->AXMax;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//����. ��������� �� Y
            fval=TagsMap[sensidx]->S->AYMax;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//������� �������� ��������� �� X
            fval=TagsMap[sensidx]->S->AXRms;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//������� �������� ��������� �� Y
            fval=TagsMap[sensidx]->S->AYRms;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//�����������
            fval=TagsMap[sensidx]->S->TCur;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//������
            res->Add(TOPCGate::FormatVal(++tagidx, 0, true, now));

           sensidx++;

     }

}


