/* Host binary32 arithmetic witness for the two formulas, not an ISA execution test. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
static uint32_t bits(float x) { uint32_t u; memcpy(&u, &x, sizeof u); return u; }
int main(void) {
  volatile float a = -1.0f, b = 0x1.000002p0f, c = 0x1.fffffcp-1f;
  volatile float product = b * c;
  float separate = a + product;
  float fused = fmaf(b, c, a);
  printf("separate=0x%08x fused=0x%08x\n", bits(separate), bits(fused));
  return !(bits(separate) == 0 && bits(fused) == 0xa8800000u);
}
