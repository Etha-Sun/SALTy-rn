#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_raddstoreexpminusmax_ukernel__rvv_rr2_p2(
        size_t batch,
        const xnn_float16* input,
        const xnn_float16* max,
        xnn_float16* output,
        xnn_float16* sum,
        const void* params)
    {
      assert(batch != 0);
      assert(batch % sizeof(uint16_t) == 0);
      assert(input != NULL);
      assert(max != NULL);
      assert(output != NULL);
      assert(sum != NULL);
    
      const _Float16 log2e = 0x1.714p+0f16;
      const _Float16 magic_bias = 0x1.83Cp+10f16;
      const _Float16 minus_ln2_hi = -0x1.630p-1f16;
      const _Float16 minus_ln2_lo = 0x1.BD0p-13f16;
      const _Float16 c2 = 0x1.FE4p-2f16;
      const _Float16 c1 = 0x1.038p+0f16;
      const _Float16 denorm_cutoff = -0x1.368p+3f16;
    
      // Load max value using vector load (to be intercepted by symbolic framework)
      // Load with VL=16 to have enough elements for any VL used in the loop
      vfloat16m1_t vmax_vec = vle16_v_f16m1((const _Float16*)max, 16);

      size_t n = batch / sizeof(uint16_t);
      const uint16_t* i = (const uint16_t*)input;
      uint16_t* o = (uint16_t*)output;

      vfloat16m1_t vacc_sum = vfmv_v_f_f16m1(0.0f16, 16);

      while (n > 0) {
        size_t vl = vsetvl_e16m1(n);

        vfloat16m1_t vi = vle16_v_f16m1((const _Float16*)i, vl);
        i += vl;

        // Subtract max from each element using vector-vector subtraction
        vfloat16m1_t vx = vfsub_vv_f16m1(vi, vmax_vec, vl);

        vfloat16m1_t vn = vfmacc_vf_f16m1(vfmv_v_f_f16m1(magic_bias, vl), log2e, vx, vl);

        vint16m1_t vn_int = vreinterpret_v_f16m1_i16m1(vn);
        vint16m1_t vs_int = vsll_vx_i16m1(vn_int, 10, vl);
        vfloat16m1_t vs = vreinterpret_v_i16m1_f16m1(vs_int);

        vn = vfsub_vf_f16m1(vn, magic_bias, vl);

        vfloat16m1_t vt = vfmacc_vf_f16m1(vx, minus_ln2_hi, vn, vl);
        vt = vfmacc_vf_f16m1(vt, minus_ln2_lo, vn, vl);

        vfloat16m1_t vp = vfmacc_vf_f16m1(vfmv_v_f_f16m1(c1, vl), c2, vt, vl);

        vt = vfmul_vv_f16m1(vt, vs, vl);

        vfloat16m1_t vf = vfmacc_vv_f16m1(vs, vp, vt, vl);

        vbool16_t vm = vmflt_vf_f16m1_b16(vx, denorm_cutoff, vl);
        vf = vmerge_vvm_f16m1(vf, vfmv_v_f_f16m1(0.0f16, vl), vm, vl);

        vse16_v_f16m1((_Float16*)o, vf, vl);
        o += vl;

        vacc_sum = vfadd_vv_f16m1(vacc_sum, vf, vl);

        n -= vl;
      }

      vfloat16m1_t vzero = vfmv_v_f_f16m1(0.0f16, 1);
      vfloat16m1_t vsum_red = vfredosum_vs_f16m1_f16m1(vacc_sum, vzero, 16);
      _Float16 final_sum = vfmv_f_s_f16m1_f16(vsum_red);

      *((_Float16*)sum) = final_sum;
    }
}
