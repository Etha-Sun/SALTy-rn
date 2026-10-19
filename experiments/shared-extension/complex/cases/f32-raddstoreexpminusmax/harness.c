#include "spec.h"
int equivalent(size_t n,const float *input,float maximum,float *left,float *right,float *sum_left,float *sum_right) {
  test_neon(n*4,input,&maximum,left,sum_left,NULL);
  test_rvv(n*4,input,&maximum,right,sum_right,NULL);
  for(size_t i=0;i<n;i++)if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return *sum_left==*sum_right || (*sum_left!=*sum_left && *sum_right!=*sum_right);
}
