// BS4I1Def.cpp
//-----------------------------------------------------------------------------

//#include "..\\BS4I1Def.h"

#include <BS4I1Def.h>

//-----------------------------------------------------------------------------
char* BinToTxt(int n,byte *in,int N, byte *d)
{
  static byte out[MAXBUFSIZE*2];if(n>MAXBUFSIZE) n=MAXBUFSIZE;
  for(int i=0;i<n;i++)
  {
    if(in[i]<128) { out[2*i]=in[i]+128;out[2*i+1]=65;}
    else          { out[2*i]=in[i];out[2*i+1]=66;}
  }
  for(int i=0;i<N;i++)
  {
    if(d[i]<128)  { out[2*(i+n)]=d[i]+128;out[2*(i+n)+1]=65;}
    else          { out[2*(i+n)]=d[i];out[2*(i+n)+1]=66;}
  }
  out[2*(n+N)]=0;return out;
}
//---------------------------------------------------------------------------
byte* StrToBin(int *n,AnsiString *s)
{
  static byte out[MAXBUFSIZE];
  *n=s->Length();if(*n>MAXBUFSIZE) *n=MAXBUFSIZE;byte* in=s->c_str();
  for(int i=0;i<*n;i++)
  {
    out[i]=in[2*i];if(in[2*i+1]==65) { out[i]-=128;}
  }
  return out;
}
//---------------------------------------------------------------------------

