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

      void xnn_f32_gemm_minmax_ukernel_4x8__rvv_ld64(
          size_t mr,
          size_t nc,
          size_t kc,
          const float* a,
          size_t a_stride,
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
        assert(a != NULL);
        assert(w != NULL);
        assert(c != NULL);

        const float* a0 = a;
        float* c0 = c;
        const float* a1 = (const float*) ((uintptr_t) a0 + a_stride);
        float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
        if XNN_UNPREDICTABLE(mr < 2) {
          a1 = a0;
          c1 = c0;
        }
        const float* a2 = (const float*) ((uintptr_t) a1 + a_stride);
        float* c2 = (float*) ((uintptr_t) c1 + cm_stride);
        if XNN_UNPREDICTABLE(mr <= 2) {
          a2 = a1;
          c2 = c1;
        }
        const float* a3 = (const float*) ((uintptr_t) a2 + a_stride);
        float* c3 = (float*) ((uintptr_t) c2 + cm_stride);
        if XNN_UNPREDICTABLE(mr != 4) {
          a3 = a2;
          c3 = c2;
        }

        const size_t vl = __riscv_vsetvl_e32m1(8);

        do {
          vfloat32m1_t vacc0 = __riscv_vle32_v_f32m1(w, vl); w += 8;
          vfloat32m1_t vacc1 = vacc0;
          vfloat32m1_t vacc2 = vacc0;
          vfloat32m1_t vacc3 = vacc0;

          size_t k = kc;
          for (; k >= 2 * sizeof(float); k -= 2 * sizeof(float)) {
            // Use symbolic scalar loads
            symbolic_float32_t va0_0 = load_symbolic_float(a0++);
            symbolic_float32_t va0_1 = load_symbolic_float(a0++);
            symbolic_float32_t va1_0 = load_symbolic_float(a1++);
            symbolic_float32_t va1_1 = load_symbolic_float(a1++);
            symbolic_float32_t va2_0 = load_symbolic_float(a2++);
            symbolic_float32_t va2_1 = load_symbolic_float(a2++);
            symbolic_float32_t va3_0 = load_symbolic_float(a3++);
            symbolic_float32_t va3_1 = load_symbolic_float(a3++);

            vfloat32m1_t vb_c0 = __riscv_vle32_v_f32m1(w, vl); w += 8;
            vfloat32m1_t vb_c1 = __riscv_vle32_v_f32m1(w, vl); w += 8;

            // Use symbolic version of fmacc
            vacc0 = __riscv_vfmacc_vf_f32m1_sym(vacc0, va0_0, vb_c0, vl);
            vacc1 = __riscv_vfmacc_vf_f32m1_sym(vacc1, va1_0, vb_c0, vl);
            vacc2 = __riscv_vfmacc_vf_f32m1_sym(vacc2, va2_0, vb_c0, vl);
            vacc3 = __riscv_vfmacc_vf_f32m1_sym(vacc3, va3_0, vb_c0, vl);

            vacc0 = __riscv_vfmacc_vf_f32m1_sym(vacc0, va0_1, vb_c1, vl);
            vacc1 = __riscv_vfmacc_vf_f32m1_sym(vacc1, va1_1, vb_c1, vl);
            vacc2 = __riscv_vfmacc_vf_f32m1_sym(vacc2, va2_1, vb_c1, vl);
            vacc3 = __riscv_vfmacc_vf_f32m1_sym(vacc3, va3_1, vb_c1, vl);
          }

          if XNN_UNLIKELY(k != 0) {
            symbolic_float32_t va0_s = load_symbolic_float(a0++);
            symbolic_float32_t va1_s = load_symbolic_float(a1++);
            symbolic_float32_t va2_s = load_symbolic_float(a2++);
            symbolic_float32_t va3_s = load_symbolic_float(a3++);

            vfloat32m1_t vb = __riscv_vle32_v_f32m1(w, vl); w += 8;

            vacc0 = __riscv_vfmacc_vf_f32m1_sym(vacc0, va0_s, vb, vl);
            vacc1 = __riscv_vfmacc_vf_f32m1_sym(vacc1, va1_s, vb, vl);
            vacc2 = __riscv_vfmacc_vf_f32m1_sym(vacc2, va2_s, vb, vl);
            vacc3 = __riscv_vfmacc_vf_f32m1_sym(vacc3, va3_s, vb, vl);
          }

          // Use symbolic scalar loads for min/max params
          symbolic_float32_t vmax = load_symbolic_float(&params->scalar.max);
          symbolic_float32_t vmin = load_symbolic_float(&params->scalar.min);

          vacc0 = __riscv_vfmin_vf_f32m1_sym(vacc0, vmax, vl);
          vacc1 = __riscv_vfmin_vf_f32m1_sym(vacc1, vmax, vl);
          vacc2 = __riscv_vfmin_vf_f32m1_sym(vacc2, vmax, vl);
          vacc3 = __riscv_vfmin_vf_f32m1_sym(vacc3, vmax, vl);

          vacc0 = __riscv_vfmax_vf_f32m1_sym(vacc0, vmin, vl);
          vacc1 = __riscv_vfmax_vf_f32m1_sym(vacc1, vmin, vl);
          vacc2 = __riscv_vfmax_vf_f32m1_sym(vacc2, vmin, vl);
          vacc3 = __riscv_vfmax_vf_f32m1_sym(vacc3, vmin, vl);

          if XNN_LIKELY(nc >= 8) {
            __riscv_vse32_v_f32m1(c0, vacc0, vl);
            c0 = (float*) ((uintptr_t) c0 + cn_stride);
            __riscv_vse32_v_f32m1(c1, vacc1, vl);
            c1 = (float*) ((uintptr_t) c1 + cn_stride);
            __riscv_vse32_v_f32m1(c2, vacc2, vl);
            c2 = (float*) ((uintptr_t) c2 + cn_stride);
            __riscv_vse32_v_f32m1(c3, vacc3, vl);
            c3 = (float*) ((uintptr_t) c3 + cn_stride);

            a0 = (const float*) ((uintptr_t) a0 - kc);
            a1 = (const float*) ((uintptr_t) a1 - kc);
            a2 = (const float*) ((uintptr_t) a2 - kc);
            a3 = (const float*) ((uintptr_t) a3 - kc);

            nc -= 8;
          } else {
            size_t vl_rem = __riscv_vsetvl_e32m1(nc);
            __riscv_vse32_v_f32m1(c0, vacc0, vl_rem);
            __riscv_vse32_v_f32m1(c1, vacc1, vl_rem);
            __riscv_vse32_v_f32m1(c2, vacc2, vl_rem);
            __riscv_vse32_v_f32m1(c3, vacc3, vl_rem);
            nc = 0;
          }
        } while (nc != 0);
      }
}
