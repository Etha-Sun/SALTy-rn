#include "spec.h"
int equivalent(size_t pixels,size_t k,size_t channels,const float **input,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  test_neon(pixels,k,channels,input,0,0,left,k*sizeof(void*),channels*sizeof(float),&params);
  test_rvv(pixels,k,channels,input,0,0,right,k*sizeof(void*),channels*sizeof(float),&params);
  /*@ loop invariant 0<=i<=pixels*channels;
      loop invariant \forall integer j; 0<=j<i ==> (\eq_float(left[j],right[j]) || (\is_NaN(left[j]) && \is_NaN(right[j])));
      loop assigns i;
      loop variant pixels*channels-i;
  */
  for(size_t i=0;i<pixels*channels;i++) {
    if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  }
  return 1;
}
