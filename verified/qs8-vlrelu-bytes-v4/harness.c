#include "spec.h"
int equivalent(size_t n, const int8_t *input, int8_t *left, int8_t *right, const struct xnn_qs8_lrelu_params* params) {
  test_neon(n,input,left,params);
  test_rvv(n,input,right,params);
  for(size_t i=0;i<n;i++) if(!(left[i]==right[i]))return 0;
  return 1;
}
