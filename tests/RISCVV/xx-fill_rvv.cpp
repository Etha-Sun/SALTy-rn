#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_xx_fill_ukernel__rvv(
        size_t rows,
        size_t channels,
        void* output,
        size_t output_stride,
        const uint32_t fill_pattern)
    {
        // Pre-build a small buffer with the fill pattern for tail handling
        // This allows us to use vector loads to get the correct bytes
        uint8_t pattern_buf[4];
        pattern_buf[0] = (uint8_t)(fill_pattern);
        pattern_buf[1] = (uint8_t)(fill_pattern >> 8);
        pattern_buf[2] = (uint8_t)(fill_pattern >> 16);
        pattern_buf[3] = (uint8_t)(fill_pattern >> 24);
    
        do {
            uint8_t* o = (uint8_t*)output;
            size_t c = channels;
    
            // Main loop: process 4+ bytes at a time using 32-bit stores
            while (c >= 4) {
                size_t vl = __riscv_vsetvl_e32m8(c >> 2);
                vuint32m8_t vfill = __riscv_vmv_v_x_u32m8(fill_pattern, vl);
                __riscv_vse32_v_u32m8((uint32_t*)o, vfill, vl);
                size_t advance = vl << 2;
                o += advance;
                c -= advance;
            }
    
            // Tail: handle remaining 0-3 bytes using vector load/store
            // Load from pattern buffer and store the needed bytes
            if (c > 0) {
                size_t vl = __riscv_vsetvl_e8m1(c);
                vuint8m1_t vtail = __riscv_vle8_v_u8m1(pattern_buf, vl);
                __riscv_vse8_v_u8m1(o, vtail, vl);
            }
    
            output = (void*)((uintptr_t)output + output_stride);
        } while (--rows != 0);
    }
}
