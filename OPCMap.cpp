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
Добавляем карту тэгов для одного датчика
*/

int TSensOPCMap::AddSensMap(TBTSensor* s)
{

//Создаем новую карту тэгов
    SensOPCMap* map = new SensOPCMap;

//Предварительно обнуляем
    for (int i=0; i<DISCRTTAGS; i++) map->DTags[i]=0;
    for (int j=0; j<ANALOGTAGS; j++) map->ATags[j]=0;

//Назначаем указатель на датчик
    map->S=s;

//Прописываем номера дискретных тэгов
    for (int i=0; i<DISCRTTAGS; i++) map->DTags[i]=gDiscrtTagNum++;

//Прописываем номера аналоговых тэгов
    for (int j=0; j<ANALOGTAGS; j++) map->ATags[j]=gAnalogTagNum++;

//Помещаем в общую таблицу
    TagsMap[gTagsMapVal]=map;

//Двигаем общее количество карт 
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

//Глобальный счетчик тэгов OPC сервера
     int  tagidx=0;

     int  localtagidx=0;

     AnsiString now = Now();

     unsigned short sw=0;

//Заполняем дискретные тэги
     for (i=0; i<gTagsMapVal; i++)
     {

        sw=*((unsigned short*)&TagsMap[sensidx]->S->sw);


/*
  WORD  frst:1; // Перезагрузка
  WORD   fdr:1; // Готовность данных датчика
  WORD ft5dr:1; // Готовность данных температуры
                         WORD fthdr:1; // Готовность данных вентилятора

  WORD   fte:1; // Ошибки чтения датчика
  WORD   fce:1; // Ошибки CRC датчика
  WORD   fre:1; // Ошибки диапазона датчика
  WORD    r1:1; // Резерв

  WORD ft5te:1; // Ошибки чтения температуры
  WORD ft5re:1; // Ошибки диапазона температуры
  WORD fthre:1; // Ошибка частоты вентилятора
  WORD ftrme:1; // Ошибка терморегулятора

  WORD  fadr:1; // Идет поиск адреса
  WORD  ftrm:1; // Терморегулятор включен
  WORD    r2:1; // Резерв
  WORD    r3:1; // Резерв
*/

        tdstate=((sw&(1<<0))!=0); //перезагрузка
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<1))!=0); //готовность данных датчика
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<2))!=0); //готовность данных температуры
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<4))!=0); //ошибки чтениядатчика
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<5))!=0); //ошибки CRC датчика
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<6))!=0); //ошибки CRC датчика
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<7))!=0); //ошибки чтеия температуры
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        tdstate=((sw&(1<<8))!=0); //ошибки диапазона температуры
        res->Add(TOPCGate::FormatVal(++tagidx, tdstate, true, now));

        sensidx++;
     }


//Заполняем аналоговые тэги
     double fval=0;
     DWORD  dval=0;

     sensidx=0;

     for (i=0; i<gTagsMapVal; i++)
     {

//Текущее значение угла по X
            fval=TagsMap[sensidx]->S->XCur;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Текущее значение угла по Y
            fval=TagsMap[sensidx]->S->YCur;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Макс. ускорение по X
            fval=TagsMap[sensidx]->S->AXMax;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Макс. ускорение по Y
            fval=TagsMap[sensidx]->S->AYMax;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Текущее значение ускорения по X
            fval=TagsMap[sensidx]->S->AXRms;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Текущее значение ускорения по Y
            fval=TagsMap[sensidx]->S->AYRms;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Температура
            fval=TagsMap[sensidx]->S->TCur;
            res->Add(TOPCGate::FormatVal(++tagidx, fval, true, now));

//Резерв
            res->Add(TOPCGate::FormatVal(++tagidx, 0, true, now));

           sensidx++;

     }

}


