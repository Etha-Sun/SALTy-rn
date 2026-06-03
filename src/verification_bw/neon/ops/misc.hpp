#pragma once
// NEON halving/abd/aba/pairwise/bitcount/reverse/reductions
#include "arith_help.hpp"
namespace salt {

inline int8x8_t vhsub_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 8, true, true, false);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vhsubq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 8, true, true, false);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vhsub_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 16, true, true, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vhsubq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 16, true, true, false);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vhsub_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 32, true, true, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vhsubq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 32, true, true, false);
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vhsub_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 8, false, true, false);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vhsubq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 8, false, true, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vhsub_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 16, false, true, false);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vhsubq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 16, false, true, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vhsub_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 32, false, true, false);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vhsubq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nhalf(tm, a.getLane(i), b.getLane(i), 32, false, true, false);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vabd_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 8, true);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vabdq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 8, true);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vabd_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 16, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vabdq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vabd_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 32, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vabdq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 32, true);
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vabd_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 8, false);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vabdq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 8, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vabd_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 16, false);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vabdq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 16, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vabd_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 32, false);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vabdq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nabd(tm, a.getLane(i), b.getLane(i), 32, false);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vaba_s8(const int8x8_t& a, const int8x8_t& b, const int8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 8, true));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vabaq_s8(const int8x16_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 8, true));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vaba_s16(const int16x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 16, true));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vabaq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 16, true));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vaba_s32(const int32x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 32, true));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vabaq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 32, true));
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vaba_u8(const uint8x8_t& a, const uint8x8_t& b, const uint8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 8, false));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vabaq_u8(const uint8x16_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 8, false));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vaba_u16(const uint16x4_t& a, const uint16x4_t& b, const uint16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 16, false));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vabaq_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 16, false));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vaba_u32(const uint32x2_t& a, const uint32x2_t& b, const uint32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 32, false));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vabaq_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabd(tm, b.getLane(i), c.getLane(i), 32, false));
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vpadd_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, a.getLane(4), a.getLane(5));
    _nres[3] = fold_bvadd(tm, a.getLane(6), a.getLane(7));
    _nres[4] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[5] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    _nres[6] = fold_bvadd(tm, b.getLane(4), b.getLane(5));
    _nres[7] = fold_bvadd(tm, b.getLane(6), b.getLane(7));
    return int8x8_t(tm, _nres);
}
inline int16x4_t vpadd_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[3] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    return int16x4_t(tm, _nres);
}
inline uint8x8_t vpadd_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, a.getLane(4), a.getLane(5));
    _nres[3] = fold_bvadd(tm, a.getLane(6), a.getLane(7));
    _nres[4] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[5] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    _nres[6] = fold_bvadd(tm, b.getLane(4), b.getLane(5));
    _nres[7] = fold_bvadd(tm, b.getLane(6), b.getLane(7));
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vpadd_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[3] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vpadd_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    return uint32x2_t(tm, _nres);
}
inline int8x16_t vpaddq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, a.getLane(4), a.getLane(5));
    _nres[3] = fold_bvadd(tm, a.getLane(6), a.getLane(7));
    _nres[4] = fold_bvadd(tm, a.getLane(8), a.getLane(9));
    _nres[5] = fold_bvadd(tm, a.getLane(10), a.getLane(11));
    _nres[6] = fold_bvadd(tm, a.getLane(12), a.getLane(13));
    _nres[7] = fold_bvadd(tm, a.getLane(14), a.getLane(15));
    _nres[8] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[9] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    _nres[10] = fold_bvadd(tm, b.getLane(4), b.getLane(5));
    _nres[11] = fold_bvadd(tm, b.getLane(6), b.getLane(7));
    _nres[12] = fold_bvadd(tm, b.getLane(8), b.getLane(9));
    _nres[13] = fold_bvadd(tm, b.getLane(10), b.getLane(11));
    _nres[14] = fold_bvadd(tm, b.getLane(12), b.getLane(13));
    _nres[15] = fold_bvadd(tm, b.getLane(14), b.getLane(15));
    return int8x16_t(tm, _nres);
}
inline int16x8_t vpaddq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, a.getLane(4), a.getLane(5));
    _nres[3] = fold_bvadd(tm, a.getLane(6), a.getLane(7));
    _nres[4] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[5] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    _nres[6] = fold_bvadd(tm, b.getLane(4), b.getLane(5));
    _nres[7] = fold_bvadd(tm, b.getLane(6), b.getLane(7));
    return int16x8_t(tm, _nres);
}
inline int64x2_t vpaddq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    return int64x2_t(tm, _nres);
}
inline uint8x16_t vpaddq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, a.getLane(4), a.getLane(5));
    _nres[3] = fold_bvadd(tm, a.getLane(6), a.getLane(7));
    _nres[4] = fold_bvadd(tm, a.getLane(8), a.getLane(9));
    _nres[5] = fold_bvadd(tm, a.getLane(10), a.getLane(11));
    _nres[6] = fold_bvadd(tm, a.getLane(12), a.getLane(13));
    _nres[7] = fold_bvadd(tm, a.getLane(14), a.getLane(15));
    _nres[8] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[9] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    _nres[10] = fold_bvadd(tm, b.getLane(4), b.getLane(5));
    _nres[11] = fold_bvadd(tm, b.getLane(6), b.getLane(7));
    _nres[12] = fold_bvadd(tm, b.getLane(8), b.getLane(9));
    _nres[13] = fold_bvadd(tm, b.getLane(10), b.getLane(11));
    _nres[14] = fold_bvadd(tm, b.getLane(12), b.getLane(13));
    _nres[15] = fold_bvadd(tm, b.getLane(14), b.getLane(15));
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vpaddq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, a.getLane(4), a.getLane(5));
    _nres[3] = fold_bvadd(tm, a.getLane(6), a.getLane(7));
    _nres[4] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[5] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    _nres[6] = fold_bvadd(tm, b.getLane(4), b.getLane(5));
    _nres[7] = fold_bvadd(tm, b.getLane(6), b.getLane(7));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vpaddq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, a.getLane(2), a.getLane(3));
    _nres[2] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    _nres[3] = fold_bvadd(tm, b.getLane(2), b.getLane(3));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vpaddq_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, a.getLane(0), a.getLane(1));
    _nres[1] = fold_bvadd(tm, b.getLane(0), b.getLane(1));
    return uint64x2_t(tm, _nres);
}
inline int64_t vpaddd_s64(const int64x2_t& a) { return {}; }
inline uint64_t vpaddd_u64(const uint64x2_t& a) { return {}; }
inline int32_t vaddv_s32(const int32x2_t& a) { return {}; }
inline int64_t vaddvq_s64(const int64x2_t& a) { return {}; }
inline uint32_t vaddv_u32(const uint32x2_t& a) { return {}; }
inline uint64_t vaddvq_u64(const uint64x2_t& a) { return {}; }
inline int8x8_t vpmax_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = bv_smax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smax(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_smax(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_smax(tm, b.getLane(0), b.getLane(1));
    _nres[5] = bv_smax(tm, b.getLane(2), b.getLane(3));
    _nres[6] = bv_smax(tm, b.getLane(4), b.getLane(5));
    _nres[7] = bv_smax(tm, b.getLane(6), b.getLane(7));
    return int8x8_t(tm, _nres);
}
inline int16x4_t vpmax_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = bv_smax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smax(tm, b.getLane(0), b.getLane(1));
    _nres[3] = bv_smax(tm, b.getLane(2), b.getLane(3));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vpmax_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = bv_smax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smax(tm, b.getLane(0), b.getLane(1));
    return int32x2_t(tm, _nres);
}
inline int8x16_t vpmaxq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = bv_smax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smax(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_smax(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_smax(tm, a.getLane(8), a.getLane(9));
    _nres[5] = bv_smax(tm, a.getLane(10), a.getLane(11));
    _nres[6] = bv_smax(tm, a.getLane(12), a.getLane(13));
    _nres[7] = bv_smax(tm, a.getLane(14), a.getLane(15));
    _nres[8] = bv_smax(tm, b.getLane(0), b.getLane(1));
    _nres[9] = bv_smax(tm, b.getLane(2), b.getLane(3));
    _nres[10] = bv_smax(tm, b.getLane(4), b.getLane(5));
    _nres[11] = bv_smax(tm, b.getLane(6), b.getLane(7));
    _nres[12] = bv_smax(tm, b.getLane(8), b.getLane(9));
    _nres[13] = bv_smax(tm, b.getLane(10), b.getLane(11));
    _nres[14] = bv_smax(tm, b.getLane(12), b.getLane(13));
    _nres[15] = bv_smax(tm, b.getLane(14), b.getLane(15));
    return int8x16_t(tm, _nres);
}
inline int16x8_t vpmaxq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = bv_smax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smax(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_smax(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_smax(tm, b.getLane(0), b.getLane(1));
    _nres[5] = bv_smax(tm, b.getLane(2), b.getLane(3));
    _nres[6] = bv_smax(tm, b.getLane(4), b.getLane(5));
    _nres[7] = bv_smax(tm, b.getLane(6), b.getLane(7));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vpmaxq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = bv_smax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smax(tm, b.getLane(0), b.getLane(1));
    _nres[3] = bv_smax(tm, b.getLane(2), b.getLane(3));
    return int32x4_t(tm, _nres);
}
inline int32_t vmaxv_s32(const int32x2_t& a) { return {}; }
inline uint8x8_t vpmax_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = bv_umax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umax(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_umax(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_umax(tm, b.getLane(0), b.getLane(1));
    _nres[5] = bv_umax(tm, b.getLane(2), b.getLane(3));
    _nres[6] = bv_umax(tm, b.getLane(4), b.getLane(5));
    _nres[7] = bv_umax(tm, b.getLane(6), b.getLane(7));
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vpmax_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = bv_umax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umax(tm, b.getLane(0), b.getLane(1));
    _nres[3] = bv_umax(tm, b.getLane(2), b.getLane(3));
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vpmax_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = bv_umax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umax(tm, b.getLane(0), b.getLane(1));
    return uint32x2_t(tm, _nres);
}
inline uint8x16_t vpmaxq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = bv_umax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umax(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_umax(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_umax(tm, a.getLane(8), a.getLane(9));
    _nres[5] = bv_umax(tm, a.getLane(10), a.getLane(11));
    _nres[6] = bv_umax(tm, a.getLane(12), a.getLane(13));
    _nres[7] = bv_umax(tm, a.getLane(14), a.getLane(15));
    _nres[8] = bv_umax(tm, b.getLane(0), b.getLane(1));
    _nres[9] = bv_umax(tm, b.getLane(2), b.getLane(3));
    _nres[10] = bv_umax(tm, b.getLane(4), b.getLane(5));
    _nres[11] = bv_umax(tm, b.getLane(6), b.getLane(7));
    _nres[12] = bv_umax(tm, b.getLane(8), b.getLane(9));
    _nres[13] = bv_umax(tm, b.getLane(10), b.getLane(11));
    _nres[14] = bv_umax(tm, b.getLane(12), b.getLane(13));
    _nres[15] = bv_umax(tm, b.getLane(14), b.getLane(15));
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vpmaxq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = bv_umax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umax(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_umax(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_umax(tm, b.getLane(0), b.getLane(1));
    _nres[5] = bv_umax(tm, b.getLane(2), b.getLane(3));
    _nres[6] = bv_umax(tm, b.getLane(4), b.getLane(5));
    _nres[7] = bv_umax(tm, b.getLane(6), b.getLane(7));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vpmaxq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = bv_umax(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umax(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umax(tm, b.getLane(0), b.getLane(1));
    _nres[3] = bv_umax(tm, b.getLane(2), b.getLane(3));
    return uint32x4_t(tm, _nres);
}
inline uint32_t vmaxv_u32(const uint32x2_t& a) { return {}; }
inline int8x8_t vpmin_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = bv_smin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smin(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_smin(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_smin(tm, b.getLane(0), b.getLane(1));
    _nres[5] = bv_smin(tm, b.getLane(2), b.getLane(3));
    _nres[6] = bv_smin(tm, b.getLane(4), b.getLane(5));
    _nres[7] = bv_smin(tm, b.getLane(6), b.getLane(7));
    return int8x8_t(tm, _nres);
}
inline int16x4_t vpmin_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = bv_smin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smin(tm, b.getLane(0), b.getLane(1));
    _nres[3] = bv_smin(tm, b.getLane(2), b.getLane(3));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vpmin_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = bv_smin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smin(tm, b.getLane(0), b.getLane(1));
    return int32x2_t(tm, _nres);
}
inline int8x16_t vpminq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = bv_smin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smin(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_smin(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_smin(tm, a.getLane(8), a.getLane(9));
    _nres[5] = bv_smin(tm, a.getLane(10), a.getLane(11));
    _nres[6] = bv_smin(tm, a.getLane(12), a.getLane(13));
    _nres[7] = bv_smin(tm, a.getLane(14), a.getLane(15));
    _nres[8] = bv_smin(tm, b.getLane(0), b.getLane(1));
    _nres[9] = bv_smin(tm, b.getLane(2), b.getLane(3));
    _nres[10] = bv_smin(tm, b.getLane(4), b.getLane(5));
    _nres[11] = bv_smin(tm, b.getLane(6), b.getLane(7));
    _nres[12] = bv_smin(tm, b.getLane(8), b.getLane(9));
    _nres[13] = bv_smin(tm, b.getLane(10), b.getLane(11));
    _nres[14] = bv_smin(tm, b.getLane(12), b.getLane(13));
    _nres[15] = bv_smin(tm, b.getLane(14), b.getLane(15));
    return int8x16_t(tm, _nres);
}
inline int16x8_t vpminq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = bv_smin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smin(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_smin(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_smin(tm, b.getLane(0), b.getLane(1));
    _nres[5] = bv_smin(tm, b.getLane(2), b.getLane(3));
    _nres[6] = bv_smin(tm, b.getLane(4), b.getLane(5));
    _nres[7] = bv_smin(tm, b.getLane(6), b.getLane(7));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vpminq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = bv_smin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_smin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_smin(tm, b.getLane(0), b.getLane(1));
    _nres[3] = bv_smin(tm, b.getLane(2), b.getLane(3));
    return int32x4_t(tm, _nres);
}
inline int32_t vminv_s32(const int32x2_t& a) { return {}; }
inline uint8x8_t vpmin_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = bv_umin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umin(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_umin(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_umin(tm, b.getLane(0), b.getLane(1));
    _nres[5] = bv_umin(tm, b.getLane(2), b.getLane(3));
    _nres[6] = bv_umin(tm, b.getLane(4), b.getLane(5));
    _nres[7] = bv_umin(tm, b.getLane(6), b.getLane(7));
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vpmin_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = bv_umin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umin(tm, b.getLane(0), b.getLane(1));
    _nres[3] = bv_umin(tm, b.getLane(2), b.getLane(3));
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vpmin_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = bv_umin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umin(tm, b.getLane(0), b.getLane(1));
    return uint32x2_t(tm, _nres);
}
inline uint8x16_t vpminq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = bv_umin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umin(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_umin(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_umin(tm, a.getLane(8), a.getLane(9));
    _nres[5] = bv_umin(tm, a.getLane(10), a.getLane(11));
    _nres[6] = bv_umin(tm, a.getLane(12), a.getLane(13));
    _nres[7] = bv_umin(tm, a.getLane(14), a.getLane(15));
    _nres[8] = bv_umin(tm, b.getLane(0), b.getLane(1));
    _nres[9] = bv_umin(tm, b.getLane(2), b.getLane(3));
    _nres[10] = bv_umin(tm, b.getLane(4), b.getLane(5));
    _nres[11] = bv_umin(tm, b.getLane(6), b.getLane(7));
    _nres[12] = bv_umin(tm, b.getLane(8), b.getLane(9));
    _nres[13] = bv_umin(tm, b.getLane(10), b.getLane(11));
    _nres[14] = bv_umin(tm, b.getLane(12), b.getLane(13));
    _nres[15] = bv_umin(tm, b.getLane(14), b.getLane(15));
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vpminq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = bv_umin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umin(tm, a.getLane(4), a.getLane(5));
    _nres[3] = bv_umin(tm, a.getLane(6), a.getLane(7));
    _nres[4] = bv_umin(tm, b.getLane(0), b.getLane(1));
    _nres[5] = bv_umin(tm, b.getLane(2), b.getLane(3));
    _nres[6] = bv_umin(tm, b.getLane(4), b.getLane(5));
    _nres[7] = bv_umin(tm, b.getLane(6), b.getLane(7));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vpminq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = bv_umin(tm, a.getLane(0), a.getLane(1));
    _nres[1] = bv_umin(tm, a.getLane(2), a.getLane(3));
    _nres[2] = bv_umin(tm, b.getLane(0), b.getLane(1));
    _nres[3] = bv_umin(tm, b.getLane(2), b.getLane(3));
    return uint32x4_t(tm, _nres);
}
inline uint32_t vminv_u32(const uint32x2_t& a) { return {}; }
inline int8x8_t vcnt_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _npopcnt(tm, a.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vcntq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _npopcnt(tm, a.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline uint8x8_t vcnt_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _npopcnt(tm, a.getLane(i), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vcntq_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _npopcnt(tm, a.getLane(i), 8);
    return uint8x16_t(tm, _nres);
}
inline poly8x8_t vcnt_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _npopcnt(tm, a.getLane(i), 8);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vcntq_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _npopcnt(tm, a.getLane(i), 8);
    return poly8x16_t(tm, _nres);
}
inline int8x8_t vclz_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nclz(tm, a.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vclzq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nclz(tm, a.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vclz_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nclz(tm, a.getLane(i), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vclzq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nclz(tm, a.getLane(i), 16);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vclz_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nclz(tm, a.getLane(i), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vclzq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nclz(tm, a.getLane(i), 32);
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vclz_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nclz(tm, a.getLane(i), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vclzq_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nclz(tm, a.getLane(i), 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vclz_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nclz(tm, a.getLane(i), 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vclzq_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nclz(tm, a.getLane(i), 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vclz_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nclz(tm, a.getLane(i), 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vclzq_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nclz(tm, a.getLane(i), 32);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vcls_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _ncls(tm, a.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vclsq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _ncls(tm, a.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vcls_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _ncls(tm, a.getLane(i), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vclsq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _ncls(tm, a.getLane(i), 16);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vcls_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _ncls(tm, a.getLane(i), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vclsq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _ncls(tm, a.getLane(i), 32);
    return int32x4_t(tm, _nres);
}
inline int8x8_t vcls_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _ncls(tm, a.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vclsq_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _ncls(tm, a.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vcls_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _ncls(tm, a.getLane(i), 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vclsq_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _ncls(tm, a.getLane(i), 16);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vcls_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _ncls(tm, a.getLane(i), 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vclsq_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _ncls(tm, a.getLane(i), 32);
    return int32x4_t(tm, _nres);
}
inline int8x8_t vrbit_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nrbit(tm, a.getLane(i), 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vrbitq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nrbit(tm, a.getLane(i), 8);
    return int8x16_t(tm, _nres);
}
inline uint8x8_t vrbit_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nrbit(tm, a.getLane(i), 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vrbitq_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nrbit(tm, a.getLane(i), 8);
    return uint8x16_t(tm, _nres);
}
inline poly8x8_t vrbit_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nrbit(tm, a.getLane(i), 8);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vrbitq_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nrbit(tm, a.getLane(i), 8);
    return poly8x16_t(tm, _nres);
}
inline int8x8_t vrev16_s8(const int8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vrev16q_s8(const int8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    _nres[8] = vec.getLane(9);
    _nres[9] = vec.getLane(8);
    _nres[10] = vec.getLane(11);
    _nres[11] = vec.getLane(10);
    _nres[12] = vec.getLane(13);
    _nres[13] = vec.getLane(12);
    _nres[14] = vec.getLane(15);
    _nres[15] = vec.getLane(14);
    return int8x16_t(tm, _nres);
}
inline uint8x8_t vrev16_u8(const uint8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vrev16q_u8(const uint8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    _nres[8] = vec.getLane(9);
    _nres[9] = vec.getLane(8);
    _nres[10] = vec.getLane(11);
    _nres[11] = vec.getLane(10);
    _nres[12] = vec.getLane(13);
    _nres[13] = vec.getLane(12);
    _nres[14] = vec.getLane(15);
    _nres[15] = vec.getLane(14);
    return uint8x16_t(tm, _nres);
}
inline poly8x8_t vrev16_p8(const poly8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vrev16q_p8(const poly8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    _nres[8] = vec.getLane(9);
    _nres[9] = vec.getLane(8);
    _nres[10] = vec.getLane(11);
    _nres[11] = vec.getLane(10);
    _nres[12] = vec.getLane(13);
    _nres[13] = vec.getLane(12);
    _nres[14] = vec.getLane(15);
    _nres[15] = vec.getLane(14);
    return poly8x16_t(tm, _nres);
}
inline mfloat8x8_t vrev16_mf8(const mfloat8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vrev16q_mf8(const mfloat8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    _nres[8] = vec.getLane(9);
    _nres[9] = vec.getLane(8);
    _nres[10] = vec.getLane(11);
    _nres[11] = vec.getLane(10);
    _nres[12] = vec.getLane(13);
    _nres[13] = vec.getLane(12);
    _nres[14] = vec.getLane(15);
    _nres[15] = vec.getLane(14);
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vrev32_s8(const int8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vrev32q_s8(const int8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    _nres[8] = vec.getLane(11);
    _nres[9] = vec.getLane(10);
    _nres[10] = vec.getLane(9);
    _nres[11] = vec.getLane(8);
    _nres[12] = vec.getLane(15);
    _nres[13] = vec.getLane(14);
    _nres[14] = vec.getLane(13);
    _nres[15] = vec.getLane(12);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vrev32_s16(const int16x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vrev32q_s16(const int16x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    return int16x8_t(tm, _nres);
}
inline uint8x8_t vrev32_u8(const uint8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vrev32q_u8(const uint8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    _nres[8] = vec.getLane(11);
    _nres[9] = vec.getLane(10);
    _nres[10] = vec.getLane(9);
    _nres[11] = vec.getLane(8);
    _nres[12] = vec.getLane(15);
    _nres[13] = vec.getLane(14);
    _nres[14] = vec.getLane(13);
    _nres[15] = vec.getLane(12);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vrev32_u16(const uint16x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vrev32q_u16(const uint16x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    return uint16x8_t(tm, _nres);
}
inline poly8x8_t vrev32_p8(const poly8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vrev32q_p8(const poly8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    _nres[8] = vec.getLane(11);
    _nres[9] = vec.getLane(10);
    _nres[10] = vec.getLane(9);
    _nres[11] = vec.getLane(8);
    _nres[12] = vec.getLane(15);
    _nres[13] = vec.getLane(14);
    _nres[14] = vec.getLane(13);
    _nres[15] = vec.getLane(12);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vrev32_p16(const poly16x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vrev32q_p16(const poly16x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    _nres[4] = vec.getLane(5);
    _nres[5] = vec.getLane(4);
    _nres[6] = vec.getLane(7);
    _nres[7] = vec.getLane(6);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vrev32_mf8(const mfloat8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vrev32q_mf8(const mfloat8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    _nres[8] = vec.getLane(11);
    _nres[9] = vec.getLane(10);
    _nres[10] = vec.getLane(9);
    _nres[11] = vec.getLane(8);
    _nres[12] = vec.getLane(15);
    _nres[13] = vec.getLane(14);
    _nres[14] = vec.getLane(13);
    _nres[15] = vec.getLane(12);
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vrev64_s8(const int8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(7);
    _nres[1] = vec.getLane(6);
    _nres[2] = vec.getLane(5);
    _nres[3] = vec.getLane(4);
    _nres[4] = vec.getLane(3);
    _nres[5] = vec.getLane(2);
    _nres[6] = vec.getLane(1);
    _nres[7] = vec.getLane(0);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vrev64q_s8(const int8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(7);
    _nres[1] = vec.getLane(6);
    _nres[2] = vec.getLane(5);
    _nres[3] = vec.getLane(4);
    _nres[4] = vec.getLane(3);
    _nres[5] = vec.getLane(2);
    _nres[6] = vec.getLane(1);
    _nres[7] = vec.getLane(0);
    _nres[8] = vec.getLane(15);
    _nres[9] = vec.getLane(14);
    _nres[10] = vec.getLane(13);
    _nres[11] = vec.getLane(12);
    _nres[12] = vec.getLane(11);
    _nres[13] = vec.getLane(10);
    _nres[14] = vec.getLane(9);
    _nres[15] = vec.getLane(8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vrev64_s16(const int16x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vrev64q_s16(const int16x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vrev64_s32(const int32x2_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vrev64q_s32(const int32x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vrev64_u8(const uint8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(7);
    _nres[1] = vec.getLane(6);
    _nres[2] = vec.getLane(5);
    _nres[3] = vec.getLane(4);
    _nres[4] = vec.getLane(3);
    _nres[5] = vec.getLane(2);
    _nres[6] = vec.getLane(1);
    _nres[7] = vec.getLane(0);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vrev64q_u8(const uint8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(7);
    _nres[1] = vec.getLane(6);
    _nres[2] = vec.getLane(5);
    _nres[3] = vec.getLane(4);
    _nres[4] = vec.getLane(3);
    _nres[5] = vec.getLane(2);
    _nres[6] = vec.getLane(1);
    _nres[7] = vec.getLane(0);
    _nres[8] = vec.getLane(15);
    _nres[9] = vec.getLane(14);
    _nres[10] = vec.getLane(13);
    _nres[11] = vec.getLane(12);
    _nres[12] = vec.getLane(11);
    _nres[13] = vec.getLane(10);
    _nres[14] = vec.getLane(9);
    _nres[15] = vec.getLane(8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vrev64_u16(const uint16x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vrev64q_u16(const uint16x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vrev64_u32(const uint32x2_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vrev64q_u32(const uint32x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    return uint32x4_t(tm, _nres);
}
inline float32x2_t vrev64_f32(const float32x2_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vrev64q_f32(const float32x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(1);
    _nres[1] = vec.getLane(0);
    _nres[2] = vec.getLane(3);
    _nres[3] = vec.getLane(2);
    return float32x4_t(tm, _nres);
}
inline poly8x8_t vrev64_p8(const poly8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(7);
    _nres[1] = vec.getLane(6);
    _nres[2] = vec.getLane(5);
    _nres[3] = vec.getLane(4);
    _nres[4] = vec.getLane(3);
    _nres[5] = vec.getLane(2);
    _nres[6] = vec.getLane(1);
    _nres[7] = vec.getLane(0);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vrev64q_p8(const poly8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(7);
    _nres[1] = vec.getLane(6);
    _nres[2] = vec.getLane(5);
    _nres[3] = vec.getLane(4);
    _nres[4] = vec.getLane(3);
    _nres[5] = vec.getLane(2);
    _nres[6] = vec.getLane(1);
    _nres[7] = vec.getLane(0);
    _nres[8] = vec.getLane(15);
    _nres[9] = vec.getLane(14);
    _nres[10] = vec.getLane(13);
    _nres[11] = vec.getLane(12);
    _nres[12] = vec.getLane(11);
    _nres[13] = vec.getLane(10);
    _nres[14] = vec.getLane(9);
    _nres[15] = vec.getLane(8);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vrev64_p16(const poly16x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vrev64q_p16(const poly16x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vrev64_mf8(const mfloat8x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(7);
    _nres[1] = vec.getLane(6);
    _nres[2] = vec.getLane(5);
    _nres[3] = vec.getLane(4);
    _nres[4] = vec.getLane(3);
    _nres[5] = vec.getLane(2);
    _nres[6] = vec.getLane(1);
    _nres[7] = vec.getLane(0);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vrev64q_mf8(const mfloat8x16_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = vec.getLane(7);
    _nres[1] = vec.getLane(6);
    _nres[2] = vec.getLane(5);
    _nres[3] = vec.getLane(4);
    _nres[4] = vec.getLane(3);
    _nres[5] = vec.getLane(2);
    _nres[6] = vec.getLane(1);
    _nres[7] = vec.getLane(0);
    _nres[8] = vec.getLane(15);
    _nres[9] = vec.getLane(14);
    _nres[10] = vec.getLane(13);
    _nres[11] = vec.getLane(12);
    _nres[12] = vec.getLane(11);
    _nres[13] = vec.getLane(10);
    _nres[14] = vec.getLane(9);
    _nres[15] = vec.getLane(8);
    return mfloat8x16_t(tm, _nres);
}
inline float16x4_t vrev64_f16(const float16x4_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vrev64q_f16(const float16x8_t& vec) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = vec.getLane(3);
    _nres[1] = vec.getLane(2);
    _nres[2] = vec.getLane(1);
    _nres[3] = vec.getLane(0);
    _nres[4] = vec.getLane(7);
    _nres[5] = vec.getLane(6);
    _nres[6] = vec.getLane(5);
    _nres[7] = vec.getLane(4);
    return float16x8_t(tm, _nres);
}
inline int8_t vaddv_s8(const int8x8_t& a) { return {}; }
inline int8_t vaddvq_s8(const int8x16_t& a) { return {}; }
inline int16_t vaddv_s16(const int16x4_t& a) { return {}; }
inline int16_t vaddvq_s16(const int16x8_t& a) { return {}; }
inline uint8_t vaddv_u8(const uint8x8_t& a) { return {}; }
inline uint8_t vaddvq_u8(const uint8x16_t& a) { return {}; }
inline uint16_t vaddv_u16(const uint16x4_t& a) { return {}; }
inline uint16_t vaddvq_u16(const uint16x8_t& a) { return {}; }
inline uint32_t vaddvq_u32(const uint32x4_t& a) { return {}; }
inline int16_t vaddlv_s8(const int8x8_t& a) { return {}; }
inline int16_t vaddlvq_s8(const int8x16_t& a) { return {}; }
inline int32_t vaddlv_s16(const int16x4_t& a) { return {}; }
inline int32_t vaddlvq_s16(const int16x8_t& a) { return {}; }
inline int64_t vaddlvq_s32(const int32x4_t& a) { return {}; }
inline uint16_t vaddlv_u8(const uint8x8_t& a) { return {}; }
inline uint16_t vaddlvq_u8(const uint8x16_t& a) { return {}; }
inline uint32_t vaddlv_u16(const uint16x4_t& a) { return {}; }
inline uint32_t vaddlvq_u16(const uint16x8_t& a) { return {}; }
inline uint64_t vaddlvq_u32(const uint32x4_t& a) { return {}; }
inline int8_t vmaxv_s8(const int8x8_t& a) { return {}; }
inline int8_t vmaxvq_s8(const int8x16_t& a) { return {}; }
inline int16_t vmaxv_s16(const int16x4_t& a) { return {}; }
inline int16_t vmaxvq_s16(const int16x8_t& a) { return {}; }
inline int32_t vmaxvq_s32(const int32x4_t& a) { return {}; }
inline uint8_t vmaxv_u8(const uint8x8_t& a) { return {}; }
inline uint8_t vmaxvq_u8(const uint8x16_t& a) { return {}; }
inline uint16_t vmaxv_u16(const uint16x4_t& a) { return {}; }
inline uint16_t vmaxvq_u16(const uint16x8_t& a) { return {}; }
inline uint32_t vmaxvq_u32(const uint32x4_t& a) { return {}; }
inline int8_t vminv_s8(const int8x8_t& a) { return {}; }
inline int8_t vminvq_s8(const int8x16_t& a) { return {}; }
inline int16_t vminv_s16(const int16x4_t& a) { return {}; }
inline int16_t vminvq_s16(const int16x8_t& a) { return {}; }
inline int32_t vminvq_s32(const int32x4_t& a) { return {}; }
inline uint8_t vminv_u8(const uint8x8_t& a) { return {}; }
inline uint8_t vminvq_u8(const uint8x16_t& a) { return {}; }
inline uint16_t vminv_u16(const uint16x4_t& a) { return {}; }
inline uint16_t vminvq_u16(const uint16x8_t& a) { return {}; }
inline uint32_t vminvq_u32(const uint32x4_t& a) { return {}; }

} // namespace salt
