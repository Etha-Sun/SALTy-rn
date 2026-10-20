#include "spec.h"
int equivalent(size_t m,size_t nc,const float *input,const float *weights,const int32_t *dmap,const uint32_t *nnz,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  test_neon(m*4,nc,input,weights,dmap,nnz,left,(m+4)*4,&params);
  test_rvv(m*4,nc,input,weights,dmap,nnz,right,(m+4)*4,&params);
  /*@ loop invariant 0<=col<=nc;
      loop invariant \forall integer s,t; 0<=s<col && 0<=t<m ==> (\eq_float(left[s*(m+4)+t],right[s*(m+4)+t]) || (\is_NaN(left[s*(m+4)+t]) && \is_NaN(right[s*(m+4)+t])));
      loop assigns col;
      loop variant nc-col;
  */
  for(size_t col=0;col<nc;col++)/*@ loop invariant 0<=row<=m;
      loop invariant \forall integer t; 0<=t<row ==> (\eq_float(left[col*(m+4)+t],right[col*(m+4)+t]) || (\is_NaN(left[col*(m+4)+t]) && \is_NaN(right[col*(m+4)+t])));
      loop assigns row;
      loop variant m-row;
  */
  for(size_t row=0;row<m;row++) { size_t i=col*(m+4)+row;
    if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  }
  return 1;
}
