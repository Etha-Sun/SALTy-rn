#include "host.h"
#include <stdlib.h>
#include <stdio.h>
#include <fenv.h>
#include <float.h>
void test_neon(size_t,size_t,const float**,const float*,float*,intptr_t,size_t,size_t,size_t,const float*,const struct xnn_f32_minmax_params*);
void test_rvv(size_t,size_t,const float**,const float*,float*,intptr_t,size_t,size_t,size_t,const float*,const struct xnn_f32_minmax_params*);
static uint32_t rng=0x51d2bf34U;
static uint32_t random_bits(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static uint32_t patterns[]={0,0x80000000,1,0x80000001,0x007fffff,0x807fffff,0x00800000,0x80800000,0x3f800000,0xbf800000,0x40000000,0xc0000000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7f800001,0xff800001,0x7fc12345,0xffc12345,0x3f800001,0x3f7fffff};
static float data(unsigned pattern,size_t i){if(pattern<6)return dw_value(patterns[(i+pattern*5)%(sizeof(patterns)/sizeof(*patterns))]);if(pattern<9)return(float)((int)(i%17)-8);return dw_value(random_bits());}
static int nan_ref(float x){uint32_t u;memcpy(&u,&x,4);return((u>>23)&255)==255&&(u&0x7fffffU)!=0;}
static int observed_same(float x,float y){return(x==y)||(nan_ref(x)&&nan_ref(y));}
static float reference_lane(float bias,float i0,float k0,float i1,float k1,float i2,float k2,float lo,float hi){volatile float product1=i1*k1;volatile float first=fmaf(i0,k0,bias);volatile float second=fmaf(i2,k2,first);volatile float sum=second+product1;if(nan_ref(sum)||nan_ref(lo)||nan_ref(hi))return dw_value(0x7fc00000U);return fminf(fmaxf(sum,lo),hi);}
static int one(size_t channels,size_t pixels,unsigned mode,unsigned pattern){
 size_t rowlen=channels+3+4+pixels*3,wn=16*((channels+3)/4),tn=3*pixels+4,gap=mode%3;
 size_t outn=pixels*(channels+gap)+2;int repeat=mode==5;size_t increment=repeat?(size_t)(0-channels*4):gap*4;
 float*rows=malloc(5*rowlen*4),*snap=malloc(5*rowlen*4),*w=malloc(wn*4),*ws=malloc(wn*4),*left=malloc(outn*4),*right=malloc(outn*4),*gold=malloc(outn*4);const float**table=malloc(tn*sizeof(float*));const float**ts=malloc(tn*sizeof(float*));
 if(!rows||!snap||!w||!ws||!left||!right||!gold||!table||!ts){free(rows);free(snap);free(w);free(ws);free(left);free(right);free(gold);free(table);free(ts);return 2;}
 int ok=1;
 for(size_t i=0;i<5*rowlen;i++)rows[i]=data(pattern,i);
 for(size_t i=0;i<wn;i++)w[i]=data((pattern+2)%12,i+7);
 for(size_t i=0;i<outn;i++)left[i]=right[i]=gold[i]=dw_value(0x5a123456U);
 const float*zero=mode==0?NULL:rows+4*rowlen;
 for(size_t i=0;i<tn;i++)table[i]=(mode==4?rows:mode==5&&i%3==0?zero:rows+(i%4)*rowlen);
 intptr_t stride=mode==1?-24:mode==2?0:mode==3?8:24;const float**start=table+(mode==1?3*(pixels-1):0);
 size_t initial_offset=(mode%3)*4,pixel_stride=(mode%2)*12;
 struct xnn_f32_minmax_params params;params.scalar.min=data(pattern+1,3);params.scalar.max=data(pattern+1,6);
 if(pattern==0){params.scalar.min=-INFINITY;params.scalar.max=INFINITY;}
 if(pattern==1){params.scalar.min=dw_value(0x7f800001U);params.scalar.max=1;}
 if(pattern==2){params.scalar.min=-1;params.scalar.max=dw_value(0xffc12345U);}
 if(pattern==3){params.scalar.min=5;params.scalar.max=-5;}
 if(pattern==0&&mode==0&&pixels==1&&channels==1){rows[0]=2;rows[rowlen]=rows[2*rowlen]=0;w[0]=0;w[4]=1;w[8]=w[12]=0;}
 memcpy(snap,rows,5*rowlen*4);memcpy(ws,w,wn*4);memcpy(ts,table,tn*sizeof(float*));struct xnn_f32_minmax_params ps=params;
 const float**ip=start;size_t offset=initial_offset;size_t outbase=1;
 for(size_t p=0;p<pixels;p++){
  const float*a=ip[0],*b=ip[1],*d=ip[2];if(a!=zero)a=(const float*)((uintptr_t)a+offset);if(b!=zero)b=(const float*)((uintptr_t)b+offset);if(d!=zero)d=(const float*)((uintptr_t)d+offset);
  for(size_t c=0;c<channels;c++){size_t block=16*(c/4),lane=c%4;gold[outbase+c]=reference_lane(w[block+lane],a[c],w[block+4+lane],b[c],w[block+8+lane],d[c],w[block+12+lane],params.scalar.min,params.scalar.max);}
  ip=(const float**)((uintptr_t)ip+stride);offset+=pixel_stride;if(!repeat)outbase+=channels+gap;
 }
 test_neon(channels,pixels,start,w,left+1,stride,increment,initial_offset,pixel_stride,zero,&params);
 test_rvv(channels,pixels,start,w,right+1,stride,increment,initial_offset,pixel_stride,zero,&params);
 for(size_t i=0;i<outn;i++)if(!observed_same(left[i],gold[i])||!observed_same(right[i],gold[i])){fprintf(stderr,"oracle mismatch channels=%zu pixels=%zu mode=%u pattern=%u slot=%zu neon=%08x rvv=%08x oracle=%08x\n",channels,pixels,mode,pattern,i,dw_bits(left[i]),dw_bits(right[i]),dw_bits(gold[i]));ok=0;break;}
 if(memcmp(rows,snap,5*rowlen*4)||memcmp(w,ws,wn*4)||memcmp(table,ts,tn*sizeof(float*))||memcmp(&params,&ps,sizeof(params))){fprintf(stderr,"readonly frame mismatch\n");ok=0;}
 free(rows);free(snap);free(w);free(ws);free(left);free(right);free(gold);free(table);free(ts);fflush(stderr);return ok?0:1;
}
int main(void){if(sizeof(float)!=4||sizeof(size_t)!=8||sizeof(uintptr_t)!=8||FLT_EVAL_METHOD!=0||fesetround(FE_TONEAREST))return 2;size_t cases=0,lanes=0;
 for(unsigned pattern=0;pattern<12;pattern++)for(unsigned mode=0;mode<6;mode++)for(size_t pixels=1;pixels<=4;pixels++)for(size_t c=1;c<=65;c++){int r=one(c,pixels,mode,pattern);if(r)return r;cases++;lanes+=c*pixels;}
 printf("%zu cases, %zu lanes per side, independent packed4 acc2 scalar oracle passed\n",cases,lanes);return 0;}
