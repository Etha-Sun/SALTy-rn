#include "spec.h"
int equivalent(size_t m,size_t nc,const float *input,const float *weights,const int32_t *dmap,const uint32_t *nnz,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  test_neon(m*4,nc,input,weights,dmap,nnz,left,(m+4)*4,&params);
  test_rvv(m*4,nc,input,weights,dmap,nnz,right,(m+4)*4,&params);
  for(size_t col=0;col<nc;col++)for(size_t row=0;row<m;row++) { size_t i=col*(m+4)+row;
    if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  }
  return 1;
}
