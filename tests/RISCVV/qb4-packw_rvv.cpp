#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    static inline vint8m1_t xnn_packed2planar_rvv(
        vint32m1_t *vacc,
        vint8m1_t v,
        int8_t mask_val,
        size_t vl)
      {
        vint8m1_t vmask = vmv_v_x_i8m1(mask_val, vl);
        vint8m1_t vl_nibble = vand_vv_i8m1(v, vmask, vl);
        vint8m1_t vh_nibble = vsll_vx_i8m1(v, 4, vl);
      
        vint16m2_t vh_wide = vwcvt_x_x_v_i16m2(vh_nibble, vl);
        vint16m2_t vl_wide = vwcvt_x_x_v_i16m2(vl_nibble, vl);
      
        vint32m1_t sum_h = vwredsum_vs_i16m2_i32m1(vh_wide, vmv_v_x_i32m1(0, 1), vl);
        vint32m1_t sum_l = vwredsum_vs_i16m2_i32m1(vl_wide, vmv_v_x_i32m1(0, 1), vl);
        int32_t total = vmv_x_s_i32m1_i32(sum_h) + vmv_x_s_i32m1_i32(sum_l);
        int32_t old_acc = vmv_x_s_i32m1_i32(*vacc);
        *vacc = vmv_v_x_i32m1(old_acc + total, 4);
      
        static const uint8_t zip1_idx[16] = {0,16,1,17,2,18,3,19,4,20,5,21,6,22,7,23};
        static const uint8_t zip2_idx[16] = {8,24,9,25,10,26,11,27,12,28,13,29,14,30,15,31};
        static const uint8_t uzp1_idx[16] = {0,1,2,3,4,5,6,7,16,17,18,19,20,21,22,23};
        static const uint8_t uzp2_idx[16] = {8,9,10,11,12,13,14,15,24,25,26,27,28,29,30,31};
      
        vuint8m1_t vidx_zip1 = vle8_v_u8m1(zip1_idx, 16);
        vuint8m1_t vidx_zip2 = vle8_v_u8m1(zip2_idx, 16);
        vuint8m1_t vidx_uzp1 = vle8_v_u8m1(uzp1_idx, 16);
        vuint8m1_t vidx_uzp2 = vle8_v_u8m1(uzp2_idx, 16);
      
        vuint8m2_t combined = vundefined_u8m2();
        combined = vset_v_u8m1_u8m2(combined, 0, vreinterpret_v_i8m1_u8m1(vh_nibble));
        combined = vset_v_u8m1_u8m2(combined, 1, vreinterpret_v_i8m1_u8m1(vl_nibble));
      
        vuint8m1_t v01 = vrgather_vv_u8m1(vlmul_trunc_v_u8m2_u8m1(combined), vidx_zip1, 16);
        vuint8m1_t v23 = vrgather_vv_u8m1(vlmul_trunc_v_u8m2_u8m1(combined), vidx_zip2, 16);
      
        vuint8m2_t combined2 = vundefined_u8m2();
        combined2 = vset_v_u8m1_u8m2(combined2, 0, v01);
        combined2 = vset_v_u8m1_u8m2(combined2, 1, v23);
      
        vuint8m1_t v02 = vrgather_vv_u8m1(vlmul_trunc_v_u8m2_u8m1(combined2), vidx_uzp1, 16);
        vuint8m1_t v13 = vrgather_vv_u8m1(vlmul_trunc_v_u8m2_u8m1(combined2), vidx_uzp2, 16);
      
        vuint8m1_t vl02 = vsrl_vx_u8m1(v02, 4, 16);
        vuint8m1_t v0123 = vor_vv_u8m1(vl02, v13, 16);
      
        return vreinterpret_v_u8m1_i8m1(v0123);
      }
      
      void xnn_qb4_packw_gemm_goi_ukernel_x16c8__rvv(
        size_t g,
        size_t nc,
        size_t kc,
        size_t nr,
        size_t kr,
        size_t sr,
        size_t bl,
        const uint8_t* weights,
        const int32_t* bias,
        const void* scale,
        int8_t* packed_weights,
        size_t extra_bytes_bl,
        size_t extra_bytes_n,
        const void* params) XNN_OOB_READS
      {
        assert(g != 0);
        assert(nc != 0);
        assert(kc != 0);
        assert(nr == 16);
        assert(kr == 8);
        assert(sr == 1);
        assert(weights != NULL);
        assert(packed_weights != NULL);
        assert(extra_bytes_bl == nr * sizeof(uint16_t));
        assert(extra_bytes_n == nr * sizeof(float));
        assert(params != NULL);
        assert(kc % bl == 0);
      
        size_t num_blocks = kc / bl;
        size_t weight_stride = (kc >> 1);
        const int8_t mask_val = (int8_t)0xF0;
      
        uint8_t* out = (uint8_t*) packed_weights;
        const int32_t* b = (const int32_t*) bias;
        float vzeropoint = (float)(((const struct xnn_qs8_qc4w_packing_params*) params)->input_zero_point + 0);
        float vrecip_sixteen = 1.0f / 16.0f;
        const int8_t kzp = (int8_t)(((const struct xnn_qs8_qc4w_packing_params*) params)->kernel_zero_point);
        assert(kzp == 0 || kzp == 8);
        int8_t kernel_zp_val = kzp * 0x11;
      
        size_t vl16 = __riscv_vsetvl_e8m1(16);
      
        do {
          const int8_t* w0 = (const int8_t*) weights;
          const uint16_t* s0 = (const uint16_t*) scale;
          int n = nc;
      
          for (; n > 0; n -= 16) {
            float* packed_k_scaled_sum = (float*) out;
            float packed_k_scaled_sums[16] = {0};
            out += 16 * sizeof(float);
      
            const int8_t* w1 = w0 + weight_stride;
            const int8_t* w2 = w1 + weight_stride;
            const int8_t* w3 = w2 + weight_stride;
            const int8_t* w4 = w3 + weight_stride;
            const int8_t* w5 = w4 + weight_stride;
            const int8_t* w6 = w5 + weight_stride;
            const int8_t* w7 = w6 + weight_stride;
            const int8_t* w8 = w7 + weight_stride;
            const int8_t* w9 = w8 + weight_stride;
            const int8_t* w10 = w9 + weight_stride;
            const int8_t* w11 = w10 + weight_stride;
            const int8_t* w12 = w11 + weight_stride;
            const int8_t* w13 = w12 + weight_stride;
            const int8_t* w14 = w13 + weight_stride;
            const int8_t* w15 = w14 + weight_stride;
      
            const uint16_t* s1 = s0 + num_blocks;
            const uint16_t* s2 = s1 + num_blocks;
            const uint16_t* s3 = s2 + num_blocks;
            const uint16_t* s4 = s3 + num_blocks;
            const uint16_t* s5 = s4 + num_blocks;
            const uint16_t* s6 = s5 + num_blocks;
            const uint16_t* s7 = s6 + num_blocks;
            const uint16_t* s8 = s7 + num_blocks;
            const uint16_t* s9 = s8 + num_blocks;
            const uint16_t* s10 = s9 + num_blocks;
            const uint16_t* s11 = s10 + num_blocks;
            const uint16_t* s12 = s11 + num_blocks;
            const uint16_t* s13 = s12 + num_blocks;
            const uint16_t* s14 = s13 + num_blocks;
            const uint16_t* s15 = s14 + num_blocks;
      
            if XNN_UNLIKELY(n < 16) {
              if XNN_UNPREDICTABLE(n < 2) { w1 = w0; s1 = s0; }
              if XNN_UNPREDICTABLE(n <= 2) { w2 = w1; s2 = s1; }
              if XNN_UNPREDICTABLE(n < 4) { w3 = w2; s3 = s2; }
              if XNN_UNPREDICTABLE(n <= 4) { w4 = w3; s4 = s3; }
              if XNN_UNPREDICTABLE(n < 6) { w5 = w4; s5 = s4; }
              if XNN_UNPREDICTABLE(n <= 6) { w6 = w5; s6 = s5; }
              if XNN_UNPREDICTABLE(n < 8) { w7 = w6; s7 = s6; }
              if XNN_UNPREDICTABLE(n <= 8) { w8 = w7; s8 = s7; }
              if XNN_UNPREDICTABLE(n < 10) { w9 = w8; s9 = s8; }
              if XNN_UNPREDICTABLE(n <= 10) { w10 = w9; s10 = s9; }
              if XNN_UNPREDICTABLE(n < 12) { w11 = w10; s11 = s10; }
              if XNN_UNPREDICTABLE(n <= 12) { w12 = w11; s12 = s11; }
              if XNN_UNPREDICTABLE(n < 14) { w13 = w12; s13 = s12; }
              if XNN_UNPREDICTABLE(n <= 14) { w14 = w13; s14 = s13; }
              if XNN_UNPREDICTABLE(n < 16) { w15 = w14; s15 = s14; }
            }
      
            size_t kb = kc;
      
            for (; kb >= bl; kb -= bl) {
              vint32m1_t ksum[8];
              for (int i = 0; i < 8; i++) {
                ksum[i] = vmv_v_x_i32m1(0, 4);
              }
      
              size_t k = bl;
      
              for (; k >= 32; k -= 32) {
                vint8m1_t vkzp = vmv_v_x_i8m1(kernel_zp_val, vl16);
      
                vint8m1_t w0x01 = vxor_vv_i8m1(vle8_v_i8m1(w0, vl16), vkzp, vl16); w0 += 16;
                vint8m1_t w1x01 = vxor_vv_i8m1(vle8_v_i8m1(w1, vl16), vkzp, vl16); w1 += 16;
                vint8m1_t w2x01 = vxor_vv_i8m1(vle8_v_i8m1(w2, vl16), vkzp, vl16); w2 += 16;
                vint8m1_t w3x01 = vxor_vv_i8m1(vle8_v_i8m1(w3, vl16), vkzp, vl16); w3 += 16;
                vint8m1_t w4x01 = vxor_vv_i8m1(vle8_v_i8m1(w4, vl16), vkzp, vl16); w4 += 16;
                vint8m1_t w5x01 = vxor_vv_i8m1(vle8_v_i8m1(w5, vl16), vkzp, vl16); w5 += 16;
                vint8m1_t w6x01 = vxor_vv_i8m1(vle8_v_i8m1(w6, vl16), vkzp, vl16); w6 += 16;
                vint8m1_t w7x01 = vxor_vv_i8m1(vle8_v_i8m1(w7, vl16), vkzp, vl16); w7 += 16;
                vint8m1_t w8x01 = vxor_vv_i8m1(vle8_v_i8m1(w8, vl16), vkzp, vl16); w8 += 16;
                vint8m1_t w9x01 = vxor_vv_i8m1(vle8_v_i8m1(w9, vl16), vkzp, vl16); w9 += 16;
                vint8m1_t w10x01 = vxor_vv_i8m1(vle8_v_i8m1(w10, vl16), vkzp, vl16); w10 += 16;
                vint8m1_t w11x01 = vxor_vv_i8m1(vle8_v_i8m1(w11, vl16), vkzp, vl16); w11 += 16;
                vint8m1_t w12x01 = vxor_vv_i8m1(vle8_v_i8m1(w12, vl16), vkzp, vl16); w12 += 16;
                vint8m1_t w13x01 = vxor_vv_i8m1(vle8_v_i8m1(w13, vl16), vkzp, vl16); w13 += 16;
                vint8m1_t w14x01 = vxor_vv_i8m1(vle8_v_i8m1(w14, vl16), vkzp, vl16); w14 += 16;
                vint8m1_t w15x01 = vxor_vv_i8m1(vle8_v_i8m1(w15, vl16), vkzp, vl16); w15 += 16;
      
                static const uint8_t zip1_64_idx[16] = {0,1,2,3,4,5,6,7,16,17,18,19,20,21,22,23};
                static const uint8_t zip2_64_idx[16] = {8,9,10,11,12,13,14,15,24,25,26,27,28,29,30,31};
      
                vuint8m1_t vidx_z1 = vle8_v_u8m1(zip1_64_idx, 16);
                vuint8m1_t vidx_z2 = vle8_v_u8m1(zip2_64_idx, 16);
      
                #define INTERLEAVE_64(a, b, out0, out1) do { \
                  vuint8m2_t _comb = vundefined_u8m2(); \
                  _comb = vset_v_u8m1_u8m2(_comb, 0, vreinterpret_v_i8m1_u8m1(a)); \
                  _comb = vset_v_u8m1_u8m2(_comb, 1, vreinterpret_v_i8m1_u8m1(b)); \
                  out0 = vreinterpret_v_u8m1_i8m1(vrgather_vv_u8m1(vlmul_trunc_v_u8m2_u8m1(_comb), vidx_z1, 16)); \
                  out1 = vreinterpret_v_u8m1_i8m1(vrgather_vv_u8m1(vlmul_trunc_v_u8m2_u8m1(_comb), vidx_z2, 16)); \
                } while(0)
      
                vint8m1_t v01_0, v01_1, v23_0, v23_1, v45_0, v45_1, v67_0, v67_1;
                vint8m1_t v89_0, v89_1, v1011_0, v1011_1, v1213_0, v1213_1, v1415_0, v1415_1;
      
                INTERLEAVE_64(w0x01, w1x01, v01_0, v01_1);
                INTERLEAVE_64(w2x01, w3x01, v23_0, v23_1);
                INTERLEAVE_64(w4x01, w5x01, v45_0, v45_1);
                INTERLEAVE_64(w6x01, w7x01, v67_0, v67_1);
                INTERLEAVE_64(w8x01, w9x01, v89_0, v89_1);
                INTERLEAVE_64(w10x01, w11x01, v1011_0, v1011_1);
                INTERLEAVE_64(w12x01, w13x01, v1213_0, v1213_1);
                INTERLEAVE_64(w14x01, w15x01, v1415_0, v1415_1);
      
                v01_0 = xnn_packed2planar_rvv(&ksum[0], v01_0, mask_val, vl16);
                v23_0 = xnn_packed2planar_rvv(&ksum[1], v23_0, mask_val, vl16);
                v45_0 = xnn_packed2planar_rvv(&ksum[2], v45_0, mask_val, vl16);
                v67_0 = xnn_packed2planar_rvv(&ksum[3], v67_0, mask_val, vl16);
                v89_0 = xnn_packed2planar_rvv(&ksum[4], v89_0, mask_val, vl16);
                v1011_0 = xnn_packed2planar_rvv(&ksum[5], v1011_0, mask_val, vl16);
                v1213_0 = xnn_packed2planar_rvv(&ksum[6], v1213_0, mask_val, vl16);
                v1415_0 = xnn_packed2planar_rvv(&ksum[7], v1415_0, mask_val, vl16);
                v01_1 = xnn_packed2planar_rvv(&ksum[0], v01_1, mask_val, vl16);
                v23_1 = xnn_packed2planar_rvv(&ksum[1], v23_1, mask_val, vl16);
                v45_1 = xnn_packed2planar_rvv(&ksum[2], v45_1, mask_val, vl16);
                v67_1 = xnn_packed2planar_rvv(&ksum[3], v67_1, mask_val, vl16);
                v89_1 = xnn_packed2planar_rvv(&ksum[4], v89_1, mask_val, vl16);
                v1011_1 = xnn_packed2planar_rvv(&ksum[5], v1011_1, mask_val, vl16);
                v1213_1 = xnn_packed2planar_rvv(&ksum[6], v1213_1, mask_val, vl16);
                v1415_1 = xnn_packed2planar_rvv(&ksum[7], v1415_1, mask_val, vl16);
      
                vse8_v_i8m1((int8_t*)&out[0], v01_0, vl16);
                vse8_v_i8m1((int8_t*)&out[16], v23_0, vl16);
                vse8_v_i8m1((int8_t*)&out[32], v45_0, vl16);
                vse8_v_i8m1((int8_t*)&out[48], v67_0, vl16);
                vse8_v_i8m1((int8_t*)&out[64], v89_0, vl16);
                vse8_v_i8m1((int8_t*)&out[80], v1011_0, vl16);
                vse8_v_i8m1((int8_t*)&out[96], v1213_0, vl16);
                vse8_v_i8m1((int8_t*)&out[112], v1415_0, vl16);
                vse8_v_i8m1((int8_t*)&out[128], v01_1, vl16);
                vse8_v_i8m1((int8_t*)&out[144], v23_1, vl16);
                vse8_v_i8m1((int8_t*)&out[160], v45_1, vl16);
                vse8_v_i8m1((int8_t*)&out[176], v67_1, vl16);
                vse8_v_i8m1((int8_t*)&out[192], v89_1, vl16);
                vse8_v_i8m1((int8_t*)&out[208], v1011_1, vl16);
                vse8_v_i8m1((int8_t*)&out[224], v1213_1, vl16);
                vse8_v_i8m1((int8_t*)&out[240], v1415_1, vl16);
      
                out += 256;
              }
      
              uint16_t bf_scales_arr[16];
              bf_scales_arr[0] = s0[0]; bf_scales_arr[1] = s1[0];
              bf_scales_arr[2] = s2[0]; bf_scales_arr[3] = s3[0];
              bf_scales_arr[4] = s4[0]; bf_scales_arr[5] = s5[0];
              bf_scales_arr[6] = s6[0]; bf_scales_arr[7] = s7[0];
              bf_scales_arr[8] = s8[0]; bf_scales_arr[9] = s9[0];
              bf_scales_arr[10] = s10[0]; bf_scales_arr[11] = s11[0];
              bf_scales_arr[12] = s12[0]; bf_scales_arr[13] = s13[0];
              bf_scales_arr[14] = s14[0]; bf_scales_arr[15] = s15[0];
      
              float f_scales_arr[16];
              for (int i = 0; i < 16; i++) {
                uint32_t tmp = (uint32_t)bf_scales_arr[i] << 16;
                float* fp = (float*)&tmp;
                f_scales_arr[i] = *fp * vrecip_sixteen;
              }
      
              s0 += 1; s1 += 1; s2 += 1; s3 += 1;
              s4 += 1; s5 += 1; s6 += 1; s7 += 1;
              s8 += 1; s9 += 1; s10 += 1; s11 += 1;
              s12 += 1; s13 += 1; s14 += 1; s15 += 1;
      
              int32_t ksum_pairs[16];
              for (int i = 0; i < 8; i++) {
                int32_t v0 = vmv_x_s_i32m1_i32(ksum[i]);
                int32_t v1 = vmv_x_s_i32m1_i32(vslide1down_vx_i32m1(ksum[i], 0, 4));
                ksum_pairs[i*2] = v0 + v1;
                ksum_pairs[i*2+1] = vmv_x_s_i32m1_i32(vslide1down_vx_i32m1(ksum[i], 0, 4));
              }
      
              for (int i = 0; i < 8; i++) {
                int32_t sum0 = vmv_x_s_i32m1_i32(ksum[i]);
                vint32m1_t shifted = vslidedown_vx_i32m1(ksum[i], 2, 4);
                int32_t sum1 = vmv_x_s_i32m1_i32(shifted);
                float f_ksum0 = (float)(sum0) * vzeropoint;
                float f_ksum1 = (float)(sum1) * vzeropoint;
                packed_k_scaled_sums[i*2] -= f_ksum0 * f_scales_arr[i*2];
                packed_k_scaled_sums[i*2+1] -= f_ksum1 * f_scales_arr[i*2+1];
              }
      
              size_t vl4 = __riscv_vsetvl_e32m1(4);
              vse32_v_f32m1(&packed_k_scaled_sum[0], vle32_v_f32m1(&packed_k_scaled_sums[0], vl4), vl4);
              vse32_v_f32m1(&packed_k_scaled_sum[4], vle32_v_f32m1(&packed_k_scaled_sums[4], vl4), vl4);
              vse32_v_f32m1(&packed_k_scaled_sum[8], vle32_v_f32m1(&packed_k_scaled_sums[8], vl4), vl4);
              vse32_v_f32m1(&packed_k_scaled_sum[12], vle32_v_f32m1(&packed_k_scaled_sums[12], vl4), vl4);
      
              uint16_t out_scales[16];
              for (int i = 0; i < 16; i++) {
                uint32_t* fp = (uint32_t*)&f_scales_arr[i];
                out_scales[i] = (uint16_t)(*fp >> 16);
              }
      
              size_t vl8 = __riscv_vsetvl_e16m1(8);
              vse16_v_u16m1((uint16_t*)out, vle16_v_u16m1(&out_scales[0], vl8), vl8);
              vse16_v_u16m1((uint16_t*)out + 8, vle16_v_u16m1(&out_scales[8], vl8), vl8);
      
              out += 16 * sizeof(uint16_t);
            }
      
            if XNN_LIKELY(b != NULL) {
              size_t vl4 = __riscv_vsetvl_e32m1(4);
              vse32_v_i32m1((int32_t*)out + 0, vle32_v_i32m1(&b[0], vl4), vl4);
              vse32_v_i32m1((int32_t*)out + 4, vle32_v_i32m1(&b[4], vl4), vl4);
              vse32_v_i32m1((int32_t*)out + 8, vle32_v_i32m1(&b[8], vl4), vl4);
              vse32_v_i32m1((int32_t*)out + 12, vle32_v_i32m1(&b[12], vl4), vl4);
              b += 16;
            } else {
              size_t vl4 = __riscv_vsetvl_e32m1(4);
              vint32m1_t vzero = vmv_v_x_i32m1(0, vl4);
              vse32_v_i32m1((int32_t*)out + 0, vzero, vl4);
              vse32_v_i32m1((int32_t*)out + 4, vzero, vl4);
              vse32_v_i32m1((int32_t*)out + 8, vzero, vl4);
              vse32_v_i32m1((int32_t*)out + 12, vzero, vl4);
            }
            out += 16 * sizeof(uint32_t);
            w0 = w15;
            s0 = s15;
          }
        } while (--g != 0);
      }
}
