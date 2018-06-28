//---------------------------------------------------------------------------
struct { int Num;int A[100];int ID[100];} D3List;
//---------------------------------------------------------------------------
DWORD GetVolumeSN(AnsiString sPuth)
{
  char VolumeName[255], FileSystemName[100];
  unsigned long VolumeSerialNo, MaxComponentLength, FileSystemFlags;
  //AnsiString Ts;
  GetVolumeInformation(sPuth.c_str(),VolumeName,255,&VolumeSerialNo,&MaxComponentLength, &FileSystemFlags,FileSystemName, 100);
  //Ts=IntToHex((int)VolumeSerialNo,8);
  return (DWORD)VolumeSerialNo;
}
//---------------------------------------------------------------------------
void TFMain::INI(bool read)
{

  this->SysConfMaster.BackUpMenuItem=this->N_backup;

  this->SysConfMaster.CheckBackUp();

  gIniFile=NULL;

  AnsiString s;DWORD sn,sc,sd;

//  TIniFile *ini=new TIniFile(ChangeFileExt(Application->ExeName,".ini"));

  TIniFile *ini=new TIniFile(this->SysConfMaster.gIniFilePath);

  if(read)
  {

 //���������� ��������� �� ��� ���� - ������������ ��� ���������� ���������� �������
     gIniFile=ini;

//������� ������������ ��������� �� ����������� ��� ����
     this->SysConfMaster.gIniFile=ini;

    // !!! Gorizont
    AnsiString stmp=ChangeFileExt(ExtractFileName(Application->ExeName),"");

//    if(TRIAL)
//     Caption=ini->ReadString("Common","Caption",stmp+" (������: �� ������ ���� "+stmp+".ini)")+" (Trial)";
//    else
     //Caption=ini->ReadString("Common","Caption",stmp+" (������: �� ������ ���� "+stmp+".ini)");

//�� �������� ��� ������ ��������� �������� ���� ���������
    Caption=ini->ReadString("Common","Caption",stmp+" (������� ����� ������� "+stmp+".ini)");
//�������������� ��������� ��� ����������� ��� ��������� ���������� �������
    CCaption=Caption;
//��������� � ������� ����
    Caption=Caption+" [";
    Caption=Caption+this->SysConfMaster.gIniFilePath;
    Caption=Caption+"]";

    //Caption=ini->ReadString("Common","Caption","������: �� ������ ���� "+ChangeFileExt(ExtractFileName(Application->ExeName),".ini"));

    //Caption=ini->ReadString("Common","Caption","������: �� ������ ���� BS4I1Server.ini");

    //??? BTPorts - ��� "����" ��� ������ �� ������ BT
    BTPrs.Name=ini->ReadString("Common","Name","����� �������");
    //BTPrs.Name=ini->ReadString("Common","Name","BS4I1 ������");if(BTPrs.Name=="") BTPrs.Name="BS4I1 ������";
    Server1->Port=ini->ReadInteger("Common","IPPort1",502);
    Server2->Port=ini->ReadInteger("Common","IPPort2",503);

    TSTest->TabVisible=ini->ReadBool("Common","ShowAdvanced",false);
    TSTest->TabVisible=!SERVER_SECURITY;    //??? ��������� ����������

//���������� ��� ������ � ������� (�������)
    int NPrs=ini->ReadInteger("Common","NumOfPorts",0);

//��������� ���������� ��������� � ������ ������� � ������
    fCanclose=ini->ReadBool("Common","CanClose",true);

//�� �������� ���� �������������� ��� �������� ���������
    fOpenHid=ini->ReadBool("Common","CanHide",false); // gluk 4

//���������� ��������� �������, ������������ �� ������� ���������
    CanSave=ini->ReadBool("Common","CanSave",true);

//������ ������ �� ���������� � ��������� ����
    SaveAccTxt=ini->ReadBool("Common","SaveAccTxt",false);

//------------------------------------------------------------------------------

//��������� OPC DA ����������
    CanOPCDA=ini->ReadBool("Common","CanOPCDA",false);

//��������� Modbus ����������
    CanModbus=ini->ReadBool("Common","CanModbus",true);

//!!!
//� ������  ������ OPC ������������� ���������

    CanOPCDA=false;

//------------------------------------------------------------------------------

//����������� �������������� ���������� � ��������� �������
    CBStat->Checked=ini->ReadBool("Common","CanInfo",false);

// ���������� ��������� �������, ������������ �� ������� ���������
    MEMO_COUNT=ini->ReadInteger("Common","MemoCount",60);

//���������� ������� �� ������� ���������, ������� ��������� ����� ������������
    MEMO_DEL=ini->ReadInteger("Common","MemoDel",1);

// ������ � ������� ������������ ������ �������������. ������ ����� �������� ��������� ��������� �� ���� ������� X � Y
    SrsBufPSize=ini->ReadInteger("Common","SrsBufSize",8192);

// ��������, � ������� �������� �������� ���������� ��������� ��������� N, ������� ������������ � ��������� ����, ��� N = SrsBufSize*32*SrsBufToSave
    SrsBufToSave=ini->ReadInteger("Common","SrsBufToSave",1);

// �������� ����� ����� ���������
    s=ini->ReadString("Common","SerialNumber","");

//�������� ����� ����� �
    sn=(DWORD)s.ToIntDef(0);sc=GetVolumeSN("C:\\");sd=GetVolumeSN("d:\\");

    if(SERVER_SECURITY) SERVER_SECURITY=(sn!=(((sc+sd)&0xFFFFFFF)^0x1234567));


//����� ������ � �������
    if(NPrs>MaxNumPrs) NPrs=MaxNumPrs;

//����� �������� �� ����� �����
    int NSrs=0;

    for(int i=0;i<NPrs;i++)
    {

//������ ����� ��� ����� ��� ������ ������
//??? ���� � ������ ������� ������������
      int p=ini->ReadInteger((s="Port")+(i+1),"Num",1)-1;

//������ ��������
      DWORD BaudRate=ini->ReadInteger((s="Port")+(i+1),"BaudRate",115200);

//������ �����������, ��� ������� � ���������
      BTPrs.Ps[i].Name=ini->ReadString((s="Port")+(i+1),"Name","����������� ���-����");
      if(BTPrs.Ps[i].Name=="") BTPrs.Ps[i].Name=(s="COM")+(p+1);
      BTPrs.Add(p,BaudRate);

//������� ������� �� � �����
      bool run=ini->ReadBool((s="Port")+(i+1),"On",false);

//����� ��������
      BTPrs.Ps[i].NumPSrs=ini->ReadInteger((s="Port")+(i+1),"NumOfSensors",0);

//������ ���� �� ������� �������
      for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++)
      {
//����������� ����� �������� � �������
        if(TRIAL) {if(NSrs==TrialSrs) { BTPrs.Ps[i].NumPSrs=j;break;}}
        else      {if(NSrs==MaxNumSrs) { BTPrs.Ps[i].NumPSrs=j;break;}}

//???��� � ������� �������� ���������� ����� ������� � �������???
        int N=ini->ReadInteger((s="Port")+(i+1),(s="N")+(j+1),j+1)-1;
//��� ��� ������ �������� �� ����� ��������� ��������� �������� ������+����� ������� � �������

        BTPrs.Ps[i].Srs[j]=BTSrs+N;

//???� ��� �������� � ��� ��� ����� �� ������ � ������� �������������
        BTPrs.Ps[i].Srs[j]->N=N;

//��� �������
        BTPrs.Ps[i].Srs[j]->Name=ini->ReadString((s="Port")+(i+1),(s="Name")+(j+1),"��-�3");

//��� ������� ���� ��� ������� �� �������� ����, ��� ��-�3
        if ( strstr (BTPrs.Ps[i].Srs[j]->Name.c_str(), "IN-D3")||(strstr (BTPrs.Ps[i].Srs[j]->Name.c_str(), "��-�3")))  //=="����������� (��-�3,BS4I1-03,TMP05)")
        {
             if (j==0)
             {
//��������� ���������� ����� ��������� ��-�3 (��� ������������ ������� �� ������ �������)
                  BTPrs.Ps[i].CPrt->CreateProtocol211();
             }
        }

        if(BTPrs.Ps[i].Srs[j]->Name=="") BTPrs.Ps[i].Srs[j]->Name=(s="������ ")+(N+1);

        // 1.0.2 �����
        BTPrs.Ps[i].Srs[j]->isMeteo=BTPrs.Ps[i].Srs[j]->Name.Pos("�����")>0;        // ���������� ������������
        BTPrs.Ps[i].Srs[j]->isBS=   BTPrs.Ps[i].Srs[j]->Name.Pos("BS4I1-04")>0;     // ���� ����������
        BTPrs.Ps[i].Srs[j]->isTermo=BTPrs.Ps[i].Srs[j]->Name.Pos("��������")>0;     // ��������� �����������
        BTPrs.Ps[i].Srs[j]->isTMP05=BTPrs.Ps[i].Srs[j]->Name.Pos("TMP05")>0;        // ��������� ������ �����������

//�� ��������� ��������� ��������

        //BTPrs.Ps[i].Srs[j]->isAccel=BTPrs.Ps[i].Srs[j]->Name.Pos("���������")>0;    // ��������� ������������

        BTPrs.Ps[i].Srs[j]->isAccel=ini->ReadBool((s="Port")+(i+1),(s="AccelOn")+(j+1),true)||BTPrs.Ps[i].Srs[j]->Name.Pos("���������")>0;

        BTPrs.Ps[i].Srs[j]->isHoriz=BTPrs.Ps[i].Srs[j]->Name.Pos("�����. ����.")>0; // ��������� �������������� ����������

        BTPrs.Ps[i].Srs[j]->isInd3_211=BTPrs.Ps[i].Srs[j]->Name.Pos("IN-D3")>0;     // ������ ��-�3 �������� 2.11
        BTPrs.Ps[i].Srs[j]->isInd3_211=BTPrs.Ps[i].Srs[j]->Name.Pos("��-�3")>0;     // ������ ��-�3 �������� 2.11


        BTPrs.Ps[i].Srs[j]->on=ini->ReadBool((s="Port")+(i+1),(s="On")+(j+1),false);

//??? ��� - ������� ��������� ��� ����� � ����� �� ���������?        
        BTPrs.Ps[i].Srs[j]->adr=ini->ReadInteger((s="Port")+(i+1),(s="adr")+(j+1),1);

//������ - ���� ����� �������� � 2.11 ��������������� � ����� ������� � ������ ��������� 2.11

        if (BTPrs.Ps[i].CPrt->Protocol211)
        {
             BTPrs.Ps[i].CPrt->AddIND3Sensor(BTPrs.Ps[i].Srs[j]->adr);
        }


        BTPrs.Ps[i].Srs[j]->SND3=ini->ReadInteger((s="Port")+(i+1),(s="SND3")+(j+1),1);

        BTPrs.Ps[i].Srs[j]->X0=ini->ReadFloat((s="Port")+(i+1),(s="Xo")+(j+1),0.0);
        BTPrs.Ps[i].Srs[j]->Y0=ini->ReadFloat((s="Port")+(i+1),(s="Yo")+(j+1),0.0);
        BTPrs.Ps[i].Srs[j]->T0=ini->ReadFloat((s="Port")+(i+1),(s="To")+(j+1),0.0);
        BTPrs.Ps[i].Srs[j]->InvY=ini->ReadBool((s="Port")+(i+1), (s="InvY")+(j+1),false);
        BTPrs.Ps[i].Srs[j]->RotX=ini->ReadFloat((s="Port")+(i+1),(s="RotX")+(j+1),0.0);
        BTPrs.Ps[i].Srs[j]->Tm_Start=BTPrs.Ps[i].Srs[j]->Tm_Stop=CoreTime();
        BTPrs.Ps[i].Srs[j]->SetData=ini->ReadString((s="Port")+(i+1),(s="SetData")+(j+1),"23.03.12");
        BTPrs.Ps[i].Srs[j]->AdjData=ini->ReadString((s="Port")+(i+1),(s="AdjData")+(j+1),"23.03.12");
        BTPrs.Ps[i].Srs[j]->Note=ini->ReadString((s="Port")+(i+1),(s="Note")+(j+1),"��������� � �����������");
        BTPrs.Ps[i].Srs[j]->Place=ini->ReadString((s="Port")+(i+1),(s="Place")+(j+1),"������������ �� �������");
        BTPrs.Ps[i].Srs[j]->SBuf.InitBuf(true);
        if(BTPrs.Ps[i].Srs[j]->isMeteo) BTPrs.Ps[i].Srs[j]->SWBuf.InitBuf(true);


        NSrs++;

      }

      if(run) BTPrs.Run(i);
    }


    TmUpdate->Interval=ini->ReadInteger("Timers","TmUpdateInt",100);
    TmRun->Interval=ini->ReadInteger("Timers","TmRun",1000);ETmRun->Text=TmRun->Interval;
    TmStart->Interval=ini->ReadInteger("Timers","TmStart",1000);
//    TmSave->Interval=ini->ReadInteger("Timers","TmSave",60000);ETmSave->Text=TmSave->Interval;

    TmSave->Interval=ini->ReadInteger("Timers","TmSave",1000);ETmSave->Text=TmSave->Interval;

    PPauseTick= ini->ReadInteger("Pauses","PPauseTick",100);TmHideExit->Interval=PPauseTick;
    PReOpen=    ini->ReadInteger("Pauses","PReOpen",5000);
    PClose=     ini->ReadInteger("Pauses","PClose",5000);
    PExit=      ini->ReadInteger("Pauses","PExit",1000);

    //PExit=      ini->ReadInteger("Pauses","PExit",10000);
    SAdrChange= ini->ReadInteger("Sleeps","SAdrChange",16);
    SIdle=      ini->ReadInteger("Sleeps","SIdle",1);
    SRError=    ini->ReadInteger("Sleeps","SRError",0);
    SCRCError=  ini->ReadInteger("Sleeps","SCRCError",600);

    TORCom=     ini->ReadInteger("TimeOuts","TORCom",200);
    TOWCom=     ini->ReadInteger("TimeOuts","TOWCom",100);
    TORDat=     ini->ReadInteger("TimeOuts","TORDat",4000);
    TOWDat=     ini->ReadInteger("TimeOuts","TOWDat",2000);
    NumRErrSrs= ini->ReadInteger("Errors","NumRErrSrs",10);
    NumCErrSrs= ini->ReadInteger("Errors","NumCErrSrs",10);

    D3List.Num= ini->ReadInteger("D3","Num",0);
    for(int i=0;i<D3List.Num;i++)
    {
      D3List.A[i] = ini->ReadInteger("D3",(s="A")+(i+1),0);
      D3List.ID[i]= ini->ReadInteger("D3",(s="ID")+(i+1),0);
    }
  }
  else
  {
    // >>>TRegistryIniFile *ini=new TRegistryIniFile(ChangeFileExt("BS4I1",""));
    if(TSTest->TabVisible)
    {
      // !!! Gorizont
      if(Caption.Pos("������")>0) ini->WriteString("Common","Caption","����� ������");
      //if(Caption=="������: �� ������ ���� BS4I1Server.ini") ini->WriteString("Common","Caption","����� ������");
      ini->WriteBool("Common","ShowAdvanced",TSTest->TabVisible);
      ini->WriteInteger("Common","NumOfPorts",BTPrs.NumPrs);
      ini->WriteBool("Common","CanSave",CanSave);
      ini->WriteBool("Common","CanInfo",CBStat->Checked);

      ini->WriteInteger("Timers","TmRun",TmRun->Interval);
      ini->WriteInteger("Timers","TmSave",TmSave->Interval);
      for(int i=0;i<MaxPrsSel;i++) ini->EraseSection((s="Port")+(i+1));
      for(int i=0;i<BTPrs.NumPrs;i++)
      {
        ini->WriteString((s="Port")+(i+1),"Name",BTPrs.Ps[i].Name);
        ini->WriteInteger((s="Port")+(i+1),"Num",BTPrs.Ps[i].p+1);
        ini->WriteInteger((s="Port")+(i+1),"BaudRate",BTPrs.Ps[i].CPrt->dcb.BaudRate);
        ini->WriteBool((s="Port")+(i+1),"On",(BTPrs.Ps[i].on));
        ini->WriteInteger((s="Port")+(i+1),"NumOfSensors",BTPrs.Ps[i].NumPSrs);
        for(int j=0;j<BTPrs.Ps[i].NumPSrs;j++)
        {
          ini->WriteString((s="Port")+(i+1),(s="Name")+(j+1),BTPrs.Ps[i].Srs[j]->Name);
          ini->WriteInteger((s="Port")+(i+1),(s="N")+(j+1),BTPrs.Ps[i].Srs[j]->N+1);
          ini->WriteBool((s="Port")+(i+1),(s="On")+(j+1),BTPrs.Ps[i].Srs[j]->on);
          ini->WriteInteger((s="Port")+(i+1),(s="adr")+(j+1),BTPrs.Ps[i].Srs[j]->adr);
          ini->WriteInteger((s="Port")+(i+1),(s="SND3")+(j+1),BTPrs.Ps[i].Srs[j]->SND3);

          ini->WriteFloat((s="Port")+(i+1),(s="Xo")+(j+1),BTPrs.Ps[i].Srs[j]->X0);
          ini->WriteFloat((s="Port")+(i+1),(s="Yo")+(j+1),BTPrs.Ps[i].Srs[j]->Y0);
          ini->WriteFloat((s="Port")+(i+1),(s="To")+(j+1),BTPrs.Ps[i].Srs[j]->T0);
          ini->WriteBool ((s="Port")+(i+1),(s="InvY")+(j+1),BTPrs.Ps[i].Srs[j]->InvY);
          ini->WriteFloat((s="Port")+(i+1),(s="RotX")+(j+1),BTPrs.Ps[i].Srs[j]->RotX);

          ini->WriteString((s="Port")+(i+1),(s="SetData")+(j+1),BTPrs.Ps[i].Srs[j]->SetData);
          ini->WriteString((s="Port")+(i+1),(s="AdjData")+(j+1),BTPrs.Ps[i].Srs[j]->AdjData);
          ini->WriteString((s="Port")+(i+1),(s="Note")+(j+1),BTPrs.Ps[i].Srs[j]->Note);
        }
      }
    }
  }

  //delete ini;


  PortsAudit();

}
//-----------------------------------------------------------------------------

