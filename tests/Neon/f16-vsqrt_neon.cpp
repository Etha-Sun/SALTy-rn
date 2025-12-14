#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>
#define XNN_ARCH_ARM64 1


extern "C" {
    void xnn_f16_vsqrt_ukernel__fp16arith_sqrt_u1(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params) XNN_OOB_READS
{
  const float16_t* i = (const float16_t*) input;
  float16_t* o = (float16_t*) output;
  do {
    float16_t vacc = load_f16(i++);
    vacc = vsqrth_f16(vacc);
    store_f16(o++, vacc);
    batch -= sizeof(xnn_float16);
  } while (batch != 0);
}
}
