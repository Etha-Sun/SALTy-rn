#pragma once
// NEON saturating add/sub/neg/abs, saturating shifts, doubling multiply-high
#include "arith_help.hpp"
namespace salt {

inline int8x16_t vqaddq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), b.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vqadd_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), b.getLane(i), 16);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vqadd_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), b.getLane(i), 32);
    return int32x2_t(tm, _nres);
}
inline int64x1_t vqadd_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), b.getLane(i), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vqaddq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), b.getLane(i), 64);
    return int64x2_t(tm, _nres);
}
inline int8_t vqaddb_s8(int8_t a, int8_t b) { return {}; }
inline int16_t vqaddh_s16(int16_t a, int16_t b) { return {}; }
inline int32_t vqadds_s32(int32_t a, int32_t b) { return {}; }
inline int64_t vqaddd_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vqadd_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_uadd(tm, a.getLane(i), b.getLane(i), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vqaddq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsat_uadd(tm, a.getLane(i), b.getLane(i), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vqadd_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_uadd(tm, a.getLane(i), b.getLane(i), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vqaddq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_uadd(tm, a.getLane(i), b.getLane(i), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vqadd_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_uadd(tm, a.getLane(i), b.getLane(i), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vqaddq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_uadd(tm, a.getLane(i), b.getLane(i), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vqadd_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsat_uadd(tm, a.getLane(i), b.getLane(i), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vqaddq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_uadd(tm, a.getLane(i), b.getLane(i), 64);
    return uint64x2_t(tm, _nres);
}
inline uint8_t vqaddb_u8(uint8_t a, uint8_t b) { return {}; }
inline uint16_t vqaddh_u16(uint16_t a, uint16_t b) { return {}; }
inline uint32_t vqadds_u32(uint32_t a, uint32_t b) { return {}; }
inline uint64_t vqaddd_u64(uint64_t a, uint64_t b) { return {}; }
inline int8x8_t vqsub_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), b.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vqsubq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), b.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vqsub_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), b.getLane(i), 16);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vqsub_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), b.getLane(i), 32);
    return int32x2_t(tm, _nres);
}
inline int64x1_t vqsub_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), b.getLane(i), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vqsubq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), b.getLane(i), 64);
    return int64x2_t(tm, _nres);
}
inline int8_t vqsubb_s8(int8_t a, int8_t b) { return {}; }
inline int16_t vqsubh_s16(int16_t a, int16_t b) { return {}; }
inline int32_t vqsubs_s32(int32_t a, int32_t b) { return {}; }
inline int64_t vqsubd_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vqsub_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_usub(tm, a.getLane(i), b.getLane(i), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vqsubq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsat_usub(tm, a.getLane(i), b.getLane(i), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vqsub_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_usub(tm, a.getLane(i), b.getLane(i), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vqsubq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_usub(tm, a.getLane(i), b.getLane(i), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vqsub_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_usub(tm, a.getLane(i), b.getLane(i), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vqsubq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_usub(tm, a.getLane(i), b.getLane(i), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vqsub_u64(const uint64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsat_usub(tm, a.getLane(i), b.getLane(i), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vqsubq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_usub(tm, a.getLane(i), b.getLane(i), 64);
    return uint64x2_t(tm, _nres);
}
inline uint8_t vqsubb_u8(uint8_t a, uint8_t b) { return {}; }
inline uint16_t vqsubh_u16(uint16_t a, uint16_t b) { return {}; }
inline uint32_t vqsubs_u32(uint32_t a, uint32_t b) { return {}; }
inline uint64_t vqsubd_u64(uint64_t a, uint64_t b) { return {}; }
inline int8x8_t vqneg_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_sqneg(tm, a.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vqnegq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsat_sqneg(tm, a.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vqneg_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sqneg(tm, a.getLane(i), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqnegq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_sqneg(tm, a.getLane(i), 16);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqneg_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sqneg(tm, a.getLane(i), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqnegq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sqneg(tm, a.getLane(i), 32);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vqneg_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsat_sqneg(tm, a.getLane(i), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vqnegq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sqneg(tm, a.getLane(i), 64);
    return int64x2_t(tm, _nres);
}
inline int8_t vqnegb_s8(int8_t a) { return {}; }
inline int16_t vqnegh_s16(int16_t a) { return {}; }
inline int32_t vqnegs_s32(int32_t a) { return {}; }
inline int64_t vqnegd_s64(int64_t a) { return {}; }
inline int8x8_t vqabs_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_sqabs(tm, a.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vqabsq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsat_sqabs(tm, a.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vqabs_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sqabs(tm, a.getLane(i), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqabsq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_sqabs(tm, a.getLane(i), 16);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqabs_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sqabs(tm, a.getLane(i), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqabsq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sqabs(tm, a.getLane(i), 32);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vqabs_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsat_sqabs(tm, a.getLane(i), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vqabsq_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sqabs(tm, a.getLane(i), 64);
    return int64x2_t(tm, _nres);
}
inline int8_t vqabsb_s8(int8_t a) { return {}; }
inline int16_t vqabsh_s16(int16_t a) { return {}; }
inline int32_t vqabss_s32(int32_t a) { return {}; }
inline int64_t vqabsd_s64(int64_t a) { return {}; }
inline int8x8_t vuqadd_s8(const int8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_suqadd(tm, a.getLane(i), b.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vuqaddq_s8(const int8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsat_suqadd(tm, a.getLane(i), b.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vuqadd_s16(const int16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_suqadd(tm, a.getLane(i), b.getLane(i), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vuqaddq_s16(const int16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_suqadd(tm, a.getLane(i), b.getLane(i), 16);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vuqadd_s32(const int32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_suqadd(tm, a.getLane(i), b.getLane(i), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vuqaddq_s32(const int32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_suqadd(tm, a.getLane(i), b.getLane(i), 32);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vuqadd_s64(const int64x1_t& a, const uint64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsat_suqadd(tm, a.getLane(i), b.getLane(i), 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vuqaddq_s64(const int64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_suqadd(tm, a.getLane(i), b.getLane(i), 64);
    return int64x2_t(tm, _nres);
}
inline int8_t vuqaddb_s8(int8_t a, uint8_t b) { return {}; }
inline int16_t vuqaddh_s16(int16_t a, uint16_t b) { return {}; }
inline int32_t vuqadds_s32(int32_t a, uint32_t b) { return {}; }
inline int64_t vuqaddd_s64(int64_t a, uint64_t b) { return {}; }
inline uint8x8_t vsqadd_u8(const uint8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_usqadd(tm, a.getLane(i), b.getLane(i), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vsqaddq_u8(const uint8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsat_usqadd(tm, a.getLane(i), b.getLane(i), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vsqadd_u16(const uint16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_usqadd(tm, a.getLane(i), b.getLane(i), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vsqaddq_u16(const uint16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsat_usqadd(tm, a.getLane(i), b.getLane(i), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vsqadd_u32(const uint32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_usqadd(tm, a.getLane(i), b.getLane(i), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vsqaddq_u32(const uint32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_usqadd(tm, a.getLane(i), b.getLane(i), 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vsqadd_u64(const uint64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsat_usqadd(tm, a.getLane(i), b.getLane(i), 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vsqaddq_u64(const uint64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_usqadd(tm, a.getLane(i), b.getLane(i), 64);
    return uint64x2_t(tm, _nres);
}
inline uint8_t vsqaddb_u8(uint8_t a, int8_t b) { return {}; }
inline uint16_t vsqaddh_u16(uint16_t a, int16_t b) { return {}; }
inline uint32_t vsqadds_u32(uint32_t a, int32_t b) { return {}; }
inline uint64_t vsqaddd_u64(uint64_t a, int64_t b) { return {}; }
inline int8x8_t vqshl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 8, false, true, false);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vqshlq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 8, false, true, false);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vqshl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 16, false, true, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqshlq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 16, false, true, false);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqshl_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 32, false, true, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqshlq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 32, false, true, false);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vqshl_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 64, false, true, false);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vqshlq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 64, false, true, false);
    return int64x2_t(tm, _nres);
}
inline int8_t vqshlb_s8(int8_t a, int8_t b) { return {}; }
inline int16_t vqshlh_s16(int16_t a, int16_t b) { return {}; }
inline int32_t vqshls_s32(int32_t a, int32_t b) { return {}; }
inline int64_t vqshld_s64(int64_t a, int64_t b) { return {}; }
inline int8x8_t vqshl_n_s8(const int8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,8,n), 8, false, true);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vqshlq_n_s8(const int8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,8,n), 8, false, true);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vqshl_n_s16(const int16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,16,n), 16, false, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqshlq_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,16,n), 16, false, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqshl_n_s32(const int32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,32,n), 32, false, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqshlq_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,32,n), 32, false, true);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vqshl_n_s64(const int64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,64,n), 64, false, true);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vqshlq_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,64,n), 64, false, true);
    return int64x2_t(tm, _nres);
}
inline int8_t vqshlb_n_s8(int8_t a, const int n) { return {}; }
inline int16_t vqshlh_n_s16(int16_t a, const int n) { return {}; }
inline int32_t vqshls_n_s32(int32_t a, const int n) { return {}; }
inline int64_t vqshld_n_s64(int64_t a, const int n) { return {}; }
inline uint8x8_t vqshl_u8(const uint8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 8, true, false, false);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vqshlq_u8(const uint8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 8, true, false, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vqshl_u16(const uint16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 16, true, false, false);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vqshlq_u16(const uint16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 16, true, false, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vqshl_u32(const uint32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 32, true, false, false);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vqshlq_u32(const uint32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 32, true, false, false);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vqshl_u64(const uint64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 64, true, false, false);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vqshlq_u64(const uint64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 64, true, false, false);
    return uint64x2_t(tm, _nres);
}
inline uint8_t vqshlb_u8(uint8_t a, int8_t b) { return {}; }
inline uint16_t vqshlh_u16(uint16_t a, int16_t b) { return {}; }
inline uint32_t vqshls_u32(uint32_t a, int32_t b) { return {}; }
inline uint64_t vqshld_u64(uint64_t a, int64_t b) { return {}; }
inline uint8x8_t vqshl_n_u8(const uint8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,8,n), 8, true, false);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vqshlq_n_u8(const uint8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,8,n), 8, true, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vqshl_n_u16(const uint16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,16,n), 16, true, false);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vqshlq_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,16,n), 16, true, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vqshl_n_u32(const uint32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,32,n), 32, true, false);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vqshlq_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,32,n), 32, true, false);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vqshl_n_u64(const uint64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,64,n), 64, true, false);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vqshlq_n_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,64,n), 64, true, false);
    return uint64x2_t(tm, _nres);
}
inline uint8_t vqshlb_n_u8(uint8_t a, const int n) { return {}; }
inline uint16_t vqshlh_n_u16(uint16_t a, const int n) { return {}; }
inline uint32_t vqshls_n_u32(uint32_t a, const int n) { return {}; }
inline uint64_t vqshld_n_u64(uint64_t a, const int n) { return {}; }
inline uint8x8_t vqshlu_n_s8(const int8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,8,n), 8, true, true);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vqshluq_n_s8(const int8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,8,n), 8, true, true);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vqshlu_n_s16(const int16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,16,n), 16, true, true);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vqshluq_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,16,n), 16, true, true);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vqshlu_n_s32(const int32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,32,n), 32, true, true);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vqshluq_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,32,n), 32, true, true);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vqshlu_n_s64(const int64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,64,n), 64, true, true);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vqshluq_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_left(tm, a.getLane(i), mk_bv_val(tm,64,n), 64, true, true);
    return uint64x2_t(tm, _nres);
}
inline uint8_t vqshlub_n_s8(int8_t a, const int n) { return {}; }
inline uint16_t vqshluh_n_s16(int16_t a, const int n) { return {}; }
inline uint32_t vqshlus_n_s32(int32_t a, const int n) { return {}; }
inline uint64_t vqshlud_n_s64(int64_t a, const int n) { return {}; }
inline int8x8_t vqrshl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 8, false, true, true);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vqrshlq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 8, false, true, true);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vqrshl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 16, false, true, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqrshlq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 16, false, true, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqrshl_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 32, false, true, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqrshlq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 32, false, true, true);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vqrshl_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 64, false, true, true);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vqrshlq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 64, false, true, true);
    return int64x2_t(tm, _nres);
}
inline int8_t vqrshlb_s8(int8_t a, int8_t b) { return {}; }
inline int16_t vqrshlh_s16(int16_t a, int16_t b) { return {}; }
inline int32_t vqrshls_s32(int32_t a, int32_t b) { return {}; }
inline int64_t vqrshld_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vqrshl_u8(const uint8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 8, true, false, true);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vqrshlq_u8(const uint8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 8, true, false, true);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vqrshl_u16(const uint16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 16, true, false, true);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vqrshlq_u16(const uint16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 16, true, false, true);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vqrshl_u32(const uint32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 32, true, false, true);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vqrshlq_u32(const uint32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 32, true, false, true);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vqrshl_u64(const uint64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 64, true, false, true);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vqrshlq_u64(const uint64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqsh_reg(tm, a.getLane(i), b.getLane(i), 64, true, false, true);
    return uint64x2_t(tm, _nres);
}
inline uint8_t vqrshlb_u8(uint8_t a, int8_t b) { return {}; }
inline uint16_t vqrshlh_u16(uint16_t a, int16_t b) { return {}; }
inline uint32_t vqrshls_u32(uint32_t a, int32_t b) { return {}; }
inline uint64_t vqrshld_u64(uint64_t a, int64_t b) { return {}; }
inline int16x4_t vqdmulh_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), b.getLane(i), 16, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqdmulhq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), b.getLane(i), 16, false);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqdmulh_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), b.getLane(i), 32, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqdmulhq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), b.getLane(i), 32, false);
    return int32x4_t(tm, _nres);
}
inline int16_t vqdmulhh_s16(int16_t a, int16_t b) { return {}; }
inline int32_t vqdmulhs_s32(int32_t a, int32_t b) { return {}; }
inline int16x4_t vqdmulh_n_s16(const int16x4_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), mk_bv_val(tm, 16, (int64_t)b), 16, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqdmulhq_n_s16(const int16x8_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), mk_bv_val(tm, 16, (int64_t)b), 16, false);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqdmulh_n_s32(const int32x2_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), mk_bv_val(tm, 32, (int64_t)b), 32, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqdmulhq_n_s32(const int32x4_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), mk_bv_val(tm, 32, (int64_t)b), 32, false);
    return int32x4_t(tm, _nres);
}
inline int16x4_t vqdmulh_lane_s16(const int16x4_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 16, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqdmulhq_lane_s16(const int16x8_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 16, false);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqdmulh_lane_s32(const int32x2_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 32, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqdmulhq_lane_s32(const int32x4_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 32, false);
    return int32x4_t(tm, _nres);
}
inline int16_t vqdmulhh_lane_s16(int16_t a, const int16x4_t& v, const int lane) { return {}; }
inline int32_t vqdmulhs_lane_s32(int32_t a, const int32x2_t& v, const int lane) { return {}; }
inline int16x4_t vqdmulh_laneq_s16(const int16x4_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 16, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqdmulhq_laneq_s16(const int16x8_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 16, false);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqdmulh_laneq_s32(const int32x2_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 32, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqdmulhq_laneq_s32(const int32x4_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 32, false);
    return int32x4_t(tm, _nres);
}
inline int16_t vqdmulhh_laneq_s16(int16_t a, const int16x8_t& v, const int lane) { return {}; }
inline int32_t vqdmulhs_laneq_s32(int32_t a, const int32x4_t& v, const int lane) { return {}; }
inline int16_t vqrdmulhh_s16(int16_t a, int16_t b) { return {}; }
inline int32_t vqrdmulhs_s32(int32_t a, int32_t b) { return {}; }
inline int16x4_t vqrdmulh_n_s16(const int16x4_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), mk_bv_val(tm, 16, (int64_t)b), 16, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqrdmulhq_n_s16(const int16x8_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), mk_bv_val(tm, 16, (int64_t)b), 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqrdmulh_n_s32(const int32x2_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), mk_bv_val(tm, 32, (int64_t)b), 32, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqrdmulhq_n_s32(const int32x4_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), mk_bv_val(tm, 32, (int64_t)b), 32, true);
    return int32x4_t(tm, _nres);
}
inline int16x4_t vqrdmulh_lane_s16(const int16x4_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 16, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqrdmulhq_lane_s16(const int16x8_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqrdmulh_lane_s32(const int32x2_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 32, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqrdmulhq_lane_s32(const int32x4_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 32, true);
    return int32x4_t(tm, _nres);
}
inline int16_t vqrdmulhh_lane_s16(int16_t a, const int16x4_t& v, const int lane) { return {}; }
inline int32_t vqrdmulhs_lane_s32(int32_t a, const int32x2_t& v, const int lane) { return {}; }
inline int16x4_t vqrdmulh_laneq_s16(const int16x4_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 16, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqrdmulhq_laneq_s16(const int16x8_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqrdmulh_laneq_s32(const int32x2_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 32, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqrdmulhq_laneq_s32(const int32x4_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mulh(tm, a.getLane(i), v.getLane(lane), 32, true);
    return int32x4_t(tm, _nres);
}
inline int16_t vqrdmulhh_laneq_s16(int16_t a, const int16x8_t& v, const int lane) { return {}; }
inline int32_t vqrdmulhs_laneq_s32(int32_t a, const int32x4_t& v, const int lane) { return {}; }
inline int16x4_t vqrdmlah_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), c.getLane(i), 16, false);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vqrdmlah_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), c.getLane(i), 32, false);
    return int32x2_t(tm, _nres);
}
inline int16x8_t vqrdmlahq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), c.getLane(i), 16, false);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vqrdmlahq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), c.getLane(i), 32, false);
    return int32x4_t(tm, _nres);
}
inline int16x4_t vqrdmlah_lane_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 16, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqrdmlahq_lane_s16(const int16x8_t& a, const int16x8_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 16, false);
    return int16x8_t(tm, _nres);
}
inline int16x4_t vqrdmlah_laneq_s16(const int16x4_t& a, const int16x4_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 16, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqrdmlahq_laneq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 16, false);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqrdmlah_lane_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 32, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqrdmlahq_lane_s32(const int32x4_t& a, const int32x4_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 32, false);
    return int32x4_t(tm, _nres);
}
inline int32x2_t vqrdmlah_laneq_s32(const int32x2_t& a, const int32x2_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 32, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqrdmlahq_laneq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 32, false);
    return int32x4_t(tm, _nres);
}
inline int16_t vqrdmlahh_lane_s16(int16_t a, int16_t b, const int16x4_t& v, const int lane) { return {}; }
inline int16_t vqrdmlahh_laneq_s16(int16_t a, int16_t b, const int16x8_t& v, const int lane) { return {}; }
inline int32_t vqrdmlahs_lane_s32(int32_t a, int32_t b, const int32x2_t& v, const int lane) { return {}; }
inline int32_t vqrdmlahs_laneq_s32(int32_t a, int32_t b, const int32x4_t& v, const int lane) { return {}; }
inline int16x4_t vqrdmlsh_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), c.getLane(i), 16, true);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vqrdmlsh_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), c.getLane(i), 32, true);
    return int32x2_t(tm, _nres);
}
inline int16x8_t vqrdmlshq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), c.getLane(i), 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vqrdmlshq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), c.getLane(i), 32, true);
    return int32x4_t(tm, _nres);
}
inline int16x4_t vqrdmlsh_lane_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 16, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqrdmlshq_lane_s16(const int16x8_t& a, const int16x8_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 16, true);
    return int16x8_t(tm, _nres);
}
inline int16x4_t vqrdmlsh_laneq_s16(const int16x4_t& a, const int16x4_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 16, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vqrdmlshq_laneq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vqrdmlsh_lane_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 32, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqrdmlshq_lane_s32(const int32x4_t& a, const int32x4_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 32, true);
    return int32x4_t(tm, _nres);
}
inline int32x2_t vqrdmlsh_laneq_s32(const int32x2_t& a, const int32x2_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 32, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vqrdmlshq_laneq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqd_mlah(tm, a.getLane(i), b.getLane(i), v.getLane(lane), 32, true);
    return int32x4_t(tm, _nres);
}
inline int16_t vqrdmlahh_s16(int16_t a, int16_t b, int16_t c) { return {}; }
inline int32_t vqrdmlahs_s32(int32_t a, int32_t b, int32_t c) { return {}; }
inline int16_t vqrdmlshh_s16(int16_t a, int16_t b, int16_t c) { return {}; }
inline int32_t vqrdmlshs_s32(int32_t a, int32_t b, int32_t c) { return {}; }
inline int16_t vqrdmlshh_lane_s16(int16_t a, int16_t b, const int16x4_t& v, const int lane) { return {}; }
inline int16_t vqrdmlshh_laneq_s16(int16_t a, int16_t b, const int16x8_t& v, const int lane) { return {}; }
inline int32_t vqrdmlshs_lane_s32(int32_t a, int32_t b, const int32x2_t& v, const int lane) { return {}; }
inline int32_t vqrdmlshs_laneq_s32(int32_t a, int32_t b, const int32x4_t& v, const int lane) { return {}; }

} // namespace salt
