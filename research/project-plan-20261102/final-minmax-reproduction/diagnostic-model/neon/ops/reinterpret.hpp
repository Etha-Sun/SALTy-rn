#pragma once
// NEON vreinterpret_* (bit-preserving, little-endian)
#include "nhelp.hpp"
namespace salt_cvc5 {

inline int16x4_t vreinterpret_s16_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_s8(const int8x8_t& a) { return a; }
inline poly16x4_t vreinterpret_p16_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_s8(const int8x8_t& a) { return a; }
inline uint64x1_t vreinterpret_u64_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vreinterpret_f16_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_s16(const int16x4_t& a) { return a; }
inline uint32x2_t vreinterpret_u32_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_s16(const int16x4_t& a) { return a; }
inline mfloat8x8_t vreinterpret_mf8_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vreinterpret_f16_s16(const int16x4_t& a) { return a; }
inline int8x8_t vreinterpret_s8_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_s32(const int32x2_t& a) { return a; }
inline uint8x8_t vreinterpret_u8_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vreinterpret_u32_s32(const int32x2_t& a) { return a; }
inline poly8x8_t vreinterpret_p8_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vreinterpret_f16_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_f32(const float32x2_t& a) { return a; }
inline uint8x8_t vreinterpret_u8_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vreinterpret_u32_f32(const float32x2_t& a) { return a; }
inline poly8x8_t vreinterpret_p8_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_f64(const float64x1_t& a) { return a; }
inline float16x4_t vreinterpret_f16_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_u8(const uint8x8_t& a) { return a; }
inline poly16x4_t vreinterpret_p16_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_u8(const uint8x8_t& a) { return a; }
inline uint64x1_t vreinterpret_u64_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vreinterpret_f16_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_u16(const uint16x4_t& a) { return a; }
inline int32x2_t vreinterpret_s32_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_u16(const uint16x4_t& a) { return a; }
inline mfloat8x8_t vreinterpret_mf8_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_u32(const uint32x2_t& a) { return a; }
inline float32x2_t vreinterpret_f32_u32(const uint32x2_t& a) { return a; }
inline uint8x8_t vreinterpret_u8_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vreinterpret_f16_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_p8(const poly8x8_t& a) { return a; }
inline int16x4_t vreinterpret_s16_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_p8(const poly8x8_t& a) { return a; }
inline uint16x4_t vreinterpret_u16_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vreinterpret_u32_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vreinterpret_f16_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_mf8(const mfloat8x8_t& a) { return a; }
inline int16x4_t vreinterpret_s16_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_mf8(const mfloat8x8_t& a) { return a; }
inline uint16x4_t vreinterpret_u16_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vreinterpret_u32_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vreinterpret_f16_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_p16(const poly16x4_t& a) { return a; }
inline int32x2_t vreinterpret_s32_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_p16(const poly16x4_t& a) { return a; }
inline uint32x2_t vreinterpret_u32_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_p16(const poly16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline float16x4_t vreinterpret_f16_p16(const poly16x4_t& a) { return a; }
inline int8x8_t vreinterpret_s8_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vreinterpret_u32_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_u64(const uint64x1_t& a) { return a; }
inline float64x1_t vreinterpret_f64_u64(const uint64x1_t& a) { return a; }
inline poly64x1_t vreinterpret_p64_u64(const uint64x1_t& a) { return a; }
inline float16x4_t vreinterpret_f16_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vreinterpret_u32_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_s64(const int64x1_t& a) { return a; }
inline float64x1_t vreinterpret_f64_s64(const int64x1_t& a) { return a; }
inline uint64x1_t vreinterpret_u64_p64(const poly64x1_t& a) { return a; }
inline float16x4_t vreinterpret_f16_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_f16(const float16x4_t& a) { return a; }
inline int32x2_t vreinterpret_s32_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_f16(const float16x4_t& a) { return a; }
inline mfloat8x8_t vreinterpret_mf8_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_s8(const int8x16_t& a) { return a; }
inline uint16x8_t vreinterpretq_u16_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_s8(const int8x16_t& a) { return a; }
inline poly16x8_t vreinterpretq_p16_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_s8(const int8x16_t& a) { return a; }
inline uint64x2_t vreinterpretq_u64_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_s8(const int8x16_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_s16(const int16x8_t& a) { return a; }
inline mfloat8x16_t vreinterpretq_mf8_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_s16(const int16x8_t& a) { return {}; }
inline int8x16_t vreinterpretq_s8_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_s32(const int32x4_t& a) { return a; }
inline poly8x16_t vreinterpretq_p8_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_s32(const int32x4_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_f32(const float32x4_t& a) { return {}; }
inline poly64x2_t vreinterpretq_p64_f64(const float64x2_t& a) { return a; }
inline poly128_t vreinterpretq_p128_f64(const float64x2_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_u8(const uint8x16_t& a) { return a; }
inline int16x8_t vreinterpretq_s16_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_u8(const uint8x16_t& a) { return a; }
inline poly16x8_t vreinterpretq_p16_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_u8(const uint8x16_t& a) { return a; }
inline uint64x2_t vreinterpretq_u64_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_u8(const uint8x16_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_u16(const uint16x8_t& a) { return a; }
inline mfloat8x16_t vreinterpretq_mf8_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_u16(const uint16x8_t& a) { return {}; }
inline int8x16_t vreinterpretq_s8_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_u32(const uint32x4_t& a) { return a; }
inline uint8x16_t vreinterpretq_u8_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_u32(const uint32x4_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_p8(const poly8x16_t& a) { return a; }
inline int16x8_t vreinterpretq_s16_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_p8(const poly8x16_t& a) { return a; }
inline uint16x8_t vreinterpretq_u16_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_p8(const poly8x16_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_mf8(const mfloat8x16_t& a) { return a; }
inline int16x8_t vreinterpretq_s16_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_mf8(const mfloat8x16_t& a) { return a; }
inline uint16x8_t vreinterpretq_u16_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_mf8(const mfloat8x16_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_p16(const poly16x8_t& a) { return a; }
inline int32x4_t vreinterpretq_s32_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_p16(const poly16x8_t& a) { return a; }
inline uint32x4_t vreinterpretq_u32_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_p16(const poly16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_p16(const poly16x8_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_p16(const poly16x8_t& a) { return a; }
inline int8x16_t vreinterpretq_s8_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_u64(const uint64x2_t& a) { return a; }
inline float64x2_t vreinterpretq_f64_u64(const uint64x2_t& a) { return a; }
inline float64x2_t vreinterpretq_f64_s64(const int64x2_t& a) { return a; }
inline poly64x2_t vreinterpretq_p64_s64(const int64x2_t& a) { return a; }
inline poly128_t vreinterpretq_p128_s64(const int64x2_t& a) { return {}; }
inline poly64x2_t vreinterpretq_p64_u64(const uint64x2_t& a) { return a; }
inline poly128_t vreinterpretq_p128_u64(const uint64x2_t& a) { return {}; }
inline float16x8_t vreinterpretq_f16_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_s64(const int64x2_t& a) { return a; }
inline uint64x2_t vreinterpretq_u64_p64(const poly64x2_t& a) { return a; }
inline float16x8_t vreinterpretq_f16_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_f16(const float16x8_t& a) { return a; }
inline mfloat8x16_t vreinterpretq_mf8_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_f16(const float16x8_t& a) { return {}; }
inline int8x8_t vreinterpret_s8_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vreinterpret_u32_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_f64(const float64x1_t& a) { return a; }
inline int64x1_t vreinterpret_s64_f64(const float64x1_t& a) { return a; }
inline float16x4_t vreinterpret_f16_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_f64(const float64x2_t& a) { return a; }
inline int64x2_t vreinterpretq_s64_f64(const float64x2_t& a) { return a; }
inline float16x8_t vreinterpretq_f16_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline int8x8_t vreinterpret_s8_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vreinterpret_s32_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vreinterpret_u16_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vreinterpret_u32_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x2_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x4_t(tm, _nres);
}
inline mfloat8x8_t vreinterpret_mf8_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_p64(const poly64x1_t& a) { return a; }
inline float64x1_t vreinterpret_f64_p64(const poly64x1_t& a) { return a; }
inline float16x4_t vreinterpret_f16_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x4_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vreinterpretq_s32_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vreinterpretq_u16_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return poly16x8_t(tm, _nres);
}
inline mfloat8x16_t vreinterpretq_mf8_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_p64(const poly64x2_t& a) { return a; }
inline float64x2_t vreinterpretq_f64_p64(const poly64x2_t& a) { return a; }
inline float16x8_t vreinterpretq_f16_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return float16x8_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_p128(poly128_t a) { return {}; }
inline int16x8_t vreinterpretq_s16_p128(poly128_t a) { return {}; }
inline int32x4_t vreinterpretq_s32_p128(poly128_t a) { return {}; }
inline uint8x16_t vreinterpretq_u8_p128(poly128_t a) { return {}; }
inline uint16x8_t vreinterpretq_u16_p128(poly128_t a) { return {}; }
inline uint32x4_t vreinterpretq_u32_p128(poly128_t a) { return {}; }
inline poly8x16_t vreinterpretq_p8_p128(poly128_t a) { return {}; }
inline poly16x8_t vreinterpretq_p16_p128(poly128_t a) { return {}; }
inline mfloat8x16_t vreinterpretq_mf8_p128(poly128_t a) { return {}; }
inline uint64x2_t vreinterpretq_u64_p128(poly128_t a) { return {}; }
inline int64x2_t vreinterpretq_s64_p128(poly128_t a) { return {}; }
inline float64x2_t vreinterpretq_f64_p128(poly128_t a) { return {}; }
inline float16x8_t vreinterpretq_f16_p128(poly128_t a) { return {}; }
inline bfloat16x4_t vreinterpret_bf16_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_s16(const int16x4_t& a) { return a; }
inline bfloat16x4_t vreinterpret_bf16_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_p8(const poly8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_p16(const poly16x4_t& a) { return a; }
inline bfloat16x4_t vreinterpret_bf16_mf8(const mfloat8x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_u64(const uint64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_s64(const int64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_s16(const int16x8_t& a) { return a; }
inline bfloat16x8_t vreinterpretq_bf16_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_p8(const poly8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_p16(const poly16x8_t& a) { return a; }
inline bfloat16x8_t vreinterpretq_bf16_mf8(const mfloat8x16_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 16; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_f64(const float64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x4_t vreinterpret_bf16_p64(const poly64x1_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 1; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x4_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_p64(const poly64x2_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 2; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*16-1, j*16, big);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vreinterpretq_bf16_p128(poly128_t a) { return {}; }
inline int8x8_t vreinterpret_s8_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vreinterpret_s16_bf16(const bfloat16x4_t& a) { return a; }
inline int32x2_t vreinterpret_s32_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x2_t(tm, _nres);
}
inline float32x2_t vreinterpret_f32_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x2_t(tm, _nres);
}
inline uint8x8_t vreinterpret_u8_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x8_t(tm, _nres);
}
inline poly8x8_t vreinterpret_p8_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x8_t(tm, _nres);
}
inline poly16x4_t vreinterpret_p16_bf16(const bfloat16x4_t& a) { return a; }
inline mfloat8x8_t vreinterpret_mf8_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 8> _nres;
    for (size_t j = 0; j < 8; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x8_t(tm, _nres);
}
inline uint64x1_t vreinterpret_u64_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x1_t(tm, _nres);
}
inline int64x1_t vreinterpret_s64_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x1_t(tm, _nres);
}
inline float64x1_t vreinterpret_f64_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x1_t(tm, _nres);
}
inline poly64x1_t vreinterpret_p64_bf16(const bfloat16x4_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 4; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 1> _nres;
    for (size_t j = 0; j < 1; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x1_t(tm, _nres);
}
inline int8x16_t vreinterpretq_s8_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vreinterpretq_s16_bf16(const bfloat16x8_t& a) { return a; }
inline int32x4_t vreinterpretq_s32_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return int32x4_t(tm, _nres);
}
inline float32x4_t vreinterpretq_f32_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return float32x4_t(tm, _nres);
}
inline uint8x16_t vreinterpretq_u8_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return uint8x16_t(tm, _nres);
}
inline uint32x4_t vreinterpretq_u32_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 4> _nres;
    for (size_t j = 0; j < 4; j++) _nres[j] = fold_bvextract(tm, (j+1)*32-1, j*32, big);
    return uint32x4_t(tm, _nres);
}
inline poly8x16_t vreinterpretq_p8_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vreinterpretq_p16_bf16(const bfloat16x8_t& a) { return a; }
inline mfloat8x16_t vreinterpretq_mf8_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 16> _nres;
    for (size_t j = 0; j < 16; j++) _nres[j] = fold_bvextract(tm, (j+1)*8-1, j*8, big);
    return mfloat8x16_t(tm, _nres);
}
inline uint64x2_t vreinterpretq_u64_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return uint64x2_t(tm, _nres);
}
inline int64x2_t vreinterpretq_s64_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return int64x2_t(tm, _nres);
}
inline float64x2_t vreinterpretq_f64_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return float64x2_t(tm, _nres);
}
inline poly64x2_t vreinterpretq_p64_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term big = a.getLane(0);
    for (size_t i = 1; i < 8; i++) big = fold_bvconcat(tm, a.getLane(i), big);
    std::array<Term, 2> _nres;
    for (size_t j = 0; j < 2; j++) _nres[j] = fold_bvextract(tm, (j+1)*64-1, j*64, big);
    return poly64x2_t(tm, _nres);
}
inline poly128_t vreinterpretq_p128_bf16(const bfloat16x8_t& a) { return {}; }

} // namespace salt_cvc5
