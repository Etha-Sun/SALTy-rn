/* A concrete execution check. This is not an all-input correctness proof.
 * Compile this harness with auto-vectorization disabled, and link rvv-output.s
 * directly: the function under test must not be recompiled from rvv.c.
 */
typedef unsigned long size_t;
typedef signed char int8_t;
struct params { int8_t threshold; };
extern void test_rvv(size_t, const int8_t *, int8_t *, const struct params *);

/* Initialized data avoids relying on a platform's BSS initialization. */
static int8_t input[272] = { 1 };
static int8_t output[272] = { 1 };
static struct params p = { -5 };

int check_rvv(void) {
  for (size_t i = 0; i < 272; ++i) {
    input[i] = (int8_t)((int)(i % 256) - 128);
    output[i] = 99;
  }
  test_rvv(272, input, output, &p);
  for (size_t i = 0; i < 272; ++i) {
    int8_t expected = input[i] < p.threshold ? p.threshold : input[i];
    if (output[i] != expected) return 1;
  }
  return 0;
}
