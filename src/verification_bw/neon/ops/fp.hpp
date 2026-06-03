#pragma once
// NEON FP arith/compare/fma/pairwise + float dup/mov/set (estimates modeled exact)
#include "nhelp.hpp"
namespace salt {

inline float64x1_t vadd_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vaddq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vaddh_f16(float16_t a, float16_t b) { return {}; }
inline float64x1_t vsub_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vsubq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vsubh_f16(float16_t a, float16_t b) { return {}; }
inline float64x1_t vmul_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmulq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vmul_n_f32(const float32x2_t& a, float32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),mk_fpc32(tm, b)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vmul_n_f64(const float64x1_t& a, float64_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),mk_fpc64(tm, b)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmulq_n_f64(const float64x2_t& a, float64_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),mk_fpc64(tm, b)), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vmul_lane_f32(const float32x2_t& a, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vmul_lane_f64(const float64x1_t& a, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmulq_lane_f64(const float64x2_t& a, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vmuls_lane_f32(float32_t a, const float32x2_t& v, const int lane) { return {}; }
inline float64_t vmuld_lane_f64(float64_t a, const float64x1_t& v, const int lane) { return {}; }
inline float32x2_t vmul_laneq_f32(const float32x2_t& a, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmulq_laneq_f32(const float32x4_t& a, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vmul_laneq_f64(const float64x1_t& a, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmulq_laneq_f64(const float64x2_t& a, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vmuls_laneq_f32(float32_t a, const float32x4_t& v, const int lane) { return {}; }
inline float64_t vmuld_laneq_f64(float64_t a, const float64x2_t& v, const int lane) { return {}; }
inline float16_t vmulh_f16(float16_t a, float16_t b) { return {}; }
inline float16x4_t vmul_lane_f16(const float16x4_t& a, const float16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, v.getLane(lane), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vdiv_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vdiv_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vdivq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vdivh_f16(float16_t a, float16_t b) { return {}; }
inline float16x4_t vdiv_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vmulx_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmulxq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vmulx_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmulxq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vmulxs_f32(float32_t a, float32_t b) { return {}; }
inline float64_t vmulxd_f64(float64_t a, float64_t b) { return {}; }
inline float32x2_t vmulx_lane_f32(const float32x2_t& a, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmulxq_lane_f32(const float32x4_t& a, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vmulx_lane_f64(const float64x1_t& a, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmulxq_lane_f64(const float64x2_t& a, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vmulxs_lane_f32(float32_t a, const float32x2_t& v, const int lane) { return {}; }
inline float64_t vmulxd_lane_f64(float64_t a, const float64x1_t& v, const int lane) { return {}; }
inline float32x2_t vmulx_laneq_f32(const float32x2_t& a, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmulxq_laneq_f32(const float32x4_t& a, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vmulx_laneq_f64(const float64x1_t& a, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmulxq_laneq_f64(const float64x2_t& a, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vmulxs_laneq_f32(float32_t a, const float32x4_t& v, const int lane) { return {}; }
inline float64_t vmulxd_laneq_f64(float64_t a, const float64x2_t& v, const int lane) { return {}; }
inline float16_t vmulxh_f16(float16_t a, float16_t b) { return {}; }
inline float16x4_t vmulx_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vmulxq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vmulx_lane_f16(const float16x4_t& a, const float16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, v.getLane(lane), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float64x1_t vmin_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_min(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vminq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_min(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vminh_f16(float16_t a, float16_t b) { return {}; }
inline float64x1_t vmax_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_max(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmaxq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_max(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vmaxh_f16(float16_t a, float16_t b) { return {}; }
inline float32x2_t vminnm_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_minnm(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vminnm_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_minnm(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vminnmq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_minnm(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vminnmh_f16(float16_t a, float16_t b) { return {}; }
inline float16x4_t vminnm_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_minnm(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vmaxnm_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_maxnm(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vmaxnm_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_maxnm(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmaxnmq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_maxnm(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vmaxnmh_f16(float16_t a, float16_t b) { return {}; }
inline float16x4_t vmaxnm_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_maxnm(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vabd_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vabdq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vabd_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64))), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vabdq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64))), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vabds_f32(float32_t a, float32_t b) { return {}; }
inline float64_t vabdd_f64(float64_t a, float64_t b) { return {}; }
inline float16_t vabdh_f16(float16_t a, float16_t b) { return {}; }
inline float16x4_t vabd_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16))), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vabdq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16))), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrecps_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,mk_fpc(tm,2.0,32),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vrecps_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,mk_fpc(tm,2.0,64),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64))), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrecpsq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,mk_fpc(tm,2.0,64),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64))), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vrecpss_f32(float32_t a, float32_t b) { return {}; }
inline float64_t vrecpsd_f64(float64_t a, float64_t b) { return {}; }
inline float16_t vrecpsh_f16(float16_t a, float16_t b) { return {}; }
inline float16x4_t vrecps_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,mk_fpc(tm,2.0,16),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16))), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrecpsq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,mk_fpc(tm,2.0,16),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16))), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrsqrts_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,nfp_sub(tm,mk_fpc(tm,3.0,32),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32))),mk_fpc(tm,0.5,32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrsqrtsq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,nfp_sub(tm,mk_fpc(tm,3.0,32),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 32),lane_to_fp(tm, b.getLane(i), 32))),mk_fpc(tm,0.5,32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrsqrts_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,nfp_sub(tm,mk_fpc(tm,3.0,64),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64))),mk_fpc(tm,0.5,64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrsqrtsq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,nfp_sub(tm,mk_fpc(tm,3.0,64),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 64),lane_to_fp(tm, b.getLane(i), 64))),mk_fpc(tm,0.5,64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vrsqrtss_f32(float32_t a, float32_t b) { return {}; }
inline float64_t vrsqrtsd_f64(float64_t a, float64_t b) { return {}; }
inline float16_t vrsqrtsh_f16(float16_t a, float16_t b) { return {}; }
inline float16x4_t vrsqrts_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,nfp_sub(tm,mk_fpc(tm,3.0,16),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16))),mk_fpc(tm,0.5,16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrsqrtsq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_mul(tm,nfp_sub(tm,mk_fpc(tm,3.0,16),nfp_mul(tm,lane_to_fp(tm, a.getLane(i), 16),lane_to_fp(tm, b.getLane(i), 16))),mk_fpc(tm,0.5,16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vneg_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_neg(tm,lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vneg_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_neg(tm,lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vnegq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_neg(tm,lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vnegh_f16(float16_t a) { return {}; }
inline float16x4_t vneg_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_neg(tm,lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vabs_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vabs_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vabsq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vabsh_f16(float16_t a) { return {}; }
inline float16x4_t vabs_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vsqrt_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vsqrt_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vsqrtq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16_t vsqrth_f16(float16_t a) { return {}; }
inline float16x4_t vsqrt_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vsqrtq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrecpe_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vrecpe_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrecpeq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vrecpes_f32(float32_t a) { return {}; }
inline float64_t vrecped_f64(float64_t a) { return {}; }
inline float16_t vrecpeh_f16(float16_t a) { return {}; }
inline float16x4_t vrecpe_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrecpeq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vrsqrte_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,32),nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrsqrteq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,32),nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vrsqrte_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,64),nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 64))), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vrsqrteq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,64),nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 64))), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vrsqrtes_f32(float32_t a) { return {}; }
inline float64_t vrsqrted_f64(float64_t a) { return {}; }
inline float16_t vrsqrteh_f16(float16_t a) { return {}; }
inline float16x4_t vrsqrte_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,16),nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 16))), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrsqrteq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_div(tm,mk_fpc(tm,1.0,16),nfp_sqrt(tm,lane_to_fp(tm, a.getLane(i), 16))), 16);
    return float16x8_t(tm, _nres);
}
inline float32_t vrecpxs_f32(float32_t a) { return {}; }
inline float64_t vrecpxd_f64(float64_t a) { return {}; }
inline float16_t vrecpxh_f16(float16_t a) { return {}; }
inline float32x2_t vfma_f32(const float32x2_t& a, const float32x2_t& b, const float32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, c.getLane(i), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x2_t vfmaq_f64(const float64x2_t& a, const float64x2_t& b, const float64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, c.getLane(i), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vfma_lane_f32(const float32x2_t& a, const float32x2_t& b, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmaq_lane_f32(const float32x4_t& a, const float32x4_t& b, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vfma_lane_f64(const float64x1_t& a, const float64x1_t& b, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vfmaq_lane_f64(const float64x2_t& a, const float64x2_t& b, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vfmas_lane_f32(float32_t a, float32_t b, const float32x2_t& v, const int lane) { return {}; }
inline float64_t vfmad_lane_f64(float64_t a, float64_t b, const float64x1_t& v, const int lane) { return {}; }
inline float32x2_t vfma_laneq_f32(const float32x2_t& a, const float32x2_t& b, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmaq_laneq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vfma_laneq_f64(const float64x1_t& a, const float64x1_t& b, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vfmaq_laneq_f64(const float64x2_t& a, const float64x2_t& b, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, v.getLane(lane), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vfmas_laneq_f32(float32_t a, float32_t b, const float32x4_t& v, const int lane) { return {}; }
inline float64_t vfmad_laneq_f64(float64_t a, float64_t b, const float64x2_t& v, const int lane) { return {}; }
inline float32x2_t vfma_n_f32(const float32x2_t& a, const float32x2_t& b, float32_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 32),mk_fpc32(tm, n),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmaq_n_f32(const float32x4_t& a, const float32x4_t& b, float32_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 32),mk_fpc32(tm, n),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vfmaq_n_f64(const float64x2_t& a, const float64x2_t& b, float64_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 64),mk_fpc64(tm, n),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16x8_t vfmaq_lane_f16(const float16x8_t& a, const float16x8_t& b, const float16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 16),lane_to_fp(tm, v.getLane(lane), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vfma_laneq_f16(const float16x4_t& a, const float16x4_t& b, const float16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 16),lane_to_fp(tm, v.getLane(lane), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vfmaq_laneq_f16(const float16x8_t& a, const float16x8_t& b, const float16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 16),lane_to_fp(tm, v.getLane(lane), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vfma_n_f16(const float16x4_t& a, const float16x4_t& b, float16_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 16),mk_fpc16(tm, n),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vfmaq_n_f16(const float16x8_t& a, const float16x8_t& b, float16_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 16),mk_fpc16(tm, n),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16_t vfmah_lane_f16(float16_t a, float16_t b, const float16x4_t& v, const int lane) { return {}; }
inline float16_t vfmah_laneq_f16(float16_t a, float16_t b, const float16x8_t& v, const int lane) { return {}; }
inline float16x8_t vmlaq_lane_f16(const float16x8_t& a, const float16x8_t& b, const float16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 16),lane_to_fp(tm, v.getLane(lane), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vfms_f32(const float32x2_t& a, const float32x2_t& b, const float32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 32)),lane_to_fp(tm, c.getLane(i), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float64x2_t vfmsq_f64(const float64x2_t& a, const float64x2_t& b, const float64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 64)),lane_to_fp(tm, c.getLane(i), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vfms_lane_f32(const float32x2_t& a, const float32x2_t& b, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 32)),lane_to_fp(tm, v.getLane(lane), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmsq_lane_f32(const float32x4_t& a, const float32x4_t& b, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 32)),lane_to_fp(tm, v.getLane(lane), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vfms_lane_f64(const float64x1_t& a, const float64x1_t& b, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 64)),lane_to_fp(tm, v.getLane(lane), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vfmsq_lane_f64(const float64x2_t& a, const float64x2_t& b, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 64)),lane_to_fp(tm, v.getLane(lane), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vfmss_lane_f32(float32_t a, float32_t b, const float32x2_t& v, const int lane) { return {}; }
inline float64_t vfmsd_lane_f64(float64_t a, float64_t b, const float64x1_t& v, const int lane) { return {}; }
inline float32x2_t vfms_laneq_f32(const float32x2_t& a, const float32x2_t& b, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 32)),lane_to_fp(tm, v.getLane(lane), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmsq_laneq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 32)),lane_to_fp(tm, v.getLane(lane), 32),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x1_t vfms_laneq_f64(const float64x1_t& a, const float64x1_t& b, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 64)),lane_to_fp(tm, v.getLane(lane), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vfmsq_laneq_f64(const float64x2_t& a, const float64x2_t& b, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 64)),lane_to_fp(tm, v.getLane(lane), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vfmss_laneq_f32(float32_t a, float32_t b, const float32x4_t& v, const int lane) { return {}; }
inline float64_t vfmsd_laneq_f64(float64_t a, float64_t b, const float64x2_t& v, const int lane) { return {}; }
inline float32x2_t vfms_n_f32(const float32x2_t& a, const float32x2_t& b, float32_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 32)),mk_fpc32(tm, n),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmsq_n_f32(const float32x4_t& a, const float32x4_t& b, float32_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 32)),mk_fpc32(tm, n),lane_to_fp(tm, a.getLane(i), 32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vfmsq_n_f64(const float64x2_t& a, const float64x2_t& b, float64_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 64)),mk_fpc64(tm, n),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x2_t(tm, _nres);
}
inline float16x4_t vfms_f16(const float16x4_t& a, const float16x4_t& b, const float16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 16)),lane_to_fp(tm, c.getLane(i), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vfmsq_f16(const float16x8_t& a, const float16x8_t& b, const float16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 16)),lane_to_fp(tm, c.getLane(i), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vfms_lane_f16(const float16x4_t& a, const float16x4_t& b, const float16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 16)),lane_to_fp(tm, v.getLane(lane), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vfmsq_lane_f16(const float16x8_t& a, const float16x8_t& b, const float16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 16)),lane_to_fp(tm, v.getLane(lane), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vfms_laneq_f16(const float16x4_t& a, const float16x4_t& b, const float16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 16)),lane_to_fp(tm, v.getLane(lane), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vfmsq_laneq_f16(const float16x8_t& a, const float16x8_t& b, const float16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 16)),lane_to_fp(tm, v.getLane(lane), 16),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vfms_n_f16(const float16x4_t& a, const float16x4_t& b, float16_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 16)),mk_fpc16(tm, n),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vfmsq_n_f16(const float16x8_t& a, const float16x8_t& b, float16_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 16)),mk_fpc16(tm, n),lane_to_fp(tm, a.getLane(i), 16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16_t vfmsh_lane_f16(float16_t a, float16_t b, const float16x4_t& v, const int lane) { return {}; }
inline float16_t vfmsh_laneq_f16(float16_t a, float16_t b, const float16x8_t& v, const int lane) { return {}; }
inline float64x1_t vfma_f64(const float64x1_t& a, const float64x1_t& b, const float64x1_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, c.getLane(i), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x1_t vfma_n_f64(const float64x1_t& a, const float64x1_t& b, float64_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,lane_to_fp(tm, b.getLane(i), 64),mk_fpc64(tm, n),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float16_t vfmah_f16(float16_t a, float16_t b, float16_t c) { return {}; }
inline float64x1_t vfms_f64(const float64x1_t& a, const float64x1_t& b, const float64x1_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 64)),lane_to_fp(tm, c.getLane(i), 64),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float64x1_t vfms_n_f64(const float64x1_t& a, const float64x1_t& b, float64_t n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm, b.getLane(i), 64)),mk_fpc64(tm, n),lane_to_fp(tm, a.getLane(i), 64)), 64);
    return float64x1_t(tm, _nres);
}
inline float16_t vfmsh_f16(float16_t a, float16_t b, float16_t c) { return {}; }
inline float64x1_t vmla_f64(const float64x1_t& a, const float64x1_t& b, const float64x1_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 64),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, c.getLane(i), 64))), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmlaq_f64(const float64x2_t& a, const float64x2_t& b, const float64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 64),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, c.getLane(i), 64))), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vmls_f32(const float32x2_t& a, const float32x2_t& b, const float32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, c.getLane(i), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vmls_f64(const float64x1_t& a, const float64x1_t& b, const float64x1_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 64),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, c.getLane(i), 64))), 64);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmlsq_f64(const float64x2_t& a, const float64x2_t& b, const float64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 64),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 64),lane_to_fp(tm, c.getLane(i), 64))), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vmla_lane_f32(const float32x2_t& a, const float32x2_t& b, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x2_t vmla_laneq_f32(const float32x2_t& a, const float32x2_t& b, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmlaq_laneq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vmls_lane_f32(const float32x2_t& a, const float32x2_t& b, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmlsq_lane_f32(const float32x4_t& a, const float32x4_t& b, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vmls_laneq_f32(const float32x2_t& a, const float32x2_t& b, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmlsq_laneq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),lane_to_fp(tm, v.getLane(lane), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vmla_n_f32(const float32x2_t& a, const float32x2_t& b, float32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),mk_fpc32(tm, c))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmlaq_n_f32(const float32x4_t& a, const float32x4_t& b, float32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),mk_fpc32(tm, c))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vmls_n_f32(const float32x2_t& a, const float32x2_t& b, float32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),mk_fpc32(tm, c))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vmlsq_n_f32(const float32x4_t& a, const float32x4_t& b, float32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm, a.getLane(i), 32),nfp_mul(tm,lane_to_fp(tm, b.getLane(i), 32),mk_fpc32(tm, c))), 32);
    return float32x4_t(tm, _nres);
}
inline uint32x2_t vceq_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 32), lane_to_fp(tm, b.getLane(i), 32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vceq_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vceqq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vceqs_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vceqd_f64(float64_t a, float64_t b) { return {}; }
inline uint32x2_t vceqz_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vceqzq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vceqz_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vceqzq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vceqzs_f32(float32_t a) { return {}; }
inline uint64_t vceqzd_f64(float64_t a) { return {}; }
inline uint16_t vceqzh_f16(float16_t a) { return {}; }
inline uint16_t vceqh_f16(float16_t a, float16_t b) { return {}; }
inline uint16x4_t vceqz_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vceqzq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint16x4_t vceq_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vceqq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_eq(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcge_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 32), lane_to_fp(tm, b.getLane(i), 32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vcge_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgeq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcges_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vcged_f64(float64_t a, float64_t b) { return {}; }
inline uint32x2_t vcgez_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcgezq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcgez_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgezq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcgezs_f32(float32_t a) { return {}; }
inline uint64_t vcgezd_f64(float64_t a) { return {}; }
inline uint32x2_t vcle_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 32), lane_to_fp(tm, b.getLane(i), 32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vcle_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcleq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcles_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vcled_f64(float64_t a, float64_t b) { return {}; }
inline uint16_t vcgezh_f16(float16_t a) { return {}; }
inline uint16_t vcgeh_f16(float16_t a, float16_t b) { return {}; }
inline uint16_t vcleh_f16(float16_t a, float16_t b) { return {}; }
inline uint16x4_t vcgez_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcgezq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint16x4_t vcge_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcgeq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_ge(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint16x4_t vcle_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcleq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcgt_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 32), lane_to_fp(tm, b.getLane(i), 32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vcgt_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgtq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcgts_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vcgtd_f64(float64_t a, float64_t b) { return {}; }
inline uint32x2_t vcgtz_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcgtzq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcgtz_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgtzq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcgtzs_f32(float32_t a) { return {}; }
inline uint64_t vcgtzd_f64(float64_t a) { return {}; }
inline uint32x2_t vclt_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 32), lane_to_fp(tm, b.getLane(i), 32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vclt_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcltq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 64), lane_to_fp(tm, b.getLane(i), 64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vclts_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vcltd_f64(float64_t a, float64_t b) { return {}; }
inline uint16_t vcgtzh_f16(float16_t a) { return {}; }
inline uint16_t vcgth_f16(float16_t a, float16_t b) { return {}; }
inline uint16_t vclth_f16(float16_t a, float16_t b) { return {}; }
inline uint16x4_t vcgtz_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcgtzq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint16x4_t vcgt_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcgtq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_gt(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint16x4_t vclt_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcltq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 16), lane_to_fp(tm, b.getLane(i), 16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vclezq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vclez_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vclezq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vclezs_f32(float32_t a) { return {}; }
inline uint64_t vclezd_f64(float64_t a) { return {}; }
inline uint16_t vclezh_f16(float16_t a) { return {}; }
inline uint16x4_t vclez_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vclezq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_le(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcltz_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcltzq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 32), mk_fpc(tm,0.0,32)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcltz_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcltzq_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 64), mk_fpc(tm,0.0,64)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcltzs_f32(float32_t a) { return {}; }
inline uint64_t vcltzd_f64(float64_t a) { return {}; }
inline uint16_t vcltzh_f16(float16_t a) { return {}; }
inline uint16x4_t vcltz_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcltzq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_lt(tm, lane_to_fp(tm, a.getLane(i), 16), mk_fpc(tm,0.0,16)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcage_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_ge(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 32)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 32))), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcageq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_ge(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 32)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 32))), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcage_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_ge(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 64))), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcageq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_ge(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 64))), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcages_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vcaged_f64(float64_t a, float64_t b) { return {}; }
inline uint32x2_t vcale_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_le(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 32)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 32))), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcaleq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_le(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 32)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 32))), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcale_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_le(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 64))), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcaleq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_le(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 64))), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcales_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vcaled_f64(float64_t a, float64_t b) { return {}; }
inline uint16_t vcageh_f16(float16_t a, float16_t b) { return {}; }
inline uint16_t vcaleh_f16(float16_t a, float16_t b) { return {}; }
inline uint16x4_t vcage_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_ge(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 16))), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcageq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_ge(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 16))), 16);
    return uint16x8_t(tm, _nres);
}
inline uint16x4_t vcale_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_le(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 16))), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcaleq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_le(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 16))), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcagt_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_gt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 32)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 32))), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vcagt_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_gt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 64))), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcagtq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_gt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 64))), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcagts_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vcagtd_f64(float64_t a, float64_t b) { return {}; }
inline uint32x2_t vcalt_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_lt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 32)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 32))), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vcalt_f64(const float64x1_t& a, const float64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, nfp_lt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 64))), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcaltq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, nfp_lt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 64)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 64))), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32_t vcalts_f32(float32_t a, float32_t b) { return {}; }
inline uint64_t vcaltd_f64(float64_t a, float64_t b) { return {}; }
inline uint16_t vcagth_f16(float16_t a, float16_t b) { return {}; }
inline uint16_t vcalth_f16(float16_t a, float16_t b) { return {}; }
inline uint16x4_t vcagt_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_gt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 16))), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcagtq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_gt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 16))), 16);
    return uint16x8_t(tm, _nres);
}
inline uint16x4_t vcalt_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, nfp_lt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 16))), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcaltq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, nfp_lt(tm, nfp_abs(tm,lane_to_fp(tm, a.getLane(i), 16)), nfp_abs(tm,lane_to_fp(tm, b.getLane(i), 16))), 16);
    return uint16x8_t(tm, _nres);
}
inline float64x2_t vpaddq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,a.getLane(0),64), lane_to_fp(tm,a.getLane(1),64)), 64);
    _nres[1] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,b.getLane(0),64), lane_to_fp(tm,b.getLane(1),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vpadds_f32(const float32x2_t& a) { return {}; }
inline float64_t vpaddd_f64(const float64x2_t& a) { return {}; }
inline float32_t vaddv_f32(const float32x2_t& a) { return {}; }
inline float32_t vaddvq_f32(const float32x4_t& a) { return {}; }
inline float64_t vaddvq_f64(const float64x2_t& a) { return {}; }
inline float16x4_t vpadd_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vpaddq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,a.getLane(4),16), lane_to_fp(tm,a.getLane(5),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,a.getLane(6),16), lane_to_fp(tm,a.getLane(7),16)), 16);
    _nres[4] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[5] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    _nres[6] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,b.getLane(4),16), lane_to_fp(tm,b.getLane(5),16)), 16);
    _nres[7] = fp_to_lane(tm, nfp_add(tm, lane_to_fp(tm,b.getLane(6),16), lane_to_fp(tm,b.getLane(7),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vpmax_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(0),32), lane_to_fp(tm,a.getLane(1),32)), 32);
    _nres[1] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(0),32), lane_to_fp(tm,b.getLane(1),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vpmaxq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(0),32), lane_to_fp(tm,a.getLane(1),32)), 32);
    _nres[1] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(2),32), lane_to_fp(tm,a.getLane(3),32)), 32);
    _nres[2] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(0),32), lane_to_fp(tm,b.getLane(1),32)), 32);
    _nres[3] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(2),32), lane_to_fp(tm,b.getLane(3),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vpmaxq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(0),64), lane_to_fp(tm,a.getLane(1),64)), 64);
    _nres[1] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(0),64), lane_to_fp(tm,b.getLane(1),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vpmaxs_f32(const float32x2_t& a) { return {}; }
inline float64_t vpmaxqd_f64(const float64x2_t& a) { return {}; }
inline float32_t vmaxv_f32(const float32x2_t& a) { return {}; }
inline float64_t vmaxvq_f64(const float64x2_t& a) { return {}; }
inline float16x4_t vpmax_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vpmaxq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(4),16), lane_to_fp(tm,a.getLane(5),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,a.getLane(6),16), lane_to_fp(tm,a.getLane(7),16)), 16);
    _nres[4] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[5] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    _nres[6] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(4),16), lane_to_fp(tm,b.getLane(5),16)), 16);
    _nres[7] = fp_to_lane(tm, nfp_max(tm, lane_to_fp(tm,b.getLane(6),16), lane_to_fp(tm,b.getLane(7),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16_t vmaxv_f16(const float16x4_t& a) { return {}; }
inline float16_t vmaxvq_f16(const float16x8_t& a) { return {}; }
inline float32x2_t vpmin_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(0),32), lane_to_fp(tm,a.getLane(1),32)), 32);
    _nres[1] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(0),32), lane_to_fp(tm,b.getLane(1),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vpminq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(0),32), lane_to_fp(tm,a.getLane(1),32)), 32);
    _nres[1] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(2),32), lane_to_fp(tm,a.getLane(3),32)), 32);
    _nres[2] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(0),32), lane_to_fp(tm,b.getLane(1),32)), 32);
    _nres[3] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(2),32), lane_to_fp(tm,b.getLane(3),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vpminq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(0),64), lane_to_fp(tm,a.getLane(1),64)), 64);
    _nres[1] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(0),64), lane_to_fp(tm,b.getLane(1),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vpmins_f32(const float32x2_t& a) { return {}; }
inline float64_t vpminqd_f64(const float64x2_t& a) { return {}; }
inline float32_t vminv_f32(const float32x2_t& a) { return {}; }
inline float64_t vminvq_f64(const float64x2_t& a) { return {}; }
inline float16x4_t vpmin_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vpminq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(4),16), lane_to_fp(tm,a.getLane(5),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,a.getLane(6),16), lane_to_fp(tm,a.getLane(7),16)), 16);
    _nres[4] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[5] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    _nres[6] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(4),16), lane_to_fp(tm,b.getLane(5),16)), 16);
    _nres[7] = fp_to_lane(tm, nfp_min(tm, lane_to_fp(tm,b.getLane(6),16), lane_to_fp(tm,b.getLane(7),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16_t vminv_f16(const float16x4_t& a) { return {}; }
inline float16_t vminvq_f16(const float16x8_t& a) { return {}; }
inline float32x2_t vpmaxnm_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(0),32), lane_to_fp(tm,a.getLane(1),32)), 32);
    _nres[1] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(0),32), lane_to_fp(tm,b.getLane(1),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vpmaxnmq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(0),32), lane_to_fp(tm,a.getLane(1),32)), 32);
    _nres[1] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(2),32), lane_to_fp(tm,a.getLane(3),32)), 32);
    _nres[2] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(0),32), lane_to_fp(tm,b.getLane(1),32)), 32);
    _nres[3] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(2),32), lane_to_fp(tm,b.getLane(3),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vpmaxnmq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(0),64), lane_to_fp(tm,a.getLane(1),64)), 64);
    _nres[1] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(0),64), lane_to_fp(tm,b.getLane(1),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vpmaxnms_f32(const float32x2_t& a) { return {}; }
inline float64_t vpmaxnmqd_f64(const float64x2_t& a) { return {}; }
inline float32_t vmaxnmv_f32(const float32x2_t& a) { return {}; }
inline float64_t vmaxnmvq_f64(const float64x2_t& a) { return {}; }
inline float16x4_t vpmaxnm_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vpmaxnmq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(4),16), lane_to_fp(tm,a.getLane(5),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,a.getLane(6),16), lane_to_fp(tm,a.getLane(7),16)), 16);
    _nres[4] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[5] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    _nres[6] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(4),16), lane_to_fp(tm,b.getLane(5),16)), 16);
    _nres[7] = fp_to_lane(tm, nfp_maxnm(tm, lane_to_fp(tm,b.getLane(6),16), lane_to_fp(tm,b.getLane(7),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16_t vmaxnmv_f16(const float16x4_t& a) { return {}; }
inline float16_t vmaxnmvq_f16(const float16x8_t& a) { return {}; }
inline float32x2_t vpminnm_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(0),32), lane_to_fp(tm,a.getLane(1),32)), 32);
    _nres[1] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(0),32), lane_to_fp(tm,b.getLane(1),32)), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vpminnmq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(0),32), lane_to_fp(tm,a.getLane(1),32)), 32);
    _nres[1] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(2),32), lane_to_fp(tm,a.getLane(3),32)), 32);
    _nres[2] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(0),32), lane_to_fp(tm,b.getLane(1),32)), 32);
    _nres[3] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(2),32), lane_to_fp(tm,b.getLane(3),32)), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vpminnmq_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(0),64), lane_to_fp(tm,a.getLane(1),64)), 64);
    _nres[1] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(0),64), lane_to_fp(tm,b.getLane(1),64)), 64);
    return float64x2_t(tm, _nres);
}
inline float32_t vpminnms_f32(const float32x2_t& a) { return {}; }
inline float64_t vpminnmqd_f64(const float64x2_t& a) { return {}; }
inline float32_t vminnmv_f32(const float32x2_t& a) { return {}; }
inline float64_t vminnmvq_f64(const float64x2_t& a) { return {}; }
inline float16x4_t vpminnm_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vpminnmq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(0),16), lane_to_fp(tm,a.getLane(1),16)), 16);
    _nres[1] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(2),16), lane_to_fp(tm,a.getLane(3),16)), 16);
    _nres[2] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(4),16), lane_to_fp(tm,a.getLane(5),16)), 16);
    _nres[3] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,a.getLane(6),16), lane_to_fp(tm,a.getLane(7),16)), 16);
    _nres[4] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(0),16), lane_to_fp(tm,b.getLane(1),16)), 16);
    _nres[5] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(2),16), lane_to_fp(tm,b.getLane(3),16)), 16);
    _nres[6] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(4),16), lane_to_fp(tm,b.getLane(5),16)), 16);
    _nres[7] = fp_to_lane(tm, nfp_minnm(tm, lane_to_fp(tm,b.getLane(6),16), lane_to_fp(tm,b.getLane(7),16)), 16);
    return float16x8_t(tm, _nres);
}
inline float16_t vminnmv_f16(const float16x4_t& a) { return {}; }
inline float16_t vminnmvq_f16(const float16x8_t& a) { return {}; }
inline float32_t vmaxvq_f32(const float32x4_t& a) { return {}; }
inline float32_t vminvq_f32(const float32x4_t& a) { return {}; }
inline float32_t vmaxnmvq_f32(const float32x4_t& a) { return {}; }
inline float32_t vminnmvq_f32(const float32x4_t& a) { return {}; }
inline float64x2_t vdupq_n_f64(float64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_rawbits64(tm,value);
    _nres[1] = fp_rawbits64(tm,value);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vmov_n_f32(float32_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_rawbits32(tm,value);
    _nres[1] = fp_rawbits32(tm,value);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vmov_n_f64(float64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = fp_rawbits64(tm,value);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vmovq_n_f64(float64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_rawbits64(tm,value);
    _nres[1] = fp_rawbits64(tm,value);
    return float64x2_t(tm, _nres);
}
inline float16x4_t vmov_n_f16(float16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_rawbits16(tm,value);
    _nres[1] = fp_rawbits16(tm,value);
    _nres[2] = fp_rawbits16(tm,value);
    _nres[3] = fp_rawbits16(tm,value);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vmovq_n_f16(float16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_rawbits16(tm,value);
    _nres[1] = fp_rawbits16(tm,value);
    _nres[2] = fp_rawbits16(tm,value);
    _nres[3] = fp_rawbits16(tm,value);
    _nres[4] = fp_rawbits16(tm,value);
    _nres[5] = fp_rawbits16(tm,value);
    _nres[6] = fp_rawbits16(tm,value);
    _nres[7] = fp_rawbits16(tm,value);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vdup_n_f16(float16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_rawbits16(tm,value);
    _nres[1] = fp_rawbits16(tm,value);
    _nres[2] = fp_rawbits16(tm,value);
    _nres[3] = fp_rawbits16(tm,value);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vdupq_n_f16(float16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_rawbits16(tm,value);
    _nres[1] = fp_rawbits16(tm,value);
    _nres[2] = fp_rawbits16(tm,value);
    _nres[3] = fp_rawbits16(tm,value);
    _nres[4] = fp_rawbits16(tm,value);
    _nres[5] = fp_rawbits16(tm,value);
    _nres[6] = fp_rawbits16(tm,value);
    _nres[7] = fp_rawbits16(tm,value);
    return float16x8_t(tm, _nres);
}
inline float64x1_t vdup_n_f64(float64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = fp_rawbits64(tm,value);
    return float64x1_t(tm, _nres);
}
inline float16x4_t vset_lane_f16(float16_t a, const float16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = v.getLane(j);
    _nres[lane] = fp_rawbits16(tm,a);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vsetq_lane_f16(float16_t a, const float16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = fp_rawbits16(tm,a);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vset_lane_f32(float32_t a, const float32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = v.getLane(j);
    _nres[lane] = fp_rawbits32(tm,a);
    return float32x2_t(tm, _nres);
}
inline float64x1_t vset_lane_f64(float64_t a, const float64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = v.getLane(j);
    _nres[lane] = fp_rawbits64(tm,a);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vsetq_lane_f64(float64_t a, const float64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = v.getLane(j);
    _nres[lane] = fp_rawbits64(tm,a);
    return float64x2_t(tm, _nres);
}

} // namespace salt
