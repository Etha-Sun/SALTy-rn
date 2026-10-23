#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef QCV_NESTED_REFERENCE
#include "neon_nested_frontend.h"
#else
#include "neon_frontend.h"
#endif
#include "rvv_frontend.h"
static int32_t native_wrap32(uint32_t x){return x<=2147483647U?(int32_t)x:(int32_t)((int64_t)x-4294967296LL);}
#include "../impl/testNEON.c"
#include "../impl/testRVV.c"
#define QCP_FORMAL 1
#include "../spec.c"
_Static_assert(sizeof(void*)==8 && sizeof(size_t)==8 && sizeof(int16_t)==2 && sizeof(int32_t)==4,"fixed LP64 widths");
_Static_assert(sizeof(int8x8_t)==8 && sizeof(int16x8_t)==16 && sizeof(vint8m2_t)==32 && sizeof(vint16m4_t)==64 && sizeof(vint32m8_t)==128,"actual lane field counts");
static int64_t oracle_floor(__int128 x,int64_t d){ __int128 q=x/d,r=x%d;if(r<0)q--;return(int64_t)q; }
static int16_t oracle_wrap16(int64_t x){int64_t r=x%65536;if(r<0)r+=65536;if(r>=32768)r-=65536;return(int16_t)r;}
static int16_t oracle_sat16(int64_t x){return x<(-32768)?(-32768):x>32767?32767:(int16_t)x;}
static int8_t oracle_sat8(int64_t x){return x<(-128)?(-128):x>127?127:(int8_t)x;}
static int16_t oracle_neon_mul(int16_t a,int16_t b){return oracle_sat16(oracle_floor((__int128)2*a*b+32768,65536));}
static int16_t oracle_rvv_clip(int32_t p){int64_t q=oracle_floor(p,32768);unsigned bit=((uint32_t)p>>14)&1;return oracle_sat16(q+bit);}
static int8_t oracle_lane(int8_t x,const struct xnn_qs8_cvt_params*p){int16_t d=oracle_wrap16((int64_t)p->scalar.input_zero_point-x);int16_t a=oracle_wrap16((int64_t)d*128);int16_t b=oracle_wrap16(-(int64_t)p->scalar.multiplier);return oracle_sat8(oracle_sat16((int64_t)oracle_neon_mul(a,b)+p->scalar.output_zero_point));}
static unsigned long long scalar_checks,kernel_cases,kernel_lanes;
static int full_case(size_t n,int16_t z,int32_t m,int16_t o,unsigned seed){
 int8_t input[288],before[288],left[288],right[288];struct xnn_qs8_cvt_params p;memset(&p,0,sizeof p);p.scalar.input_zero_point=z;p.scalar.multiplier=m;p.scalar.output_zero_point=o;unsigned char params_before[sizeof p];memcpy(params_before,&p,sizeof p);
 for(unsigned i=0;i<288;i++){seed=seed*1664525U+1013904223U;input[i]=(int8_t)(seed>>24);left[i]=(int8_t)90;right[i]=(int8_t)90;}memcpy(before,input,sizeof input);
 if(equivalent(n,input+5,left+7,right+7,&p)!=1)return 4;
 for(size_t i=0;i<288;i++){
  if(i>=7&&i<7+n){int8_t expected=oracle_lane(input[5+i-7],&p);if(left[i]!=expected||right[i]!=expected){printf("mismatch n=%lu i=%lu z=%d m=%d o=%d expected=%d neon=%d rvv=%d\n",n,i-7,z,m,o,expected,left[i],right[i]);return 1;}}
  else if(left[i]!=90||right[i]!=90)return 2;
 }
 if(memcmp(input,before,sizeof input)||memcmp(&p,params_before,sizeof p))return 3;kernel_cases++;kernel_lanes+=n;return 0;
}
int main(int argc,char**argv){
 if(argc>1&&argv[1][0]=='m'){int e=full_case(1,1,-128,0,1);return e;}
 const int16_t edges[]={-32768,-32767,-16384,-129,-128,-1,0,1,127,128,16384,32766,32767};
 unsigned seed=0x87fe4301U;
 const size_t lengths[]={1,2,3,4,5,6,7,8,9,15,16,17,23,24,25,31,32,33,63,64,65,95,96,97,127,128,129,255,256,257};
 const int32_t mults[]={(-2147483647-1),-2147483647,-65537,-65536,-32769,-32768,-16384,-128,-1,0,1,127,128,16384,32767,32768,65535,65536,65537,2147483647};
 for(unsigned l=0;l<sizeof lengths/sizeof lengths[0];l++)for(unsigned z=0;z<sizeof edges/sizeof edges[0];z++)for(unsigned m=0;m<sizeof mults/sizeof mults[0];m++)for(unsigned o=0;o<3;o++){int r=full_case(lengths[l],edges[z],mults[m],edges[(z+o*5)%13],seed++);if(r)return 20+r;}
 for(unsigned j=0;j<4096;j++){seed=seed*1664525U+1013904223U;int16_t z=(int16_t)(seed>>16);seed=seed*1664525U+1013904223U;int32_t m=native_wrap32(seed);seed=seed*1664525U+1013904223U;int16_t o=(int16_t)(seed>>16);int r=full_case(1+(seed%257),z,m,o,seed);if(r)return 25+r;}
 if(oracle_neon_mul(-32768,-32768)!=32767||oracle_neon_mul(-128,128)!=0||oracle_neon_mul(128,128)!=1)return 30;
 printf("passed formal_scalar_field_bodies; scalar_checks=%llu kernel_cases=%llu kernel_lanes_per_side=%llu; independent128bit oracle; actual public caller and all formal-field C helper bodies; fixed boundaries, full parameter edges, random cases, input/params/canary/frame\n",scalar_checks,kernel_cases,kernel_lanes);return 0;
}
