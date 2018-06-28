//---------------------------------------------------------------------------

#ifndef AboutH
#define AboutH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TForm_about : public TForm
{
__published:	// IDE-managed Components
        TButton *Button_close;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label1;
        TImage *Image1;
        void __fastcall Button_closeClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_about(TComponent* Owner);

        AnsiString sVersion;
        SetVersion(AnsiString s);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm_about *Form_about;
//---------------------------------------------------------------------------
#endif



