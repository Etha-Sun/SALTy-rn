#include "spec.h"
/* These are the unmodified files at the pinned upstream commit. */
#include "../../../../kernels/source/f32-vadd.c"
#include "../../../../kernels/target/f32-vadd.c"

int equivalent(size_t n, const float *input_a, const float *input_b,
               float *left, float *right) {
  struct xnn_f32_default_params params = {0};
  test_neon(n * sizeof(float), input_a, input_b, left, &params);
  test_rvv(n * sizeof(float), input_a, input_b, right, &params);
  for (size_t i = 0; i < n; ++i) {
    if (!(left[i] == right[i] || (left[i] != left[i] && right[i] != right[i]))) return 0;
  }
  return 1;
}
