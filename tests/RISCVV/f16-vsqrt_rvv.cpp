#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vsqrt_ukernel__rvv_sqrt(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
    const _Float16* i = (const _Float16*) input;
    _Float16* o = (_Float16*) output;
    size_t n = batch / sizeof(_Float16);

    while (n > 0) {
        size_t vl = __riscv_vsetvl_e16m4(n);
        vfloat16m4_t vi = __riscv_vle16_v_f16m4(i, vl);
        vfloat16m4_t vo = __riscv_vfsqrt_v_f16m4(vi, vl);
        __riscv_vse16_v_f16m4(o, vo, vl);
        i += vl;
        o += vl;
        n -= vl;
    }
}
}