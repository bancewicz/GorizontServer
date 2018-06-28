//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit3.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TTOPCInstallForm *TOPCInstallForm;

int step=0;

//---------------------------------------------------------------------------
__fastcall TTOPCInstallForm::TTOPCInstallForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTOPCInstallForm::FormCreate(TObject *Sender)
{
        ProgressBar1->Min=0;
        ProgressBar1->Max=100;
        ProgressBar1->Position=0;

        Memo1->Text="";
        Timer1->Interval=1000;
        Timer1->Enabled=false;
}
//---------------------------------------------------------------------------
void __fastcall TTOPCInstallForm::Timer1Timer(TObject *Sender)
{

    wchar_t wdir[1024];
    ::GetCurrentDirectoryW(1024,wdir);


      switch(step)
      {
         case 0:
                ProgressBar1->Position=25;
                Memo1->Text=Memo1->Text+"\r\nУдаление старых записей ...\r\n";
                ::Sleep(100);
                system ("taskkill /f /im opcgate.exe");         ::Sleep(100);

                step++;
         break;

         case 1:
                ProgressBar1->Position=75;
                Memo1->Text=Memo1->Text+"Создание нового списка OPC тэгов ...\r\n";
                ::Sleep(100);
                ShellExecuteW(NULL,NULL,L"OPCGate.exe",L" -u",wdir,0);           ::Sleep(100);
                ShellExecuteW(NULL,NULL,L"OPCGate.exe",L" -r",wdir,0);           ::Sleep(100);
                step++;
         break;

         case 2:
                ProgressBar1->Position=100;
                Memo1->Text=Memo1->Text+"Завершение установки компонент OPC.\r\n";
                Memo1->Refresh();
                ::Sleep(100);
                step++;
                ShellExecuteW(NULL,NULL,L"delete",L"OPCGate.tag",wdir,0);        ::Sleep(100);
                ShellExecuteW(NULL,NULL,L"OPCGate.exe",L" -t",wdir,0);           ::Sleep(100);
                Timer1->Enabled=false;
                ::Sleep(1000);
                Close();
         break;

                default:
                step++;
      }

}
//---------------------------------------------------------------------------
void TTOPCInstallForm::Timer1Start(void)
{
        Timer1->Interval=100;
        Timer1->Enabled=true;
}
