#include "../../../shim/neon_frontend.h"
/*
struct xnn_qu8_f32_cvt_params {
  struct {
    int32_t zero_point;
    float scale;
  } scalar;
};
*/

void test_neon(
    size_t batch,
    const uint8_t* input,
    float* output,
    const struct xnn_qu8_f32_cvt_params* restrict params) XNN_OOB_READS
/*@ With (A:list Z) (RawZ:Z) (Scale:fp32)
 Require 0<batch && batch<=4611686018427387903 &&
 input!=0 && output!=0 && params!=0 &&
 UCharArray::full(input,batch+7,A) * FloatArray::undef_full(output,batch) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale)
 Ensure UCharArray::full(input,batch+7,A) * FloatArray::full(output,batch,cvt_values(batch,A,RawZ,Scale)) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */
{
/*@ Assert sizeof(uint8_t)==1 && sizeof(float)==4 && batch%sizeof(uint8_t)==0 && batch==batch@pre && input==input@pre && output==output@pre && params==params@pre && 0<batch@pre && batch@pre<=4611686018427387903 && input!=0 && output!=0 && params!=0 && UCharArray::full(input,batch+7,A) * FloatArray::undef_full(output,batch) * store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */
  assert(batch != 0);
  assert(batch % sizeof(uint8_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const int16x8_t vminus_zero_point = vdupq_n_s16((int16_t)(0U - (uint32_t)params->scalar.zero_point));
  const float32x4_t vscale = vdupq_n_f32(params->scalar.scale);
/*@ Inv Assert sizeof(uint8_t)==1 && sizeof(float)==4 &&
0 < batch@pre && batch@pre<=4611686018427387903 &&
0 <= (batch@pre-batch) && (batch@pre-batch)+batch == batch@pre && 0 <= batch && batch <= batch@pre &&
(batch == 0 || batch == 1 || batch == 2 || batch == 3 || batch == 4 || batch == 5 || batch == 6 || batch == 7 || 8 <= batch) &&
params == params@pre && params != 0 &&
input == input@pre+(batch@pre-batch) && output == output@pre+(batch@pre-batch) &&
UCharArray::full(input@pre,batch@pre+7,A) *
FloatArray::full(output@pre,(batch@pre-batch),cvt_values((batch@pre-batch),A,RawZ,Scale)) * FloatArray::undef_full(output,batch) *
store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) *
store(&(vminus_zero_point.s0),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s1),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s2),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s3),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s4),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s5),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s6),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s7),short,cvt_seed(RawZ)) *
store(&(vscale.s0),float,Scale) * store(&(vscale.s1),float,Scale) * store(&(vscale.s2),float,Scale) * store(&(vscale.s3),float,Scale) */
  for (; batch >= 8 * sizeof(uint8_t); batch -= 8 * sizeof(uint8_t)) {
    const uint8x8_t vx = vld1_u8(input) /*@ where base=input@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */; input += 8;

    const int16x8_t vhx = vreinterpretq_s16_u16(vaddw_u8(vreinterpretq_u16_s16(vminus_zero_point), vx)) /*@ where a=&vminus_zero_point,b=&vx */;

    const int32x4_t vwx_lo = vmovl_s16(vget_low_s16(vhx)) /*@ where a=&vhx */;
    const int32x4_t vwx_hi = vmovl_s16(vget_high_s16(vhx)) /*@ where a=&vhx */;

    float32x4_t vy_lo = vcvtq_f32_s32(vwx_lo) /*@ where a=&vwx_lo */;
    float32x4_t vy_hi = vcvtq_f32_s32(vwx_hi) /*@ where a=&vwx_hi */;

    vy_lo = vmulq_f32(vy_lo, vscale) /*@ where a=&vy_lo,b=&vscale */;
    vy_hi = vmulq_f32(vy_hi, vscale) /*@ where a=&vy_hi,b=&vscale */;

    vst1q_f32(output, vy_lo) /*@ where a=&vy_lo */; output += 4;
    vst1q_f32(output, vy_hi) /*@ where a=&vy_hi */; output += 4;
  }
  if XNN_UNLIKELY(batch != 0) {
    assert(batch >= 1 * sizeof(uint8_t));
    assert(batch <= 7 * sizeof(uint8_t));

    const uint8x8_t vx = vld1_u8(input) /*@ where base=input@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */;

    const int16x8_t vhx = vreinterpretq_s16_u16(vaddw_u8(vreinterpretq_u16_s16(vminus_zero_point), vx)) /*@ where a=&vminus_zero_point,b=&vx */;

    const int32x4_t vwx_lo = vmovl_s16(vget_low_s16(vhx)) /*@ where a=&vhx */;
    const int32x4_t vwx_hi = vmovl_s16(vget_high_s16(vhx)) /*@ where a=&vhx */;

    float32x4_t vy = vcvtq_f32_s32(vwx_lo) /*@ where a=&vwx_lo */;
    vy = vmulq_f32(vy, vscale) /*@ where a=&vy,b=&vscale */;

    if (batch & (4 * sizeof(uint8_t))) {
      vst1q_f32(output, vy) /*@ where a=&vy */; output += 4;
      vy = vcvtq_f32_s32(vwx_hi) /*@ where a=&vwx_hi */;
      vy = vmulq_f32(vy, vscale) /*@ where a=&vy,b=&vscale */;
    }
    float32x2_t vy_lo = vget_low_f32(vy) /*@ where a=&vy */;
    if (batch & (2 * sizeof(uint8_t))) {
      vst1_f32(output, vy_lo) /*@ where a=&vy_lo */; output += 2;
      vy_lo = vget_high_f32(vy) /*@ where a=&vy */;
    }
    if (batch & (1 * sizeof(uint8_t))) {
      vst1_lane_f32(output, vy_lo, 0) /*@ where a=&vy_lo */;
    }
  }
}
