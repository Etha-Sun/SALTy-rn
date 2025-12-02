#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>

extern "C" {
void xnn_qs8_vcvt_ukernel__rvv(
    size_t batch,
    const int8_t* input,
    int8_t* output,
    const struct xnn_qs8_cvt_params* params)
{
    const int16_t input_zero_point = params->scalar.input_zero_point;
    const int16_t multiplier = (int16_t)(-params->scalar.multiplier);
    const int16_t output_zero_point = params->scalar.output_zero_point;

    while (batch > 0) {
        size_t vl = __riscv_vsetvl_e8m1(batch);
        
        vint8m1_t vx = __riscv_vle8_v_i8m1(input, vl);
        input += vl;
        
        vint16m2_t vacc = __riscv_vwadd_vx_i16m2(vx, 0, vl);
        vacc = __riscv_vrsub_vx_i16m2(vacc, input_zero_point, vl);
        vacc = __riscv_vsll_vx_i16m2(vacc, 7, vl);
        vacc = __riscv_vsmul_vx_i16m2(vacc, multiplier, __RISCV_VXRM_RNU, vl);
        vacc = __riscv_vsadd_vx_i16m2(vacc, output_zero_point, vl);
        
        vint8m1_t vy = __riscv_vnclip_wx_i8m1(vacc, 0, __RISCV_VXRM_RNU, vl);
        
        __riscv_vse8_v_i8m1(output, vy, vl);
        output += vl;
        
        batch -= vl;
    }
}
}