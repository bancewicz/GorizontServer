//---------------------------------------------------------------------------


#pragma hdrstop

#include "SysConfMaster.h"
#include "sensor.h"                                                     
#include "TuneSensor.h"
#include "TunePort.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)


TSysConfMaster::TSysConfMaster(void)
{
  gIniFile=NULL;
  SaveFlag=false;
  SaveCompleteFlag=false;

//��� ������������ ��������� � �������������� ���� � ���������� ��� �����
  AnsiString s("");
  s=ChangeFileExt(Application->ExeName,".gcf");
  lIniFile=new TIniFile(s);

//������ ����������� � ����� ��� ��������������� �������

  char dir[1024];

  ::GetCurrentDirectory(1024,dir);

  strcat(dir,"\\Config");

  ::CreateDirectory(dir,0);

  strcat(dir,"\\GorizontServer.ini");

  AnsiString defaultini("");

  defaultini= dir;

//  defaultini=ChangeFileExt(Application->ExeName,"\\Config\\.ini");

  //gIniFilePath=ChangeFileExt(Application->ExeName,".ini");

  gIniFilePath=lIniFile->ReadString("GLOBALS","ConfPath",defaultini);
  bakIniFilePath=gIniFilePath+".bak";

  ConfChanged=false;

}

TSysConfMaster::~TSysConfMaster(void)
{
   lIniFile->WriteString("GLOBALS","ConfPath",gIniFilePath);
}

void TSysConfMaster::SaveIniPar()
{
        //TODO: Add your source code here

        BackUp(0);

//���� ���������� ������������ �������������
       SaveCompleteFlag=true;

//���� ������ � ��� ����������
        SaveFlag=false;

//������� ��������� ����������
        TMonSysPar* par=NULL;
//������ ����������������� ����������
        int parnum=0;

//�������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysMain;
//����������������� ����������
        parnum=sizeof(ConfSysMain)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->SaveToIniFile(this->gIniFile);
                par++;
        }

/*
        this->ConfSysMain.Caption.SaveToIniFile(this->gIniFile);
        this->ConfSysMain.Name.SaveToIniFile(this->gIniFile);
        this->ConfSysMain.CanHide.SaveToIniFile(this->gIniFile);
        this->ConfSysMain.CanClose.SaveToIniFile(this->gIniFile);
*/


//����������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysAdd;
//����������������� ����������
        parnum=sizeof(ConfSysAdd)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->SaveToIniFile(this->gIniFile);
                par++;
        }


//����������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysTimers;
//����������������� ����������
        parnum=sizeof(ConfSysTimers)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->SaveToIniFile(this->gIniFile);
                par++;
        }



/*
        this->ConfSysAdd.IPPort1.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.MemoCount.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.MemoDel.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.SrsBufSize.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.SrsBufToSave.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.ShowAdvanced.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.CanCopy.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.CanSave.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.CanInfo.SaveToIniFile(this->gIniFile);
        this->ConfSysAdd.CanOPCDA.SaveToIniFile(this->gIniFile);
*/

//����������� �����

     ProcList((TMonSysPar*)&ConfSysPauses, sizeof(ConfSysPauses), opt_save);
     ProcList((TMonSysPar*)&ConfSysTouts, sizeof(ConfSysTouts), opt_save);
     ProcList((TMonSysPar*)&ConfSysErrs, sizeof(ConfSysErrs), opt_save);
     ProcList((TMonSysPar*)&ConfSysSleeps, sizeof(ConfSysSleeps), opt_save);
}

void TSysConfMaster::Apply(void)
{
        //TODO: Add your source code here

        SaveFlag=true;

//������� ��������� �� ��������
        TMonSysPar* par=NULL;
//������ ����������������� ����������
        int parnum=0;


//�������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysMain;
//������� ������� ��� ����������
        parnum=sizeof(ConfSysMain)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->Apply();
                par++;
        }

//����������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysAdd;
//����������������� ����������
        parnum=sizeof(ConfSysAdd)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->Apply();
                par++;
        }

//����������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysTimers;
//������� ���������� ����������
        parnum=sizeof(ConfSysTimers)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->Apply();
                par++;
        }

//����������� �����

     ProcList((TMonSysPar*)&ConfSysPauses, sizeof(ConfSysPauses), opt_apply);
     ProcList((TMonSysPar*)&ConfSysTouts, sizeof(ConfSysTouts), opt_apply);
     ProcList((TMonSysPar*)&ConfSysErrs, sizeof(ConfSysErrs), opt_apply);
     ProcList((TMonSysPar*)&ConfSysSleeps, sizeof(ConfSysSleeps), opt_apply);

}

