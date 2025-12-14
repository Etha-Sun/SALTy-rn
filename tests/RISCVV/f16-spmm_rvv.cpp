#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_spmm_minmax_ukernel_16x1__rvv_u2(
    size_t mc,
    size_t nc,
    const _Float16* input,
    const _Float16* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    _Float16* output,
    size_t output_stride,
    const struct xnn_f16_minmax_params* params)
{
  const _Float16* i = input;
  _Float16* o = output;

  const _Float16 vmin = params->scalar.min;
  const _Float16 vmax = params->scalar.max;

  size_t output_decrement = output_stride * nc - 16 * sizeof(_Float16);
  while (mc >= 16 * sizeof(_Float16)) {
    const _Float16* w = weights;
    const int32_t* dmap = widx_dmap;
    const uint32_t* nnzmap = nidx_nnzmap;
    size_t n = nc;
    do {
      uint32_t nnz = *nnzmap++;
      size_t vl = __riscv_vsetvl_e16m1(8);
      _Float16 w0 = *w++;
      vfloat16m1_t vacc01234567x0 = __riscv_vfmv_v_f_f16m1(w0, vl);
      vfloat16m1_t vacc01234567x1 = __riscv_vfmv_v_f_f16m1((_Float16)0.0f, vl);
      vfloat16m1_t vacc89ABCDEFx0 = __riscv_vfmv_v_f_f16m1(w0, vl);
      vfloat16m1_t vacc89ABCDEFx1 = __riscv_vfmv_v_f_f16m1((_Float16)0.0f, vl);
      for (; nnz >= 2; nnz -= 2) {
        const intptr_t diff0 = dmap[0];
        const intptr_t diff1 = dmap[1];
        dmap += 2;
        vfloat16m1_t va01234567x0 = __riscv_vle16_v_f16m1(i, vl);
        vfloat16m1_t va89ABCDEFx0 = __riscv_vle16_v_f16m1(i + 8, vl);
        i = (const _Float16*) ((uintptr_t) i + (uintptr_t) diff0);
        _Float16 vw0 = *w++;
        vacc01234567x0 = __riscv_vfmacc_vf_f16m1(vacc01234567x0, vw0, va01234567x0, vl);
        vacc89ABCDEFx0 = __riscv_vfmacc_vf_f16m1(vacc89ABCDEFx0, vw0, va89ABCDEFx0, vl);
        vfloat16m1_t va01234567x1 = __riscv_vle16_v_f16m1(i, vl);
        vfloat16m1_t va89ABCDEFx1 = __riscv_vle16_v_f16m1(i + 8, vl);
        i = (const _Float16*) ((uintptr_t) i + (uintptr_t) diff1);
        _Float16 vw1 = *w++;
        vacc01234567x1 = __riscv_vfmacc_vf_f16m1(vacc01234567x1, vw1, va01234567x1, vl);
        vacc89ABCDEFx1 = __riscv_vfmacc_vf_f16m1(vacc89ABCDEFx1, vw1, va89ABCDEFx1, vl);
      }
      vfloat16m1_t vacc01234567 = __riscv_vfadd_vv_f16m1(vacc01234567x0, vacc01234567x1, vl);
      vfloat16m1_t vacc89ABCDEF = __riscv_vfadd_vv_f16m1(vacc89ABCDEFx0, vacc89ABCDEFx1, vl);
      if (nnz != 0) {
        do {
          const intptr_t diff = *dmap++;
          vfloat16m1_t va01234567 = __riscv_vle16_v_f16m1(i, vl);
          vfloat16m1_t va89ABCDEF = __riscv_vle16_v_f16m1(i + 8, vl);
          i = (const _Float16*) ((uintptr_t) i + (uintptr_t) diff);
          _Float16 vw = *w++;
          vacc01234567 = __riscv_vfmacc_vf_f16m1(vacc01234567, vw, va01234567, vl);
          vacc89ABCDEF = __riscv_vfmacc_vf_f16m1(vacc89ABCDEF, vw, va89ABCDEF, vl);
        } while (--nnz != 0);
      }
      vfloat16m1_t vout01234567 = __riscv_vfmin_vf_f16m1(vacc01234567, vmax, vl);
      vfloat16m1_t vout89ABCDEF = __riscv_vfmin_vf_f16m1(vacc89ABCDEF, vmax, vl);
      vout01234567 = __riscv_vfmax_vf_f16m1(vout01234567, vmin, vl);
      vout89ABCDEF = __riscv_vfmax_vf_f16m1(vout89ABCDEF, vmin, vl);
      __riscv_vse16_v_f16m1(o, vout01234567, vl);
      __riscv_vse16_v_f16m1(o + 8, vout89ABCDEF, vl);
      o = (_Float16*) ((uintptr_t) o + output_stride);
    } while (--n != 0);
    o = (_Float16*) ((uintptr_t) o - output_decrement);
    i += 16;
    mc -= 16 * sizeof(_Float16);
  }
  if (mc != 0) {
    output_decrement += 8 * sizeof(_Float16);
    if (mc & (8 * sizeof(_Float16))) {
      const _Float16* w = weights;
      const int32_t* dmap = widx_dmap;
      const uint32_t* nnzmap = nidx_nnzmap;
      size_t n = nc;
      size_t vl = __riscv_vsetvl_e16m1(8);
      do {
        uint32_t nnz = *nnzmap++;
        vfloat16m1_t vacc01234567 = __riscv_vfmv_v_f_f16m1(*w++, vl);
        if (nnz != 0) {
          do {
            const intptr_t diff = *dmap++;
            vfloat16m1_t va01234567 = __riscv_vle16_v_f16m1(i, vl);
            i = (const _Float16*) ((uintptr_t) i + (uintptr_t) diff);
            _Float16 vw = *w++;
            vacc01234567 = __riscv_vfmacc_vf_f16m1(vacc01234567, vw, va01234567, vl);
          } while (--nnz != 0);
        }
        vfloat16m1_t vout01234567 = __riscv_vfmin_vf_f16m1(vacc01234567, vmax, vl);
        vout01234567 = __riscv_vfmax_vf_f16m1(vout01234567, vmin, vl);
        __riscv_vse16_v_f16m1(o, vout01234567, vl);
        o = (_Float16*) ((uintptr_t) o + output_stride);
      } while (--n != 0);
      o = (_Float16*) ((uintptr_t) o - output_decrement);
      i += 8;
    }
    output_decrement += 4 * sizeof(_Float16);
    if (mc & (4 * sizeof(_Float16))) {
      const _Float16* w = weights;
      const int32_t* dmap = widx_dmap;
      const uint32_t* nnzmap = nidx_nnzmap;
      size_t n = nc;
      size_t vl = __riscv_vsetvl_e16m1(4);
      do {
        uint32_t nnz = *nnzmap++;
        vfloat16m1_t vacc0123 = __riscv_vfmv_v_f_f16m1(*w++, vl);
        if (nnz != 0) {
          do {
            const intptr_t diff = *dmap++;
            vfloat16m1_t va0123 = __riscv_vle16_v_f16m1(i, vl);
            i = (const _Float16*) ((uintptr_t) i + (uintptr_t) diff);
            _Float16 vw = *w++;
            vacc0123 = __riscv_vfmacc_vf_f16m1(vacc0123, vw, va0123, vl);
          } while (--nnz != 0);
        }
        vfloat16m1_t vout0123 = __riscv_vfmin_vf_f16m1(vacc0123, vmax, vl);
        vout0123 = __riscv_vfmax_vf_f16m1(vout0123, vmin, vl);
        __riscv_vse16_v_f16m1(o, vout0123, vl);
        o = (_Float16*) ((uintptr_t) o + output_stride);
      } while (--n != 0);
      o = (_Float16*) ((uintptr_t) o - output_decrement);
      i += 4;
    }
    output_decrement += 2 * sizeof(_Float16);
    if (mc & (2 * sizeof(_Float16))) {
      const _Float16* w = weights;
      const int32_t* dmap = widx_dmap;
      const uint32_t* nnzmap = nidx_nnzmap;
      size_t n = nc;
      size_t vl = __riscv_vsetvl_e16m1(2);
      do {
        uint32_t nnz = *nnzmap++;
        vfloat16m1_t vacc01 = __riscv_vfmv_v_f_f16m1(*w++, vl);
        if (nnz != 0) {
          do {
            const intptr_t diff = *dmap++;
            vfloat16m1_t va01 = __riscv_vle16_v_f16m1(i, vl);
            i = (const _Float16*) ((uintptr_t) i + (uintptr_t) diff);
            _Float16 vw = *w++;
            vacc01 = __riscv_vfmacc_vf_f16m1(vacc01, vw, va01, vl);
          } while (--nnz != 0);
        }
        vfloat16m1_t vout01 = __riscv_vfmin_vf_f16m1(vacc01, vmax, vl);
        vout01 = __riscv_vfmax_vf_f16m1(vout01, vmin, vl);
        __riscv_vse16_v_f16m1(o, vout01, vl);
        o = (_Float16*) ((uintptr_t) o + output_stride);
      } while (--n != 0);
      o = (_Float16*) ((uintptr_t) o - output_decrement);
      i += 2;
    }
    output_decrement += 1 * sizeof(_Float16);
    if (mc & (1 * sizeof(_Float16))) {
      const _Float16* w = weights;
      const int32_t* dmap = widx_dmap;
      const uint32_t* nnzmap = nidx_nnzmap;
      size_t n = nc;
      size_t vl = __riscv_vsetvl_e16m1(1);
      do {
        uint32_t nnz = *nnzmap++;
        vfloat16m1_t vacc0 = __riscv_vfmv_v_f_f16m1(*w++, vl);
        if (nnz != 0) {
          do {
            const intptr_t diff = *dmap++;
            vfloat16m1_t va0 = __riscv_vle16_v_f16m1(i, vl);
            i = (const _Float16*) ((uintptr_t) i + (uintptr_t) diff);
            _Float16 vw = *w++;
            vacc0 = __riscv_vfmacc_vf_f16m1(vacc0, vw, va0, vl);
          } while (--nnz != 0);
        }
        vfloat16m1_t vout0 = __riscv_vfmin_vf_f16m1(vacc0, vmax, vl);
        vout0 = __riscv_vfmax_vf_f16m1(vout0, vmin, vl);
        __riscv_vse16_v_f16m1(o, vout0, vl);
        o = (_Float16*) ((uintptr_t) o + output_stride);
      } while (--n != 0);
      o = (_Float16*) ((uintptr_t) o - output_decrement);
      i += 1;
    }
  }
}
}
