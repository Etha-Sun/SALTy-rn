#include "intrinsics.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
int equivalent(size_t,const float*,const float*,float*,float*,const struct xnn_f32_default_params*);
int compare_outputs(size_t,const float*,const float*);
static size_t cases,lanes;
static uint32_t state=0x514379da;
static void require(int p,const char*m){if(!p){fprintf(stderr,"FAIL %s\n",m);exit(1);}}
static uint32_t randbits(void){state^=state<<13;state^=state>>17;state^=state<<5;return state;}
static void put(float*p,uint32_t x){memcpy(p,&x,4);}
static uint32_t get(const float*p){uint32_t x;memcpy(&x,p,4);return x;}
static int nanbits(uint32_t b){return (b&0x7fffffffU)>0x7f800000U;}
static int observed(uint32_t a,uint32_t b){return a==b||(nanbits(a)&&nanbits(b));}
/* Independent scalar oracle: finite binary32 product is exact in binary64.
 * Explicit conversion rounds EACH product before the binary64 add/sub step. */
static uint32_t oracle_mul(uint32_t a,uint32_t b){
 float x,y;memcpy(&x,&a,4);memcpy(&y,&b,4);volatile double exact=(double)x*(double)y;
 volatile float rounded=(float)exact;float z=rounded;uint32_t r;memcpy(&r,&z,4);return r;
}
static uint32_t oracle_addsub(uint32_t a,uint32_t b,int sub){
 float x,y;memcpy(&x,&a,4);memcpy(&y,&b,4);volatile double sum=sub?(double)x-(double)y:(double)x+(double)y;
 volatile float rounded=(float)sum;float z=rounded;uint32_t r;memcpy(&r,&z,4);return r;
}
static const uint32_t special[]={0,0x80000000,1,0x80000001,0x007fffff,0x807fffff,0x00800000,0x80800000,
 0x3f000000,0xbf000000,0x3f800000,0xbf800000,0x40000000,0xc0000000,0x7f7fffff,0xff7fffff,
 0x7f800000,0xff800000,0x7fc12345,0xffc23456,0x7fa00001,0xffa00001,0x3f800001,0x3f7ffffe};
#define NSPECIAL (sizeof(special)/sizeof(special[0]))
static void check(size_t n,unsigned mode,unsigned offset){
 float*a=malloc(4*(2*n+3)),*b=malloc(4*(2*n+3)),*left=malloc(4*(2*n+2)),*right=malloc(4*(2*n+2));
 uint32_t*aa=malloc(4*(2*n+3)),*bb=malloc(4*(2*n+3));require(a&&b&&left&&right&&aa&&bb,"allocation");
 for(size_t i=0;i<2*n+3;i++){
  aa[i]=mode==0?special[(i+offset)%NSPECIAL]:mode==1?randbits():0x3f800000;
  bb[i]=mode==0?special[(3*i+offset+5)%NSPECIAL]:mode==1?randbits():0x3f800000;
 }
 if(mode==2)for(size_t i=0;i<n;i++){aa[n+i]=0x3f800001;bb[n+i]=0x3f7ffffe;}
 for(size_t i=0;i<2*n+3;i++){put(a+i,aa[i]);put(b+i,bb[i]);}
 for(size_t i=0;i<2*n+2;i++){put(left+i,0x4d35cafe);put(right+i,0x4d35cafe);}
 struct xnn_f32_default_params params={'Q'};
 int eq=equivalent(n,a,b,left+1,right+1,&params);
#ifdef VCMUL_WRONG_SHARED_MUL
 if(mode==2)require(eq==1,"both deliberately wrong models agree");
#endif
 for(size_t i=0;i<n;i++){
  uint32_t re=oracle_addsub(oracle_mul(aa[i],bb[i]),oracle_mul(aa[n+i],bb[n+i]),1);
  uint32_t im=oracle_addsub(oracle_mul(aa[i],bb[n+i]),oracle_mul(aa[n+i],bb[i]),0);
  if(!observed(get(left+1+i),re)||!observed(get(right+1+i),re)||!observed(get(left+1+n+i),im)||!observed(get(right+1+n+i),im)){
   fprintf(stderr,"oracle mismatch n=%zu lane=%zu mode=%u ar=%08x ai=%08x br=%08x bi=%08x real L=%08x R=%08x expected=%08x imag L=%08x R=%08x expected=%08x\n",n,i,mode,aa[i],aa[n+i],bb[i],bb[n+i],get(left+1+i),get(right+1+i),re,get(left+1+n+i),get(right+1+n+i),im);exit(1);
  }
 }
 require(eq==1,"public full 2*n observation");
 require(memcmp(a,aa,4*(2*n+3))==0&&memcmp(b,bb,4*(2*n+3))==0,"planar input and padding frame");
 require(get(left)==0x4d35cafe&&get(left+2*n+1)==0x4d35cafe&&get(right)==0x4d35cafe&&get(right+2*n+1)==0x4d35cafe,"output frame");
 require(params._=='Q',"params frame");
 if(mode==2){for(size_t i=0;i<n;i++)require(get(left+1+i)==0&&get(left+1+n+i)==0x40000000,"known nonfused complex result");}
 cases++;lanes+=2*n;free(bb);free(aa);free(right);free(left);free(b);free(a);
}
int main(int argc,char**argv){
 uint32_t endian=1;require(sizeof(void*)==8&&((unsigned char*)&endian)[0]==1,"LP64 little endian");
 require(fesetround(FE_TONEAREST)==0&&fegetround()==FE_TONEAREST,"RNE");
 require(oracle_mul(1,0x3f800000)==1,"gradual underflow");
 if(argc>1&&(!strcmp(argv[1],"--fused-control")||!strcmp(argv[1],"--shared-model-control"))){check(1,2,0);return 2;}
 for(size_t n=1;n<=70;n++){for(unsigned r=0;r<4;r++)check(n,1,r);check(n,0,(unsigned)n);check(n,2,0);}
 const size_t extra[]={95,96,97,127,128,129,257,1025};
 for(size_t i=0;i<sizeof(extra)/sizeof(extra[0]);i++){check(extra[i],0,(unsigned)i);check(extra[i],1,0);check(extra[i],2,0);}
 for(unsigned i=0;i<NSPECIAL;i++)check(1,0,i);
 float wrong[1],correct[1];put(wrong,0x3f800000);put(correct,0x40000000);
 require(compare_outputs(1,wrong,correct)==0,"wrong-result control");
 printf("{\"passed\":true,\"cases\":%zu,\"output_lanes_per_side\":%zu,\"known_two_rounding_result_checked\":true,\"wrong_result_rejected\":true}\n",cases,lanes);
 return 0;
}
