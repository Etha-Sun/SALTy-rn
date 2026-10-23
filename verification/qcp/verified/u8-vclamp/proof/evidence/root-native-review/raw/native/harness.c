#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

struct xnn_u8_minmax_params { struct { uint32_t min, max; } scalar; };
extern int equivalent(unsigned long long, const unsigned char *, unsigned char *,
                      unsigned char *, const struct xnn_u8_minmax_params *);
extern void test_original(unsigned long long, const unsigned char *, unsigned char *,
                          const struct xnn_u8_minmax_params *);
extern unsigned long long __riscv_vsetvl_e8m8(unsigned long long);
static unsigned long long vl_calls, max_avl, balanced_differences;

unsigned long long monitored_vsetvl(unsigned long long avl) {
  if (avl == 0 || avl > 128) { fprintf(stderr, "bad repaired AVL: %llu\n", avl); abort(); }
  if (avl > max_avl) max_avl = avl;
  ++vl_calls;
  return __riscv_vsetvl_e8m8(avl);
}

/* Alternate legal policy for the original source; native experiment only. */
unsigned long long balanced_vsetvl(unsigned long long avl) {
  if (avl <= 128) return avl;
  if (avl < 256) { ++balanced_differences; return (avl + 1) / 2; }
  return 128;
}

static uint32_t rng = 0xC61238AB;
static uint32_t next(void) { rng ^= rng << 13; rng ^= rng >> 17; rng ^= rng << 5; return rng; }

int main(void) {
  const uint32_t bounds[] = {0, 1, 127, 128, 254, 255, 256, 257, 0xFFFFFFFF};
  const size_t edges[] = {1, 7, 8, 63, 64, 65, 127, 128, 129, 191, 192, 193,
                         255, 256, 257, 1023, 1024, 4095, 4096, 8193};
  for (unsigned t = 0; t < 65536; ++t) {
    size_t n = t < 1620 ? edges[t % 20] : 1 + next() % 2048;
    unsigned char *in = malloc(n + 8), *before = malloc(n + 8),
                  *left = malloc(n + 2), *right = malloc(n + 2), *original = malloc(n + 2);
    if (!in || !before || !left || !right || !original) return 9;
    for (size_t i = 0; i < n + 8; ++i) in[i] = (unsigned char)next();
    memcpy(before, in, n + 8);
    memset(left, 0xA5, n + 2); memset(right, 0x5A, n + 2); memset(original, 0x36, n + 2);
    struct xnn_u8_minmax_params p = {{t < 1620 ? bounds[(t / 20) % 9] : next(),
                                    t < 1620 ? bounds[t / 180] : next()}}, saved = p;
    if (equivalent(n, in + 1, left + 1, right + 1, &p) != 1) {
      fprintf(stderr, "equivalent rejected t=%u n=%zu lo=%u hi=%u\n", t, n, p.scalar.min, p.scalar.max);
      return 2;
    }
    test_original(n, in + 1, original + 1, &p);
    unsigned lo = (unsigned char)p.scalar.min, hi = (unsigned char)p.scalar.max;
    for (size_t i = 0; i < n; ++i) {
      unsigned e = in[i + 1];
      if (i < n / 64 * 64) { if (e < lo) e = lo; if (e > hi) e = hi; }
      else { if (e > hi) e = hi; if (e < lo) e = lo; }
      if (left[i + 1] != e || right[i + 1] != e || original[i + 1] != e) return 3;
    }
    if (memcmp(in, before, n + 8) || memcmp(&p, &saved, sizeof p) ||
        left[0] != 0xA5 || left[n + 1] != 0xA5 || right[0] != 0x5A || right[n + 1] != 0x5A ||
        original[0] != 0x36 || original[n + 1] != 0x36) return 4;
    free(in); free(before); free(left); free(right); free(original);
  }
#ifdef EXPECT_CAPPED_AVL
  if (max_avl != 128) return 5;
#endif
  if (!balanced_differences) return 5;
  printf("PASS cases=65536 monitored_vl_calls=%llu max_avl=%llu alternate_policy_calls=%llu; "
         "actual public caller, both phase orders, independent scalar oracle, exact n+7 input, "
         "output canaries, preserved input/params; native C only\n", vl_calls, max_avl, balanced_differences);
  return 0;
}
