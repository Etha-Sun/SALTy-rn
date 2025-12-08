#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_x32_packw_gemm_goi_ukernel_x8__rvv(
        size_t g,
        size_t nc,
        size_t kc,
        size_t nr,
        size_t kr,
        size_t sr,
        const uint32_t* weights,
        const uint32_t* bias,
        const void* scale,
        uint32_t* packed_weights,
        size_t extra_bytes,
        const void* params)
    {
        size_t vl8 = __riscv_vsetvl_e32m1(8);
        const ptrdiff_t stride = 8 * sizeof(uint32_t);
    
        do {
            const uint32_t* w0 = weights;
            size_t n = nc;
    
            for (; n >= 8; n -= 8) {
                if (bias != NULL) {
                    vuint32m1_t vb = __riscv_vle32_v_u32m1(bias, vl8);
                    __riscv_vse32_v_u32m1(packed_weights, vb, vl8);
                    bias += 8;
                } else {
                    vuint32m1_t vzero = __riscv_vmv_v_x_u32m1(0, vl8);
                    __riscv_vse32_v_u32m1(packed_weights, vzero, vl8);
                }
                packed_weights += 8;
    
                const uint32_t* w1 = w0 + kc;
                const uint32_t* w2 = w1 + kc;
                const uint32_t* w3 = w2 + kc;
                const uint32_t* w4 = w3 + kc;
                const uint32_t* w5 = w4 + kc;
                const uint32_t* w6 = w5 + kc;
                const uint32_t* w7 = w6 + kc;
    
                size_t k = kc;
                while (k > 0) {
                    size_t kl = __riscv_vsetvl_e32m1(k);
    
                    vuint32m1_t v0 = __riscv_vle32_v_u32m1(w0, kl);
                    vuint32m1_t v1 = __riscv_vle32_v_u32m1(w1, kl);
                    vuint32m1_t v2 = __riscv_vle32_v_u32m1(w2, kl);
                    vuint32m1_t v3 = __riscv_vle32_v_u32m1(w3, kl);
                    vuint32m1_t v4 = __riscv_vle32_v_u32m1(w4, kl);
                    vuint32m1_t v5 = __riscv_vle32_v_u32m1(w5, kl);
                    vuint32m1_t v6 = __riscv_vle32_v_u32m1(w6, kl);
                    vuint32m1_t v7 = __riscv_vle32_v_u32m1(w7, kl);
    
                    __riscv_vsse32_v_u32m1(packed_weights + 0, stride, v0, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 1, stride, v1, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 2, stride, v2, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 3, stride, v3, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 4, stride, v4, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 5, stride, v5, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 6, stride, v6, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 7, stride, v7, kl);
    
                    w0 += kl;
                    w1 += kl;
                    w2 += kl;
                    w3 += kl;
                    w4 += kl;
                    w5 += kl;
                    w6 += kl;
                    w7 += kl;
                    packed_weights += kl * 8;
                    k -= kl;
                }
    
                packed_weights = (uint32_t*)((uintptr_t)packed_weights + extra_bytes);
                w0 = w7;
            }
    
            if (n != 0) {
                if (bias != NULL) {
                    size_t nb = n;
                    do {
                        *packed_weights++ = *bias++;
                    } while (--nb != 0);
                    packed_weights += (8 - n);
                } else {
                    vuint32m1_t vzero = __riscv_vmv_v_x_u32m1(0, vl8);
                    __riscv_vse32_v_u32m1(packed_weights, vzero, vl8);
                    packed_weights += 8;
                }
    
                const uint32_t* w1 = w0 + kc;
                if (n < 2) w1 = w0;
                const uint32_t* w2 = w1 + kc;
                if (n <= 2) w2 = w1;
                const uint32_t* w3 = w2 + kc;
                if (n < 4) w3 = w2;
                const uint32_t* w4 = w3 + kc;
                if (n <= 4) w4 = w3;
                const uint32_t* w5 = w4 + kc;
                if (n < 6) w5 = w4;
                const uint32_t* w6 = w5 + kc;
                if (n <= 6) w6 = w5;
    
                size_t k = kc;
                while (k > 0) {
                    size_t kl = __riscv_vsetvl_e32m1(k);
    
                    vuint32m1_t v0 = __riscv_vle32_v_u32m1(w0, kl);
                    vuint32m1_t v1 = __riscv_vle32_v_u32m1(w1, kl);
                    vuint32m1_t v2 = __riscv_vle32_v_u32m1(w2, kl);
                    vuint32m1_t v3 = __riscv_vle32_v_u32m1(w3, kl);
                    vuint32m1_t v4 = __riscv_vle32_v_u32m1(w4, kl);
                    vuint32m1_t v5 = __riscv_vle32_v_u32m1(w5, kl);
                    vuint32m1_t v6 = __riscv_vle32_v_u32m1(w6, kl);
                    vuint32m1_t v7 = __riscv_vmv_v_x_u32m1(0, kl);
    
                    __riscv_vsse32_v_u32m1(packed_weights + 0, stride, v0, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 1, stride, v1, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 2, stride, v2, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 3, stride, v3, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 4, stride, v4, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 5, stride, v5, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 6, stride, v6, kl);
                    __riscv_vsse32_v_u32m1(packed_weights + 7, stride, v7, kl);
    
                    w0 += kl;
                    w1 += kl;
                    w2 += kl;
                    w3 += kl;
                    w4 += kl;
                    w5 += kl;
                    w6 += kl;
                    packed_weights += kl * 8;
                    k -= kl;
                }
    
                packed_weights = (uint32_t*)((uintptr_t)packed_weights + extra_bytes);
            }
    
            weights += nc * kc;
        } while (--g != 0);
    }
}
