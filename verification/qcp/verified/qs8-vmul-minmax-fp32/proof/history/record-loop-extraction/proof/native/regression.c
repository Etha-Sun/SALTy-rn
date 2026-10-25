#ifdef QM_FIELD_BACKEND
#include "isa_fields.h"
#else
#include "isa_arrays.h"
#endif
#include "../../shim/load_into.c"
#include <stdio.h>
#include <stdlib.h>
#include <float.h>
_Static_assert(sizeof(float)==4 && FLT_RADIX==2 && FLT_MANT_DIG==24,"binary32 required");
#define test_neon repaired_neon
#include "../../impl/testNEON.c"
#undef test_neon
#define test_rvv repaired_rvv
#include "../../impl/testRVV.c"
#undef test_rvv
#ifdef QM_FIELD_BACKEND
#include "field_kernels.h"
#define test_neon field_neon
#define test_rvv field_rvv
#else
#define test_neon repaired_neon
#define test_rvv repaired_rvv
#endif
#include "../../spec.c"
#undef test_neon
#undef test_rvv
/* Independent scalar oracle: no vector intrinsics, qcp helper, or qm_sat*
   function. Explicit NaN-scale branch follows ARM AH/DN=0 propagation; other
   NaNs arise only from 0*Inf and use the positive default NaN. */
