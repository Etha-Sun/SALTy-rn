#include "host.h"
#include <stdio.h>
#include <stdlib.h>
#define test_neon exp_original_neon
#include "../../proof/original/testNEON.c"
#undef test_neon
#define test_rvv exp_original_rvv
#include "../../proof/original/testRVV.c"
#undef test_rvv
#define test_neon exp_repaired_neon
#include "../../impl/testNEON.c"
#undef test_neon
#define test_rvv exp_repaired_rvv
#include "../../impl/testRVV.c"
#undef test_rvv
static uint32_t seed=0x1257ae9du;
static uint32_t random32(void){seed^=seed<<13;seed^=seed>>17;seed^=seed<<5;return seed;}
static int same(float a,float b){return(isnan(a)&&isnan(b))||a==b;}
/* Scalar expression and tree oracle: independent of vector helpers and VL. */
static float scalar_value(float x,float m){
 volatile float vx=x-m;
 float vn=fmaf(vx,0x1.715476p+0f,0x1.8000FEp23f);
 uint32_t bits;memcpy(&bits,&vn,4);bits<<=23;
 float vs;memcpy(&vs,&bits,4);
 vn=vn-0x1.8000FEp23f;
 float vt=fmaf(vn,-0x1.62E430p-1f,vx);
 float vp=fmaf(0x1.0F9F9Cp-7f,vt,0x1.573A1Ap-5f);
 vp=fmaf(vp,vt,0x1.555A80p-3f);
 vp=fmaf(vp,vt,0x1.FFFDC6p-2f);
 vp=fmaf(vp,vt,0x1.FFFFF6p-1f);
 vt=vt*vs;
 float vf=fmaf(vp,vt,vs);
 if(vx< -0x1.5D589Ep6f)return 0.0f;
 return vf;
}
static float scalar_oracle(size_t n,const float*input,float maximum,float*out){
 float a[4]={0,0,0,0};size_t k=0;
 for(;k+4<=n;k+=4)for(size_t j=0;j<4;j++){out[k+j]=scalar_value(input[k+j],maximum);volatile float v=a[j]+out[k+j];a[j]=v;}
 volatile float lo=a[0]+a[1],hi=a[2]+a[3];float sum=lo+hi;
 for(size_t j=k;j<n;j++)out[j]=scalar_value(input[j],maximum);
 size_t r=n-k;
 if(r>=2){volatile float two=out[k]+out[k+1];sum+=two;k+=2;}
 if(r&1)sum+=out[k];
 return sum;
}
static const uint32_t special[]={0,0x80000000u,0x3f800000u,0xbf800000u,0x7f800000u,0xff800000u,0x7fc00000u,0x7f800001u,0xff800123u,1,0x80000001u,0x007fffffu,0x00800000u,0x7f7fffffu,0xff7fffffu,0xc2aeac4fu};
int main(int argc,char**argv){
 if(fesetround(FE_TONEAREST))return 3;
 int counter_only=argc>1&&strcmp(argv[1],"counter")==0;
 int inject=argc>1&&strcmp(argv[1],"wrong")==0;
 size_t cases=0,lanes=0,original_mismatches=0;int first=1;
 for(unsigned mode=0;mode<2;mode++){exp_vl_mode=mode;
 for(size_t n=1;n<=129;n++)for(unsigned pattern=0;pattern<24;pattern++){
  float*input=malloc((n+3)*4);float*expected=malloc((n+2)*4);float*on=malloc((n+2)*4);float*orr=malloc((n+2)*4);float*oldn=malloc((n+2)*4);float*oldr=malloc((n+2)*4);
  if(!input||!expected||!on||!orr||!oldn||!oldr)return 4;
  for(size_t i=0;i<n+3;i++){
   if(pattern<8)input[i]=-(float)(random32()%10000)/128.0f;
   else if(pattern<16)input[i]=efloat(special[(i+pattern)%(sizeof special/sizeof*special)]);
   else input[i]=efloat(random32());
  }
  float maximum=pattern<8?0:pattern<16?efloat(special[pattern-8]):efloat(random32());
  const float*maxptr=pattern%3?&maximum:input+(pattern%(n+3));maximum=*maxptr;
  const uint32_t canary=0x4b654321u;for(size_t i=0;i<n+2;i++)on[i]=orr[i]=oldn[i]=oldr[i]=efloat(canary);
  size_t slot=pattern%5==0?n/2:n;
  float refsum=scalar_oracle(n,input,maximum,expected);expected[n]=efloat(canary);expected[n+1]=efloat(canary);if(slot<n)expected[slot]=refsum;
  exp_repaired_neon(n*4,input,maxptr,on,on+slot,NULL);
  exp_repaired_rvv(n*4,input,maxptr,orr,orr+slot,NULL);
  if(inject){on[0]=efloat(0x3f800001u);orr[0]=on[0];}
  int bad=!same(on[slot],refsum)||!same(orr[slot],refsum);
  for(size_t i=0;i<n;i++)bad|=!same(on[i],expected[i])||!same(orr[i],expected[i]);
  bad|=ebits(on[n+1])!=canary||ebits(orr[n+1])!=canary;
  if(slot<n)bad|=ebits(on[n])!=canary||ebits(orr[n])!=canary;
  if(bad){fprintf(stderr,"independent oracle rejected n=%zu pattern=%u mode=%u neon=%08x rvv=%08x oracle=%08x\n",n,pattern,mode,ebits(on[slot]),ebits(orr[slot]),ebits(refsum));free(input);free(expected);free(on);free(orr);free(oldn);free(oldr);return 2;}
  exp_original_neon(n*4,input,maxptr,oldn,oldn+n,NULL);exp_original_rvv(n*4,input,maxptr,oldr,oldr+n,NULL);
  if(!same(oldn[n],oldr[n])){
   original_mismatches++;
   if(first){printf("original counterexample n=%zu pattern=%u mode=%u maximum=%08x neon_sum=%08x rvv_sum=%08x input=",n,pattern,mode,ebits(maximum),ebits(oldn[n]),ebits(oldr[n]));for(size_t i=0;i<n;i++)printf("%s%08x",i?",":"",ebits(input[i]));puts("");first=0;}
  }
  cases++;lanes+=n;free(input);free(expected);free(on);free(orr);free(oldn);free(oldr);
  if(counter_only&&original_mismatches){printf("counterexample observed; repaired case passed\n");return 0;}
 }}
 printf("cases=%zu lanes_per_side=%zu original_sum_mismatches=%zu repaired_oracle_mismatches=0 VL_modes=2 sum_output_alias=yes max_input_alias=yes\n",cases,lanes,original_mismatches);
 return original_mismatches?0:5;
}
