#include <riscv_vector.h>
#include <assert.h>
#include <stddef.h>

struct xnn_f32_default_params;

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
  if (n == 0) return;

  // Prologue: prime the pump with the first buffer 
  size_t vl0 = __riscv_vsetvl_e32m4(n);
  vfloat32m4_t a0 = __riscv_vle32_v_f32m4(input_a, vl0);
  vfloat32m4_t b0 = __riscv_vle32_v_f32m4(input_b, vl0);
  
  input_a += vl0;
  input_b += vl0;
  n -= vl0;

  // Main double-buffered loop
  while (n > 0) {
    // 1. Calculate VL for the NEXT iteration
    size_t vl1 = __riscv_vsetvl_e32m4(n);
    
    // 2. Load data for the NEXT iteration (VLS sequencer)
    vfloat32m4_t a1 = __riscv_vle32_v_f32m4(input_a, vl1);
    vfloat32m4_t b1 = __riscv_vle32_v_f32m4(input_b, vl1);
    
    // 3. Compute results for the CURRENT iteration (VXS sequencer)
    // Needs to use vl0 since that's the length of the data currently in a0 and b0
    vfloat32m4_t c0 = __riscv_vfadd_vv_f32m4(a0, b0, vl0);
    
    // 4. Store results for the CURRENT iteration (VSS sequencer)
    __riscv_vse32_v_f32m4(output, c0, vl0);
    
    // Scalar bookkeeping for pointers
    output += vl0;
    input_a += vl1;
    input_b += vl1;
    
    // Rotate buffers and vector lengths
    a0 = a1; 
    b0 = b1; 
    vl0 = vl1;
    n -= vl1;
  }
  
  // Epilogue: Drain the final buffer
  vfloat32m4_t c0 = __riscv_vfadd_vv_f32m4(a0, b0, vl0);
  __riscv_vse32_v_f32m4(output, c0, vl0);
}
