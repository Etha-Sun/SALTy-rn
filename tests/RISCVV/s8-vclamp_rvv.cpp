#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_s8_vclamp_ukernel__rvv_u64(
        size_t batch,
        const int8_t* input,
        int8_t* output,
        const struct xnn_s8_minmax_params* params)
    {
        assert(batch != 0);
        assert(batch % sizeof(int8_t) == 0);
        assert(input != NULL);
        assert(output != NULL);
    
        int8_t output_min = (int8_t)params->scalar.min;
        int8_t output_max = (int8_t)params->scalar.max;
    
        while (batch > 0) {
            size_t vl = __riscv_vsetvl_e8m2(batch);
            vint8m2_t vacc = __riscv_vle8_v_i8m2(input, vl);
            vacc = __riscv_vmax_vx_i8m2(vacc, output_min, vl);
            vacc = __riscv_vmin_vx_i8m2(vacc, output_max, vl);
            __riscv_vse8_v_i8m2(output, vacc, vl);
            input += vl;
            output += vl;
            batch -= vl;
        }
    }
}
