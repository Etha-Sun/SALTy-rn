#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_spmm_minmax_ukernel_8x1__rvv(
        size_t mc,
        size_t nc,
        const float* input,
        const float* weights,
        const int32_t* widx_dmap,
        const uint32_t* nidx_nnzmap,
        float* output,
        size_t output_stride,
        const struct xnn_f32_minmax_params* params)
    {
      assert(mc != 0);
      assert(mc % sizeof(float) == 0);
      assert(nc != 0);

      const symbolic_float32_t vmin_scalar = riscv_symbolic_float_load(&params->scalar.min);
      const symbolic_float32_t vmax_scalar = riscv_symbolic_float_load(&params->scalar.max);

      size_t output_decrement = output_stride * nc - 8 * sizeof(float);

      while (mc >= 8 * sizeof(float)) {
        const float* w = weights;
        const int32_t* dmap = widx_dmap;
        const uint32_t* nnzmap = nidx_nnzmap;
        size_t n = nc;
        do {
          uint32_t nnz = *nnzmap++;
          symbolic_float32_t bias = riscv_symbolic_float_load(w); w += 1;

          size_t vl = vsetvl_e32m1(8);
          vfloat32m1_t vacc = vfmv_v_f_f32m1(bias, vl);

          if (nnz != 0) {
            do {
              const intptr_t diff = *dmap++;
              vfloat32m1_t vi = vle32_v_f32m1(input, vl);
              input = (const float*) ((uintptr_t) input + (uintptr_t) diff);

              symbolic_float32_t w_val = riscv_symbolic_float_load(w); w += 1;
              vacc = vfmacc_vf_f32m1(vacc, w_val, vi, vl);
            } while (--nnz != 0);
          }

          vfloat32m1_t vout = vfmin_vf_f32m1_sym(vacc, vmax_scalar, vl);
          vout = vfmax_vf_f32m1_sym(vout, vmin_scalar, vl);
          vse32_v_f32m1(output, vout, vl);
          output = (float*) ((uintptr_t) output + output_stride);
        } while (--n != 0);
        output = (float*) ((uintptr_t) output - output_decrement);
        input += 8;
        mc -= 8 * sizeof(float);
      }

      if (mc != 0) {
        output_decrement += 4 * sizeof(float);
        if (mc & (4 * sizeof(float))) {
          const float* w = weights;
          const int32_t* dmap = widx_dmap;
          const uint32_t* nnzmap = nidx_nnzmap;
          size_t n = nc;
          do {
            uint32_t nnz = *nnzmap++;
            symbolic_float32_t bias = riscv_symbolic_float_load(w); w += 1;

            size_t vl = vsetvl_e32m1(4);
            vfloat32m1_t vacc = vfmv_v_f_f32m1(bias, vl);

            if (nnz != 0) {
              do {
                const intptr_t diff = *dmap++;
                vfloat32m1_t vi = vle32_v_f32m1(input, vl);
                input = (const float*) ((uintptr_t) input + (uintptr_t) diff);

                symbolic_float32_t w_val = riscv_symbolic_float_load(w); w += 1;
                vacc = vfmacc_vf_f32m1(vacc, w_val, vi, vl);
              } while (--nnz != 0);
            }

            vfloat32m1_t vout = vfmin_vf_f32m1_sym(vacc, vmax_scalar, vl);
            vout = vfmax_vf_f32m1_sym(vout, vmin_scalar, vl);
            vse32_v_f32m1(output, vout, vl);
            output = (float*) ((uintptr_t) output + output_stride);
          } while (--n != 0);
          output = (float*) ((uintptr_t) output - output_decrement);
          input += 4;
        }

        output_decrement += 2 * sizeof(float);
        if (mc & (2 * sizeof(float))) {
          const float* w = weights;
          const int32_t* dmap = widx_dmap;
          const uint32_t* nnzmap = nidx_nnzmap;
          size_t n = nc;
          do {
            uint32_t nnz = *nnzmap++;
            symbolic_float32_t bias = riscv_symbolic_float_load(w); w += 1;

            size_t vl = vsetvl_e32m1(2);
            vfloat32m1_t vacc = vfmv_v_f_f32m1(bias, vl);

            if (nnz != 0) {
              do {
                const intptr_t diff = *dmap++;
                vfloat32m1_t vi = vle32_v_f32m1(input, vl);
                input = (const float*) ((uintptr_t) input + (uintptr_t) diff);

                symbolic_float32_t w_val = riscv_symbolic_float_load(w); w += 1;
                vacc = vfmacc_vf_f32m1(vacc, w_val, vi, vl);
              } while (--nnz != 0);
            }

            vfloat32m1_t vout = vfmin_vf_f32m1_sym(vacc, vmax_scalar, vl);
            vout = vfmax_vf_f32m1_sym(vout, vmin_scalar, vl);
            vse32_v_f32m1(output, vout, vl);
            output = (float*) ((uintptr_t) output + output_stride);
          } while (--n != 0);
          output = (float*) ((uintptr_t) output - output_decrement);
          input += 2;
        }

        output_decrement += 1 * sizeof(float);
        if (mc & (1 * sizeof(float))) {
          const float* w = weights;
          const int32_t* dmap = widx_dmap;
          const uint32_t* nnzmap = nidx_nnzmap;
          size_t n = nc;
          do {
            uint32_t nnz = *nnzmap++;
            symbolic_float32_t vacc = riscv_symbolic_float_load(w); w += 1;

            if (nnz != 0) {
              do {
                const intptr_t diff = *dmap++;
                symbolic_float32_t vi = riscv_symbolic_float_load(input);
                input = (const float*) ((uintptr_t) input + (uintptr_t) diff);
                symbolic_float32_t w_val = riscv_symbolic_float_load(w); w += 1;
                vacc = vacc + vi * w_val;
              } while (--nnz != 0);
            }

            symbolic_float32_t vout = symbolic_fmin(vacc, vmax_scalar);
            vout = symbolic_fmax(vout, vmin_scalar);
            riscv_symbolic_float_store(output, vout);
            output = (float*) ((uintptr_t) output + output_stride);
          } while (--n != 0);
          output = (float*) ((uintptr_t) output - output_decrement);
          input += 1;
        }
      }
    }
}
