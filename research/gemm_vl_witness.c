/* Host witness for GEMM packed-layout behavior. Not an RVV emulator/proof.
 * Includes the original kernel unchanged. Only the vsetvl wrapper switches
 * between its normal request and a request capped to one element.
 * Active-lane arithmetic is sufficient for these finite, exact test values;
 * architectural tail state, FP flags and all exceptional values are not modeled.
 */
#include <assert.h>
#include <fenv.h>
#include <float.h>
#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

enum { NR = 8, VLMAX = 32, STORAGE = 32 };
static int cap_request_to_one;
struct xnn_f32_minmax_params { struct { float min, max; } scalar; };
typedef struct { float lane[VLMAX]; } vfloat32m4_t;

static size_t __riscv_vsetvl_e32m4(size_t avl) {
  /* The capped mode represents a software modification, NOT another legal
   * hardware answer to the original AVL=2 request when VLMAX=32. */
  size_t requested = cap_request_to_one && avl > 1 ? 1 : avl;
  return requested < VLMAX ? requested : VLMAX;
}
static vfloat32m4_t __riscv_vle32_v_f32m4(const float *p, size_t vl) {
  assert(vl <= VLMAX);
  vfloat32m4_t v = {0};
  for (size_t j = 0; j < vl; ++j) v.lane[j] = p[j];
  return v;
}
static vfloat32m4_t __riscv_vfmacc_vf_f32m4(vfloat32m4_t acc, float a,
                                         vfloat32m4_t b, size_t vl) {
  for (size_t j = 0; j < vl; ++j)
    acc.lane[j] = fmaf(a, b.lane[j], acc.lane[j]);
  return acc;
}
static vfloat32m4_t __riscv_vfmin_vf_f32m4(vfloat32m4_t v, float a, size_t vl) {
  for (size_t j = 0; j < vl; ++j) v.lane[j] = fminf(v.lane[j], a);
  return v;
}
static vfloat32m4_t __riscv_vfmax_vf_f32m4(vfloat32m4_t v, float a, size_t vl) {
  for (size_t j = 0; j < vl; ++j) v.lane[j] = fmaxf(v.lane[j], a);
  return v;
}
static void __riscv_vse32_v_f32m4(float *p, vfloat32m4_t v, size_t vl) {
  for (size_t j = 0; j < vl; ++j) p[j] = v.lane[j];
}

#define test_rvv gemm_kernel
#include "../kernels/target/f32-gemm-minmax.c"
#undef test_rvv

/* One-row scalar reference retaining the NR=8 packing and K-order FMA chain.
 * This reference is tested for the fixture below, not formally verified. */
static void scalar_packed_row(size_t nc, size_t K, const float *a,
                              const float *w, float *c, size_t cn_stride,
                              const struct xnn_f32_minmax_params *p) {
  while (nc > 0) {
    size_t live = nc < NR ? nc : NR;
    for (size_t j = 0; j < live; ++j) {
      float acc = w[j];
      for (size_t k = 0; k < K; ++k)
        acc = fmaf(a[k], w[NR + k * NR + j], acc);
      c[j] = fmaxf(fminf(acc, p->scalar.max), p->scalar.min);
    }
    w += NR * (K + 1);
    nc -= live;
    if (nc > 0) c = (float *)((unsigned char *)c + cn_stride);
  }
}

int main(void) {
  _Static_assert(FLT_RADIX == 2 && FLT_MANT_DIG == 24 && sizeof(float) == 4,
                 "Requires binary32 float");
  assert(fesetround(FE_TONEAREST) == 0);
  const float a[4] = {2, 2, 2, 2};
  float w[STORAGE] = {0};
  for (int j = 0; j < NR; ++j) {
    w[NR + j] = (float)(j + 1);
    w[2 * NR + j] = 100;
    w[3 * NR + j] = 10;
  }
  const struct xnn_f32_minmax_params p = {{-1000, 1000}};
  float results[3][STORAGE];
  for (int mode = 0; mode < 3; ++mode) {
    float *c = results[mode];
    for (int j = 0; j < STORAGE; ++j) c[j] = -999;
    if (mode < 2) {
      cap_request_to_one = mode;
      gemm_kernel(1, 2, sizeof(float), a, sizeof(float), w, c,
                  2 * sizeof(float), NR * sizeof(float), &p);
    } else {
      scalar_packed_row(2, 1, a, w, c, NR * sizeof(float), &p);
    }
    const char *label = mode == 0 ? "normal vl=2" :
                        mode == 1 ? "capped vl=1" : "scalar layout-aware";
    printf("%s: c[0]=%.0f c[1]=%.0f c[8]=%.0f\n",label,c[0],c[1],c[8]);
    for (int j = 0; j < STORAGE; ++j) {
      float expected = j == 0 ? 2 : -999;
      if (mode == 1 && j == 8) expected = 120;
      if (mode != 1 && j == 1) expected = 4;
      assert(c[j] == expected);
    }
  }
  for (int j = 0; j < STORAGE; ++j) assert(results[0][j] == results[2][j]);
  puts("PASS: all output slots checked; normal agrees with scalar reference.");
}
