#include "isa_arrays.h"
#include "../../shim/propagating.c"
#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#define test_neon actual_neon
#include "../../impl/testNEON.c"
#undef test_neon
#define test_rvv actual_rvv
#include "../../impl/testRVV.c"
#undef test_rvv
static uint64_t seed=UINT64_C(0x6c34bde981f06b27),cases,lanes,aliases;
static uint32_t rand32(void){seed^=seed<<13;seed^=seed>>7;seed^=seed<<17;return(uint32_t)seed;}
static float bitfloat(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static uint32_t floatbit(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static int obs(float a,float b){return a==b||(isnan(a)&&isnan(b));}
/* Independent scalar geometry/order; no vector helper or min/max emulator.
   C fmaf supplies one binary32 rounding. NaN payloads are not observed. */
static float reference(size_t H,size_t N,const float*in,const float*w,const float*z,size_t y,size_t x,float lo,float hi){
 float acc=w[0];
 const int dx[9]={0,0,0,-1,-1,-1,1,1,1};
 const int dy[9]={-1,0,1,-1,0,1,-1,0,1};
 const unsigned kw[9]={2,5,8,1,4,7,3,6,9};
 for(size_t t=0;t<9;t++){
  float a=0.0f;
  if(!((dx[t]<0&&x==0)||(dx[t]>0&&x+1==N))){
   size_t c=dx[t]<0?x-1:dx[t]>0?x+1:x;
   if((dy[t]<0&&y==0)||(dy[t]>0&&y+1==H))a=z[c];
   else {size_t r=dy[t]<0?y-1:dy[t]>0?y+1:y;a=in[r*N+c];}
  }
  acc=fmaf(a,w[kw[t]],acc);
 }
 if(isnan(acc)||isnan(lo)||isnan(hi))return nanf("");
 return fminf(fmaxf(acc,lo),hi);
}
static const uint32_t edge[]={0,0x80000000U,1,0x80000001U,0x007fffffU,0x00800000U,0x80800000U,0x3f000000U,0xbf000000U,0x3f800000U,0xbf800000U,0x3f800001U,0x7f7fffffU,0xff7fffffU,0x7f800000U,0xff800000U,0x7fc00000U,0xffc12345U,0x7f800001U,0xff800001U};
static void invoke_neon(size_t H,size_t N,const float*in,const float*w,const float*z,float*out,const struct xnn_f32_minmax_params*p){actual_neon(H,N*4,in,w,z,out,1,p);
#if defined(WRONG_ONE) || defined(WRONG_BOTH)
 out[0]=42.0f;
#endif
}
static void invoke_rvv(size_t H,size_t N,const float*in,const float*w,const float*z,float*out,const struct xnn_f32_minmax_params*p){actual_rvv(H,N*4,in,w,z,out,1,p);
#ifdef WRONG_BOTH
 out[0]=42.0f;
#endif
}
static int one(size_t H,size_t N,unsigned pattern,unsigned alias,int vlmode,int tailmode){
 size_t size=H*N,cap=size+N+64;float*in=malloc(cap*4),*saved=malloc(cap*4),*zz=malloc((N+3)*4),*zs=malloc((N+3)*4),*a=malloc((size+8)*4),*b=malloc((size+8)*4);assert(in&&saved&&zz&&zs&&a&&b);float weights[10];
 for(size_t i=0;i<cap;i++)in[i]=bitfloat(pattern==0?0:pattern==1?edge[i%(sizeof(edge)/4)]:pattern<22?edge[(i+pattern)%(sizeof(edge)/4)]:rand32());
 for(size_t i=0;i<N+3;i++)zz[i]=bitfloat(pattern==0?0:edge[(i+pattern+3)%(sizeof(edge)/4)]);
 for(size_t i=0;i<10;i++)weights[i]=bitfloat(pattern==0?(i==0?0x3f800000U:0):pattern<22?edge[(pattern+i*3)%(sizeof(edge)/4)]:rand32());
 float*z=alias==0?zz:alias==1?in:alias==2?in+(H-1)*N:in+1;
 float*w=alias==4?in+2:weights;
 struct xnn_f32_minmax_params p={{pattern==0?-100.0f:bitfloat(edge[pattern%(sizeof(edge)/4)]),pattern==0?100.0f:bitfloat(edge[(pattern*7+11)%(sizeof(edge)/4)])}},ps=p;
 memcpy(saved,in,cap*4);memcpy(zs,zz,(N+3)*4);float ws[10];memcpy(ws,weights,40);
 for(size_t i=0;i<size+8;i++)a[i]=b[i]=bitfloat(0x42f60000U);
 dw_vl_mode=vlmode;dw_tail_mode=tailmode;dw_vl_counter=0;
 invoke_neon(H,N,in,w,z,a+4,&p);dw_vl_counter=0;invoke_rvv(H,N,in,w,z,b+4,&p);
 int rc=0;
 for(size_t y=0;y<H;y++)for(size_t x=0;x<N;x++){
  size_t j=y*N+x;float e=reference(H,N,in,w,z,y,x,p.scalar.min,p.scalar.max);
  if(!obs(a[4+j],b[4+j])||!obs(a[4+j],e)||!obs(b[4+j],e)){
   fprintf(stderr,"mismatch H=%zu N=%zu pattern=%u alias=%u vl=%d tail=%d y=%zu x=%zu neon=%08x rvv=%08x oracle=%08x compare=%d\n",H,N,pattern,alias,vlmode,tailmode,y,x,floatbit(a[4+j]),floatbit(b[4+j]),floatbit(e),obs(a[4+j],b[4+j]));rc=2;goto cleanup;
  }
 }
 for(size_t i=0;i<4;i++)if(floatbit(a[i])!=0x42f60000U||floatbit(b[i])!=0x42f60000U||floatbit(a[4+size+i])!=0x42f60000U||floatbit(b[4+size+i])!=0x42f60000U){rc=3;goto cleanup;}
 if(memcmp(saved,in,cap*4)||memcmp(zs,zz,(N+3)*4)||memcmp(weights,ws,40)||memcmp(&p,&ps,sizeof(p))){rc=4;goto cleanup;}
 cases++;lanes+=size;if(alias)aliases++;
 cleanup:free(in);free(saved);free(zz);free(zs);free(a);free(b);return rc;
}
int main(void){assert(fesetround(FE_TONEAREST)==0);const size_t widths[]={1,2,3,4,5,7,8,9,12,15,16,17,31,32,33,64,65};
 for(size_t h=1;h<=9;h++)for(size_t n=0;n<sizeof(widths)/sizeof(widths[0]);n++)for(unsigned p=0;p<28;p++)for(unsigned a=0;a<5;a++)for(int v=0;v<3;v++)for(int t=0;t<2;t++){int rc=one(h,widths[n],p,a,v,t);if(rc)return rc;}
 printf("passed cases=%llu lanes_per_side=%llu aliased_cases=%llu vl_modes=3 inactive_modes=2\n",(unsigned long long)cases,(unsigned long long)lanes,(unsigned long long)aliases);return 0;}
