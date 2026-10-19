#include "spec.h"
int equivalent(size_t nc,size_t k,const int8_t *input,const void *weights,float *left,float *right,int32_t zero_point,float inv_scale,float lower,float upper) {
  struct xnn_f32_qc4w_minmax_params params={{lower,upper,0}};
  struct xnn_qd8_quantization_params q={zero_point,inv_scale};
  test_neon(1,nc,k,input,k,weights,left,nc*4,64,&params,&q);
  test_rvv(1,nc,k,input,k,weights,right,nc*4,64,&params,&q);
  for(size_t i=0;i<nc;i++)if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}
