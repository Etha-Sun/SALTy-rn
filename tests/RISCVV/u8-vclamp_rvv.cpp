#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_u8_vclamp_ukernel__rvv_u64(
        size_t batch,
        const uint8_t* input,
        uint8_t* output,
        const struct xnn_u8_minmax_params* params)
    {
        uint8_t voutput_min = (uint8_t)params->scalar.min;
        uint8_t voutput_max = (uint8_t)params->scalar.max;
    
        while (batch > 0) {
            size_t vl = __riscv_vsetvl_e8m8(batch);
            vuint8m8_t vacc = __riscv_vle8_v_u8m8(input, vl);
            vacc = __riscv_vmaxu_vx_u8m8(vacc, voutput_min, vl);
            vacc = __riscv_vminu_vx_u8m8(vacc, voutput_max, vl);
            __riscv_vse8_v_u8m8(output, vacc, vl);
            input += vl;
            output += vl;
            batch -= vl;
        }
    }
}
