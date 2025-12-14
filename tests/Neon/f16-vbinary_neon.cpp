#include "../../src/neon_symbolic/neon_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>
#define XNN_ARCH_ARM64 1


extern "C" {
    void xnn_f16_vadd_ukernel__fp16arith_u4(
    size_t batch,
    const xnn_float16*  input_a,
    const xnn_float16*  input_b,
    xnn_float16*  output,
    const struct xnn_f16_default_params*  params)
{
  assert(batch != 0);
  assert(batch % sizeof(uint16_t) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  // Use byte-based addressing for symbolic execution
  // float16_t is 2 bytes in real hardware
  const char* a_bytes = (const char*) input_a;
  const char* b_bytes = (const char*) input_b;
  char* o_bytes = (char*) output;

  for (; batch >= 4 * sizeof(uint16_t); batch -= 4 * sizeof(uint16_t)) {
    const float16_t va0 = load_f16((const float16_t*)(a_bytes + 0 * sizeof(uint16_t)));
    const float16_t va1 = load_f16((const float16_t*)(a_bytes + 1 * sizeof(uint16_t)));
    const float16_t va2 = load_f16((const float16_t*)(a_bytes + 2 * sizeof(uint16_t)));
    const float16_t va3 = load_f16((const float16_t*)(a_bytes + 3 * sizeof(uint16_t)));

    const float16_t vb0 = load_f16((const float16_t*)(b_bytes + 0 * sizeof(uint16_t)));
    const float16_t vb1 = load_f16((const float16_t*)(b_bytes + 1 * sizeof(uint16_t)));
    const float16_t vb2 = load_f16((const float16_t*)(b_bytes + 2 * sizeof(uint16_t)));
    const float16_t vb3 = load_f16((const float16_t*)(b_bytes + 3 * sizeof(uint16_t)));

    float16_t vacc0 = vaddh_f16(va0, vb0);
    float16_t vacc1 = vaddh_f16(va1, vb1);
    float16_t vacc2 = vaddh_f16(va2, vb2);
    float16_t vacc3 = vaddh_f16(va3, vb3);

    store_f16((float16_t*)(o_bytes + 0 * sizeof(uint16_t)), vacc0);
    store_f16((float16_t*)(o_bytes + 1 * sizeof(uint16_t)), vacc1);
    store_f16((float16_t*)(o_bytes + 2 * sizeof(uint16_t)), vacc2);
    store_f16((float16_t*)(o_bytes + 3 * sizeof(uint16_t)), vacc3);

    a_bytes += 4 * sizeof(uint16_t);
    b_bytes += 4 * sizeof(uint16_t);
    o_bytes += 4 * sizeof(uint16_t);
  }
  if XNN_UNLIKELY(batch != 0) {
    do {
      const float16_t va = load_f16((const float16_t*)a_bytes);
      const float16_t vb = load_f16((const float16_t*)b_bytes);
      float16_t vacc = vaddh_f16(va, vb);
      store_f16((float16_t*)o_bytes, vacc);
      a_bytes += sizeof(uint16_t);
      b_bytes += sizeof(uint16_t);
      o_bytes += sizeof(uint16_t);
      batch -= sizeof(uint16_t);
    } while (batch != 0);
  }
}
}
