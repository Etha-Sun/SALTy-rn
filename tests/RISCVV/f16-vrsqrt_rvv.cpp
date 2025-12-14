#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vrsqrt_ukernel__rvv_rsqrt(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
    assert(batch != 0);
    assert(batch % sizeof(uint16_t) == 0);
    assert(input != NULL);
    assert(output != NULL);

    const _Float16* i = (const _Float16*) input;
    _Float16* o = (_Float16*) output;
    
    size_t n = batch / sizeof(uint16_t);
    
    while (n > 0) {
        size_t vl = __riscv_vsetvl_e16m4(n);
        
        vfloat16m4_t vx = __riscv_vle16_v_f16m4(i, vl);
        
        vfloat16m4_t vy = __riscv_vfrsqrt7_v_f16m4(vx, vl);
        vfloat16m4_t vy2 = __riscv_vfmul_vv_f16m4(vy, vy, vl);
        vfloat16m4_t vxy2 = __riscv_vfmul_vv_f16m4(vx, vy2, vl);
        vfloat16m4_t vterm = __riscv_vfrsub_vf_f16m4(vxy2, (_Float16)3.0f, vl);
        vterm = __riscv_vfmul_vf_f16m4(vterm, (_Float16)0.5f, vl);
        vy = __riscv_vfmul_vv_f16m4(vy, vterm, vl);
        
        __riscv_vse16_v_f16m4(o, vy, vl);
        
        i += vl;
        o += vl;
        n -= vl;
    }
}
}
