#include "spec.h"
int equivalent(size_t n, const float *input, uint16_t *left, uint16_t *right, const void* params) {
  test_neon(n*sizeof(float),input,left,params);
  test_rvv(n*sizeof(float),input,right,params);
  for(size_t i=0;i<n;i++) if(!(left[i]==right[i]))return 0;
  return 1;
}
