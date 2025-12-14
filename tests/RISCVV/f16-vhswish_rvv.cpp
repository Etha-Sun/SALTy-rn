#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vhswish_ukernel__rvv_u16(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
    const _Float16* i = (const _Float16*) input;
    _Float16* o = (_Float16*) output;

    size_t n = batch / sizeof(uint16_t);

    for (size_t vl; n > 0; n -= vl, i += vl, o += vl) {
        vl = __riscv_vsetvl_e16m1(n);
        vfloat16m1_t vx = __riscv_vle16_v_f16m1(i, vl);
        vfloat16m1_t vacc = __riscv_vfadd_vf_f16m1(vx, (_Float16)3.0f, vl);
        vx = __riscv_vfmul_vf_f16m1(vx, (_Float16)(1.0f / 6.0f), vl);
        vacc = __riscv_vfmax_vf_f16m1(vacc, (_Float16)0.0f, vl);
        vacc = __riscv_vfmin_vf_f16m1(vacc, (_Float16)6.0f, vl);
        vacc = __riscv_vfmul_vv_f16m1(vacc, vx, vl);
        __riscv_vse16_v_f16m1(o, vacc, vl);
    }
}
}

