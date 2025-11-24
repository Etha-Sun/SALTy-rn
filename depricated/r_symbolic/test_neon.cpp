#if defined(__ARM_NEON)
#include <arm_neon.h>
#define HAS_NEON 1
#endif

#ifdef HAS_NEON
void neon_add_scale_intrinsic(const int32_t *a, const int32_t *b, 
                               int32_t *result, int len) {
    
    for (int i = 0; i < len; i += 4) {
        // Load vectors (4 elements at a time)
        int32x4_t va = vld1q_s32(&a[i]);
        int32x4_t vb = vld1q_s32(&b[i]);
        
        // Vector add: va + vb
        int32x4_t vsum = vaddq_s32(va, vb);
        
        // Vector multiply by scalar 3
        int32x4_t vresult = vmulq_n_s32(vsum, 3);
        
        // Store result
        vst1q_s32(&result[i], vresult);
    }
}
#endif