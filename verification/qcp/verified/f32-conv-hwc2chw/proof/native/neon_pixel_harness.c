#include "runtime.h"
#include "extra.h"
#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#include "../../shim/neon3_helpers.c"
#include "../../shim/neon_rows_pixel.c"
static uint32_t px_bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static float px_float(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static float px_fixture(size_t i,unsigned p){
 static const uint32_t edge[]={0,0x80000000u,0x3f800000u,0xbf800000u,0x7f800000u,0xff800000u,0x7fc12345u,0xffc23456u,0x7f812345u,1,0x80000001u,0x7f7fffffu,0x00800000u,0x3f000000u};
 return p==0?(float)((int)((i*13+3)%17)-8)*0.25f:px_float(edge[(i*7+p*5)%14]);
}
static float px_oracle(const float *p0,const float *p1,const float *p2,const float*w,size_t N,size_t x,int lane){
 const float *p[]={p0,p1,p2};float a=w[lane];
 for(int dx=0;dx<3;dx++)for(int ci=0;ci<3;ci++)for(int ky=0;ky<3;ky++){
  long long col=(long long)(2*x)+dx-1;if(col>=(long long)N)continue;
  float v=col<0?0.0f:p[ky][3*(size_t)col+ci];
  a=fmaf(w[4+(dx*9+ci*3+ky)*4+lane],v,a);
 }
 return a;
}
static float32x4_t px_reference(const float *p0,const float *p1,const float *p2,const float*w,size_t N,size_t x){
 const float *p[]={p0,p1,p2};float32x4_t a=vld1q_f32(w);
 for(int dx=0;dx<3;dx++)for(int ci=0;ci<3;ci++)for(int ky=0;ky<3;ky++){
  long long col=(long long)(2*x)+dx-1;if(col>=(long long)N)continue;
  float32x4_t wk=vld1q_f32(w+4+(dx*9+ci*3+ky)*4);
  float32x4_t iv=col<0?vmovq_n_f32(0.0f):vld1q_dup_f32(p[ky]+3*(size_t)col+ci);
  a=vfmaq_laneq_f32(a,wk,iv,0);
 }
 return a;
}
int main(void){
 if(fesetround(FE_TONEAREST))return 3;
 const char *e=getenv("HWC_NEGATIVE");int negative=e?atoi(e):0;size_t cases=0,lanes=0;
 for(size_t N=1;N<=19;N++)for(unsigned pat=0;pat<8;pat++)for(int mode=0;mode<5;mode++){
  float *mem=malloc(512*sizeof(float)),*snapshot=malloc(512*sizeof(float));if(!mem||!snapshot)return 4;
  for(size_t i=0;i<512;i++)mem[i]=px_fixture(i,pat);memcpy(snapshot,mem,512*sizeof(float));
  const float *p0=mem,*p1=mem+128,*p2=mem+256,*w=mem+384;
  if(mode==1)p1=p2=p0;
  if(mode==2){p1=p0+1;p2=p0+2;}
  if(mode==3)w=p0;
  if(mode==4){w=p0;p1=p0+1;p2=p0+2;}
  for(size_t x=0;x<(N+1)/2;x++){
   float32x4_t a=hc_neon_rows_pixel27(p0,p1,p2,w,N,x),b=px_reference(p0,p1,p2,w,N,x);
   for(int lane=0;lane<4;lane++){
    float ref=px_oracle(p0,p1,p2,w,N,x,lane);
    if(negative && cases==0 && lane==0){a.lane[0]=ref==123.0f?124.0f:123.0f;if(negative==2)b.lane[0]=a.lane[0];}
    if(!((a.lane[lane]==ref)||(isnan(a.lane[lane])&&isnan(ref)))||!((b.lane[lane]==ref)||(isnan(b.lane[lane])&&isnan(ref)))){
     printf("mismatch N=%zu x=%zu pattern=%u mode=%d lane=%d actual=%08x reference=%08x oracle=%08x\n",N,x,pat,mode,lane,px_bits(a.lane[lane]),px_bits(b.lane[lane]),px_bits(ref));free(mem);free(snapshot);return 2;
    }
    if(!isnan(ref) && (px_bits(a.lane[lane])!=px_bits(ref)||px_bits(b.lane[lane])!=px_bits(ref))){free(mem);free(snapshot);return 5;}
    lanes++;
   }
   if(memcmp(mem,snapshot,512*sizeof(float))){free(mem);free(snapshot);return 6;}cases++;
  }
  free(mem);free(snapshot);
 }
 printf("{\"cases\":%zu,\"lanes\":%zu,\"failures\":0}\n",cases,lanes);return 0;
}
