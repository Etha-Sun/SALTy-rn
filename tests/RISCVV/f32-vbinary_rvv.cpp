#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_vmulc_ukernel__rvv_u4(
        size_t batch,
        const float* input_a,
        const float* input_b,
        float* output,
        const struct xnn_f32_default_params* params)
    {
        assert(batch != 0);
        assert(batch % sizeof(float) == 0);
        assert(input_a != NULL);
        assert(input_b != NULL);
        assert(output != NULL);

        size_t n = batch / sizeof(float);

        while (n > 0) {
            size_t vl = __riscv_vsetvl_e32m2(n);
            vfloat32m2_t va = __riscv_vle32_v_f32m2(input_a, vl);
            // Use pointer version to support symbolic scalar lookup
            vfloat32m2_t vacc = __riscv_vfmul_vf_f32m2_ptr(va, input_b, vl);
            __riscv_vse32_v_f32m2(output, vacc, vl);
            input_a += vl;
            output += vl;
            n -= vl;
        }
    }
}
