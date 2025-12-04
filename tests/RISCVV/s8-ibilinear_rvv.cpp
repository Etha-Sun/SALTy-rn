#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {

void xnn_s8_ibilinear_ukernel__rvv(
    size_t output_pixels,
    size_t channels,
    const int8_t** input,
    size_t input_offset,
    const int16_t* weights,
    int8_t* output,
    size_t output_increment)
{
    assert(output_pixels != 0);
    assert(channels != 0);

    do {
        const int8_t* i0 = (const int8_t*) ((uintptr_t) input[0] + input_offset);
        const int8_t* i1 = (const int8_t*) ((uintptr_t) input[1] + input_offset);
        const int8_t* i2 = (const int8_t*) ((uintptr_t) input[2] + input_offset);
        const int8_t* i3 = (const int8_t*) ((uintptr_t) input[3] + input_offset);
        input += 4;

        const int16_t alphah = weights[0];
        const int32_t alphav = (int32_t) weights[1];
        weights += 2;

        size_t c = channels;

        while (c > 0) {
            size_t vl = __riscv_vsetvl_e8m1(c);

            vint8m1_t vtl = __riscv_vle8_v_i8m1(i0, vl); i0 += vl;
            vint8m1_t vtr = __riscv_vle8_v_i8m1(i1, vl); i1 += vl;
            vint8m1_t vbl = __riscv_vle8_v_i8m1(i2, vl); i2 += vl;
            vint8m1_t vbr = __riscv_vle8_v_i8m1(i3, vl); i3 += vl;

            vint16m2_t vtd = __riscv_vwsub_vv_i16m2(vtr, vtl, vl);
            vint16m2_t vbd = __riscv_vwsub_vv_i16m2(vbr, vbl, vl);
            vint16m2_t vdl = __riscv_vwsub_vv_i16m2(vbl, vtl, vl);
            vint16m2_t vxtl = __riscv_vsext_vf2_i16m2(vtl, vl);

            vint16m2_t vdd = __riscv_vsub_vv_i16m2(vbd, vtd, vl);

            vint32m4_t vxtl32 = __riscv_vsext_vf2_i32m4(vxtl, vl);
            vint32m4_t vt = __riscv_vsll_vx_i32m4(vxtl32, 11, vl);
            vt = __riscv_vwmacc_vx_i32m4(vt, alphah, vtd, vl);

            vint32m4_t vdl32 = __riscv_vsext_vf2_i32m4(vdl, vl);
            vint32m4_t vd = __riscv_vsll_vx_i32m4(vdl32, 11, vl);
            vd = __riscv_vwmacc_vx_i32m4(vd, alphah, vdd, vl);

            vint32m4_t vacc = __riscv_vsll_vx_i32m4(vt, 11, vl);
            vacc = __riscv_vmacc_vx_i32m4(vacc, alphav, vd, vl);

            vint16m2_t vacc16 = __riscv_vnsra_wx_i16m2(vacc, 16, vl);

            vacc16 = __riscv_vadd_vx_i16m2(vacc16, 32, vl);

            vint8m1_t vo = __riscv_vnsra_wx_i8m1(vacc16, 6, vl);

            __riscv_vse8_v_i8m1(output, vo, vl);
            output += vl;

            c -= vl;
        }

        output = (int8_t*) ((uintptr_t) output + output_increment);
    } while (--output_pixels != 0);
}
}
