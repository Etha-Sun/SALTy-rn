#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>
#define XNN_ARCH_ARM64 1


extern "C" {
    void xnn_f32_vcmul_ukernel__neon_u16(
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
    
      const float* ar = input_a;
      const float* ai = (const float*) ((uintptr_t) input_a + batch);
      const float* br = input_b;
      const float* bi = (const float*) ((uintptr_t) input_b + batch);
      float* o_r = output;
      float* oi = (float*) ((uintptr_t) output + batch);
      for (; batch >= 16 * sizeof(float); batch -= 16 * sizeof(float)) {
        const float32x4_t va0r = vld1q_f32(ar); ar += 4;
        const float32x4_t va0i = vld1q_f32(ai); ai += 4;
        const float32x4_t vb0r = vld1q_f32(br); br += 4;
        const float32x4_t vb0i = vld1q_f32(bi); bi += 4;
        const float32x4_t va1r = vld1q_f32(ar); ar += 4;
        const float32x4_t va1i = vld1q_f32(ai); ai += 4;
        const float32x4_t vb1r = vld1q_f32(br); br += 4;
        const float32x4_t vb1i = vld1q_f32(bi); bi += 4;
        const float32x4_t va2r = vld1q_f32(ar); ar += 4;
        const float32x4_t va2i = vld1q_f32(ai); ai += 4;
        const float32x4_t vb2r = vld1q_f32(br); br += 4;
        const float32x4_t vb2i = vld1q_f32(bi); bi += 4;
        const float32x4_t va3r = vld1q_f32(ar); ar += 4;
        const float32x4_t va3i = vld1q_f32(ai); ai += 4;
        const float32x4_t vb3r = vld1q_f32(br); br += 4;
        const float32x4_t vb3i = vld1q_f32(bi); bi += 4;
    
        float32x4_t vacc0r = vmulq_f32(va0r, vb0r);
        float32x4_t vacc0i = vmulq_f32(va0r, vb0i);
        float32x4_t vacc1r = vmulq_f32(va1r, vb1r);
        float32x4_t vacc1i = vmulq_f32(va1r, vb1i);
        float32x4_t vacc2r = vmulq_f32(va2r, vb2r);
        float32x4_t vacc2i = vmulq_f32(va2r, vb2i);
        float32x4_t vacc3r = vmulq_f32(va3r, vb3r);
        float32x4_t vacc3i = vmulq_f32(va3r, vb3i);
    
        vacc0r = vmlsq_f32(vacc0r, va0i, vb0i);
        vacc0i = vmlaq_f32(vacc0i, va0i, vb0r);
        vacc1r = vmlsq_f32(vacc1r, va1i, vb1i);
        vacc1i = vmlaq_f32(vacc1i, va1i, vb1r);
        vacc2r = vmlsq_f32(vacc2r, va2i, vb2i);
        vacc2i = vmlaq_f32(vacc2i, va2i, vb2r);
        vacc3r = vmlsq_f32(vacc3r, va3i, vb3i);
        vacc3i = vmlaq_f32(vacc3i, va3i, vb3r);
    
        vst1q_f32(o_r, vacc0r); o_r += 4;
        vst1q_f32(oi, vacc0i); oi += 4;
        vst1q_f32(o_r, vacc1r); o_r += 4;
        vst1q_f32(oi, vacc1i); oi += 4;
        vst1q_f32(o_r, vacc2r); o_r += 4;
        vst1q_f32(oi, vacc2i); oi += 4;
        vst1q_f32(o_r, vacc3r); o_r += 4;
        vst1q_f32(oi, vacc3i); oi += 4;
      }
      for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
        const float32x4_t var = vld1q_f32(ar); ar += 4;
        const float32x4_t vai = vld1q_f32(ai); ai += 4;
        const float32x4_t vbr = vld1q_f32(br); br += 4;
        const float32x4_t vbi = vld1q_f32(bi); bi += 4;
    
        float32x4_t vaccr = vmulq_f32(var, vbr);
        float32x4_t vacci = vmulq_f32(var, vbi);
    
        vaccr = vmlsq_f32(vaccr, vai, vbi);
        vacci = vmlaq_f32(vacci, vai, vbr);
    
        vst1q_f32(o_r, vaccr); o_r += 4;
        vst1q_f32(oi, vacci); oi += 4;
      }
      if XNN_UNLIKELY(batch != 0) {
        const float32x4_t var = vld1q_f32(ar); ar += 4;
        const float32x4_t vai = vld1q_f32(ai); ai += 4;
        const float32x4_t vbr = vld1q_f32(br); br += 4;
        const float32x4_t vbi = vld1q_f32(bi); bi += 4;
    
        float32x4_t vaccr = vmulq_f32(var, vbr);
        float32x4_t vacci = vmulq_f32(var, vbi);
    
        vaccr = vmlsq_f32(vaccr, vai, vbi);
        vacci = vmlaq_f32(vacci, vai, vbr);
    
        float32x2_t vaccr_lo = vget_low_f32(vaccr);
        float32x2_t vacci_lo = vget_low_f32(vacci);
        if (batch & (2 * sizeof(float))) {
          vst1_f32(o_r, vaccr_lo); o_r += 2;
          vst1_f32(oi, vacci_lo); oi += 2;
          vaccr_lo = vget_high_f32(vaccr);
          vacci_lo = vget_high_f32(vacci);
        }
        if (batch & (1 * sizeof(float))) {
          vst1_lane_f32(o_r, vaccr_lo, 0);
          vst1_lane_f32(oi, vacci_lo, 0);
        }
      }
    }
}
