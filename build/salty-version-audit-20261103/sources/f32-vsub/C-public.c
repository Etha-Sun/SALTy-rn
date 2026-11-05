#include <riscv_vector.h>
#include <stddef.h>
#include <assert.h>
#include <stdint.h>

void test_rvv(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* restrict params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  size_t n = batch / sizeof(float);
  
  // Maximize LMUL to 8 to create long chimes, naturally hiding the 4-stage
  // FP pipeline latency without causing register spills.
  const size_t vlmax = __riscv_vsetvlmax_e32m8();

  // Fixed-VL Hot Loop: Eliminates vsetvl transitions inside the primary loop
  for (; n >= vlmax; n -= vlmax) {
    vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vlmax);
    vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vlmax);
    
    vfloat32m8_t vacc = __riscv_vfsub_vv_f32m8(va, vb, vlmax);
    
    __riscv_vse32_v_f32m8(output, vacc, vlmax);
    
    input_a += vlmax;
    input_b += vlmax;
    output  += vlmax;
  }

  // VLA Tail: Process any remaining elements with a single customized vector length
  if (n > 0) {
    size_t vl = __riscv_vsetvl_e32m8(n);
    
    vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vl);
    vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vl);
    
    vfloat32m8_t vacc = __riscv_vfsub_vv_f32m8(va, vb, vl);
    
    __riscv_vse32_v_f32m8(output, vacc, vl);
  }
}
