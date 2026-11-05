#pragma once
// NEON zip/uzp/trn/ext/bsl/tbl/tbx (single-vector results)
#include "nhelp.hpp"
namespace salt_cvc5 {

inline int8x8_t vzip1_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vzip1q_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    _nres[8] = a.getLane(4);
    _nres[9] = b.getLane(4);
    _nres[10] = a.getLane(5);
    _nres[11] = b.getLane(5);
    _nres[12] = a.getLane(6);
    _nres[13] = b.getLane(6);
    _nres[14] = a.getLane(7);
    _nres[15] = b.getLane(7);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vzip1_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vzip1q_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vzip1_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vzip1q_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vzip1q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vzip1_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vzip1q_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    _nres[8] = a.getLane(4);
    _nres[9] = b.getLane(4);
    _nres[10] = a.getLane(5);
    _nres[11] = b.getLane(5);
    _nres[12] = a.getLane(6);
    _nres[13] = b.getLane(6);
    _nres[14] = a.getLane(7);
    _nres[15] = b.getLane(7);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vzip1_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vzip1q_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vzip1_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vzip1q_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vzip1q_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vzip1q_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vzip1_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return float32x2_t(tm, _nres);
}
inline float64x2_t vzip1q_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vzip1_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vzip1q_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    _nres[8] = a.getLane(4);
    _nres[9] = b.getLane(4);
    _nres[10] = a.getLane(5);
    _nres[11] = b.getLane(5);
    _nres[12] = a.getLane(6);
    _nres[13] = b.getLane(6);
    _nres[14] = a.getLane(7);
    _nres[15] = b.getLane(7);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vzip1_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vzip1q_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vzip1_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vzip1q_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    _nres[8] = a.getLane(4);
    _nres[9] = b.getLane(4);
    _nres[10] = a.getLane(5);
    _nres[11] = b.getLane(5);
    _nres[12] = a.getLane(6);
    _nres[13] = b.getLane(6);
    _nres[14] = a.getLane(7);
    _nres[15] = b.getLane(7);
    return mfloat8x16_t(tm, _nres);
}
inline float16x4_t vzip1_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vzip1q_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(1);
    _nres[3] = b.getLane(1);
    _nres[4] = a.getLane(2);
    _nres[5] = b.getLane(2);
    _nres[6] = a.getLane(3);
    _nres[7] = b.getLane(3);
    return float16x8_t(tm, _nres);
}
inline int8x8_t vzip2_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = b.getLane(4);
    _nres[2] = a.getLane(5);
    _nres[3] = b.getLane(5);
    _nres[4] = a.getLane(6);
    _nres[5] = b.getLane(6);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vzip2q_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(8);
    _nres[1] = b.getLane(8);
    _nres[2] = a.getLane(9);
    _nres[3] = b.getLane(9);
    _nres[4] = a.getLane(10);
    _nres[5] = b.getLane(10);
    _nres[6] = a.getLane(11);
    _nres[7] = b.getLane(11);
    _nres[8] = a.getLane(12);
    _nres[9] = b.getLane(12);
    _nres[10] = a.getLane(13);
    _nres[11] = b.getLane(13);
    _nres[12] = a.getLane(14);
    _nres[13] = b.getLane(14);
    _nres[14] = a.getLane(15);
    _nres[15] = b.getLane(15);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vzip2_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(2);
    _nres[1] = b.getLane(2);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vzip2q_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = b.getLane(4);
    _nres[2] = a.getLane(5);
    _nres[3] = b.getLane(5);
    _nres[4] = a.getLane(6);
    _nres[5] = b.getLane(6);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vzip2_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vzip2q_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(2);
    _nres[1] = b.getLane(2);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vzip2q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vzip2_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = b.getLane(4);
    _nres[2] = a.getLane(5);
    _nres[3] = b.getLane(5);
    _nres[4] = a.getLane(6);
    _nres[5] = b.getLane(6);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vzip2q_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(8);
    _nres[1] = b.getLane(8);
    _nres[2] = a.getLane(9);
    _nres[3] = b.getLane(9);
    _nres[4] = a.getLane(10);
    _nres[5] = b.getLane(10);
    _nres[6] = a.getLane(11);
    _nres[7] = b.getLane(11);
    _nres[8] = a.getLane(12);
    _nres[9] = b.getLane(12);
    _nres[10] = a.getLane(13);
    _nres[11] = b.getLane(13);
    _nres[12] = a.getLane(14);
    _nres[13] = b.getLane(14);
    _nres[14] = a.getLane(15);
    _nres[15] = b.getLane(15);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vzip2_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(2);
    _nres[1] = b.getLane(2);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vzip2q_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = b.getLane(4);
    _nres[2] = a.getLane(5);
    _nres[3] = b.getLane(5);
    _nres[4] = a.getLane(6);
    _nres[5] = b.getLane(6);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vzip2_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vzip2q_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(2);
    _nres[1] = b.getLane(2);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vzip2q_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vzip2q_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vzip2_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return float32x2_t(tm, _nres);
}
inline float64x2_t vzip2q_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vzip2_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = b.getLane(4);
    _nres[2] = a.getLane(5);
    _nres[3] = b.getLane(5);
    _nres[4] = a.getLane(6);
    _nres[5] = b.getLane(6);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vzip2q_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(8);
    _nres[1] = b.getLane(8);
    _nres[2] = a.getLane(9);
    _nres[3] = b.getLane(9);
    _nres[4] = a.getLane(10);
    _nres[5] = b.getLane(10);
    _nres[6] = a.getLane(11);
    _nres[7] = b.getLane(11);
    _nres[8] = a.getLane(12);
    _nres[9] = b.getLane(12);
    _nres[10] = a.getLane(13);
    _nres[11] = b.getLane(13);
    _nres[12] = a.getLane(14);
    _nres[13] = b.getLane(14);
    _nres[14] = a.getLane(15);
    _nres[15] = b.getLane(15);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vzip2_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(2);
    _nres[1] = b.getLane(2);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vzip2q_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = b.getLane(4);
    _nres[2] = a.getLane(5);
    _nres[3] = b.getLane(5);
    _nres[4] = a.getLane(6);
    _nres[5] = b.getLane(6);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vzip2_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = b.getLane(4);
    _nres[2] = a.getLane(5);
    _nres[3] = b.getLane(5);
    _nres[4] = a.getLane(6);
    _nres[5] = b.getLane(6);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vzip2q_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(8);
    _nres[1] = b.getLane(8);
    _nres[2] = a.getLane(9);
    _nres[3] = b.getLane(9);
    _nres[4] = a.getLane(10);
    _nres[5] = b.getLane(10);
    _nres[6] = a.getLane(11);
    _nres[7] = b.getLane(11);
    _nres[8] = a.getLane(12);
    _nres[9] = b.getLane(12);
    _nres[10] = a.getLane(13);
    _nres[11] = b.getLane(13);
    _nres[12] = a.getLane(14);
    _nres[13] = b.getLane(14);
    _nres[14] = a.getLane(15);
    _nres[15] = b.getLane(15);
    return mfloat8x16_t(tm, _nres);
}
inline float16x4_t vzip2_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(2);
    _nres[1] = b.getLane(2);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vzip2q_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(4);
    _nres[1] = b.getLane(4);
    _nres[2] = a.getLane(5);
    _nres[3] = b.getLane(5);
    _nres[4] = a.getLane(6);
    _nres[5] = b.getLane(6);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return float16x8_t(tm, _nres);
}
inline int8x8_t vuzp1_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = b.getLane(0);
    _nres[5] = b.getLane(2);
    _nres[6] = b.getLane(4);
    _nres[7] = b.getLane(6);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vuzp1q_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = a.getLane(8);
    _nres[5] = a.getLane(10);
    _nres[6] = a.getLane(12);
    _nres[7] = a.getLane(14);
    _nres[8] = b.getLane(0);
    _nres[9] = b.getLane(2);
    _nres[10] = b.getLane(4);
    _nres[11] = b.getLane(6);
    _nres[12] = b.getLane(8);
    _nres[13] = b.getLane(10);
    _nres[14] = b.getLane(12);
    _nres[15] = b.getLane(14);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vuzp1_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = b.getLane(0);
    _nres[3] = b.getLane(2);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vuzp1q_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = b.getLane(0);
    _nres[5] = b.getLane(2);
    _nres[6] = b.getLane(4);
    _nres[7] = b.getLane(6);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vuzp1_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vuzp1q_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = b.getLane(0);
    _nres[3] = b.getLane(2);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vuzp1q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vuzp1_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = b.getLane(0);
    _nres[5] = b.getLane(2);
    _nres[6] = b.getLane(4);
    _nres[7] = b.getLane(6);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vuzp1q_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = a.getLane(8);
    _nres[5] = a.getLane(10);
    _nres[6] = a.getLane(12);
    _nres[7] = a.getLane(14);
    _nres[8] = b.getLane(0);
    _nres[9] = b.getLane(2);
    _nres[10] = b.getLane(4);
    _nres[11] = b.getLane(6);
    _nres[12] = b.getLane(8);
    _nres[13] = b.getLane(10);
    _nres[14] = b.getLane(12);
    _nres[15] = b.getLane(14);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vuzp1_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = b.getLane(0);
    _nres[3] = b.getLane(2);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vuzp1q_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = b.getLane(0);
    _nres[5] = b.getLane(2);
    _nres[6] = b.getLane(4);
    _nres[7] = b.getLane(6);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vuzp1_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vuzp1q_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = b.getLane(0);
    _nres[3] = b.getLane(2);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vuzp1q_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vuzp1q_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vuzp1_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vuzp1q_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = b.getLane(0);
    _nres[3] = b.getLane(2);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vuzp1q_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vuzp1_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = b.getLane(0);
    _nres[5] = b.getLane(2);
    _nres[6] = b.getLane(4);
    _nres[7] = b.getLane(6);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vuzp1q_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = a.getLane(8);
    _nres[5] = a.getLane(10);
    _nres[6] = a.getLane(12);
    _nres[7] = a.getLane(14);
    _nres[8] = b.getLane(0);
    _nres[9] = b.getLane(2);
    _nres[10] = b.getLane(4);
    _nres[11] = b.getLane(6);
    _nres[12] = b.getLane(8);
    _nres[13] = b.getLane(10);
    _nres[14] = b.getLane(12);
    _nres[15] = b.getLane(14);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vuzp1_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = b.getLane(0);
    _nres[3] = b.getLane(2);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vuzp1q_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = b.getLane(0);
    _nres[5] = b.getLane(2);
    _nres[6] = b.getLane(4);
    _nres[7] = b.getLane(6);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vuzp1_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = b.getLane(0);
    _nres[5] = b.getLane(2);
    _nres[6] = b.getLane(4);
    _nres[7] = b.getLane(6);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vuzp1q_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = a.getLane(8);
    _nres[5] = a.getLane(10);
    _nres[6] = a.getLane(12);
    _nres[7] = a.getLane(14);
    _nres[8] = b.getLane(0);
    _nres[9] = b.getLane(2);
    _nres[10] = b.getLane(4);
    _nres[11] = b.getLane(6);
    _nres[12] = b.getLane(8);
    _nres[13] = b.getLane(10);
    _nres[14] = b.getLane(12);
    _nres[15] = b.getLane(14);
    return mfloat8x16_t(tm, _nres);
}
inline float16x4_t vuzp1_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = b.getLane(0);
    _nres[3] = b.getLane(2);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vuzp1q_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = a.getLane(2);
    _nres[2] = a.getLane(4);
    _nres[3] = a.getLane(6);
    _nres[4] = b.getLane(0);
    _nres[5] = b.getLane(2);
    _nres[6] = b.getLane(4);
    _nres[7] = b.getLane(6);
    return float16x8_t(tm, _nres);
}
inline int8x8_t vuzp2_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = b.getLane(1);
    _nres[5] = b.getLane(3);
    _nres[6] = b.getLane(5);
    _nres[7] = b.getLane(7);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vuzp2q_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = a.getLane(9);
    _nres[5] = a.getLane(11);
    _nres[6] = a.getLane(13);
    _nres[7] = a.getLane(15);
    _nres[8] = b.getLane(1);
    _nres[9] = b.getLane(3);
    _nres[10] = b.getLane(5);
    _nres[11] = b.getLane(7);
    _nres[12] = b.getLane(9);
    _nres[13] = b.getLane(11);
    _nres[14] = b.getLane(13);
    _nres[15] = b.getLane(15);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vuzp2_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = b.getLane(1);
    _nres[3] = b.getLane(3);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vuzp2q_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = b.getLane(1);
    _nres[5] = b.getLane(3);
    _nres[6] = b.getLane(5);
    _nres[7] = b.getLane(7);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vuzp2_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vuzp2q_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = b.getLane(1);
    _nres[3] = b.getLane(3);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vuzp2q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vuzp2_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = b.getLane(1);
    _nres[5] = b.getLane(3);
    _nres[6] = b.getLane(5);
    _nres[7] = b.getLane(7);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vuzp2q_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = a.getLane(9);
    _nres[5] = a.getLane(11);
    _nres[6] = a.getLane(13);
    _nres[7] = a.getLane(15);
    _nres[8] = b.getLane(1);
    _nres[9] = b.getLane(3);
    _nres[10] = b.getLane(5);
    _nres[11] = b.getLane(7);
    _nres[12] = b.getLane(9);
    _nres[13] = b.getLane(11);
    _nres[14] = b.getLane(13);
    _nres[15] = b.getLane(15);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vuzp2_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = b.getLane(1);
    _nres[3] = b.getLane(3);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vuzp2q_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = b.getLane(1);
    _nres[5] = b.getLane(3);
    _nres[6] = b.getLane(5);
    _nres[7] = b.getLane(7);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vuzp2_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vuzp2q_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = b.getLane(1);
    _nres[3] = b.getLane(3);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vuzp2q_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vuzp2q_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vuzp2_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vuzp2q_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = b.getLane(1);
    _nres[3] = b.getLane(3);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vuzp2q_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vuzp2_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = b.getLane(1);
    _nres[5] = b.getLane(3);
    _nres[6] = b.getLane(5);
    _nres[7] = b.getLane(7);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vuzp2q_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = a.getLane(9);
    _nres[5] = a.getLane(11);
    _nres[6] = a.getLane(13);
    _nres[7] = a.getLane(15);
    _nres[8] = b.getLane(1);
    _nres[9] = b.getLane(3);
    _nres[10] = b.getLane(5);
    _nres[11] = b.getLane(7);
    _nres[12] = b.getLane(9);
    _nres[13] = b.getLane(11);
    _nres[14] = b.getLane(13);
    _nres[15] = b.getLane(15);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vuzp2_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = b.getLane(1);
    _nres[3] = b.getLane(3);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vuzp2q_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = b.getLane(1);
    _nres[5] = b.getLane(3);
    _nres[6] = b.getLane(5);
    _nres[7] = b.getLane(7);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vuzp2_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = b.getLane(1);
    _nres[5] = b.getLane(3);
    _nres[6] = b.getLane(5);
    _nres[7] = b.getLane(7);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vuzp2q_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = a.getLane(9);
    _nres[5] = a.getLane(11);
    _nres[6] = a.getLane(13);
    _nres[7] = a.getLane(15);
    _nres[8] = b.getLane(1);
    _nres[9] = b.getLane(3);
    _nres[10] = b.getLane(5);
    _nres[11] = b.getLane(7);
    _nres[12] = b.getLane(9);
    _nres[13] = b.getLane(11);
    _nres[14] = b.getLane(13);
    _nres[15] = b.getLane(15);
    return mfloat8x16_t(tm, _nres);
}
inline float16x4_t vuzp2_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = b.getLane(1);
    _nres[3] = b.getLane(3);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vuzp2q_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = a.getLane(3);
    _nres[2] = a.getLane(5);
    _nres[3] = a.getLane(7);
    _nres[4] = b.getLane(1);
    _nres[5] = b.getLane(3);
    _nres[6] = b.getLane(5);
    _nres[7] = b.getLane(7);
    return float16x8_t(tm, _nres);
}
inline int8x8_t vtrn1_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vtrn1q_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    _nres[8] = a.getLane(8);
    _nres[9] = b.getLane(8);
    _nres[10] = a.getLane(10);
    _nres[11] = b.getLane(10);
    _nres[12] = a.getLane(12);
    _nres[13] = b.getLane(12);
    _nres[14] = a.getLane(14);
    _nres[15] = b.getLane(14);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vtrn1_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vtrn1q_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vtrn1_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vtrn1q_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vtrn1q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vtrn1_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vtrn1q_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    _nres[8] = a.getLane(8);
    _nres[9] = b.getLane(8);
    _nres[10] = a.getLane(10);
    _nres[11] = b.getLane(10);
    _nres[12] = a.getLane(12);
    _nres[13] = b.getLane(12);
    _nres[14] = a.getLane(14);
    _nres[15] = b.getLane(14);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vtrn1_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vtrn1q_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vtrn1_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vtrn1q_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vtrn1q_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vtrn1q_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vtrn1_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vtrn1q_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vtrn1q_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vtrn1_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vtrn1q_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    _nres[8] = a.getLane(8);
    _nres[9] = b.getLane(8);
    _nres[10] = a.getLane(10);
    _nres[11] = b.getLane(10);
    _nres[12] = a.getLane(12);
    _nres[13] = b.getLane(12);
    _nres[14] = a.getLane(14);
    _nres[15] = b.getLane(14);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vtrn1_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vtrn1q_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vtrn1_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vtrn1q_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    _nres[8] = a.getLane(8);
    _nres[9] = b.getLane(8);
    _nres[10] = a.getLane(10);
    _nres[11] = b.getLane(10);
    _nres[12] = a.getLane(12);
    _nres[13] = b.getLane(12);
    _nres[14] = a.getLane(14);
    _nres[15] = b.getLane(14);
    return mfloat8x16_t(tm, _nres);
}
inline float16x4_t vtrn1_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vtrn1q_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(0);
    _nres[1] = b.getLane(0);
    _nres[2] = a.getLane(2);
    _nres[3] = b.getLane(2);
    _nres[4] = a.getLane(4);
    _nres[5] = b.getLane(4);
    _nres[6] = a.getLane(6);
    _nres[7] = b.getLane(6);
    return float16x8_t(tm, _nres);
}
inline int8x8_t vtrn2_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vtrn2q_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    _nres[8] = a.getLane(9);
    _nres[9] = b.getLane(9);
    _nres[10] = a.getLane(11);
    _nres[11] = b.getLane(11);
    _nres[12] = a.getLane(13);
    _nres[13] = b.getLane(13);
    _nres[14] = a.getLane(15);
    _nres[15] = b.getLane(15);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vtrn2_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vtrn2q_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vtrn2_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vtrn2q_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vtrn2q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vtrn2_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vtrn2q_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    _nres[8] = a.getLane(9);
    _nres[9] = b.getLane(9);
    _nres[10] = a.getLane(11);
    _nres[11] = b.getLane(11);
    _nres[12] = a.getLane(13);
    _nres[13] = b.getLane(13);
    _nres[14] = a.getLane(15);
    _nres[15] = b.getLane(15);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vtrn2_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vtrn2q_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vtrn2_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vtrn2q_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vtrn2q_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return uint64x2_t(tm, _nres);
}
inline poly64x2_t vtrn2q_p64(const poly64x2_t& a, const poly64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vtrn2_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vtrn2q_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vtrn2q_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vtrn2_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vtrn2q_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    _nres[8] = a.getLane(9);
    _nres[9] = b.getLane(9);
    _nres[10] = a.getLane(11);
    _nres[11] = b.getLane(11);
    _nres[12] = a.getLane(13);
    _nres[13] = b.getLane(13);
    _nres[14] = a.getLane(15);
    _nres[15] = b.getLane(15);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vtrn2_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vtrn2q_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vtrn2_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vtrn2q_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    _nres[8] = a.getLane(9);
    _nres[9] = b.getLane(9);
    _nres[10] = a.getLane(11);
    _nres[11] = b.getLane(11);
    _nres[12] = a.getLane(13);
    _nres[13] = b.getLane(13);
    _nres[14] = a.getLane(15);
    _nres[15] = b.getLane(15);
    return mfloat8x16_t(tm, _nres);
}
inline float16x4_t vtrn2_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vtrn2q_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = a.getLane(1);
    _nres[1] = b.getLane(1);
    _nres[2] = a.getLane(3);
    _nres[3] = b.getLane(3);
    _nres[4] = a.getLane(5);
    _nres[5] = b.getLane(5);
    _nres[6] = a.getLane(7);
    _nres[7] = b.getLane(7);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vextq_s8(const int8x16_t& a, const int8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<16 ? a.getLane(idx) : b.getLane(idx-16); }
    return int8x16_t(tm, _nres);
}
inline int16x4_t vext_s16(const int16x4_t& a, const int16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<4 ? a.getLane(idx) : b.getLane(idx-4); }
    return int16x4_t(tm, _nres);
}
inline int16x8_t vextq_s16(const int16x8_t& a, const int16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<8 ? a.getLane(idx) : b.getLane(idx-8); }
    return int16x8_t(tm, _nres);
}
inline int32x2_t vext_s32(const int32x2_t& a, const int32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<2 ? a.getLane(idx) : b.getLane(idx-2); }
    return int32x2_t(tm, _nres);
}
inline int32x4_t vextq_s32(const int32x4_t& a, const int32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<4 ? a.getLane(idx) : b.getLane(idx-4); }
    return int32x4_t(tm, _nres);
}
inline int64x1_t vext_s64(const int64x1_t& a, const int64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<1 ? a.getLane(idx) : b.getLane(idx-1); }
    return int64x1_t(tm, _nres);
}
inline int64x2_t vextq_s64(const int64x2_t& a, const int64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<2 ? a.getLane(idx) : b.getLane(idx-2); }
    return int64x2_t(tm, _nres);
}
inline uint8x16_t vextq_u8(const uint8x16_t& a, const uint8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<16 ? a.getLane(idx) : b.getLane(idx-16); }
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vextq_u16(const uint16x8_t& a, const uint16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<8 ? a.getLane(idx) : b.getLane(idx-8); }
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vext_u32(const uint32x2_t& a, const uint32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<2 ? a.getLane(idx) : b.getLane(idx-2); }
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vextq_u32(const uint32x4_t& a, const uint32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<4 ? a.getLane(idx) : b.getLane(idx-4); }
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vext_u64(const uint64x1_t& a, const uint64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<1 ? a.getLane(idx) : b.getLane(idx-1); }
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vextq_u64(const uint64x2_t& a, const uint64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<2 ? a.getLane(idx) : b.getLane(idx-2); }
    return uint64x2_t(tm, _nres);
}
inline poly64x1_t vext_p64(const poly64x1_t& a, const poly64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<1 ? a.getLane(idx) : b.getLane(idx-1); }
    return poly64x1_t(tm, _nres);
}
inline poly64x2_t vextq_p64(const poly64x2_t& a, const poly64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<2 ? a.getLane(idx) : b.getLane(idx-2); }
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vext_f32(const float32x2_t& a, const float32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<2 ? a.getLane(idx) : b.getLane(idx-2); }
    return float32x2_t(tm, _nres);
}
inline float64x1_t vext_f64(const float64x1_t& a, const float64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<1 ? a.getLane(idx) : b.getLane(idx-1); }
    return float64x1_t(tm, _nres);
}
inline float64x2_t vextq_f64(const float64x2_t& a, const float64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<2 ? a.getLane(idx) : b.getLane(idx-2); }
    return float64x2_t(tm, _nres);
}
inline poly8x8_t vext_p8(const poly8x8_t& a, const poly8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<8 ? a.getLane(idx) : b.getLane(idx-8); }
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vextq_p8(const poly8x16_t& a, const poly8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<16 ? a.getLane(idx) : b.getLane(idx-16); }
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vext_p16(const poly16x4_t& a, const poly16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<4 ? a.getLane(idx) : b.getLane(idx-4); }
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vextq_p16(const poly16x8_t& a, const poly16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<8 ? a.getLane(idx) : b.getLane(idx-8); }
    return poly16x8_t(tm, _nres);
}
inline mfloat8x8_t vext_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<8 ? a.getLane(idx) : b.getLane(idx-8); }
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vextq_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<16 ? a.getLane(idx) : b.getLane(idx-16); }
    return mfloat8x16_t(tm, _nres);
}
inline float16x8_t vextq_f16(const float16x8_t& a, const float16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) { size_t idx=i+(size_t)n; _nres[i] = idx<8 ? a.getLane(idx) : b.getLane(idx-8); }
    return float16x8_t(tm, _nres);
}
inline int8x8_t vbsl_s8(const uint8x8_t& a, const int8x8_t& b, const int8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vbslq_s8(const uint8x16_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vbsl_s16(const uint16x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vbsl_s32(const uint32x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vbslq_s32(const uint32x4_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vbsl_s64(const uint64x1_t& a, const int64x1_t& b, const int64x1_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vbslq_s64(const uint64x2_t& a, const int64x2_t& b, const int64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return int64x2_t(tm, _nres);
}
inline uint8x16_t vbslq_u8(const uint8x16_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return uint8x16_t(tm, _nres);
}
inline uint32x2_t vbsl_u32(const uint32x2_t& a, const uint32x2_t& b, const uint32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return uint32x2_t(tm, _nres);
}
inline uint64x1_t vbsl_u64(const uint64x1_t& a, const uint64x1_t& b, const uint64x1_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vbslq_u64(const uint64x2_t& a, const uint64x2_t& b, const uint64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return uint64x2_t(tm, _nres);
}
inline poly64x1_t vbsl_p64(const poly64x1_t& a, const poly64x1_t& b, const poly64x1_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return poly64x1_t(tm, _nres);
}
inline poly64x2_t vbslq_p64(const poly64x2_t& a, const poly64x2_t& b, const poly64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return poly64x2_t(tm, _nres);
}
inline float32x2_t vbsl_f32(const uint32x2_t& a, const float32x2_t& b, const float32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return float32x2_t(tm, _nres);
}
inline poly8x8_t vbsl_p8(const uint8x8_t& a, const poly8x8_t& b, const poly8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vbslq_p8(const uint8x16_t& a, const poly8x16_t& b, const poly8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vbsl_p16(const uint16x4_t& a, const poly16x4_t& b, const poly16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vbslq_p16(const uint16x8_t& a, const poly16x8_t& b, const poly16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return poly16x8_t(tm, _nres);
}
inline float64x1_t vbsl_f64(const uint64x1_t& a, const float64x1_t& b, const float64x1_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return float64x1_t(tm, _nres);
}
inline float64x2_t vbslq_f64(const uint64x2_t& a, const float64x2_t& b, const float64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return float64x2_t(tm, _nres);
}
inline mfloat8x8_t vbsl_mf8(const uint8x8_t& a, const mfloat8x8_t& b, const mfloat8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vbslq_mf8(const uint8x16_t& a, const mfloat8x16_t& b, const mfloat8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvor(tm, fold_bvand(tm, a.getLane(i), b.getLane(i)), fold_bvand(tm, fold_bvnot(tm, a.getLane(i)), c.getLane(i)));
    return mfloat8x16_t(tm, _nres);
}
inline int8x8_t vtbl1_s8(const int8x8_t& a, const int8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<8;k++) _tbl.push_back(a.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline uint8x8_t vtbl1_u8(const uint8x8_t& a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<8;k++) _tbl.push_back(a.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vtbl1_p8(const poly8x8_t& a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<8;k++) _tbl.push_back(a.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline mfloat8x8_t vtbl1_mf8(const mfloat8x8_t& a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<8;k++) _tbl.push_back(a.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline int8x8_t vtbl2_s8(int8x8x2_t a, const int8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline uint8x8_t vtbl2_u8(uint8x8x2_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vtbl2_p8(poly8x8x2_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline mfloat8x8_t vtbl2_mf8(mfloat8x8x2_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline int8x8_t vtbl3_s8(int8x8x3_t a, const int8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline uint8x8_t vtbl3_u8(uint8x8x3_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vtbl3_p8(poly8x8x3_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline mfloat8x8_t vtbl3_mf8(mfloat8x8x3_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline int8x8_t vtbl4_s8(int8x8x4_t a, const int8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline uint8x8_t vtbl4_u8(uint8x8x4_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vtbl4_p8(poly8x8x4_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline mfloat8x8_t vtbl4_mf8(mfloat8x8x4_t a, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<8;k++) _tbl.push_back(a.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline int8x8_t vqtbl1_s8(const int8x16_t& t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline int8x16_t vqtbl1q_s8(const int8x16_t& t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x16_t(tm,_nres);
}
inline uint8x8_t vqtbl1_u8(const uint8x16_t& t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline uint8x16_t vqtbl1q_u8(const uint8x16_t& t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x16_t(tm,_nres);
}
inline poly8x8_t vqtbl1_p8(const poly8x16_t& t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline poly8x16_t vqtbl1q_p8(const poly8x16_t& t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x16_t(tm,_nres);
}
inline mfloat8x8_t vqtbl1_mf8(const mfloat8x16_t& t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline mfloat8x16_t vqtbl1q_mf8(const mfloat8x16_t& t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x16_t(tm,_nres);
}
inline int8x8_t vqtbl2_s8(int8x16x2_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline int8x16_t vqtbl2q_s8(int8x16x2_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x16_t(tm,_nres);
}
inline uint8x8_t vqtbl2_u8(uint8x16x2_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline uint8x16_t vqtbl2q_u8(uint8x16x2_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x16_t(tm,_nres);
}
inline poly8x8_t vqtbl2_p8(poly8x16x2_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline poly8x16_t vqtbl2q_p8(poly8x16x2_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x16_t(tm,_nres);
}
inline mfloat8x8_t vqtbl2_mf8(mfloat8x16x2_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline mfloat8x16_t vqtbl2q_mf8(mfloat8x16x2_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x16_t(tm,_nres);
}
inline int8x8_t vqtbl3_s8(int8x16x3_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline int8x16_t vqtbl3q_s8(int8x16x3_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x16_t(tm,_nres);
}
inline uint8x8_t vqtbl3_u8(uint8x16x3_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline uint8x16_t vqtbl3q_u8(uint8x16x3_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x16_t(tm,_nres);
}
inline poly8x8_t vqtbl3_p8(poly8x16x3_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline poly8x16_t vqtbl3q_p8(poly8x16x3_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x16_t(tm,_nres);
}
inline mfloat8x8_t vqtbl3_mf8(mfloat8x16x3_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline mfloat8x16_t vqtbl3q_mf8(mfloat8x16x3_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x16_t(tm,_nres);
}
inline int8x8_t vqtbl4_s8(int8x16x4_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline int8x16_t vqtbl4q_s8(int8x16x4_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x16_t(tm,_nres);
}
inline uint8x8_t vqtbl4_u8(uint8x16x4_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vqtbl4_p8(poly8x16x4_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline poly8x16_t vqtbl4q_p8(poly8x16x4_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x16_t(tm,_nres);
}
inline mfloat8x8_t vqtbl4_mf8(mfloat8x16x4_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline mfloat8x16_t vqtbl4q_mf8(mfloat8x16x4_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=mk_bv_val(tm,8,0);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x16_t(tm,_nres);
}
inline int8x8_t vtbx2_s8(const int8x8_t& a, int8x8x2_t b, const int8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline uint8x8_t vtbx2_u8(const uint8x8_t& a, uint8x8x2_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vtbx2_p8(const poly8x8_t& a, poly8x8x2_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline mfloat8x8_t vtbx2_mf8(const mfloat8x8_t& a, mfloat8x8x2_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline int8x8_t vtbx4_s8(const int8x8_t& a, int8x8x4_t b, const int8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline uint8x8_t vtbx4_u8(const uint8x8_t& a, uint8x8x4_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vtbx4_p8(const poly8x8_t& a, poly8x8x4_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline mfloat8x8_t vtbx4_mf8(const mfloat8x8_t& a, mfloat8x8x4_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline int8x8_t vqtbx1_s8(const int8x8_t& a, const int8x16_t& t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline int8x16_t vqtbx1q_s8(const int8x16_t& a, const int8x16_t& t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x16_t(tm,_nres);
}
inline uint8x8_t vqtbx1_u8(const uint8x8_t& a, const uint8x16_t& t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline uint8x16_t vqtbx1q_u8(const uint8x16_t& a, const uint8x16_t& t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x16_t(tm,_nres);
}
inline poly8x8_t vqtbx1_p8(const poly8x8_t& a, const poly8x16_t& t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline poly8x16_t vqtbx1q_p8(const poly8x16_t& a, const poly8x16_t& t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x16_t(tm,_nres);
}
inline mfloat8x8_t vqtbx1_mf8(const mfloat8x8_t& a, const mfloat8x16_t& t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline mfloat8x16_t vqtbx1q_mf8(const mfloat8x16_t& a, const mfloat8x16_t& t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<16;k++) _tbl.push_back(t.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x16_t(tm,_nres);
}
inline int8x8_t vqtbx2_s8(const int8x8_t& a, int8x16x2_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline int8x16_t vqtbx2q_s8(const int8x16_t& a, int8x16x2_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x16_t(tm,_nres);
}
inline uint8x8_t vqtbx2_u8(const uint8x8_t& a, uint8x16x2_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline uint8x16_t vqtbx2q_u8(const uint8x16_t& a, uint8x16x2_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x16_t(tm,_nres);
}
inline poly8x8_t vqtbx2_p8(const poly8x8_t& a, poly8x16x2_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline poly8x16_t vqtbx2q_p8(const poly8x16_t& a, poly8x16x2_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x16_t(tm,_nres);
}
inline mfloat8x8_t vqtbx2_mf8(const mfloat8x8_t& a, mfloat8x16x2_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline mfloat8x16_t vqtbx2q_mf8(const mfloat8x16_t& a, mfloat8x16x2_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<2;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x16_t(tm,_nres);
}
inline int8x8_t vqtbx3_s8(const int8x8_t& a, int8x16x3_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline int8x16_t vqtbx3q_s8(const int8x16_t& a, int8x16x3_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x16_t(tm,_nres);
}
inline uint8x8_t vqtbx3_u8(const uint8x8_t& a, uint8x16x3_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline uint8x16_t vqtbx3q_u8(const uint8x16_t& a, uint8x16x3_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x16_t(tm,_nres);
}
inline poly8x8_t vqtbx3_p8(const poly8x8_t& a, poly8x16x3_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline poly8x16_t vqtbx3q_p8(const poly8x16_t& a, poly8x16x3_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x16_t(tm,_nres);
}
inline mfloat8x8_t vqtbx3_mf8(const mfloat8x8_t& a, mfloat8x16x3_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline mfloat8x16_t vqtbx3q_mf8(const mfloat8x16_t& a, mfloat8x16x3_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x16_t(tm,_nres);
}
inline int8x8_t vqtbx4_s8(const int8x8_t& a, int8x16x4_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline int8x16_t vqtbx4q_s8(const int8x16_t& a, int8x16x4_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x16_t(tm,_nres);
}
inline uint8x8_t vqtbx4_u8(const uint8x8_t& a, uint8x16x4_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vqtbx4_p8(const poly8x8_t& a, poly8x16x4_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline poly8x16_t vqtbx4q_p8(const poly8x16_t& a, poly8x16x4_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x16_t(tm,_nres);
}
inline mfloat8x8_t vqtbx4_mf8(const mfloat8x8_t& a, mfloat8x16x4_t t, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline mfloat8x16_t vqtbx4q_mf8(const mfloat8x16_t& a, mfloat8x16x4_t t, const uint8x16_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<4;s++) for(size_t k=0;k<16;k++) _tbl.push_back(t.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 16> _nres;
    for(size_t i=0;i<16;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x16_t(tm,_nres);
}
inline int8x8_t vtbx1_s8(const int8x8_t& a, const int8x8_t& b, const int8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<8;k++) _tbl.push_back(b.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline uint8x8_t vtbx1_u8(const uint8x8_t& a, const uint8x8_t& b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<8;k++) _tbl.push_back(b.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vtbx1_p8(const poly8x8_t& a, const poly8x8_t& b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<8;k++) _tbl.push_back(b.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline mfloat8x8_t vtbx1_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t k=0;k<8;k++) _tbl.push_back(b.getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}
inline int8x8_t vtbx3_s8(const int8x8_t& a, int8x8x3_t b, const int8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return int8x8_t(tm,_nres);
}
inline uint8x8_t vtbx3_u8(const uint8x8_t& a, uint8x8x3_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return uint8x8_t(tm,_nres);
}
inline poly8x8_t vtbx3_p8(const poly8x8_t& a, poly8x8x3_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return poly8x8_t(tm,_nres);
}
inline mfloat8x8_t vtbx3_mf8(const mfloat8x8_t& a, mfloat8x8x3_t b, const uint8x8_t& idx) {
    auto& tm = g_ctx->tm;
    std::vector<Term> _tbl;
    for(size_t s=0;s<3;s++) for(size_t k=0;k<8;k++) _tbl.push_back(b.val[s].getLane(k));
    size_t _ts=_tbl.size();
    std::array<Term, 8> _nres;
    for(size_t i=0;i<8;i++){
        Term ix=idx.getLane(i);
        Term res=a.getLane(i);
        for(size_t k=0;k<_ts;k++) res=fold_ite(tm,cmp_eq(tm,ix,mk_bv_val(tm,8,(int64_t)k)),_tbl[k],res);
        _nres[i]=res;
    }
    return mfloat8x8_t(tm,_nres);
}

} // namespace salt_cvc5
