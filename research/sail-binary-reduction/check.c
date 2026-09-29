/* Shared finite test harness. All input bytes, including padding, are readable.
 * This checks observations, not full ISA-state equivalence or a universal proof.
 */
#include <stddef.h>
#include <stdint.h>
struct xnn_qs8_rsum_params { unsigned char unused; };
#ifdef NEON
#define kernel test_neon
#else
#define kernel test_rvv
#endif
extern void kernel(size_t, const uint8_t *, uint32_t *,
                   const struct xnn_qs8_rsum_params *);
static uint8_t input[8224] __attribute__((aligned(16)));
static const size_t lengths[] = {
  1, 2, 7, 15, 16, 17, 31, 32, 33, 63, 64, 65,
  127, 128, 129, 255, 256, 257, 2047, 2048, 2049,
  4095, 4096, 4097, 8191
};
static const uint32_t initial[] = {0, 0xfffffff0u, 0xffffffffu};
static struct xnn_qs8_rsum_params params;
/* Inspectable by a simulator/debugger after a run. */
volatile uint32_t completed_cases, failure_case;
volatile uint32_t observations[25 * 3 * 3];
int check_kernel(void) {
  unsigned case_id = 0;
  for (unsigned pattern = 0; pattern < 3; ++pattern) {
    for (size_t i = 0; i < sizeof(input); ++i)
      input[i] = pattern == 0 ? 255 : pattern == 1 ? 0 : (uint8_t)(i * 37 + 11);
    for (unsigned ni = 0; ni < sizeof(lengths) / sizeof(lengths[0]); ++ni) {
      size_t n = lengths[ni];
      for (unsigned oi = 0; oi < 3; ++oi) {
        struct { uint32_t before, output, after; } dst = {0x12345678, initial[oi], 0xabcdef01};
        uint32_t expected = initial[oi];
        for (size_t i = 0; i < n; ++i) expected += input[i];
        kernel(n, input, &dst.output, &params);
        observations[case_id] = dst.output;
        ++case_id;
        if (dst.output != expected || dst.before != 0x12345678 || dst.after != 0xabcdef01) {
          failure_case = case_id;
          return 1;
        }
        for (size_t i = 0; i < sizeof(input); ++i) {
          uint8_t original = pattern == 0 ? 255 : pattern == 1 ? 0 : (uint8_t)(i * 37 + 11);
          if (input[i] != original) { failure_case = case_id; return 2; }
        }
        completed_cases = case_id;
      }
    }
  }
  return case_id == 225 ? 0 : 3;
}
