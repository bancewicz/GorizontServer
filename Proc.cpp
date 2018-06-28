//---------------------------------------------------------------------------
#pragma hdrstop
//---------------------------------------------------------------------------
#include "Proc.h"
#include <math.h>
#include <mem.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
#define SWAP(a,b) tempr=(a);(a)=(b);(b)=tempr
//-----------------------------------------------------------------------------
// Replaces data[1..2*nn] by its discrete Fourier transform, if isign is input as 1; or replaces
// data[1..2*nn] by nn times its inverse discrete Fourier transform, if isign is input as -1.
// data is a complex array of length nn or, equivalently, a real array of length 2*nn. nn MUST
//-----------------------------------------------------------------------------
void four1(double data[], unsigned long nn, int isign)
{
  double tempr,tempi;
  unsigned long n,mmax,m,j,istep,i;double wtemp,wr,wpr,wpi,wi,theta;
  n=nn<<1;j=1;
  for(i=1;i<n;i+=2)
  {
    if (j>i) {SWAP(data[j],data[i]);SWAP(data[j+1],data[i+1]);}
    m=n>>1;
    while(m>=2 && j>m) {j-=m;m>>=1;}
    j+= m;
  }
  mmax=2;
  while(n>mmax)
  {
    istep=mmax<<1;
    theta=isign*(2.0*M_PI/mmax);
    wtemp=sin(0.5*theta);
    wpr=-2.0*wtemp*wtemp;
    wpi=sin(theta);
    wr=1.0;wi=0.0;
    for(m=1;m<mmax;m+=2)
    {
      for (i=m;i<=n;i+=istep)
      {
        j=i+mmax;
	tempr=wr*data[j]-wi*data[j+1];
	tempi=wr*data[j+1]+wi*data[j];
	data[j]=data[i]-tempr;
	data[j+1]=data[i+1]-tempi;
	data[i]+=tempr;
	data[i+1]+=tempi;
      }
      wr=(wtemp=wr)*wpr-wi*wpi+wr;
      wi=wi*wpr+wtemp*wpi+wi;
    }
    mmax=istep;
  }
}
//-----------------------------------------------------------------------------
// Calculates the Fourier transform of a set of n real-valued data points. Replaces this data (which
// is stored in array data[1..n]) by the positive frequency half of its complex Fourier transform.
// The real-valued first and last components of the complex transform are returned as elements
// data[1] and data[2], respectively. n must be a power of 2. This routine also calculates the
// inverse transform of a complex data array if it is the transform of real data. (Result in this case
// must be multiplied by 2/n.)
//-----------------------------------------------------------------------------
void realft(double data[], unsigned long n, int isign)
{
  double c1=0.5,c2,h1r,h1i,h2r,h2i;
  unsigned long i,i1,i2,i3,i4,np3;
  double wr,wi,wpr,wpi,wtemp,theta;
  theta=M_PI/(double) (n>>1);
  if(isign==1) {c2=-0.5;four1(data,n>>1,1);}
  else         {c2=0.5;theta=-theta;}
  wtemp=sin(0.5*theta);
  wpr=-2.0*wtemp*wtemp;
  wpi=sin(theta);
  wr=1.0+wpr;
  wi=wpi;
  np3=n+3;
  for(i=2;i<=(n>>2);i++)
  {
    i4=1+(i3=np3-(i2=1+(i1=i+i-1)));
    h1r=c1*(data[i1]+data[i3]);
    h1i=c1*(data[i2]-data[i4]);
    h2r=-c2*(data[i2]+data[i4]);
    h2i=c2*(data[i1]-data[i3]);
    data[i1]=h1r+wr*h2r-wi*h2i;
    data[i2]=h1i+wr*h2i+wi*h2r;
    data[i3]=h1r-wr*h2r+wi*h2i;
    data[i4]=-h1i+wr*h2i+wi*h2r;
    wr=(wtemp=wr)*wpr-wi*wpi+wr;
    wi=wi*wpr+wtemp*wpi+wi;
  }
  if(isign==1)
  {
    data[1]=(h1r=data[1])+data[2];
    data[2]=h1r-data[2];
  }
  else
  {
    data[1]=c1*((h1r=data[1])+data[2]);
    data[2]=c1*(h1r-data[2]);
    four1(data,n>>1,-1);
  }
}
//-----------------------------------------------------------------------------
// l должно быть четным
void ReAbsDFT(double *x,double *s,DWORD l)
{
  double Im,Re,PI=M_PI,c;
  if(l<2) return;
  for(DWORD k=0;k<l/2;k++) // l/2
  {
    Re=0.0;Im=0.0;c=-2.0*PI*k/l;
    for(DWORD n=0;n<l;n++)
    {
      Re+=x[n]*cos(n*c);
      Im+=x[n]*sin(n*c);
    }
    s[k]=sqrt(Re*Re+Im*Im)/l;
  }
}
//------------------------------------------------------------------------------
// l должно быть четным
// l должно быть степелью 2
void ReAbsFFT(double *x,double *s,DWORD l)
{
  double Re,Im;
  if(l<2) return;
  memcpy(s,x,l*sizeof(double));
  realft(s-1,l,1);
  for(DWORD i=0;i<l/2;i++) // l/2
  {
    Re=s[i*2];Im=s[i*2+1];
    s[i]=sqrt(Re*Re+Im*Im)/l;
  }
}
//------------------------------------------------------------------------------
DWORD ExP2(DWORD l)
{
  DWORD i,l2=1;
  for(i=1;i<32;i++) { l2<<=1;if(l==l2) return l;if(l2>l) break;}
  return l2/2;
}
//------------------------------------------------------------------------------
// l должно быть четным
void ReAbsFT(double *x,double *s,DWORD l)
{
  int n;
  if(l<2) return;
  if(ExP2(l)<l) ReAbsDFT(x,s,l);
  else          ReAbsFFT(x,s,l);
}
//------------------------------------------------------------------------------

