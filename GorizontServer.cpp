//---------------------------------------------------------------------------
#include <IniFiles.hpp>
#include <Registry.hpp>
#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("Main.cpp", FMain);
USEFORM("ChartDlg.cpp", FChartDlg);
USEFORM("Unit1.cpp", Form_IND3_Tune);
USEFORM("Unit2.cpp", Form_new_addr);
USEFORM("Unit_AND3Tune.cpp", Form_AND3_Tune);
USEFORM("UTILS\Unit_accmeas.cpp", Form_acceas);
USEFORM("Unit3.cpp", TOPCInstallForm);
USEFORM("TuneSystem.cpp", Form_SYSTEM_Tune);
USEFORM("About.cpp", Form_about);
USEFORM("TunePort.cpp", Form_PORT_Tune);
USEFORM("TuneSensor.cpp", Form_SENSOR_Tune);
USEFORM("TuneDataProc.cpp", Form_DataProc_Tune);
USEFORM("TuneInterfaces.cpp", Form_Interfaces_Tune);
USEFORM("Unit_enter_password.cpp", Form_enter_password);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  AnsiString cap;
  TIniFile *gini=new TIniFile(ChangeFileExt(Application->ExeName,".gcf"));
  AnsiString ipath=gini->ReadString("GLOBALS","ConfPath","GorizontServer");

  TIniFile *ini=new TIniFile(ipath);

  //TIniFile *ini=new TIniFile(this->SysConfMaster.gIniFilePath);


  extern bool CanCopy;
    CanCopy=ini->ReadBool("Common","CanCopy",false);
    cap    =ini->ReadString("Common","Caption","BS4I1 ������");

    cap=cap+" [";
    cap=cap+ipath;
    cap=cap+"]";

  delete ini;
  delete gini;

   if(!CanCopy)
   {
    HWND h=FindWindow("TFMain",cap.c_str());
    if(h!=NULL)
    {
       ShowMessage("��������� c ��������� ������������ ������� ��� �������!");
       return 0;
    }
   }




  try
  {
    Application->Initialize();
    
    Application->CreateForm(__classid(TFMain), &FMain);
                 Application->CreateForm(__classid(TFChartDlg), &FChartDlg);
                 Application->CreateForm(__classid(TForm_IND3_Tune), &Form_IND3_Tune);
                 Application->CreateForm(__classid(TForm_new_addr), &Form_new_addr);
                 Application->CreateForm(__classid(TForm_AND3_Tune), &Form_AND3_Tune);
                 Application->CreateForm(__classid(TForm_acceas), &Form_acceas);
                 Application->CreateForm(__classid(TTOPCInstallForm), &TOPCInstallForm);
                 Application->CreateForm(__classid(TForm_SYSTEM_Tune), &Form_SYSTEM_Tune);
                 Application->CreateForm(__classid(TForm_about), &Form_about);
                 Application->CreateForm(__classid(TForm_PORT_Tune), &Form_PORT_Tune);
                 Application->CreateForm(__classid(TForm_SENSOR_Tune), &Form_SENSOR_Tune);
                 Application->CreateForm(__classid(TForm_DataProc_Tune), &Form_DataProc_Tune);
                 Application->CreateForm(__classid(TForm_Interfaces_Tune), &Form_Interfaces_Tune);
                 Application->CreateForm(__classid(TForm_enter_password), &Form_enter_password);
                 Application->Run();
  }
  catch (Exception &exception)
  {
    Application->ShowException(&exception);
  }
  catch (...)
  {
    try
    {
      throw Exception("");
    }
    catch (Exception &exception)
    {
      Application->ShowException(&exception);
    }
  }
  return 0;
}
//---------------------------------------------------------------------------
