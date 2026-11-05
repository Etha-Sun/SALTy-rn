#include <riscv_vector.h>
#include <stddef.h>
#include <assert.h>

void test_rvv(
    size_t batch,
    const float* input,
    float* output,
    const struct xnn_f32_lrelu_params* params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input != NULL);
  assert(output != NULL);

  size_t n = batch / sizeof(float);
  const float slope = params->scalar.slope;

  size_t vlmax = __riscv_vsetvlmax_e32m8();
  size_t i = 0;

  // Strategy 12: Overlapping-Last-Block for Tail Handling
  // If we have at least one full vlmax of data, we can avoid vsetvl bubbles.
  if (n >= vlmax) {
    // Unrolled loop for optimal overlapping and dual-issue
    for (; i + 2 * vlmax <= n; i += 2 * vlmax) {
      // Chunk 0: Access and Compute
      vfloat32m8_t vx0 = __riscv_vle32_v_f32m8(input + i, vlmax);
      vint32m8_t vxi0 = __riscv_vreinterpret_v_f32m8_i32m8(vx0);
      vbool4_t m0 = __riscv_vmslt_vx_i32m8_b4(vxi0, 0, vlmax);
      vfloat32m8_t vy0 = __riscv_vfmul_vf_f32m8_mu(m0, vx0, vx0, slope, vlmax);

      // Overlap: Issue Load for Chunk 1 while Chunk 0 writes back
      vfloat32m8_t vx1 = __riscv_vle32_v_f32m8(input + i + vlmax, vlmax);
      __riscv_vse32_v_f32m8(output + i, vy0, vlmax);

      // Chunk 1: Compute and Store
      vint32m8_t vxi1 = __riscv_vreinterpret_v_f32m8_i32m8(vx1);
      vbool4_t m1 = __riscv_vmslt_vx_i32m8_b4(vxi1, 0, vlmax);
      vfloat32m8_t vy1 = __riscv_vfmul_vf_f32m8_mu(m1, vx1, vx1, slope, vlmax);
      __riscv_vse32_v_f32m8(output + i + vlmax, vy1, vlmax);
    }

    // Process a single full block if remaining elements are between vlmax and 2*vlmax
    if (i + vlmax <= n) {
      vfloat32m8_t vx = __riscv_vle32_v_f32m8(input + i, vlmax);
      vint32m8_t vxi = __riscv_vreinterpret_v_f32m8_i32m8(vx);
      vbool4_t m = __riscv_vmslt_vx_i32m8_b4(vxi, 0, vlmax);
      vfloat32m8_t vy = __riscv_vfmul_vf_f32m8_mu(m, vx, vx, slope, vlmax);
      __riscv_vse32_v_f32m8(output + i, vy, vlmax);
      i += vlmax;
    }

    // Handle any final unaligned tail (1 to vlmax - 1 elements) via Overlapping-Last-Block
    if (i < n) {
      size_t offset = n - vlmax;
      vfloat32m8_t vx = __riscv_vle32_v_f32m8(input + offset, vlmax);
      vint32m8_t vxi = __riscv_vreinterpret_v_f32m8_i32m8(vx);
      vbool4_t m = __riscv_vmslt_vx_i32m8_b4(vxi, 0, vlmax);
      vfloat32m8_t vy = __riscv_vfmul_vf_f32m8_mu(m, vx, vx, slope, vlmax);
      __riscv_vse32_v_f32m8(output + offset, vy, vlmax);
    }
  } else {
    // Standard vsetvl fallback when total elements strictly < vlmax
    size_t vl = __riscv_vsetvl_e32m8(n);
    vfloat32m8_t vx = __riscv_vle32_v_f32m8(input, vl);
    vint32m8_t vxi = __riscv_vreinterpret_v_f32m8_i32m8(vx);
    vbool4_t m = __riscv_vmslt_vx_i32m8_b4(vxi, 0, vl);
    vfloat32m8_t vy = __riscv_vfmul_vf_f32m8_mu(m, vx, vx, slope, vl);
    __riscv_vse32_v_f32m8(output, vy, vl);
  }
}
