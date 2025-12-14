#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
   void xnn_f16_ibilinear_chw_ukernel__rvv_p16(
    size_t output_pixels,
    size_t channels,
    const xnn_float16** input,
    size_t input_offset,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t input_increment)
{
  uint16_t* o = (uint16_t*) output;
  do {
    const uint16_t** i = (const uint16_t**)input;
    const uint16_t* w = (const uint16_t*)weights;
    size_t p = output_pixels;

    while (p > 0) {
      size_t vl = __riscv_vsetvl_e16m1(p);

      vfloat16m1_t vtl = __riscv_vfmv_v_f_f16m1(0, vl);
      vfloat16m1_t vtr = __riscv_vfmv_v_f_f16m1(0, vl);
      vfloat16m1_t vbl = __riscv_vfmv_v_f_f16m1(0, vl);
      vfloat16m1_t vbr = __riscv_vfmv_v_f_f16m1(0, vl);
      vfloat16m1_t valphah = __riscv_vfmv_v_f_f16m1(0, vl);
      vfloat16m1_t valphav = __riscv_vfmv_v_f_f16m1(0, vl);

      for (size_t k = 0; k < vl; k++) {
        const uint16_t* itl_ptr = (const uint16_t*) ((uintptr_t) i[k * 2 + 0] + input_offset);
        const uint16_t* ibl_ptr = (const uint16_t*) ((uintptr_t) i[k * 2 + 1] + input_offset);

        _Float16 tl_val = *(_Float16*)itl_ptr;
        _Float16 tr_val = *((_Float16*)itl_ptr + 1);
        _Float16 bl_val = *(_Float16*)ibl_ptr;
        _Float16 br_val = *((_Float16*)ibl_ptr + 1);

        vtl = __riscv_vfslide1down_vf_f16m1(vtl, tl_val, vl);
        vtr = __riscv_vfslide1down_vf_f16m1(vtr, tr_val, vl);
        vbl = __riscv_vfslide1down_vf_f16m1(vbl, bl_val, vl);
        vbr = __riscv_vfslide1down_vf_f16m1(vbr, br_val, vl);

        _Float16 ah = *(_Float16*)(w + k * 2);
        _Float16 av = *(_Float16*)(w + k * 2 + 1);
        valphah = __riscv_vfslide1down_vf_f16m1(valphah, ah, vl);
        valphav = __riscv_vfslide1down_vf_f16m1(valphav, av, vl);
      }

      size_t shift = vl;
      while (shift < 16) {
        vtl = __riscv_vfslide1down_vf_f16m1(vtl, 0, vl);
        vtr = __riscv_vfslide1down_vf_f16m1(vtr, 0, vl);
        vbl = __riscv_vfslide1down_vf_f16m1(vbl, 0, vl);
        vbr = __riscv_vfslide1down_vf_f16m1(vbr, 0, vl);
        valphah = __riscv_vfslide1down_vf_f16m1(valphah, 0, vl);
        valphav = __riscv_vfslide1down_vf_f16m1(valphav, 0, vl);
        shift++;
      }

      vfloat16m1_t vld = __riscv_vfsub_vv_f16m1(vbl, vtl, vl);
      vfloat16m1_t vrd = __riscv_vfsub_vv_f16m1(vbr, vtr, vl);

      vfloat16m1_t vl_interp = __riscv_vfmacc_vv_f16m1(vtl, vld, valphav, vl);
      vfloat16m1_t vr_interp = __riscv_vfmacc_vv_f16m1(vtr, vrd, valphav, vl);

      vfloat16m1_t vd = __riscv_vfsub_vv_f16m1(vr_interp, vl_interp, vl);
      vfloat16m1_t vo = __riscv_vfmacc_vv_f16m1(vl_interp, vd, valphah, vl);

      __riscv_vse16_v_f16m1((_Float16*)o, vo, vl);

      i += 2 * vl;
      w += 2 * vl;
      o += vl;
      p -= vl;
    }

    input_offset += input_increment;
  } while (--channels != 0);
}
}
