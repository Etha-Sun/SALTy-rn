#include "spec.h"
int equivalent(size_t pixels,size_t k,size_t channels,const float **input,float *left,float *right,uint32_t *li,uint32_t *ri) {
  test_neon(pixels,k,channels,input,0,0,left,li,k*sizeof(void*),channels*sizeof(float),channels*sizeof(uint32_t));
  test_rvv(pixels,k,channels,input,0,0,right,ri,k*sizeof(void*),channels*sizeof(float),channels*sizeof(uint32_t));
  /*@ loop invariant 0<=i<=pixels*channels;
      loop invariant \forall integer j; 0<=j<i ==> ((\eq_float(left[j],right[j]) || (\is_NaN(left[j]) && \is_NaN(right[j]))) && li[j]==ri[j]);
      loop assigns i;
      loop variant pixels*channels-i;
  */
  for(size_t i=0;i<pixels*channels;i++) {
    if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
    if(li[i]!=ri[i])return 0;
  }
  return 1;
}
