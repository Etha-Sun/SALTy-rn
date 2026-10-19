#include "spec.h"
int equivalent(size_t n, const uint8_t *input, float *left, float *right, const struct xnn_qu8_f32_cvt_params* params) {
  test_neon(n,input,left,params);
  test_rvv(n,input,right,params);
  for(size_t i=0;i<n;i++) if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}
