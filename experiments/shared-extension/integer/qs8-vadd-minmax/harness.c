#include "spec.h"
int equivalent(size_t n, const int8_t *input_a, const int8_t *input_b, int8_t *left, int8_t *right, const struct xnn_qs8_add_minmax_params* params) {
  test_neon(n,input_a,input_b,left,params);
  test_rvv(n,input_a,input_b,right,params);
  for(size_t i=0;i<n;i++) if(!(left[i]==right[i]))return 0;
  return 1;
}
