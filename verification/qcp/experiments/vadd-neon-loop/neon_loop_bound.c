#include "../../shared/vadd/intrinsics.h"
#include "../../shared/vadd/float_array_def.h"
#include "../vadd-neon/bridge_def.h"
/*@ include strategies "neon_bridge.strategies" */
#include "tail_def.h"
/*@ include strategies "neon_tail.strategies" */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ include strategies "float_array.strategies" */
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#define NULL ((void *)0)
#define assert(x) qcp_assert(x)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
/*
struct xnn_f32_default_params {
  char _;  // Dummy member variable to comply with the C standard
};
*/

void test_neon(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* restrict params) XNN_OOB_READS
/*@ With (A: list fp32) (B: list fp32)
    Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 && params != 0 &&
            input_a != 0 && input_b != 0 && output != 0 &&
            FloatArray::full(input_a,batch/4+3,A) *
            FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4)
    Ensure FloatArray::full(input_a,batch/4+3,A) *
           FloatArray::full(input_b,batch/4+3,B) *
           FloatArray::full(output,batch/4,vadd_values(batch/4,A,B)) */
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

/*@ Inv Assert exists (k:Z),
0 <= k && k*4 + batch == batch@pre && batch % 4 == 0 &&
0 <= batch && batch <= batch@pre && k <= batch@pre/4 &&
(batch == 0 || batch == 4 || batch == 8 || batch == 12 || 16 <= batch) &&
params == params@pre && params != 0 &&
input_a == input_a@pre + k && input_b == input_b@pre + k && output == output@pre + k &&
input_a != 0 && input_b != 0 && output != 0 &&
(batch < 16 || 4 <= batch/4) && (batch == 0 || 1 <= batch/4) &&
FloatArray::full(input_a@pre,k,fp32_slice(0,k,A)) *
FloatArray::full(input_a,batch/4+3,fp32_slice(k,batch@pre/4+3,A)) *
FloatArray::full(input_b@pre,k,fp32_slice(0,k,B)) *
FloatArray::full(input_b,batch/4+3,fp32_slice(k,batch@pre/4+3,B)) *
FloatArray::full(output@pre,k,vadd_values(k,A,B)) * FloatArray::undef_full(output,batch/4) */
  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
    struct float32x4_t va; vld1q_f32(&va, input_a); input_a += 4;
    struct float32x4_t vb; vld1q_f32(&vb, input_b); input_b += 4;

    struct float32x4_t vacc; vaddq_f32(&vacc, &va, &vb);

    vst1q_f32(output, &vacc); output += 4;
  }
  if XNN_UNLIKELY(batch != 0) {
    struct float32x4_t va; vld1q_f32(&va, input_a);
    struct float32x4_t vb; vld1q_f32(&vb, input_b);

    struct float32x4_t vacc; vaddq_f32(&vacc, &va, &vb);

    struct float32x2_t vacc_lo; vget_low_f32(&vacc_lo, &vacc);
    if (batch & (2 * sizeof(float))) {
      vst1_f32(output, &vacc_lo); output += 2;
      vget_high_f32(&vacc_lo, &vacc);
    }
    if (batch & (1 * sizeof(float))) {
      vst1_lane_f32(output, &vacc_lo, 0) /*@ where z = vacc_lo.s0 */;
    }
  }
}
