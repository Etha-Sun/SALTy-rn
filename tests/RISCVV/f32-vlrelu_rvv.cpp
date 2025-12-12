#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_vlrelu_ukernel__rvv_u8(
        size_t batch,
        const float* input,
        float* output,
        const struct xnn_f32_lrelu_params* params)
{
    const float slope = params->scalar.slope;
    size_t n = batch / sizeof(float);
    
    while (n > 0) {
        size_t vl = __riscv_vsetvl_e32m1(n);
        vfloat32m1_t vx = __riscv_vle32_v_f32m1(input, vl);
        vfloat32m1_t vmul = __riscv_vfmul_vf_f32m1(vx, slope, vl);
        vbool32_t mask = __riscv_vmflt_vf_f32m1(vx, 0.0f, vl);
        vfloat32m1_t result = __riscv_vmerge_vvm_f32m1(vx, vmul, mask, vl);
        __riscv_vse32_v_f32m1(output, result, vl);
        input += vl;
        output += vl;
        n -= vl;
    }
}
}
