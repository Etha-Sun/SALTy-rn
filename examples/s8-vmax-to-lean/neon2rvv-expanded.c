/* Manual expansion of the four wrappers in howjmay/neon2rvv at
 * 2abbe36cc3c52d4616f854f88894e5be11b96580. This is standalone RVV C;
 * it preserves the original NEON loop and does not require neon2rvv.h.
 */
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <riscv_vector.h>

struct salt_s8_vmax_params {
  struct {
    int8_t threshold;
  } scalar;
};

void test_neon(
    size_t batch,
    const int8_t* input,
    int8_t* output,
    const struct salt_s8_vmax_params* restrict params)
{
  assert(batch != 0);
  assert(batch % 16 == 0);
  assert(input != NULL);
  assert(output != NULL);

  /* vdupq_n_s8: neon2rvv.h:8121; int8x16_t maps to vint8m1_t. */
  const vint8m1_t vthreshold =
      __riscv_vmv_v_x_i8m1(params->scalar.threshold, 16);

  for (; batch >= 16; batch -= 16) {
    /* vld1q_s8: neon2rvv.h:13611. */
    vint8m1_t vx = __riscv_vle8_v_i8m1(input, 16); input += 16;
    /* vmaxq_s8: neon2rvv.h:3886. */
    vx = __riscv_vmax_vv_i8m1(vx, vthreshold, 16);
    /* vst1q_s8: neon2rvv.h:13859. */
    __riscv_vse8_v_i8m1(output, vx, 16); output += 16;
  }
}
