#include <riscv_vector.h>
#include <stddef.h>
#include <assert.h>

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
  size_t i = 0;

  const float* __restrict p_a = input_a;
  const float* __restrict p_b = input_b;
  float* __restrict p_out = output;

  // Use LMUL=4 to provide longer chimes and hide pipeline latencies.
  size_t vl = __riscv_vsetvl_e32m4(n);
  
  // Initial load of the first chunk
  vfloat32m4_t va = __riscv_vle32_v_f32m4(p_a, vl);
  vfloat32m4_t vb = __riscv_vle32_v_f32m4(p_b, vl);
  
  // Advance read pointers to the next chunk immediately
  p_a += vl;
  p_b += vl;
  i += vl;

  while (i < n) {
    size_t next_vl = __riscv_vsetvl_e32m4(n - i);
    
    // 1. Prefetch next chunk: VLS sequencer starts these immediately
    vfloat32m4_t va_next = __riscv_vle32_v_f32m4(p_a, next_vl);
    vfloat32m4_t vb_next = __riscv_vle32_v_f32m4(p_b, next_vl);

    // 2. Compute current chunk: VXS sequencer handles this (chains with previous loads)
    vfloat32m4_t vacc = __riscv_vfmin_vv_f32m4(va, vb, vl);

    // 3. Store current chunk: VSS sequencer handles this (chains with VXS execution)
    // Use the dedicated trailing pointer to avoid scalar subtraction
    __riscv_vse32_v_f32m4(p_out, vacc, vl);

    // Advance all pointers and loop state
    p_a += next_vl;
    p_b += next_vl;
    p_out += vl; 
    
    va = va_next; 
    vb = vb_next; 
    vl = next_vl;
    i += vl;
  }

  // Drain the final chunk
  vfloat32m4_t vacc = __riscv_vfmin_vv_f32m4(va, vb, vl);
  __riscv_vse32_v_f32m4(p_out, vacc, vl);
}
