#include "spec.h"
int equivalent(size_t pixels,size_t channels,const float **input,const float *weights,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  test_neon(channels,pixels,input,weights,left,3*sizeof(void*),0,0,0,NULL,&params);
  test_rvv(channels,pixels,input,weights,right,3*sizeof(void*),0,0,0,NULL,&params);
  for(size_t i=0;i<pixels*channels;i++)if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}
