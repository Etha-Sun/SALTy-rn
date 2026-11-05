#include <riscv_vector.h>
#include <assert.h>
#include <stddef.h>

struct xnn_f32_default_params {
  char nothing;
};

/**
 * @brief Optimized RVV implementation of a float vector multiply-by-scalar.
 * 
 * Target: Saturn RISC-V Vector Microarchitecture.
 */
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
  const float b = *input_b;

  const float* a_ptr = input_a;
  float* o_ptr = output;

  // Hoist vsetvl outside the inner loop to eliminate pipeline bubbles 
  // from repeated vsetvl calls.
  const size_t vlmax = __riscv_vsetvlmax_e32m8();

  // Strategy 4: Simplify or remove unnecessary code.
  // A straight-line loop natively maximizes parallel issue and latency hiding 
  // due to Saturn's hardware vector chaining. The load (VLS), multiply (VXS), 
  // and store (VSS) sequencers will operate concurrently. This avoids the scalar 
  // overhead and branch penalties associated with manual software pipelining.
  while (n >= vlmax) {
    vfloat32m8_t va = __riscv_vle32_v_f32m8(a_ptr, vlmax);
    vfloat32m8_t vacc = __riscv_vfmul_vf_f32m8(va, b, vlmax);
    
    // Intertwine scalar address bookkeeping between vector instructions 
    // to hide scalar arithmetic latencies behind the vector dispatch.
    a_ptr += vlmax;
    n -= vlmax;
    
    __riscv_vse32_v_f32m8(o_ptr, vacc, vlmax);
    o_ptr += vlmax;
  }

  // Handle any remaining tail elements (n < VLMAX).
  if (n > 0) {
    size_t vlt = __riscv_vsetvl_e32m8(n);
    vfloat32m8_t va_tail = __riscv_vle32_v_f32m8(a_ptr, vlt);
    vfloat32m8_t vacc_tail = __riscv_vfmul_vf_f32m8(va_tail, b, vlt);
    __riscv_vse32_v_f32m8(o_ptr, vacc_tail, vlt);
  }
}
