#include "spec.h"
int equivalent(size_t mr,size_t nc,size_t k,const float *a,const float *w,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  test_neon(mr,nc,k*4,a,k*4,w,left,nc*4,32,&params);
  test_rvv(mr,nc,k*4,a,k*4,w,right,nc*4,32,&params);
  for(size_t row=0;row<mr;row++)for(size_t col=0;col<nc;col++) { size_t i=row*nc+col;
    if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  }
  return 1;
}
