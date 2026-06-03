#pragma once
// NEON FP<->int convert (round modes, fixed-point) + round-to-integral
#include "nhelp.hpp"
namespace salt_cvc5 {

inline int32x2_t vcvt_s32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,1), 32);
    return int32x2_t(tm, _nres);
}
inline int32_t vcvts_s32_f32(float32_t a) { return {}; }
inline int64_t vcvts_s64_f32(float32_t a) { return {}; }
inline int64x1_t vcvt_s64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,1), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vcvtq_s64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,1), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vcvtd_s32_f64(float64_t a) { return {}; }
inline int64_t vcvtd_s64_f64(float64_t a) { return {}; }
inline int32x2_t vcvt_n_s32_f32(const float32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),32), mk_fpc(tm, std::ldexp(1.0,n), 32)), rm_of(tm,1), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vcvtq_n_s32_f32(const float32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),32), mk_fpc(tm, std::ldexp(1.0,n), 32)), rm_of(tm,1), 32);
    return int32x4_t(tm, _nres);
}
inline int32_t vcvts_n_s32_f32(float32_t a, const int n) { return {}; }
inline int64x1_t vcvt_n_s64_f64(const float64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_sint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),64), mk_fpc(tm, std::ldexp(1.0,n), 64)), rm_of(tm,1), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vcvtq_n_s64_f64(const float64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),64), mk_fpc(tm, std::ldexp(1.0,n), 64)), rm_of(tm,1), 64);
    return int64x2_t(tm, _nres);
}
inline int64_t vcvtd_n_s64_f64(float64_t a, const int n) { return {}; }
inline int16_t vcvth_s16_f16(float16_t a) { return {}; }
inline int32_t vcvth_s32_f16(float16_t a) { return {}; }
inline int64_t vcvth_s64_f16(float16_t a) { return {}; }
inline int16_t vcvth_n_s16_f16(float16_t a, const int n) { return {}; }
inline int32_t vcvth_n_s32_f16(float16_t a, const int n) { return {}; }
inline int64_t vcvth_n_s64_f16(float16_t a, const int n) { return {}; }
inline int16x4_t vcvt_s16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,1), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vcvtq_s16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,1), 16);
    return int16x8_t(tm, _nres);
}
inline uint16x4_t vcvt_u16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,1), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcvtq_u16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,1), 16);
    return uint16x8_t(tm, _nres);
}
inline int16x4_t vcvt_n_s16_f16(const float16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),16), mk_fpc(tm, std::ldexp(1.0,n), 16)), rm_of(tm,1), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vcvtq_n_s16_f16(const float16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_sint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),16), mk_fpc(tm, std::ldexp(1.0,n), 16)), rm_of(tm,1), 16);
    return int16x8_t(tm, _nres);
}
inline uint32x2_t vcvt_u32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,1), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcvtq_u32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,1), 32);
    return uint32x4_t(tm, _nres);
}
inline uint32_t vcvts_u32_f32(float32_t a) { return {}; }
inline uint64_t vcvts_u64_f32(float32_t a) { return {}; }
inline uint64x1_t vcvt_u64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,1), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcvtq_u64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,1), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcvtd_u32_f64(float64_t a) { return {}; }
inline uint64_t vcvtd_u64_f64(float64_t a) { return {}; }
inline uint32x2_t vcvt_n_u32_f32(const float32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),32), mk_fpc(tm, std::ldexp(1.0,n), 32)), rm_of(tm,1), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcvtq_n_u32_f32(const float32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),32), mk_fpc(tm, std::ldexp(1.0,n), 32)), rm_of(tm,1), 32);
    return uint32x4_t(tm, _nres);
}
inline uint32_t vcvts_n_u32_f32(float32_t a, const int n) { return {}; }
inline uint64x1_t vcvt_n_u64_f64(const float64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_uint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),64), mk_fpc(tm, std::ldexp(1.0,n), 64)), rm_of(tm,1), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcvtq_n_u64_f64(const float64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),64), mk_fpc(tm, std::ldexp(1.0,n), 64)), rm_of(tm,1), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcvtd_n_u64_f64(float64_t a, const int n) { return {}; }
inline uint16_t vcvth_u16_f16(float16_t a) { return {}; }
inline uint32_t vcvth_u32_f16(float16_t a) { return {}; }
inline uint64_t vcvth_u64_f16(float16_t a) { return {}; }
inline uint16_t vcvth_n_u16_f16(float16_t a, const int n) { return {}; }
inline uint32_t vcvth_n_u32_f16(float16_t a, const int n) { return {}; }
inline uint64_t vcvth_n_u64_f16(float16_t a, const int n) { return {}; }
inline uint16x4_t vcvt_n_u16_f16(const float16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),16), mk_fpc(tm, std::ldexp(1.0,n), 16)), rm_of(tm,1), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcvtq_n_u16_f16(const float16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_uint(tm, nfp_mul(tm, lane_to_fp(tm,a.getLane(i),16), mk_fpc(tm, std::ldexp(1.0,n), 16)), rm_of(tm,1), 16);
    return uint16x8_t(tm, _nres);
}
inline int32x2_t vcvtn_s32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,0), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vcvtnq_s32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,0), 32);
    return int32x4_t(tm, _nres);
}
inline int32_t vcvtns_s32_f32(float32_t a) { return {}; }
inline int64_t vcvtns_s64_f32(float32_t a) { return {}; }
inline int64x1_t vcvtn_s64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,0), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vcvtnq_s64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,0), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vcvtnd_s32_f64(float64_t a) { return {}; }
inline int64_t vcvtnd_s64_f64(float64_t a) { return {}; }
inline int16_t vcvtnh_s16_f16(float16_t a) { return {}; }
inline int32_t vcvtnh_s32_f16(float16_t a) { return {}; }
inline int64_t vcvtnh_s64_f16(float16_t a) { return {}; }
inline int16x4_t vcvtn_s16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,0), 16);
    return int16x4_t(tm, _nres);
}
inline uint32x2_t vcvtn_u32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,0), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcvtnq_u32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,0), 32);
    return uint32x4_t(tm, _nres);
}
inline uint32_t vcvtns_u32_f32(float32_t a) { return {}; }
inline uint64_t vcvtns_u64_f32(float32_t a) { return {}; }
inline uint64x1_t vcvtn_u64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,0), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcvtnq_u64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,0), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcvtnd_u32_f64(float64_t a) { return {}; }
inline uint64_t vcvtnd_u64_f64(float64_t a) { return {}; }
inline uint16_t vcvtnh_u16_f16(float16_t a) { return {}; }
inline uint32_t vcvtnh_u32_f16(float16_t a) { return {}; }
inline uint64_t vcvtnh_u64_f16(float16_t a) { return {}; }
inline uint16x4_t vcvtn_u16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,0), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcvtnq_u16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,0), 16);
    return uint16x8_t(tm, _nres);
}
inline int32x2_t vcvtm_s32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,3), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vcvtmq_s32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,3), 32);
    return int32x4_t(tm, _nres);
}
inline int32_t vcvtms_s32_f32(float32_t a) { return {}; }
inline int64_t vcvtms_s64_f32(float32_t a) { return {}; }
inline int64x1_t vcvtm_s64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,3), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vcvtmq_s64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,3), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vcvtmd_s32_f64(float64_t a) { return {}; }
inline int64_t vcvtmd_s64_f64(float64_t a) { return {}; }
inline int16_t vcvtmh_s16_f16(float16_t a) { return {}; }
inline int32_t vcvtmh_s32_f16(float16_t a) { return {}; }
inline int64_t vcvtmh_s64_f16(float16_t a) { return {}; }
inline int16x4_t vcvtm_s16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,3), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vcvtmq_s16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,3), 16);
    return int16x8_t(tm, _nres);
}
inline uint32x2_t vcvtm_u32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,3), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcvtmq_u32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,3), 32);
    return uint32x4_t(tm, _nres);
}
inline uint32_t vcvtms_u32_f32(float32_t a) { return {}; }
inline uint64_t vcvtms_u64_f32(float32_t a) { return {}; }
inline uint64x1_t vcvtm_u64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,3), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcvtmq_u64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,3), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcvtmd_u32_f64(float64_t a) { return {}; }
inline uint64_t vcvtmd_u64_f64(float64_t a) { return {}; }
inline uint16_t vcvtmh_u16_f16(float16_t a) { return {}; }
inline uint32_t vcvtmh_u32_f16(float16_t a) { return {}; }
inline uint64_t vcvtmh_u64_f16(float16_t a) { return {}; }
inline uint16x4_t vcvtm_u16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,3), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcvtmq_u16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,3), 16);
    return uint16x8_t(tm, _nres);
}
inline int32x2_t vcvtp_s32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,2), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vcvtpq_s32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,2), 32);
    return int32x4_t(tm, _nres);
}
inline int32_t vcvtps_s32_f32(float32_t a) { return {}; }
inline int64_t vcvtps_s64_f32(float32_t a) { return {}; }
inline int64x1_t vcvtp_s64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,2), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vcvtpq_s64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,2), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vcvtpd_s32_f64(float64_t a) { return {}; }
inline int64_t vcvtpd_s64_f64(float64_t a) { return {}; }
inline int16_t vcvtph_s16_f16(float16_t a) { return {}; }
inline int32_t vcvtph_s32_f16(float16_t a) { return {}; }
inline int64_t vcvtph_s64_f16(float16_t a) { return {}; }
inline int16x4_t vcvtp_s16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,2), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vcvtpq_s16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,2), 16);
    return int16x8_t(tm, _nres);
}
inline uint32x2_t vcvtp_u32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,2), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcvtpq_u32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,2), 32);
    return uint32x4_t(tm, _nres);
}
inline uint32_t vcvtps_u32_f32(float32_t a) { return {}; }
inline uint64_t vcvtps_u64_f32(float32_t a) { return {}; }
inline uint64x1_t vcvtp_u64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,2), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcvtpq_u64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,2), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcvtpd_u32_f64(float64_t a) { return {}; }
inline uint64_t vcvtpd_u64_f64(float64_t a) { return {}; }
inline uint16_t vcvtph_u16_f16(float16_t a) { return {}; }
inline uint32_t vcvtph_u32_f16(float16_t a) { return {}; }
inline uint64_t vcvtph_u64_f16(float16_t a) { return {}; }
inline uint16x4_t vcvtp_u16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,2), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcvtpq_u16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,2), 16);
    return uint16x8_t(tm, _nres);
}
inline int32x2_t vcvta_s32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,4), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vcvtaq_s32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,4), 32);
    return int32x4_t(tm, _nres);
}
inline int32_t vcvtas_s32_f32(float32_t a) { return {}; }
inline int64_t vcvtas_s64_f32(float32_t a) { return {}; }
inline int64x1_t vcvta_s64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,4), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vcvtaq_s64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,4), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vcvtad_s32_f64(float64_t a) { return {}; }
inline int64_t vcvtad_s64_f64(float64_t a) { return {}; }
inline int16_t vcvtah_s16_f16(float16_t a) { return {}; }
inline int32_t vcvtah_s32_f16(float16_t a) { return {}; }
inline int64_t vcvtah_s64_f16(float16_t a) { return {}; }
inline int16x4_t vcvta_s16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,4), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vcvtaq_s16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_sint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,4), 16);
    return int16x8_t(tm, _nres);
}
inline uint32x2_t vcvta_u32_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,4), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcvtaq_u32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,4), 32);
    return uint32x4_t(tm, _nres);
}
inline uint32_t vcvtas_u32_f32(float32_t a) { return {}; }
inline uint64_t vcvtas_u64_f32(float32_t a) { return {}; }
inline uint64x1_t vcvta_u64_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,4), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcvtaq_u64_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,4), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcvtad_u32_f64(float64_t a) { return {}; }
inline uint64_t vcvtad_u64_f64(float64_t a) { return {}; }
inline uint16_t vcvtah_u16_f16(float16_t a) { return {}; }
inline uint32_t vcvtah_u32_f16(float16_t a) { return {}; }
inline uint64_t vcvtah_u64_f16(float16_t a) { return {}; }
inline uint16x4_t vcvta_u16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,4), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcvtaq_u16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_uint(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,4), 16);
    return uint16x8_t(tm, _nres);
}
inline float32x2_t vcvt_f32_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),32), 32);
    return float32x2_t(tm, _nres);
}
inline float32_t vcvts_f32_s32(int32_t a) { return {}; }
inline float64x1_t vcvt_f64_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),64), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vcvtq_f64_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),64), 64);
    return float64x2_t(tm, _nres);
}
inline float64_t vcvtd_f64_s64(int64_t a) { return {}; }
inline float32x2_t vcvt_n_f32_s32(const int32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),32), mk_fpc(tm, std::ldexp(1.0,n), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vcvtq_n_f32_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),32), mk_fpc(tm, std::ldexp(1.0,n), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float32_t vcvts_n_f32_s32(int32_t a, const int n) { return {}; }
inline float64x1_t vcvt_n_f64_s64(const int64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),64), mk_fpc(tm, std::ldexp(1.0,n), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vcvtq_n_f64_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),64), mk_fpc(tm, std::ldexp(1.0,n), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float64_t vcvtd_n_f64_s64(int64_t a, const int n) { return {}; }
inline float16_t vcvth_f16_s16(int16_t a) { return {}; }
inline float16_t vcvth_f16_s32(int32_t a) { return {}; }
inline float16_t vcvth_f16_s64(int64_t a) { return {}; }
inline float16_t vcvth_n_f16_s16(int16_t a, const int n) { return {}; }
inline float16_t vcvth_n_f16_s32(int32_t a, const int n) { return {}; }
inline float16_t vcvth_n_f16_s64(int64_t a, const int n) { return {}; }
inline float16x4_t vcvt_f16_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),16), 16);
    return float16x4_t(tm, _nres);
}
inline float16x4_t vcvt_n_f16_s16(const int16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),16), mk_fpc(tm, std::ldexp(1.0,n), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vcvtq_n_f16_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, sint_to_fp(tm,a.getLane(i),rm_of(tm,0),16), mk_fpc(tm, std::ldexp(1.0,n), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vcvt_f32_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),32), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vcvtq_f32_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),32), 32);
    return float32x4_t(tm, _nres);
}
inline float32_t vcvts_f32_u32(uint32_t a) { return {}; }
inline float64x1_t vcvt_f64_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),64), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vcvtq_f64_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),64), 64);
    return float64x2_t(tm, _nres);
}
inline float64_t vcvtd_f64_u64(uint64_t a) { return {}; }
inline float32x2_t vcvt_n_f32_u32(const uint32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),32), mk_fpc(tm, std::ldexp(1.0,n), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vcvtq_n_f32_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),32), mk_fpc(tm, std::ldexp(1.0,n), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float32_t vcvts_n_f32_u32(uint32_t a, const int n) { return {}; }
inline float64x1_t vcvt_n_f64_u64(const uint64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),64), mk_fpc(tm, std::ldexp(1.0,n), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vcvtq_n_f64_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),64), mk_fpc(tm, std::ldexp(1.0,n), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float64_t vcvtd_n_f64_u64(uint64_t a, const int n) { return {}; }
inline float16_t vcvth_f16_u16(uint16_t a) { return {}; }
inline float16_t vcvth_f16_u32(uint32_t a) { return {}; }
inline float16_t vcvth_f16_u64(uint64_t a) { return {}; }
inline float16_t vcvth_n_f16_u16(uint16_t a, const int n) { return {}; }
inline float16_t vcvth_n_f16_u32(uint32_t a, const int n) { return {}; }
inline float16_t vcvth_n_f16_u64(uint64_t a, const int n) { return {}; }
inline float16x4_t vcvt_f16_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),16), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vcvtq_f16_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),16), 16);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vcvt_n_f16_u16(const uint16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),16), mk_fpc(tm, std::ldexp(1.0,n), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vcvtq_n_f16_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm, uint_to_fp(tm,a.getLane(i),rm_of(tm,0),16), mk_fpc(tm, std::ldexp(1.0,n), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrndn_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrndnq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrndn_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrndnq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vrndns_f32(float32_t a) { return {}; }
inline float16_t vrndnh_f16(float16_t a) { return {}; }
inline float16x4_t vrndn_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrndnq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrndm_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,3), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrndmq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,3), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrndm_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,3), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrndmq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,3), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vrndmh_f16(float16_t a) { return {}; }
inline float16x4_t vrndm_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,3), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrndmq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,3), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrndp_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,2), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrndpq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,2), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrndp_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,2), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrndpq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,2), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vrndph_f16(float16_t a) { return {}; }
inline float16x4_t vrndp_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,2), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrndpq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,2), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrnd_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrndq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrnd_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrndq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vrndh_f16(float16_t a) { return {}; }
inline float16x4_t vrnd_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrndq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrnda_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,4), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrndaq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,4), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrnda_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,4), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrndaq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,4), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vrndah_f16(float16_t a) { return {}; }
inline float16x4_t vrnda_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,4), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrndaq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,4), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrndi_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrndiq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrndi_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrndiq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vrndih_f16(float16_t a) { return {}; }
inline float16x4_t vrndi_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrndiq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrndx_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrndxq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrndx_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrndxq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vrndxh_f16(float16_t a) { return {}; }
inline float16x4_t vrndx_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrndxq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrnd32x_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrnd32xq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrnd32x_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrnd32xq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vrnd32z_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrnd32zq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrnd32z_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrnd32zq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vrnd64x_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrnd64xq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrnd64x_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrnd64xq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,0), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vrnd64z_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrnd64zq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrnd64z_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrnd64zq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_rti(tm, rm_of(tm,1), lane_to_fp(tm,a.getLane(i),64)), 64);
    return float64x2_t(tm, _nres);
}

} // namespace salt_cvc5
