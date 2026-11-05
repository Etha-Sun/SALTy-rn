#include <riscv_vector.h>
#include <assert.h>
#include <stdint.h>

void test_rvv(
    size_t batch,
    const float* input,
    float* output,
    const struct xnn_f32_default_params* params) 
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input != NULL);
  assert(output != NULL);

  size_t n = batch / sizeof(float);
  const size_t vlmax = __riscv_vsetvlmax_e32m8();

  // Fixed-VL Hot Loop: Process full vector chunks at vlmax
  // Using direct pointer accumulation to shorten scalar dependency chains
  for (; n >= vlmax; n -= vlmax) {
    // Load input elements (VLS Sequencer)
    vfloat32m8_t vx = __riscv_vle32_v_f32m8(input, vlmax);

    // Magnitude check: Use bit-manipulation to check if abs(x) < 2^23
    vint32m8_t vx_int = __riscv_vreinterpret_v_f32m8_i32m8(vx);
    vint32m8_t vabsx_int = __riscv_vand_vx_i32m8(vx_int, 0x7FFFFFFF, vlmax);
    vbool4_t mask_le = __riscv_vmsle_vx_i32m8_b4(vabsx_int, 0x4B000000, vlmax);

    // Rounding logic: FP -> Int -> FP conversion
    vint32m8_t v_int = __riscv_vfcvt_x_f_v_i32m8(vx, vlmax);
    vfloat32m8_t vrnd = __riscv_vfcvt_f_x_v_f32m8(v_int, vlmax);

    // Final selection and sign restoration
    vfloat32m8_t vy = __riscv_vfsgnj_vv_f32m8_mu(mask_le, vx, vrnd, vx, vlmax);

    // Store results (VSS Sequencer)
    __riscv_vse32_v_f32m8(output, vy, vlmax);

    // Increment pointers and update remaining count
    input += vlmax;
    output += vlmax;
  }

  // VLA Tail: Handle remaining elements
  if (n > 0) {
    size_t vl = __riscv_vsetvl_e32m8(n);
    vfloat32m8_t vx = __riscv_vle32_v_f32m8(input, vl);

    vint32m8_t vx_int = __riscv_vreinterpret_v_f32m8_i32m8(vx);
    vint32m8_t vabsx_int = __riscv_vand_vx_i32m8(vx_int, 0x7FFFFFFF, vl);
    vbool4_t mask_le = __riscv_vmsle_vx_i32m8_b4(vabsx_int, 0x4B000000, vl);

    vint32m8_t v_int = __riscv_vfcvt_x_f_v_i32m8(vx, vl);
    vfloat32m8_t vrnd = __riscv_vfcvt_f_x_v_f32m8(v_int, vl);

    vfloat32m8_t vy = __riscv_vfsgnj_vv_f32m8_mu(mask_le, vx, vrnd, vx, vl);

    __riscv_vse32_v_f32m8(output, vy, vl);
  }
}
