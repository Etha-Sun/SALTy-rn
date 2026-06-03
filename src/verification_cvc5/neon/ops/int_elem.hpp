#pragma once
// NEON integer elementwise: add/sub/mul/logic/minmax/mla/mls/abs/neg/mvn
#include "nhelp.hpp"
namespace salt_cvc5 {

inline int8x8_t vadd_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vaddq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vadd_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int64x1_t vadd_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vaddq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vadd_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vaddq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return uint8x16_t(tm, _nres);
}
inline uint64x1_t vadd_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vaddq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), b.getLane(i));
    return uint64x2_t(tm, _nres);
}
inline int64_t vaddd_s64(int64_t a, int64_t b) { return a+b; }
inline uint64_t vaddd_u64(uint64_t a, uint64_t b) { return a+b; }
inline int8x8_t vsub_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vsubq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vsub_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vsub_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vsubq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vsub_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vsubq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vsub_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vsub_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vsubq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vsub_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vsubq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vsub_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vsubq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), b.getLane(i));
    return uint64x2_t(tm, _nres);
}
inline int64_t vsubd_s64(int64_t a, int64_t b) { return a-b; }
inline uint64_t vsubd_u64(uint64_t a, uint64_t b) { return a-b; }
inline int8x8_t vmul_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vmulq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vmul_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return int16x4_t(tm, _nres);
}
inline uint8x8_t vmul_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vmulq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vmul_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmulq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmul_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmulq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), b.getLane(i));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmul_n_s16(const int16x4_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), mk_bv_val(tm, 16, (int64_t)b));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmulq_n_s16(const int16x8_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), mk_bv_val(tm, 16, (int64_t)b));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmul_n_s32(const int32x2_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), mk_bv_val(tm, 32, (int64_t)b));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmulq_n_s32(const int32x4_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), mk_bv_val(tm, 32, (int64_t)b));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmul_n_u16(const uint16x4_t& a, uint16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), mk_bv_val(tm, 16, (int64_t)b));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmulq_n_u16(const uint16x8_t& a, uint16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), mk_bv_val(tm, 16, (int64_t)b));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmul_n_u32(const uint32x2_t& a, uint32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), mk_bv_val(tm, 32, (int64_t)b));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmulq_n_u32(const uint32x4_t& a, uint32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), mk_bv_val(tm, 32, (int64_t)b));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmul_lane_s16(const int16x4_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmulq_lane_s16(const int16x8_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmul_lane_s32(const int32x2_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmulq_lane_s32(const int32x4_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmul_lane_u16(const uint16x4_t& a, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmulq_lane_u16(const uint16x8_t& a, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmul_lane_u32(const uint32x2_t& a, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmulq_lane_u32(const uint32x4_t& a, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmul_laneq_s16(const int16x4_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmulq_laneq_s16(const int16x8_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmul_laneq_s32(const int32x2_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmulq_laneq_s32(const int32x4_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmul_laneq_u16(const uint16x4_t& a, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmulq_laneq_u16(const uint16x8_t& a, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmul_laneq_u32(const uint32x2_t& a, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmulq_laneq_u32(const uint32x4_t& a, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, a.getLane(i), v.getLane(lane));
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vand_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vandq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vand_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vandq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vand_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int64x1_t vand_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vandq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return int64x2_t(tm, _nres);
}
inline uint8x16_t vandq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return uint8x16_t(tm, _nres);
}
inline uint32x2_t vand_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vand_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vandq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvand(tm, a.getLane(i), b.getLane(i));
    return uint64x2_t(tm, _nres);
}
inline int8x8_t vorr_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vorrq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vorr_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vorrq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vorr_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vorrq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vorr_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vorrq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vorr_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vorrq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vorr_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vorrq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vorr_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vorrq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vorr_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vorrq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, a.getLane(i), b.getLane(i));
    return uint64x2_t(tm, _nres);
}
inline int8x8_t veor_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t veorq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t veor_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int16x8_t veorq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return int16x8_t(tm, _nres);
}
inline int32x2_t veor_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int32x4_t veorq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return int32x4_t(tm, _nres);
}
inline int64x1_t veor_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return int64x1_t(tm, _nres);
}
inline int64x2_t veorq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return int64x2_t(tm, _nres);
}
inline uint8x8_t veor_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t veorq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t veor_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t veorq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t veor_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t veorq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t veor_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t veorq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return uint64x2_t(tm, _nres);
}
inline poly8x8_t vadd_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vadd_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return poly16x4_t(tm, _nres);
}
inline poly64x1_t vadd_p64(const poly64x1_t& a, const poly64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return poly64x1_t(tm, _nres);
}
inline poly8x16_t vaddq_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vaddq_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return poly16x8_t(tm, _nres);
}
inline poly64x2_t vaddq_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), b.getLane(i));
    return poly64x2_t(tm, _nres);
}
inline poly128_t vaddq_p128(poly128_t a, poly128_t b) { return {}; }
inline int8x8_t vbic_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vbicq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vbic_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vbicq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vbic_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vbicq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vbic_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vbicq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vbic_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vbicq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vbic_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vbic_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vbic_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vbicq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvand(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint64x2_t(tm, _nres);
}
inline int8x8_t vorn_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vornq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vorn_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vornq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vorn_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vornq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vorn_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vornq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vorn_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vornq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vorn_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vornq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vorn_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vornq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vorn_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vornq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, a.getLane(i), fold_bvnot(tm, b.getLane(i)));
    return uint64x2_t(tm, _nres);
}
inline int8x8_t vmvn_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vmvnq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vmvn_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmvnq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmvn_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmvnq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vmvn_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vmvnq_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vmvn_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmvnq_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmvn_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmvnq_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return uint32x4_t(tm, _nres);
}
inline poly8x8_t vmvn_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vmvnq_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvnot(tm, a.getLane(i));
    return poly8x16_t(tm, _nres);
}
inline int8x8_t vneg_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvneg(tm, a.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vnegq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvneg(tm, a.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vneg_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvneg(tm, a.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vnegq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvneg(tm, a.getLane(i));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vneg_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvneg(tm, a.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vnegq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvneg(tm, a.getLane(i));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vneg_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvneg(tm, a.getLane(i));
    return int64x1_t(tm, _nres);
}
inline int64_t vnegd_s64(int64_t a) { return (decltype(a))(-(a)); }
inline int64x2_t vnegq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvneg(tm, a.getLane(i));
    return int64x2_t(tm, _nres);
}
inline int8x8_t vabs_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_ite(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,8,0)), fold_bvneg(tm, a.getLane(i)), a.getLane(i));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vabsq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_ite(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,8,0)), fold_bvneg(tm, a.getLane(i)), a.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vabs_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_ite(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,16,0)), fold_bvneg(tm, a.getLane(i)), a.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vabsq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_ite(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,16,0)), fold_bvneg(tm, a.getLane(i)), a.getLane(i));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vabs_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_ite(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,32,0)), fold_bvneg(tm, a.getLane(i)), a.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vabsq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_ite(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,32,0)), fold_bvneg(tm, a.getLane(i)), a.getLane(i));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vabs_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_ite(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,64,0)), fold_bvneg(tm, a.getLane(i)), a.getLane(i));
    return int64x1_t(tm, _nres);
}
inline int64_t vabsd_s64(int64_t a) { return a<0?(decltype(a))(-(a)):a; }
inline int64x2_t vabsq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_ite(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,64,0)), fold_bvneg(tm, a.getLane(i)), a.getLane(i));
    return int64x2_t(tm, _nres);
}
inline int16x4_t vmin_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = bv_smin(tm, a.getLane(i), b.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vmin_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = bv_smin(tm, a.getLane(i), b.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vminq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = bv_smin(tm, a.getLane(i), b.getLane(i));
    return int32x4_t(tm, _nres);
}
inline int16x4_t vmax_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = bv_smax(tm, a.getLane(i), b.getLane(i));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vmax_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = bv_smax(tm, a.getLane(i), b.getLane(i));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmaxq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = bv_smax(tm, a.getLane(i), b.getLane(i));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmin_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = bv_umin(tm, a.getLane(i), b.getLane(i));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vminq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = bv_umin(tm, a.getLane(i), b.getLane(i));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmin_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = bv_umin(tm, a.getLane(i), b.getLane(i));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vminq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = bv_umin(tm, a.getLane(i), b.getLane(i));
    return uint32x4_t(tm, _nres);
}
inline uint16x4_t vmax_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = bv_umax(tm, a.getLane(i), b.getLane(i));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmaxq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = bv_umax(tm, a.getLane(i), b.getLane(i));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmax_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = bv_umax(tm, a.getLane(i), b.getLane(i));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmaxq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = bv_umax(tm, a.getLane(i), b.getLane(i));
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vmla_s8(const int8x8_t& a, const int8x8_t& b, const int8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vmlaq_s8(const int8x16_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vmla_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmlaq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmla_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vmla_u8(const uint8x8_t& a, const uint8x8_t& b, const uint8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vmlaq_u8(const uint8x16_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vmla_u16(const uint16x4_t& a, const uint16x4_t& b, const uint16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmlaq_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmla_u32(const uint32x2_t& a, const uint32x2_t& b, const uint32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmlaq_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmla_lane_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmlaq_lane_s16(const int16x8_t& a, const int16x8_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmla_lane_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmlaq_lane_s32(const int32x4_t& a, const int32x4_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmla_lane_u16(const uint16x4_t& a, const uint16x4_t& b, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmlaq_lane_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmla_lane_u32(const uint32x2_t& a, const uint32x2_t& b, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmlaq_lane_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmla_laneq_s16(const int16x4_t& a, const int16x4_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmlaq_laneq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmla_laneq_s32(const int32x2_t& a, const int32x2_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmlaq_laneq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmla_laneq_u16(const uint16x4_t& a, const uint16x4_t& b, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmlaq_laneq_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmla_laneq_u32(const uint32x2_t& a, const uint32x2_t& b, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmlaq_laneq_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmla_n_s16(const int16x4_t& a, const int16x4_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 16, (int64_t)c)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmlaq_n_s16(const int16x8_t& a, const int16x8_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 16, (int64_t)c)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmla_n_s32(const int32x2_t& a, const int32x2_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 32, (int64_t)c)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmlaq_n_s32(const int32x4_t& a, const int32x4_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 32, (int64_t)c)));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmla_n_u16(const uint16x4_t& a, const uint16x4_t& b, uint16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 16, (int64_t)c)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmlaq_n_u16(const uint16x8_t& a, const uint16x8_t& b, uint16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 16, (int64_t)c)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmla_n_u32(const uint32x2_t& a, const uint32x2_t& b, uint32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 32, (int64_t)c)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmlaq_n_u32(const uint32x4_t& a, const uint32x4_t& b, uint32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 32, (int64_t)c)));
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vmls_s8(const int8x8_t& a, const int8x8_t& b, const int8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vmlsq_s8(const int8x16_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vmls_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmlsq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmls_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmlsq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vmls_u8(const uint8x8_t& a, const uint8x8_t& b, const uint8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vmlsq_u8(const uint8x16_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vmls_u16(const uint16x4_t& a, const uint16x4_t& b, const uint16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmlsq_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmls_u32(const uint32x2_t& a, const uint32x2_t& b, const uint32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmlsq_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), c.getLane(i)));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmls_lane_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmlsq_lane_s16(const int16x8_t& a, const int16x8_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmls_lane_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmlsq_lane_s32(const int32x4_t& a, const int32x4_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmls_lane_u16(const uint16x4_t& a, const uint16x4_t& b, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmlsq_lane_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmls_lane_u32(const uint32x2_t& a, const uint32x2_t& b, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmlsq_lane_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmls_laneq_s16(const int16x4_t& a, const int16x4_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmlsq_laneq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmls_laneq_s32(const int32x2_t& a, const int32x2_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmlsq_laneq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmls_laneq_u16(const uint16x4_t& a, const uint16x4_t& b, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmlsq_laneq_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmls_laneq_u32(const uint32x2_t& a, const uint32x2_t& b, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmlsq_laneq_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), v.getLane(lane)));
    return uint32x4_t(tm, _nres);
}
inline int16x4_t vmls_n_s16(const int16x4_t& a, const int16x4_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 16, (int64_t)c)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vmlsq_n_s16(const int16x8_t& a, const int16x8_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 16, (int64_t)c)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vmls_n_s32(const int32x2_t& a, const int32x2_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 32, (int64_t)c)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vmlsq_n_s32(const int32x4_t& a, const int32x4_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 32, (int64_t)c)));
    return int32x4_t(tm, _nres);
}
inline uint16x4_t vmls_n_u16(const uint16x4_t& a, const uint16x4_t& b, uint16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 16, (int64_t)c)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vmlsq_n_u16(const uint16x8_t& a, const uint16x8_t& b, uint16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 16, (int64_t)c)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vmls_n_u32(const uint32x2_t& a, const uint32x2_t& b, uint32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 32, (int64_t)c)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vmlsq_n_u32(const uint32x4_t& a, const uint32x4_t& b, uint32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, b.getLane(i), mk_bv_val(tm, 32, (int64_t)c)));
    return uint32x4_t(tm, _nres);
}

} // namespace salt_cvc5
