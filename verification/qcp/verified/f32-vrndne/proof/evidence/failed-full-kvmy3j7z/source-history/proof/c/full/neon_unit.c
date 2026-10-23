#include "../../../shim/neon_frontend.h"
/*@ Extern Coq (fp32_of_real : real -> fp32) */
/*
struct xnn_f32_default_params {
  char _;  // Dummy member variable to comply with the C standard
};
*/

void test_neon(
    size_t batch,
    const float* input,
    float* output,
    const struct xnn_f32_default_params* restrict params) XNN_OOB_READS/*@ With (A:list fp32)
 Require 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 &&
 input != 0 && output != 0 && FloatArray::full(input,batch/4+3,A) * FloatArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input,batch/4+3,A) * FloatArray::full(output,batch/4,rndne_values(batch/4,A)) */

{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const float32x4_t vmagic_number = vreinterpretq_f32_u32(vmovq_n_u32(UINT32_C(0x4B000000))) /*@ where a=0 */;
/*@ Inv Assert exists (k:Z),
 fp32_length(A) == batch@pre/4+3 &&
 0 <= k && k*4+batch == batch@pre && batch % 4 == 0 &&
 0 <= batch && batch <= batch@pre && k <= batch@pre/4 &&
 (batch == 0 || (batch == 4 && batch/4 == 1) ||
 (batch == 8 && batch/4 == 2) || (batch == 12 && batch/4 == 3) ||
 (16 <= batch && 4 <= batch/4)) && params == params@pre &&
 input == input@pre+k && output == output@pre+k && input != 0 && output != 0 &&
 FloatArray::full(input@pre,k,fp32_slice(0,k,A)) *
 FloatArray::full(input,batch/4+3,fp32_slice(k,batch@pre/4+3,A)) *
 store(&(vmagic_number.s0),float,fp32_of_bits(1258291200)) *
 store(&(vmagic_number.s1),float,fp32_of_bits(1258291200)) *
 store(&(vmagic_number.s2),float,fp32_of_bits(1258291200)) *
 store(&(vmagic_number.s3),float,fp32_of_bits(1258291200)) *
 FloatArray::full(output@pre,k,rndne_values(k,A)) * FloatArray::undef_full(output,batch/4) */
  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
    const float32x4_t vx0123 = vld1q_f32(input); input += 4;

    const float32x4_t vabsx0123 = vabsq_f32(vx0123) /*@ where a=&vx0123 */;
    uint32x4_t vrndmask0123 = vcaltq_f32(vmagic_number, vx0123) /*@ where a=&vmagic_number,b=&vx0123 */;

    float32x4_t vrndabsx0123 = vaddq_f32(vabsx0123, vmagic_number) /*@ where a=&vabsx0123,b=&vmagic_number */;

    vrndmask0123 = vorrq_u32(vrndmask0123, vmovq_n_u32(UINT32_C(0x80000000))) /*@ where a=&vrndmask0123,b=0 */;

    vrndabsx0123 = vsubq_f32(vrndabsx0123, vmagic_number) /*@ where a=&vrndabsx0123,b=&vmagic_number */;

    const float32x4_t vy0123 = vbslq_f32(vrndmask0123, vx0123, vrndabsx0123) /*@ where mask=&vrndmask0123,a=&vx0123,b=&vrndabsx0123 */;

    vst1q_f32(output, vy0123) /*@ where a=&vy0123 */; output += 4;
  }
  if XNN_UNLIKELY(batch != 0) {
    const float32x4_t vx = vld1q_f32(input);
    const float32x4_t vabsx = vabsq_f32(vx) /*@ where a=&vx */;
    uint32x4_t vrndmask = vcaltq_f32(vmagic_number, vx) /*@ where a=&vmagic_number,b=&vx */;
    float32x4_t vrndabsx = vaddq_f32(vabsx, vmagic_number) /*@ where a=&vabsx,b=&vmagic_number */;
    vrndmask = vorrq_u32(vrndmask, vmovq_n_u32(UINT32_C(0x80000000))) /*@ where a=&vrndmask,b=0 */;
    vrndabsx = vsubq_f32(vrndabsx, vmagic_number) /*@ where a=&vrndabsx,b=&vmagic_number */;
    const float32x4_t vy = vbslq_f32(vrndmask, vx, vrndabsx) /*@ where mask=&vrndmask,a=&vx,b=&vrndabsx */;
    float32x2_t vy_lo = vget_low_f32(vy) /*@ where a=&vy */;
    if (batch & (2 * sizeof(float))) {
      vst1_f32(output, vy_lo) /*@ where a=&vy_lo */; output += 2;
      vy_lo = vget_high_f32(vy) /*@ where a=&vy */;
    }
    if (batch & (1 * sizeof(float))) {
      vst1_lane_f32(output, vy_lo, 0) /*@ where a=&vy_lo */;
    }
  }
}
