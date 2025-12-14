#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    // Modified to use tree reduction (like NEON) instead of linear reduction
    // This ensures bit-identical results with NEON implementation
    //
    // NEON's vpadd_f16 does pairwise addition: [a0+a1, a2+a3, b0+b1, b2+b3]
    // We emulate this by extracting even/odd elements and adding them:
    //   even = [a0, a2, ...]
    //   odd  = [a1, a3, ...]
    //   result = even + odd = [a0+a1, a2+a3, ...]
    void xnn_f16_rsum_ukernel__rvv_u16_acc2(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_scale_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(uint16_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const _Float16* i = (const _Float16*) input;
  _Float16* o = (_Float16*) output;

  size_t n = batch / sizeof(uint16_t);

  // Use tree reduction like NEON:
  // For 4 elements: result = (a0+a1) + (a2+a3)
  // For 8 elements: result = ((a0+a1)+(a2+a3)) + ((a4+a5)+(a6+a7))

  // Initialize accumulator vectors to zero (8 elements each)
  vfloat16m1_t vacc0 = __riscv_vfmv_v_f_f16m1((_Float16)0.0f, 8);
  vfloat16m1_t vacc1 = __riscv_vfmv_v_f_f16m1((_Float16)0.0f, 8);

  // Process 16 elements at a time (matching NEON's 16-element loop)
  while (n >= 16) {
    vfloat16m1_t vt0 = __riscv_vle16_v_f16m1(i, 8);
    vfloat16m1_t vt1 = __riscv_vle16_v_f16m1(i + 8, 8);
    vacc0 = __riscv_vfadd_vv_f16m1(vacc0, vt0, 8);
    vacc1 = __riscv_vfadd_vv_f16m1(vacc1, vt1, 8);
    i += 16;
    n -= 16;
  }
  vacc0 = __riscv_vfadd_vv_f16m1(vacc0, vacc1, 8);

  // Process 8 elements at a time
  while (n >= 8) {
    vfloat16m1_t vt = __riscv_vle16_v_f16m1(i, 8);
    vacc0 = __riscv_vfadd_vv_f16m1(vacc0, vt, 8);
    i += 8;
    n -= 8;
  }

  // Combine low and high halves: vacc = vacc0[0:3] + vacc0[4:7]
  // This matches: vadd_f16(vget_low_f16(vacc0), vget_high_f16(vacc0))
  vfloat16m1_t vacc_high = __riscv_vslidedown_vx_f16m1(vacc0, 4, 4);
  vfloat16m1_t vacc = __riscv_vfadd_vv_f16m1(vacc0, vacc_high, 4);
  // Now vacc = [v0+v4, v1+v5, v2+v6, v3+v7]

  // Process 4 elements if remaining
  if (n & 4) {
    vfloat16m1_t vt = __riscv_vle16_v_f16m1(i, 4);
    vacc = __riscv_vfadd_vv_f16m1(vacc, vt, 4);
    i += 4;
  }
  // vacc = [a0, a1, a2, a3]

  // First pairwise add emulation (like vpadd_f16):
  // NEON vpadd_f16([a0,a1,a2,a3], [a0,a1,a2,a3]) = [a0+a1, a2+a3, a0+a1, a2+a3]
  // We need: result[0] = a0+a1, result[1] = a2+a3
  // Extract: even=[a0,a2], odd=[a1,a3], result = even + odd
  // With slidedown: slidedown(vacc, 1) gives [a1, a2, a3, 0]
  // So vacc[0]+slidedown[0] = a0+a1, vacc[2]+slidedown[2] = a2+a3
  // But we need results at positions 0 and 1, not 0 and 2
  //
  // Alternative: use stride-2 approach
  // Even positions: a0, a2 -> positions 0, 1 after deinterleave
  // Odd positions: a1, a3 -> positions 0, 1 after deinterleave
  // Then add: [a0+a1, a2+a3]
  //
  // With RVV, we can simulate by:
  // 1. vacc_1 = slidedown(vacc, 1) -> [a1, a2, a3, 0]
  // 2. sum01 = vacc[0] + vacc_1[0] = a0 + a1  (first element)
  // 3. vacc_2 = slidedown(vacc, 2) -> [a2, a3, 0, 0]
  // 4. vacc_3 = slidedown(vacc, 3) -> [a3, 0, 0, 0]
  // 5. sum23 = vacc_2[0] + vacc_3[0] = a2 + a3  (at position 0 of separate vector)
  //
  // Simpler: just compute the partial sums in a way that matches NEON's tree structure
  // After first vpadd: vacc[0] = a0+a1, vacc[1] = a2+a3
  // We need to compute (a0+a1) at element 0 and (a2+a3) at element 1

  // Step 1: Get [a1, a3, ?, ?] by slidedown by 1 on positions 0,2
  vfloat16m1_t v_shifted1 = __riscv_vslidedown_vx_f16m1(vacc, 1, 4);
  // v_shifted1 = [a1, a2, a3, 0]

  // Compute pairwise at even positions: a0+a1, a2+a3 stored at positions 0, 2
  // But we need them at positions 0, 1 like NEON does
  //
  // Actually let's trace NEON more carefully:
  // vpadd_f16(vacc, vacc) where vacc=[a0,a1,a2,a3]:
  //   result[0] = vacc[0] + vacc[1] = a0+a1
  //   result[1] = vacc[2] + vacc[3] = a2+a3
  //   result[2] = vacc[0] + vacc[1] = a0+a1  (from second argument)
  //   result[3] = vacc[2] + vacc[3] = a2+a3
  //
  // To get [a0+a1, a2+a3, ...] we need:
  //   element 0: vacc[0] + vacc[1]
  //   element 1: vacc[2] + vacc[3]
  //
  // With slidedown by 1: [a1, a2, a3, 0]
  // vacc + slidedown = [a0+a1, a1+a2, a2+a3, a3+0]
  // Element 0 is correct (a0+a1), but element 1 is wrong (a1+a2 instead of a2+a3)
  //
  // Need different approach: use slidedown by 2 to get [a2, a3, 0, 0]
  vfloat16m1_t v_shifted2 = __riscv_vslidedown_vx_f16m1(vacc, 2, 4);
  // v_shifted2 = [a2, a3, 0, 0]

  // Now:
  // sum_low = vacc[0] + v_shifted1[0] = a0 + a1
  // sum_high = v_shifted2[0] + v_shifted2[1] = a2 + a3 ... no this doesn't work either

  // Let's use a different approach: construct result manually
  // We need result = [a0+a1, a2+a3, ...]
  //
  // Compute a0+a1: vacc[0] + slidedown(vacc,1)[0] = a0 + a1
  // Compute a2+a3: slidedown(vacc,2)[0] + slidedown(vacc,3)[0] = a2 + a3
  //
  // To pack these together, we can:
  // 1. Create a vector with a0+a1 at position 0
  // 2. Slideup by 1 the vector with a2+a3 at position 0
  // 3. OR them together... but we don't have OR for floats
  //
  // Alternative: just add element-wise with proper masking/selection
  //
  // Simplest correct approach for 4 elements:
  // result[0] = (a0+a1)
  // result[1] = (a2+a3)
  // result_final = result[0] + result[1] = (a0+a1) + (a2+a3)
  //
  // We can do this by:
  // 1. partial1 = vacc + slidedown(vacc,1) with vl=1 -> [a0+a1, ...]
  // 2. vacc2 = slidedown(vacc,2) -> [a2, a3, 0, 0]
  // 3. partial2 = vacc2 + slidedown(vacc2,1) with vl=1 -> [a2+a3, ...]
  // 4. final = partial1 + partial2 with vl=1 -> [(a0+a1)+(a2+a3)]

  // Compute a0+a1
  vfloat16m1_t partial1 = __riscv_vfadd_vv_f16m1(vacc, v_shifted1, 1);
  // partial1[0] = a0 + a1

  // Compute a2+a3
  vfloat16m1_t v_shifted3 = __riscv_vslidedown_vx_f16m1(vacc, 3, 4);
  // v_shifted3 = [a3, 0, 0, 0]
  vfloat16m1_t partial2 = __riscv_vfadd_vv_f16m1(v_shifted2, v_shifted3, 1);
  // partial2[0] = a2 + a3

  // Process 2 elements if remaining - must happen BEFORE final pairwise add
  if (n & 2) {
    // NEON loads 2 elements into positions 0,1 of a float16x4 and adds
    // At this point in NEON, vacc = [a0+a1, a2+a3, a0+a1, a2+a3]
    // Load vt = [b0, b1, 0, 0] (vld1_dup_u32 loads 2 elements)
    // vacc = vacc + vt = [a0+a1+b0, a2+a3+b1, a0+a1, a2+a3]
    //
    // For RVV, we have partial1[0]=a0+a1, partial2[0]=a2+a3
    // Load [b0, b1] and add to respective partials
    vfloat16m1_t vt = __riscv_vle16_v_f16m1(i, 2);
    // vt = [b0, b1, ...]

    // Add b0 to partial1[0]
    partial1 = __riscv_vfadd_vv_f16m1(partial1, vt, 1);
    // partial1[0] = a0+a1+b0

    // Add b1 to partial2[0] - need to get b1 into position 0
    vfloat16m1_t vt_shifted = __riscv_vslidedown_vx_f16m1(vt, 1, 2);
    partial2 = __riscv_vfadd_vv_f16m1(partial2, vt_shifted, 1);
    // partial2[0] = a2+a3+b1

    i += 2;
  }

  // Final pairwise add: (a0+a1+...) + (a2+a3+...)
  vacc = __riscv_vfadd_vv_f16m1(partial1, partial2, 1);
  // vacc[0] = final sum using tree reduction

  // Process 1 element if remaining
  if (n & 1) {
    vfloat16m1_t vt = __riscv_vle16_v_f16m1(i, 1);
    vacc = __riscv_vfadd_vv_f16m1(vacc, vt, 1);
  }

  // Multiply by scale
  _Float16 scale_val = *(const _Float16*)&params->scalar.scale;
  vfloat16m1_t vscale = __riscv_vfmv_v_f_f16m1(scale_val, 1);
  vacc = __riscv_vfmul_vv_f16m1(vacc, vscale, 1);

  // Add to existing output
  vfloat16m1_t vout = __riscv_vle16_v_f16m1(o, 1);
  vacc = __riscv_vfadd_vv_f16m1(vacc, vout, 1);

  // Store result
  __riscv_vse16_v_f16m1(o, vacc, 1);

  // Also store to scalar results for verification
  _Float16 sum = __riscv_vfmv_f_s_f16m1_f16(vacc);
  (void)sum;  // The intrinsic stores to g_riscv_scalar_results
}
}
