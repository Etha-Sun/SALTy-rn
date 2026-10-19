#include "spec.h"
int equivalent(size_t w,size_t h,size_t is,size_t os,const uint32_t *input,uint32_t *left,uint32_t *right) {
  test_neon(input,left,is*sizeof(uint32_t),os*sizeof(uint32_t),w,h);
  test_rvv(input,right,is*sizeof(uint32_t),os*sizeof(uint32_t),w,h);
  for(size_t i=0;i<w*os;i++) if(left[i]!=right[i])return 0;
  return 1;
}
