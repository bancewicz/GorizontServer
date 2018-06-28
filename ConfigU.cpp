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

#include <StringUtil.h>

#include "ConfigU.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
__fastcall TConfig::TConfig()
{
	TStringList *sl = new TStringList();
  try {
	 	sl->LoadFromFile(::ChangeFileExt(__argv[0], ".cfg"));
  	::RemoveComments(sl, '#');
#define CFGITEM(name, type) try { Convert(Data.##name, sl->Values[#name]); \
    } catch(Exception &e) {e.Message = "Config."#name" error: " + e.Message; \
    throw;}
#include "Config.templ"
#undef CFGITEM
  } __finally {
  	delete sl;
  }
}
//---------------------------------------------------------------------------
__fastcall TConfig::~TConfig()
{
}
//---------------------------------------------------------------------------
AnsiString __fastcall TConfig::ToString()
{
	AnsiString s = "Config:";
#define CFGITEM(name, type) s += "\n\t"#type" "#name" = " + \
		AnsiString(Data.##name) + ";";
#include "Config.templ"
#undef CFGITEM
	return s;
}
//---------------------------------------------------------------------------
