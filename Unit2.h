//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "BTCOM.h"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm_new_addr : public TForm
{
__published:	// IDE-managed Components
        TButton *Button_apply;
        TButton *Button_cancel;
        TComboBox *ComboBox_new_addr;
        TTimer *Timer_start;
        void __fastcall Button_cancelClick(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Timer_startTimer(TObject *Sender);
        void __fastcall Button_applyClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm_new_addr(TComponent* Owner);


        TProtocol_211* Pr211;
        unsigned char* new_addr;
        void Start(void);

};
//---------------------------------------------------------------------------
extern PACKAGE TForm_new_addr *Form_new_addr;
//---------------------------------------------------------------------------
#endif
