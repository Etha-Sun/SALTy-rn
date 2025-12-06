#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_x8_lut_ukernel__rvv(
        size_t batch,
        const uint8_t* input,
        uint8_t* output,
        const uint8_t* table)
    {
        while (batch > 0) {
            size_t vl = __riscv_vsetvl_e8m8(batch);
            vuint8m8_t vx = __riscv_vle8_v_u8m8(input, vl);
            vuint8m8_t vy = __riscv_vluxei8_v_u8m8(table, vx, vl);
            __riscv_vse8_v_u8m8(output, vy, vl);
            input += vl;
            output += vl;
            batch -= vl;
        }
    }
}
