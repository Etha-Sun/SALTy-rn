#include "spec.h"
int equivalent(size_t h,size_t w,size_t channels,const float *input,const float *weights,const float *zero,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  size_t oh=(h+1)/2,ow=(w+1)/2;
  test_neon(h,w,0,oh,input,zero,weights,left,1,channels,ow*4,oh*ow*4,&params);
  test_rvv(h,w,0,oh,input,zero,weights,right,1,channels,ow*4,oh*ow*4,&params);
  for(size_t i=0;i<channels*oh*ow;i++)if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}