void TSysConfMaster::View(void)
{

//TODO: Add your source code here

//������� ��������� ����������
        TMonSysPar* par=NULL;
//������ ����������������� ����������
        int parnum=0;

//�������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysMain;
//����������������� ����������
        parnum=sizeof(ConfSysMain)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->View();
                par++;
        }

//����������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysAdd;
//����������������� ����������
        parnum=sizeof(ConfSysAdd)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->View();
                par++;
        }


//����������� �������

//������ ��������� �� ������
        par=(TMonSysPar*)&ConfSysTimers;
//����������������� ����������
        parnum=sizeof(ConfSysTimers)/sizeof(TMonSysPar);

        for (int i=0; i<parnum; i++)
        {
                par->View();
                par++;
        }

//����������� �����

     ProcList((TMonSysPar*)&ConfSysPauses, sizeof(ConfSysPauses), opt_view);
     ProcList((TMonSysPar*)&ConfSysTouts, sizeof(ConfSysTouts), opt_view);
     ProcList((TMonSysPar*)&ConfSysErrs, sizeof(ConfSysErrs), opt_view);
     ProcList((TMonSysPar*)&ConfSysSleeps, sizeof(ConfSysSleeps), opt_view);

}

void TSysConfMaster::ProcList(TMonSysPar* list, int len, list_opt opt)
{
        TMonSysPar* par=list;
        int n=len/sizeof(TMonSysPar);

        for (int i=0; i<n; i++)
        {

          switch (opt)
          {
             case opt_view:
                 par->View();
             break;

             case opt_apply:
                  par->Apply();
             break;

             case opt_save:
                  par->SaveToIniFile(this->gIniFile);
             break;

          }

          par++;
        }

}

void TSysConfMaster::ViewPort(void)
{
    ProcList((TMonSysPar*)&ConfSysPort, sizeof(ConfSysPort), opt_view);
}

void TSysConfMaster::ApplyPort(void)
{
    ProcList((TMonSysPar*)&ConfSysPort, sizeof(ConfSysPort), opt_apply);
}

void TSysConfMaster::SaveIniParPort(void)
{

     BackUp(0);

    SaveCompleteFlag=true;
    ProcList((TMonSysPar*)&ConfSysPort, sizeof(ConfSysPort), opt_save);
}


void TSysConfMaster::ViewSensor(void)
{
    ProcList((TMonSysPar*)&ConfSysSensor, sizeof(ConfSysSensor), opt_view);
}

void TSysConfMaster::ApplySensor(void)
{
    ProcList((TMonSysPar*)&ConfSysSensor, sizeof(ConfSysSensor), opt_apply);
}




void TSysConfMaster::SaveIniParSensor(void)
{

    BackUp(0);

    SaveCompleteFlag=true;
    ProcList((TMonSysPar*)&ConfSysSensor, sizeof(ConfSysSensor), opt_save);
}

/*
�������� ������ �� ���� ��� ����� ������ ��������� �����������
*/


/*

������������� �������� ����� �������/��������
*/

void TSysConfMaster::SensNumUpdate()
{
        //TODO: Add your source code here



}

