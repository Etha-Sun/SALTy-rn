#include "host.h"
#include <stdio.h>
#include <fenv.h>
void test_neon(size_t,size_t,const float**,const float*,float*,intptr_t,size_t,size_t,size_t,const float*,const struct xnn_f32_minmax_params*);
void test_rvv(size_t,size_t,const float**,const float*,float*,intptr_t,size_t,size_t,size_t,const float*,const struct xnn_f32_minmax_params*);
static float reference(float b,float i0,float k0,float i1,float k1,float i2,float k2,float lo,float hi){
 volatile float p1=i1*k1;volatile float a0=fmaf(i0,k0,b);volatile float a2=fmaf(i2,k2,a0);volatile float sum=a2+p1;
 uint32_t u0=dw_bits(sum),u1=dw_bits(lo),u2=dw_bits(hi);
 if((((u0>>23)&255)==255&&(u0&0x7fffffU))||(((u1>>23)&255)==255&&(u1&0x7fffffU))||(((u2>>23)&255)==255&&(u2&0x7fffffU)))return dw_value(0x7fc00000U);
 return fminf(fmaxf(sum,lo),hi);
}
int main(int argc,char**argv){(void)argv;if(fesetround(FE_TONEAREST))return 2;
 float a[7]={2,3,4,5,0,0,0},b[7]={0},d[7]={0},weights[16]={0},neon[4]={0},rvv[4]={0};const float*ptrs[3]={a,b,d};
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};size_t n=argc>1?4:1;
 for(size_t i=0;i<4;i++)weights[4+i]=1;
 if(argc==2){a[0]=dw_value(0x7fc12345U);p.scalar.min=-1;p.scalar.max=1;}
 if(argc>=3){p.scalar.min=dw_value(0x7fc12345U);p.scalar.max=1;}
 test_neon(n,1,ptrs,weights,neon,24,0,0,0,NULL,&p);test_rvv(n,1,ptrs,weights,rvv,24,0,0,0,NULL,&p);
 int mismatch=0;
 for(size_t c=0;c<n;c++){float ref=reference(weights[c],a[c],weights[4+c],b[c],weights[8+c],d[c],weights[12+c],p.scalar.min,p.scalar.max);int good=dw_nan(ref)?dw_nan(neon[c]):ref==neon[c];if(!good){fprintf(stderr,"independent oracle rejected NEON\n");return 2;}
 int eq=(neon[c]==rvv[c])||(dw_nan(neon[c])&&dw_nan(rvv[c]));if(!eq){printf("counterexample c=%zu channels=%zu neon=%08x rvv=%08x oracle=%08x\n",c,n,dw_bits(neon[c]),dw_bits(rvv[c]),dw_bits(ref));mismatch=1;}}
 return mismatch?1:0;
}
