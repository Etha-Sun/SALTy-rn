#include "spec.h"

int equivalent(size_t n,const int8_t *input,int32_t initial) {
  struct xnn_qs8_rsum_params params={0};
  int32_t neon=initial,rvv=initial;
  test_neon(n,input,&neon,&params);
  test_rvv(n,input,&rvv,&params);
  return neon==rvv;
}
