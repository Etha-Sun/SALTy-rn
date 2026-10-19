#include "spec.h"
int equivalent(size_t nc,size_t k,size_t positions,const float **a,const float *w,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  test_neon(1,nc,k*4,positions*sizeof(void*),a,w,left,nc*4,32,0,NULL,&params);
  test_rvv(1,nc,k*4,positions*sizeof(void*),a,w,right,nc*4,32,0,NULL,&params);
  for(size_t i=0;i<nc;i++)if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}
