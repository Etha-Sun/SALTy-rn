#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_x32_unpool_ukernel__rvv(
        size_t kernel_elements,
        size_t channels,
        uint32_t fill,
        const uint32_t* input,
        const uint32_t* index,
        uint32_t** output)
    {
      // Pre-initialize outputs with fill constant using RVV.
      // RVV can handle arbitrary vector lengths, simplifying tail handling.
      uint32_t** os = output;
      do {
        uint32_t* o = *os++;
        size_t c = channels;
        
        // Process as many elements as possible per iteration
        while (c > 0) {
          size_t vl = __riscv_vsetvl_e32m4(c);
          vuint32m4_t vfill = __riscv_vmv_v_x_u32m4(fill, vl);
          __riscv_vse32_v_u32m4(o, vfill, vl);
          o += vl;
          c -= vl;
        }
      } while (--kernel_elements != 0);
    
      // Copy indexed elements to output.
      // This is an indexed scatter operation - indices can be arbitrary,
      // so we use scalar operations for correctness.
      size_t offset = 0;
      do {
        const uint32_t i = *index++;
        *((uint32_t*) ((uintptr_t) output[i] + offset)) = *input++;
        offset += sizeof(uint32_t);
      } while (--channels != 0);
    }
}
