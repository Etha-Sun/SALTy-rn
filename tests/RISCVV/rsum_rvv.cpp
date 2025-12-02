#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {

    void xnn_qs8_rsum_ukernel__rvv_u1v(
        size_t batch,
        const int8_t*  input,
        int32_t*  output,
        const struct xnn_qs8_rsum_params*  params)
    {
      assert(batch != 0);
      assert(input != NULL);
      assert(output != NULL);
      assert(params != NULL);
    
      size_t vlmax = __riscv_vsetvl_e32m4(batch);
      vint32m4_t vsum = __riscv_vmv_v_x_i32m4(0, vlmax);
      vint32m1_t vzero = __riscv_vmv_v_x_i32m1(0, __riscv_vsetvlmax_e32m1());
    
      do {
        size_t vl = __riscv_vsetvl_e8m1(batch); batch -= vl;
    
        vint8m1_t vinput = __riscv_vle8_v_i8m1(input, vl); input += vl;
        vint16m2_t vinput16 = __riscv_vsext_vf2_i16m2(vinput, vl);
    
        vsum = __riscv_vwadd_wv_i32m4(vsum, vinput16, vl);
    
      } while (batch != 0);
    
      vint32m1_t vred = __riscv_vredsum(vsum, vzero, vlmax);
      const auto result = __riscv_vmv_x_s_i32m1_i32(vred);
      *output += result;
    }
    
    } // extern "C"