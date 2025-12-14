#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_qs8_vcvt_ukernel__rvv(
    size_t batch,
    const xnn_float16* input,
    int8_t* output,
    const struct xnn_f16_qs8_cvt_params* params)
{
    const _Float16* i = (const _Float16*) input;
    _Float16 scale = *(const _Float16*) &params->scalar.scale;
    int16_t output_zero_point = params->scalar.output_zero_point;
    
    size_t n = batch / sizeof(uint16_t);
    
    while (n > 0) {
        size_t vl = __riscv_vsetvl_e16m1(n);
        
        vfloat16m1_t vx = __riscv_vle16_v_f16m1(i, vl);
        i += vl;
        
        vx = __riscv_vfmul_vf_f16m1(vx, scale, vl);
        
        vint16m1_t vacc = __riscv_vfcvt_x_f_v_i16m1(vx, vl);
        
        vacc = __riscv_vsadd_vx_i16m1(vacc, output_zero_point, vl);
        
        vint8m1_t vy = __riscv_vnclip_wx_i8m1(vacc, 0, vl);
        
        __riscv_vse8_v_i8m1(output, vy, vl);
        output += vl;
        
        n -= vl;
    }
}
}
