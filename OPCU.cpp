//---------------------------------------------------------------------------
/*
Copyright (c) 2013 Serge L. Ryadkow admin@opcgate.ru http://opcgate.ru 

Permission is hereby granted, free of charge, to any person obtaining a copy of this 
software and associated documentation files (the "Software"), to deal in the Software 
without restriction, including without limitation the rights to use, copy, modify, 
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to the following 
conditions:

The above copyright notice and this permission notice shall be included in all copies 
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
OTHER DEALINGS IN THE SOFTWARE. 
*/
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>

#pragma hdrstop

#include <Log.h>

#include "OPCU.h"
#include "ConfigU.h"
//#include "MainU.h"

#include "Main.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
__fastcall TOPC::TOPC(TConfig *cfg)
	:	TOPCGate(
  	cfg->GetPort(),
    TLogFlags(cfg->GetLogFlags()),
    cfg->GetConnTOms(),
    cfg->GetSubsTOms(),
    cfg->GetBuffSubs()
  )
{
}
//---------------------------------------------------------------------------
__fastcall TOPC::TOPC(TConfig *cfg, const AnsiString &certFile,
		const AnsiString &keyFile, const AnsiString &rootCertFile)
	:	TOPCGate(
  	cfg->GetPort(),
    certFile,
    keyFile,
    rootCertFile,
    TLogFlags(cfg->GetLogFlags()),
    cfg->GetConnTOms(),
    cfg->GetSubsTOms(),
    cfg->GetBuffSubs()
  )
{
}
//---------------------------------------------------------------------------
__fastcall TOPC::~TOPC()
{
}
//---------------------------------------------------------------------------
//virtual
void __fastcall TOPC::GetValues(TStrings *sl)
{
//Это для данных по подписке!!!
        sl->AddStrings(FMain->GetVals());
}

//---------------------------------------------------------------------------
//virtual
void __fastcall TOPC::Log(const AnsiString &msg)
{
       	*::Log << msg;
}
//---------------------------------------------------------------------------
//virtual
void __fastcall TOPC::GetTags(TStrings *sl)
{
      	sl->AddStrings(FMain->GetTags());

}
//---------------------------------------------------------------------------
