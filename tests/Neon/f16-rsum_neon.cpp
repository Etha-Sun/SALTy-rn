#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>
#define XNN_ARCH_ARM64 1


extern "C" {

void xnn_f16_rsum_ukernel__neonfp16arith_u16_acc2(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_scale_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(uint16_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const uint16_t* i = (const uint16_t*) input;
  uint16_t* o = (uint16_t*) output;
  float16x8_t vacc0 = vreinterpretq_f16_u16(vmovq_n_u16(0));
  float16x8_t vacc1 = vreinterpretq_f16_u16(vmovq_n_u16(0));
  for (; batch >= 16 * sizeof(uint16_t); batch -= 16 * sizeof(uint16_t)) {
    const float16x8_t vt0 = vreinterpretq_f16_u16(vld1q_u16(i)); i += 8;
    const float16x8_t vt1 = vreinterpretq_f16_u16(vld1q_u16(i)); i += 8;

    vacc0 = vaddq_f16(vacc0, vt0);
    vacc1 = vaddq_f16(vacc1, vt1);
  }
  vacc0 = vaddq_f16(vacc0, vacc1);
  for (; batch >= 8 * sizeof(uint16_t); batch -= 8 * sizeof(uint16_t)) {
    const float16x8_t vt = vreinterpretq_f16_u16(vld1q_u16(i)); i += 8;
    vacc0 = vaddq_f16(vacc0, vt);
  }
  const float16x4_t vscale = vreinterpret_f16_u16(vdup_n_u16(*(const uint16_t*) &params->scalar.scale));
  float16x4_t vacc = vadd_f16(vget_low_f16(vacc0), vget_high_f16(vacc0));
  if XNN_UNLIKELY(batch & (4 * sizeof(uint16_t))) {
    const float16x4_t vt = vreinterpret_f16_u16(vld1_u16(i)); i += 4;
    vacc = vadd_f16(vacc, vt);
  }
  vacc = vpadd_f16(vacc, vacc);
  if XNN_UNLIKELY(batch & (2 * sizeof(uint16_t))) {
    const float16x4_t vt = vreinterpret_f16_u32(vld1_dup_u32((const void*) i)); i += 2;
    vacc = vadd_f16(vacc, vt);
  }
  vacc = vpadd_f16(vacc, vacc);
  if XNN_UNLIKELY(batch & (1 * sizeof(uint16_t))) {
    const float16x4_t vt = vreinterpret_f16_u16(vld1_dup_u16(i));
    vacc = vadd_f16(vacc, vt);
  }
  vacc = vmul_f16(vacc, vscale);
  vacc = vadd_f16(vacc, vreinterpret_f16_u16(vld1_dup_u16(o)));
  vst1_lane_u16(o, vreinterpret_u16_f16(vacc), 0);
}
}
