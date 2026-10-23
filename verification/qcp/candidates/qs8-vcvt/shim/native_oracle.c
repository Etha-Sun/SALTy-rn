#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "runtime.h"
#include "../impl/testNEON.c"
#include "../impl/testRVV.c"
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
 test_neon(n,input+5,left+7,&p);test_rvv(n,input+5,right+7,&p);
 for(size_t i=0;i<288;i++){
  if(i>=7&&i<7+n){int8_t expected=oracle_lane(input[5+i-7],&p);if(left[i]!=expected||right[i]!=expected){printf("mismatch n=%lu i=%lu z=%d m=%d o=%d expected=%d neon=%d rvv=%d\n",n,i-7,z,m,o,expected,left[i],right[i]);return 1;}}
  else if(left[i]!=90||right[i]!=90)return 2;
 }
 if(memcmp(input,before,sizeof input)||memcmp(&p,params_before,sizeof p))return 3;kernel_cases++;kernel_lanes+=n;return 0;
}
int main(int argc,char**argv){
 if(argc>1&&argv[1][0]=='m'){int e=full_case(1,1,-128,0,1);return e;}
 const int16_t edges[]={-32768,-32767,-16384,-129,-128,-1,0,1,127,128,16384,32766,32767};
 for(int a=-32768;a<=32767;a++){
  if(qcp_qcv_shl7((int16_t)a)!=oracle_wrap16((int64_t)a*128)||qcp_qcv_sat8((int16_t)a)!=oracle_sat8(a))return 10;scalar_checks+=2;
  for(int b=-128;b<=127;b++){if(qcp_qcv_subw((int16_t)a,(int8_t)b)!=oracle_wrap16((int64_t)a-b))return 11;scalar_checks++;}
  for(unsigned j=0;j<sizeof edges/sizeof edges[0];j++){int16_t b=edges[j];int16_t expected=oracle_sat16((int64_t)a+b);if(qcp_qcv_neon_add((int16_t)a,b)!=expected||qcp_qcv_rvv_add((int16_t)a,b)!=expected)return 12;scalar_checks+=2;}
 }
 for(int a=-32768;a<32768;a+=128)for(int b=-32768;b<=32767;b++){
  int16_t expected=oracle_neon_mul((int16_t)a,(int16_t)b);int32_t product=qcp_qcv_rvv_mul((int16_t)a,(int16_t)b);if(product!=(int64_t)a*b||qcp_qcv_neon_qrdmulh((int16_t)a,(int16_t)b)!=expected||qcp_qcv_rvv_clip15(product)!=oracle_rvv_clip(product)||qcp_qcv_rvv_clip15(product)!=expected)return 13;scalar_checks+=4;
 }
 for(unsigned j=0;j<sizeof edges/sizeof edges[0];j++)for(int b=-32768;b<=32767;b++){
  int16_t a=edges[j],expected=oracle_neon_mul(a,(int16_t)b);int32_t product=qcp_qcv_rvv_mul(a,(int16_t)b);if(qcp_qcv_neon_qrdmulh(a,(int16_t)b)!=expected||qcp_qcv_rvv_clip15(product)!=expected)return 14;scalar_checks+=2;
 }
 for(int k=0;k<65536;k++){
  int32_t ms[]={k,(-2147483647-1)+k,2147483647-k,-1-k};for(unsigned j=0;j<4;j++){if(qcp_qcv_seed(ms[j])!=oracle_wrap16(-(int64_t)ms[j])||qcp_qcv_narrow16(ms[j])!=oracle_wrap16(ms[j]))return 15;scalar_checks+=2;}
 }
 unsigned seed=0x87fe4301U;
 for(unsigned j=0;j<1048576;j++){seed=seed*1664525U+1013904223U;int64_t x=(int64_t)seed-(j&1?4294967296LL:0);if(qcp_qcv_asr15(x)!=oracle_floor(x,32768)||qcp_qcv_asr16(x)!=oracle_floor(x,65536))return 16;scalar_checks+=2;}
 const size_t lengths[]={1,2,3,4,5,6,7,8,9,15,16,17,23,24,25,31,32,33,63,64,65,95,96,97,127,128,129,255,256,257};
 const int32_t mults[]={(-2147483647-1),-2147483647,-65537,-65536,-32769,-32768,-16384,-128,-1,0,1,127,128,16384,32767,32768,65535,65536,65537,2147483647};
 for(unsigned l=0;l<sizeof lengths/sizeof lengths[0];l++)for(unsigned z=0;z<sizeof edges/sizeof edges[0];z++)for(unsigned m=0;m<sizeof mults/sizeof mults[0];m++)for(unsigned o=0;o<3;o++){int r=full_case(lengths[l],edges[z],mults[m],edges[(z+o*5)%13],seed++);if(r)return 20+r;}
 for(unsigned j=0;j<4096;j++){seed=seed*1664525U+1013904223U;int16_t z=(int16_t)(seed>>16);seed=seed*1664525U+1013904223U;int32_t m=native_wrap32(seed);seed=seed*1664525U+1013904223U;int16_t o=(int16_t)(seed>>16);int r=full_case(1+(seed%257),z,m,o,seed);if(r)return 25+r;}
 if(oracle_neon_mul(-32768,-32768)!=32767||oracle_neon_mul(-128,128)!=0||oracle_neon_mul(128,128)!=1)return 30;
 printf("passed scalar_checks=%llu kernel_cases=%llu kernel_lanes_per_side=%llu; independent128bit oracle, allshort-byte subtract, all512reachable-left16 x65536 multipliers, general16bit edges, allnegseed residues/INT32 endpoints, canary/frame\n",scalar_checks,kernel_cases,kernel_lanes);return 0;
}
