//---------------------------------------------------------------------------
#pragma hdrstop
#include "MonSysPar.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

TMonSysPar::TMonSysPar(void)
{
   this->muParCtrl=NULL;
   muParType=INIPAR_VOID;
   InitFlag=false;
}

TMonSysPar::~TMonSysPar(void)
{

}

void TMonSysPar::Init(MonSysIniParType type, AnsiString section, AnsiString par, AnsiString val, void* syspar, void* ctrl)
{
     this->muParType=type;
     this->msSection=section;
     this->msPar=par;
     this->msVal=val;
     this->mvSysParameter=syspar;
     this->muParCtrl=ctrl;
     InitFlag=true;
}

void TMonSysPar::View()
{
        if (InitFlag==false) return;

        //TODO: Add your source code here
        if (this->muParType==INIPAR_STRING)
        {
           if (this->muParCtrl!=NULL)
           {
              TEdit* e=NULL;
              e=(TEdit*)this->muParCtrl;
              e->Text=this->msVal;
           }
        }

        if (this->muParType==INIPAR_INTIDX)
        {
           if (this->muParCtrl!=NULL)
           {
              TComboBox* c=NULL;
              c=(TComboBox*)this->muParCtrl;
              c->Text=this->msVal;
           }
        }

        if (this->muParType==INIPAR_BOOL)
        {
           if (this->muParCtrl!=NULL)
           {
              TCheckBox* h=NULL;
              h=(TCheckBox*)this->muParCtrl;

              if (this->msVal=="0") h->Checked=false;
              else                  h->Checked=true;
              h->Update();

           }
        }

        if (this->muParType==INIPAR_INT)
        {
           if (this->muParCtrl!=NULL)
           {
                 AnsiString s;

                 if (mvSysParameter)
                 {
                    s.printf("%d",*(int*)this->mvSysParameter);
                    msVal=s;
                 }

                 TEdit* e=NULL;
                 e=(TEdit*)this->muParCtrl;
                 e->Text=this->msVal;
           }
        }

        if (this->muParType==INIPAR_STRIDX)
        {
           if (this->muParCtrl!=NULL)
           {
              TComboBox* c=NULL;
              c=(TComboBox*)this->muParCtrl;
              c->Text=this->msVal;
           }
        }

}

void TMonSysPar::Apply()
{

        if (InitFlag==false) return;

        //TODO: Add your source code here
        if (this->muParType==INIPAR_STRING)
        {
           if (this->muParCtrl!=NULL)
           {
              TEdit* e=NULL;
              e=(TEdit*)this->muParCtrl;
              e->Update();
              msVal=e->Text;
           }

           if (this->mvSysParameter!=NULL)
           {
              *((AnsiString*)mvSysParameter)=msVal;
           }
        }


        if (this->muParType==INIPAR_BOOL)
        {
           if (this->muParCtrl!=NULL)
           {
              TCheckBox* c=NULL;
              c=(TCheckBox*)this->muParCtrl;
              c->Update();
              bool b=c->Checked;

              if (b)
              {
                 if (mvSysParameter) *((bool*)mvSysParameter)=true;
                 msVal="1";
              }
              else
              {
                 if (mvSysParameter) *((bool*)mvSysParameter)=false;
                 msVal="0";
              }
           }
        }

        if (this->muParType==INIPAR_INT)
        {
           if (this->muParCtrl!=NULL)
           {
              TEdit* e=NULL;
              e=(TEdit*)this->muParCtrl;
              e->Update();
              msVal=e->Text;
           }

           if (this->mvSysParameter!=NULL)
           {
              *((int*)mvSysParameter)=StrToInt(msVal);
           }
        }

        if (this->muParType==INIPAR_INTIDX)
        {
           if (this->muParCtrl!=NULL)
           {
              TComboBox* c=NULL;
              c=(TComboBox*)this->muParCtrl;
              c->Update();
              msVal=c->Text;
           }

           if (this->mvSysParameter!=NULL)
           {
              *((int*)mvSysParameter)=StrToInt(msVal);
           }
        }

        if (this->muParType==INIPAR_STRIDX)
        {
           if (this->muParCtrl!=NULL)
           {
              TComboBox* c=NULL;
              c=(TComboBox*)this->muParCtrl;
              c->Update();
              msVal=c->Text;
           }

           //if (this->mvSysParameter!=NULL)
           //{
           //   *((AnsiString*)mvSysParameter)=msVal;
           //}
        }


}

void TMonSysPar::SaveToIniFile(TIniFile *ini)
{
        //TODO: Add your source code here

         if (InitFlag==false) return;
         ini->WriteString(this->msSection,this->msPar,this->msVal);

}
