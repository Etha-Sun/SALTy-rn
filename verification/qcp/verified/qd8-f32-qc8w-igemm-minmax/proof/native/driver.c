#pragma STDC FENV_ACCESS ON
#include "shim.h"
#define XNN_UNPREDICTABLE(x) (x)
#include <stdlib.h>
#include <stdio.h>
#include <fenv.h>
#include "unit.c"
static uint32_t seed=0x4dca9901;
static uint32_t next(void){seed^=seed<<13;seed^=seed>>17;seed^=seed<<5;return seed;}
static float bits(uint32_t u){float f;memcpy(&f,&u,4);return f;}
static uint32_t asbits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static float sample(unsigned mode){
 static uint32_t edge[]={0,0x80000000,0x3f800000,0xbf800000,0x7f800000,0xff800000,0x7fc00000,0x7f800001,1,0x80000001,0x7f7fffff,0xff7fffff,0x00800000,0x80800000,0x3f800001,0x3f7fffff};
 if(mode==0)return (float)((int32_t)(next()%33)-16)*0.125f;
 return bits(mode==1?next():edge[next()%(sizeof(edge)/4)]);
}
static int equal(float a,float b){return a==b||(isnan(a)&&isnan(b));}
static float reference(size_t col,size_t kc,size_t entries,const int8_t**table,
 size_t off,const int8_t*zero,const int8_t*zd,const unsigned char*w,
 struct xnn_f32_minmax_params p,struct xnn_qd8_quantization_params qp){
 size_t terms=entries*kc,lane=col%8;const unsigned char*b=w+(col/8)*(96+8*terms);
 int32_t ks;float scale,bias;memcpy(&ks,b+lane*4,4);memcpy(&scale,b+32+8*terms+lane*4,4);memcpy(&bias,b+64+8*terms+lane*4,4);
 uint32_t acc=(uint32_t)((uint64_t)u32bits(ks)*(uint64_t)u32bits(qp.zero_point));
 for(size_t j=0;j<entries;j++){
  const int8_t*input=table[j]==zero?zd:table[j]+off;
  for(size_t d=0;d<kc;d++){int8_t wt;memcpy(&wt,b+32+(j*kc+d)*8+lane,1);acc+=(uint32_t)((int32_t)input[d]*(int32_t)wt);}
 }
 float v=i32_f32(i32bits(acc));v=round_mul(v,qp.inv_scale);v=fmaf(v,scale,bias);
 return neon_min(neon_max(v,p.scalar.min),p.scalar.max);
}
static int one(size_t nc,size_t kc,size_t entries,size_t off,unsigned pattern,unsigned mode,size_t*obs){
 size_t terms=entries*kc,wb=((nc+7)/8)*(96+8*terms),ab=off+kc+7+2;
 int8_t*pool[4],*save[4];for(int j=0;j<4;j++){pool[j]=malloc(ab);save[j]=malloc(ab);assert(pool[j]&&save[j]);for(size_t d=0;d<ab;d++)pool[j][d]=(int8_t)next();memcpy(save[j],pool[j],ab);}
 int8_t token=37;const int8_t**table=malloc(entries*sizeof(void*)),**tsave=malloc(entries*sizeof(void*));
 unsigned char*w=malloc(wb),*wsave=malloc(wb);float*left=malloc((nc+4)*4),*right=malloc((nc+4)*4);assert(table&&tsave&&w&&wsave&&left&&right);
 for(size_t j=0;j<entries;j++){
  if(pattern==0)table[j]=pool[j%3];
  else if(pattern==1)table[j]=(j%2)?pool[j%3]:&token;
  else if(pattern==2)table[j]=&token;
  else if(pattern==3)table[j]=(j%2)?pool[j%3]:pool[3];
  else if(pattern==4)table[j]=pool[0]+(j%3);
  else table[j]=(j%3)?pool[3]+(j%2):&token;
 }
 memcpy(tsave,table,entries*sizeof(void*));
 for(size_t j=0;j<wb;j++)w[j]=(unsigned char)next();
 for(size_t b=0;b<(nc+7)/8;b++)for(size_t j=0;j<8;j++){
  int32_t ks=mode?i32bits(next()):(int32_t)(next()%255)-127;float scale=sample(mode),bias=sample(mode);
  memcpy(w+b*(96+8*terms)+j*4,&ks,4);memcpy(w+b*(96+8*terms)+32+8*terms+j*4,&scale,4);memcpy(w+b*(96+8*terms)+64+8*terms+j*4,&bias,4);
 }
 memcpy(wsave,w,wb);struct xnn_f32_minmax_params p=mode?(struct xnn_f32_minmax_params){{sample(mode),sample(mode)}}:(struct xnn_f32_minmax_params){{-INFINITY,INFINITY}};
 struct xnn_qd8_quantization_params q={mode?i32bits(next()):0,sample(mode)};
 for(size_t i=0;i<nc+4;i++)left[i]=right[i]=bits(0x5a7e9911);
 int ok=equivalent(1,nc,kc,entries*sizeof(void*),table,w,left,right,off,&token,pool[3],&p,&q);
 for(size_t i=0;i<nc;i++){
  float r=reference(i,kc,entries,table,off,&token,pool[3],w,p,q);(*obs)++;
  if(!ok||!equal(left[i],r)||!equal(right[i],r)){
   fprintf(stderr,"mismatch nc=%zu kc=%zu ks_bytes=%zu entries=%zu a_offset=%zu pattern=%u mode=%u col=%zu left=%08x right=%08x ref=%08x seed=%08x\n",nc,kc,entries*8,entries,off,pattern,mode,i,asbits(left[i]),asbits(right[i]),asbits(r),seed);return 0;
  }
 }
 for(size_t i=nc;i<nc+4;i++)if(asbits(left[i])!=0x5a7e9911||asbits(right[i])!=0x5a7e9911)return 0;
 for(int j=0;j<4;j++){if(memcmp(pool[j],save[j],ab))return 0;free(pool[j]);free(save[j]);}
 if(memcmp(table,tsave,entries*sizeof(void*))||memcmp(w,wsave,wb)||token!=37)return 0;
 free(table);free(tsave);free(w);free(wsave);free(left);free(right);return 1;
}
int main(void){
 if(fesetround(FE_TONEAREST))return 3;
 const size_t depths[]={1,2,3,4,5,6,7,8,9,15,16,17,31,32,33},es[]={1,2,5},offsets[]={0,1,7};
 size_t cases=0,obs=0;
 for(size_t nc=1;nc<=17;nc++)for(size_t k=0;k<sizeof(depths)/sizeof(size_t);k++)for(unsigned e=0;e<3;e++)for(unsigned o=0;o<3;o++)for(unsigned pat=0;pat<6;pat++)for(unsigned m=0;m<3;m++){
  if(!one(nc,depths[k],es[e],offsets[o],pat,m,&obs))return 1;cases++;
 }
 printf("PASS cases=%zu observations=%zu repeated_entry_and_zero_data_alias=covered input_table_frame=checked output_suffix_frame=checked seed_initial=4dca9901\n",cases,obs);return 0;
}
