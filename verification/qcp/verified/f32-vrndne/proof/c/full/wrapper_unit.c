/* Full binary32 domain; RNE; fixed VLEN128/SEW32/LMUL8/VLMAX32 C-shim.
 * Input padding: 3 readable float values. Output observation: numeric equality
 * or both NaN, preserving input and all disjoint frame memory. No termination,
 * physical ABI, arbitrary VLEN or ISA correspondence theorem is claimed. */
#include "../../../shim/types.h"
#include "../../../shim/program_model.h"
#include "../../../../../verified/f32-vadd/contracts/VaddWrapper/wrapper_def.h"
/*@ Import Coq Require Import NanBridge.BridgeLogic */
/*@ Extern Coq (bit_same : fp32 -> fp32 -> Prop) (returned_one : Z -> Prop) */


/*@ include strategies "comparator.strategies" */

/*@ include strategies "wrapper.strategies" */

void test_neon(size_t batch,const float *input,float *output,
 const struct xnn_f32_default_params *restrict params)
/*@ With (A:list fp32)
 Require 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 &&
 input != 0 && output != 0 && FloatArray::full(input,batch/4+3,A) * FloatArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input,batch/4+3,A) * FloatArray::full(output,batch/4,rndne_values(batch/4,A)) */;

void test_rvv(size_t batch,const float *input,float *output,
 const struct xnn_f32_default_params *restrict params)
/*@ With (A:list fp32)
 Require 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 &&
 input != 0 && output != 0 && FloatArray::full(input,batch/4+3,A) * FloatArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input,batch/4+3,A) * FloatArray::full(output,batch/4,rndne_rvv_values(batch/4,A)) */;

void qcp_vadd_read(const float *p, float *out, size_t n, size_t i)
/*@ With (L: list fp32)
    Require 0 < n && 0 <= i && i < n && FloatArray::full(p,n,L) * undef_data_at(out,float)
    Ensure FloatArray::seg(p,0,n,L) * store(out,float,L[i]) */
{ *out = p[i]; }

float preserve_float(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */
{ return x; }

int check_observation(float x,float y)
/*@ Require same_value(x,y) && emp Ensure returned_one(__return) && emp */
{
  float xc=preserve_float(x);
  float yc=preserve_float(y);
  if(x==y) return 1;
  if(x!=xc && y!=yc) return 1;
  return 0;
}

int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return == 1 && emp */
{ return check_observation(x,y); }

int compare_outputs(size_t n, const float *left, const float *right)
/*@ With (L: list fp32) (R: list fp32)
    Require 0 < n && n <= 4611686018427387903 &&
            outputs_related(L,R) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
    Ensure __return == 1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
  size_t i = 0;
  /*@ Inv n == n@pre && left == left@pre && right == right@pre &&
          0 < n && n <= 4611686018427387903 && 0 <= i && i <= n &&
          Zlength(L) == n && outputs_related(L,R) &&
          FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
while (i < n) {
    float x;
    float y;
    qcp_vadd_read(left,&x,n,i);
    qcp_vadd_read(right,&y,n,i);
    if (!same_lane(x,y)) return 0;
    i++;
  }
  return 1;
}

int equivalent(size_t n,const float *input,float *left,float *right,
 const struct xnn_f32_default_params *params)
/*@ With (A:list fp32)
 Require 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&
 FloatArray::full(input,n+3,A) * FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n)
 Ensure exists (L:list fp32) (R:list fp32), __return == 1 && outputs_related(L,R) &&
 FloatArray::full(input,n+3,A) * FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
 /*@ Assert n == (n * sizeof(float))/4 && (n * sizeof(float))%4 == 0 &&
 0 < n * sizeof(float) && n * sizeof(float) <= 18446744073709551615 &&
 n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&
 FloatArray::full(input,n+3,A) * FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) */
test_neon(n * sizeof(float),input,left,params);
 test_rvv(n * sizeof(float),input,right,params);
 /*@ Assert n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387903 && outputs_related(rndne_values(n,A),rndne_rvv_values(n,A)) &&
 FloatArray::full(input,n+3,A) * FloatArray::full(left,n,rndne_values(n,A)) * FloatArray::full(right,n,rndne_rvv_values(n,A)) */
return compare_outputs(n,left,right);
}