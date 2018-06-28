//---------------------------------------------------------------------------
#include <IniFiles.hpp>
#include <Registry.hpp>
#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("Main.cpp", FMain);
USEFORM("ChartDlg.cpp", FChartDlg);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  AnsiString cap;
  TIniFile *ini=new TIniFile(ChangeFileExt(Application->ExeName,".ini"));
  extern bool CanCopy;
    CanCopy=ini->ReadBool("Common","CanCopy",false);
    cap    =ini->ReadString("Common","Caption","BS4I1 Сервер");
  delete ini;
  if(!CanCopy) { HWND h=FindWindow("TFMain",cap.c_str());if(h!=NULL) return 0;}

  try
  {
    Application->Initialize();
    Application->CreateForm(__classid(TFMain), &FMain);
    Application->CreateForm(__classid(TFChartDlg), &FChartDlg);
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
