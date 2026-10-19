#include "spec.h"
int equivalent(size_t rows,size_t channels,const int8_t *input,size_t input_stride,const int8_t *zero,const int32_t *initial,int32_t *left,int32_t *right,const struct xnn_qs8_rsum_params *params) {
  for(size_t i=0;i<channels;i++)left[i]=right[i]=initial[i];
  test_neon(rows,channels,input,input_stride,zero,left,params);
  test_rvv(rows,channels,input,input_stride,zero,right,params);
  for(size_t i=0;i<channels;i++)if(left[i]!=right[i])return 0;
  return 1;
}
