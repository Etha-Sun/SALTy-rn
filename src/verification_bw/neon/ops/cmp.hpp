#pragma once
// NEON integer compares (result = same-width all-ones/zero)
#include "nhelp.hpp"
namespace salt {

inline uint8x8_t vceq_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vceqq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vceq_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vceq_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vceqq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint8x8_t vceq_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vceqq_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint64x1_t vceq_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vceqq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64x1_t vceq_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vceqq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64x1_t vceq_p64(const poly64x1_t& a, const poly64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vceqq_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vceqd_s64(int64_t a, int64_t b) { return {}; }
inline uint64_t vceqd_u64(uint64_t a, uint64_t b) { return {}; }
inline uint8x8_t vceqz_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vceqzq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vceqz_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vceqzq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vceqz_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vceqzq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint8x8_t vceqz_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vceqzq_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vceqz_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vceqzq_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vceqz_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vceqzq_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint8x8_t vceqz_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vceqzq_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint64x1_t vceqz_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vceqzq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64x1_t vceqz_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vceqzq_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64x1_t vceqz_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vceqzq_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_eq(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vceqzd_s64(int64_t a) { return {}; }
inline uint64_t vceqzd_u64(uint64_t a) { return {}; }
inline uint8x8_t vcgt_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcgtq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcgt_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vcgt_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vcgt_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgtq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcgtd_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vcgtz_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcgtzq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcgtz_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcgtzq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcgtz_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcgtzq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcgtz_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgtzq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sgt(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcgtzd_s64(int64_t a) { return {}; }
inline uint8x8_t vclt_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcltq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vclt_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vclt_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vclt_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcltq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcltd_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vcge_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcgeq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcge_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcgeq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcge_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcgeq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcge_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgeq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcged_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vcgez_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcgezq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcgez_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcgezq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcgez_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcgezq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcgez_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgezq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sge(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcgezd_s64(int64_t a) { return {}; }
inline uint8x8_t vcle_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcleq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcle_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcleq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcle_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcleq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcle_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcleq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcled_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vcgt_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ugt(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcgtq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_ugt(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcgt_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ugt(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vcgt_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ugt(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vcgt_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_ugt(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgtq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ugt(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcgtd_u64(uint64_t a, uint64_t b) { return {}; }
inline uint8x8_t vclt_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ult(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcltq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_ult(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vclt_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ult(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcltq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ult(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vclt_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ult(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcltq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ult(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vclt_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_ult(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcltq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ult(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcltd_u64(uint64_t a, uint64_t b) { return {}; }
inline uint8x8_t vcge_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_uge(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcgeq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_uge(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcge_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_uge(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcgeq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_uge(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcge_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_uge(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcgeq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_uge(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcge_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_uge(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcgeq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_uge(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcged_u64(uint64_t a, uint64_t b) { return {}; }
inline uint8x8_t vcle_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcleq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), b.getLane(i)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcle_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcleq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), b.getLane(i)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcle_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcleq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), b.getLane(i)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcle_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcleq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), b.getLane(i)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcled_u64(uint64_t a, uint64_t b) { return {}; }
inline uint8x8_t vclez_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vclezq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vclez_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vclezq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vclez_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vclezq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vclez_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vclezq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_sle(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint32x2_t vclez_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ule(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint64_t vclezd_s64(int64_t a) { return {}; }
inline uint8x8_t vcltz_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcltzq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vcltz_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vcltzq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,16,0)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vcltz_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vcltzq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,32,0)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vcltz_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vcltzq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_slt(tm, a.getLane(i), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vcltzd_s64(int64_t a) { return {}; }
inline uint8x8_t vtst_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vtstq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vtst_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,16,0)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vtstq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,16,0)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vtst_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vtstq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,32,0)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint8x8_t vtst_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vtstq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vtst_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,16,0)), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vtstq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,16,0)), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vtst_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,32,0)), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vtstq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,32,0)), 32);
    return uint32x4_t(tm, _nres);
}
inline uint8x8_t vtst_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,8,0)), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vtstq_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,8,0)), 8);
    return uint8x16_t(tm, _nres);
}
inline uint64x1_t vtst_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vtstq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64x1_t vtst_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vtstq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64x1_t vtst_p64(const poly64x1_t& a, const poly64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,64,0)), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vtstq_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = mask_from(tm, cmp_ne(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), mk_bv_val(tm,64,0)), 64);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vtstd_s64(int64_t a, int64_t b) { return {}; }
inline uint64_t vtstd_u64(uint64_t a, uint64_t b) { return {}; }

} // namespace salt
