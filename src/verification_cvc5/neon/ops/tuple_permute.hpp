#pragma once
// NEON vzip/vuzp/vtrn (tuple-returning de/interleave)
#include "nhelp.hpp"
namespace salt_cvc5 {

inline int8x8x2_t vzip_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    std::array<Term,8> _a1={a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    return int8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline int16x4x2_t vzip_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1)};
    std::array<Term,4> _a1={a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    return int16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline uint8x8x2_t vzip_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    std::array<Term,8> _a1={a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    return uint8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline uint16x4x2_t vzip_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1)};
    std::array<Term,4> _a1={a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    return uint16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline poly8x8x2_t vzip_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    std::array<Term,8> _a1={a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    return poly8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline poly16x4x2_t vzip_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1)};
    std::array<Term,4> _a1={a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    return poly16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline mfloat8x8x2_t vzip_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    std::array<Term,8> _a1={a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    return mfloat8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline int32x2x2_t vzip_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,2> _a0={a.getLane(0), b.getLane(0)};
    std::array<Term,2> _a1={a.getLane(1), b.getLane(1)};
    return int32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline float32x2x2_t vzip_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,2> _a0={a.getLane(0), b.getLane(0)};
    std::array<Term,2> _a1={a.getLane(1), b.getLane(1)};
    return float32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline int8x16x2_t vzipq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3), a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    std::array<Term,16> _a1={a.getLane(8), b.getLane(8), a.getLane(9), b.getLane(9), a.getLane(10), b.getLane(10), a.getLane(11), b.getLane(11), a.getLane(12), b.getLane(12), a.getLane(13), b.getLane(13), a.getLane(14), b.getLane(14), a.getLane(15), b.getLane(15)};
    return int8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline int16x8x2_t vzipq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    std::array<Term,8> _a1={a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    return int16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int32x4x2_t vzipq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1)};
    std::array<Term,4> _a1={a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    return int32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline float32x4x2_t vzipq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1)};
    std::array<Term,4> _a1={a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    return float32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline uint8x16x2_t vzipq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3), a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    std::array<Term,16> _a1={a.getLane(8), b.getLane(8), a.getLane(9), b.getLane(9), a.getLane(10), b.getLane(10), a.getLane(11), b.getLane(11), a.getLane(12), b.getLane(12), a.getLane(13), b.getLane(13), a.getLane(14), b.getLane(14), a.getLane(15), b.getLane(15)};
    return uint8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline uint16x8x2_t vzipq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    std::array<Term,8> _a1={a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    return uint16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline uint32x4x2_t vzipq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1)};
    std::array<Term,4> _a1={a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    return uint32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline poly8x16x2_t vzipq_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3), a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    std::array<Term,16> _a1={a.getLane(8), b.getLane(8), a.getLane(9), b.getLane(9), a.getLane(10), b.getLane(10), a.getLane(11), b.getLane(11), a.getLane(12), b.getLane(12), a.getLane(13), b.getLane(13), a.getLane(14), b.getLane(14), a.getLane(15), b.getLane(15)};
    return poly8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline poly16x8x2_t vzipq_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    std::array<Term,8> _a1={a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    return poly16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline mfloat8x16x2_t vzipq_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3), a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    std::array<Term,16> _a1={a.getLane(8), b.getLane(8), a.getLane(9), b.getLane(9), a.getLane(10), b.getLane(10), a.getLane(11), b.getLane(11), a.getLane(12), b.getLane(12), a.getLane(13), b.getLane(13), a.getLane(14), b.getLane(14), a.getLane(15), b.getLane(15)};
    return mfloat8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline float16x8x2_t vzipq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1), a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)};
    std::array<Term,8> _a1={a.getLane(4), b.getLane(4), a.getLane(5), b.getLane(5), a.getLane(6), b.getLane(6), a.getLane(7), b.getLane(7)};
    return float16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int8x8x2_t vuzp_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)};
    return int8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline int16x4x2_t vuzp_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3)};
    return int16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline int32x2x2_t vuzp_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,2> _a0={a.getLane(0), b.getLane(0)};
    std::array<Term,2> _a1={a.getLane(1), b.getLane(1)};
    return int32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline float32x2x2_t vuzp_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,2> _a0={a.getLane(0), b.getLane(0)};
    std::array<Term,2> _a1={a.getLane(1), b.getLane(1)};
    return float32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline uint8x8x2_t vuzp_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)};
    return uint8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline uint16x4x2_t vuzp_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3)};
    return uint16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline uint32x2x2_t vuzp_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,2> _a0={a.getLane(0), b.getLane(0)};
    std::array<Term,2> _a1={a.getLane(1), b.getLane(1)};
    return uint32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline poly8x8x2_t vuzp_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)};
    return poly8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline poly16x4x2_t vuzp_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3)};
    return poly16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline mfloat8x8x2_t vuzp_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)};
    return mfloat8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline int8x16x2_t vuzpq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), a.getLane(8), a.getLane(10), a.getLane(12), a.getLane(14), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6), b.getLane(8), b.getLane(10), b.getLane(12), b.getLane(14)};
    std::array<Term,16> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), a.getLane(9), a.getLane(11), a.getLane(13), a.getLane(15), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7), b.getLane(9), b.getLane(11), b.getLane(13), b.getLane(15)};
    return int8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline int16x8x2_t vuzpq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)};
    return int16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int32x4x2_t vuzpq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3)};
    return int32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline float32x4x2_t vuzpq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3)};
    return float32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline uint8x16x2_t vuzpq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), a.getLane(8), a.getLane(10), a.getLane(12), a.getLane(14), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6), b.getLane(8), b.getLane(10), b.getLane(12), b.getLane(14)};
    std::array<Term,16> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), a.getLane(9), a.getLane(11), a.getLane(13), a.getLane(15), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7), b.getLane(9), b.getLane(11), b.getLane(13), b.getLane(15)};
    return uint8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline uint16x8x2_t vuzpq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)};
    return uint16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline uint32x4x2_t vuzpq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3)};
    return uint32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline poly8x16x2_t vuzpq_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), a.getLane(8), a.getLane(10), a.getLane(12), a.getLane(14), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6), b.getLane(8), b.getLane(10), b.getLane(12), b.getLane(14)};
    std::array<Term,16> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), a.getLane(9), a.getLane(11), a.getLane(13), a.getLane(15), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7), b.getLane(9), b.getLane(11), b.getLane(13), b.getLane(15)};
    return poly8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline poly16x8x2_t vuzpq_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)};
    return poly16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline mfloat8x16x2_t vuzpq_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), a.getLane(8), a.getLane(10), a.getLane(12), a.getLane(14), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6), b.getLane(8), b.getLane(10), b.getLane(12), b.getLane(14)};
    std::array<Term,16> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), a.getLane(9), a.getLane(11), a.getLane(13), a.getLane(15), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7), b.getLane(9), b.getLane(11), b.getLane(13), b.getLane(15)};
    return mfloat8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline float16x4x2_t vuzp_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3)};
    return float16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline float16x8x2_t vuzpq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6), b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7), b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)};
    return float16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int8x8x2_t vtrn_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7)};
    return int8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline int16x4x2_t vtrn_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3)};
    return int16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline uint8x8x2_t vtrn_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7)};
    return uint8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline uint16x4x2_t vtrn_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3)};
    return uint16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline poly8x8x2_t vtrn_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7)};
    return poly8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline poly16x4x2_t vtrn_p16(const poly16x4_t& a, const poly16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3)};
    return poly16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline int32x2x2_t vtrn_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,2> _a0={a.getLane(0), b.getLane(0)};
    std::array<Term,2> _a1={a.getLane(1), b.getLane(1)};
    return int32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline float32x2x2_t vtrn_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,2> _a0={a.getLane(0), b.getLane(0)};
    std::array<Term,2> _a1={a.getLane(1), b.getLane(1)};
    return float32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline uint32x2x2_t vtrn_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,2> _a0={a.getLane(0), b.getLane(0)};
    std::array<Term,2> _a1={a.getLane(1), b.getLane(1)};
    return uint32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline mfloat8x8x2_t vtrn_mf8(const mfloat8x8_t& a, const mfloat8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7)};
    return mfloat8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline int8x16x2_t vtrnq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6), a.getLane(8), b.getLane(8), a.getLane(10), b.getLane(10), a.getLane(12), b.getLane(12), a.getLane(14), b.getLane(14)};
    std::array<Term,16> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7), a.getLane(9), b.getLane(9), a.getLane(11), b.getLane(11), a.getLane(13), b.getLane(13), a.getLane(15), b.getLane(15)};
    return int8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline int16x8x2_t vtrnq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7)};
    return int16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int32x4x2_t vtrnq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3)};
    return int32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline float32x4x2_t vtrnq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3)};
    return float32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline uint8x16x2_t vtrnq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6), a.getLane(8), b.getLane(8), a.getLane(10), b.getLane(10), a.getLane(12), b.getLane(12), a.getLane(14), b.getLane(14)};
    std::array<Term,16> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7), a.getLane(9), b.getLane(9), a.getLane(11), b.getLane(11), a.getLane(13), b.getLane(13), a.getLane(15), b.getLane(15)};
    return uint8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline uint16x8x2_t vtrnq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7)};
    return uint16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline uint32x4x2_t vtrnq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3)};
    return uint32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline poly8x16x2_t vtrnq_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6), a.getLane(8), b.getLane(8), a.getLane(10), b.getLane(10), a.getLane(12), b.getLane(12), a.getLane(14), b.getLane(14)};
    std::array<Term,16> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7), a.getLane(9), b.getLane(9), a.getLane(11), b.getLane(11), a.getLane(13), b.getLane(13), a.getLane(15), b.getLane(15)};
    return poly8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline poly16x8x2_t vtrnq_p16(const poly16x8_t& a, const poly16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7)};
    return poly16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline mfloat8x16x2_t vtrnq_mf8(const mfloat8x16_t& a, const mfloat8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,16> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6), a.getLane(8), b.getLane(8), a.getLane(10), b.getLane(10), a.getLane(12), b.getLane(12), a.getLane(14), b.getLane(14)};
    std::array<Term,16> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7), a.getLane(9), b.getLane(9), a.getLane(11), b.getLane(11), a.getLane(13), b.getLane(13), a.getLane(15), b.getLane(15)};
    return mfloat8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline float16x4x2_t vtrn_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,4> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2)};
    std::array<Term,4> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3)};
    return float16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline float16x8x2_t vtrnq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term,8> _a0={a.getLane(0), b.getLane(0), a.getLane(2), b.getLane(2), a.getLane(4), b.getLane(4), a.getLane(6), b.getLane(6)};
    std::array<Term,8> _a1={a.getLane(1), b.getLane(1), a.getLane(3), b.getLane(3), a.getLane(5), b.getLane(5), a.getLane(7), b.getLane(7)};
    return float16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}

} // namespace salt_cvc5
