#include "spec.h"

int equivalent(size_t n,const uint8_t *input,uint32_t initial) {
  struct xnn_qs8_rsum_params params={0};
  uint32_t left=initial,right=initial;
  test_neon(n,input,&left,&params);
  test_rvv(n,input,&right,&params);
  return left==right;
}
