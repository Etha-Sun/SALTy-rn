#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vrndd_ukernel__rvv_u16(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
    assert(batch != 0);
    assert(batch % sizeof(uint16_t) == 0);
    assert(input != NULL);
    assert(output != NULL);

    const uint16_t* i = (const uint16_t*) input;
    uint16_t* o = (uint16_t*) output;
    
    size_t n = batch / sizeof(uint16_t);
    
    while (n > 0) {
        size_t vl = __riscv_vsetvl_e16m1(n);
        
        vfloat16m1_t vacc = __riscv_vle16_v_f16m1((const _Float16*)i, vl);
        
        vint16m1_t vi = __riscv_vfcvt_x_f_v_i16m1_rm(vacc, __RISCV_FRM_RDN, vl);
        vacc = __riscv_vfcvt_f_x_v_f16m1(vi, vl);
        
        __riscv_vse16_v_f16m1((_Float16*)o, vacc, vl);
        
        i += vl;
        o += vl;
        n -= vl;
    }
}
}