static int8_t reference(int av,int bv,const union xnn_qs8_mul_minmax_params*p){
 uint32_t sb,bits;memcpy(&sb,&p->scalar.scale,4);
 if((sb&0x7fffffffU)>0x7f800000U){bits=sb|0x00400000U;}else{
  int prod=(av-p->scalar.a_zero_point)*(bv-p->scalar.b_zero_point);
  volatile float scaled=(float)prod*p->scalar.scale;float temp=scaled;uint32_t tb;memcpy(&tb,&temp,4);
  if((tb&0x7fffffffU)>0x7f800000U){tb=0x7fc00000U;memcpy(&temp,&tb,4);}
  volatile float biased=temp+12582912.0f;temp=biased;memcpy(&bits,&temp,4);
 }
 int64_t z=bits<0x80000000U?(int64_t)bits:(int64_t)bits-4294967296LL;
 z-=1262485504LL-p->scalar.output_zero_point;
 if(z>2147483647LL)z=2147483647LL;if(z<(-2147483647LL-1))z=(-2147483647LL-1);
 if(z>32767)z=32767;if(z< -32768)z=-32768;
 if(z>127)z=127;if(z< -128)z=-128;
 if(z<p->scalar.output_min)z=p->scalar.output_min;
 if(z>p->scalar.output_max)z=p->scalar.output_max;
 return(int8_t)z;
}
static uint32_t seed=0x5f3759dfU;
static uint32_t random32(void){seed=seed*1664525U+1013904223U;return seed;}
static int8_t signed_byte(unsigned x){x&=255U;return(int8_t)(x<128U?(int)x:(int)x-256);}
static uint64_t cases,lanes,alias_cases,shared_input_cases;
static int one(size_t n,unsigned config,uint32_t scale,int16_t oz,int pairbase){
 int8_t aa[560],bb[560],left[400],right[400],oldaa[560],oldbb[560];
 for(size_t i=0;i<560;i++){aa[i]=signed_byte(random32()>>16);bb[i]=signed_byte(random32()>>16);}
 const int8_t*a=aa+7;const int8_t*b=bb+11;
 if(config%3==0){b=a;shared_input_cases++;}else if(config%3==1){b=aa+10;alias_cases++;}
 if(pairbase>=0){a=aa+7;b=bb+11;for(size_t j=0;j<n;j++){unsigned v=(unsigned)(pairbase+(int)j);aa[7+j]=signed_byte(v>>8);bb[11+j]=signed_byte(v);}}
 memcpy(oldaa,aa,560);memcpy(oldbb,bb,560);memset(left,90,400);memset(right,90,400);
 union xnn_qs8_mul_minmax_params p={0};p.scalar.a_zero_point=signed_byte(config);p.scalar.b_zero_point=signed_byte(config*73+11);memcpy(&p.scalar.scale,&scale,4);p.scalar.output_zero_point=oz;
 static const int8_t bounds[][2]={{-128,127},{-127,126},{0,0},{127,-128},{-1,1},{1,-1},{-128,-127},{126,127}};
 p.scalar.output_min=bounds[(config>>3)&7][0];p.scalar.output_max=bounds[(config>>3)&7][1];union xnn_qs8_mul_minmax_params before=p;
 int eq=equivalent(n,a,b,left+5,right+5,&p);
 if(eq!=(memcmp(left+5,right+5,n)==0)){fprintf(stderr,"public comparator disagreement\n");return 9;}
 if(memcmp(aa,oldaa,560)||memcmp(bb,oldbb,560)||memcmp(&p,&before,sizeof(p))){fprintf(stderr,"readonly mutation\n");return 9;}
 for(size_t j=0;j<400;j++)if((j<5||j>=5+n)&&(left[j]!=90||right[j]!=90)){fprintf(stderr,"canary mutation\n");return 9;}
 for(size_t j=0;j<n;j++){int e=reference(a[j],b[j],&p);if(left[5+j]!=e||right[5+j]!=e){fprintf(stderr,"mismatch n=%zu lane=%zu config=%u scale=0x%08x oz=%d a=%d b=%d expected=%d neon=%d rvv=%d\n",n,j,config,scale,oz,a[j],b[j],e,left[5+j],right[5+j]);return left[5+j]==right[5+j]?3:2;}}
 cases++;lanes+=n;return 0;
}
int main(void){
 assert(sizeof(size_t)==8);assert(fesetround(FE_TONEAREST)==0);
 const size_t sizes[]={1,2,3,4,7,8,9,15,16,17,31,32,33,63,64,65,127,128,129,257};
 const uint32_t scales[]={0,0x80000000U,1,0x80000001U,0x007fffffU,0x807fffffU,0x00800000U,0x80800000U,0x3a800000U,0xba800000U,0x3e800000U,0xbe800000U,0x3f000000U,0xbf000000U,0x3f800000U,0xbf800000U,0x40000000U,0xc0000000U,0x4a5cb972U,0xca5cb972U,0x4b3fffffU,0xcb3fffffU,0x4b400000U,0xcb400000U,0x4b400001U,0xcb400001U,0x7f7fffffU,0xff7fffffU,0x7f800000U,0xff800000U,0x7fc00000U,0xffc00000U,0x7fc00001U,0xffc00001U,0x7f800001U,0xff800001U,0x7fffffffU,0xffffffffU};
 const int16_t offsets[]={-32768,-32767,-13783,-129,-128,-1,0,1,127,128,129,32766,32767};int rc;
 for(size_t z=0;z<sizeof(scales)/sizeof(scales[0]);z++)for(unsigned k=0;k<256;k++)for(size_t t=0;t<sizeof(sizes)/sizeof(sizes[0]);t++)if((rc=one(sizes[t],k,scales[z],offsets[(k+z+t)%13],-1)))return rc;
 /* All65536 ordered signed-byte pairs, including both extremes; no sampling. */
 for(size_t z=0;z<sizeof(scales)/sizeof(scales[0]);z++)for(int k=0;k<65536;k+=256)if((rc=one(256,(unsigned)k+7,scales[z],offsets[(z+k)%13],k)))return rc;
 /* Every raw signed16 output zero point is exercised, without a range cut. */
 for(int k=-32768;k<=32767;k++)if((rc=one(1,(unsigned)k,scales[(unsigned)k%38],(int16_t)k,-1)))return rc;
 for(unsigned k=0;k<8192;k++)if((rc=one(sizes[k%20],k,random32(),offsets[k%13],-1)))return rc;
 printf("passed cases=%llu lanes_per_side=%llu partial_alias_cases=%llu identical_input_cases=%llu exhaustive_pair_scales=%zu all65536_output_offsets=1\n",(unsigned long long)cases,(unsigned long long)lanes,(unsigned long long)alias_cases,(unsigned long long)shared_input_cases,sizeof(scales)/sizeof(scales[0]));return 0;
}
