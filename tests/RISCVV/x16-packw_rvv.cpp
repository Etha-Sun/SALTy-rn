#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_x16_packw_gemm_goi_ukernel_x8__rvv_u16(
        size_t g,
        size_t nc,
        size_t kc,
        size_t nr,
        size_t kr,
        size_t sr,
        const uint16_t* weights,
        const uint16_t* bias,
        const void* scale,
        uint16_t* packed_weights,
        size_t extra_bytes,
        const void* params)
    {
        assert(g != 0);
        assert(nc != 0);
        assert(kc != 0);
        assert(nr == 8);
        assert(kr == 1);
        assert(sr == 1);
        assert(weights != NULL);
        assert(packed_weights != NULL);
    
        (void)scale;
        (void)params;
    
        const ptrdiff_t stride = (ptrdiff_t)(kc * sizeof(uint16_t));
    
        do {
            const uint16_t* w0 = weights;
            size_t n = nc;
    
            for (; n >= 8; n -= 8) {
                if (bias != NULL) {
                    vuint16m1_t vb = __riscv_vle16_v_u16m1(bias, 8);
                    bias += 8;
                    __riscv_vse16_v_u16m1(packed_weights, vb, 8);
                } else {
                    vuint16m1_t vzero = __riscv_vmv_v_x_u16m1(0, 8);
                    __riscv_vse16_v_u16m1(packed_weights, vzero, 8);
                }
                packed_weights += 8;
    
                const uint16_t* w = w0;
                size_t k = kc;
    
                for (; k >= 4; k -= 4) {
                    vuint16m1_t v0 = __riscv_vlse16_v_u16m1(w + 0, stride, 8);
                    vuint16m1_t v1 = __riscv_vlse16_v_u16m1(w + 1, stride, 8);
                    vuint16m1_t v2 = __riscv_vlse16_v_u16m1(w + 2, stride, 8);
                    vuint16m1_t v3 = __riscv_vlse16_v_u16m1(w + 3, stride, 8);
                    __riscv_vse16_v_u16m1(packed_weights + 0, v0, 8);
                    __riscv_vse16_v_u16m1(packed_weights + 8, v1, 8);
                    __riscv_vse16_v_u16m1(packed_weights + 16, v2, 8);
                    __riscv_vse16_v_u16m1(packed_weights + 24, v3, 8);
                    packed_weights += 32;
                    w += 4;
                }
    
                for (; k > 0; k--) {
                    vuint16m1_t v = __riscv_vlse16_v_u16m1(w, stride, 8);
                    __riscv_vse16_v_u16m1(packed_weights, v, 8);
                    packed_weights += 8;
                    w++;
                }
    
                packed_weights = (uint16_t*)((uintptr_t)packed_weights + extra_bytes);
                w0 += 8 * kc;
            }
    
            if (n != 0) {
                if (bias != NULL) {
                    size_t nb = n;
                    do {
                        *packed_weights++ = *bias++;
                    } while (--nb != 0);
                    packed_weights += (8 - n);
                } else {
                    vuint16m1_t vzero = __riscv_vmv_v_x_u16m1(0, 8);
                    __riscv_vse16_v_u16m1(packed_weights, vzero, 8);
                    packed_weights += 8;
                }
    
                const uint16_t* w = w0;
                size_t k = kc;
                vuint16m1_t vzero = __riscv_vmv_v_x_u16m1(0, 8);
    
                for (; k >= 4; k -= 4) {
                    vuint16m1_t v0 = __riscv_vlse16_v_u16m1_tu(vzero, w + 0, stride, n);
                    vuint16m1_t v1 = __riscv_vlse16_v_u16m1_tu(vzero, w + 1, stride, n);
                    vuint16m1_t v2 = __riscv_vlse16_v_u16m1_tu(vzero, w + 2, stride, n);
                    vuint16m1_t v3 = __riscv_vlse16_v_u16m1_tu(vzero, w + 3, stride, n);
                    __riscv_vse16_v_u16m1(packed_weights + 0, v0, 8);
                    __riscv_vse16_v_u16m1(packed_weights + 8, v1, 8);
                    __riscv_vse16_v_u16m1(packed_weights + 16, v2, 8);
                    __riscv_vse16_v_u16m1(packed_weights + 24, v3, 8);
                    packed_weights += 32;
                    w += 4;
                }
    
                for (; k > 0; k--) {
                    vuint16m1_t v = __riscv_vlse16_v_u16m1_tu(vzero, w, stride, n);
                    __riscv_vse16_v_u16m1(packed_weights, v, 8);
                    packed_weights += 8;
                    w++;
                }
    
                packed_weights = (uint16_t*)((uintptr_t)packed_weights + extra_bytes);
            }
    
            weights += nc * kc;
        } while (--g != 0);
    }
}
