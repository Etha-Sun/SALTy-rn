#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_f16_vcvt_ukernel__rvv_u16(
        size_t batch,
        const float* input,
        xnn_float16* output,
        const void* params)
    {
        assert(batch != 0);
        assert(batch % sizeof(float) == 0);
        assert(input != NULL);
        assert(output != NULL);
    
        size_t n = batch / sizeof(float);
        _Float16* o = (_Float16*) output;
    
        while (n > 0) {
            size_t vl = __riscv_vsetvl_e32m2(n);
            vfloat32m2_t vx = __riscv_vle32_v_f32m2(input, vl);
            vfloat16m1_t vh = __riscv_vfncvt_f_f_w_f16m1(vx, vl);
            __riscv_vse16_v_f16m1(o, vh, vl);
            input += vl;
            o += vl;
            n -= vl;
        }
    }
}
