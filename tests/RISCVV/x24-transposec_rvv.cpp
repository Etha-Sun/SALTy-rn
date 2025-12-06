#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_x24_transposec_ukernel__2x2_rvv(
        const void* input,
        void* output,
        size_t input_stride,
        size_t output_stride,
        size_t block_width,
        size_t block_height)
    {
        static const uint8_t pos0[8] = {0, 1, 2, 8, 9, 10, 0, 0};
        static const uint8_t pos1[8] = {3, 4, 5, 11, 12, 13, 0, 0};
    
        const size_t tile_height = 2;
        const size_t tile_width = 2;
        const size_t tile_wbytes = tile_width * 3;
        const size_t tile_wbytes_minus_4 = tile_wbytes - 4;
        const size_t input_reset = tile_wbytes - round_down_po2(block_height, tile_height) * input_stride;
        const size_t output_reset = tile_height * output_stride - block_height * 3;
        const size_t tile_stride = tile_height * input_stride;
    
        const uint8_t* i0 = (const uint8_t*) input;
        const uint8_t* i1 = (const uint8_t*) ((uintptr_t) i0 + input_stride);
    
        uint8_t* o0 = (uint8_t*) output;
        uint8_t* o1 = (uint8_t*) ((uintptr_t) o0 + output_stride);
    
        size_t vl8 = __riscv_vsetvl_e8m1(8);
        size_t vl16 = __riscv_vsetvl_e8m1(16);
    
        vuint8m1_t vperm0 = __riscv_vle8_v_u8m1(pos0, vl8);
        vuint8m1_t vperm1 = __riscv_vle8_v_u8m1(pos1, vl8);
    
        do {
            if (block_width < 2) {
                o1 = o0;
            }
            size_t bh = block_height;
            for (; bh >= 2; bh -= 2) {
                vuint8m1_t v0 = __riscv_vle8_v_u8m1(i0, vl8);
                i0 = (const uint8_t*) ((uintptr_t) i0 + tile_stride);
                vuint8m1_t v1 = __riscv_vle8_v_u8m1(i1, vl8);
                i1 = (const uint8_t*) ((uintptr_t) i1 + tile_stride);
    
                vuint8m1_t combined = __riscv_vslideup_vx_u8m1(v0, v1, 8, vl16);
    
                vuint8m1_t vres0 = __riscv_vrgather_vv_u8m1(combined, vperm0, vl8);
                vuint8m1_t vres1 = __riscv_vrgather_vv_u8m1(combined, vperm1, vl8);
    
                __riscv_vse8_v_u8m1(o1, vres1, 4);
                o1 += 4;
                __riscv_vse8_v_u8m1(o0, vres0, 4);
                o0 += 4;
    
                vuint8m1_t vres1_hi = __riscv_vslidedown_vx_u8m1(vres1, 4, vl8);
                vuint8m1_t vres0_hi = __riscv_vslidedown_vx_u8m1(vres0, 4, vl8);
                __riscv_vse8_v_u8m1(o1, vres1_hi, 2);
                o1 += tile_wbytes_minus_4;
                __riscv_vse8_v_u8m1(o0, vres0_hi, 2);
                o0 += tile_wbytes_minus_4;
            }
    
            if (bh != 0) {
                if (bh < 2) {
                    i1 = i0;
                }
                vuint8m1_t v = __riscv_vle8_v_u8m1(i0, vl8);
    
                vuint8m1_t vres0 = __riscv_vrgather_vv_u8m1(v, vperm0, vl8);
                vuint8m1_t vres1 = __riscv_vrgather_vv_u8m1(v, vperm1, vl8);
    
                if (bh & 1) {
                    __riscv_vse8_v_u8m1(o1, vres1, 2);
                    o1 += 2;
                    __riscv_vse8_v_u8m1(o0, vres0, 2);
                    o0 += 2;
    
                    vuint8m1_t vres1_b2 = __riscv_vslidedown_vx_u8m1(vres1, 2, vl8);
                    vuint8m1_t vres0_b2 = __riscv_vslidedown_vx_u8m1(vres0, 2, vl8);
                    __riscv_vse8_v_u8m1(o1, vres1_b2, 1);
                    o1 += 1;
                    __riscv_vse8_v_u8m1(o0, vres0_b2, 1);
                    o0 += 1;
                }
            }
            i0 = (const uint8_t*) ((uintptr_t) i0 + input_reset);
            i1 = (const uint8_t*) ((uintptr_t) i0 + input_stride);
            o0 = (uint8_t*) ((uintptr_t) o0 + output_reset);
            o1 = (uint8_t*) ((uintptr_t) o1 + output_reset);
            block_width = doz(block_width, tile_width);
        } while (block_width != 0);
    }
}
