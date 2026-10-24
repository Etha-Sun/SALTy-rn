#include "../intrinsics.h"
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <fenv.h>
extern unsigned sqrt_vl_mode;
void test_neon(size_t,const float*,float*,const struct xnn_f32_default_params*);
void test_rvv(size_t,const float*,float*,const struct xnn_f32_default_params*);
int equivalent(size_t,const float*,float*,float*);
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static float value(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static uint32_t rng=0x321abc98U;
static uint32_t next(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static int nanbits(uint32_t u){return(u&0x7fffffffU)>0x7f800000U;}
static uint32_t oracle(uint32_t u){uint32_t a=u&0x7fffffffU;
 if(nanbits(u)||((u>>31)&&a))return 0x7fc00000U;
 return bits((float)sqrtl((long double)value(u)));}
int main(void){
 if(fesetround(FE_TONEAREST))return 2;
 static const uint32_t special[]={0,0x80000000U,1,0x80000001U,0x007fffffU,0x807fffffU,0x00800000U,0x80800000U,0x3f800000U,0x40000000U,0xbf800000U,0x7f7fffffU,0xff7fffffU,0x7f800000U,0xff800000U,0x7f800001U,0xff800001U,0x7fc00000U,0xffc00000U,0x7fffffffU,0xffffffffU,0x3f7fffffU,0x3f800001U};
 size_t cases=0,lanes=0;
 for(unsigned mode=0;mode<32;mode++)for(unsigned pattern=0;pattern<12;pattern++)for(size_t n=1;n<=129;n++){
  sqrt_vl_mode=mode;
  float *in=malloc((n+3)*4),*snapshot=malloc((n+3)*4),*ol=malloc((n+2)*4),*orr=malloc((n+2)*4);
  if(!in||!snapshot||!ol||!orr){free(in);free(snapshot);free(ol);free(orr);return 2;}
  for(size_t i=0;i<n+3;i++){uint32_t u=pattern<8?special[(i+pattern*3)% (sizeof(special)/sizeof(*special))]:next();in[i]=value(u);}
  in[0]=value(0);memcpy(snapshot,in,(n+3)*4);ol[0]=orr[0]=value(0x45612345U);ol[n+1]=orr[n+1]=value(0x45654321U);
  test_neon(n*4,in,ol+1,NULL);test_rvv(n*4,in,orr+1,NULL);
  for(size_t i=0;i<n;i++){
   uint32_t x=bits(snapshot[i]),l=bits(ol[i+1]),r=bits(orr[i+1]),o=oracle(x);
   int good=nanbits(o)?nanbits(l)&&nanbits(r):(l==o&&r==o);
   if(!good){fprintf(stderr,"oracle mismatch n=%zu i=%zu x=%08x neon=%08x rvv=%08x oracle=%08x\n",n,i,x,l,r,o);free(in);free(snapshot);free(ol);free(orr);fflush(stderr);return 1;}
   if(nanbits(x)&&l!=(x|0x00400000U)){fprintf(stderr,"ARM quiet-payload mismatch\n");free(in);free(snapshot);free(ol);free(orr);return 1;}
   if(nanbits(o)&&r!=0x7fc00000U){fprintf(stderr,"RVV canonical mismatch\n");free(in);free(snapshot);free(ol);free(orr);return 1;}
  }
  if(memcmp(in,snapshot,(n+3)*4)||bits(ol[0])!=0x45612345U||bits(orr[0])!=0x45612345U||bits(ol[n+1])!=0x45654321U||bits(orr[n+1])!=0x45654321U){fprintf(stderr,"frame mismatch\n");free(in);free(snapshot);free(ol);free(orr);return 1;}
  if(equivalent(n,in,ol+1,orr+1)!=1){fprintf(stderr,"public comparator mismatch\n");free(in);free(snapshot);free(ol);free(orr);return 1;}
  cases++;lanes+=n;free(in);free(snapshot);free(ol);free(orr);
 }
 printf("%zu cases, %zu lanes per side, independent sqrtl oracle passed\n",cases,lanes);return 0;
}
