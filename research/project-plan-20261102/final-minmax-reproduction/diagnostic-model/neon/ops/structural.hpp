#pragma once
// NEON dup/mov/combine/get-high-low/create/set-lane/copy-lane
#include "nhelp.hpp"
namespace salt_cvc5 {

inline int64x1_t vcopy_lane_s64(const int64x1_t& a, const int lane1, const int64x1_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int64x1_t(tm, _nres);
}
inline uint64x1_t vcopy_lane_u64(const uint64x1_t& a, const int lane1, const uint64x1_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint64x1_t(tm, _nres);
}
inline poly64x1_t vcopy_lane_p64(const poly64x1_t& a, const int lane1, const poly64x1_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly64x1_t(tm, _nres);
}
inline float64x1_t vcopy_lane_f64(const float64x1_t& a, const int lane1, const float64x1_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return float64x1_t(tm, _nres);
}
inline int64x1_t vcopy_laneq_s64(const int64x1_t& a, const int lane1, const int64x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int64x1_t(tm, _nres);
}
inline uint64x1_t vcopy_laneq_u64(const uint64x1_t& a, const int lane1, const uint64x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint64x1_t(tm, _nres);
}
inline poly64x1_t vcopy_laneq_p64(const poly64x1_t& a, const int lane1, const poly64x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly64x1_t(tm, _nres);
}
inline float64x1_t vcopy_laneq_f64(const float64x1_t& a, const int lane1, const float64x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return float64x1_t(tm, _nres);
}
inline int64x2_t vdupq_n_s64(int64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    _nres[1] = mk_bv_val(tm,64,(int64_t)value);
    return int64x2_t(tm, _nres);
}
inline uint32x2_t vdup_n_u32(uint32_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = mk_bv_val(tm,32,(int64_t)value);
    _nres[1] = mk_bv_val(tm,32,(int64_t)value);
    return uint32x2_t(tm, _nres);
}
inline uint64x2_t vdupq_n_u64(uint64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    _nres[1] = mk_bv_val(tm,64,(int64_t)value);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vdupq_n_p64(poly64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    _nres[1] = mk_bv_val(tm,64,(int64_t)value);
    return poly64x2_t(tm, _nres);
}
inline poly8x8_t vdup_n_p8(poly8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vdupq_n_p8(poly8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    _nres[8] = mk_bv_val(tm,8,(int64_t)value);
    _nres[9] = mk_bv_val(tm,8,(int64_t)value);
    _nres[10] = mk_bv_val(tm,8,(int64_t)value);
    _nres[11] = mk_bv_val(tm,8,(int64_t)value);
    _nres[12] = mk_bv_val(tm,8,(int64_t)value);
    _nres[13] = mk_bv_val(tm,8,(int64_t)value);
    _nres[14] = mk_bv_val(tm,8,(int64_t)value);
    _nres[15] = mk_bv_val(tm,8,(int64_t)value);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vdup_n_p16(poly16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = mk_bv_val(tm,16,(int64_t)value);
    _nres[1] = mk_bv_val(tm,16,(int64_t)value);
    _nres[2] = mk_bv_val(tm,16,(int64_t)value);
    _nres[3] = mk_bv_val(tm,16,(int64_t)value);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vdupq_n_p16(poly16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,16,(int64_t)value);
    _nres[1] = mk_bv_val(tm,16,(int64_t)value);
    _nres[2] = mk_bv_val(tm,16,(int64_t)value);
    _nres[3] = mk_bv_val(tm,16,(int64_t)value);
    _nres[4] = mk_bv_val(tm,16,(int64_t)value);
    _nres[5] = mk_bv_val(tm,16,(int64_t)value);
    _nres[6] = mk_bv_val(tm,16,(int64_t)value);
    _nres[7] = mk_bv_val(tm,16,(int64_t)value);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vdup_n_mf8(mfloat8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vdupq_n_mf8(mfloat8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    _nres[8] = mk_bv_val(tm,8,(int64_t)value);
    _nres[9] = mk_bv_val(tm,8,(int64_t)value);
    _nres[10] = mk_bv_val(tm,8,(int64_t)value);
    _nres[11] = mk_bv_val(tm,8,(int64_t)value);
    _nres[12] = mk_bv_val(tm,8,(int64_t)value);
    _nres[13] = mk_bv_val(tm,8,(int64_t)value);
    _nres[14] = mk_bv_val(tm,8,(int64_t)value);
    _nres[15] = mk_bv_val(tm,8,(int64_t)value);
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vmov_n_s8(int8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vmov_n_s16(int16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = mk_bv_val(tm,16,(int64_t)value);
    _nres[1] = mk_bv_val(tm,16,(int64_t)value);
    _nres[2] = mk_bv_val(tm,16,(int64_t)value);
    _nres[3] = mk_bv_val(tm,16,(int64_t)value);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vmov_n_s32(int32_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = mk_bv_val(tm,32,(int64_t)value);
    _nres[1] = mk_bv_val(tm,32,(int64_t)value);
    return int32x2_t(tm, _nres);
}
inline int64x1_t vmov_n_s64(int64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vmovq_n_s64(int64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    _nres[1] = mk_bv_val(tm,64,(int64_t)value);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vmov_n_u8(uint8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    return uint8x8_t(tm, _nres);
}
inline uint64x1_t vmov_n_u64(uint64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vmovq_n_u64(uint64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    _nres[1] = mk_bv_val(tm,64,(int64_t)value);
    return uint64x2_t(tm, _nres);
}
inline poly8x8_t vmov_n_p8(poly8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vmovq_n_p8(poly8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    _nres[8] = mk_bv_val(tm,8,(int64_t)value);
    _nres[9] = mk_bv_val(tm,8,(int64_t)value);
    _nres[10] = mk_bv_val(tm,8,(int64_t)value);
    _nres[11] = mk_bv_val(tm,8,(int64_t)value);
    _nres[12] = mk_bv_val(tm,8,(int64_t)value);
    _nres[13] = mk_bv_val(tm,8,(int64_t)value);
    _nres[14] = mk_bv_val(tm,8,(int64_t)value);
    _nres[15] = mk_bv_val(tm,8,(int64_t)value);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vmov_n_p16(poly16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = mk_bv_val(tm,16,(int64_t)value);
    _nres[1] = mk_bv_val(tm,16,(int64_t)value);
    _nres[2] = mk_bv_val(tm,16,(int64_t)value);
    _nres[3] = mk_bv_val(tm,16,(int64_t)value);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vmovq_n_p16(poly16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,16,(int64_t)value);
    _nres[1] = mk_bv_val(tm,16,(int64_t)value);
    _nres[2] = mk_bv_val(tm,16,(int64_t)value);
    _nres[3] = mk_bv_val(tm,16,(int64_t)value);
    _nres[4] = mk_bv_val(tm,16,(int64_t)value);
    _nres[5] = mk_bv_val(tm,16,(int64_t)value);
    _nres[6] = mk_bv_val(tm,16,(int64_t)value);
    _nres[7] = mk_bv_val(tm,16,(int64_t)value);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vmov_n_mf8(mfloat8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vmovq_n_mf8(mfloat8_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = mk_bv_val(tm,8,(int64_t)value);
    _nres[1] = mk_bv_val(tm,8,(int64_t)value);
    _nres[2] = mk_bv_val(tm,8,(int64_t)value);
    _nres[3] = mk_bv_val(tm,8,(int64_t)value);
    _nres[4] = mk_bv_val(tm,8,(int64_t)value);
    _nres[5] = mk_bv_val(tm,8,(int64_t)value);
    _nres[6] = mk_bv_val(tm,8,(int64_t)value);
    _nres[7] = mk_bv_val(tm,8,(int64_t)value);
    _nres[8] = mk_bv_val(tm,8,(int64_t)value);
    _nres[9] = mk_bv_val(tm,8,(int64_t)value);
    _nres[10] = mk_bv_val(tm,8,(int64_t)value);
    _nres[11] = mk_bv_val(tm,8,(int64_t)value);
    _nres[12] = mk_bv_val(tm,8,(int64_t)value);
    _nres[13] = mk_bv_val(tm,8,(int64_t)value);
    _nres[14] = mk_bv_val(tm,8,(int64_t)value);
    _nres[15] = mk_bv_val(tm,8,(int64_t)value);
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vdup_lane_s8(const int8x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vdupq_lane_s8(const int8x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    _nres[8] = vec.getLane(lane);
    _nres[9] = vec.getLane(lane);
    _nres[10] = vec.getLane(lane);
    _nres[11] = vec.getLane(lane);
    _nres[12] = vec.getLane(lane);
    _nres[13] = vec.getLane(lane);
    _nres[14] = vec.getLane(lane);
    _nres[15] = vec.getLane(lane);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vdup_lane_s16(const int16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vdupq_lane_s16(const int16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vdup_lane_s32(const int32x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vdupq_lane_s32(const int32x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vdup_lane_s64(const int64x1_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = vec.getLane(lane);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vdupq_lane_s64(const int64x1_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vdup_lane_u8(const uint8x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vdupq_lane_u8(const uint8x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    _nres[8] = vec.getLane(lane);
    _nres[9] = vec.getLane(lane);
    _nres[10] = vec.getLane(lane);
    _nres[11] = vec.getLane(lane);
    _nres[12] = vec.getLane(lane);
    _nres[13] = vec.getLane(lane);
    _nres[14] = vec.getLane(lane);
    _nres[15] = vec.getLane(lane);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vdup_lane_u16(const uint16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vdupq_lane_u16(const uint16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vdup_lane_u32(const uint32x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vdupq_lane_u32(const uint32x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vdup_lane_u64(const uint64x1_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = vec.getLane(lane);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vdupq_lane_u64(const uint64x1_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return uint64x2_t(tm, _nres);
}
inline poly64x1_t vdup_lane_p64(const poly64x1_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = vec.getLane(lane);
    return poly64x1_t(tm, _nres);
}
inline poly64x2_t vdupq_lane_p64(const poly64x1_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vdup_lane_f32(const float32x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return float32x2_t(tm, _nres);
}
inline poly8x8_t vdup_lane_p8(const poly8x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vdupq_lane_p8(const poly8x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    _nres[8] = vec.getLane(lane);
    _nres[9] = vec.getLane(lane);
    _nres[10] = vec.getLane(lane);
    _nres[11] = vec.getLane(lane);
    _nres[12] = vec.getLane(lane);
    _nres[13] = vec.getLane(lane);
    _nres[14] = vec.getLane(lane);
    _nres[15] = vec.getLane(lane);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vdup_lane_p16(const poly16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vdupq_lane_p16(const poly16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return poly16x8_t(tm, _nres);
}
inline float64x1_t vdup_lane_f64(const float64x1_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = vec.getLane(lane);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vdupq_lane_f64(const float64x1_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return float64x2_t(tm, _nres);
}
inline mfloat8x8_t vdup_lane_mf8(const mfloat8x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vdupq_lane_mf8(const mfloat8x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    _nres[8] = vec.getLane(lane);
    _nres[9] = vec.getLane(lane);
    _nres[10] = vec.getLane(lane);
    _nres[11] = vec.getLane(lane);
    _nres[12] = vec.getLane(lane);
    _nres[13] = vec.getLane(lane);
    _nres[14] = vec.getLane(lane);
    _nres[15] = vec.getLane(lane);
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vdup_laneq_s8(const int8x16_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vdupq_laneq_s8(const int8x16_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    _nres[8] = vec.getLane(lane);
    _nres[9] = vec.getLane(lane);
    _nres[10] = vec.getLane(lane);
    _nres[11] = vec.getLane(lane);
    _nres[12] = vec.getLane(lane);
    _nres[13] = vec.getLane(lane);
    _nres[14] = vec.getLane(lane);
    _nres[15] = vec.getLane(lane);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vdup_laneq_s16(const int16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vdupq_laneq_s16(const int16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vdup_laneq_s32(const int32x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vdupq_laneq_s32(const int32x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vdup_laneq_s64(const int64x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = vec.getLane(lane);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vdupq_laneq_s64(const int64x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vdup_laneq_u8(const uint8x16_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vdupq_laneq_u8(const uint8x16_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    _nres[8] = vec.getLane(lane);
    _nres[9] = vec.getLane(lane);
    _nres[10] = vec.getLane(lane);
    _nres[11] = vec.getLane(lane);
    _nres[12] = vec.getLane(lane);
    _nres[13] = vec.getLane(lane);
    _nres[14] = vec.getLane(lane);
    _nres[15] = vec.getLane(lane);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vdup_laneq_u16(const uint16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vdupq_laneq_u16(const uint16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vdup_laneq_u32(const uint32x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vdupq_laneq_u32(const uint32x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vdup_laneq_u64(const uint64x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = vec.getLane(lane);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vdupq_laneq_u64(const uint64x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return uint64x2_t(tm, _nres);
}
inline poly64x1_t vdup_laneq_p64(const poly64x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = vec.getLane(lane);
    return poly64x1_t(tm, _nres);
}
inline poly64x2_t vdupq_laneq_p64(const poly64x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vdup_laneq_f32(const float32x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return float32x2_t(tm, _nres);
}
inline poly8x8_t vdup_laneq_p8(const poly8x16_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vdupq_laneq_p8(const poly8x16_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    _nres[8] = vec.getLane(lane);
    _nres[9] = vec.getLane(lane);
    _nres[10] = vec.getLane(lane);
    _nres[11] = vec.getLane(lane);
    _nres[12] = vec.getLane(lane);
    _nres[13] = vec.getLane(lane);
    _nres[14] = vec.getLane(lane);
    _nres[15] = vec.getLane(lane);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vdup_laneq_p16(const poly16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vdupq_laneq_p16(const poly16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return poly16x8_t(tm, _nres);
}
inline float64x1_t vdup_laneq_f64(const float64x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = vec.getLane(lane);
    return float64x1_t(tm, _nres);
}
inline float64x2_t vdupq_laneq_f64(const float64x2_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    return float64x2_t(tm, _nres);
}
inline mfloat8x8_t vdup_laneq_mf8(const mfloat8x16_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vdupq_laneq_mf8(const mfloat8x16_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    _nres[8] = vec.getLane(lane);
    _nres[9] = vec.getLane(lane);
    _nres[10] = vec.getLane(lane);
    _nres[11] = vec.getLane(lane);
    _nres[12] = vec.getLane(lane);
    _nres[13] = vec.getLane(lane);
    _nres[14] = vec.getLane(lane);
    _nres[15] = vec.getLane(lane);
    return mfloat8x16_t(tm, _nres);
}
inline int64x2_t vcombine_s64(const int64x1_t& low, const int64x1_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = high.getLane(0);
    return int64x2_t(tm, _nres);
}
inline uint32x4_t vcombine_u32(const uint32x2_t& low, const uint32x2_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = low.getLane(1);
    _nres[2] = high.getLane(0);
    _nres[3] = high.getLane(1);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vcombine_u64(const uint64x1_t& low, const uint64x1_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = high.getLane(0);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vcombine_p64(const poly64x1_t& low, const poly64x1_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = high.getLane(0);
    return poly64x2_t(tm, _nres);
}
inline float16x8_t vcombine_f16(const float16x4_t& low, const float16x4_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = low.getLane(1);
    _nres[2] = low.getLane(2);
    _nres[3] = low.getLane(3);
    _nres[4] = high.getLane(0);
    _nres[5] = high.getLane(1);
    _nres[6] = high.getLane(2);
    _nres[7] = high.getLane(3);
    return float16x8_t(tm, _nres);
}
inline poly8x16_t vcombine_p8(const poly8x8_t& low, const poly8x8_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = low.getLane(1);
    _nres[2] = low.getLane(2);
    _nres[3] = low.getLane(3);
    _nres[4] = low.getLane(4);
    _nres[5] = low.getLane(5);
    _nres[6] = low.getLane(6);
    _nres[7] = low.getLane(7);
    _nres[8] = high.getLane(0);
    _nres[9] = high.getLane(1);
    _nres[10] = high.getLane(2);
    _nres[11] = high.getLane(3);
    _nres[12] = high.getLane(4);
    _nres[13] = high.getLane(5);
    _nres[14] = high.getLane(6);
    _nres[15] = high.getLane(7);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vcombine_p16(const poly16x4_t& low, const poly16x4_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = low.getLane(1);
    _nres[2] = low.getLane(2);
    _nres[3] = low.getLane(3);
    _nres[4] = high.getLane(0);
    _nres[5] = high.getLane(1);
    _nres[6] = high.getLane(2);
    _nres[7] = high.getLane(3);
    return poly16x8_t(tm, _nres);
}
inline float64x2_t vcombine_f64(const float64x1_t& low, const float64x1_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = high.getLane(0);
    return float64x2_t(tm, _nres);
}
inline mfloat8x16_t vcombine_mf8(const mfloat8x8_t& low, const mfloat8x8_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = low.getLane(1);
    _nres[2] = low.getLane(2);
    _nres[3] = low.getLane(3);
    _nres[4] = low.getLane(4);
    _nres[5] = low.getLane(5);
    _nres[6] = low.getLane(6);
    _nres[7] = low.getLane(7);
    _nres[8] = high.getLane(0);
    _nres[9] = high.getLane(1);
    _nres[10] = high.getLane(2);
    _nres[11] = high.getLane(3);
    _nres[12] = high.getLane(4);
    _nres[13] = high.getLane(5);
    _nres[14] = high.getLane(6);
    _nres[15] = high.getLane(7);
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vget_high_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(8);
    _nres[1] = a.getLane(9);
    _nres[2] = a.getLane(10);
    _nres[3] = a.getLane(11);
    _nres[4] = a.getLane(12);
    _nres[5] = a.getLane(13);
    _nres[6] = a.getLane(14);
    _nres[7] = a.getLane(15);
    return int8x8_t(tm, _nres);
}
inline int32x2_t vget_high_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(2);
    _nres[1] = a.getLane(3);
    return int32x2_t(tm, _nres);
}
inline int64x1_t vget_high_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = a.getLane(1);
    return int64x1_t(tm, _nres);
}
inline uint16x4_t vget_high_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = a.getLane(5);
    _nres[2] = a.getLane(6);
    _nres[3] = a.getLane(7);
    return uint16x4_t(tm, _nres);
}
inline uint64x1_t vget_high_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = a.getLane(1);
    return uint64x1_t(tm, _nres);
}
inline poly64x1_t vget_high_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = a.getLane(1);
    return poly64x1_t(tm, _nres);
}
inline poly8x8_t vget_high_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(8);
    _nres[1] = a.getLane(9);
    _nres[2] = a.getLane(10);
    _nres[3] = a.getLane(11);
    _nres[4] = a.getLane(12);
    _nres[5] = a.getLane(13);
    _nres[6] = a.getLane(14);
    _nres[7] = a.getLane(15);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vget_high_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = a.getLane(5);
    _nres[2] = a.getLane(6);
    _nres[3] = a.getLane(7);
    return poly16x4_t(tm, _nres);
}
inline float64x1_t vget_high_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = a.getLane(1);
    return float64x1_t(tm, _nres);
}
inline mfloat8x8_t vget_high_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(8);
    _nres[1] = a.getLane(9);
    _nres[2] = a.getLane(10);
    _nres[3] = a.getLane(11);
    _nres[4] = a.getLane(12);
    _nres[5] = a.getLane(13);
    _nres[6] = a.getLane(14);
    _nres[7] = a.getLane(15);
    return mfloat8x8_t(tm, _nres);
}
inline int64x1_t vget_low_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = a.getLane(0);
    return int64x1_t(tm, _nres);
}
inline uint64x1_t vget_low_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = a.getLane(0);
    return uint64x1_t(tm, _nres);
}
inline poly64x1_t vget_low_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = a.getLane(0);
    return poly64x1_t(tm, _nres);
}
inline poly8x8_t vget_low_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(1);
    _nres[2] = a.getLane(2);
    _nres[3] = a.getLane(3);
    _nres[4] = a.getLane(4);
    _nres[5] = a.getLane(5);
    _nres[6] = a.getLane(6);
    _nres[7] = a.getLane(7);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vget_low_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(1);
    _nres[2] = a.getLane(2);
    _nres[3] = a.getLane(3);
    return poly16x4_t(tm, _nres);
}
inline float64x1_t vget_low_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = a.getLane(0);
    return float64x1_t(tm, _nres);
}
inline mfloat8x8_t vget_low_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(1);
    _nres[2] = a.getLane(2);
    _nres[3] = a.getLane(3);
    _nres[4] = a.getLane(4);
    _nres[5] = a.getLane(5);
    _nres[6] = a.getLane(6);
    _nres[7] = a.getLane(7);
    return mfloat8x8_t(tm, _nres);
}
inline int8_t vdupb_lane_s8(const int8x8_t& vec, const int lane) { return {}; }
inline int16_t vduph_lane_s16(const int16x4_t& vec, const int lane) { return {}; }
inline int32_t vdups_lane_s32(const int32x2_t& vec, const int lane) { return {}; }
inline int64_t vdupd_lane_s64(const int64x1_t& vec, const int lane) { return {}; }
inline uint8_t vdupb_lane_u8(const uint8x8_t& vec, const int lane) { return {}; }
inline uint16_t vduph_lane_u16(const uint16x4_t& vec, const int lane) { return {}; }
inline uint32_t vdups_lane_u32(const uint32x2_t& vec, const int lane) { return {}; }
inline uint64_t vdupd_lane_u64(const uint64x1_t& vec, const int lane) { return {}; }
inline float32_t vdups_lane_f32(const float32x2_t& vec, const int lane) { return {}; }
inline float64_t vdupd_lane_f64(const float64x1_t& vec, const int lane) { return {}; }
inline poly8_t vdupb_lane_p8(const poly8x8_t& vec, const int lane) { return {}; }
inline poly16_t vduph_lane_p16(const poly16x4_t& vec, const int lane) { return {}; }
inline mfloat8_t vdupb_lane_mf8(const mfloat8x8_t& vec, const int lane) { return {}; }
inline int8_t vdupb_laneq_s8(const int8x16_t& vec, const int lane) { return {}; }
inline int16_t vduph_laneq_s16(const int16x8_t& vec, const int lane) { return {}; }
inline int32_t vdups_laneq_s32(const int32x4_t& vec, const int lane) { return {}; }
inline int64_t vdupd_laneq_s64(const int64x2_t& vec, const int lane) { return {}; }
inline uint8_t vdupb_laneq_u8(const uint8x16_t& vec, const int lane) { return {}; }
inline uint16_t vduph_laneq_u16(const uint16x8_t& vec, const int lane) { return {}; }
inline uint32_t vdups_laneq_u32(const uint32x4_t& vec, const int lane) { return {}; }
inline uint64_t vdupd_laneq_u64(const uint64x2_t& vec, const int lane) { return {}; }
inline float32_t vdups_laneq_f32(const float32x4_t& vec, const int lane) { return {}; }
inline float64_t vdupd_laneq_f64(const float64x2_t& vec, const int lane) { return {}; }
inline poly8_t vdupb_laneq_p8(const poly8x16_t& vec, const int lane) { return {}; }
inline poly16_t vduph_laneq_p16(const poly16x8_t& vec, const int lane) { return {}; }
inline mfloat8_t vdupb_laneq_mf8(const mfloat8x16_t& vec, const int lane) { return {}; }
inline mfloat8_t vget_lane_mf8(const mfloat8x8_t& v, const int lane) { return {}; }
inline float16_t vget_lane_f16(const float16x4_t& v, const int lane) { return {}; }
inline float64_t vget_lane_f64(const float64x1_t& v, const int lane) { return {}; }
inline mfloat8_t vgetq_lane_mf8(const mfloat8x16_t& v, const int lane) { return {}; }
inline float16_t vgetq_lane_f16(const float16x8_t& v, const int lane) { return {}; }
inline float32_t vgetq_lane_f32(const float32x4_t& v, const int lane) { return {}; }
inline float64_t vgetq_lane_f64(const float64x2_t& v, const int lane) { return {}; }
inline float16x4_t vdup_lane_f16(const float16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vdupq_lane_f16(const float16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return float16x8_t(tm, _nres);
}
inline float16x4_t vdup_laneq_f16(const float16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vdupq_laneq_f16(const float16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return float16x8_t(tm, _nres);
}
inline float16_t vduph_lane_f16(const float16x4_t& vec, const int lane) { return {}; }
inline float16_t vduph_laneq_f16(const float16x8_t& vec, const int lane) { return {}; }
inline bfloat16x4_t vdup_n_bf16(bfloat16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = mk_bv_val(tm,16,(int64_t)value);
    _nres[1] = mk_bv_val(tm,16,(int64_t)value);
    _nres[2] = mk_bv_val(tm,16,(int64_t)value);
    _nres[3] = mk_bv_val(tm,16,(int64_t)value);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vdupq_n_bf16(bfloat16_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = mk_bv_val(tm,16,(int64_t)value);
    _nres[1] = mk_bv_val(tm,16,(int64_t)value);
    _nres[2] = mk_bv_val(tm,16,(int64_t)value);
    _nres[3] = mk_bv_val(tm,16,(int64_t)value);
    _nres[4] = mk_bv_val(tm,16,(int64_t)value);
    _nres[5] = mk_bv_val(tm,16,(int64_t)value);
    _nres[6] = mk_bv_val(tm,16,(int64_t)value);
    _nres[7] = mk_bv_val(tm,16,(int64_t)value);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x4_t vdup_lane_bf16(const bfloat16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vdupq_lane_bf16(const bfloat16x4_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x4_t vdup_laneq_bf16(const bfloat16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vdupq_laneq_bf16(const bfloat16x8_t& vec, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(lane);
    _nres[1] = vec.getLane(lane);
    _nres[2] = vec.getLane(lane);
    _nres[3] = vec.getLane(lane);
    _nres[4] = vec.getLane(lane);
    _nres[5] = vec.getLane(lane);
    _nres[6] = vec.getLane(lane);
    _nres[7] = vec.getLane(lane);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vcombine_bf16(const bfloat16x4_t& low, const bfloat16x4_t& high) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = low.getLane(0);
    _nres[1] = low.getLane(1);
    _nres[2] = low.getLane(2);
    _nres[3] = low.getLane(3);
    _nres[4] = high.getLane(0);
    _nres[5] = high.getLane(1);
    _nres[6] = high.getLane(2);
    _nres[7] = high.getLane(3);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x4_t vget_high_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = a.getLane(5);
    _nres[2] = a.getLane(6);
    _nres[3] = a.getLane(7);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vget_low_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(1);
    _nres[2] = a.getLane(2);
    _nres[3] = a.getLane(3);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16_t vget_lane_bf16(const bfloat16x4_t& v, const int lane) { return {}; }
inline bfloat16_t vgetq_lane_bf16(const bfloat16x8_t& v, const int lane) { return {}; }
inline bfloat16_t vduph_lane_bf16(const bfloat16x4_t& vec, const int lane) { return {}; }
inline bfloat16_t vduph_laneq_bf16(const bfloat16x8_t& vec, const int lane) { return {}; }
inline int8x8_t vcopy_lane_s8(const int8x8_t& a, const int lane1, const int8x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vcopyq_lane_s8(const int8x16_t& a, const int lane1, const int8x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vcopy_lane_s16(const int16x4_t& a, const int lane1, const int16x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vcopyq_lane_s16(const int16x8_t& a, const int lane1, const int16x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vcopy_lane_s32(const int32x2_t& a, const int lane1, const int32x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vcopyq_lane_s32(const int32x4_t& a, const int lane1, const int32x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vcopyq_lane_s64(const int64x2_t& a, const int lane1, const int64x1_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vcopy_lane_u8(const uint8x8_t& a, const int lane1, const uint8x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcopyq_lane_u8(const uint8x16_t& a, const int lane1, const uint8x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcopy_lane_u16(const uint16x4_t& a, const int lane1, const uint16x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcopyq_lane_u16(const uint16x8_t& a, const int lane1, const uint16x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcopy_lane_u32(const uint32x2_t& a, const int lane1, const uint32x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcopyq_lane_u32(const uint32x4_t& a, const int lane1, const uint32x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vcopyq_lane_u64(const uint64x2_t& a, const int lane1, const uint64x1_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vcopyq_lane_p64(const poly64x2_t& a, const int lane1, const poly64x1_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vcopy_lane_f32(const float32x2_t& a, const int lane1, const float32x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vcopyq_lane_f32(const float32x4_t& a, const int lane1, const float32x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcopyq_lane_f64(const float64x2_t& a, const int lane1, const float64x1_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vcopy_lane_p8(const poly8x8_t& a, const int lane1, const poly8x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vcopyq_lane_p8(const poly8x16_t& a, const int lane1, const poly8x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vcopy_lane_p16(const poly16x4_t& a, const int lane1, const poly16x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vcopyq_lane_p16(const poly16x8_t& a, const int lane1, const poly16x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vcopy_lane_mf8(const mfloat8x8_t& a, const int lane1, const mfloat8x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vcopyq_lane_mf8(const mfloat8x16_t& a, const int lane1, const mfloat8x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vcopy_laneq_s8(const int8x8_t& a, const int lane1, const int8x16_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vcopyq_laneq_s8(const int8x16_t& a, const int lane1, const int8x16_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vcopy_laneq_s16(const int16x4_t& a, const int lane1, const int16x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vcopyq_laneq_s16(const int16x8_t& a, const int lane1, const int16x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vcopy_laneq_s32(const int32x2_t& a, const int lane1, const int32x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vcopyq_laneq_s32(const int32x4_t& a, const int lane1, const int32x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vcopyq_laneq_s64(const int64x2_t& a, const int lane1, const int64x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vcopy_laneq_u8(const uint8x8_t& a, const int lane1, const uint8x16_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcopyq_laneq_u8(const uint8x16_t& a, const int lane1, const uint8x16_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcopy_laneq_u16(const uint16x4_t& a, const int lane1, const uint16x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcopyq_laneq_u16(const uint16x8_t& a, const int lane1, const uint16x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcopy_laneq_u32(const uint32x2_t& a, const int lane1, const uint32x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcopyq_laneq_u32(const uint32x4_t& a, const int lane1, const uint32x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vcopyq_laneq_u64(const uint64x2_t& a, const int lane1, const uint64x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vcopyq_laneq_p64(const poly64x2_t& a, const int lane1, const poly64x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vcopy_laneq_f32(const float32x2_t& a, const int lane1, const float32x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vcopyq_laneq_f32(const float32x4_t& a, const int lane1, const float32x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcopyq_laneq_f64(const float64x2_t& a, const int lane1, const float64x2_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vcopy_laneq_p8(const poly8x8_t& a, const int lane1, const poly8x16_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vcopyq_laneq_p8(const poly8x16_t& a, const int lane1, const poly8x16_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vcopy_laneq_p16(const poly16x4_t& a, const int lane1, const poly16x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vcopyq_laneq_p16(const poly16x8_t& a, const int lane1, const poly16x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vcopy_laneq_mf8(const mfloat8x8_t& a, const int lane1, const mfloat8x16_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vcopyq_laneq_mf8(const mfloat8x16_t& a, const int lane1, const mfloat8x16_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vcreate_s8(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vcreate_s16(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vcreate_s32(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline int64x1_t vcreate_s64(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline uint8x8_t vcreate_u8(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vcreate_u16(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vcreate_u32(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vcreate_u64(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline poly64x1_t vcreate_p64(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vcreate_f16(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcreate_f32(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline poly8x8_t vcreate_p8(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vcreate_p16(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline float64x1_t vcreate_f64(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline mfloat8x8_t vcreate_mf8(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline int64x1_t vdup_n_s64(int64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    return int64x1_t(tm, _nres);
}
inline uint64x1_t vdup_n_u64(uint64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    return uint64x1_t(tm, _nres);
}
inline poly64x1_t vdup_n_p64(poly64_t value) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    _nres[0] = mk_bv_val(tm,64,(int64_t)value);
    return poly64x1_t(tm, _nres);
}
inline bfloat16x4_t vcreate_bf16(uint64_t a) {
    auto& tm = g_ctx->tm;
    Term big = mk_bv_val(tm, 64, (int64_t)a);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vset_lane_bf16(bfloat16_t a, const bfloat16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 16, (int64_t)a);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vsetq_lane_bf16(bfloat16_t a, const bfloat16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 16, (int64_t)a);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x4_t vcopy_lane_bf16(const bfloat16x4_t& a, const int lane1, const bfloat16x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vcopyq_lane_bf16(const bfloat16x8_t& a, const int lane1, const bfloat16x4_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x4_t vcopy_laneq_bf16(const bfloat16x4_t& a, const int lane1, const bfloat16x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vcopyq_laneq_bf16(const bfloat16x8_t& a, const int lane1, const bfloat16x8_t& b, const int lane2) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = a.getLane(j);
    _nres[lane1] = b.getLane(lane2);
    return bfloat16x8_t(tm, _nres);
}
inline uint8x8_t vset_lane_u8(uint8_t a, const uint8x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 8, (int64_t)a);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vset_lane_u16(uint16_t a, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 16, (int64_t)a);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vset_lane_u32(uint32_t a, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 32, (int64_t)a);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vset_lane_u64(uint64_t a, const uint64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 64, (int64_t)a);
    return uint64x1_t(tm, _nres);
}
inline poly64x1_t vset_lane_p64(poly64_t a, const poly64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 64, (int64_t)a);
    return poly64x1_t(tm, _nres);
}
inline int8x8_t vset_lane_s8(int8_t a, const int8x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 8, (int64_t)a);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vset_lane_s16(int16_t a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 16, (int64_t)a);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vset_lane_s32(int32_t a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 32, (int64_t)a);
    return int32x2_t(tm, _nres);
}
inline int64x1_t vset_lane_s64(int64_t a, const int64x1_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 64, (int64_t)a);
    return int64x1_t(tm, _nres);
}
inline poly8x8_t vset_lane_p8(poly8_t a, const poly8x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 8, (int64_t)a);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vset_lane_p16(poly16_t a, const poly16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 16, (int64_t)a);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vset_lane_mf8(mfloat8_t a, const mfloat8x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 8, (int64_t)a);
    return mfloat8x8_t(tm, _nres);
}
inline uint8x16_t vsetq_lane_u8(uint8_t a, const uint8x16_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 8, (int64_t)a);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vsetq_lane_u16(uint16_t a, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 16, (int64_t)a);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vsetq_lane_u32(uint32_t a, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 32, (int64_t)a);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vsetq_lane_u64(uint64_t a, const uint64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 64, (int64_t)a);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vsetq_lane_p64(poly64_t a, const poly64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 64, (int64_t)a);
    return poly64x2_t(tm, _nres);
}
inline int8x16_t vsetq_lane_s8(int8_t a, const int8x16_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 8, (int64_t)a);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vsetq_lane_s16(int16_t a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 16, (int64_t)a);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vsetq_lane_s32(int32_t a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 32, (int64_t)a);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vsetq_lane_s64(int64_t a, const int64x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 64, (int64_t)a);
    return int64x2_t(tm, _nres);
}
inline poly8x16_t vsetq_lane_p8(poly8_t a, const poly8x16_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 8, (int64_t)a);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vsetq_lane_p16(poly16_t a, const poly16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 16, (int64_t)a);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vsetq_lane_mf8(mfloat8_t a, const mfloat8x16_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = v.getLane(j);
    _nres[lane] = mk_bv_val(tm, 8, (int64_t)a);
    return mfloat8x16_t(tm, _nres);
}
inline uint8_t vget_lane_u8(const uint8x8_t& v, const int lane) { return {}; }
inline uint16_t vget_lane_u16(const uint16x4_t& v, const int lane) { return {}; }
inline uint32_t vget_lane_u32(const uint32x2_t& v, const int lane) { g_ctx->set_scalar_result(v.getLane((size_t)lane)); return {}; }  // rsum: capture reduction sum
inline uint64_t vget_lane_u64(const uint64x1_t& v, const int lane) { return {}; }
inline poly64_t vget_lane_p64(const poly64x1_t& v, const int lane) { return {}; }
inline int64_t vget_lane_s64(const int64x1_t& v, const int lane) { return {}; }
inline poly8_t vget_lane_p8(const poly8x8_t& v, const int lane) { return {}; }
inline poly16_t vget_lane_p16(const poly16x4_t& v, const int lane) { return {}; }
inline uint8_t vgetq_lane_u8(const uint8x16_t& v, const int lane) { return {}; }
inline uint16_t vgetq_lane_u16(const uint16x8_t& v, const int lane) { return {}; }
inline uint32_t vgetq_lane_u32(const uint32x4_t& v, const int lane) { g_ctx->set_scalar_result(v.getLane((size_t)lane)); return {}; }  // rdsum &1 tail: capture last-channel column sum
inline poly64_t vgetq_lane_p64(const poly64x2_t& v, const int lane) { return {}; }
inline int64_t vgetq_lane_s64(const int64x2_t& v, const int lane) { return {}; }
inline poly8_t vgetq_lane_p8(const poly8x16_t& v, const int lane) { return {}; }
inline poly16_t vgetq_lane_p16(const poly16x8_t& v, const int lane) { return {}; }
inline int8_t vget_lane_s8(const int8x8_t& v, const int lane) { return {}; }
inline int16_t vget_lane_s16(const int16x4_t& v, const int lane) { return {}; }
inline int32_t vget_lane_s32(const int32x2_t& v, const int lane) { g_ctx->set_scalar_result(v.getLane((size_t)lane)); return {}; }  // rsum: capture reduction sum
inline int8_t vgetq_lane_s8(const int8x16_t& v, const int lane) { return {}; }
inline int16_t vgetq_lane_s16(const int16x8_t& v, const int lane) { return {}; }
inline int32_t vgetq_lane_s32(const int32x4_t& v, const int lane) { g_ctx->set_scalar_result(v.getLane((size_t)lane)); return {}; }  // rdsum &1 tail: capture last-channel column sum

} // namespace salt_cvc5
