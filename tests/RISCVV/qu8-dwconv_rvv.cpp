#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_qu8_dwconv_minmax_fp32_ukernel_9p32c__rvv_mul16(
        size_t channels,
        size_t output_width,
        const uint8_t** input,
        const void* weights,
        uint8_t* output,
        intptr_t input_stride,
        size_t output_increment,
        size_t input_offset,
        size_t input_pixel_stride,
        const uint8_t* zero,
        const union xnn_qu8_conv_minmax_params* params) XNN_OOB_READS
    {
        assert(channels != 0);
        assert(output_width != 0);
    
        const int16_t kzp = (int16_t)params->fp32_neon.kernel_zero_point;
        const float scale = params->fp32_neon.scale;
        const float magic_bias = params->fp32_neon.magic_bias;
        const int32_t magic_sub = params->fp32_neon.magic_bias_less_output_zero_point;
        const uint8_t out_min = params->fp32_neon.output_min;
        const uint8_t out_max = params->fp32_neon.output_max;
    
        do {
            /* Load 9 input pointers */
            const uint8_t* i0 = input[0];
            if XNN_UNPREDICTABLE(i0 != zero) i0 += input_offset;
            const uint8_t* i1 = input[1];
            if XNN_UNPREDICTABLE(i1 != zero) i1 += input_offset;
            const uint8_t* i2 = input[2];
            if XNN_UNPREDICTABLE(i2 != zero) i2 += input_offset;
            const uint8_t* i3 = input[3];
            if XNN_UNPREDICTABLE(i3 != zero) i3 += input_offset;
            const uint8_t* i4 = input[4];
            if XNN_UNPREDICTABLE(i4 != zero) i4 += input_offset;
            const uint8_t* i5 = input[5];
            if XNN_UNPREDICTABLE(i5 != zero) i5 += input_offset;
            const uint8_t* i6 = input[6];
            if XNN_UNPREDICTABLE(i6 != zero) i6 += input_offset;
            const uint8_t* i7 = input[7];
            if XNN_UNPREDICTABLE(i7 != zero) i7 += input_offset;
            const uint8_t* i8 = input[8];
            if XNN_UNPREDICTABLE(i8 != zero) i8 += input_offset;
            
            input = (const uint8_t**)((uintptr_t)input + input_stride);
    
            size_t c = channels;
            const void* w = weights;
    
            /* Main loop: 32 channels at a time */
            for (; c >= 32; c -= 32) {
                size_t vl = __riscv_vsetvl_e32m4(32);
    
                /* Load 32 biases */
                vint32m4_t vacc = __riscv_vle32_v_i32m4((const int32_t*)w, vl);
                w = (const int32_t*)w + 32;
    
                /* Macro for each row - matches original layout */
                #define DO_ROW(iptr)                                                    \
                {                                                                       \
                    vuint8m1_t vin = __riscv_vle8_v_u8m1(iptr, vl); iptr += 32;        \
                    vuint8m1_t vk = __riscv_vle8_v_u8m1((const uint8_t*)w, vl);        \
                    w = (const uint8_t*)w + 32;                                         \
                    vuint16m2_t vin16 = __riscv_vwcvtu_x_x_v_u16m2(vin, vl);           \
                    vint16m2_t vis16 = __riscv_vreinterpret_v_u16m2_i16m2(vin16);      \
                    vuint16m2_t vk16 = __riscv_vwcvtu_x_x_v_u16m2(vk, vl);             \
                    vint16m2_t vks16 = __riscv_vsub_vx_i16m2(                          \
                        __riscv_vreinterpret_v_u16m2_i16m2(vk16), kzp, vl);            \
                    vacc = __riscv_vwmacc_vv_i32m4(vacc, vis16, vks16, vl);            \
                }
    
                DO_ROW(i0); DO_ROW(i1); DO_ROW(i2);
                DO_ROW(i3); DO_ROW(i4); DO_ROW(i5);
                DO_ROW(i6); DO_ROW(i7); DO_ROW(i8);
    
                #undef DO_ROW
    
                /* Requantization */
                vfloat32m4_t vf = __riscv_vfcvt_f_x_v_f32m4(vacc, vl);
                vf = __riscv_vfmul_vf_f32m4(vf, scale, vl);
                vf = __riscv_vfadd_vf_f32m4(vf, magic_bias, vl);
    
                vacc = __riscv_vreinterpret_v_f32m4_i32m4(vf);
                vacc = __riscv_vssub_vx_i32m4(vacc, magic_sub, vl);
    
                vint16m2_t vs16 = __riscv_vnclip_wx_i16m2(vacc, 0, __RISCV_VXRM_RNE, vl);
                vs16 = __riscv_vmax_vx_i16m2(vs16, 0, vl);
                vuint8m1_t vout = __riscv_vnclipu_wx_u8m1(
                    __riscv_vreinterpret_v_i16m2_u16m2(vs16), 0, __RISCV_VXRM_RNE, vl);
    
                vout = __riscv_vmaxu_vx_u8m1(vout, out_min, vl);
                vout = __riscv_vminu_vx_u8m1(vout, out_max, vl);
    
                __riscv_vse8_v_u8m1(output, vout, vl);
                output += 32;
            }
    
            /* Tail handling - matches original NEON kernel weight layout */
            if XNN_UNLIKELY(c != 0) {
                const uint8_t* k = (const uint8_t*)((const int32_t*)w + 32);
    
                do {
                    size_t vl = __riscv_vsetvl_e32m1(c > 8 ? 8 : c);
    
                    vint32m1_t vacc = __riscv_vle32_v_i32m1((const int32_t*)w, vl);
                    w = (const int32_t*)w + vl;
    
                    /* Process 9 rows with offset kernel access */
                    #define DO_TAIL_ROW(iptr, offset)                                     \
                    {                                                                     \
                        vuint8mf2_t vin = __riscv_vle8_v_u8mf2(iptr, vl); iptr += vl;    \
                        vuint8mf2_t vk_raw = __riscv_vle8_v_u8mf2(k + (offset), vl);     \
                        vuint16m1_t vin16 = __riscv_vwcvtu_x_x_v_u16m1(vin, vl);         \
                        vint16m1_t vis16 = __riscv_vreinterpret_v_u16m1_i16m1(vin16);    \
                        vuint16m1_t vk16 = __riscv_vwcvtu_x_x_v_u16m1(vk_raw, vl);       \
                        vint16m1_t vks16 = __riscv_vsub_vx_i16m1(                        \
                            __riscv_vreinterpret_v_u16m1_i16m1(vk16), kzp, vl);          \
                        vacc = __riscv_vwmacc_vv_i32m1(vacc, vis16, vks16, vl);          \
                    }
    
                    DO_TAIL_ROW(i0, 0);
                    k += vl;
                    DO_TAIL_ROW(i1, 24);
                    DO_TAIL_ROW(i2, 56);
                    DO_TAIL_ROW(i3, 88);
                    DO_TAIL_ROW(i4, 120);
                    DO_TAIL_ROW(i5, 152);
                    DO_TAIL_ROW(i6, 184);
                    DO_TAIL_ROW(i7, 216);
                    DO_TAIL_ROW(i8, 248);
    
                    #undef DO_TAIL_ROW
    
                    /* Requantization */
                    vfloat32m1_t vf = __riscv_vfcvt_f_x_v_f32m1(vacc, vl);
                    vf = __riscv_vfmul_vf_f32m1(vf, scale, vl);
                    vf = __riscv_vfadd_vf_f32m1(vf, magic_bias, vl);
    
                    vacc = __riscv_vreinterpret_v_f32m1_i32m1(vf);
                    vacc = __riscv_vssub_vx_i32m1(vacc, magic_sub, vl);
    
                    vint16mf2_t vs16 = __riscv_vnclip_wx_i16mf2(vacc, 0, __RISCV_VXRM_RNE, vl);
                    vs16 = __riscv_vmax_vx_i16mf2(vs16, 0, vl);
                    vuint8mf4_t vout = __riscv_vnclipu_wx_u8mf4(
                        __riscv_vreinterpret_v_i16mf2_u16mf2(vs16), 0, __RISCV_VXRM_RNE, vl);
    
                    vout = __riscv_vmaxu_vx_u8mf4(vout, out_min, vl);
                    vout = __riscv_vminu_vx_u8mf4(vout, out_max, vl);
    
                    __riscv_vse8_v_u8mf4(output, vout, vl);
                    output += vl;
                    c -= vl;
    
                } while (c != 0);
            }
    
            input_offset += input_pixel_stride;
            output = (uint8_t*)((uintptr_t)output + output_increment);
        } while (--output_width != 0);
    }
}
