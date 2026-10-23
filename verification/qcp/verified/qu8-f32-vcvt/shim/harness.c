#include "runtime.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <limits.h>
#include <fenv.h>
#if defined(QCP_ORIGINAL_NEON)
#include "../proof/original/testNEON.c"
#else
#include "../impl/testNEON.c"
#endif
#define test_rvv test_rvv_original
#include "../proof/original/testRVV.c"
#undef test_rvv
#include "../impl/testRVV.c"
#include "../spec.c"
static float from_bits(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static int related(float a,float b){return a==b || (isnan(a)&&isnan(b));}
/* Independent scalar expression: modulo the final difference, then sign-extend. */
static float oracle(uint8_t x,int32_t z,float scale){uint16_t u=(uint16_t)((uint32_t)(int32_t)x-(uint32_t)z);int32_t d=u<32768?(int32_t)u:(int32_t)u-65536;return(float)d*scale;}
static uint32_t rng=0x853c49e6U;
static uint32_t next(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static unsigned long cases,lanes;
static int check(size_t n,int32_t z,uint32_t scale_bits,unsigned pattern){
 uint8_t *input=malloc(n+7),*snapshot=malloc(n+7);float *neon=malloc((n+2)*sizeof(float)),*rvv=malloc((n+2)*sizeof(float));
 float *rvv_original=malloc((n+2)*sizeof(float));
 if(!input||!snapshot||!neon||!rvv||!rvv_original)exit(71);
 const uint32_t guard=0x7f812345U;float g=from_bits(guard),scale=from_bits(scale_bits);
 for(size_t i=0;i<n+7;i++)input[i]=(uint8_t)(pattern==0?i:pattern==1?255-i:pattern==2?0:next());
 memcpy(snapshot,input,n+7);for(size_t i=0;i<n+2;i++)neon[i]=rvv[i]=rvv_original[i]=g;
 struct xnn_qu8_f32_cvt_params params={{z,scale}},saved=params;
 test_rvv_original(n,input,rvv_original+1,&params);
 if(equivalent(n,input,neon+1,rvv+1,&params)!=1){fprintf(stderr,"public equivalent failed\n");return 0;}
 if(memcmp(snapshot,input,n+7)||memcmp(&params,&saved,sizeof params)||bits(neon[0])!=guard||bits(rvv[0])!=guard||bits(neon[n+1])!=guard||bits(rvv[n+1])!=guard||bits(rvv_original[0])!=guard||bits(rvv_original[n+1])!=guard){fprintf(stderr,"frame error n=%zu z=%d\n",n,z);return 0;}
 for(size_t i=0;i<n;i++){
  float expected=oracle(input[i],z,scale);
  if(bits(rvv_original[i+1])!=bits(rvv[i+1])||!related(neon[i+1],rvv[i+1])||!related(neon[i+1],expected)){fprintf(stderr,"mismatch n=%zu lane=%zu z=%d scale=%08x neon=%08x rvv=%08x oracle=%08x\n",n,i,z,scale_bits,bits(neon[i+1]),bits(rvv[i+1]),bits(expected));return 0;}
 }
 free(input);free(snapshot);free(neon);free(rvv);free(rvv_original);cases++;lanes+=n;return 1;
}
int main(int argc,char**argv){
 if(fesetround(FE_TONEAREST))return 70;
 if(argc>1){uint8_t input[8]={0};float out[1];struct xnn_qu8_f32_cvt_params p={{INT32_MIN,1.0f}};test_neon(1,input,out,&p);printf("original/repaired boundary output=%08x\n",bits(out[0]));return 0;}
 if(check_observation(1.0f,2.0f)!=0 || check_observation(from_bits(0x7fc12345),1.0f)!=0 || check_observation(from_bits(0x7fc12345),from_bits(0xffc54321))!=1 || check_observation(0.0f,from_bits(0x80000000))!=1)return 72;
 const int32_t zs[]={INT32_MIN,INT32_MIN+1,INT32_MAX,-65537,-65536,-32769,-32768,-129,0,-1,0,1,255,128,32767,32768,65535,65536,65537};
 const uint32_t scales[]={0,0x80000000,0x3f800000,0xbf800000,0x3dcccccd,1,0x7f7fffff,0x00800000,0x7f800000,0xff800000,0x7fc12345,0xffc54321,0x7f800001,0xff800001};
 for(size_t n=1;n<=73;n++)for(size_t j=0;j<sizeof zs/sizeof zs[0];j++)for(size_t s=0;s<sizeof scales/sizeof scales[0];s++)for(unsigned p=0;p<4;p++)if(!check(n,zs[j],scales[s],p))return 1;
 const size_t sizes[]={255,128,129,255,256,257};
 for(size_t j=0;j<sizeof sizes/sizeof sizes[0];j++)for(size_t z=0;z<sizeof zs/sizeof zs[0];z++)for(size_t s=0;s<sizeof scales/sizeof scales[0];s++)if(!check(sizes[j],zs[z],scales[s],3))return 1;
 for(uint32_t z=0;z<65536;z++)if(!check(1,(int32_t)z,0x3f800000,0)||!check(9,INT32_MIN+(int32_t)z,0xbf800000,3))return 1;
 for(unsigned k=0;k<5000;k++)if(!check(next()%257+1,(int32_t)next(),next(),3))return 1;
 printf("passed cases=%lu active_lanes_per_side=%lu failures=0; actual public equivalent/comparator controls; original-vs-compatible RVV bitexact controls; repaired-neon/compatible-rvv; all65536 zero-point residues; NaN/Inf/signed-zero scales\n",cases,lanes);return 0;
}
