/* F32-VDIV review entry (VADD proof shape): original implementations are in impl/.
 * Require = precondition; Ensure = postcondition.
 * Inputs: n>0, n+3 readable floats each; outputs: n writable floats each.
 * All four buffers are disjoint. Equality: numeric equality or both NaN.
 * C-shim partial correctness, binary32/RNE, LP64/little-endian, RVV cap=32.
 */
#include "contracts/VaddWrapper/wrapper_def.h"
/*@ Import Coq Require Import NanBridge.BridgeLogic */
/*@ Extern Coq (bit_same : fp32 -> fp32 -> Prop)
               (returned_one : Z -> Prop)
               (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
#ifndef QCP_RUNTIME_SHIM_H
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#endif

void test_neon(size_t batch, const float *input_a, const float *input_b,
               float *output, const struct xnn_f32_default_params *params)
/*@ With (A: list fp32) (B: list fp32)
    Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 && params != 0 &&
            input_a != 0 && input_b != 0 && output != 0 &&
            FloatArray::full(input_a,batch/4+3,A) *
            FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4)
    Ensure FloatArray::full(input_a,batch/4+3,A) *
           FloatArray::full(input_b,batch/4+3,B) *
           FloatArray::full(output,batch/4,vadd_values(batch/4,A,B)) */;

void test_rvv(size_t batch, const float *input_a, const float *input_b,
               float *output, const struct xnn_f32_default_params *params)
/*@ With (A: list fp32) (B: list fp32)
    Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 && params != 0 &&
            input_a != 0 && input_b != 0 && output != 0 &&
            FloatArray::full(input_a,batch/4+3,A) *
            FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4)
    Ensure FloatArray::full(input_a,batch/4+3,A) *
           FloatArray::full(input_b,batch/4+3,B) *
           FloatArray::full(output,batch/4,vadd_values(batch/4,A,B)) */;

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
    Require 0 < n && n <= 4611686018427387900 &&
            outputs_related(L,R) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
    Ensure __return == 1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
  size_t i = 0;
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

int equivalent(size_t n, const float *input_a, const float *input_b,
               float *left, float *right)
/*@ With (A: list fp32) (B: list fp32)
    Require 0 < n && n <= 4611686018427387900 &&
            input_a != 0 && input_b != 0 && left != 0 && right != 0 &&
            FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
            FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n)
    Ensure exists (L: list fp32) (R: list fp32), __return == 1 && outputs_related(L,R) &&
           FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
           FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
  struct xnn_f32_default_params params; params.unused = 0;
  test_neon(n * sizeof(float), input_a, input_b, left, &params);
  test_rvv(n * sizeof(float), input_a, input_b, right, &params);
  return compare_outputs(n, left, right);
}
