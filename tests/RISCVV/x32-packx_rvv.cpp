#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_x32_packx_ukernel_4x__rvv_x4(
        size_t m,
        size_t k,
        const uint32_t* x,
        size_t x_stride,
        uint32_t* y)
    {
      assert(m != 0);
      assert(m <= 4);
      assert(k != 0);
      assert(x != NULL);
      assert(y != NULL);
    
      const uint32_t* x0 = x;
      const uint32_t* x1 = (const uint32_t*) ((uintptr_t) x0 + x_stride);
      if XNN_UNPREDICTABLE(m < 2) {
        x1 = x0;
      }
      const uint32_t* x2 = (const uint32_t*) ((uintptr_t) x1 + x_stride);
      if XNN_UNPREDICTABLE(m <= 2) {
        x2 = x1;
      }
      const uint32_t* x3 = (const uint32_t*) ((uintptr_t) x2 + x_stride);
      if XNN_UNPREDICTABLE(m != 4) {
        x3 = x2;
      }
    
      // Main loop: process 4 elements from each row at a time
      // Use segment store vsseg4e32 to interleave 4 streams
      for (; k >= 4; k -= 4) {
        size_t vl = __riscv_vsetvl_e32m1(4);
        
        // Load 4 elements from each row
        vuint32m1_t v0 = __riscv_vle32_v_u32m1(x0, vl); x0 += 4;
        vuint32m1_t v1 = __riscv_vle32_v_u32m1(x1, vl); x1 += 4;
        vuint32m1_t v2 = __riscv_vle32_v_u32m1(x2, vl); x2 += 4;
        vuint32m1_t v3 = __riscv_vle32_v_u32m1(x3, vl); x3 += 4;
        
        // Use segment store to interleave: stores v0[i], v1[i], v2[i], v3[i] consecutively
        __riscv_vsseg4e32_v_u32m1x4(y, __riscv_vcreate_v_u32m1x4(v0, v1, v2, v3), vl);
        y += 16;
      }
    
      // Tail loop: process one element from each row at a time
      if XNN_UNLIKELY(k != 0) {
        do {
          // Load one element from each row using vl=1 loads
          size_t vl1 = __riscv_vsetvl_e32m1(1);
          vuint32m1_t v0_scalar = __riscv_vle32_v_u32m1(x0, vl1); x0 += 1;
          vuint32m1_t v1_scalar = __riscv_vle32_v_u32m1(x1, vl1); x1 += 1;
          vuint32m1_t v2_scalar = __riscv_vle32_v_u32m1(x2, vl1); x2 += 1;
          vuint32m1_t v3_scalar = __riscv_vle32_v_u32m1(x3, vl1); x3 += 1;

          // Use segment store with vl=1 to interleave the 4 scalars
          __riscv_vsseg4e32_v_u32m1x4(y, __riscv_vcreate_v_u32m1x4(v0_scalar, v1_scalar, v2_scalar, v3_scalar), vl1);
          y += 4;
        } while (--k != 0);
      }
    }
}
