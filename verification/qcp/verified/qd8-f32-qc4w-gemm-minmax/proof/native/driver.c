#include "repaired.c"
#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
static uint32_t rng=0xa714e35;
static uint32_t next(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static float fb(uint32_t x){float f;memcpy(&f,&x,4);return f;}
static uint32_t bf(float f){uint32_t x;memcpy(&x,&f,4);return x;}
static float sample(unsigned mode){static const uint32_t sp[]={0,0x80000000,1,0x80000001,0x7f800000,0xff800000,0x7f800001,0x7fc00000,0xffc12345,0x7f7fffff,0x3f800000,0xbf800000};uint32_t x=next();if(mode==0)return(float)((int)(x%17)-8)*0.25f;if(mode==1)x=sp[x%(sizeof(sp)/sizeof(*sp))];return fb(x);}
static float oracle(size_t col,size_t KR,const int8_t*A,const unsigned char*W,int32_t zp,float inv,float lo,float hi){
 size_t panel=col/16,lane=col%16,bytes=192+8*KR;const unsigned char*p=W+panel*bytes;
 uint32_t acc;memcpy(&acc,p+4*lane,4);acc*=((uint32_t)zp);
 for(size_t k=0;k<KR;k++){unsigned v=p[64+16*(k/2)+lane];int w=(k&1)?(v>>4):(v&15);if(w>=8)w-=16;acc+=(uint32_t)((int32_t)A[k]*(w*16));}
 int64_t signed_acc=(acc&0x80000000u)?(int64_t)acc-4294967296LL:(int64_t)acc;
 int32_t shifted=(int32_t)((signed_acc-(signed_acc<0?15:0))/16);
 volatile float converted=(float)shifted;volatile float scaled=converted*inv;float scale,bias;memcpy(&scale,p+64+8*KR+4*lane,4);memcpy(&bias,p+128+8*KR+4*lane,4);float out=fmaf(scaled,scale,bias);
 if(isnan(out)||isnan(lo)||isnan(hi))return fb(0x7fc00000);out=fmaxf(out,lo);return fminf(out,hi);
}
static int same(float a,float b){return a==b||(isnan(a)&&isnan(b));}
int main(void){if(fesetround(FE_TONEAREST))return 2;size_t count=0,cells=0;
 for(size_t N=1;N<=33;N++)for(size_t K=1;K<=19;K++)for(unsigned mode=0;mode<3;mode++){
  size_t KR=(K+1)&~(size_t)1,na=(KR+7)&~(size_t)7,nb=((N+15)/16)*(192+8*KR),no=((N+15)/16)*16;
  int8_t*A=malloc(na),*AS=malloc(na);unsigned char*W=malloc(nb),*WS=malloc(nb);float*L=malloc(4*(no+2)),*R=malloc(4*(no+2));if(!A||!AS||!W||!WS||!L||!R)return 3;
  for(size_t i=0;i<na;i++)A[i]=bits8(next());for(size_t i=0;i<nb;i++)W[i]=(unsigned char)next();
  for(size_t b=0;b<(N+15)/16;b++)for(size_t i=0;i<32;i++){float x=sample(mode);memcpy(W+b*(192+8*KR)+64+8*KR+4*i,&x,4);}
  for(size_t i=0;i<no+2;i++){L[i]=fb(0x4f123456);R[i]=fb(0xcf654321);}memcpy(AS,A,na);memcpy(WS,W,nb);
  uint32_t zpraw=next();int32_t zp;memcpy(&zp,&zpraw,4);float inv=sample(mode),lo=sample(mode),hi=sample(mode);struct xnn_qd8_quantization_params q={zp,inv};struct xnn_f32_qc4w_minmax_params p={{lo,hi,0}};
  test_neon(1,N,K,A,0,W,L+1,0,64,&p,&q);test_rvv(1,N,K,A,0,W,R+1,0,64,&p,&q);
  for(size_t i=0;i<N;i++){float e=oracle(i,KR,A,W,zp,inv,lo,hi);cells++;if(!same(L[1+i],e)||!same(R[1+i],e)){printf("fail N=%zu K=%zu mode=%u col=%zu got=%08x/%08x expected=%08x\n",N,K,mode,i,bf(L[1+i]),bf(R[1+i]),bf(e));return 21;}}
  if(memcmp(A,AS,na)||memcmp(W,WS,nb))return 22;
  for(size_t i=N+1;i<no+2;i++)if(bf(L[i])!=0x4f123456||bf(R[i])!=0xcf654321)return 23;
  if(bf(L[0])!=0x4f123456||bf(R[0])!=0xcf654321)return 24;
  free(A);free(AS);free(W);free(WS);free(L);free(R);count++;
 }
 printf("{\"passed\":true,\"cases\":%zu,\"output_cells\":%zu}\n",count,cells);return 0;}
