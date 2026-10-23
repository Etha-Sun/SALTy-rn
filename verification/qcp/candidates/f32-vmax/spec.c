/* Requested relation for the selected original or repaired pair: each output lane is
 * numerically equal or both NaN. One-NaN/one-number is a failure.
 * Inputs: n>0, disjoint n+3 readable floats each, two disjoint n writable
 * outputs, separate readable params. LP64/little-endian/binary32; see semantics.
 * This is an executable review target; no complete QCP contract/proof claimed.
 */
#include "shim/runtime.h"
void test_neon(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);
void test_rvv(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);
int compare_outputs(size_t n,const float*left,const float*right) {
  for(size_t i=0;i<n;i++) {
    float a=left[i],b=right[i];
    if(!(a==b || (a!=a && b!=b))) return 0;
  }
  return 1;
}
int equivalent(size_t n,const float*a,const float*b,float*left,float*right,
               const struct xnn_f32_default_params*params) {
  test_neon(4*n,a,b,left,params);test_rvv(4*n,a,b,right,params);
  return compare_outputs(n,left,right);
}
