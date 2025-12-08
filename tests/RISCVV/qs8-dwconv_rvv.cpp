#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_qs8_dwconv_minmax_fp32_ukernel_9p8c__rvv(
        size_t channels,
        size_t output_width,
        const int8_t** input,
        const void* weights,
        int8_t* output,
        intptr_t input_stride,
        size_t output_increment,
        size_t input_offset,
        size_t input_pixel_stride,
        const int8_t* zero,
        const union xnn_qs8_conv_minmax_params* params)
    {
        assert(channels != 0);
        assert(output_width != 0);
    
        const float vscale = params->fp32_neon.scale;
        const float vmagic_bias = params->fp32_neon.magic_bias;
        const int32_t vmagic_bias_less_output_zero_point = params->fp32_neon.magic_bias_less_output_zero_point;
        const int8_t voutput_min = params->fp32_neon.output_min;
        const int8_t voutput_max = params->fp32_neon.output_max;
    
        do {
            const int8_t* i0 = input[0];
            assert(i0 != NULL);
            if (i0 != zero) {
                i0 = (const int8_t*) ((uintptr_t) i0 + input_offset);
            }
            const int8_t* i1 = input[1];
            assert(i1 != NULL);
            if (i1 != zero) {
                i1 = (const int8_t*) ((uintptr_t) i1 + input_offset);
            }
            const int8_t* i2 = input[2];
            assert(i2 != NULL);
            if (i2 != zero) {
                i2 = (const int8_t*) ((uintptr_t) i2 + input_offset);
            }
            const int8_t* i3 = input[3];
            assert(i3 != NULL);
            if (i3 != zero) {
                i3 = (const int8_t*) ((uintptr_t) i3 + input_offset);
            }
            const int8_t* i4 = input[4];
            assert(i4 != NULL);
            if (i4 != zero) {
                i4 = (const int8_t*) ((uintptr_t) i4 + input_offset);
            }
            const int8_t* i5 = input[5];
            assert(i5 != NULL);
            if (i5 != zero) {
                i5 = (const int8_t*) ((uintptr_t) i5 + input_offset);
            }
            const int8_t* i6 = input[6];
            assert(i6 != NULL);
            if (i6 != zero) {
                i6 = (const int8_t*) ((uintptr_t) i6 + input_offset);
            }
            const int8_t* i7 = input[7];
            assert(i7 != NULL);
            if (i7 != zero) {
                i7 = (const int8_t*) ((uintptr_t) i7 + input_offset);
            }
            const int8_t* i8 = input[8];
            assert(i8 != NULL);
            if (i8 != zero) {
                i8 = (const int8_t*) ((uintptr_t) i8 + input_offset);
            }
    
            input = (const int8_t**) ((uintptr_t) input + input_stride);
    
            size_t c = channels;
            const void* w = weights;
    
            while (c > 0) {
                size_t vl = __riscv_vsetvl_e32m1(c);
    
                vint32m1_t vacc = __riscv_vle32_v_i32m1((const int32_t*)w, vl);
                w = (const void*)((const int32_t*)w + vl);
    
                vint8mf4_t vi0 = __riscv_vle8_v_i8mf4(i0, vl);
                vint8mf4_t vk0 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i0 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi0_w = __riscv_vsext_vf2_i16mf2(vi0, vl);
                vint16mf2_t vk0_w = __riscv_vsext_vf2_i16mf2(vk0, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi0_w, vk0_w, vl);
    
                vint8mf4_t vi1 = __riscv_vle8_v_i8mf4(i1, vl);
                vint8mf4_t vk1 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i1 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi1_w = __riscv_vsext_vf2_i16mf2(vi1, vl);
                vint16mf2_t vk1_w = __riscv_vsext_vf2_i16mf2(vk1, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi1_w, vk1_w, vl);
    
                vint8mf4_t vi2 = __riscv_vle8_v_i8mf4(i2, vl);
                vint8mf4_t vk2 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i2 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi2_w = __riscv_vsext_vf2_i16mf2(vi2, vl);
                vint16mf2_t vk2_w = __riscv_vsext_vf2_i16mf2(vk2, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi2_w, vk2_w, vl);
    
                vint8mf4_t vi3 = __riscv_vle8_v_i8mf4(i3, vl);
                vint8mf4_t vk3 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i3 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi3_w = __riscv_vsext_vf2_i16mf2(vi3, vl);
                vint16mf2_t vk3_w = __riscv_vsext_vf2_i16mf2(vk3, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi3_w, vk3_w, vl);
    
                vint8mf4_t vi4 = __riscv_vle8_v_i8mf4(i4, vl);
                vint8mf4_t vk4 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i4 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi4_w = __riscv_vsext_vf2_i16mf2(vi4, vl);
                vint16mf2_t vk4_w = __riscv_vsext_vf2_i16mf2(vk4, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi4_w, vk4_w, vl);
    
                vint8mf4_t vi5 = __riscv_vle8_v_i8mf4(i5, vl);
                vint8mf4_t vk5 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i5 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi5_w = __riscv_vsext_vf2_i16mf2(vi5, vl);
                vint16mf2_t vk5_w = __riscv_vsext_vf2_i16mf2(vk5, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi5_w, vk5_w, vl);
    
                vint8mf4_t vi6 = __riscv_vle8_v_i8mf4(i6, vl);
                vint8mf4_t vk6 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i6 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi6_w = __riscv_vsext_vf2_i16mf2(vi6, vl);
                vint16mf2_t vk6_w = __riscv_vsext_vf2_i16mf2(vk6, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi6_w, vk6_w, vl);
    
                vint8mf4_t vi7 = __riscv_vle8_v_i8mf4(i7, vl);
                vint8mf4_t vk7 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i7 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi7_w = __riscv_vsext_vf2_i16mf2(vi7, vl);
                vint16mf2_t vk7_w = __riscv_vsext_vf2_i16mf2(vk7, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi7_w, vk7_w, vl);
    
                vint8mf4_t vi8 = __riscv_vle8_v_i8mf4(i8, vl);
                vint8mf4_t vk8 = __riscv_vle8_v_i8mf4((const int8_t*)w, vl);
                i8 += vl;
                w = (const void*)((const int8_t*)w + vl);
                vint16mf2_t vi8_w = __riscv_vsext_vf2_i16mf2(vi8, vl);
                vint16mf2_t vk8_w = __riscv_vsext_vf2_i16mf2(vk8, vl);
                vacc = __riscv_vwmacc_vv_i32m1(vacc, vi8_w, vk8_w, vl);
    
                vfloat32m1_t vfpacc = __riscv_vfcvt_f_x_v_f32m1(vacc, vl);
                vfpacc = __riscv_vfmul_vf_f32m1(vfpacc, vscale, vl);
                vfpacc = __riscv_vfadd_vf_f32m1(vfpacc, vmagic_bias, vl);
    
                vacc = __riscv_vreinterpret_v_f32m1_i32m1(vfpacc);
                vacc = __riscv_vssub_vx_i32m1(vacc, vmagic_bias_less_output_zero_point, vl);
    
                vint16mf2_t vacc16 = __riscv_vnclip_wx_i16mf2(vacc, 0, __RISCV_VXRM_RDN, vl);
                vint8mf4_t vout = __riscv_vnclip_wx_i8mf4(vacc16, 0, __RISCV_VXRM_RDN, vl);
    
                vout = __riscv_vmax_vx_i8mf4(vout, voutput_min, vl);
                vout = __riscv_vmin_vx_i8mf4(vout, voutput_max, vl);
    
                __riscv_vse8_v_i8mf4(output, vout, vl);
                output += vl;
    
                c -= vl;
            }
    
            input_offset += input_pixel_stride;
            output = (int8_t*) ((uintptr_t) output + output_increment);
        } while (--output_width != 0);
    }
}
