#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>
#define XNN_ARCH_ARM64 1


extern "C" {
    void xnn_f32_vmulc_ukernel__neon_u4(
        size_t batch,
        const float* input_a,
        const float* input_b,
        float* output,
        const struct xnn_f32_default_params* params) XNN_OOB_READS
    {
      assert(batch != 0);
      assert(batch % sizeof(float) == 0);
      assert(input_a != NULL);
      assert(input_b != NULL);
      assert(output != NULL);
    
      const float32x4_t vb = vld1q_dup_f32(input_b);
    
      for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
        const float32x4_t va = vld1q_f32(input_a); input_a += 4;
    
        float32x4_t vacc = vmulq_f32(va, vb);
    
        vst1q_f32(output, vacc); output += 4;
      }
      if XNN_UNLIKELY(batch != 0) {
        const float32x4_t va = vld1q_f32(input_a);
    
        float32x4_t vacc = vmulq_f32(va, vb);
    
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
