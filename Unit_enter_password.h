//---------------------------------------------------------------------------

#ifndef Unit_enter_passwordH
#define Unit_enter_passwordH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TForm_enter_password : public TForm
{
__published:	// IDE-managed Components
        TEdit *Edit1;
        TButton *Button_ok;
        void __fastcall Button_okClick(TObject *Sender);
        void __fastcall FormKeyPress(TObject *Sender, char &Key);
        void __fastcall Edit1KeyPress(TObject *Sender, char &Key);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_enter_password(TComponent* Owner);
        AnsiString* psw;
};
//---------------------------------------------------------------------------
extern PACKAGE TForm_enter_password *Form_enter_password;
//---------------------------------------------------------------------------
#endif
