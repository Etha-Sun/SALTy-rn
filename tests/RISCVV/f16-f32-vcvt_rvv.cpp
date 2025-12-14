#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_f32_vcvt_ukernel__rvv(
    size_t batch,
    const xnn_float16* input,
    float* output,
    const void* params)
{
    assert(batch != 0);
    assert(batch % sizeof(uint16_t) == 0);
    assert(input != NULL);
    assert(output != NULL);

    const uint16_t* i = (const uint16_t*)input;
    size_t n = batch / sizeof(uint16_t);

    while (n > 0) {
        size_t vl = __riscv_vsetvl_e16m2(n);
        vuint16m2_t vh = __riscv_vle16_v_u16m2(i, vl);
        vfloat16m2_t vf16 = __riscv_vreinterpret_v_u16m2_f16m2(vh);
        vfloat32m4_t vf32 = __riscv_vfwcvt_f_f_v_f32m4(vf16, vl);
        __riscv_vse32_v_f32m4(output, vf32, vl);
        i += vl;
        output += vl;
        n -= vl;
    }
}
}
