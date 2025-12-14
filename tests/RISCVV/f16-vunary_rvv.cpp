#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vabs_ukernel__rvv_u16(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(uint16_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const uint16_t* i = (const uint16_t*) input;
  uint16_t* o = (uint16_t*) output;
  
  size_t n = batch / sizeof(uint16_t);
  
  while (n > 0) {
    size_t vl = __riscv_vsetvl_e16m8(n);
    vuint16m8_t v = __riscv_vle16_v_u16m8(i, vl);
    v = __riscv_vand_vx_u16m8(v, 0x7FFF, vl);
    __riscv_vse16_v_u16m8(o, v, vl);
    i += vl;
    o += vl;
    n -= vl;
  }
} 
}