void TSysConfMaster::SensorDelete(int port, int sensor)
{
        //TODO: Add your source code here

        AnsiString section("");
        AnsiString ident("");

        section.printf("Port%d",port);
 //����� �������� �� �����
        int snum=0;
 //������ ������� ������� �������� �� �����
        snum=this->gIniFile->ReadInteger(section,"NumOfSensors",0);

        if (snum==0)
        {
            MessageBox(NULL,"�� ������� ��������� ������ � ���������� ��������.","������!",0);
            return;
        }

//��������� ����� ������� �� �����   ���������� �� ���������� ������� ����
        int LNx=sensor;

//����� ������� �� �������
        int Nx=0;
        ident.printf("N%d",sensor);
        Nx=this->gIniFile->ReadInteger(section,ident,0);

/*
        for (int is=1; is<=snum; is++)
        {
             ident.printf("N%d",is);
             Nx=this->gIniFile->ReadInteger(section,ident,0);
             if (Nx==sensor)
             {
                LNx=is;
                break;
             }
        }
*/

        if (LNx==0)
        {
            MessageBox(NULL,"�� ������� ����� ������ � ������.","������!",0);
            return;
        }

//�������������� ����� �������� �� ������ �����

        this->gIniFile->WriteInteger(section,"NumOfSensors",snum-1);
        snum--;

//������� �� ��� ��� ������ ��� ��������� �������

//����������� ��� �������
        ident.printf("------------������ ��������� ����� %d---------------",LNx);
        this->gIniFile->DeleteKey(section,ident);

//��� �������
        ident.printf("Name%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

//���������� ����� � �������
        ident.printf("N%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

//�������
        ident.printf("On%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

//�������� ���������
        ident.printf("Accelon%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

//�����
        ident.printf("adr%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

//��� �������
        ident.printf("Name%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

//��������� �����
        ident.printf("Place%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

        ident.printf("SND3%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

//
        ident.printf("Xo%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

        ident.printf("Yo%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

        ident.printf("To%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

        ident.printf("InvY%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

        ident.printf("RotX%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

        ident.printf("SetData%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

        ident.printf("AdjData%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

        ident.printf("Note%d",LNx);
        this->gIniFile->DeleteKey(section,ident);

//������ �������� � ������������ ���������� ��������� �������� � �������

//����� ������ � �������
       int gNPorts=0;
       gNPorts=this->gIniFile->ReadInteger("Common","NumOfPorts",0);

        if (gNPorts==0)
        {
            MessageBox(NULL,"�� ������� ��������� ������ � ���������� ������ � � �������.","������!",0);
            return;
        }

//������� ����� �����
        int iport=port;
//������� ���������� ����� ������� � �������
        int gSensNumber=Nx;


//���������� ������ ���� �������� �� ����� ������ �� ������� �����

        AnsiString spar("");
        int ipar=0;

        for (int is=LNx+1; is<=snum+1; is++)
        {

          spar.printf("------------������ ��������� ����� %d---------------",is);
          this->gIniFile->DeleteKey(section,spar);


          spar.printf("------------������ ��������� ����� %d---------------",is-1);
          this->gIniFile->WriteString(section,spar,"");

//������ ��� ���������� �� ������ �������
           ident.printf("Name%d",is);
           spar=this->gIniFile->ReadString(section,ident,"");
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("Name%d",is-1);
           this->gIniFile->WriteString(section,ident,spar);


//������ ���������� ����� ���������� �� ������ �������
           ident.printf("N%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("N%d",is-1);
           this->gIniFile->WriteInteger(section,ident,gSensNumber);
//������� ������ ���������� ����� �������
           gSensNumber++;

//������ On ���������� �� ������ �������
           ident.printf("On%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("On%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);

//������ Accelon ���������� �� ������ �������
           ident.printf("Accelon%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("Accelon%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);


//������ ����� ���������� �� ������ �������
           ident.printf("adr%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("adr%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);



//������ ����������� ���������� �� ������ �������
           ident.printf("Place%d",is);
           spar=this->gIniFile->ReadString(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("Place%d",is-1);
           this->gIniFile->WriteString(section,ident,spar);


//������ ��������� ����� ���������� �� ������ �������
           ident.printf("SND3%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("SND3%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);


//������ Xo ���������� �� ������ �������
           ident.printf("Xo%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("Xo%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);

//������ Yo ���������� �� ������ �������
           ident.printf("Yo%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("Yo%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);

//������ Yo ���������� �� ������ �������
           ident.printf("To%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("To%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);


//������ InvY ���������� �� ������ �������
           ident.printf("InvY%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("InvY%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);


//������ RotX ���������� �� ������ �������
           ident.printf("RotX%d",is);
           ipar=this->gIniFile->ReadInteger(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("RotX%d",is-1);
           this->gIniFile->WriteInteger(section,ident,ipar);


//������ SetData ���������� �� ������ �������
           ident.printf("SetData%d",is);
           spar=this->gIniFile->ReadString(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("SetData%d",is-1);
           this->gIniFile->WriteString(section,ident,spar);

//������ AdjData ���������� �� ������ �������
           ident.printf("AdjData%d",is);
           spar=this->gIniFile->ReadString(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("AdjData%d",is-1);
           this->gIniFile->WriteString(section,ident,spar);


//������ Note ���������� �� ������ �������
           ident.printf("Note%d",is);
           spar=this->gIniFile->ReadString(section,ident,0);
//������� ������ � ������ ������� �� �����
           this->gIniFile->DeleteKey(section,ident);
//������� ������ ������������������ � ������� �� �����
           ident.printf("Note%d",is-1);
           this->gIniFile->WriteString(section,ident,spar);

        }

//������ ������ ���� ����� ��� ���� ������������ ������ �������

        for (int iport=port+1; iport<=gNPorts; iport++)
        {

               section.printf("Port%d",iport);
//� ����� ������� ��� ������� ������� �����
//������� ������� �������� �� �����
                snum=this->gIniFile->ReadInteger(section,"NumOfSensors",0);
//��� ��� ������� �� ��������� ���������� ���������� ������ ��� ���� ��� ���������
                for (int is=1; is<=snum; is++)
                {
//�� ���� ������ ������ ���������� ���������� ����� �������
                        ident.printf("N%d",is);
                        this->gIniFile->WriteInteger(section,ident,gSensNumber);
//������� ���������� ����� ������� � �������
                        gSensNumber++;

                }

        }

        //ShowMessage("��� ���������� � ���� ��������� ������������ ������������� ���������!");
        //Exit(0);

        this->SaveCompleteFlag=true;
        HotRestart();

}

void TSysConfMaster::SensorAdd(int port, TCOMPort* cport)
{
        //TODO: Add your source code here

//����� �������� �� �����
        int nsens=0;
        AnsiString section("");
        AnsiString ident("");
        section.printf("Port%d",port);
//�������� ����� �������� �� �����
        nsens=this->gIniFile->ReadInteger(section, "NumOfSensors", 0);
//���������� ����� ������ ������� �� �����
        int insens=nsens+1;

//���������� ����� ���������� ������� �� �����
        int gnum=0;
        ident.printf("N%d",nsens);
        gnum=this->gIniFile->ReadInteger(section,ident,0);

        char msg[1024];
        sprintf(msg,"�� ������������� ������ �������� � ������� ������ �� ���� �%d",port);
        if (MessageBox(NULL,msg,"��������!",1)!=IDOK) return;


        int sempty=0;

        if (gnum==0)
        {
             //��� ������ ������ - �� ����� ��� ������� �������

             sempty=1;

             if (port==1)
             {
                gnum=0;
             }
             else
             {

               int pr=port-1;

               while (1)
               {

                        AnsiString sect("");
                        sect.printf("Port%d",port-1);
                        gnum=this->gIniFile->ReadInteger(sect,"NumOfSensors",1);

                        if (gnum==0)
                        {
                            if (port>1)
                            {
                               port--;
                               continue;
                            }
                            else
                            {
                                gnum=0;
                                break;
                            }
                        }

                        AnsiString id("");
                        id.printf("N%d",gnum);
                        gnum=this->gIniFile->ReadInteger(sect,id,1);
                        break;

                }


             }


             //!!!
        }

       TBTSensor* sens=new TBTSensor;

       if (cport->Protocol211==NULL)
       {
           sens->Name="��-�3";
           sens->on=true;
           sens->isAccel=true;
       }
       else                             sens->Name="��-�3";

       sens->N=gnum;
       sens->T0=0;
       sens->X0=0;
       sens->Y0=0;
       sens->RotX=0;
       sens->InvY=0;

//��������� � ��� ���� ������ � ����� �������

/*
Name9=IN-D3 No16 (����������� (��-�3,BS4I1-03,TMP05))
N9=20
On9=1
adr9=23
SND39=5620
Xo9=0
Yo9=0
To9=0
InvY9=0
RotX9=0
SetData9=
AdjData9=
Note9=����� 4
*/

//�������������� ����� �������� �� �����

            this->gIniFile->WriteInteger(section, "NumOfSensors", insens);



ident.printf("------------������ ��������� ����� %d---------------",insens);
this->gIniFile->WriteString(section,ident,"");

//��� ������� - �����������
            ident.printf("Name%d",insens);
            this->gIniFile->WriteString(section,ident,sens->Name);
//���������� ����� � �������
            ident.printf("N%d",insens);
            this->gIniFile->WriteInteger(section,ident,sens->N+1);

//������� �� ��������� 1
            sens->on=1;
            ident.printf("On%d",insens);
            this->gIniFile->WriteInteger(section,ident,sens->on);


//��������� ��������� �� ��������� 1
            sens->isAccel=1;
            ident.printf("AccelOn%d",insens);
            this->gIniFile->WriteInteger(section,ident,sens->isAccel);


//����� �� ��������� 255
            sens->adr=255;
            ident.printf("adr%d",insens);
            this->gIniFile->WriteInteger(section,ident,sens->adr);


            sens->Place="������������ �� �������";
            ident.printf("Place%d",insens);
            this->gIniFile->WriteString(section,ident,sens->Place);

//���������� ����� �� ��������� 2018

            sens->SND3=2018;
            ident.printf("SND3%d",insens);
            this->gIniFile->WriteInteger(section,ident,sens->SND3);
//Xo
            ident.printf("Xo%d",insens);
            this->gIniFile->WriteInteger(section,ident,0);

            ident.printf("Yo%d",insens);
            this->gIniFile->WriteInteger(section,ident,0);

            ident.printf("To%d",insens);
            this->gIniFile->WriteInteger(section,ident,0);

            ident.printf("InvY%d",insens);
            this->gIniFile->WriteInteger(section,ident,0);

            ident.printf("RotX%d",insens);
            this->gIniFile->WriteInteger(section,ident,0);

            ident.printf("SetData%d",insens);
            this->gIniFile->WriteString(section,ident,"��� ������");

            ident.printf("AdjData%d",insens);
            this->gIniFile->WriteString(section,ident,"��� ������");

            ident.printf("Note%d",insens);
            this->gIniFile->WriteString(section,ident,"��� ������");


/*
             Form_SENSOR_Tune->comport=cport;
             Form_SENSOR_Tune->sensor=sens;
             Form_SENSOR_Tune->master=this;
             //Form_SENSOR_Tune->nSensSelected=&nSensSelected;
             //Form_SENSOR_Tune->nPortSelected=&nPortSelected;

             Form_SENSOR_Tune->ShowModal();
*/

//������������� ����������� ������ ���� ����������� ������-��������

        int gNPorts=0;
        gNPorts=this->gIniFile->ReadInteger("Common","NumOfPorts",0);
        int gSensNumber=sens->N+1+1;
        int snum=0;

        for (int iport=port+1; iport<=gNPorts; iport++)
        {

               section.printf("Port%d",iport);
//� ����� ������� ��� ������� ������� �����
//������� ������� �������� �� �����
                snum=this->gIniFile->ReadInteger(section,"NumOfSensors",0);
//��� ��� ������� �� ��������� ���������� ���������� ������ ��� ���� ��� ���������
                for (int is=1; is<=snum; is++)
                {
//�� ���� ������ ������ ���������� ���������� ����� �������
                        ident.printf("N%d",is);
                        this->gIniFile->WriteInteger(section,ident,gSensNumber);
//������� ���������� ����� ������� � �������
                        gSensNumber++;

                }

        }

//��������� ���� ��� ��������� ������ �������

             TComboBox* combo=NULL;
             TCheckBox* check=NULL;
             TEdit* editpar=NULL;

             AnsiString s("");
             AnsiString ss("");
             AnsiString spar("");

             //����� ������� �� �����
             int nSensorOnPort=insens;

             //���������� ����� ����������� �������
             int nSensSelected=sens->N+1;
             //����� ����������� ����
             int nPortSelected=port;
             //��������� �� ���������� ����
             Form_SENSOR_Tune->comport=cport;
             //��������� �� ��������� ������
             Form_SENSOR_Tune->sensor=sens;
             Form_SENSOR_Tune->master=this;

             TBTSensor* sSensSelected=sens;

             Form_SENSOR_Tune->nSensSelected=&nSensSelected;
             Form_SENSOR_Tune->nPortSelected=&nPortSelected;

             s.printf("PORT%d",nPortSelected);

             //ss.printf("Name%d",nSensSelected);
             ss.printf("Name%d",nSensorOnPort);

             spar=sens->Name;
             combo=Form_SENSOR_Tune->ComboBox_name;
             this->ConfSysSensor.Namex.Init(INIPAR_STRIDX,s,ss,spar,NULL,(TComboBox*)combo);

             spar.printf("%d",sens->N+1);
             ss.printf("N%d",nSensorOnPort);
             combo=Form_SENSOR_Tune->ComboBox_gnum;
             this->ConfSysSensor.Nx.Init(INIPAR_INTIDX,s,ss,spar,NULL,(TComboBox*)combo);

//�������
             ss.printf("On%d",nSensorOnPort);
             if (sens->on) spar.printf("1"); else spar.printf("0");
             check=Form_SENSOR_Tune->CheckBox_on;
             this->ConfSysSensor.Onx.Init(INIPAR_BOOL,s,ss,spar,NULL,(TCheckBox*)check);

//��������� ���������
             ss.printf("AccelOn%d",nSensorOnPort);
             if (sens->isAccel) spar.printf("1"); else spar.printf("0");
             check=Form_SENSOR_Tune->CheckBox_accelOn;
             this->ConfSysSensor.AccelOnx.Init(INIPAR_BOOL,s,ss,spar,NULL,(TCheckBox*)check);


             spar.printf("%d",sens->adr);
             ss.printf("adr%d",nSensorOnPort);
             combo=Form_SENSOR_Tune->ComboBox_adr;
             this->ConfSysSensor.adrx.Init(INIPAR_INTIDX,s,ss,spar,NULL,(TComboBox*)combo);

//---

             spar.printf("%s","������������ �� �������");
             ss.printf("Place%d",nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_place;
             this->ConfSysSensor.Placex.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",sSensSelected->SND3);
             ss.printf("SND3%d",nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_snd3;
             this->ConfSysSensor.SND3x.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",(int)sSensSelected->X0);
             ss.printf("Xo%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_xo;
             this->ConfSysSensor.Xox.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",(int)sSensSelected->Y0);
             ss.printf("Yo%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_yo;
             this->ConfSysSensor.Yox.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",(int)sSensSelected->T0);
             ss.printf("To%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_to;
             this->ConfSysSensor.Tox.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%d",(int)sSensSelected->InvY);
             ss.printf("InvY%d",(int)nSensorOnPort);
             check=Form_SENSOR_Tune->CheckBox_invy;
             this->ConfSysSensor.InvYx.Init(INIPAR_BOOL,s,ss,spar,NULL,(TCheckBox*)check);

             spar.printf("%d",(int)sSensSelected->RotX);
             if (spar=="(null)") spar="";
             ss.printf("RotX%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_rotx;
             this->ConfSysSensor.RotXx.Init(INIPAR_INT,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%s",sSensSelected->SetData);
             ss.printf("SetData%d",(int)nSensorOnPort);
             if (spar=="(null)") spar="";
             editpar=Form_SENSOR_Tune->Edit_setdata;
             this->ConfSysSensor.SetDatax.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%s",sSensSelected->AdjData);
             if (spar=="(null)") spar="";
             ss.printf("AdjData%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_adjdata;
             this->ConfSysSensor.AdjDatax.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);

             spar.printf("%s",sSensSelected->Note);
             if (spar=="(null)") spar="";
             ss.printf("Note%d",(int)nSensorOnPort);
             editpar=Form_SENSOR_Tune->Edit_note;
             this->ConfSysSensor.Notex.Init(INIPAR_STRING,s,ss,spar,NULL,(TEdit*)editpar);


             if (sempty==1)      Form_SENSOR_Tune->m_ListEmpty=1;
             else                Form_SENSOR_Tune->m_ListEmpty=0;

             Form_SENSOR_Tune->SetViewTimer();
             Form_SENSOR_Tune->fCreate=true;
             Form_SENSOR_Tune->ShowModal();

             //ShowMessage("��� ���������� ��������� � ���� ������������� ���������!");
              SaveCompleteFlag=true;
              HotRestart();

       return;

}

void TSysConfMaster::PortDelete(int port)
{
        //TODO: Add your source code here

    AnsiString section("");
    AnsiString ident("");
    char msg[1024];
    sprintf(msg,"���� %d � ��� ������� �� ������ ����� ����� ������� �� ������������ �������! ����������?", port);

    if (MessageBox(NULL,msg, "��������!",1)!=IDOK) return;

//���������� ����� ���������� ������� �� ���������� �����

    int gNumOfSensor=0;
    int currport=port;

 //������� �������� �� ���������� �����
    int nsensors=0;

 //������� �������� �� ���������� �����
//     if (port>1)
    while(currport>=0)
    {
        if (currport==0)
        {
              break;
        }
//������� �������� �� ���������� �����
        section.printf("Port%d",port-1);
        nsensors=this->gIniFile->ReadInteger(section,"NumOfSensors",0);

                if (nsensors==0)
                {
                   //ShowMessage("������ ������ ���������!");
                   //return;
                   currport--;

                   if (currport==0)
                   {
                        break;
                   }
                   else
                   {
                        continue;
                   }
                }

        ident.printf("N%d",nsensors);
        gNumOfSensor=this->gIniFile->ReadInteger(section,ident,0);

                if (gNumOfSensor==0)
                {
                   //ShowMessage("������ ������ ���������!");
                   return;
                }

      currport--;

    }


    //else
    //{
    //    return;
    //}

    int gports=0;
//������ ������� ������ � �������
    gports=this->gIniFile->ReadInteger("Common","NumOfPorts",0);

    if (gports==0)
    {
        ShowMessage("������ ������ ����� ������ � �������!");
        return;
    }

//�������������� ����� ������ � �������
    this->gIniFile->WriteInteger("Common","NumOfPorts",gports-1);
    section.printf("Port%d",port);
//������� ������ ���������� �����
    this->gIniFile->EraseSection(section);

//������ �������������� ��� ������� �� ����� ����������� ������

//������� ����� ����� ��� ������ ������
     int nPortToAdd=port;
//������� ����� ����� ��� ������������ �������� ������
     int nPortToDel=port+1;

 AnsiString CurPort("");
 AnsiString NextPort("");
 TBTSensor* sens=new TBTSensor;

 int NumOfSensors=0;
 AnsiString PortName("");
 int ComPort=1;
 int BaudRate;
 int on=1;

     for (int i=port; i<gports; i++)
     {

//������� ����� ����� ��� ������ ������
        nPortToAdd=i;
//������� ����� ����� ��� ������������ �������� ������
        nPortToDel=i+1;
        CurPort.printf("Port%d",nPortToAdd);
        NextPort.printf("Port%d",nPortToDel);
//����� �������� �� ��������� �����
         NumOfSensors=this->gIniFile->ReadInteger(NextPort,"NumOfSensors",0);
//������ ��������� ���������� �� ������ �����
         PortName=this->gIniFile->ReadString(NextPort,"Name","");
         ComPort=this->gIniFile->ReadInteger(NextPort,"Num",0);
         BaudRate=this->gIniFile->ReadInteger(NextPort,"BaudRate",0);
         on=this->gIniFile->ReadInteger(NextPort,"on",0);
         NumOfSensors=this->gIniFile->ReadInteger(NextPort,"NumOfSensors",0);


         this->gIniFile->WriteString(CurPort,"Name",PortName);
         this->gIniFile->WriteInteger(CurPort,"Num",ComPort);
         this->gIniFile->WriteInteger(CurPort,"BaudRate",BaudRate);
         this->gIniFile->WriteInteger(CurPort,"on",on);
         this->gIniFile->WriteInteger(CurPort,"NumOfSensors",NumOfSensors);



//����� �������� �� �����
         int nSensorsOnPort=this->gIniFile->ReadInteger(NextPort,"NumOfSensors",0);

         if (nSensorsOnPort==0)
         {

         }
         else
         {

                 for (int j=1; j<=nSensorsOnPort; j++)
                 {
                        //������v ������ �� ���������� �� ������ �����
                    ident.printf("Name%d",j);
                    sens->Name=this->gIniFile->ReadString(NextPort,ident,"Name");

                    ident.printf("N%d",j);
                    sens->N=this->gIniFile->ReadInteger(NextPort,ident,0);
                    //���������� ����� ������ ����� ������
                    gNumOfSensor++;
                    sens->N=gNumOfSensor;

                    ident.printf("SND3%d",j);
                    sens->SND3=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("On%d",j);
                    sens->on=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("AccelOn%d",j);
                    sens->isAccel=this->gIniFile->ReadInteger(NextPort,ident,0);

//            ident.printf("On%d",j);
//            sens->on=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("adr%d",j);
                    sens->adr=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("Xo%d",j);
                    sens->X0=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("Yo%d",j);
                    sens->Y0=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("To%d",j);
                    sens->T0=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("InvY%d",j);
                    sens->InvY=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("RotX%d",j);
                    sens->RotX=this->gIniFile->ReadInteger(NextPort,ident,0);

                    ident.printf("SetData%d",j);
                    sens->SetData=this->gIniFile->ReadString(NextPort,ident,"��� ������");

                    ident.printf("AdjData%d",j);
                    sens->AdjData=this->gIniFile->ReadString(NextPort,ident,"��� ������");

                    ident.printf("Note%d",j);
                    sens->Note=this->gIniFile->ReadString(NextPort,ident,"��� ������");

 //����� ������ �� ������� � ������� ������

                    ident.printf("------------������ ��������� ����� %d---------------",j);
                    this->gIniFile->WriteString(CurPort,ident,"");

                    ident.printf("Name%d",j);
                    this->gIniFile->WriteString(CurPort,ident,sens->Name);

                    ident.printf("N%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->N);

                    ident.printf("SND3%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->SND3);

                    ident.printf("On%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->on);

//��������� ���������

                    ident.printf("AccelOn%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->isAccel);


                    ident.printf("adr%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->adr);

                    ident.printf("Xo%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->X0);

                    ident.printf("Yo%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->Y0);

                    ident.printf("To%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->T0);

                    ident.printf("InvY%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->InvY);

                    ident.printf("RotX%d",j);
                    this->gIniFile->WriteInteger(CurPort,ident,sens->RotX);

                    ident.printf("SetData%d",j);
                    this->gIniFile->WriteString(CurPort,ident,sens->SetData);

                    ident.printf("AdjData%d",j);
                    this->gIniFile->WriteString(CurPort,ident,sens->AdjData);

                    ident.printf("Note%d",j);
                    this->gIniFile->WriteString(CurPort,ident,sens->Note);

                    this->SaveCompleteFlag=true;

         }

//������ ������� ������ ������������� ����� �� ������ �����

         this->gIniFile->EraseSection(NextPort);

         }

         /*
         this->gIniFile->WriteString(CurPort,"Name",PortName);
         this->gIniFile->WriteInteger(CurPort,"Num",ComPort);
         this->gIniFile->WriteInteger(CurPort,"BaudRate",BaudRate);
         this->gIniFile->WriteInteger(CurPort,"on",on);
         this->gIniFile->WriteInteger(CurPort,"NumOfSensors",NumOfSensors);
         */


      }



//      TStrings* sData=new TStringList();
//      this->gIniFile->ReadSection(section,sData);

        //ShowMessage("��� ���������� ��������� � ���� ������������� ���������!");

        this->SaveCompleteFlag=true;

        HotRestart();

      return;

}

void TSysConfMaster::PortAdd()
{
        //TODO: Add your source code here
        int NumOfPorts=0;
        NumOfPorts=this->gIniFile->ReadInteger("Common","NumOfPorts",0);

        AnsiString section;
        section.printf("Port%d",NumOfPorts+1);
        char msg[1024];
        sprintf(msg,"�� ������������� ������ �������� � ������� ���� �%d",NumOfPorts+1);

        if (MessageBox(NULL,msg,"��������!",1)!=IDOK) return;

        this->gIniFile->WriteString(section,"Name","����� ����");
        this->gIniFile->WriteInteger(section,"Num",1);
        this->gIniFile->WriteInteger(section,"BaudRate",115200);
        this->gIniFile->WriteInteger(section,"NumOfSensors",0);
        this->gIniFile->WriteInteger(section,"On",0);

        this->gIniFile->WriteInteger("Common","NumOfPorts",NumOfPorts+1);

//��������� ����� ��� ��������������

             TCOMPort* cPortSelected=new TCOMPort;

             Form_PORT_Tune->comport=cPortSelected;
             Form_PORT_Tune->master=this;

             int nPortSelected=NumOfPorts+1;

             AnsiString s("");

             s.printf("PORT%d",nPortSelected);

             AnsiString spar("����� ����");

             //spar=BTPrs.Ps[nPortSelected-1].Name;

             TComboBox* combo=Form_PORT_Tune->ComboBox_name;
             this->ConfSysPort.Name.Init(INIPAR_STRIDX,s,"Name",spar,NULL,(TComboBox*)combo);

             spar.printf("%d",115200);

             combo=Form_PORT_Tune->ComboBox_baud;
             this->ConfSysPort.BaudRate.Init(INIPAR_INTIDX,s,"BaudRate",spar,NULL,(TComboBox*)combo);

             spar.printf("%d",1);

             combo=Form_PORT_Tune->ComboBox_com;
             this->ConfSysPort.Num.Init(INIPAR_INTIDX,s,"Num",spar,NULL,(TComboBox*)combo);

             //if (BTPrs.Ps[nPortSelected-1].on) spar="1"; else
             spar="0";
             TCheckBox* check=Form_PORT_Tune->CheckBox_on;
             this->ConfSysPort.On.Init(INIPAR_BOOL,s,"On",spar,NULL,(TCheckBox*)check);

             spar.printf("%d",0);

             combo=Form_PORT_Tune->ComboBox_sensors_num;
             this->ConfSysPort.NumOfSensors.Init(INIPAR_INTIDX,s,"NumOfSensors",spar,NULL,(TComboBox*)combo);

             Form_PORT_Tune->nPortSelected=&nPortSelected;
             Form_PORT_Tune->SetViewTimer();
             Form_PORT_Tune->fCreate=true;
             Form_PORT_Tune->ShowModal();

        //ShowMessage("��� ���������� ��������� � ���� ������������� ���������!");

        SaveCompleteFlag=true;
        HotRestart();

}

int TSysConfMaster::BackUp(int par)
{
        //TODO: Add your source code here

        FILE* r;
        FILE* w;

        char cr[1024];
        char cw[1024];

        if (par==0)
        {
           sprintf(cr,"%s",this->gIniFilePath);
           sprintf(cw,"%s",this->bakIniFilePath);
        }
        else
        {
           sprintf(cw,"%s",this->gIniFilePath);
           sprintf(cr,"%s",this->bakIniFilePath);
        }

        r=fopen(cr,"rb");

        if (par==1)
        {
                if (r==NULL)
                {
                        ShowMessage("��� ������ � ���������� ���������");
                        return 0        ;
                }
        }

        w=fopen(cw,"wb");

        if ((r==0)||(w==0))
        {
                fclose(r);
                fclose(w);
                //ShowMessage("������ ����������������� �����!");
                return 0;
        }


        BYTE b;

        while (fread(&b,1,1,r))
        {
         fwrite (&b,1,1,w);
        }

        if (par==1) HotRestart();


        fclose(r);
        fclose(w);

        if (par==0)         BackUpMenuItem->Enabled=true;

        return 1;
}

void TSysConfMaster::CheckBackUp()
{
        //TODO: Add your source code here

        char cr[1024];
        FILE* r;

        sprintf(cr,"%s",bakIniFilePath);

        if ((r=fopen(cr,"rb"))==NULL)           BackUpMenuItem->Enabled=false;
        else                                    BackUpMenuItem->Enabled=true;

        fclose(r);


}
