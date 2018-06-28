//---------------------------------------------------------------------------

#ifndef InterfacesTuneH
#define InterfacesTuneH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TForm_Interfaces : public TForm
{
__published:	// IDE-managed Components
        TPageControl *PageControl1;
        TButton *Button_save;
        TTabSheet *TabSheet1;
        TTabSheet *TabSheet2;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TLabel *Label2;
        TCheckBox *CheckBox2;
        TLabel *Label3;
private:	// User declarations
public:		// User declarations
        __fastcall TForm_Interfaces(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm_Interfaces *Form_Interfaces;
//---------------------------------------------------------------------------
#endif
