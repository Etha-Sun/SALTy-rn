#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>
#define XNN_ARCH_ARM64 1


extern "C" {
    void xnn_f32_vlrelu_ukernel__neon_u8(
        size_t batch,
        const float* input,
        float* output,
        const struct xnn_f32_lrelu_params* params) XNN_OOB_READS
    {
      assert(batch != 0);
      assert(batch % sizeof(float) == 0);
      assert(input != NULL);
      assert(output != NULL);
    
      const float32x4_t vslope = vdupq_n_f32(params->scalar.slope);
    
      for (; batch >= 8 * sizeof(float); batch -= 8 * sizeof(float)) {
        const float32x4_t vx0123 = vld1q_f32(input); input += 4;
        const float32x4_t vx4567 = vld1q_f32(input); input += 4;
    
        float32x4_t vacc0123 = vmulq_f32(vx0123, vslope);
        const uint32x4_t vmask0123 = vcltq_s32(vreinterpretq_s32_f32(vx0123), vmovq_n_s32(0));
        float32x4_t vacc4567 = vmulq_f32(vx4567, vslope);
        const uint32x4_t vmask4567 = vcltq_s32(vreinterpretq_s32_f32(vx4567), vmovq_n_s32(0));
    
        vacc0123 = vbslq_f32(vmask0123, vacc0123, vx0123);
        vacc4567 = vbslq_f32(vmask4567, vacc4567, vx4567);
    
        vst1q_f32(output, vacc0123); output += 4;
        vst1q_f32(output, vacc4567); output += 4;
      }
      for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
        const float32x4_t vx = vld1q_f32(input); input += 4;
        float32x4_t vacc = vmulq_f32(vx, vslope);
        const uint32x4_t vmask = vcltq_s32(vreinterpretq_s32_f32(vx), vmovq_n_s32(0));
        vacc = vbslq_f32(vmask, vacc, vx);
        vst1q_f32(output, vacc); output += 4;
      }
      if XNN_UNLIKELY(batch != 0) {
        const float32x4_t vx = vld1q_f32(input);
        float32x4_t vacc = vmulq_f32(vx, vslope);
        const uint32x4_t vmask = vcltq_s32(vreinterpretq_s32_f32(vx), vmovq_n_s32(0));
        vacc = vbslq_f32(vmask, vacc, vx);
    
        float32x2_t vacc_lo = vget_low_f32(vacc);
        if (batch & (2 * sizeof(float))) {
          vst1_f32(output, vacc_lo); output += 2;
          vacc_lo = vget_high_f32(vacc);
        }
        if (batch & (1 * sizeof(float))) {
          vst1_lane_f32(output, vacc_lo, 0);
        }
      }
    }
}
