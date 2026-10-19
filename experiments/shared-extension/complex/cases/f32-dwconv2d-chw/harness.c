#include "spec.h"
int equivalent(size_t h,size_t w,const float *input,const float *weights,const float *zero,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  test_neon(h,w*4,input,weights,zero,left,1,&params);
  test_rvv(h,w*4,input,weights,zero,right,1,&params);
  for(size_t i=0;i<h*w;i++)if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}
