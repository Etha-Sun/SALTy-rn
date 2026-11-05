#include <riscv_vector.h>
#include <assert.h>
#include <stdint.h>
#include <stddef.h>

// Canonical layout in `src` (src_n = nc*(kc_elems+1) floats, nr=8 column
// tiles): per tile of 8 output columns, [bias[8], then for each of the
// kc_elems k-steps: 8 weights — one per column in the tile]. Tiles follow
// each other in increasing column order. This identity copy keeps that
// order.
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

// Strategy: Compiler branch prediction directives (Strategy 17).
// We use `__builtin_expect` on loop conditions and tail branches to give 
// the compiler explicit branch probabilities, ensuring the primary execution
// paths are laid out linearly in memory. This maximizes fetch efficiency and
// avoids branch misprediction pipeline flushes.
void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mr != 0);
  assert(mr <= 4);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(float) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  const float min_v = params->scalar.min;
  const float max_v = params->scalar.max;
  const size_t kc_elements = kc / sizeof(float);
  const size_t tile_stride = 8 + kc_elements * 8;

  switch (mr) {
    case 4: {
      const float *a0 = a;
      const float *a1 = (const float*) ((uintptr_t) a0 + a_stride);
      const float *a2 = (const float*) ((uintptr_t) a1 + a_stride);
      const float *a3 = (const float*) ((uintptr_t) a2 + a_stride);
      float *c0 = c;
      float *c1 = (float*) ((uintptr_t) c0 + cm_stride);
      float *c2 = (float*) ((uintptr_t) c1 + cm_stride);
      float *c3 = (float*) ((uintptr_t) c2 + cm_stride);

      while (__builtin_expect(nc >= 16, 1)) {
        size_t vl = __riscv_vsetvl_e32m2(8);
        const float *w0 = w, *w1 = w + tile_stride;
        vfloat32m2_t vacc00 = __riscv_vle32_v_f32m2(w0, vl); w0 += 8;
        vfloat32m2_t vacc01 = __riscv_vle32_v_f32m2(w1, vl); w1 += 8;
        vfloat32m2_t vacc10 = vacc00, vacc11 = vacc01;
        vfloat32m2_t vacc20 = vacc00, vacc21 = vacc01;
        vfloat32m2_t vacc30 = vacc00, vacc31 = vacc01;

        const float *ak0 = a0, *ak1 = a1, *ak2 = a2, *ak3 = a3;
        size_t k = kc;
        while (__builtin_expect(k >= 4 * sizeof(float), 1)) {
          vfloat32m2_t vb0_0 = __riscv_vle32_v_f32m2(w0, vl);
          vfloat32m2_t vb1_0 = __riscv_vle32_v_f32m2(w1, vl);
          float av0_0 = ak0[0], av1_0 = ak1[0], av2_0 = ak2[0], av3_0 = ak3[0];
          
          vfloat32m2_t vb0_1 = __riscv_vle32_v_f32m2(w0 + 8, vl);
          vfloat32m2_t vb1_1 = __riscv_vle32_v_f32m2(w1 + 8, vl);
          float av0_1 = ak0[1], av1_1 = ak1[1], av2_1 = ak2[1], av3_1 = ak3[1];
          
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_0, vb0_0, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_0, vb1_0, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_0, vb0_0, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_0, vb1_0, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2_0, vb0_0, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2_0, vb1_0, vl);
          vacc30 = __riscv_vfmacc_vf_f32m2(vacc30, av3_0, vb0_0, vl);
          vacc31 = __riscv_vfmacc_vf_f32m2(vacc31, av3_0, vb1_0, vl);

          vfloat32m2_t vb0_2 = __riscv_vle32_v_f32m2(w0 + 16, vl);
          vfloat32m2_t vb1_2 = __riscv_vle32_v_f32m2(w1 + 16, vl);
          float av0_2 = ak0[2], av1_2 = ak1[2], av2_2 = ak2[2], av3_2 = ak3[2];
          
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_1, vb0_1, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_1, vb1_1, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_1, vb0_1, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_1, vb1_1, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2_1, vb0_1, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2_1, vb1_1, vl);
          vacc30 = __riscv_vfmacc_vf_f32m2(vacc30, av3_1, vb0_1, vl);
          vacc31 = __riscv_vfmacc_vf_f32m2(vacc31, av3_1, vb1_1, vl);

          vfloat32m2_t vb0_3 = __riscv_vle32_v_f32m2(w0 + 24, vl);
          vfloat32m2_t vb1_3 = __riscv_vle32_v_f32m2(w1 + 24, vl);
          float av0_3 = ak0[3], av1_3 = ak1[3], av2_3 = ak2[3], av3_3 = ak3[3];

          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_2, vb0_2, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_2, vb1_2, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_2, vb0_2, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_2, vb1_2, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2_2, vb0_2, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2_2, vb1_2, vl);
          vacc30 = __riscv_vfmacc_vf_f32m2(vacc30, av3_2, vb0_2, vl);
          vacc31 = __riscv_vfmacc_vf_f32m2(vacc31, av3_2, vb1_2, vl);

          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_3, vb0_3, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_3, vb1_3, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_3, vb0_3, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_3, vb1_3, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2_3, vb0_3, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2_3, vb1_3, vl);
          vacc30 = __riscv_vfmacc_vf_f32m2(vacc30, av3_3, vb0_3, vl);
          vacc31 = __riscv_vfmacc_vf_f32m2(vacc31, av3_3, vb1_3, vl);

          w0 += 32; w1 += 32;
          ak0 += 4; ak1 += 4; ak2 += 4; ak3 += 4;
          k -= 4 * sizeof(float);
        }

        while (__builtin_expect(k > 0, 0)) {
          vfloat32m2_t vb0 = __riscv_vle32_v_f32m2(w0, vl); w0 += 8;
          vfloat32m2_t vb1 = __riscv_vle32_v_f32m2(w1, vl); w1 += 8;
          float av0 = *ak0++, av1 = *ak1++, av2 = *ak2++, av3 = *ak3++;
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0, vb0, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0, vb1, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1, vb0, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1, vb1, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2, vb0, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2, vb1, vl);
          vacc30 = __riscv_vfmacc_vf_f32m2(vacc30, av3, vb0, vl);
          vacc31 = __riscv_vfmacc_vf_f32m2(vacc31, av3, vb1, vl);
          k -= sizeof(float);
        }

        vacc00 = __riscv_vfmin_vf_f32m2(vacc00, max_v, vl);
        vacc01 = __riscv_vfmin_vf_f32m2(vacc01, max_v, vl);
        vacc10 = __riscv_vfmin_vf_f32m2(vacc10, max_v, vl);
        vacc11 = __riscv_vfmin_vf_f32m2(vacc11, max_v, vl);
        vacc20 = __riscv_vfmin_vf_f32m2(vacc20, max_v, vl);
        vacc21 = __riscv_vfmin_vf_f32m2(vacc21, max_v, vl);
        vacc30 = __riscv_vfmin_vf_f32m2(vacc30, max_v, vl);
        vacc31 = __riscv_vfmin_vf_f32m2(vacc31, max_v, vl);

        vacc00 = __riscv_vfmax_vf_f32m2(vacc00, min_v, vl);
        __riscv_vse32_v_f32m2(c0, vacc00, vl); 
        vacc01 = __riscv_vfmax_vf_f32m2(vacc01, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c0 + cn_stride), vacc01, vl);
        
        vacc10 = __riscv_vfmax_vf_f32m2(vacc10, min_v, vl);
        __riscv_vse32_v_f32m2(c1, vacc10, vl); 
        vacc11 = __riscv_vfmax_vf_f32m2(vacc11, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c1 + cn_stride), vacc11, vl);
        
        vacc20 = __riscv_vfmax_vf_f32m2(vacc20, min_v, vl);
        __riscv_vse32_v_f32m2(c2, vacc20, vl); 
        vacc21 = __riscv_vfmax_vf_f32m2(vacc21, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c2 + cn_stride), vacc21, vl);
        
        vacc30 = __riscv_vfmax_vf_f32m2(vacc30, min_v, vl);
        __riscv_vse32_v_f32m2(c3, vacc30, vl); 
        vacc31 = __riscv_vfmax_vf_f32m2(vacc31, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c3 + cn_stride), vacc31, vl);

        nc -= 16; 
        w = w1;
        c0 = (float*)((uintptr_t)c0 + 2 * cn_stride); 
        c1 = (float*)((uintptr_t)c1 + 2 * cn_stride);
        c2 = (float*)((uintptr_t)c2 + 2 * cn_stride); 
        c3 = (float*)((uintptr_t)c3 + 2 * cn_stride);
      }

      if (__builtin_expect(nc > 0, 0)) {
        do {
          size_t vl = __riscv_vsetvl_e32m4(nc > 8 ? 8 : nc);
          vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(w, vl); w += 8;
          vfloat32m4_t vacc1 = vacc0, vacc2 = vacc0, vacc3 = vacc0;

          const float *ak0 = a0, *ak1 = a1, *ak2 = a2, *ak3 = a3;
          size_t k = kc;
          while (__builtin_expect(k >= 4 * sizeof(float), 1)) {
            vfloat32m4_t vb0 = __riscv_vle32_v_f32m4(w, vl);
            float av0_0 = ak0[0], av1_0 = ak1[0], av2_0 = ak2[0], av3_0 = ak3[0];
            vfloat32m4_t vb1 = __riscv_vle32_v_f32m4(w + 8, vl);
            float av0_1 = ak0[1], av1_1 = ak1[1], av2_1 = ak2[1], av3_1 = ak3[1];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_0, vb0, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_0, vb0, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, av2_0, vb0, vl);
            vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, av3_0, vb0, vl);

            vfloat32m4_t vb2 = __riscv_vle32_v_f32m4(w + 16, vl);
            float av0_2 = ak0[2], av1_2 = ak1[2], av2_2 = ak2[2], av3_2 = ak3[2];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_1, vb1, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_1, vb1, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, av2_1, vb1, vl);
            vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, av3_1, vb1, vl);

            vfloat32m4_t vb3 = __riscv_vle32_v_f32m4(w + 24, vl);
            float av0_3 = ak0[3], av1_3 = ak1[3], av2_3 = ak2[3], av3_3 = ak3[3];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_2, vb2, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_2, vb2, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, av2_2, vb2, vl);
            vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, av3_2, vb2, vl);

            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_3, vb3, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_3, vb3, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, av2_3, vb3, vl);
            vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, av3_3, vb3, vl);

            w += 32; ak0 += 4; ak1 += 4; ak2 += 4; ak3 += 4; k -= 4 * sizeof(float);
          }
          
          while (__builtin_expect(k > 0, 0)) {
            vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl); w += 8;
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, *ak0++, vb, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, *ak1++, vb, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, *ak2++, vb, vl);
            vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, *ak3++, vb, vl);
            k -= sizeof(float);
          }

          vacc0 = __riscv_vfmin_vf_f32m4(vacc0, max_v, vl);
          vacc1 = __riscv_vfmin_vf_f32m4(vacc1, max_v, vl);
          vacc2 = __riscv_vfmin_vf_f32m4(vacc2, max_v, vl);
          vacc3 = __riscv_vfmin_vf_f32m4(vacc3, max_v, vl);

          vacc0 = __riscv_vfmax_vf_f32m4(vacc0, min_v, vl);
          __riscv_vse32_v_f32m4(c0, vacc0, vl);
          vacc1 = __riscv_vfmax_vf_f32m4(vacc1, min_v, vl);
          __riscv_vse32_v_f32m4(c1, vacc1, vl);
          vacc2 = __riscv_vfmax_vf_f32m4(vacc2, min_v, vl);
          __riscv_vse32_v_f32m4(c2, vacc2, vl);
          vacc3 = __riscv_vfmax_vf_f32m4(vacc3, min_v, vl);
          __riscv_vse32_v_f32m4(c3, vacc3, vl);

          nc -= vl;
          if (__builtin_expect(nc > 0, 0)) {
            c0 = (float*) ((uintptr_t) c0 + cn_stride);
            c1 = (float*) ((uintptr_t) c1 + cn_stride);
            c2 = (float*) ((uintptr_t) c2 + cn_stride);
            c3 = (float*) ((uintptr_t) c3 + cn_stride);
          }
        } while (__builtin_expect(nc > 0, 0));
      }
      break;
    }

    case 3: {
      const float *a0 = a;
      const float *a1 = (const float*)((uintptr_t)a0 + a_stride);
      const float *a2 = (const float*)((uintptr_t)a1 + a_stride);
      float *c0 = c;
      float *c1 = (float*)((uintptr_t)c0 + cm_stride);
      float *c2 = (float*)((uintptr_t)c1 + cm_stride);

      while (__builtin_expect(nc >= 16, 1)) {
        size_t vl = __riscv_vsetvl_e32m2(8);
        const float *w0 = w, *w1 = w + tile_stride;
        vfloat32m2_t vacc00 = __riscv_vle32_v_f32m2(w0, vl); w0 += 8;
        vfloat32m2_t vacc01 = __riscv_vle32_v_f32m2(w1, vl); w1 += 8;
        vfloat32m2_t vacc10 = vacc00, vacc11 = vacc01;
        vfloat32m2_t vacc20 = vacc00, vacc21 = vacc01;

        const float *ak0 = a0, *ak1 = a1, *ak2 = a2;
        size_t k = kc;
        while (__builtin_expect(k >= 4 * sizeof(float), 1)) {
          vfloat32m2_t vb0_0 = __riscv_vle32_v_f32m2(w0, vl);
          vfloat32m2_t vb1_0 = __riscv_vle32_v_f32m2(w1, vl);
          float av0_0 = ak0[0], av1_0 = ak1[0], av2_0 = ak2[0];
          
          vfloat32m2_t vb0_1 = __riscv_vle32_v_f32m2(w0 + 8, vl);
          vfloat32m2_t vb1_1 = __riscv_vle32_v_f32m2(w1 + 8, vl);
          float av0_1 = ak0[1], av1_1 = ak1[1], av2_1 = ak2[1];
          
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_0, vb0_0, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_0, vb1_0, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_0, vb0_0, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_0, vb1_0, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2_0, vb0_0, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2_0, vb1_0, vl);

          vfloat32m2_t vb0_2 = __riscv_vle32_v_f32m2(w0 + 16, vl);
          vfloat32m2_t vb1_2 = __riscv_vle32_v_f32m2(w1 + 16, vl);
          float av0_2 = ak0[2], av1_2 = ak1[2], av2_2 = ak2[2];
          
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_1, vb0_1, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_1, vb1_1, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_1, vb0_1, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_1, vb1_1, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2_1, vb0_1, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2_1, vb1_1, vl);

          vfloat32m2_t vb0_3 = __riscv_vle32_v_f32m2(w0 + 24, vl);
          vfloat32m2_t vb1_3 = __riscv_vle32_v_f32m2(w1 + 24, vl);
          float av0_3 = ak0[3], av1_3 = ak1[3], av2_3 = ak2[3];

          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_2, vb0_2, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_2, vb1_2, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_2, vb0_2, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_2, vb1_2, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2_2, vb0_2, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2_2, vb1_2, vl);

          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_3, vb0_3, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_3, vb1_3, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_3, vb0_3, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_3, vb1_3, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2_3, vb0_3, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2_3, vb1_3, vl);

          w0 += 32; w1 += 32;
          ak0 += 4; ak1 += 4; ak2 += 4;
          k -= 4 * sizeof(float);
        }

        while (__builtin_expect(k > 0, 0)) {
          vfloat32m2_t vb0 = __riscv_vle32_v_f32m2(w0, vl); w0 += 8;
          vfloat32m2_t vb1 = __riscv_vle32_v_f32m2(w1, vl); w1 += 8;
          float av0 = *ak0++, av1 = *ak1++, av2 = *ak2++;
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0, vb0, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0, vb1, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1, vb0, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1, vb1, vl);
          vacc20 = __riscv_vfmacc_vf_f32m2(vacc20, av2, vb0, vl);
          vacc21 = __riscv_vfmacc_vf_f32m2(vacc21, av2, vb1, vl);
          k -= sizeof(float);
        }

        vacc00 = __riscv_vfmin_vf_f32m2(vacc00, max_v, vl);
        vacc01 = __riscv_vfmin_vf_f32m2(vacc01, max_v, vl);
        vacc10 = __riscv_vfmin_vf_f32m2(vacc10, max_v, vl);
        vacc11 = __riscv_vfmin_vf_f32m2(vacc11, max_v, vl);
        vacc20 = __riscv_vfmin_vf_f32m2(vacc20, max_v, vl);
        vacc21 = __riscv_vfmin_vf_f32m2(vacc21, max_v, vl);

        vacc00 = __riscv_vfmax_vf_f32m2(vacc00, min_v, vl);
        __riscv_vse32_v_f32m2(c0, vacc00, vl); 
        vacc01 = __riscv_vfmax_vf_f32m2(vacc01, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c0 + cn_stride), vacc01, vl);
        
        vacc10 = __riscv_vfmax_vf_f32m2(vacc10, min_v, vl);
        __riscv_vse32_v_f32m2(c1, vacc10, vl); 
        vacc11 = __riscv_vfmax_vf_f32m2(vacc11, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c1 + cn_stride), vacc11, vl);
        
        vacc20 = __riscv_vfmax_vf_f32m2(vacc20, min_v, vl);
        __riscv_vse32_v_f32m2(c2, vacc20, vl); 
        vacc21 = __riscv_vfmax_vf_f32m2(vacc21, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c2 + cn_stride), vacc21, vl);

        nc -= 16; w = w1;
        c0 = (float*)((uintptr_t)c0 + 2 * cn_stride);
        c1 = (float*)((uintptr_t)c1 + 2 * cn_stride);
        c2 = (float*)((uintptr_t)c2 + 2 * cn_stride);
      }

      if (__builtin_expect(nc > 0, 0)) {
        do {
          size_t vl = __riscv_vsetvl_e32m4(nc > 8 ? 8 : nc);
          vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(w, vl); w += 8;
          vfloat32m4_t vacc1 = vacc0, vacc2 = vacc0;

          const float *ak0 = a0, *ak1 = a1, *ak2 = a2;
          size_t k = kc;
          while (__builtin_expect(k >= 4 * sizeof(float), 1)) {
            vfloat32m4_t vb0 = __riscv_vle32_v_f32m4(w, vl);
            float av0_0 = ak0[0], av1_0 = ak1[0], av2_0 = ak2[0];
            vfloat32m4_t vb1 = __riscv_vle32_v_f32m4(w + 8, vl);
            float av0_1 = ak0[1], av1_1 = ak1[1], av2_1 = ak2[1];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_0, vb0, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_0, vb0, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, av2_0, vb0, vl);

            vfloat32m4_t vb2 = __riscv_vle32_v_f32m4(w + 16, vl);
            float av0_2 = ak0[2], av1_2 = ak1[2], av2_2 = ak2[2];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_1, vb1, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_1, vb1, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, av2_1, vb1, vl);

            vfloat32m4_t vb3 = __riscv_vle32_v_f32m4(w + 24, vl);
            float av0_3 = ak0[3], av1_3 = ak1[3], av2_3 = ak2[3];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_2, vb2, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_2, vb2, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, av2_2, vb2, vl);

            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_3, vb3, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_3, vb3, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, av2_3, vb3, vl);

            w += 32; ak0 += 4; ak1 += 4; ak2 += 4; k -= 4 * sizeof(float);
          }
          
          while (__builtin_expect(k > 0, 0)) {
            vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl); w += 8;
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, *ak0++, vb, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, *ak1++, vb, vl);
            vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, *ak2++, vb, vl);
            k -= sizeof(float);
          }

          vacc0 = __riscv_vfmin_vf_f32m4(vacc0, max_v, vl);
          vacc1 = __riscv_vfmin_vf_f32m4(vacc1, max_v, vl);
          vacc2 = __riscv_vfmin_vf_f32m4(vacc2, max_v, vl);

          vacc0 = __riscv_vfmax_vf_f32m4(vacc0, min_v, vl);
          __riscv_vse32_v_f32m4(c0, vacc0, vl);
          vacc1 = __riscv_vfmax_vf_f32m4(vacc1, min_v, vl);
          __riscv_vse32_v_f32m4(c1, vacc1, vl);
          vacc2 = __riscv_vfmax_vf_f32m4(vacc2, min_v, vl);
          __riscv_vse32_v_f32m4(c2, vacc2, vl);

          nc -= vl;
          if (__builtin_expect(nc > 0, 0)) {
            c0 = (float*) ((uintptr_t) c0 + cn_stride);
            c1 = (float*) ((uintptr_t) c1 + cn_stride);
            c2 = (float*) ((uintptr_t) c2 + cn_stride);
          }
        } while (__builtin_expect(nc > 0, 0));
      }
      break;
    }

    case 2: {
      const float *a0 = a;
      const float *a1 = (const float*)((uintptr_t)a0 + a_stride);
      float *c0 = c;
      float *c1 = (float*)((uintptr_t)c0 + cm_stride);

      while (__builtin_expect(nc >= 16, 1)) {
        size_t vl = __riscv_vsetvl_e32m2(8);
        const float *w0 = w, *w1 = w + tile_stride;
        vfloat32m2_t vacc00 = __riscv_vle32_v_f32m2(w0, vl); w0 += 8;
        vfloat32m2_t vacc01 = __riscv_vle32_v_f32m2(w1, vl); w1 += 8;
        vfloat32m2_t vacc10 = vacc00, vacc11 = vacc01;

        const float *ak0 = a0, *ak1 = a1;
        size_t k = kc;
        while (__builtin_expect(k >= 4 * sizeof(float), 1)) {
          vfloat32m2_t vb0_0 = __riscv_vle32_v_f32m2(w0, vl);
          vfloat32m2_t vb1_0 = __riscv_vle32_v_f32m2(w1, vl);
          float av0_0 = ak0[0], av1_0 = ak1[0];
          
          vfloat32m2_t vb0_1 = __riscv_vle32_v_f32m2(w0 + 8, vl);
          vfloat32m2_t vb1_1 = __riscv_vle32_v_f32m2(w1 + 8, vl);
          float av0_1 = ak0[1], av1_1 = ak1[1];
          
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_0, vb0_0, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_0, vb1_0, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_0, vb0_0, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_0, vb1_0, vl);

          vfloat32m2_t vb0_2 = __riscv_vle32_v_f32m2(w0 + 16, vl);
          vfloat32m2_t vb1_2 = __riscv_vle32_v_f32m2(w1 + 16, vl);
          float av0_2 = ak0[2], av1_2 = ak1[2];
          
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_1, vb0_1, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_1, vb1_1, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_1, vb0_1, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_1, vb1_1, vl);

          vfloat32m2_t vb0_3 = __riscv_vle32_v_f32m2(w0 + 24, vl);
          vfloat32m2_t vb1_3 = __riscv_vle32_v_f32m2(w1 + 24, vl);
          float av0_3 = ak0[3], av1_3 = ak1[3];

          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_2, vb0_2, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_2, vb1_2, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_2, vb0_2, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_2, vb1_2, vl);

          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_3, vb0_3, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_3, vb1_3, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1_3, vb0_3, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1_3, vb1_3, vl);

          w0 += 32; w1 += 32;
          ak0 += 4; ak1 += 4;
          k -= 4 * sizeof(float);
        }

        while (__builtin_expect(k > 0, 0)) {
          vfloat32m2_t vb0 = __riscv_vle32_v_f32m2(w0, vl); w0 += 8;
          vfloat32m2_t vb1 = __riscv_vle32_v_f32m2(w1, vl); w1 += 8;
          float av0 = *ak0++, av1 = *ak1++;
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0, vb0, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0, vb1, vl);
          vacc10 = __riscv_vfmacc_vf_f32m2(vacc10, av1, vb0, vl);
          vacc11 = __riscv_vfmacc_vf_f32m2(vacc11, av1, vb1, vl);
          k -= sizeof(float);
        }

        vacc00 = __riscv_vfmin_vf_f32m2(vacc00, max_v, vl);
        vacc01 = __riscv_vfmin_vf_f32m2(vacc01, max_v, vl);
        vacc10 = __riscv_vfmin_vf_f32m2(vacc10, max_v, vl);
        vacc11 = __riscv_vfmin_vf_f32m2(vacc11, max_v, vl);

        vacc00 = __riscv_vfmax_vf_f32m2(vacc00, min_v, vl);
        __riscv_vse32_v_f32m2(c0, vacc00, vl); 
        vacc01 = __riscv_vfmax_vf_f32m2(vacc01, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c0 + cn_stride), vacc01, vl);
        
        vacc10 = __riscv_vfmax_vf_f32m2(vacc10, min_v, vl);
        __riscv_vse32_v_f32m2(c1, vacc10, vl); 
        vacc11 = __riscv_vfmax_vf_f32m2(vacc11, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c1 + cn_stride), vacc11, vl);

        nc -= 16; w = w1;
        c0 = (float*)((uintptr_t)c0 + 2 * cn_stride);
        c1 = (float*)((uintptr_t)c1 + 2 * cn_stride);
      }

      if (__builtin_expect(nc > 0, 0)) {
        do {
          size_t vl = __riscv_vsetvl_e32m4(nc > 8 ? 8 : nc);
          vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(w, vl); w += 8;
          vfloat32m4_t vacc1 = vacc0;

          const float *ak0 = a0, *ak1 = a1;
          size_t k = kc;
          while (__builtin_expect(k >= 4 * sizeof(float), 1)) {
            vfloat32m4_t vb0 = __riscv_vle32_v_f32m4(w, vl);
            float av0_0 = ak0[0], av1_0 = ak1[0];
            vfloat32m4_t vb1 = __riscv_vle32_v_f32m4(w + 8, vl);
            float av0_1 = ak0[1], av1_1 = ak1[1];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_0, vb0, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_0, vb0, vl);

            vfloat32m4_t vb2 = __riscv_vle32_v_f32m4(w + 16, vl);
            float av0_2 = ak0[2], av1_2 = ak1[2];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_1, vb1, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_1, vb1, vl);

            vfloat32m4_t vb3 = __riscv_vle32_v_f32m4(w + 24, vl);
            float av0_3 = ak0[3], av1_3 = ak1[3];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_2, vb2, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_2, vb2, vl);

            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_3, vb3, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, av1_3, vb3, vl);

            w += 32; ak0 += 4; ak1 += 4; k -= 4 * sizeof(float);
          }
          
          while (__builtin_expect(k > 0, 0)) {
            vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl); w += 8;
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, *ak0++, vb, vl);
            vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, *ak1++, vb, vl);
            k -= sizeof(float);
          }

          vacc0 = __riscv_vfmin_vf_f32m4(vacc0, max_v, vl);
          vacc1 = __riscv_vfmin_vf_f32m4(vacc1, max_v, vl);

          vacc0 = __riscv_vfmax_vf_f32m4(vacc0, min_v, vl);
          __riscv_vse32_v_f32m4(c0, vacc0, vl);
          vacc1 = __riscv_vfmax_vf_f32m4(vacc1, min_v, vl);
          __riscv_vse32_v_f32m4(c1, vacc1, vl);

          nc -= vl;
          if (__builtin_expect(nc > 0, 0)) {
            c0 = (float*) ((uintptr_t) c0 + cn_stride);
            c1 = (float*) ((uintptr_t) c1 + cn_stride);
          }
        } while (__builtin_expect(nc > 0, 0));
      }
      break;
    }

    case 1: {
      const float *a0 = a;
      float *c0 = c;

      while (__builtin_expect(nc >= 16, 1)) {
        size_t vl = __riscv_vsetvl_e32m2(8);
        const float *w0 = w, *w1 = w + tile_stride;
        vfloat32m2_t vacc00 = __riscv_vle32_v_f32m2(w0, vl); w0 += 8;
        vfloat32m2_t vacc01 = __riscv_vle32_v_f32m2(w1, vl); w1 += 8;

        const float *ak0 = a0;
        size_t k = kc;
        while (__builtin_expect(k >= 4 * sizeof(float), 1)) {
          vfloat32m2_t vb0_0 = __riscv_vle32_v_f32m2(w0, vl);
          vfloat32m2_t vb1_0 = __riscv_vle32_v_f32m2(w1, vl);
          float av0_0 = ak0[0];
          
          vfloat32m2_t vb0_1 = __riscv_vle32_v_f32m2(w0 + 8, vl);
          vfloat32m2_t vb1_1 = __riscv_vle32_v_f32m2(w1 + 8, vl);
          float av0_1 = ak0[1];
          
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_0, vb0_0, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_0, vb1_0, vl);

          vfloat32m2_t vb0_2 = __riscv_vle32_v_f32m2(w0 + 16, vl);
          vfloat32m2_t vb1_2 = __riscv_vle32_v_f32m2(w1 + 16, vl);
          float av0_2 = ak0[2];
          
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_1, vb0_1, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_1, vb1_1, vl);

          vfloat32m2_t vb0_3 = __riscv_vle32_v_f32m2(w0 + 24, vl);
          vfloat32m2_t vb1_3 = __riscv_vle32_v_f32m2(w1 + 24, vl);
          float av0_3 = ak0[3];

          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_2, vb0_2, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_2, vb1_2, vl);

          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0_3, vb0_3, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0_3, vb1_3, vl);

          w0 += 32; w1 += 32;
          ak0 += 4;
          k -= 4 * sizeof(float);
        }

        while (__builtin_expect(k > 0, 0)) {
          vfloat32m2_t vb0 = __riscv_vle32_v_f32m2(w0, vl); w0 += 8;
          vfloat32m2_t vb1 = __riscv_vle32_v_f32m2(w1, vl); w1 += 8;
          float av0 = *ak0++;
          vacc00 = __riscv_vfmacc_vf_f32m2(vacc00, av0, vb0, vl);
          vacc01 = __riscv_vfmacc_vf_f32m2(vacc01, av0, vb1, vl);
          k -= sizeof(float);
        }

        vacc00 = __riscv_vfmin_vf_f32m2(vacc00, max_v, vl);
        vacc01 = __riscv_vfmin_vf_f32m2(vacc01, max_v, vl);

        vacc00 = __riscv_vfmax_vf_f32m2(vacc00, min_v, vl);
        __riscv_vse32_v_f32m2(c0, vacc00, vl); 
        vacc01 = __riscv_vfmax_vf_f32m2(vacc01, min_v, vl);
        __riscv_vse32_v_f32m2((float*)((uintptr_t)c0 + cn_stride), vacc01, vl);

        nc -= 16; w = w1;
        c0 = (float*)((uintptr_t)c0 + 2 * cn_stride);
      }

      if (__builtin_expect(nc > 0, 0)) {
        do {
          size_t vl = __riscv_vsetvl_e32m4(nc > 8 ? 8 : nc);
          vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(w, vl); w += 8;

          const float *ak0 = a0;
          size_t k = kc;
          while (__builtin_expect(k >= 4 * sizeof(float), 1)) {
            vfloat32m4_t vb0 = __riscv_vle32_v_f32m4(w, vl);
            float av0_0 = ak0[0];
            vfloat32m4_t vb1 = __riscv_vle32_v_f32m4(w + 8, vl);
            float av0_1 = ak0[1];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_0, vb0, vl);

            vfloat32m4_t vb2 = __riscv_vle32_v_f32m4(w + 16, vl);
            float av0_2 = ak0[2];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_1, vb1, vl);

            vfloat32m4_t vb3 = __riscv_vle32_v_f32m4(w + 24, vl);
            float av0_3 = ak0[3];
            
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_2, vb2, vl);
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, av0_3, vb3, vl);

            w += 32; ak0 += 4; k -= 4 * sizeof(float);
          }
          
          while (__builtin_expect(k > 0, 0)) {
            vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl); w += 8;
            vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, *ak0++, vb, vl);
            k -= sizeof(float);
          }

          vacc0 = __riscv_vfmin_vf_f32m4(vacc0, max_v, vl);
          vacc0 = __riscv_vfmax_vf_f32m4(vacc0, min_v, vl);
          __riscv_vse32_v_f32m4(c0, vacc0, vl);

          nc -= vl;
          if (__builtin_expect(nc > 0, 0)) {
            c0 = (float*) ((uintptr_t) c0 + cn_stride);
          }
        } while (__builtin_expect(nc > 0, 0));
      }
      break;
    }
  }
}
