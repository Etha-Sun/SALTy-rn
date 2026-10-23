#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <assert.h>
struct xnn_qs8_rsum_params { char _; };
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#ifdef RSUM_SIGNED
typedef int8_t input_t;typedef int32_t out_t;
#else
typedef uint8_t input_t;typedef uint32_t out_t;
#endif
void test_neon(unsigned long long,const input_t*,out_t*,const struct xnn_qs8_rsum_params*);
void test_rvv(unsigned long long,const input_t*,out_t*,const struct xnn_qs8_rsum_params*);
int equivalent(unsigned long long,const input_t*,out_t*,out_t*,const struct xnn_qs8_rsum_params*);
static uint32_t random_word=0x937781a5;
static uint32_t rng(void){random_word^=random_word<<13;random_word^=random_word>>17;random_word^=random_word<<5;return random_word;}
static out_t initial_value(uint32_t x){
#ifdef RSUM_SIGNED
 return native_s32(x);
#else
 return x;
#endif
}
int main(int argc,char**argv){
 const size_t ns[]={1,2,3,7,8,15,16,17,31,32,33,63,64,65,127,128,129,255,256,257,511,512,513,2047,2048,2049,2063,2064,2065,4095,4096,4097,8193};
 const uint32_t initials[]={0,1,2147483647U,2147483648U,4294967295U};
 unsigned long checks=0,lanes=0;
 if(argc>1){input_t input[16]={1};out_t result=initial_value(2147483647U);struct xnn_qs8_rsum_params p={0};if(argv[1][0]=='n')test_neon(1,input,&result,&p);else test_rvv(1,input,&result,&p);printf("result_bits=%"PRIu32"\n",(uint32_t)result);return 0;}
 for(size_t k=0;k<sizeof ns/sizeof *ns;k++)for(unsigned pattern=0;pattern<6;pattern++)for(unsigned z=0;z<5;z++){
  size_t n=ns[k];input_t*input=malloc(n+15),*before=malloc(n+15);if(!input||!before)abort();
  for(size_t i=0;i<n+15;i++){
#ifdef RSUM_SIGNED
   input[i]=pattern==0?-128:pattern==1?127:pattern==2?1:pattern==3?(i%2?-128:127):native_s8(rng());
#else
   input[i]=pattern==0?0:pattern==1?255:pattern==2?1:pattern==3?(i%2?0:255):(uint8_t)rng();
#endif
  }
  memcpy(before,input,n+15);out_t left[3]={initial_value(0xa5757575),initial_value(initials[z]),initial_value(0x93738373)},right[3];memcpy(right,left,sizeof left);struct xnn_qs8_rsum_params p={42},saved=p;
  uint32_t expected=initials[z];for(size_t i=0;i<n;i++)expected+=(uint32_t)(int32_t)input[i];
  test_neon(n,input,left+1,&p);test_rvv(n,input,right+1,&p);
  #ifdef RSUM_NEGATIVE_CONTROL
  left[1]^=1;
  #endif
  if((uint32_t)left[1]!=expected||(uint32_t)right[1]!=expected||memcmp(before,input,n+15)||memcmp(&p,&saved,sizeof p)||memcmp(&left[0],&right[0],sizeof(out_t))||memcmp(&left[2],&right[2],sizeof(out_t))||(uint32_t)left[0]!=0xa5757575||(uint32_t)left[2]!=0x93738373)abort();
  out_t wl[3]={initial_value(0xa5757575),initial_value(initials[z]),initial_value(0x93738373)},wr[3];memcpy(wr,wl,sizeof wl);
  if(equivalent(n,input,wl+1,wr+1,&p)!=1||(uint32_t)wl[1]!=expected||(uint32_t)wr[1]!=expected||memcmp(before,input,n+15)||memcmp(&p,&saved,sizeof p)||(uint32_t)wl[0]!=0xa5757575||(uint32_t)wr[0]!=0xa5757575||(uint32_t)wl[2]!=0x93738373||(uint32_t)wr[2]!=0x93738373)abort();
  checks++;lanes+=n;free(input);free(before);
 }
 printf("{\"cases\":%lu,\"lanes_per_side\":%lu,\"failures\":0,\"input_and_params_preserved\":true,\"canaries_checked\":true}\n",checks,lanes);return 0;
}
