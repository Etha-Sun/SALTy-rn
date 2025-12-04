#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_qs8_f32_vcvt_ukernel__rvv(
        size_t batch,
        const int8_t* input,
        float* output,
        const struct xnn_qs8_f32_cvt_params* params)
    {
        assert(batch != 0);
        assert(batch % sizeof(int8_t) == 0);
        assert(input != NULL);
        assert(output != NULL);
    
        const int32_t zero_point = params->scalar.zero_point;
        const float scale = params->scalar.scale;
    
        while (batch > 0) {
            size_t vl = __riscv_vsetvl_e8m1(batch);
            vint8m1_t vx = __riscv_vle8_v_i8m1(input, vl);
            vint32m4_t vx32 = __riscv_vsext_vf4_i32m4(vx, vl);
            vint32m4_t vwx = __riscv_vsub_vx_i32m4(vx32, zero_point, vl);
            vfloat32m4_t vy = __riscv_vfcvt_f_x_v_f32m4(vwx, vl);
            vy = __riscv_vfmul_vf_f32m4(vy, scale, vl);
            __riscv_vse32_v_f32m4(output, vy, vl);
            input += vl;
            output += vl;
            batch -= vl;
        }
    }
}
