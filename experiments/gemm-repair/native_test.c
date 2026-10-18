#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#include "shim.h"
#include "reference_neon.c"
#define test_rvv original_rvv
#include "original_rvv.c"
#undef test_rvv
#include "repaired_rvv.c"

static uint32_t bits(float value) { uint32_t r;memcpy(&r,&value,4);return r; }
static float from_bits(uint32_t value) { float r;memcpy(&r,&value,4);return r; }
static int old_counterexample(void) {
  float a[4]={1,1,1,1},w[16]={0},left[4]={0},old[4]={0},fixed[4]={0};
  w[0]=from_bits(UINT32_C(0x7fc01234));
  struct xnn_f32_minmax_params p={{-1,1}};
  test_neon(1,1,4,a,4,w,left,4,32,&p);
  original_rvv(1,1,4,a,4,w,old,4,32,&p);
  test_rvv(1,1,4,a,4,w,fixed,4,32,&p);
  printf("old_counterexample reference=%08x old=%08x repaired=%08x\n",bits(left[0]),bits(old[0]),bits(fixed[0]));
  return bits(left[0])!=bits(old[0]) && bits(left[0])==bits(fixed[0]);
}
static int one(size_t mr,size_t nc,size_t k,unsigned mode) {
  size_t tiles=(nc+7)/8, wn=tiles*(k+1)*8;
  float *a=calloc(4*k+16,sizeof(float)),*w=calloc(wn+16,sizeof(float));
  float *left=calloc(4*nc+16,sizeof(float)),*right=calloc(4*nc+16,sizeof(float));
  if(!a||!w||!left||!right)abort();
  for(size_t i=0;i<4*k;i++)a[i]=(float)((int)(i%9)-4)*0.125f;
  for(size_t i=0;i<wn;i++)w[i]=(float)((int)(i%13)-6)*0.0625f;
  struct xnn_f32_minmax_params p={{-0.75f,0.625f}};
  float qnan=from_bits(UINT32_C(0xffc03456));
  switch(mode) {
  case 1: a[k/2]=qnan;break;
  case 2: w[8+(nc>3?3:0)]=qnan;break;
  case 3: for(size_t t=0;t<tiles;t++)w[t*(k+1)*8]=qnan;break;
  case 4: p.scalar.min=qnan;break;
  case 5: p.scalar.max=qnan;break;
  case 6: p.scalar.min=qnan;p.scalar.max=qnan;break;
  case 7: for(size_t i=0;i<4*k;i++)a[i]=i%2?-0.0f:0.0f;
          for(size_t i=0;i<wn;i++)w[i]=i%2?0.0f:-0.0f;
          p.scalar.min=-0.0f;p.scalar.max=0.0f;break;
  case 8: a[0]=INFINITY;w[8]=0.0f;break;
  case 9: a[0]=-INFINITY;p.scalar.min=-INFINITY;p.scalar.max=INFINITY;break;
  case 10: w[0]=INFINITY;w[8]=-INFINITY;a[0]=1.0f;break;
  case 11: p.scalar.min=INFINITY;p.scalar.max=-INFINITY;break;
  }
  test_neon(mr,nc,k*4,a,k*4,w,left,nc*4,32,&p);
  test_rvv(mr,nc,k*4,a,k*4,w,right,nc*4,32,&p);
  int ok=1;
  for(size_t r=0;r<mr;r++)for(size_t c=0;c<nc;c++) {
    size_t at=r*nc+c;
    if(bits(left[at])!=bits(right[at])) {
      fprintf(stderr,"mismatch mr=%zu nc=%zu k=%zu mode=%u row=%zu col=%zu %08x %08x\n",mr,nc,k,mode,r,c,bits(left[at]),bits(right[at]));ok=0;
    }
  }
  free(a);free(w);free(left);free(right);return ok;
}
int main(void) {
  if(fegetround()!=FE_TONEAREST)return 3;
  if(!old_counterexample())return 1;
  size_t columns[]={1,2,3,4,7,8,9,17,23,33},depths[]={1,2,3,7,16};
  size_t count=0;
  for(size_t mr=1;mr<=4;mr++)for(size_t j=0;j<10;j++)for(size_t q=0;q<5;q++)
    for(unsigned mode=0;mode<12;mode++) {
      if(!one(mr,columns[j],depths[q],mode))return 2;
      count++;
    }
  printf("repaired_cases_passed=%zu bitwise_canonical_model=1\n",count);
  return 0;
}
