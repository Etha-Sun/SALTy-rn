#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_1x8__rvv(
        size_t mr,
        size_t nc,
        size_t kc,
        const int8_t* a,
        size_t a_stride,
        const void* w,
        int8_t* c,
        size_t cm_stride,
        size_t cn_stride,
        const union xnn_qs8_qc8w_conv_minmax_params* params) XNN_OOB_READS
    {
        assert(mr != 0);
        assert(mr <= 1);
        assert(nc != 0);
        assert(kc != 0);
        assert(kc % sizeof(int8_t) == 0);
        assert(a != NULL);
        assert(w != NULL);
        assert(c != NULL);

        const float vmagic_bias = params->fp32_neon.magic_bias;
        const int32_t vmagic_bias_less_output_zero_point = params->fp32_neon.magic_bias_less_output_zero_point;
        const int8_t voutput_min = params->fp32_neon.output_min;
        const int8_t voutput_max = params->fp32_neon.output_max;

        const int8_t* a0 = a;
        int8_t* c0 = c;

        do {
            size_t vl = __riscv_vsetvl_e32m1(8);

            vint32m1_t vacc0x0123 = __riscv_vle32_v_i32m1((const int32_t*)w, 4);
            w = (const int32_t*)w + 4;
            vint32m1_t vacc0x4567 = __riscv_vle32_v_i32m1((const int32_t*)w, 4);
            w = (const int32_t*)w + 4;

            size_t k = kc;
            while (k >= 8 * sizeof(int8_t)) {
                vint8mf4_t va0 = __riscv_vle8_v_i8mf4(a0, 8);
                a0 += 8;
                vint16mf2_t vxa0 = __riscv_vsext_vf2_i16mf2(va0, 8);

                vint8mf4_t vb01234567c0 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;
                vint8mf4_t vb01234567c1 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;
                vint8mf4_t vb01234567c2 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;
                vint8mf4_t vb01234567c3 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;
                vint8mf4_t vb01234567c4 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;
                vint8mf4_t vb01234567c5 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;
                vint8mf4_t vb01234567c6 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;
                vint8mf4_t vb01234567c7 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;

                vint16mf2_t vxb01234567c0 = __riscv_vsext_vf2_i16mf2(vb01234567c0, 8);
                vint16mf2_t vxb01234567c1 = __riscv_vsext_vf2_i16mf2(vb01234567c1, 8);
                vint16mf2_t vxb01234567c2 = __riscv_vsext_vf2_i16mf2(vb01234567c2, 8);
                vint16mf2_t vxb01234567c3 = __riscv_vsext_vf2_i16mf2(vb01234567c3, 8);
                vint16mf2_t vxb01234567c4 = __riscv_vsext_vf2_i16mf2(vb01234567c4, 8);
                vint16mf2_t vxb01234567c5 = __riscv_vsext_vf2_i16mf2(vb01234567c5, 8);
                vint16mf2_t vxb01234567c6 = __riscv_vsext_vf2_i16mf2(vb01234567c6, 8);
                vint16mf2_t vxb01234567c7 = __riscv_vsext_vf2_i16mf2(vb01234567c7, 8);

                vint16mf2_t va0_lane0 = __riscv_vrgather_vx_i16mf2(vxa0, 0, 4);
                vint16mf2_t va0_lane1 = __riscv_vrgather_vx_i16mf2(vxa0, 1, 4);
                vint16mf2_t va0_lane2 = __riscv_vrgather_vx_i16mf2(vxa0, 2, 4);
                vint16mf2_t va0_lane3 = __riscv_vrgather_vx_i16mf2(vxa0, 3, 4);
                vint16mf2_t va0_lane4 = __riscv_vrgather_vx_i16mf2(vxa0, 4, 4);
                vint16mf2_t va0_lane5 = __riscv_vrgather_vx_i16mf2(vxa0, 5, 4);
                vint16mf2_t va0_lane6 = __riscv_vrgather_vx_i16mf2(vxa0, 6, 4);
                vint16mf2_t va0_lane7 = __riscv_vrgather_vx_i16mf2(vxa0, 7, 4);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane0, vxb01234567c0, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane0, __riscv_vslidedown_vx_i16mf2(vxb01234567c0, 4, 4), 4);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane1, vxb01234567c1, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane1, __riscv_vslidedown_vx_i16mf2(vxb01234567c1, 4, 4), 4);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane2, vxb01234567c2, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane2, __riscv_vslidedown_vx_i16mf2(vxb01234567c2, 4, 4), 4);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane3, vxb01234567c3, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane3, __riscv_vslidedown_vx_i16mf2(vxb01234567c3, 4, 4), 4);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane4, vxb01234567c4, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane4, __riscv_vslidedown_vx_i16mf2(vxb01234567c4, 4, 4), 4);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane5, vxb01234567c5, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane5, __riscv_vslidedown_vx_i16mf2(vxb01234567c5, 4, 4), 4);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane6, vxb01234567c6, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane6, __riscv_vslidedown_vx_i16mf2(vxb01234567c6, 4, 4), 4);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane7, vxb01234567c7, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane7, __riscv_vslidedown_vx_i16mf2(vxb01234567c7, 4, 4), 4);

                k -= 8 * sizeof(int8_t);
            }

            if XNN_UNLIKELY(k != 0) {
                vint8mf4_t va0 = __riscv_vle8_v_i8mf4(a0, 8);
                a0 = (const int8_t*)((uintptr_t)a0 + k);
                vint16mf2_t vxa0 = __riscv_vsext_vf2_i16mf2(va0, 8);

                vint16mf2_t va0_lane0 = __riscv_vrgather_vx_i16mf2(vxa0, 0, 4);
                vint16mf2_t va0_lane1 = __riscv_vrgather_vx_i16mf2(vxa0, 1, 4);
                vint16mf2_t va0_lane2 = __riscv_vrgather_vx_i16mf2(vxa0, 2, 4);
                vint16mf2_t va0_lane3 = __riscv_vrgather_vx_i16mf2(vxa0, 3, 4);
                vint16mf2_t va0_lane4 = __riscv_vrgather_vx_i16mf2(vxa0, 4, 4);
                vint16mf2_t va0_lane5 = __riscv_vrgather_vx_i16mf2(vxa0, 5, 4);
                vint16mf2_t va0_lane6 = __riscv_vrgather_vx_i16mf2(vxa0, 6, 4);

                vint8mf4_t vb01234567c0 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                w = (const int8_t*)w + 8;
                vint16mf2_t vxb01234567c0 = __riscv_vsext_vf2_i16mf2(vb01234567c0, 8);

                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane0, vxb01234567c0, 4);
                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane0, __riscv_vslidedown_vx_i16mf2(vxb01234567c0, 4, 4), 4);

                if (k >= 2 * sizeof(int8_t)) {
                    vint8mf4_t vb01234567c1 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                    w = (const int8_t*)w + 8;
                    vint16mf2_t vxb01234567c1 = __riscv_vsext_vf2_i16mf2(vb01234567c1, 8);

                    vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane1, vxb01234567c1, 4);
                    vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane1, __riscv_vslidedown_vx_i16mf2(vxb01234567c1, 4, 4), 4);

                    if (k > 2 * sizeof(int8_t)) {
                        vint8mf4_t vb01234567c2 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                        w = (const int8_t*)w + 8;
                        vint16mf2_t vxb01234567c2 = __riscv_vsext_vf2_i16mf2(vb01234567c2, 8);

                        vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane2, vxb01234567c2, 4);
                        vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane2, __riscv_vslidedown_vx_i16mf2(vxb01234567c2, 4, 4), 4);

                        if (k >= 4 * sizeof(int8_t)) {
                            vint8mf4_t vb01234567c3 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                            w = (const int8_t*)w + 8;
                            vint16mf2_t vxb01234567c3 = __riscv_vsext_vf2_i16mf2(vb01234567c3, 8);

                            vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane3, vxb01234567c3, 4);
                            vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane3, __riscv_vslidedown_vx_i16mf2(vxb01234567c3, 4, 4), 4);

                            if (k > 4 * sizeof(int8_t)) {
                                vint8mf4_t vb01234567c4 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                                w = (const int8_t*)w + 8;
                                vint16mf2_t vxb01234567c4 = __riscv_vsext_vf2_i16mf2(vb01234567c4, 8);

                                vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane4, vxb01234567c4, 4);
                                vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane4, __riscv_vslidedown_vx_i16mf2(vxb01234567c4, 4, 4), 4);

                                if (k >= 6 * sizeof(int8_t)) {
                                    vint8mf4_t vb01234567c5 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                                    w = (const int8_t*)w + 8;
                                    vint16mf2_t vxb01234567c5 = __riscv_vsext_vf2_i16mf2(vb01234567c5, 8);

                                    vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane5, vxb01234567c5, 4);
                                    vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane5, __riscv_vslidedown_vx_i16mf2(vxb01234567c5, 4, 4), 4);

                                    if (k > 6 * sizeof(int8_t)) {
                                        vint8mf4_t vb01234567c6 = __riscv_vle8_v_i8mf4((const int8_t*)w, 8);
                                        w = (const int8_t*)w + 8;
                                        vint16mf2_t vxb01234567c6 = __riscv_vsext_vf2_i16mf2(vb01234567c6, 8);

                                        vacc0x0123 = __riscv_vwmacc_vv_i32m1(vacc0x0123, va0_lane6, vxb01234567c6, 4);
                                        vacc0x4567 = __riscv_vwmacc_vv_i32m1(vacc0x4567, va0_lane6, __riscv_vslidedown_vx_i16mf2(vxb01234567c6, 4, 4), 4);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            vfloat32m1_t vfpacc0x0123 = __riscv_vfcvt_f_x_v_f32m1(vacc0x0123, 4);
            vfloat32m1_t vfpacc0x4567 = __riscv_vfcvt_f_x_v_f32m1(vacc0x4567, 4);

            vfloat32m1_t vscale0123 = __riscv_vle32_v_f32m1((const float*)w, 4);
            w = (const float*)w + 4;
            vfpacc0x0123 = __riscv_vfmul_vv_f32m1(vfpacc0x0123, vscale0123, 4);
            vfloat32m1_t vscale4567 = __riscv_vle32_v_f32m1((const float*)w, 4);
            w = (const float*)w + 4;
            vfpacc0x4567 = __riscv_vfmul_vv_f32m1(vfpacc0x4567, vscale4567, 4);

            vfpacc0x0123 = __riscv_vfadd_vf_f32m1(vfpacc0x0123, vmagic_bias, 4);
            vfpacc0x4567 = __riscv_vfadd_vf_f32m1(vfpacc0x4567, vmagic_bias, 4);

            vacc0x0123 = __riscv_vreinterpret_v_f32m1_i32m1(vfpacc0x0123);
            vacc0x4567 = __riscv_vreinterpret_v_f32m1_i32m1(vfpacc0x4567);

            vacc0x0123 = __riscv_vssub_vx_i32m1(vacc0x0123, vmagic_bias_less_output_zero_point, 4);
            vacc0x4567 = __riscv_vssub_vx_i32m1(vacc0x4567, vmagic_bias_less_output_zero_point, 4);

            vint16mf2_t vacc0x0123_16 = __riscv_vnclip_wx_i16mf2(vacc0x0123, 0, __RISCV_VXRM_RDN, 4);
            vint16mf2_t vacc0x4567_16 = __riscv_vnclip_wx_i16mf2(vacc0x4567, 0, __RISCV_VXRM_RDN, 4);

            vint8mf4_t vout0x0123 = __riscv_vnclip_wx_i8mf4(vacc0x0123_16, 0, __RISCV_VXRM_RDN, 4);
            vint8mf4_t vout0x4567 = __riscv_vnclip_wx_i8mf4(vacc0x4567_16, 0, __RISCV_VXRM_RDN, 4);

            vout0x0123 = __riscv_vmax_vx_i8mf4(vout0x0123, voutput_min, 4);
            vout0x4567 = __riscv_vmax_vx_i8mf4(vout0x4567, voutput_min, 4);

            vout0x0123 = __riscv_vmin_vx_i8mf4(vout0x0123, voutput_max, 4);
            vout0x4567 = __riscv_vmin_vx_i8mf4(vout0x4567, voutput_max, 4);

            if (nc >= 8) {
                __riscv_vse8_v_i8mf4(c0, vout0x0123, 4);
                __riscv_vse8_v_i8mf4(c0 + 4, vout0x4567, 4);

                c0 = (int8_t*)((uintptr_t)c0 + cn_stride);
                a0 = (const int8_t*)((uintptr_t)a0 - kc);
                nc -= 8;
            } else {
                if (nc & 4) {
                    __riscv_vse8_v_i8mf4(c0, vout0x0123, 4);
                    c0 += 4;
                    vout0x0123 = vout0x4567;
                }
                if (nc & 2) {
                    __riscv_vse8_v_i8mf4(c0, vout0x0123, 2);
                    c0 += 2;
                    vout0x0123 = __riscv_vslidedown_vx_i8mf4(vout0x0123, 2, 4);
                }
                if (nc & 1) {
                    __riscv_vse8_v_i8mf4(c0, vout0x0123, 1);
                }
                nc = 0;
            }
        } while (nc != 0);
    }
}
