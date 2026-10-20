#include "spec.h"
int equivalent(size_t mr,size_t nc,size_t k,const float *a,const float *w,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  test_neon(mr,nc,k*4,a,k*4,w,left,nc*4,32,&params);
  test_rvv(mr,nc,k*4,a,k*4,w,right,nc*4,32,&params);
  /*@ loop invariant 0<=row<=mr;
      loop invariant \forall integer s,t; 0<=s<row && 0<=t<nc ==> ext_same(left[s*nc+t],right[s*nc+t]);
      loop assigns row;
      loop variant mr-row;
  */
  for(size_t row=0;row<mr;row++)
  /*@ loop invariant 0<=col<=nc;
      loop invariant \forall integer t; 0<=t<col ==> ext_same(left[row*nc+t],right[row*nc+t]);
      loop assigns col;
      loop variant nc-col;
  */
  for(size_t col=0;col<nc;col++) { size_t i=row*nc+col;
    /*@ assert ext_same(left[i],ext_neon_clamp32(acc_fold(a,w,k,col/8,off(mr,row)*k,col%8,k),lower,upper)); */
    /*@ assert ext_same(right[i],ext_rvv_clamp32(acc_fold(a,w,k,col/8,off(mr,row)*k,col%8,k),lower,upper)); */
    /*@ assert ext_same(left[i],right[i]); */
    if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  }
  return 1;
}
