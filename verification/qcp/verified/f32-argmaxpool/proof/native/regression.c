#include "isa_arrays.h"
#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include <inttypes.h>
#define AP_ARGS size_t pixels,size_t elements,size_t channels,const float**input,size_t offset,size_t pixel_stride,float*output,uint32_t*index,size_t input_increment,size_t output_increment,size_t index_increment
void test_neon(AP_ARGS); void test_rvv(AP_ARGS);
void original_neon(AP_ARGS); void original_rvv(AP_ARGS);
_Static_assert(sizeof(size_t)==8 && sizeof(void*)==8 && sizeof(uint32_t)==4 && sizeof(float)==4,"selected native widths");
_Static_assert(FLT_RADIX==2 && FLT_MANT_DIG==24 && FLT_MAX_EXP==128,"binary32 native diagnostic");
static uint64_t cases,lanes;
/* Independent raw IEEE ordered comparison; no emulated intrinsic is used. */
static int greater_bits(uint32_t a,uint32_t b){
  if(((a&0x7f800000u)==0x7f800000u&&(a&0x7fffffu)) ||
     ((b&0x7f800000u)==0x7f800000u&&(b&0x7fffffu)))return 0;
  if(((a|b)&0x7fffffffu)==0)return 0;
  uint32_t ka=a&0x80000000u?~a:a^0x80000000u;
  uint32_t kb=b&0x80000000u?~b:b^0x80000000u;
  return ka>kb;
}
static uint32_t random_state=0x72831a95u;
static uint32_t next_bits(void){random_state=random_state*1664525u+1013904223u;return random_state;}
static void* alloc(size_t n){void*p=malloc(n);if(!p)abort();return p;}
static uint64_t digest(const void*p,size_t n){const unsigned char*b=p;uint64_t h=1469598103934665603ULL;for(size_t j=0;j<n;j++)h=(h^b[j])*1099511628211ULL;return h;}
static const uint32_t edges[]={0,0x80000000u,1,0x80000001u,0x007fffffu,0x807fffffu,0x00800000u,0x80800000u,0x3f800000u,0xbf800000u,0x7f7fffffu,0xff7fffffu,0x7f800000u,0xff800000u,0x7fc00001u,0xffc12345u,0x7f800001u,0xff800001u};
static int run_case(size_t pixels,size_t elements,size_t channels,unsigned pattern,int negative){
  const size_t table_step=elements+2,off=pattern%3,ps=pattern%4;
  const size_t inlen=off+(pixels-1)*ps+channels+3;
  const size_t outstep=channels+3+(pattern%3),idxstep=channels+3+((pattern+1)%3);
  const size_t outlen=pixels*outstep+4,idxlen=pixels*idxstep+4;
  float*data[5];for(size_t j=0;j<5;j++){data[j]=alloc(4*inlen);for(size_t z=0;z<inlen;z++){uint32_t b=pattern<5?edges[(pattern*3+j+z)%18]:next_bits();memcpy(data[j]+z,&b,4);}}
  const float**input=alloc(sizeof(float*)*pixels*table_step);
  for(size_t p=0;p<pixels;p++)for(size_t k=0;k<table_step;k++)input[p*table_step+k]=data[(k+(pattern%5))%5];
  uint64_t before[6];for(size_t j=0;j<5;j++)before[j]=digest(data[j],4*inlen);before[5]=digest(input,sizeof(float*)*pixels*table_step);
  float *left=alloc(4*outlen),*right=alloc(4*outlen);uint32_t *li=alloc(4*idxlen),*ri=alloc(4*idxlen);
  const uint32_t sentinel=0x7fc29183u,isent=0xac32ab19u;
  for(size_t j=0;j<outlen;j++){memcpy(left+j,&sentinel,4);memcpy(right+j,&sentinel,4);}
  for(size_t j=0;j<idxlen;j++)li[j]=ri[j]=isent;
  test_neon(pixels,elements,channels,input,off*4,ps*4,left,li,table_step*sizeof(void*),outstep*4,idxstep*4);
  test_rvv(pixels,elements,channels,input,off*4,ps*4,right,ri,table_step*sizeof(void*),outstep*4,idxstep*4);
  if(negative){uint32_t b=ap_bits(left[0])^1u;memcpy(left,&b,4);if(negative==2)memcpy(right,&b,4);}
  int ok=1,agrees=1;
  for(size_t p=0;p<pixels;p++)for(size_t c=0;c<channels;c++){
    uint32_t best=ap_bits(input[p*table_step][off+p*ps+c]),which=0;
    for(size_t k=1;k<elements;k++){uint32_t v=ap_bits(input[p*table_step+k][off+p*ps+c]);if(greater_bits(v,best)){best=v;which=(uint32_t)k;}}
    size_t o=p*outstep+c,i=p*idxstep+c;uint32_t l=ap_bits(left[o]),r=ap_bits(right[o]);
    if(l!=best||r!=best||li[i]!=which||ri[i]!=which)ok=0;
    if(l!=r||li[i]!=ri[i])agrees=0;
  }
  for(size_t j=0;j<outlen;j++)if(j/outstep>=pixels||j%outstep>=channels)if(ap_bits(left[j])!=sentinel||ap_bits(right[j])!=sentinel)abort();
  for(size_t j=0;j<idxlen;j++)if(j/idxstep>=pixels||j%idxstep>=channels)if(li[j]!=isent||ri[j]!=isent)abort();
  for(size_t j=0;j<5;j++)if(before[j]!=digest(data[j],4*inlen))abort();if(before[5]!=digest(input,sizeof(float*)*pixels*table_step))abort();
  for(size_t j=0;j<5;j++)free(data[j]);free(input);free(left);free(right);free(li);free(ri);
  if(negative){printf("negative comparator=%d oracle_rejected=%d\n",agrees,!ok);return !ok?2:1;}
  if(!ok){fprintf(stderr,"failure pixels=%zu elements=%zu channels=%zu pattern=%u\n",pixels,elements,channels,pattern);return 1;}
  cases++;lanes+=pixels*channels;return 0;
}
static int large_original(void){
  const size_t elements=(size_t)2147483648ULL;
  const float a[4]={1,1,1,1};const float**input=alloc(elements*sizeof(void*));
  for(size_t k=0;k<elements;k++)input[k]=a;
  float left[4]={0,0,0,0},right[4]={0,0,0,0};uint32_t li[4]={0},ri[4]={0};
  original_neon(1,elements,1,input,0,0,left,li,elements*sizeof(void*),16,16);
  original_rvv(1,elements,1,input,0,0,right,ri,elements*sizeof(void*),16,16);
  uint32_t l=ap_bits(left[0]),r=ap_bits(right[0]);
  int observed=(int)elements<0 && l==0 && r==0 && li[0]==0 && ri[0]==0;
  printf("{\"pooling_elements\":%zu,\"input_pointer_table_bytes\":%zu,\"all_entries_valid_and_equal\":true,\"int_k\":%d,\"expected_value_bits\":1065353216,\"expected_index\":0,\"neon_value_bits\":%u,\"rvv_value_bits\":%u,\"both_equal_but_wrong\":%s}\n",elements,elements*sizeof(void*),(int)elements,l,r,observed?"true":"false");
  free(input);return observed?0:1;
}
int main(int argc,char**argv){
  if(argc>1&&strcmp(argv[1],"--large-original")==0)return large_original();
  if(argc>1&&strcmp(argv[1],"--negative-one")==0)return run_case(2,19,33,7,1);
  if(argc>1&&strcmp(argv[1],"--negative-both")==0)return run_case(2,19,33,7,2);
  const size_t channels[]={1,2,3,4,5,7,8,15,16,17,31,32,33,63,64,65};
  const size_t elements[]={1,2,8,9,10,17,18,19,27};
  for(size_t p=1;p<=3;p++)for(size_t k=0;k<9;k++)for(size_t c=0;c<16;c++)for(unsigned pattern=0;pattern<10;pattern++)if(run_case(p,elements[k],channels[c],pattern,0))return 1;
  printf("{\"cases\":%"PRIu64",\"lanes_per_side\":%"PRIu64",\"failures\":0,\"observation\":\"exact output bits and uint32 index\",\"oracle\":\"independent integer IEEE ordering\"}\n",cases,lanes);return 0;
}
