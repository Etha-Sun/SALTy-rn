/* Execute the two existing .s files on QEMU user mode, without a C runtime.
 * These finite checks supplement the reasoning in SEMANTICS.md.
 */
#include <stddef.h>
#include <stdint.h>

struct salt_s8_vmax_params { struct { int8_t threshold; } scalar; };
extern void test_neon(size_t, const int8_t*, int8_t*,
                      const struct salt_s8_vmax_params*);
extern void test_rvv(size_t, const int8_t*, int8_t*,
                     const struct salt_s8_vmax_params*);

static int8_t input[1040], fixed[1040], dynamic[1040];

extern void write_message(const char*, size_t);

static void message(const char* text) {
  size_t length = 0;
  while (text[length]) ++length;
  write_message(text, length);
}

int check_assembly(void) {
  const size_t lengths[] = {16, 32, 48, 64, 112, 128, 144, 240,
                            256, 272, 512, 1024, 1040};
  struct salt_s8_vmax_params p;
  for (int threshold = -128; threshold <= 127; ++threshold) {
    p.scalar.threshold = (int8_t)threshold;
    for (size_t k = 0; k < sizeof(lengths) / sizeof(lengths[0]); ++k) {
      size_t n = lengths[k];
      for (size_t i = 0; i < n; ++i) {
        input[i] = (int8_t)((int)(i % 256) - 128);
        fixed[i] = dynamic[i] = 0;
      }
      test_neon(n, input, fixed, &p);
      test_rvv(n, input, dynamic, &p);
      for (size_t i = 0; i < n; ++i) {
        int8_t expected = input[i] > threshold ? input[i] : (int8_t)threshold;
        if (fixed[i] != expected || dynamic[i] != expected) {
          message("FAIL: disjoint output\n");
          return 1;
        }
        fixed[i] = dynamic[i] = input[i];
      }
      test_neon(n, fixed, fixed, &p);
      test_rvv(n, dynamic, dynamic, &p);
      for (size_t i = 0; i < n; ++i) {
        int8_t expected = input[i] > threshold ? input[i] : (int8_t)threshold;
        if (fixed[i] != expected || dynamic[i] != expected) {
          message("FAIL: in-place output\n");
          return 2;
        }
      }
    }
  }
  message("PASS: 3328 disjoint + 3328 in-place cases (all 256 thresholds)\n");

  /* Legal ordinary memory overlap: both functions see independent copies. */
  p.scalar.threshold = -128;
  for (size_t i = 0; i < 33; ++i) fixed[i] = dynamic[i] = (int8_t)i;
  test_neon(32, fixed, fixed + 1, &p);
  test_rvv(32, dynamic, dynamic + 1, &p);
  if (fixed[17] != 15 || dynamic[17] != 16) {
    message("FAIL: overlap witness did not reproduce\n");
    return 3;
  }
  message("CONFIRMED: output=input+1, batch=32, threshold=-128: output[16] is 15 vs 16\n");
  return 0;
}
