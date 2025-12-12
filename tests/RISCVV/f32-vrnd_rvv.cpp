#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_vrndd_ukernel__rvv_u8(
        size_t batch,
        const float* input,
        float* output,
        const struct xnn_f32_default_params* params)
    {
        (void)params;
        size_t n = batch / sizeof(float);

        while (n > 0) {
            size_t vl = __riscv_vsetvl_e32m4(n);
            vfloat32m4_t vx = __riscv_vle32_v_f32m4(input, vl);

            vint32m4_t vintx = __riscv_vfcvt_rtz_x_f_v_i32m4(vx, vl);
            vfloat32m4_t vprerndx = __riscv_vfcvt_f_x_v_f32m4(vintx, vl);

            vint32m4_t vx_int = __riscv_vreinterpret_v_f32m4_i32m4(vx);
            vint32m4_t vabs_int = __riscv_vand_vx_i32m4(vx_int, 0x7FFFFFFF, vl);
            vfloat32m4_t vabs_x = __riscv_vreinterpret_v_i32m4_f32m4(vabs_int);

            vbool8_t rndmask = __riscv_vmflt_vf_f32m4_b8(vabs_x, 8388608.0f, vl);
            vfloat32m4_t vrndx = __riscv_vmerge_vvm_f32m4(vx, vprerndx, rndmask, vl);

            vbool8_t adj_mask = __riscv_vmfgt_vv_f32m4_b8(vrndx, vx, vl);

            vfloat32m4_t vone = __riscv_vfmv_v_f_f32m4(1.0f, vl);
            vfloat32m4_t vzero = __riscv_vfmv_v_f_f32m4(0.0f, vl);
            vfloat32m4_t vadj = __riscv_vmerge_vvm_f32m4(vzero, vone, adj_mask, vl);
            vfloat32m4_t vy = __riscv_vfsub_vv_f32m4(vrndx, vadj, vl);

            __riscv_vse32_v_f32m4(output, vy, vl);

            input += vl;
            output += vl;
            n -= vl;
        }
    }
}
