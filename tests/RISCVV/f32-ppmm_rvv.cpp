#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>

// Helper to load a symbolic float scalar from memory
inline symbolic_float32_t load_symbolic_float(const float* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    auto it = g_riscv_float_scalar_memory.find(addr);
    if (it != g_riscv_float_scalar_memory.end()) {
        return symbolic_float32_t(g_symbolic_tm, it->second, *ptr, false);
    }
    // Fallback to concrete value if not found
    return symbolic_float32_t(g_symbolic_tm, *ptr, false);
}

extern "C" {
    void xnn_f32_ppmm_minmax_ukernel_4x8__rvv(
        size_t mr,
        size_t nc,
        size_t kc,
        const float* a,
        const float* w,
        float* c,
        size_t cm_stride,
        size_t cn_stride,
        const struct xnn_f32_minmax_params* params)
    {
        assert(mr != 0);
        assert(mr <= 4);
        assert(nc != 0);
        assert(kc != 0);
        assert(kc % sizeof(float) == 0);

        // Load min/max params symbolically
        symbolic_float32_t vmin = load_symbolic_float(&params->scalar.min);
        symbolic_float32_t vmax = load_symbolic_float(&params->scalar.max);

        float* c0 = c;
        float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
        if (mr < 2) {
            c1 = c0;
        }
        float* c2 = (float*) ((uintptr_t) c1 + cm_stride);
        if (mr <= 2) {
            c2 = c1;
        }
        float* c3 = (float*) ((uintptr_t) c2 + cm_stride);
        if (mr != 4) {
            c3 = c2;
        }

        size_t vl = 4;

        do {
            vfloat32m1_t vacc0x0123 = __riscv_vle32_v_f32m1(w, vl); w += 4;
            vfloat32m1_t vacc0x4567 = __riscv_vle32_v_f32m1(w, vl); w += 4;
            vfloat32m1_t vacc1x0123 = vacc0x0123;
            vfloat32m1_t vacc1x4567 = vacc0x4567;
            vfloat32m1_t vacc2x0123 = vacc0x0123;
            vfloat32m1_t vacc2x4567 = vacc0x4567;
            vfloat32m1_t vacc3x0123 = vacc0x0123;
            vfloat32m1_t vacc3x4567 = vacc0x4567;

            size_t k = kc;
            do {
                // Load scalars symbolically
                symbolic_float32_t va0 = load_symbolic_float(a);
                symbolic_float32_t va1 = load_symbolic_float(a + 1);
                symbolic_float32_t va2 = load_symbolic_float(a + 2);
                symbolic_float32_t va3 = load_symbolic_float(a + 3);
                a += 4;

                vfloat32m1_t vb0123 = __riscv_vle32_v_f32m1(w, vl); w += 4;
                vfloat32m1_t vb4567 = __riscv_vle32_v_f32m1(w, vl); w += 4;

                // Use symbolic version of fmacc
                vacc0x0123 = __riscv_vfmacc_vf_f32m1_sym(vacc0x0123, va0, vb0123, vl);
                vacc1x0123 = __riscv_vfmacc_vf_f32m1_sym(vacc1x0123, va1, vb0123, vl);
                vacc2x0123 = __riscv_vfmacc_vf_f32m1_sym(vacc2x0123, va2, vb0123, vl);
                vacc3x0123 = __riscv_vfmacc_vf_f32m1_sym(vacc3x0123, va3, vb0123, vl);
                vacc0x4567 = __riscv_vfmacc_vf_f32m1_sym(vacc0x4567, va0, vb4567, vl);
                vacc1x4567 = __riscv_vfmacc_vf_f32m1_sym(vacc1x4567, va1, vb4567, vl);
                vacc2x4567 = __riscv_vfmacc_vf_f32m1_sym(vacc2x4567, va2, vb4567, vl);
                vacc3x4567 = __riscv_vfmacc_vf_f32m1_sym(vacc3x4567, va3, vb4567, vl);

                k -= sizeof(float);
            } while (k != 0);

            // Use symbolic min/max
            vacc0x0123 = __riscv_vfmin_vf_f32m1_sym(vacc0x0123, vmax, vl);
            vacc1x0123 = __riscv_vfmin_vf_f32m1_sym(vacc1x0123, vmax, vl);
            vacc2x0123 = __riscv_vfmin_vf_f32m1_sym(vacc2x0123, vmax, vl);
            vacc3x0123 = __riscv_vfmin_vf_f32m1_sym(vacc3x0123, vmax, vl);
            vacc0x4567 = __riscv_vfmin_vf_f32m1_sym(vacc0x4567, vmax, vl);
            vacc1x4567 = __riscv_vfmin_vf_f32m1_sym(vacc1x4567, vmax, vl);
            vacc2x4567 = __riscv_vfmin_vf_f32m1_sym(vacc2x4567, vmax, vl);
            vacc3x4567 = __riscv_vfmin_vf_f32m1_sym(vacc3x4567, vmax, vl);

            vacc0x0123 = __riscv_vfmax_vf_f32m1_sym(vacc0x0123, vmin, vl);
            vacc1x0123 = __riscv_vfmax_vf_f32m1_sym(vacc1x0123, vmin, vl);
            vacc2x0123 = __riscv_vfmax_vf_f32m1_sym(vacc2x0123, vmin, vl);
            vacc3x0123 = __riscv_vfmax_vf_f32m1_sym(vacc3x0123, vmin, vl);
            vacc0x4567 = __riscv_vfmax_vf_f32m1_sym(vacc0x4567, vmin, vl);
            vacc1x4567 = __riscv_vfmax_vf_f32m1_sym(vacc1x4567, vmin, vl);
            vacc2x4567 = __riscv_vfmax_vf_f32m1_sym(vacc2x4567, vmin, vl);
            vacc3x4567 = __riscv_vfmax_vf_f32m1_sym(vacc3x4567, vmin, vl);

            if (nc >= 8) {
                __riscv_vse32_v_f32m1(c3, vacc3x0123, vl);
                __riscv_vse32_v_f32m1(c3 + 4, vacc3x4567, vl);
                c3 = (float*) ((uintptr_t) c3 + cn_stride);
                __riscv_vse32_v_f32m1(c2, vacc2x0123, vl);
                __riscv_vse32_v_f32m1(c2 + 4, vacc2x4567, vl);
                c2 = (float*) ((uintptr_t) c2 + cn_stride);
                __riscv_vse32_v_f32m1(c1, vacc1x0123, vl);
                __riscv_vse32_v_f32m1(c1 + 4, vacc1x4567, vl);
                c1 = (float*) ((uintptr_t) c1 + cn_stride);
                __riscv_vse32_v_f32m1(c0, vacc0x0123, vl);
                __riscv_vse32_v_f32m1(c0 + 4, vacc0x4567, vl);
                c0 = (float*) ((uintptr_t) c0 + cn_stride);

                a = (const float*) ((uintptr_t) a - kc * 4);

                nc -= 8;
            } else {
                if (nc & 4) {
                    __riscv_vse32_v_f32m1(c3, vacc3x0123, vl); c3 += 4;
                    __riscv_vse32_v_f32m1(c2, vacc2x0123, vl); c2 += 4;
                    __riscv_vse32_v_f32m1(c1, vacc1x0123, vl); c1 += 4;
                    __riscv_vse32_v_f32m1(c0, vacc0x0123, vl); c0 += 4;

                    vacc3x0123 = vacc3x4567;
                    vacc2x0123 = vacc2x4567;
                    vacc1x0123 = vacc1x4567;
                    vacc0x0123 = vacc0x4567;
                }
                if (nc & 2) {
                    vl = 2;
                    __riscv_vse32_v_f32m1(c3, vacc3x0123, vl); c3 += 2;
                    __riscv_vse32_v_f32m1(c2, vacc2x0123, vl); c2 += 2;
                    __riscv_vse32_v_f32m1(c1, vacc1x0123, vl); c1 += 2;
                    __riscv_vse32_v_f32m1(c0, vacc0x0123, vl); c0 += 2;

                    vacc3x0123 = __riscv_vslidedown_vx_f32m1(vacc3x0123, 2, 4);
                    vacc2x0123 = __riscv_vslidedown_vx_f32m1(vacc2x0123, 2, 4);
                    vacc1x0123 = __riscv_vslidedown_vx_f32m1(vacc1x0123, 2, 4);
                    vacc0x0123 = __riscv_vslidedown_vx_f32m1(vacc0x0123, 2, 4);
                }
                if (nc & 1) {
                    vl = 1;
                    __riscv_vse32_v_f32m1(c3, vacc3x0123, vl);
                    __riscv_vse32_v_f32m1(c2, vacc2x0123, vl);
                    __riscv_vse32_v_f32m1(c1, vacc1x0123, vl);
                    __riscv_vse32_v_f32m1(c0, vacc0x0123, vl);
                }

                nc = 0;
            }
        } while (nc != 0);
    }
}
