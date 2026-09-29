#include <assert.h>
#include <float.h>
#include <fenv.h>
#include <stdio.h>

static float add32(float a, float b) {
  volatile float rounded = a + b;
  return rounded;
}

/* Simulate four accumulator lanes, tail-undisturbed updates, then an
   ordered reduction. This is a host binary32 witness, not RVV execution. */
static float run(const int *chunks, int count) {
  const float x[] = {16777216.0f, 0.0f, -16777216.0f, 1.0f, 0.0f, 0.0f};
  float acc[4] = {0};
  int pos = 0;
  for (int c = 0; c < count; ++c) {
    assert(chunks[c] > 0 && chunks[c] <= 4);
    for (int lane = 0; lane < chunks[c]; ++lane)
      acc[lane] = add32(acc[lane], x[pos + lane]);
    pos += chunks[c];
  }
  assert(pos == 6);
  float sum = 0;
  for (int lane = 0; lane < 4; ++lane) sum = add32(sum, acc[lane]);
  return sum;
}

int main(void) {
  _Static_assert(FLT_RADIX == 2 && FLT_MANT_DIG == 24 && sizeof(float) == 4,
                 "Requires binary32 float");
  assert(fesetround(FE_TONEAREST) == 0);
  const int p42[] = {4, 2}, p33[] = {3, 3}, p1[] = {1, 1, 1, 1, 1, 1};
  float a = run(p42, 2), b = run(p33, 2), c = run(p1, 6);
  printf("[4,2] = %.0f\n[3,3] = %.0f\n[1,1,1,1,1,1] = %.0f\n", a, b, c);
  assert(a == 1 && b == 0 && c == 1);
}
