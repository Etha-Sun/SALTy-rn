#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_ibilinear_ukernel__rvv_u16(
    size_t output_pixels,
    size_t channels,
    const xnn_float16** input,
    size_t input_offset,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t output_increment)
{
  uint16_t* o = (uint16_t*) output;
  do {
    const uint16_t* i0 = (const uint16_t*) ((uintptr_t) input[0] + input_offset);
    const uint16_t* i1 = (const uint16_t*) ((uintptr_t) input[1] + input_offset);
    const uint16_t* i2 = (const uint16_t*) ((uintptr_t) input[2] + input_offset);
    const uint16_t* i3 = (const uint16_t*) ((uintptr_t) input[3] + input_offset);
    input += 4;

    _Float16 alphah = *weights++;
    _Float16 alphav = *weights++;

    size_t c = channels;
    while (c > 0) {
      size_t vl = __riscv_vsetvl_e16m1(c / sizeof(uint16_t));

      vfloat16m1_t vtl = __riscv_vle16_v_f16m1((const _Float16*)i0, vl);
      vfloat16m1_t vtr = __riscv_vle16_v_f16m1((const _Float16*)i1, vl);
      vfloat16m1_t vbl = __riscv_vle16_v_f16m1((const _Float16*)i2, vl);
      vfloat16m1_t vbr = __riscv_vle16_v_f16m1((const _Float16*)i3, vl);

      vfloat16m1_t vtd = __riscv_vfsub_vv_f16m1(vtr, vtl, vl);
      vfloat16m1_t vbd = __riscv_vfsub_vv_f16m1(vbr, vbl, vl);

      vfloat16m1_t vt = __riscv_vfmacc_vf_f16m1(vtl, alphah, vtd, vl);
      vfloat16m1_t vb = __riscv_vfmacc_vf_f16m1(vbl, alphah, vbd, vl);

      vfloat16m1_t vd = __riscv_vfsub_vv_f16m1(vb, vt, vl);

      vfloat16m1_t vo = __riscv_vfmacc_vf_f16m1(vt, alphav, vd, vl);

      __riscv_vse16_v_f16m1((_Float16*)o, vo, vl);

      i0 += vl;
      i1 += vl;
      i2 += vl;
      i3 += vl;
      o += vl;
      c -= vl * sizeof(uint16_t);
    }

    o = (uint16_t*) ((uintptr_t) o + output_increment);
  } while (--output_pixels != 0);
}
}
