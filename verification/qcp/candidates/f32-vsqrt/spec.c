/* Unary binary32 square-root candidate. Negative inputs and NaNs remain legal. */
#include "contracts/spec.h"

void test_neon(size_t batch,const float *input,float *output,const struct xnn_f32_default_params *unused_params)
/*@ With (A: list fp32)
 Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 && input != 0 && output != 0 &&
         FloatArray::full(input,batch/4+3,A) * FloatArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input,batch/4+3,A) * FloatArray::full(output,batch/4,sqrt_values(batch/4,A)) */;

void test_rvv(size_t batch,const float *input,float *output,const struct xnn_f32_default_params *unused_params)
/*@ With (A: list fp32)
 Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 && input != 0 && output != 0 &&
         FloatArray::full(input,batch/4+3,A) * FloatArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input,batch/4+3,A) * FloatArray::full(output,batch/4,sqrt_values(batch/4,A)) */;

int equivalent(size_t n,const float *input,float *left,float *right)
/*@ With (A: list fp32)
 Require 0 < n && n <= 4611686018427387900 && input != 0 && left != 0 && right != 0 &&
         FloatArray::full(input,n+3,A) * FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n)
 Ensure exists (L: list fp32) (R: list fp32), __return == 1 && outputs_related(L,R) &&
        FloatArray::full(input,n+3,A) * FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
 struct xnn_f32_default_params params; params.unused=0;
 test_neon(n*sizeof(float),input,left,&params);
 test_rvv(n*sizeof(float),input,right,&params);
 for(size_t i=0;i<n;i++) {
  float x=left[i],y=right[i],xc=x,yc=y;
  if (!(x==y || (x!=xc && y!=yc))) return 0;
 }
 return 1;
}
