#include "../../../contracts/VaddWrapper/wrapper_def.h"
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ include strategies "comparator.strategies" */
/*@ include strategies "wrapper.strategies" */
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
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
int compare_outputs(size_t n, const float *left, const float *right)
/*@ With (L: list fp32) (R: list fp32)
    Require 0 < n && n <= 4611686018427387900 &&
            outputs_related(L,R) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
    Ensure __return == 1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */;
int equivalent(size_t n, const float *input_a, const float *input_b,
               float *left, float *right)
/*@ With (A: list fp32) (B: list fp32)
    Require 0 < n && n <= 4611686018427387900 &&
            input_a != 0 && input_b != 0 && left != 0 && right != 0 &&
            FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
            FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n)
    Ensure exists (L: list fp32) (R: list fp32), __return == 1 &&
           FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
           FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
  struct xnn_f32_default_params params; params.unused = 0;
  /*@ Assert n == (n * sizeof(float))/4 && (n * sizeof(float))%4 == 0 &&
      0 < n * sizeof(float) && n * sizeof(float) <= 18446744073709551603 && &params != 0 &&
      n == n@pre && input_a == input_a@pre && input_b == input_b@pre && left == left@pre && right == right@pre &&
      0 < n && n <= 4611686018427387900 && input_a != 0 && input_b != 0 && left != 0 && right != 0 &&
      store(&(params.unused),char,0) * FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
      FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) */
  test_neon(n * sizeof(float), input_a, input_b, left, &params);
  test_rvv(n * sizeof(float), input_a, input_b, right, &params);
  return compare_outputs(n, left, right);
}
