#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_qs8_vcvt_ukernel__rvv_u16(
        size_t batch,
        const float* input,
        int8_t* output,
        const struct xnn_f32_qs8_cvt_params* params)
    {
        assert(batch != 0);
        assert(batch % sizeof(float) == 0);
        assert(input != NULL);
        assert(output != NULL);
    
        const float scale = params->scalar.scale;
        const int32_t zero_point = (int32_t)params->scalar.output_zero_point;
    
        size_t n = batch / sizeof(float);
        
        for (; n > 0;) {
            size_t vl = __riscv_vsetvl_e32m2(n);
            
            vfloat32m2_t vx = __riscv_vle32_v_f32m2(input, vl);
            input += vl;
            
            vx = __riscv_vfmul_vf_f32m2(vx, scale, vl);
            
            vint32m2_t vacc = __riscv_vfcvt_x_f_v_i32m2(vx, vl);
            vacc = __riscv_vadd_vx_i32m2(vacc, zero_point, vl);
            
            vint16m1_t vacc16 = __riscv_vnclip_wx_i16m1(vacc, 0, __RISCV_VXRM_RNU, vl);
            vint8mf2_t vy = __riscv_vnclip_wx_i8mf2(vacc16, 0, __RISCV_VXRM_RNU, vl);
            
            __riscv_vse8_v_i8mf2(output, vy, vl);
            output += vl;
            
            n -= vl;
        }
    }
}
