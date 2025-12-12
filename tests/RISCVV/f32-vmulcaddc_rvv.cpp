#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_vmulcaddc_minmax_ukernel_c4__rvv_2x(
        size_t rows,
        size_t channels,
        const float*  input,
        size_t input_stride,
        const float*  weights,
        float*  output,
        size_t output_stride,
        const struct xnn_f32_minmax_params*  params)
    {
      const float* i0 = input;
      float* o0 = output;
      const float* i1 = (const float*) ((uintptr_t) i0 + input_stride);
      float* o1 = (float*) ((uintptr_t) o0 + output_stride);
      const size_t input_increment = input_stride * 2 - channels;
      const size_t output_increment = output_stride * 2 - channels;
    
      const float vmin_scalar = params->scalar.min;
      const float vmax_scalar = params->scalar.max;
    
      do {
        if (rows < 2) {
          i1 = i0;
          o1 = o0;
        }
    
        const float* w = weights;
        size_t n = channels / sizeof(float);
    
        while (n > 0) {
          size_t vl = __riscv_vsetvl_e32m1(n < 4 ? n : 4);
    
          vfloat32m1_t vscale = __riscv_vle32_v_f32m1(w, vl);
          vfloat32m1_t vbias = __riscv_vle32_v_f32m1(w + 4, vl);
          w += 8;
    
          vfloat32m1_t vacc0 = __riscv_vle32_v_f32m1(i0, vl);
          vfloat32m1_t vacc1 = __riscv_vle32_v_f32m1(i1, vl);
          i0 += vl;
          i1 += vl;
    
          vacc0 = __riscv_vfmadd_vv_f32m1(vacc0, vscale, vbias, vl);
          vacc1 = __riscv_vfmadd_vv_f32m1(vacc1, vscale, vbias, vl);
    
          vacc0 = __riscv_vfmax_vf_f32m1(vacc0, vmin_scalar, vl);
          vacc1 = __riscv_vfmax_vf_f32m1(vacc1, vmin_scalar, vl);
          vacc0 = __riscv_vfmin_vf_f32m1(vacc0, vmax_scalar, vl);
          vacc1 = __riscv_vfmin_vf_f32m1(vacc1, vmax_scalar, vl);
    
          __riscv_vse32_v_f32m1(o0, vacc0, vl);
          __riscv_vse32_v_f32m1(o1, vacc1, vl);
          o0 += vl;
          o1 += vl;
    
          n -= vl;
        }
    
        i0 = (const float*) ((uintptr_t) i0 + input_increment);
        o0 = (float*) ((uintptr_t) o0 + output_increment);
        i1 = (const float*) ((uintptr_t) i1 + input_increment);
        o1 = (float*) ((uintptr_t) o1 + output_increment);
        rows = (rows > 2) ? rows - 2 : 0;
      } while (rows != 0);
    }
}
