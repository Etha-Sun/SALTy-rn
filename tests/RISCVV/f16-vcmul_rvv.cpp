#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vcmul_ukernel__rvv_u16(
    size_t batch,
    const xnn_float16* input_a,
    const xnn_float16* input_b,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
  const _Float16* ar = (const _Float16*) input_a;
  const _Float16* ai = (const _Float16*) ((uintptr_t) input_a + batch);
  const _Float16* br = (const _Float16*) input_b;
  const _Float16* bi = (const _Float16*) ((uintptr_t) input_b + batch);
  _Float16* o_r = (_Float16*) output;
  _Float16* oi = (_Float16*) ((uintptr_t) output + batch);

  size_t n = batch / sizeof(uint16_t);

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e16m1(n);

    vfloat16m1_t var = __riscv_vle16_v_f16m1(ar, vl);
    vfloat16m1_t vai = __riscv_vle16_v_f16m1(ai, vl);
    vfloat16m1_t vbr = __riscv_vle16_v_f16m1(br, vl);
    vfloat16m1_t vbi = __riscv_vle16_v_f16m1(bi, vl);

    vfloat16m1_t vaccr = __riscv_vfmul_vv_f16m1(var, vbr, vl);
    vfloat16m1_t vacci = __riscv_vfmul_vv_f16m1(var, vbi, vl);

    vaccr = __riscv_vfnmsac_vv_f16m1(vaccr, vai, vbi, vl);
    vacci = __riscv_vfmacc_vv_f16m1(vacci, vai, vbr, vl);

    __riscv_vse16_v_f16m1(o_r, vaccr, vl);
    __riscv_vse16_v_f16m1(oi, vacci, vl);

    ar += vl;
    ai += vl;
    br += vl;
    bi += vl;
    o_r += vl;
    oi += vl;
    n -= vl;
  }
}
}
