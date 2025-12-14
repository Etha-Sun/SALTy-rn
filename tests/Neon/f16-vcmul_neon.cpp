#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>
#define XNN_ARCH_ARM64 1


extern "C" {
   void xnn_f16_vcmul_ukernel__neonfp16arith_u16(
    size_t batch,
    const xnn_float16* input_a,
    const xnn_float16* input_b,
    xnn_float16* output,
    const struct xnn_f16_default_params* params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(batch % sizeof(uint16_t) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  const uint16_t* ar = (const uint16_t*) input_a;
  const uint16_t* ai = (const uint16_t*) ((uintptr_t) input_a + batch);
  const uint16_t* br = (const uint16_t*) input_b;
  const uint16_t* bi = (const uint16_t*) ((uintptr_t) input_b + batch);
  uint16_t* o_r = (uint16_t*) output;
  uint16_t* oi = (uint16_t*) ((uintptr_t) output + batch);
  for (; batch >= 16 * sizeof(uint16_t); batch -= 16 * sizeof(uint16_t)) {
    const float16x8_t va0r = vreinterpretq_f16_u16(vld1q_u16(ar)); ar += 8;
    const float16x8_t va0i = vreinterpretq_f16_u16(vld1q_u16(ai)); ai += 8;
    const float16x8_t vb0r = vreinterpretq_f16_u16(vld1q_u16(br)); br += 8;
    const float16x8_t vb0i = vreinterpretq_f16_u16(vld1q_u16(bi)); bi += 8;
    const float16x8_t va1r = vreinterpretq_f16_u16(vld1q_u16(ar)); ar += 8;
    const float16x8_t va1i = vreinterpretq_f16_u16(vld1q_u16(ai)); ai += 8;
    const float16x8_t vb1r = vreinterpretq_f16_u16(vld1q_u16(br)); br += 8;
    const float16x8_t vb1i = vreinterpretq_f16_u16(vld1q_u16(bi)); bi += 8;

    float16x8_t vacc0r = vmulq_f16(va0r, vb0r);
    float16x8_t vacc0i = vmulq_f16(va0r, vb0i);
    float16x8_t vacc1r = vmulq_f16(va1r, vb1r);
    float16x8_t vacc1i = vmulq_f16(va1r, vb1i);

    vacc0r = vfmsq_f16(vacc0r, va0i, vb0i);
    vacc0i = vfmaq_f16(vacc0i, va0i, vb0r);
    vacc1r = vfmsq_f16(vacc1r, va1i, vb1i);
    vacc1i = vfmaq_f16(vacc1i, va1i, vb1r);

    vst1q_u16(o_r, vreinterpretq_u16_f16(vacc0r)); o_r += 8;
    vst1q_u16(oi, vreinterpretq_u16_f16(vacc0i)); oi += 8;
    vst1q_u16(o_r, vreinterpretq_u16_f16(vacc1r)); o_r += 8;
    vst1q_u16(oi, vreinterpretq_u16_f16(vacc1i)); oi += 8;
  }
  for (; batch >= 8 * sizeof(uint16_t); batch -= 8 * sizeof(uint16_t)) {
    const float16x8_t var = vreinterpretq_f16_u16(vld1q_u16(ar)); ar += 8;
    const float16x8_t vai = vreinterpretq_f16_u16(vld1q_u16(ai)); ai += 8;
    const float16x8_t vbr = vreinterpretq_f16_u16(vld1q_u16(br)); br += 8;
    const float16x8_t vbi = vreinterpretq_f16_u16(vld1q_u16(bi)); bi += 8;

    float16x8_t vaccr = vmulq_f16(var, vbr);
    float16x8_t vacci = vmulq_f16(var, vbi);

    vaccr = vfmsq_f16(vaccr, vai, vbi);
    vacci = vfmaq_f16(vacci, vai, vbr);

    vst1q_u16(o_r, vreinterpretq_u16_f16(vaccr)); o_r += 8;
    vst1q_u16(oi, vreinterpretq_u16_f16(vacci)); oi += 8;
  }
  if XNN_UNLIKELY(batch != 0) {
    const float16x8_t var = vreinterpretq_f16_u16(vld1q_u16(ar)); ar += 8;
    const float16x8_t vai = vreinterpretq_f16_u16(vld1q_u16(ai)); ai += 8;
    const float16x8_t vbr = vreinterpretq_f16_u16(vld1q_u16(br)); br += 8;
    const float16x8_t vbi = vreinterpretq_f16_u16(vld1q_u16(bi)); bi += 8;

    float16x8_t vaccr = vmulq_f16(var, vbr);
    float16x8_t vacci = vmulq_f16(var, vbi);

    vaccr = vfmsq_f16(vaccr, vai, vbi);
    vacci = vfmaq_f16(vacci, vai, vbr);

    float16x4_t vaccr_lo = vget_low_f16(vaccr);
    float16x4_t vacci_lo = vget_low_f16(vacci);
    if (batch & (4 * sizeof(uint16_t))) {
      vst1_u16(o_r, vreinterpret_u16_f16(vaccr_lo)); o_r += 4;
      vst1_u16(oi, vreinterpret_u16_f16(vacci_lo)); oi += 4;
      vaccr_lo = vget_high_f16(vaccr);
      vacci_lo = vget_high_f16(vacci);
    }
    if (batch & (2 * sizeof(uint16_t))) {
      vst1_lane_u32((void*) o_r, vreinterpret_u32_f16(vaccr_lo), 0); o_r += 2;
      vst1_lane_u32((void*) oi, vreinterpret_u32_f16(vacci_lo), 0); oi += 2;
      vaccr_lo = vext_f16(vaccr_lo, vaccr_lo, 2);
      vacci_lo = vext_f16(vacci_lo, vacci_lo, 2);
    }
    if (batch & (1 * sizeof(uint16_t))) {
      vst1_lane_u16(o_r, vreinterpret_u16_f16(vaccr_lo), 0);
      vst1_lane_u16(oi, vreinterpret_u16_f16(vacci_lo), 0);
    }
  }
} 
}
