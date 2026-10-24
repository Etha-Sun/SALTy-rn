#include "fp_primitives.h"
#include <fenv.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int equivalent(size_t,size_t,size_t,const float*,const float*,float*,float*,const struct xnn_f32_minmax_params*);
static uint32_t state=0x7c832a91;
static uint32_t next_bits(void) {state^=state<<13;state^=state>>17;state^=state<<5;return state;}
static float from_bits(uint32_t x){float f;memcpy(&f,&x,4);return f;}
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static float sample(unsigned mode){
 static const uint32_t sp[]={0,0x80000000,1,0x80000001,0x007fffff,0x00800000,0x3f800000,0xbf800000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc00000,0x7fc12345,0xffcabcde,0x7f800001,0xff800001};
 uint32_t u=next_bits();
 if(mode==0)return 1.0f;
 if(mode==1)return (float)((int)(u%17)-8)*0.25f;
 if(mode==2)u=sp[u%(sizeof(sp)/sizeof(*sp))];
 return from_bits(u);
}
/* Independent scalar oracle: packed index calculation, K-order fused updates,
   then ARM NaN-propagating min(hi), max(lo). It calls no SIMD helper. */
static float oracle(size_t row,size_t col,size_t K,const float*A,const float*W,float lo,float hi){
 size_t panel=col/8,lane=col%8,base=panel*8*(K+1);
 float x=W[base+lane];
 for(size_t k=0;k<K;k++)x=fmaf(A[row*K+k],W[base+8+8*k+lane],x);
 if(isnan(x)||isnan(hi)||isnan(lo))return from_bits(0x7fc00000);
 x=fminf(x,hi);return fmaxf(x,lo);
}
static int same(float a,float b){return a==b || (isnan(a)&&isnan(b));}
int main(void){
 if(fesetround(FE_TONEAREST))return 2;
 size_t cases=0,cells=0;
 for(size_t mr=1;mr<=4;mr++)for(size_t N=1;N<=33;N++)for(size_t K=1;K<=13;K++)for(unsigned mode=0;mode<4;mode++){
  size_t na=4*K,nw=((N+7)/8)*8*(K+1),no=4*N;
  float*A=malloc(4*na),*W=malloc(4*nw),*AS=malloc(4*na),*WS=malloc(4*nw);
  float*LB=malloc(4*(no+2)),*RB=malloc(4*(no+2));
  if(!A||!W||!AS||!WS||!LB||!RB)return 3;
  float*L=LB+1,*R=RB+1;
  for(size_t i=0;i<na;i++)A[i]=sample(mode);
  for(size_t i=0;i<nw;i++)W[i]=sample(mode);
  for(size_t i=0;i<no+2;i++){LB[i]=from_bits(0x4f123456);RB[i]=from_bits(0xcf654321);}
  memcpy(AS,A,4*na);memcpy(WS,W,4*nw);
  float lo=mode<2?-1000000.0f:sample(mode),hi=mode<2?1000000.0f:sample(mode);
  struct xnn_f32_minmax_params p={{lo,hi}};int equal=equivalent(mr,N,4*K,A,W,L,R,&p);
  if(!equal){printf("caller rejected mr=%zu N=%zu K=%zu mode=%u\n",mr,N,K,mode);return 20;}
  for(size_t r=0;r<mr;r++)for(size_t c=0;c<N;c++){
   float expected=oracle(r,c,K,A,W,lo,hi);cells++;
   if(!same(L[r*N+c],expected)||!same(R[r*N+c],expected)){
    printf("oracle rejected caller=%d mr=%zu N=%zu K=%zu row=%zu col=%zu got=%08x/%08x expected=%08x\n",equal,mr,N,K,r,c,bits(L[r*N+c]),bits(R[r*N+c]),bits(expected));return 21;
   }
  }
  if(memcmp(A,AS,na*4)||memcmp(W,WS,nw*4))return 22;
  for(size_t i=mr*N;i<no;i++)if(bits(L[i])!=0x4f123456||bits(R[i])!=0xcf654321)return 23;
  if(bits(LB[0])!=0x4f123456||bits(LB[no+1])!=0x4f123456||bits(RB[0])!=0xcf654321||bits(RB[no+1])!=0xcf654321)return 24;
  cases++;free(A);free(W);free(AS);free(WS);free(LB);free(RB);
 }
 printf("{\"passed\":true,\"cases\":%zu,\"output_cells\":%zu,\"input_and_inactive_output_frame_checked\":true}\n",cases,cells);return 0;
}
