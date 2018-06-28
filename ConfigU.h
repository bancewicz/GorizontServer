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
#ifndef ConfigUH
#define ConfigUH
//---------------------------------------------------------------------------
class TConfig {
public:
	__fastcall TConfig();
	__fastcall ~TConfig();
#define CFGITEM(name, type) type __fastcall Get##name() {return Data.##name;}
#include "Config.templ"
#undef CFGITEM
  AnsiString __fastcall ToString();
private:
	template<class T> void __fastcall Convert(T &res, const AnsiString &val);
	void __fastcall Convert(int &res, const AnsiString &val);
	void __fastcall Convert(double &res, const AnsiString &val);
  AnsiString ModulePath, ModuleDir;
  struct {
#define CFGITEM(name, type) type name;
#include "Config.templ"
#undef CFGITEM
  } Data;
};
//---------------------------------------------------------------------------
template<class T>
inline void __fastcall TConfig::Convert(T &res, const AnsiString &val)
{
	res = val;
}
//---------------------------------------------------------------------------
inline void __fastcall TConfig::Convert(int &res, const AnsiString &val)
{
	res = val.ToInt();
}
//---------------------------------------------------------------------------
inline void __fastcall TConfig::Convert(double &res, const AnsiString &val)
{
	res = val.ToDouble();
}
//---------------------------------------------------------------------------
#endif
