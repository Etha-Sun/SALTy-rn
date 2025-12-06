#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>
#define XNN_ARCH_ARM64 1


extern "C" {
    void xnn_x8_lut_ukernel__aarch64_neon_tbx128x4_u16(
        size_t batch,
        const uint8_t* input,
        uint8_t* output,
        const uint8_t* table)
    {
      assert(batch != 0);
      assert(batch % sizeof(uint8_t) == 0);
      assert(input != NULL);
      assert(output != NULL);
    
      const uint8x16x4_t vtable0123 = vld1q_u8_x4(table);
      const uint8x16x4_t vtable4567 = vld1q_u8_x4(table + 64);
      const uint8x16x4_t vtable89AB = vld1q_u8_x4(table + 128);
      const uint8x16x4_t vtableCDEF = vld1q_u8_x4(table + 192);
      const uint8x16_t voffset = vmovq_n_u8(64);
      for (; batch >= 16 * sizeof(uint8_t); batch -= 16 * sizeof(uint8_t)) {
        uint8x16_t vx = vld1q_u8(input); input += 16;
    
        uint8x16_t vy = vqtbl4q_u8(vtable0123, vx);
    
        vx = vsubq_u8(vx, voffset);
        vy = vqtbx4q_u8(vy, vtable4567, vx);
    
        vx = vsubq_u8(vx, voffset);
        vy = vqtbx4q_u8(vy, vtable89AB, vx);
    
        vx = vsubq_u8(vx, voffset);
        vy = vqtbx4q_u8(vy, vtableCDEF, vx);
    
        vst1q_u8(output, vy); output += 16;
      }
      if XNN_UNLIKELY(batch != 0) {
        uint8x16_t vx = vld1q_u8(input);
    
        uint8x16_t vy = vqtbl4q_u8(vtable0123, vx);
    
        vx = vsubq_u8(vx, voffset);
        vy = vqtbx4q_u8(vy, vtable4567, vx);
    
        vx = vsubq_u8(vx, voffset);
        vy = vqtbx4q_u8(vy, vtable89AB, vx);
    
        vx = vsubq_u8(vx, voffset);
        vy = vqtbx4q_u8(vy, vtableCDEF, vx);
    
        uint8x8_t vy_lo = vget_low_u8(vy);
        if (batch & (8 * sizeof(uint8_t))) {
          vst1_u8(output, vy_lo); output += 8;
          vy_lo = vget_high_u8(vy);
        }
        if (batch & (4 * sizeof(uint8_t))) {
          vst1_lane_u32((void*) output, vreinterpret_u32_u8(vy_lo), 0); output += 4;
          vy_lo = vext_u8(vy_lo, vy_lo, 4);
        }
        if (batch & (2 * sizeof(uint8_t))) {
          vst1_lane_u16((void*) output, vreinterpret_u16_u8(vy_lo), 0); output += 2;
          vy_lo = vext_u8(vy_lo, vy_lo, 2);
        }
        if (batch & (1 * sizeof(uint8_t))) {
          vst1_lane_u8(output, vy_lo, 0);
        }
      }
    }
}
