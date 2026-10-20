#include <fenv.h>
#include <stdio.h>
#include <stdlib.h>
#include "inputs/unit.c"

static uint32_t random_state = UINT32_C(0x5a17f16);
static uint32_t next_word(void) {
  random_state ^= random_state << 13;
  random_state ^= random_state >> 17;
  random_state ^= random_state << 5;
  return random_state;
}

int main(void) {
  const uint32_t edges[] = {
    0, UINT32_C(0x80000000), 1, UINT32_C(0x80000001),
    UINT32_C(0x007fffff), UINT32_C(0x00800000),
    UINT32_C(0x33000000), UINT32_C(0x33800000), UINT32_C(0x387fc000),
    UINT32_C(0x38800000), UINT32_C(0x3f800000), UINT32_C(0xbf800000),
    UINT32_C(0x477fe000), UINT32_C(0x477ff000),
    UINT32_C(0x7f7fffff), UINT32_C(0xff7fffff),
    UINT32_C(0x7f800000), UINT32_C(0xff800000),
    UINT32_C(0x7f800001), UINT32_C(0xff800001),
    UINT32_C(0x7fc00000), UINT32_C(0xffc00000), UINT32_C(0x7fffffff)
  };
  size_t cases = 0;
  if (fesetround(FE_TONEAREST) != 0) return 3;
  for (size_t n = 1; n <= 97; ++n) {
    float *input = malloc((n + 3) * sizeof *input);
    uint16_t *left = malloc(n * sizeof *left);
    uint16_t *right = malloc(n * sizeof *right);
    if (!input || !left || !right) return 4;
    for (size_t round = 0; round < 64; ++round) {
      for (size_t j = 0; j < n + 3; ++j) {
        uint32_t word = round < 23 ? edges[(round + j) % 23] : next_word();
        memcpy(input + j, &word, sizeof word);
      }
      ++cases;
      if (!equivalent(n, input, left, right, NULL)) {
        for (size_t j = 0; j < n; ++j) if (left[j] != right[j]) {
          uint32_t word;
          memcpy(&word, input + j, sizeof word);
          printf("mismatch n=%zu round=%zu lane=%zu input=%08x neon=%04x rvv=%04x\n",
                 n, round, j, word, left[j], right[j]);
          break;
        }
        free(right); free(left); free(input);
        return 1;
      }
    }
    free(right); free(left); free(input);
  }
  printf("passed %zu finite differential cases, FE_TONEAREST\n", cases);
  return 0;
}
