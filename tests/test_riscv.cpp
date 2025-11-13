#if defined(__riscv_vector)
#include <riscv_vector.h>
#define HAS_RISCV_V 1
#endif

#ifdef HAS_RISCV_V
void riscv_add_scale_intrinsic(const int32_t *a, const int32_t *b,
                                int32_t *result, int len) {
    
    size_t n = len;
    for (size_t vl; n > 0; n -= vl, a += vl, b += vl, result += vl) {
        vl = __riscv_vsetvl_e32m1(n);  
        
        // Load vectors
        vint32m1_t va = __riscv_vle32_v_i32m1(a, vl);
        vint32m1_t vb = __riscv_vle32_v_i32m1(b, vl);
        
        // Vector add
        vint32m1_t vsum = __riscv_vadd_vv_i32m1(va, vb, vl);
        
        // Vector-scalar multiply by 3
        vint32m1_t vresult = __riscv_vmul_vx_i32m1(vsum, 3, vl);
        
        // Store result
        __riscv_vse32_v_i32m1(result, vresult, vl);
    }
}
#endif
