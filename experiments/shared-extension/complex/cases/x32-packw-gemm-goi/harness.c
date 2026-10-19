#include "spec.h"
int equivalent(size_t g,size_t nc,size_t kc,size_t extra,const uint32_t *weights,const uint32_t *bias,uint32_t *left,uint32_t *right) {
  test_neon(g,nc,kc,2,1,1,weights,bias,NULL,left,extra*sizeof(uint32_t),NULL);
  test_rvv(g,nc,kc,2,1,1,weights,bias,NULL,right,extra*sizeof(uint32_t),NULL);
  for(size_t i=0;i<g*((nc+1)/2)*(2+2*kc+extra);i++) if(left[i]!=right[i])return 0;
  return 1;
}
