/* Host semantic facade around UNCHANGED corpus C; not an ISA execution test. */
#include <assert.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define XNN_OOB_READS
#define XNN_ALIGN(n) __attribute__((aligned(n)))
#define XNN_UNLIKELY(x) (x)
#define XNN_ARCH_ARM64 1
struct xnn_qs8_rsum_params { char dummy; };
typedef struct { uint8_t lane[16]; } uint8x16_t;
typedef struct { uint16_t lane[8]; } uint16x8_t;
typedef struct { uint32_t lane[4]; } uint32x4_t;

static uint32x4_t vmovq_n_u32(uint32_t x) {
  uint32x4_t r; for (int i = 0; i < 4; ++i) r.lane[i] = x; return r;
}
static uint16x8_t vmovq_n_u16(uint16_t x) {
  uint16x8_t r; for (int i = 0; i < 8; ++i) r.lane[i] = x; return r;
}
static uint8x16_t vld1q_u8(const uint8_t *p) {
  uint8x16_t r; for (int i = 0; i < 16; ++i) r.lane[i] = p[i]; return r;
}
static uint8x16_t vmulq_u8(uint8x16_t a, uint8x16_t b) {
  for (int i = 0; i < 16; ++i) a.lane[i] = (uint8_t)(a.lane[i] * b.lane[i]);
  return a;
}
static uint16x8_t vpadalq_u8(uint16x8_t a, uint8x16_t b) {
  for (int i = 0; i < 8; ++i)
    a.lane[i] = (uint16_t)(a.lane[i] + (uint16_t)b.lane[2*i] + b.lane[2*i+1]);
  return a;
}
static uint32x4_t vpadalq_u16(uint32x4_t a, uint16x8_t b) {
  for (int i = 0; i < 4; ++i)
    a.lane[i] += (uint32_t)b.lane[2*i] + b.lane[2*i+1];
  return a;
}
static uint32_t vaddvq_u32(uint32x4_t a) {
  return a.lane[0] + a.lane[1] + a.lane[2] + a.lane[3];
}

enum { MAX_LANES = 128 };
typedef struct { uint8_t lane[MAX_LANES]; } vuint8m2_t;
typedef struct { uint32_t lane[MAX_LANES]; } vuint32m8_t;
typedef struct { uint32_t lane[MAX_LANES]; } vuint32m1_t;
static size_t test_m;
static int test_mode, destroy_tail;
static size_t __riscv_vsetvlmax_e32m8(void) { return test_m; }
static size_t __riscv_vsetvlmax_e32m1(void) { return test_m / 8 ? test_m / 8 : 1; }
static size_t __riscv_vsetvl_e8m2(size_t avl) {
  if (test_mode == 2) return 1; /* altered software request, NOT hardware AVL rule */
  if (test_mode == 1 && test_m < avl && avl < 2 * test_m) return (avl + 1) / 2;
  return avl < test_m ? avl : test_m;
}
static vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x, size_t vl) {
  vuint32m8_t r = {{0}};
  for (size_t i = 0; i < vl; ++i) r.lane[i] = x;
  return r;
}
static vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x, size_t vl) {
  vuint32m1_t r = {{0}};
  for (size_t i = 0; i < vl; ++i) r.lane[i] = x;
  return r;
}
static vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p, size_t vl) {
  vuint8m2_t r = {{0}};
  for (size_t i = 0; i < vl; ++i) r.lane[i] = p[i];
  return r;
}
static vuint32m8_t __riscv_vzext_vf4_u32m8(vuint8m2_t a, size_t vl) {
  vuint32m8_t r = {{0}};
  for (size_t i = 0; i < vl; ++i) r.lane[i] = a.lane[i];
  return r;
}
static vuint32m8_t __riscv_vadd_vv_u32m8_tu(
    vuint32m8_t old, vuint32m8_t a, vuint32m8_t b, size_t vl) {
  for (size_t i = 0; i < vl; ++i) old.lane[i] = a.lane[i] + b.lane[i];
  if (destroy_tail)
    for (size_t i = vl; i < test_m; ++i) old.lane[i] = 0;
  return old;
}
static vuint32m1_t __riscv_vredsum_vs_u32m8_u32m1(
    vuint32m8_t a, vuint32m1_t seed, size_t vl) {
  for (size_t i = 0; i < vl; ++i) seed.lane[0] += a.lane[i];
  return seed;
}
static uint32_t __riscv_vmv_x_s_u32m1_u32(vuint32m1_t a) { return a.lane[0]; }

#include "../../kernels/source/qu8-rsum.c"
#include "../../kernels/target/qu8-rsum.c"

int main(void) {
  const size_t lengths[] = {1, 2, 15, 16, 17, 31, 32, 33, 63, 64, 65,
    127, 128, 129, 2047, 2048, 2049, 2063, 2064, 4095, 4096, 4097, 8193};
  const size_t widths[] = {1, 3, 4, 7, 16, 64};
  const struct xnn_qs8_rsum_params params = {0};
  size_t count = 0;
  for (size_t ni = 0; ni < sizeof(lengths)/sizeof(*lengths); ++ni)
    for (size_t wi = 0; wi < sizeof(widths)/sizeof(*widths); ++wi)
      for (int mode = 0; mode < 3; ++mode)
        for (unsigned pattern = 0; pattern < 3; ++pattern) {
          size_t n = lengths[ni]; test_m = widths[wi]; test_mode = mode;
          uint8_t *input = malloc(n + 15); assert(input);
          uint32_t expected = UINT32_MAX - 17;
          for (size_t i = 0; i < n; ++i) {
            input[i] = pattern == 0 ? 0 : pattern == 1 ? 255 : (uint8_t)(i*73+19);
            expected += input[i];
          }
          for (size_t i = n; i < n+15; ++i) input[i] = (uint8_t)(i*29+137);
          uint32_t neon = UINT32_MAX - 17, rvv = neon;
          test_neon(n, input, &neon, &params);
          test_rvv(n, input, &rvv, &params);
          if (neon != expected || rvv != expected) {
            fprintf(stderr, "FAIL n=%zu M=%zu mode=%d pattern=%u\n", n, test_m, mode, pattern);
            free(input); return 1;
          }
          printf("case %zu %zu %d %u %" PRIu32 " %" PRIu32 "\n",
            n, test_m, mode, pattern, neon, rvv);
          free(input); ++count;
        }
  /* Negative control: resetting the tail destroys previously accumulated lanes. */
  uint8_t small[21] = {1,2,3,4,5,6};
  uint32_t bad = 0; test_m = 4; test_mode = 0; destroy_tail = 1;
  test_rvv(6, small, &bad, &params);
  assert(bad == 14 && bad != 21);
  fprintf(stderr, "PASS %zu original-C cases; negative control tail-reset: 14 != 21\n", count);
  return 0;
}
