#include "spec.h"

int equivalent(size_t n,const uint8_t *input,uint8_t *left,uint8_t *right,uint32_t lower,uint32_t upper) {
  struct xnn_u8_minmax_params params={{lower,upper}};
  test_neon(n,input,left,&params);
  test_rvv(n,input,right,&params);
  for (size_t i=0;i<n;i++) {
    if (!(left[i]==right[i])) return 0;
  }
  return 1;
}
