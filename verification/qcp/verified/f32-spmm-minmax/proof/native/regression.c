#include "fp_primitives.h"
#include <stdio.h>
#include <fenv.h>
float qcp_identity(float x);
#include "testNEON.c"
#include "testRVV.c"
static uint32_t bits(float f){uint32_t b;memcpy(&b,&f,4);return b;}
static float value(uint32_t b){float f;memcpy(&f,&b,4);return f;}
static int observed(float a,float b){return a==b||(isnan(a)&&isnan(b));}
/* Independent scalar oracle: indexed channels, not a dmap cursor or vector
   primitive, and direct libc fmaf with contraction of other expressions off. */
static float oracle_clamp(float x,float lo,float hi){
 if(isnan(x)||isnan(hi))x=NAN;else x=fminf(x,hi);
 if(isnan(x)||isnan(lo))return NAN;return fmaxf(x,lo);
}
static const uint32_t patterns[]={0,0x80000000,0x3f800000,0xbf800000,
 0x3f800001,0x3f7ffffe,1,0x807fffff,0x7f7fffff,0xff7fffff,
 0x7f800000,0xff800000,0x7fc00001,0xffc00001,0x7f800001,0xff800001};
static size_t cases,cells;
static int trial(size_t m,size_t n,size_t pattern,size_t gap,size_t mode){
 float input[1024],weights[128],left[1024],right[1024],expected[1024];
 float input_copy[1024],weight_copy[128];
 int32_t delta[64],delta_copy[64];uint32_t nnz[8],nnz_copy[8];
 size_t pos[64],starts[8],weight_starts[8],used=0,wn=0;
 const size_t channels=7,stride=m+gap;const float guard=value(0x4d123456);
 for(size_t i=0;i<1024;i++){input[i]=value(patterns[(i+pattern)%16]);left[i]=right[i]=expected[i]=guard;}
 for(size_t i=0;i<128;i++)weights[i]=guard;
 memset(delta,0,sizeof delta);memset(nnz,0,sizeof nnz);
 for(size_t c=0;c<n;c++){
  starts[c]=used;weight_starts[c]=wn;
  weights[wn++]=value(patterns[(pattern+c+2)%16]);
  nnz[c]=mode==0?0:(mode==1?1:(uint32_t)((c+pattern)%8));
  for(size_t k=0;k<nnz[c];k++){
   pos[used++]=k+(pattern%(channels+1-nnz[c]));
   weights[wn++]=value(patterns[(3*k+c+pattern+4)%16]);
  }
 }
 for(size_t j=0;j<used;j++)delta[j]=(int32_t)(((int64_t)pos[(j+1)%used]-(int64_t)pos[j])*(int64_t)m*4);
 const size_t first=used?pos[0]:0;
 struct xnn_f32_minmax_params params={{value(patterns[(pattern+mode)%16]),value(patterns[(pattern+mode+1)%16])}};
 if(mode==1){params.scalar.min=-INFINITY;params.scalar.max=INFINITY;}
 for(size_t c=0;c<n;c++)for(size_t row=0;row<m;row++){
  float acc=weights[weight_starts[c]];
  for(size_t k=0;k<nnz[c];k++)acc=fmaf(input[pos[starts[c]+k]*m+row],weights[weight_starts[c]+1+k],acc);
  expected[2+c*stride+row]=oracle_clamp(acc,params.scalar.min,params.scalar.max);
 }
 memcpy(input_copy,input,sizeof input);memcpy(weight_copy,weights,sizeof weights);
 memcpy(delta_copy,delta,sizeof delta);memcpy(nnz_copy,nnz,sizeof nnz);
 struct xnn_f32_minmax_params params_copy=params;
 test_neon(m*4,n,input+first*m,weights,delta,nnz,left+2,stride*4,&params);
 test_rvv(m*4,n,input+first*m,weights,delta,nnz,right+2,stride*4,&params);
#ifdef BOTH_WRONG
 left[2]=right[2]=observed(expected[2],0.0f)?1.0f:0.0f;
#endif
 for(size_t i=0;i<1024;i++){
  if(!observed(left[i],right[i]))return 20;
  if(!observed(left[i],expected[i])||!observed(right[i],expected[i]))return 21;
 }
 if(memcmp(input,input_copy,sizeof input)||memcmp(weights,weight_copy,sizeof weights)||
    memcmp(delta,delta_copy,sizeof delta)||memcmp(nnz,nnz_copy,sizeof nnz)||memcmp(&params,&params_copy,sizeof params))return 22;
 cases++;cells+=m*n;return 0;
}
int main(void){
 if(fesetround(FE_TONEAREST))return 9;
 const size_t sizes[]={1,2,3,4,5,7,8,15,16,17,31,32,33,47,63,64,65};
 for(size_t m=0;m<sizeof sizes/sizeof sizes[0];m++)for(size_t n=1;n<=5;n++)
 for(size_t p=0;p<16;p++)for(size_t gap=0;gap<2;gap++)for(size_t mode=0;mode<3;mode++){
  int r=trial(sizes[m],n,p,gap*3,mode);if(r){fprintf(stderr,"failure=%d M=%zu N=%zu pattern=%zu gap=%zu mode=%zu\n",r,sizes[m],n,p,gap*3,mode);return r;}
 }
 printf("{\"cases\":%zu,\"output_cells\":%zu,\"passed\":true}\n",cases,cells);return 0;
}
