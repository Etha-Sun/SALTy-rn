#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_vsqrt_ukernel__rvv_sqrt_u1v(
        size_t batch,
        const float* input,
        float* output,
        const struct xnn_f32_default_params*  params)
    {
      assert(batch != 0);
      assert(batch % sizeof(float) == 0);
      assert(input != NULL);
      assert(output != NULL);
    
      batch >>= XNN_LOG2_SIZEOF_FLOAT;
      do {
        const size_t n = __riscv_vsetvl_e32m1(batch);
        vfloat32m1_t vx = __riscv_vle32_v_f32m1(input, n);
        input += n;
        vfloat32m1_t vacc = __riscv_vfsqrt_v_f32m1(vx, n);
        __riscv_vse32_v_f32m1(output, vacc, n);
        output += n;
    
        batch -= n;
      } while (batch != 0);
}
}