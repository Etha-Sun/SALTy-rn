#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

// The canonical layout groups weights in tiles of 8 output columns.
// We maintain this layout but increase the register block size to 32 columns.
static void pack_weights(const void* src_v, size_t src_n,
                         void* dst_v, size_t dst_cap)
{
    const float* src = (const float*)src_v;
    float*       dst = (float*)dst_v;
    (void)dst_cap; 
    for (size_t i = 0; i < src_n; i++) {
        dst[i] = src[i];
    }
}

void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    size_t ks,
    const float** restrict a,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    size_t a_offset,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mr <= 1);
  assert(a != NULL && w != NULL && c != NULL);

  const size_t kc_elems = kc / sizeof(float);
  const size_t ks_groups = ks / sizeof(void*);
  
  // Weights are tiled by 8: [Bias (8x f32)][W_k0 (8x f32)][W_k1 (8x f32)]...
  const size_t tile_stride = 8 * (1 + ks_groups * kc_elems);
  
  // Splat constants into vector registers once outside the loops.
  const size_t vlmax_full = __riscv_vsetvlmax_e32m4();
  const vfloat32m4_t vmax = __riscv_vfmv_v_f_f32m4(params->scalar.max, vlmax_full);
  const vfloat32m4_t vmin = __riscv_vfmv_v_f_f32m4(params->scalar.min, vlmax_full);

  // Primary loop: Process 32 columns (4 tiles of 8)
  while (nc >= 32) {
    const size_t vl = __riscv_vsetvl_e32m4(8);
    const float* w0 = w;
    const float* w1 = w + tile_stride;
    const float* w2 = w + 2 * tile_stride;
    const float* w3 = w + 3 * tile_stride;
    
    // Initial bias loads into 4 accumulators (Uses 16 vector registers total for LMUL=4)
    vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(w0, vl); w0 += 8;
    vfloat32m4_t vacc1 = __riscv_vle32_v_f32m4(w1, vl); w1 += 8;
    vfloat32m4_t vacc2 = __riscv_vle32_v_f32m4(w2, vl); w2 += 8;
    vfloat32m4_t vacc3 = __riscv_vle32_v_f32m4(w3, vl); w3 += 8;
    
    size_t p = ks_groups;
    const float** ai = a;
    do {
      const float* restrict a0 = *ai++;
      if (a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
        
        // Pointer-based boundaries
        const float* a_end_4 = a0 + (kc_elems & ~((size_t)3));
        const float* a_end   = a0 + kc_elems;
        
        // Unroll depth by 4 to reduce scalar overhead and capitalize on DAE.
        while (a0 < a_end_4) {
          const float va0 = a0[0];
          const float va1 = a0[1];
          const float va2 = a0[2];
          const float va3 = a0[3];
          a0 += 4;
          
          // Instruction Interleaving:
          #define FMA_BLOCK(va, off) \
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, va, __riscv_vle32_v_f32m4(w0 + off, vl), vl); \
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, va, __riscv_vle32_v_f32m4(w1 + off, vl), vl); \
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, va, __riscv_vle32_v_f32m4(w2 + off, vl), vl); \
            vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, va, __riscv_vle32_v_f32m4(w3 + off, vl), vl);

          FMA_BLOCK(va0, 0);
          FMA_BLOCK(va1, 8);
          FMA_BLOCK(va2, 16);
          FMA_BLOCK(va3, 24);
          #undef FMA_BLOCK

          w0 += 32; w1 += 32; w2 += 32; w3 += 32;
        }
        
        // Handle remainder of kc_elems
        while (a0 < a_end) {
          const float va = *a0++;
          vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, va, __riscv_vle32_v_f32m4(w0, vl), vl);
          vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, va, __riscv_vle32_v_f32m4(w1, vl), vl);
          vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, va, __riscv_vle32_v_f32m4(w2, vl), vl);
          vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, va, __riscv_vle32_v_f32m4(w3, vl), vl);
          w0 += 8; w1 += 8; w2 += 8; w3 += 8;
        }
      } else {
        const size_t skip = kc_elems * 8;
        w0 += skip; w1 += skip; w2 += skip; w3 += skip;
      }
    } while (--p != 0);

    // Apply clamp using Vector-Vector instructions, avoiding repeated scalar operand forwarding
    vacc0 = __riscv_vfmin_vv_f32m4(vacc0, vmax, vl);
    vacc1 = __riscv_vfmin_vv_f32m4(vacc1, vmax, vl);
    vacc2 = __riscv_vfmin_vv_f32m4(vacc2, vmax, vl);
    vacc3 = __riscv_vfmin_vv_f32m4(vacc3, vmax, vl);
    vacc0 = __riscv_vfmax_vv_f32m4(vacc0, vmin, vl);
    vacc1 = __riscv_vfmax_vv_f32m4(vacc1, vmin, vl);
    vacc2 = __riscv_vfmax_vv_f32m4(vacc2, vmin, vl);
    vacc3 = __riscv_vfmax_vv_f32m4(vacc3, vmin, vl);

    // Unit-stride stores (VSS). Offset calculations happen in the scalar core.
    __riscv_vse32_v_f32m4(c, vacc0, vl);
    __riscv_vse32_v_f32m4((float*)((uintptr_t)c + cn_stride), vacc1, vl);
    __riscv_vse32_v_f32m4((float*)((uintptr_t)c + 2 * cn_stride), vacc2, vl);
    __riscv_vse32_v_f32m4((float*)((uintptr_t)c + 3 * cn_stride), vacc3, vl);
    
    c = (float*) ((uintptr_t) c + 4 * cn_stride);
    w += 4 * tile_stride;
    nc -= 32;
  }

  // Fallback for remaining columns (16 <= nc < 32)
  while (nc >= 16) {
    const size_t vl = __riscv_vsetvl_e32m4(8);
    const float* w0 = w;
    const float* w1 = w + tile_stride;
    vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(w0, vl); w0 += 8;
    vfloat32m4_t vacc1 = __riscv_vle32_v_f32m4(w1, vl); w1 += 8;
    size_t p = ks_groups;
    const float** ai = a;
    do {
      const float* restrict a0 = *ai++;
      if (a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
        
        const float* a_end_4 = a0 + (kc_elems & ~((size_t)3));
        const float* a_end   = a0 + kc_elems;

        while (a0 < a_end_4) {
          float va0 = a0[0], va1 = a0[1], va2 = a0[2], va3 = a0[3]; a0 += 4;
          vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, va0, __riscv_vle32_v_f32m4(w0, vl), vl);
          vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, va0, __riscv_vle32_v_f32m4(w1, vl), vl);
          vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, va1, __riscv_vle32_v_f32m4(w0 + 8, vl), vl);
          vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, va1, __riscv_vle32_v_f32m4(w1 + 8, vl), vl);
          vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, va2, __riscv_vle32_v_f32m4(w0 + 16, vl), vl);
          vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, va2, __riscv_vle32_v_f32m4(w1 + 16, vl), vl);
          vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, va3, __riscv_vle32_v_f32m4(w0 + 24, vl), vl);
          vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, va3, __riscv_vle32_v_f32m4(w1 + 24, vl), vl);
          w0 += 32; w1 += 32;
        }
        while (a0 < a_end) {
          float va = *a0++;
          vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, va, __riscv_vle32_v_f32m4(w0, vl), vl);
          vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, va, __riscv_vle32_v_f32m4(w1, vl), vl);
          w0 += 8; w1 += 8;
        }
      } else { w0 += kc_elems * 8; w1 += kc_elems * 8; }
    } while (--p != 0);
    vacc0 = __riscv_vfmin_vv_f32m4(vacc0, vmax, vl);
    vacc1 = __riscv_vfmin_vv_f32m4(vacc1, vmax, vl);
    vacc0 = __riscv_vfmax_vv_f32m4(vacc0, vmin, vl);
    vacc1 = __riscv_vfmax_vv_f32m4(vacc1, vmin, vl);
    __riscv_vse32_v_f32m4(c, vacc0, vl);
    __riscv_vse32_v_f32m4((float*)((uintptr_t)c + cn_stride), vacc1, vl);
    c = (float*) ((uintptr_t) c + 2 * cn_stride); w += 2 * tile_stride; nc -= 16;
  }

  // Final 8-way loop for trailing columns (nc < 16)
  while (nc > 0) {
    size_t vl = __riscv_vsetvl_e32m4(nc > 8 ? 8 : nc);
    const float* w0 = w;
    vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w0, vl); w0 += 8;
    size_t p = ks_groups;
    const float** ai = a;
    do {
      const float* restrict a0 = *ai++;
      if (a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
        
        const float* a_end = a0 + kc_elems;
        while (a0 < a_end) {
          vacc = __riscv_vfmacc_vf_f32m4(vacc, *a0++, __riscv_vle32_v_f32m4(w0, vl), vl);
          w0 += 8;
        }
      } else { w0 += kc_elems * 8; }
    } while (--p != 0);
    vacc = __riscv_vfmin_vv_f32m4(vacc, vmax, vl);
    vacc = __riscv_vfmax_vv_f32m4(vacc, vmin, vl);
    __riscv_vse32_v_f32m4(c, vacc, vl);
    c = (float*) ((uintptr_t) c + cn_stride); w += tile_stride; nc -= (nc > 8 ? 8 : nc);
  }
}
