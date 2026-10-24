#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fenv.h>
#include <math.h>
#include <stddef.h>
void test_neon(size_t,const float*,uint16_t*,const void*);
void test_rvv(size_t,const float*,uint16_t*,const void*);
int equivalent(size_t,const float*,uint16_t*,uint16_t*,const void*);
static uint32_t seed=0x123abcde;
static uint32_t random32(void){seed^=seed<<13;seed^=seed>>17;seed^=seed<<5;return seed;}
static uint16_t oracle(uint32_t u){
 if((u&0x7fffffffU)>0x7f800000U)return (uint16_t)(0x7e00U|((u>>16)&0x8000U));
 float f;memcpy(&f,&u,4);_Float16 h=(_Float16)f;uint16_t r;memcpy(&r,&h,2);return r;
}
int main(void){
 if(fesetround(FE_TONEAREST)!=0)return 3;
 const uint32_t edge[]={0,0x80000000,1,0x80000001,0x007fffff,0x00800000,0x33000000,0x33800000,0x387fc000,0x38800000,0x3f800000,0x3f801000,0x477fe000,0x477ff000,0x47800000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7f800001,0x7fa12345,0x7fc00000,0x7fffffff,0xff800001,0xffffffff};
 size_t cases=0,lanes=0;
 for(size_t round=0;round<2304;round++){
  size_t n=round<258?round+1:1+(random32()%257);size_t pad=n+3;
  float* a=malloc(pad*4);float* saved=malloc(pad*4);
  uint16_t* lbase=malloc((n+4)*2);uint16_t* rbase=malloc((n+4)*2);
  if(!a||!saved||!lbase||!rbase)abort();
  uint16_t* l=lbase+1;uint16_t* r=rbase+1;
  if(((uintptr_t)l&3U)!=2U||((uintptr_t)r&3U)!=2U)abort();
  for(size_t i=0;i<n+4;i++){lbase[i]=0xa55a;rbase[i]=0x5aa5;}
  for(size_t i=0;i<pad;i++){
   uint32_t u;
   if(round<32)u=edge[(round+i)%(sizeof(edge)/sizeof(edge[0]))];
   else if(round<600){uint16_t hu=(uint16_t)(round*131+i*17);_Float16 h;memcpy(&h,&hu,2);float f=(float)h;
    if(i%3==0)f=nextafterf(f,INFINITY);if(i%3==1)f=nextafterf(f,-INFINITY);memcpy(&u,&f,4);
   }else u=random32();
   memcpy(a+i,&u,4);
  }
  memcpy(saved,a,pad*4);
  if(equivalent(n,a,l,r,NULL)!=1)abort();
  for(size_t i=0;i<n;i++){
   uint32_t u;memcpy(&u,a+i,4);uint16_t want=oracle(u);
   if(l[i]!=want||r[i]!=want){
    printf("oracle mismatch n=%zu i=%zu x=%08x neon=%04x rvv=%04x oracle=%04x\n",n,i,u,l[i],r[i],want);
    fflush(stdout);free(a);free(saved);free(lbase);free(rbase);return 1;
   }
  }
  if(memcmp(a,saved,pad*4)||lbase[0]!=0xa55a||rbase[0]!=0x5aa5||lbase[n+1]!=0xa55a||rbase[n+1]!=0x5aa5||lbase[n+2]!=0xa55a||rbase[n+2]!=0x5aa5||lbase[n+3]!=0xa55a||rbase[n+3]!=0x5aa5)abort();
  free(a);free(saved);free(lbase);free(rbase);cases++;lanes+=n;
 }
 printf("%zu cases, %zu lanes per side, independent _Float16 oracle passed; guards/input unchanged\n",cases,lanes);return 0;
}
