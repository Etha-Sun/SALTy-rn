#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

void test_rvv(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  const float* ar = input_a;
  const float* ai = (const float*) ((uintptr_t) input_a + batch);
  const float* br = input_b;
  const float* bi = (const float*) ((uintptr_t) input_b + batch);
  float* out_r = output;
  float* out_i = (float*) ((uintptr_t) output + batch);

  size_t n = batch / sizeof(float);
  if (n == 0) return;

  // Initial chunk setup: Load the first set of vectors to kick off software pipelining
  size_t vl = __riscv_vsetvl_e32m2(n);
  vfloat32m2_t var = __riscv_vle32_v_f32m2(ar, vl);
  vfloat32m2_t vai = __riscv_vle32_v_f32m2(ai, vl);
  vfloat32m2_t vbr = __riscv_vle32_v_f32m2(br, vl);
  vfloat32m2_t vbi = __riscv_vle32_v_f32m2(bi, vl);
  size_t i = vl;

  // Software pipelined main loop
  while (i < n) {
    size_t next_vl = __riscv_vsetvl_e32m2(n - i);

    // Interleave Loads (VLS) with Compute (VXS)
    // This maximizes Saturn sequencer utilization by keeping the Load (VLS) and Arithmetic (VXS) 
    // sequencers busy simultaneously through decoupled execution.
    vfloat32m2_t var_next = __riscv_vle32_v_f32m2(ar + i, next_vl);
    vfloat32m2_t vaccr = __riscv_vfmul_vv_f32m2(var, vbr, vl);
    vfloat32m2_t vai_next = __riscv_vle32_v_f32m2(ai + i, next_vl);
    vfloat32m2_t vacci = __riscv_vfmul_vv_f32m2(var, vbi, vl);
    vfloat32m2_t vbr_next = __riscv_vle32_v_f32m2(br + i, next_vl);
    vfloat32m2_t temp_r = __riscv_vfmul_vv_f32m2(vai, vbi, vl);
    vfloat32m2_t vbi_next = __riscv_vle32_v_f32m2(bi + i, next_vl);
    vaccr = __riscv_vfsub_vv_f32m2(vaccr, temp_r, vl);

    // Strategy 13: VSS Dispatch Acceleration
    // Reorder the vector store instruction for the real part to follow its final producer (vfsub)
    // immediately. This allows the Store Sequencer (VSS) to start writeback while the VXS
    // is still calculating the imaginary part.
    __riscv_vse32_v_f32m2(out_r + i - vl, vaccr, vl);

    vfloat32m2_t temp_i = __riscv_vfmul_vv_f32m2(vai, vbr, vl);
    vacci = __riscv_vfadd_vv_f32m2(vacci, temp_i, vl);

    // Store imaginary part
    __riscv_vse32_v_f32m2(out_i + i - vl, vacci, vl);

    // Move to next chunk registers
    var = var_next;
    vai = vai_next;
    vbr = vbr_next;
    vbi = vbi_next;
    vl = next_vl;
    i += next_vl;
  }

  // Drain final chunk
  // Replicate the VSS dispatch acceleration pattern for the final elements
  vfloat32m2_t vaccr = __riscv_vfmul_vv_f32m2(var, vbr, vl);
  vfloat32m2_t vacci = __riscv_vfmul_vv_f32m2(var, vbi, vl);
  vfloat32m2_t temp_r = __riscv_vfmul_vv_f32m2(vai, vbi, vl);
  vaccr = __riscv_vfsub_vv_f32m2(vaccr, temp_r, vl);

  // Accelerated VSS dispatch for the real part
  __riscv_vse32_v_f32m2(out_r + i - vl, vaccr, vl);

  vfloat32m2_t temp_i = __riscv_vfmul_vv_f32m2(vai, vbr, vl);
  vacci = __riscv_vfadd_vv_f32m2(vacci, temp_i, vl);

  // Store final imaginary part
  __riscv_vse32_v_f32m2(out_i + i - vl, vacci, vl);
}
