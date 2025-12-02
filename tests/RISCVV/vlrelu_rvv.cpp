#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <algorithm>

extern "C" {
    void xnn_qs8_vlrelu_ukernel__rvv_u16(
        size_t batch,
        const int8_t* input,
        int8_t* output,
        const struct xnn_qs8_lrelu_params* params)
    {
        const int16_t input_zero_point = (int16_t)params->scalar.input_zero_point;
        const int16_t positive_multiplier = (int16_t)(-params->scalar.positive_multiplier);
        const int16_t negative_multiplier = (int16_t)(-params->scalar.negative_multiplier);
        const int16_t output_zero_point = (int16_t)params->scalar.output_zero_point;

        while (batch > 0) {
            size_t vl = __riscv_vsetvl_e8m1(batch);

            vint8m1_t vx = __riscv_vle8_v_i8m1(input, vl);
            input += vl;

            // Widen to 16-bit: vacc = input_zero_point - vx
            vint16m2_t vacc = __riscv_vwsub_vx_i16m2(
                __riscv_vmv_v_x_i8m1(0, vl),
                0,
                vl);
            vacc = __riscv_vsub_vv_i16m2(
                __riscv_vmv_v_x_i16m2(input_zero_point, vl),
                __riscv_vsext_vf2_i16m2(vx, vl),
                vl);

            // Create mask for negative values (vacc < 0)
            vbool8_t vmask = __riscv_vmslt_vx_i16m2_b8(vacc, 0, vl);

            // Shift left by 7
            vacc = __riscv_vsll_vx_i16m2(vacc, 7, vl);

            // Select multiplier based on mask
            vint16m2_t vmultiplier = __riscv_vmerge_vxm_i16m2(
                __riscv_vmv_v_x_i16m2(negative_multiplier, vl),
                positive_multiplier,
                vmask,
                vl);

            // Saturating rounding doubling multiply high: vqrdmulhq_s16
            // result = (a * b + (1 << 14)) >> 15, saturated
            vint32m4_t vprod = __riscv_vwmul_vv_i32m4(vacc, vmultiplier, vl);
            vprod = __riscv_vadd_vx_i32m4(vprod, 1 << 14, vl);
            vint32m4_t vshifted = __riscv_vsra_vx_i32m4(vprod, 15, vl);
            vint16m2_t vresult = __riscv_vnclip_wx_i16m2(vshifted, 0, __RISCV_VXRM_RDN, vl);

            // Saturating add output zero point
            vacc = __riscv_vsadd_vx_i16m2(vresult, output_zero_point, vl);

            // Narrow to 8-bit with saturation
            vint8m1_t vy = __riscv_vnclip_wx_i8m1(vacc, 0, __RISCV_VXRM_RDN, vl);

            __riscv_vse8_v_i8m1(output, vy, vl);
            output += vl;
            batch -= vl;
        }
    }
}