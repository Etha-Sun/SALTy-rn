#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
void xnn_f32_vcmul_ukernel__rvv_u16(
        size_t batch,
        const float* input_a,
        const float* input_b,
        float* output,
        const void* params)
{
    const float* ar = input_a;
    const float* ai = (const float*) ((uintptr_t) input_a + batch);
    const float* br = input_b;
    const float* bi = (const float*) ((uintptr_t) input_b + batch);
    float* o_r = output;
    float* oi = (float*) ((uintptr_t) output + batch);

    size_t n = batch / sizeof(float);

    while (n > 0) {
        size_t vl = __riscv_vsetvl_e32m1(n);

        vfloat32m1_t var = __riscv_vle32_v_f32m1(ar, vl);
        vfloat32m1_t vai = __riscv_vle32_v_f32m1(ai, vl);
        vfloat32m1_t vbr = __riscv_vle32_v_f32m1(br, vl);
        vfloat32m1_t vbi = __riscv_vle32_v_f32m1(bi, vl);

        vfloat32m1_t vaccr = __riscv_vfmul_vv_f32m1(var, vbr, vl);
        vfloat32m1_t vacci = __riscv_vfmul_vv_f32m1(var, vbi, vl);

        vaccr = __riscv_vfnmsac_vv_f32m1(vaccr, vai, vbi, vl);
        vacci = __riscv_vfmacc_vv_f32m1(vacci, vai, vbr, vl);

        __riscv_vse32_v_f32m1(o_r, vaccr, vl);
        __riscv_vse32_v_f32m1(oi, vacci, vl);

        ar += vl;
        ai += vl;
        br += vl;
        bi += vl;
        o_r += vl;
        oi += vl;
        n -= vl;
    }
}
}
