#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_xx_pad_ukernel_p16__rvv(
        size_t rows,
        size_t channels,
        size_t pre_padding,
        size_t post_padding,
        const void* input,
        size_t input_stride,
        void* output,
        size_t output_stride,
        uint32_t fill_pattern)
    {
        const size_t input_increment = input_stride - channels;
        const size_t output_increment = output_stride - (pre_padding + channels + post_padding);
    
        size_t max_vl_u32 = __riscv_vsetvlmax_e32m1();
        vuint32m1_t vfill32 = __riscv_vmv_v_x_u32m1(fill_pattern, max_vl_u32);
        vuint8m1_t vfill = __riscv_vreinterpret_v_u32m1_u8m1(vfill32);
    
        do {
            size_t l = pre_padding;
            while (l > 0) {
                size_t vl = __riscv_vsetvl_e8m1(l);
                __riscv_vse8_v_u8m1((uint8_t*)output, vfill, vl);
                output = (uint8_t*)output + vl;
                l -= vl;
            }
    
            size_t c = channels;
            while (c > 0) {
                size_t vl = __riscv_vsetvl_e8m1(c);
                vuint8m1_t vdata = __riscv_vle8_v_u8m1((const uint8_t*)input, vl);
                __riscv_vse8_v_u8m1((uint8_t*)output, vdata, vl);
                input = (const uint8_t*)input + vl;
                output = (uint8_t*)output + vl;
                c -= vl;
            }
    
            size_t r = post_padding;
            while (r > 0) {
                size_t vl = __riscv_vsetvl_e8m1(r);
                __riscv_vse8_v_u8m1((uint8_t*)output, vfill, vl);
                output = (uint8_t*)output + vl;
                r -= vl;
            }
    
            input = (const void*)((uintptr_t)input + input_increment);
            output = (void*)((uintptr_t)output + output_increment);
        } while (--rows != 0);
    }
}
