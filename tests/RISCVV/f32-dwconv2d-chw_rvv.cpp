#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/symbolic_scalar_types.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    static inline vfloat32m1_t vext_f32m1(vfloat32m1_t a, vfloat32m1_t b, size_t n, size_t vl) {
        vfloat32m1_t shifted = __riscv_vslidedown_vx_f32m1(a, n, vl);
        return __riscv_vslideup_vx_f32m1(shifted, b, 4 - n, vl);
    }

    // Helper to extract symbolic scalar from vector at given index
    static inline symbolic_float32_t vfmv_f_s_idx(const vfloat32m1_t& vec, size_t idx) {
        return symbolic_float32_t(g_symbolic_tm, vec.getElement(idx), 0.0f, false);
    }

    void xnn_f32_dwconv2d_chw_ukernel_3x3p1__rvv_1x4(
        size_t input_height,
        size_t input_width,
        const float* input,
        const float* weights,
        const float* zero,
        float* output,
        uint32_t padding_top,
        const struct xnn_f32_minmax_params* params)
    {
        assert(input_height != 0);
        assert(input_width != 0);
        assert(input_width % sizeof(float) == 0);
        assert(padding_top == 1);

        const float vmin = params->scalar.min;
        const float vmax = params->scalar.max;

        // Load weights symbolically using vector loads
        size_t wvl = __riscv_vsetvl_e32m1(8);
        vfloat32m1_t vw0_7 = __riscv_vle32_v_f32m1(weights, wvl);
        vfloat32m1_t vw8_9 = __riscv_vle32_v_f32m1(weights + 8, 2);

        // Extract symbolic scalars from loaded vectors
        const symbolic_float32_t vbias = vfmv_f_s_idx(vw0_7, 0);
        const symbolic_float32_t vk00 = vfmv_f_s_idx(vw0_7, 1);
        const symbolic_float32_t vk01 = vfmv_f_s_idx(vw0_7, 2);
        const symbolic_float32_t vk02 = vfmv_f_s_idx(vw0_7, 3);
        const symbolic_float32_t vk10 = vfmv_f_s_idx(vw0_7, 4);
        const symbolic_float32_t vk11 = vfmv_f_s_idx(vw0_7, 5);
        const symbolic_float32_t vk12 = vfmv_f_s_idx(vw0_7, 6);
        const symbolic_float32_t vk20 = vfmv_f_s_idx(vw0_7, 7);
        const symbolic_float32_t vk21 = vfmv_f_s_idx(vw8_9, 0);
        const symbolic_float32_t vk22 = vfmv_f_s_idx(vw8_9, 1);
    
        const size_t input_decrement = round_up_po2(input_width, 4 * sizeof(float));
    
        const float* i0 = zero;
        const float* i1 = input;
        const float* i2 = (const float*) ((uintptr_t) i1 + input_width);
    
        float* o0 = output;
    
        size_t output_height = input_height;
        do {
            if (output_height < 2) {
                i2 = zero;
            }
    
            size_t vl = __riscv_vsetvl_e32m1(4);

            vfloat32m1_t vi0x0123 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
            vfloat32m1_t vi1x0123 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
            vfloat32m1_t vi2x0123 = __riscv_vfmv_v_f_f32m1(0.0f, vl);

            vfloat32m1_t vi0x4567 = __riscv_vle32_v_f32m1(i0, vl); i0 += 4;
            vfloat32m1_t vi1x4567 = __riscv_vle32_v_f32m1(i1, vl); i1 += 4;
            vfloat32m1_t vi2x4567 = __riscv_vle32_v_f32m1(i2, vl); i2 += 4;

            size_t w = input_width;
            for (; w > 4 * sizeof(float); w -= 4 * sizeof(float)) {
                vfloat32m1_t vo0p0 = __riscv_vfmv_v_f_f32m1_sym(vbias, vl);

                const vfloat32m1_t vi0x89AB = __riscv_vle32_v_f32m1(i0, vl); i0 += 4;
                const vfloat32m1_t vi1x89AB = __riscv_vle32_v_f32m1(i1, vl); i1 += 4;
                const vfloat32m1_t vi2x89AB = __riscv_vle32_v_f32m1(i2, vl); i2 += 4;

                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk01, vi0x4567, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk11, vi1x4567, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk21, vi2x4567, vl);

                const vfloat32m1_t vi0x3456 = vext_f32m1(vi0x0123, vi0x4567, 3, vl);
                const vfloat32m1_t vi1x3456 = vext_f32m1(vi1x0123, vi1x4567, 3, vl);
                const vfloat32m1_t vi2x3456 = vext_f32m1(vi2x0123, vi2x4567, 3, vl);

                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk00, vi0x3456, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk10, vi1x3456, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk20, vi2x3456, vl);

                vi0x0123 = vi0x4567;
                vi1x0123 = vi1x4567;
                vi2x0123 = vi2x4567;

                const vfloat32m1_t vi0x5678 = vext_f32m1(vi0x4567, vi0x89AB, 1, vl);
                const vfloat32m1_t vi1x5678 = vext_f32m1(vi1x4567, vi1x89AB, 1, vl);
                const vfloat32m1_t vi2x5678 = vext_f32m1(vi2x4567, vi2x89AB, 1, vl);

                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk02, vi0x5678, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk12, vi1x5678, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk22, vi2x5678, vl);

                vi0x4567 = vi0x89AB;
                vi1x4567 = vi1x89AB;
                vi2x4567 = vi2x89AB;

                vfloat32m1_t vo0 = __riscv_vfmax_vf_f32m1(vo0p0, vmin, vl);
                vo0 = __riscv_vfmin_vf_f32m1(vo0, vmax, vl);

                __riscv_vse32_v_f32m1(o0, vo0, vl); o0 += 4;
            }

            assert(w >= 1 * sizeof(float));
            assert(w <= 4 * sizeof(float));
            {
                size_t remaining = w / sizeof(float);

                vbool32_t vmask = __riscv_vmsltu_vx_u32m1_b32(
                    __riscv_vid_v_u32m1(vl), remaining, vl);

                vfloat32m1_t vzero = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vi0x4567 = __riscv_vmerge_vvm_f32m1(vzero, vi0x4567, vmask, vl);
                vi1x4567 = __riscv_vmerge_vvm_f32m1(vzero, vi1x4567, vmask, vl);
                vi2x4567 = __riscv_vmerge_vvm_f32m1(vzero, vi2x4567, vmask, vl);

                vfloat32m1_t vo0p0 = __riscv_vfmv_v_f_f32m1_sym(vbias, vl);

                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk01, vi0x4567, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk11, vi1x4567, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk21, vi2x4567, vl);

                const vfloat32m1_t vi0x3456 = vext_f32m1(vi0x0123, vi0x4567, 3, vl);
                const vfloat32m1_t vi1x3456 = vext_f32m1(vi1x0123, vi1x4567, 3, vl);
                const vfloat32m1_t vi2x3456 = vext_f32m1(vi2x0123, vi2x4567, 3, vl);

                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk00, vi0x3456, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk10, vi1x3456, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk20, vi2x3456, vl);

                const vfloat32m1_t vi0x5678 = vext_f32m1(vi0x4567, vzero, 1, vl);
                const vfloat32m1_t vi1x5678 = vext_f32m1(vi1x4567, vzero, 1, vl);
                const vfloat32m1_t vi2x5678 = vext_f32m1(vi2x4567, vzero, 1, vl);

                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk02, vi0x5678, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk12, vi1x5678, vl);
                vo0p0 = __riscv_vfmacc_vf_f32m1_sym(vo0p0, vk22, vi2x5678, vl);

                vfloat32m1_t vo0 = __riscv_vfmax_vf_f32m1(vo0p0, vmin, vl);
                vo0 = __riscv_vfmin_vf_f32m1(vo0, vmax, vl);

                __riscv_vse32_v_f32m1(o0, vo0, remaining); o0 += remaining;
            }
    
            i0 = (const float*) ((uintptr_t) i1 - input_decrement);
            i1 = (const float*) ((uintptr_t) i2 - input_decrement);
            i2 = (const float*) ((uintptr_t) i1 + input_width);
    
        } while (--output_height != 0);
    }
}
