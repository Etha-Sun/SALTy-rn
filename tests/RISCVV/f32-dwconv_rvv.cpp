#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_dwconv_minmax_ukernel_4p8c__rvv(
        size_t channels,
        size_t output_width,
        const float** input,
        const float* weights,
        float* output,
        intptr_t input_stride,
        size_t output_increment,
        size_t input_offset,
        size_t input_pixel_stride,
        const float* zero,
        const struct xnn_f32_minmax_params* params)
    {
        assert(channels != 0);
        assert(output_width != 0);
    
        const float vmin = params->scalar.min;
        const float vmax = params->scalar.max;
    
        do {
            const float* i0 = input[0];
            assert(i0 != NULL);
            if (i0 != zero) {
                i0 = (const float*) ((uintptr_t) i0 + input_offset);
            }
            const float* i1 = input[1];
            assert(i1 != NULL);
            if (i1 != zero) {
                i1 = (const float*) ((uintptr_t) i1 + input_offset);
            }
            const float* i2 = input[2];
            assert(i2 != NULL);
            if (i2 != zero) {
                i2 = (const float*) ((uintptr_t) i2 + input_offset);
            }
            const float* i3 = input[3];
            assert(i3 != NULL);
            if (i3 != zero) {
                i3 = (const float*) ((uintptr_t) i3 + input_offset);
            }
    
            input = (const float**) ((uintptr_t) input + input_stride);
    
            size_t c = channels;
            const float* w = weights;
    
            for (; c >= 8; c -= 8) {
                size_t vl = __riscv_vsetvl_e32m1(8);
    
                vfloat32m1_t vacc = __riscv_vle32_v_f32m1(w, vl);
    
                vfloat32m1_t vi0 = __riscv_vle32_v_f32m1(i0, vl);
                vfloat32m1_t vk0 = __riscv_vle32_v_f32m1(w + 8, vl);
                vacc = __riscv_vfmacc_vv_f32m1(vacc, vi0, vk0, vl);
    
                vfloat32m1_t vi1 = __riscv_vle32_v_f32m1(i1, vl);
                vfloat32m1_t vk1 = __riscv_vle32_v_f32m1(w + 16, vl);
                vacc = __riscv_vfmacc_vv_f32m1(vacc, vi1, vk1, vl);
    
                vfloat32m1_t vi2 = __riscv_vle32_v_f32m1(i2, vl);
                vfloat32m1_t vk2 = __riscv_vle32_v_f32m1(w + 24, vl);
                vacc = __riscv_vfmacc_vv_f32m1(vacc, vi2, vk2, vl);
    
                vfloat32m1_t vi3 = __riscv_vle32_v_f32m1(i3, vl);
                vfloat32m1_t vk3 = __riscv_vle32_v_f32m1(w + 32, vl);
                vacc = __riscv_vfmacc_vv_f32m1(vacc, vi3, vk3, vl);
    
                vacc = __riscv_vfmax_vf_f32m1(vacc, vmin, vl);
                vacc = __riscv_vfmin_vf_f32m1(vacc, vmax, vl);
    
                __riscv_vse32_v_f32m1(output, vacc, vl);
    
                i0 += 8;
                i1 += 8;
                i2 += 8;
                i3 += 8;
                w += 40;
                output += 8;
            }
    
            if (c != 0) {
                size_t vl = __riscv_vsetvl_e32m1(c);
    
                vfloat32m1_t vacc = __riscv_vle32_v_f32m1(w, vl);
    
                vfloat32m1_t vi0 = __riscv_vle32_v_f32m1(i0, vl);
                vfloat32m1_t vk0 = __riscv_vle32_v_f32m1(w + 8, vl);
                vacc = __riscv_vfmacc_vv_f32m1(vacc, vi0, vk0, vl);
    
                vfloat32m1_t vi1 = __riscv_vle32_v_f32m1(i1, vl);
                vfloat32m1_t vk1 = __riscv_vle32_v_f32m1(w + 16, vl);
                vacc = __riscv_vfmacc_vv_f32m1(vacc, vi1, vk1, vl);
    
                vfloat32m1_t vi2 = __riscv_vle32_v_f32m1(i2, vl);
                vfloat32m1_t vk2 = __riscv_vle32_v_f32m1(w + 24, vl);
                vacc = __riscv_vfmacc_vv_f32m1(vacc, vi2, vk2, vl);
    
                vfloat32m1_t vi3 = __riscv_vle32_v_f32m1(i3, vl);
                vfloat32m1_t vk3 = __riscv_vle32_v_f32m1(w + 32, vl);
                vacc = __riscv_vfmacc_vv_f32m1(vacc, vi3, vk3, vl);
    
                vacc = __riscv_vfmax_vf_f32m1(vacc, vmin, vl);
                vacc = __riscv_vfmin_vf_f32m1(vacc, vmax, vl);
    
                __riscv_vse32_v_f32m1(output, vacc, vl);
                output += vl;
            }
    
            input_offset += input_pixel_stride;
            output = (float*) ((uintptr_t) output + output_increment);
        } while (--output_width != 0);
    }
}
