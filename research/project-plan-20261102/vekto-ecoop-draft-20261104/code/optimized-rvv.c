#include <riscv_vector.h>
#include <stddef.h>
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

  size_t n = batch / sizeof(float);

  // Saturn is a short-vector microarchitecture. Using a large LMUL (m8) is critical
  // to increase the instruction chime length. This hides functional unit latencies 
  // (e.g., the 2-stage FP compare/min/max pipeline) and reduces pressure on the 
  // scalar instruction fetch unit.
  const size_t vlmax = __riscv_vsetvlmax_e32m8();

  // Strategy 21: Replace the complex pointer-difference logic in the loop condition 
  // with a dedicated scalar down-counter to streamline scalar ALU operations and 
  // reduce register pressure.
  while (n >= vlmax) {
    // Saturn's Decoupled Access-Execute (DAE) design allows the Load sequencer (VLS)
    // to run ahead of the Datapath (VXS) and Store (VSS) sequencers.
    // The instructions below are structured to facilitate chaining across these sequencers.
    vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vlmax);
    vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vlmax);

    // vfmax targets the VXS sequencer (FPConvPipe).
    vfloat32m8_t vacc = __riscv_vfmax_vv_f32m8(va, vb, vlmax);

    // vse targets the VSS sequencer.
    __riscv_vse32_v_f32m8(output, vacc, vlmax);

    // Increment pointers by the fixed vlmax. Scalar arithmetic overlaps with 
    // vector execution due to decoupling.
    input_a += vlmax;
    input_b += vlmax;
    output += vlmax;
    n -= vlmax;
  }

  // Variable-Length Tail Block: Process the remaining elements.
  // We only execute a vsetvl instruction here for the fractional remainder.
  if (n > 0) {
    size_t vl = __riscv_vsetvl_e32m8(n);
    
    vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vl);
    vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vl);

    vfloat32m8_t vacc = __riscv_vfmax_vv_f32m8(va, vb, vl);

    __riscv_vse32_v_f32m8(output, vacc, vl);
  }
}
