#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/symbolic_scalar_types.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_qd8_f32_qc4w_gemm_minmax_ukernel_2x16c4__rvv(
        size_t mr,
        size_t nc,
        size_t kc,
        const int8_t* a,
        size_t a_stride,
        const void* w,
        float* c,
        size_t cm_stride,
        size_t cn_stride,
        const struct xnn_f32_qc4w_minmax_params* params,
        const struct xnn_qd8_quantization_params* quantization_params) XNN_OOB_READS
    {
        kc = round_up_po2(kc, 4 * sizeof(int8_t));
        const int8_t* a0 = a;
        float* c0 = c;
        const int8_t* a1 = (const int8_t*) ((uintptr_t) a0 + a_stride);
        float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
        if XNN_UNPREDICTABLE(mr != 2) {
            a1 = a0;
            c1 = c0;
        }

        // Create mask vector (0xF0 in all elements)
        size_t vl16 = __riscv_vsetvl_e8m1(16);
        vint8m1_t vmask = vmovq_n_s8_rvv(INT8_C(0xF0), vl16);

        const float vmin = params->scalar.min;
        const float vmax = params->scalar.max;

        do {
            size_t vl = __riscv_vsetvl_e32m1(4);

            // Load quantization params - zero points as int32 vector
            // quantization_params[0].zero_point is at offset 0, inv_scale at offset 4
            // quantization_params[1].zero_point is at offset 8, inv_scale at offset 12
            vint32m1_t vinput_zero_point01 = __riscv_vle32_v_i32m1(&quantization_params[0].zero_point, vl);

            // Load kernel sums
            vint32m1_t vksum0123 = __riscv_vle32_v_i32m1((const int32_t*)w, vl); w = (const int32_t*)w + 4;
            // Initialize accumulators: acc = ksum * zero_point
            // Use vmulq_lane_s32_rvv for exact NEON semantics: multiply by lane 0 (zero_point0)
            vint32m1_t vacc0x0123 = vmulq_lane_s32_rvv(vksum0123, vinput_zero_point01, 0, vl);
            // lane 2 corresponds to zero_point1 (int32 at position 2)
            vint32m1_t vacc1x0123 = vmulq_lane_s32_rvv(vksum0123, vinput_zero_point01, 2, vl);

            vint32m1_t vksum4567 = __riscv_vle32_v_i32m1((const int32_t*)w, vl); w = (const int32_t*)w + 4;
            vint32m1_t vacc0x4567 = vmulq_lane_s32_rvv(vksum4567, vinput_zero_point01, 0, vl);
            vint32m1_t vacc1x4567 = vmulq_lane_s32_rvv(vksum4567, vinput_zero_point01, 2, vl);

            vint32m1_t vksum89AB = __riscv_vle32_v_i32m1((const int32_t*)w, vl); w = (const int32_t*)w + 4;
            vint32m1_t vacc0x89AB = vmulq_lane_s32_rvv(vksum89AB, vinput_zero_point01, 0, vl);
            vint32m1_t vacc1x89AB = vmulq_lane_s32_rvv(vksum89AB, vinput_zero_point01, 2, vl);

            vint32m1_t vksumCDEF = __riscv_vle32_v_i32m1((const int32_t*)w, vl); w = (const int32_t*)w + 4;
            vint32m1_t vacc0xCDEF = vmulq_lane_s32_rvv(vksumCDEF, vinput_zero_point01, 0, vl);
            vint32m1_t vacc1xCDEF = vmulq_lane_s32_rvv(vksumCDEF, vinput_zero_point01, 2, vl);

            size_t k = kc;
            // 2x partial unrolled loop to load 8 bytes at a time.
            while (k >= 8 * sizeof(int8_t)) {
                // Load a 2x8 block of activations.
                size_t vl8 = __riscv_vsetvl_e8m1(8);
                vint8m1_t va0x01234567 = __riscv_vle8_v_i8m1(a0, vl8); a0 += 8;
                vint8m1_t va1x01234567 = __riscv_vle8_v_i8m1(a1, vl8); a1 += 8;

                // Load a 8x16 block of weights.
                vint8m1_t vb01234567x0123 = __riscv_vle8_v_i8m1((const int8_t*)w, vl16); w = (const int8_t*)w + 16;
                vint8m1_t vb01234567x4567 = __riscv_vle8_v_i8m1((const int8_t*)w, vl16); w = (const int8_t*)w + 16;
                vint8m1_t vb01234567x89AB = __riscv_vle8_v_i8m1((const int8_t*)w, vl16); w = (const int8_t*)w + 16;
                vint8m1_t vb01234567xCDEF = __riscv_vle8_v_i8m1((const int8_t*)w, vl16); w = (const int8_t*)w + 16;

                // Unpack 4-bit weights using NEON-equivalent operations
                vint8m1_t vb0123x0123 = vshlq_n_s8_rvv(vb01234567x0123, 4, vl16);
                vint8m1_t vb0123x4567 = vshlq_n_s8_rvv(vb01234567x4567, 4, vl16);
                vint8m1_t vb0123x89AB = vshlq_n_s8_rvv(vb01234567x89AB, 4, vl16);
                vint8m1_t vb0123xCDEF = vshlq_n_s8_rvv(vb01234567xCDEF, 4, vl16);

                vint8m1_t vb4567x0123 = vandq_s8_rvv(vb01234567x0123, vmask, vl16);
                vint8m1_t vb4567x4567 = vandq_s8_rvv(vb01234567x4567, vmask, vl16);
                vint8m1_t vb4567x89AB = vandq_s8_rvv(vb01234567x89AB, vmask, vl16);
                vint8m1_t vb4567xCDEF = vandq_s8_rvv(vb01234567xCDEF, vmask, vl16);

                // Multiply-accumulate: 2x8 * 8x16 --> 2x16.
                // Use vdotq_lane_s32_rvv for exact NEON semantics
                vacc0x0123 = vdotq_lane_s32_rvv(vacc0x0123, vb0123x0123, va0x01234567, 0, vl);
                vacc0x4567 = vdotq_lane_s32_rvv(vacc0x4567, vb0123x4567, va0x01234567, 0, vl);
                vacc0x89AB = vdotq_lane_s32_rvv(vacc0x89AB, vb0123x89AB, va0x01234567, 0, vl);
                vacc0xCDEF = vdotq_lane_s32_rvv(vacc0xCDEF, vb0123xCDEF, va0x01234567, 0, vl);
                vacc1x0123 = vdotq_lane_s32_rvv(vacc1x0123, vb0123x0123, va1x01234567, 0, vl);
                vacc1x4567 = vdotq_lane_s32_rvv(vacc1x4567, vb0123x4567, va1x01234567, 0, vl);
                vacc1x89AB = vdotq_lane_s32_rvv(vacc1x89AB, vb0123x89AB, va1x01234567, 0, vl);
                vacc1xCDEF = vdotq_lane_s32_rvv(vacc1xCDEF, vb0123xCDEF, va1x01234567, 0, vl);

                vacc0x0123 = vdotq_lane_s32_rvv(vacc0x0123, vb4567x0123, va0x01234567, 1, vl);
                vacc0x4567 = vdotq_lane_s32_rvv(vacc0x4567, vb4567x4567, va0x01234567, 1, vl);
                vacc0x89AB = vdotq_lane_s32_rvv(vacc0x89AB, vb4567x89AB, va0x01234567, 1, vl);
                vacc0xCDEF = vdotq_lane_s32_rvv(vacc0xCDEF, vb4567xCDEF, va0x01234567, 1, vl);
                vacc1x0123 = vdotq_lane_s32_rvv(vacc1x0123, vb4567x0123, va1x01234567, 1, vl);
                vacc1x4567 = vdotq_lane_s32_rvv(vacc1x4567, vb4567x4567, va1x01234567, 1, vl);
                vacc1x89AB = vdotq_lane_s32_rvv(vacc1x89AB, vb4567x89AB, va1x01234567, 1, vl);
                vacc1xCDEF = vdotq_lane_s32_rvv(vacc1xCDEF, vb4567xCDEF, va1x01234567, 1, vl);

                k -= 8 * sizeof(int8_t);
            }

            // Handle up to 4 final positions of `k`
            if XNN_UNLIKELY(k != 0) {
                // Load a 2x4 block of activations.
                size_t vl8 = __riscv_vsetvl_e8m1(8);
                vint8m1_t va0x01234567 = __riscv_vle8_v_i8m1(a0, vl8); a0 += 4;
                vint8m1_t va1x01234567 = __riscv_vle8_v_i8m1(a1, vl8); a1 += 4;

                // Load a 4x16 block of weights.
                vint8m1_t vb01234567x0123 = __riscv_vle8_v_i8m1((const int8_t*)w, vl16); w = (const int8_t*)w + 16;
                vint8m1_t vb01234567x4567 = __riscv_vle8_v_i8m1((const int8_t*)w, vl16); w = (const int8_t*)w + 16;
                vint8m1_t vb01234567x89AB = __riscv_vle8_v_i8m1((const int8_t*)w, vl16); w = (const int8_t*)w + 16;
                vint8m1_t vb01234567xCDEF = __riscv_vle8_v_i8m1((const int8_t*)w, vl16); w = (const int8_t*)w + 16;

                vint8m1_t vb0123x0123 = vshlq_n_s8_rvv(vb01234567x0123, 4, vl16);
                vint8m1_t vb0123x4567 = vshlq_n_s8_rvv(vb01234567x4567, 4, vl16);
                vint8m1_t vb0123x89AB = vshlq_n_s8_rvv(vb01234567x89AB, 4, vl16);
                vint8m1_t vb0123xCDEF = vshlq_n_s8_rvv(vb01234567xCDEF, 4, vl16);

                // Multiply-accumulate: 2x4 * 4x16 --> 2x16.
                vacc0x0123 = vdotq_lane_s32_rvv(vacc0x0123, vb0123x0123, va0x01234567, 0, vl);
                vacc0x4567 = vdotq_lane_s32_rvv(vacc0x4567, vb0123x4567, va0x01234567, 0, vl);
                vacc0x89AB = vdotq_lane_s32_rvv(vacc0x89AB, vb0123x89AB, va0x01234567, 0, vl);
                vacc0xCDEF = vdotq_lane_s32_rvv(vacc0xCDEF, vb0123xCDEF, va0x01234567, 0, vl);
                vacc1x0123 = vdotq_lane_s32_rvv(vacc1x0123, vb0123x0123, va1x01234567, 0, vl);
                vacc1x4567 = vdotq_lane_s32_rvv(vacc1x4567, vb0123x4567, va1x01234567, 0, vl);
                vacc1x89AB = vdotq_lane_s32_rvv(vacc1x89AB, vb0123x89AB, va1x01234567, 0, vl);
                vacc1xCDEF = vdotq_lane_s32_rvv(vacc1xCDEF, vb0123xCDEF, va1x01234567, 0, vl);
            }

            // Convert to float with fixed-point scaling (divide by 16)
            vfloat32m1_t vout0x0123 = vcvtq_n_f32_s32_rvv(vacc0x0123, 4, vl);
            vfloat32m1_t vout0x4567 = vcvtq_n_f32_s32_rvv(vacc0x4567, 4, vl);
            vfloat32m1_t vout0x89AB = vcvtq_n_f32_s32_rvv(vacc0x89AB, 4, vl);
            vfloat32m1_t vout0xCDEF = vcvtq_n_f32_s32_rvv(vacc0xCDEF, 4, vl);
            vfloat32m1_t vout1x0123 = vcvtq_n_f32_s32_rvv(vacc1x0123, 4, vl);
            vfloat32m1_t vout1x4567 = vcvtq_n_f32_s32_rvv(vacc1x4567, 4, vl);
            vfloat32m1_t vout1x89AB = vcvtq_n_f32_s32_rvv(vacc1x89AB, 4, vl);
            vfloat32m1_t vout1xCDEF = vcvtq_n_f32_s32_rvv(vacc1xCDEF, 4, vl);

            // Load input scales as float vector (reinterpret the int32 vector as float)
            // The structure has: zero_point (int32), inv_scale (float) for each row
            // So we need to load starting at the same address and access lane 1 for inv_scale
            vfloat32m1_t vinput_scale01 = __riscv_vle32_v_f32m1((const float*)&quantization_params[0].zero_point, vl);

            // Multiply by input scale using lane selection
            // Lane 1 = inv_scale0, Lane 3 = inv_scale1
            vout0x0123 = vmulq_lane_f32_rvv(vout0x0123, vinput_scale01, 1, vl);
            vout1x0123 = vmulq_lane_f32_rvv(vout1x0123, vinput_scale01, 3, vl);
            vout0x4567 = vmulq_lane_f32_rvv(vout0x4567, vinput_scale01, 1, vl);
            vout1x4567 = vmulq_lane_f32_rvv(vout1x4567, vinput_scale01, 3, vl);
            vout0x89AB = vmulq_lane_f32_rvv(vout0x89AB, vinput_scale01, 1, vl);
            vout1x89AB = vmulq_lane_f32_rvv(vout1x89AB, vinput_scale01, 3, vl);
            vout0xCDEF = vmulq_lane_f32_rvv(vout0xCDEF, vinput_scale01, 1, vl);
            vout1xCDEF = vmulq_lane_f32_rvv(vout1xCDEF, vinput_scale01, 3, vl);

            // Load filter scales and biases
            vfloat32m1_t vfilter_output_scale0123 = __riscv_vle32_v_f32m1((const float*)w, vl); w = (const float*)w + 4;
            vfloat32m1_t vfilter_output_scale4567 = __riscv_vle32_v_f32m1((const float*)w, vl); w = (const float*)w + 4;
            vfloat32m1_t vfilter_output_scale89AB = __riscv_vle32_v_f32m1((const float*)w, vl); w = (const float*)w + 4;
            vfloat32m1_t vfilter_output_scaleCDEF = __riscv_vle32_v_f32m1((const float*)w, vl); w = (const float*)w + 4;

            vfloat32m1_t vbias0123 = __riscv_vle32_v_f32m1((const float*)w, vl); w = (const float*)w + 4;
            vout0x0123 = __riscv_vfmacc_vv_f32m1(vbias0123, vout0x0123, vfilter_output_scale0123, vl);
            vout1x0123 = __riscv_vfmacc_vv_f32m1(vbias0123, vout1x0123, vfilter_output_scale0123, vl);

            vfloat32m1_t vbias4567 = __riscv_vle32_v_f32m1((const float*)w, vl); w = (const float*)w + 4;
            vout0x4567 = __riscv_vfmacc_vv_f32m1(vbias4567, vout0x4567, vfilter_output_scale4567, vl);
            vout1x4567 = __riscv_vfmacc_vv_f32m1(vbias4567, vout1x4567, vfilter_output_scale4567, vl);

            vfloat32m1_t vbias89AB = __riscv_vle32_v_f32m1((const float*)w, vl); w = (const float*)w + 4;
            vout0x89AB = __riscv_vfmacc_vv_f32m1(vbias89AB, vout0x89AB, vfilter_output_scale89AB, vl);
            vout1x89AB = __riscv_vfmacc_vv_f32m1(vbias89AB, vout1x89AB, vfilter_output_scale89AB, vl);

            vfloat32m1_t vbiasCDEF = __riscv_vle32_v_f32m1((const float*)w, vl); w = (const float*)w + 4;
            vout0xCDEF = __riscv_vfmacc_vv_f32m1(vbiasCDEF, vout0xCDEF, vfilter_output_scaleCDEF, vl);
            vout1xCDEF = __riscv_vfmacc_vv_f32m1(vbiasCDEF, vout1xCDEF, vfilter_output_scaleCDEF, vl);

            // Apply min/max clamping
            vout0x0123 = __riscv_vfmax_vf_f32m1(vout0x0123, vmin, vl);
            vout0x4567 = __riscv_vfmax_vf_f32m1(vout0x4567, vmin, vl);
            vout0x89AB = __riscv_vfmax_vf_f32m1(vout0x89AB, vmin, vl);
            vout0xCDEF = __riscv_vfmax_vf_f32m1(vout0xCDEF, vmin, vl);
            vout1x0123 = __riscv_vfmax_vf_f32m1(vout1x0123, vmin, vl);
            vout1x4567 = __riscv_vfmax_vf_f32m1(vout1x4567, vmin, vl);
            vout1x89AB = __riscv_vfmax_vf_f32m1(vout1x89AB, vmin, vl);
            vout1xCDEF = __riscv_vfmax_vf_f32m1(vout1xCDEF, vmin, vl);

            vout0x0123 = __riscv_vfmin_vf_f32m1(vout0x0123, vmax, vl);
            vout0x4567 = __riscv_vfmin_vf_f32m1(vout0x4567, vmax, vl);
            vout0x89AB = __riscv_vfmin_vf_f32m1(vout0x89AB, vmax, vl);
            vout0xCDEF = __riscv_vfmin_vf_f32m1(vout0xCDEF, vmax, vl);
            vout1x0123 = __riscv_vfmin_vf_f32m1(vout1x0123, vmax, vl);
            vout1x4567 = __riscv_vfmin_vf_f32m1(vout1x4567, vmax, vl);
            vout1x89AB = __riscv_vfmin_vf_f32m1(vout1x89AB, vmax, vl);
            vout1xCDEF = __riscv_vfmin_vf_f32m1(vout1xCDEF, vmax, vl);

            if XNN_LIKELY(nc >= 16) {
                __riscv_vse32_v_f32m1(c0, vout0x0123, vl);
                __riscv_vse32_v_f32m1(c0 + 4, vout0x4567, vl);
                __riscv_vse32_v_f32m1(c0 + 8, vout0x89AB, vl);
                __riscv_vse32_v_f32m1(c0 + 12, vout0xCDEF, vl);
                __riscv_vse32_v_f32m1(c1, vout1x0123, vl);
                __riscv_vse32_v_f32m1(c1 + 4, vout1x4567, vl);
                __riscv_vse32_v_f32m1(c1 + 8, vout1x89AB, vl);
                __riscv_vse32_v_f32m1(c1 + 12, vout1xCDEF, vl);

                a0 = (const int8_t*) ((uintptr_t) a0 - kc);
                a1 = (const int8_t*) ((uintptr_t) a1 - kc);

                c0 = (float*) ((uintptr_t) c0 + cn_stride);
                c1 = (float*) ((uintptr_t) c1 + cn_stride);

                nc -= 16;
            } else {
                if (nc & 8) {
                    __riscv_vse32_v_f32m1(c0, vout0x0123, vl); c0 += 4;
                    vout0x0123 = vout0x89AB;
                    __riscv_vse32_v_f32m1(c1, vout1x0123, vl); c1 += 4;
                    vout1x0123 = vout1x89AB;
                    __riscv_vse32_v_f32m1(c0, vout0x4567, vl); c0 += 4;
                    vout0x4567 = vout0xCDEF;
                    __riscv_vse32_v_f32m1(c1, vout1x4567, vl); c1 += 4;
                    vout1x4567 = vout1xCDEF;
                }
                if (nc & 4) {
                    __riscv_vse32_v_f32m1(c0, vout0x0123, vl); c0 += 4;
                    vout0x0123 = vout0x4567;
                    __riscv_vse32_v_f32m1(c1, vout1x0123, vl); c1 += 4;
                    vout1x0123 = vout1x4567;
                }
                if (nc & 2) {
                    size_t vl2 = __riscv_vsetvl_e32m1(2);
                    __riscv_vse32_v_f32m1(c0, vout0x0123, vl2); c0 += 2;
                    __riscv_vse32_v_f32m1(c1, vout1x0123, vl2); c1 += 2;
                    vout0x0123 = __riscv_vslidedown_vx_f32m1(vout0x0123, 2, vl);
                    vout1x0123 = __riscv_vslidedown_vx_f32m1(vout1x0123, 2, vl);
                }
                if (nc & 1) {
                    size_t vl1 = __riscv_vsetvl_e32m1(1);
                    __riscv_vse32_v_f32m1(c0, vout0x0123, vl1);
                    __riscv_vse32_v_f32m1(c1, vout1x0123, vl1);
                }
                nc = 0;
            }
        } while (nc != 0);
    }
}
