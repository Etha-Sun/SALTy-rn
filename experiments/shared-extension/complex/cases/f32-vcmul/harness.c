#include "spec.h"
int equivalent(size_t n,const float *a,const float *b,float *left,float *right) {
  struct xnn_f32_default_params params={0};
  test_neon(n*sizeof(float),a,b,left,&params);
  test_rvv(n*sizeof(float),a,b,right,&params);
  for(size_t i=0;i<2*n;i++) if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}
