#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>

using std::min;
extern "C" {

void xnn_qu8_rdsum_ukernel_7p7x__rvv_u16(
    size_t rows,
    size_t channels,
    const uint8_t* input,
    size_t input_stride,
    const uint8_t* zero,
    uint32_t* output,
    const struct xnn_qs8_rsum_params* params)
{
    assert(rows != 0);
    assert(channels != 0);
    assert(input != NULL);
    assert(output != NULL);

    size_t input_increment = 7 * input_stride;

    while (channels > 0) {
        size_t n = __riscv_vsetvl_e8m1(channels);

        const uint8_t* i0 = input;
        const uint8_t* i1 = (const uint8_t*) ((uintptr_t) input + 1 * input_stride);
        const uint8_t* i2 = (const uint8_t*) ((uintptr_t) input + 2 * input_stride);
        const uint8_t* i3 = (const uint8_t*) ((uintptr_t) input + 3 * input_stride);
        const uint8_t* i4 = (const uint8_t*) ((uintptr_t) input + 4 * input_stride);
        const uint8_t* i5 = (const uint8_t*) ((uintptr_t) input + 5 * input_stride);
        const uint8_t* i6 = (const uint8_t*) ((uintptr_t) input + 6 * input_stride);

        vuint32m4_t vacc32 = __riscv_vmv_v_x_u32m4(0, n);

        int r = rows;
        while (r > 0) {
            vuint16m2_t vacc16 = __riscv_vmv_v_x_u16m2(0, n);

            for (int current_batch = min(r, 252); current_batch > 0; current_batch -= 7) {
                const uint8_t* p0 = i0;
                const uint8_t* p1 = XNN_UNPREDICTABLE(current_batch < 2) ? zero : i1;
                const uint8_t* p2 = XNN_UNPREDICTABLE(current_batch <= 2) ? zero : i2;
                const uint8_t* p3 = XNN_UNPREDICTABLE(current_batch < 4) ? zero : i3;
                const uint8_t* p4 = XNN_UNPREDICTABLE(current_batch <= 4) ? zero : i4;
                const uint8_t* p5 = XNN_UNPREDICTABLE(current_batch < 6) ? zero : i5;
                const uint8_t* p6 = XNN_UNPREDICTABLE(current_batch <= 6) ? zero : i6;

                vuint8m1_t vin0 = __riscv_vle8_v_u8m1(p0, n);
                vuint8m1_t vin1 = __riscv_vle8_v_u8m1(p1, n);
                vuint8m1_t vin2 = __riscv_vle8_v_u8m1(p2, n);
                vuint8m1_t vin3 = __riscv_vle8_v_u8m1(p3, n);
                vuint8m1_t vin4 = __riscv_vle8_v_u8m1(p4, n);
                vuint8m1_t vin5 = __riscv_vle8_v_u8m1(p5, n);
                vuint8m1_t vin6 = __riscv_vle8_v_u8m1(p6, n);

                vacc16 = __riscv_vwaddu_wv_u16m2(vacc16, vin0, n);
                vacc16 = __riscv_vwaddu_wv_u16m2(vacc16, vin1, n);
                vacc16 = __riscv_vwaddu_wv_u16m2(vacc16, vin2, n);
                vacc16 = __riscv_vwaddu_wv_u16m2(vacc16, vin3, n);
                vacc16 = __riscv_vwaddu_wv_u16m2(vacc16, vin4, n);
                vacc16 = __riscv_vwaddu_wv_u16m2(vacc16, vin5, n);
                vacc16 = __riscv_vwaddu_wv_u16m2(vacc16, vin6, n);

                i0 = (const uint8_t*) ((uintptr_t) i0 + input_increment);
                i1 = (const uint8_t*) ((uintptr_t) i1 + input_increment);
                i2 = (const uint8_t*) ((uintptr_t) i2 + input_increment);
                i3 = (const uint8_t*) ((uintptr_t) i3 + input_increment);
                i4 = (const uint8_t*) ((uintptr_t) i4 + input_increment);
                i5 = (const uint8_t*) ((uintptr_t) i5 + input_increment);
                i6 = (const uint8_t*) ((uintptr_t) i6 + input_increment);
            }

            vacc32 = __riscv_vwaddu_wv_u32m4(vacc32, vacc16, n);
            r = doz(r, 252);
        }

        vuint32m4_t vo = __riscv_vle32_v_u32m4(output, n);
        vacc32 = __riscv_vadd_vv_u32m4(vo, vacc32, n);
        __riscv_vse32_v_u32m4(output, vacc32, n);

        output += n;
        input = (const uint8_t*) ((uintptr_t) input + n * sizeof(uint8_t));
        channels -= n;
    }
}
}
