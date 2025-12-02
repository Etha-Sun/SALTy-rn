#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_qs8_f16_vcvt_ukernel__rvv(
        size_t batch,
        const int8_t* input,
        xnn_float16* output,
        const struct xnn_qs8_f16_cvt_params* params)
    {
        _Float16* o = (_Float16*) output;
        int16_t zero_point = params->scalar.zero_point;
        _Float16 scale = *(_Float16*)&params->scalar.scale;
    
        while (batch > 0) {
            size_t vl = __riscv_vsetvl_e8m1(batch);
    
            vint8m1_t vx = __riscv_vle8_v_i8m1(input, vl);
    
            vint16m2_t vhx = __riscv_vsext_vf2_i16m2(vx, vl);
            vhx = __riscv_vsub_vx_i16m2(vhx, zero_point, vl);
    
            vfloat16m2_t vy = __riscv_vfcvt_f_x_v_f16m2(vhx, vl);
            vy = __riscv_vfmul_vf_f16m2(vy, scale, vl);
    
            __riscv_vse16_v_f16m2(o, vy, vl);
    
            input += vl;
            o += vl;
            batch -= vl;
        }
    }
}
