#pragma once
// NEON shifts: immediate/register, rounding, insert, accumulate
#include "arith_help.hpp"
namespace salt_cvc5 {

inline int8x8_t vshl_n_s8(const int8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vshlq_n_s8(const int8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vshl_n_s16(const int16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 16);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vshl_n_s32(const int32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 32);
    return int32x2_t(tm, _nres);
}
inline int64x1_t vshl_n_s64(const int64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vshlq_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 64);
    return int64x2_t(tm, _nres);
}
inline uint8x16_t vshlq_n_u8(const uint8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vshl_n_u16(const uint16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vshlq_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vshl_n_u32(const uint32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vshlq_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vshl_n_u64(const uint64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vshlq_n_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_shl_imm(tm, a.getLane(i), n, 64);
    return uint64x2_t(tm, _nres);
}
inline int64_t vshld_n_s64(int64_t a, const int n) { return {}; }
inline uint64_t vshld_n_u64(uint64_t a, const int n) { return {}; }
inline float32_t vcvtah_f32_bf16(bfloat16_t a) { return {}; }
inline int8x16_t vshrq_n_s8(const int8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 8, true);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vshr_n_s16(const int16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 16, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vshrq_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vshr_n_s32(const int32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 32, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vshrq_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 32, true);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vshr_n_s64(const int64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 64, true);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vshrq_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 64, true);
    return int64x2_t(tm, _nres);
}
inline int64_t vshrd_n_s64(int64_t a, const int n) { return {}; }
inline uint8x8_t vshr_n_u8(const uint8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 8, false);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vshrq_n_u8(const uint8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 8, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vshr_n_u16(const uint16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 16, false);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vshrq_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 16, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vshr_n_u32(const uint32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 32, false);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vshrq_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 32, false);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vshr_n_u64(const uint64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 64, false);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vshrq_n_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_shr_imm(tm, a.getLane(i), n, 64, false);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vshrd_n_u64(uint64_t a, const int n) { return {}; }
inline int8x8_t vrshr_n_s8(const int8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 8, true);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vrshrq_n_s8(const int8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 8, true);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vrshr_n_s16(const int16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 16, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vrshrq_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vrshr_n_s32(const int32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 32, true);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vrshrq_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 32, true);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vrshr_n_s64(const int64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 64, true);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vrshrq_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 64, true);
    return int64x2_t(tm, _nres);
}
inline int64_t vrshrd_n_s64(int64_t a, const int n) { return {}; }
inline uint8x8_t vrshr_n_u8(const uint8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 8, false);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vrshrq_n_u8(const uint8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 8, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vrshr_n_u16(const uint16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 16, false);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vrshrq_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 16, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vrshr_n_u32(const uint32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 32, false);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vrshrq_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 32, false);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vrshr_n_u64(const uint64x1_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 64, false);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vrshrq_n_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_rshr_imm(tm, a.getLane(i), n, 64, false);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vrshrd_n_u64(uint64_t a, const int n) { return {}; }
inline int8x8_t vsra_n_s8(const int8x8_t& a, const int8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 8, true));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vsraq_n_s8(const int8x16_t& a, const int8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 8, true));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vsra_n_s16(const int16x4_t& a, const int16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 16, true));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vsraq_n_s16(const int16x8_t& a, const int16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 16, true));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vsra_n_s32(const int32x2_t& a, const int32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 32, true));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vsraq_n_s32(const int32x4_t& a, const int32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 32, true));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vsra_n_s64(const int64x1_t& a, const int64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 64, true));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vsraq_n_s64(const int64x2_t& a, const int64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 64, true));
    return int64x2_t(tm, _nres);
}
inline int64_t vsrad_n_s64(int64_t a, int64_t b, const int n) { return {}; }
inline uint8x8_t vsra_n_u8(const uint8x8_t& a, const uint8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 8, false));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vsraq_n_u8(const uint8x16_t& a, const uint8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 8, false));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vsra_n_u16(const uint16x4_t& a, const uint16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 16, false));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vsraq_n_u16(const uint16x8_t& a, const uint16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 16, false));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vsra_n_u32(const uint32x2_t& a, const uint32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 32, false));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vsraq_n_u32(const uint32x4_t& a, const uint32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 32, false));
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vsra_n_u64(const uint64x1_t& a, const uint64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 64, false));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vsraq_n_u64(const uint64x2_t& a, const uint64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_shr_imm(tm, b.getLane(i), n, 64, false));
    return uint64x2_t(tm, _nres);
}
inline uint64_t vsrad_n_u64(uint64_t a, uint64_t b, const int n) { return {}; }
inline int8x8_t vrsra_n_s8(const int8x8_t& a, const int8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 8, true));
    return int8x8_t(tm, _nres);
}
inline int8x16_t vrsraq_n_s8(const int8x16_t& a, const int8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 8, true));
    return int8x16_t(tm, _nres);
}
inline int16x4_t vrsra_n_s16(const int16x4_t& a, const int16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 16, true));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vrsraq_n_s16(const int16x8_t& a, const int16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 16, true));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vrsra_n_s32(const int32x2_t& a, const int32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 32, true));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vrsraq_n_s32(const int32x4_t& a, const int32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 32, true));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vrsra_n_s64(const int64x1_t& a, const int64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 64, true));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vrsraq_n_s64(const int64x2_t& a, const int64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 64, true));
    return int64x2_t(tm, _nres);
}
inline int64_t vrsrad_n_s64(int64_t a, int64_t b, const int n) { return {}; }
inline uint8x8_t vrsra_n_u8(const uint8x8_t& a, const uint8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 8, false));
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vrsraq_n_u8(const uint8x16_t& a, const uint8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 8, false));
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vrsra_n_u16(const uint16x4_t& a, const uint16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 16, false));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vrsraq_n_u16(const uint16x8_t& a, const uint16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 16, false));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vrsra_n_u32(const uint32x2_t& a, const uint32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 32, false));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vrsraq_n_u32(const uint32x4_t& a, const uint32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 32, false));
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vrsra_n_u64(const uint64x1_t& a, const uint64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 64, false));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vrsraq_n_u64(const uint64x2_t& a, const uint64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nsh_rshr_imm(tm, b.getLane(i), n, 64, false));
    return uint64x2_t(tm, _nres);
}
inline uint64_t vrsrad_n_u64(uint64_t a, uint64_t b, const int n) { return {}; }
inline int8x8_t vsri_n_s8(const int8x8_t& a, const int8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vsriq_n_s8(const int8x16_t& a, const int8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vsri_n_s16(const int16x4_t& a, const int16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vsriq_n_s16(const int16x8_t& a, const int16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 16);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vsri_n_s32(const int32x2_t& a, const int32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vsriq_n_s32(const int32x4_t& a, const int32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 32);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vsri_n_s64(const int64x1_t& a, const int64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vsriq_n_s64(const int64x2_t& a, const int64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 64);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vsri_n_u8(const uint8x8_t& a, const uint8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vsriq_n_u8(const uint8x16_t& a, const uint8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vsri_n_u16(const uint16x4_t& a, const uint16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vsriq_n_u16(const uint16x8_t& a, const uint16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vsri_n_u32(const uint32x2_t& a, const uint32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vsriq_n_u32(const uint32x4_t& a, const uint32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vsri_n_u64(const uint64x1_t& a, const uint64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vsriq_n_u64(const uint64x2_t& a, const uint64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 64);
    return uint64x2_t(tm, _nres);
}
inline poly64x1_t vsri_n_p64(const poly64x1_t& a, const poly64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 64);
    return poly64x1_t(tm, _nres);
}
inline poly64x2_t vsriq_n_p64(const poly64x2_t& a, const poly64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 64);
    return poly64x2_t(tm, _nres);
}
inline poly8x8_t vsri_n_p8(const poly8x8_t& a, const poly8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 8);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vsriq_n_p8(const poly8x16_t& a, const poly8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 8);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vsri_n_p16(const poly16x4_t& a, const poly16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 16);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vsriq_n_p16(const poly16x8_t& a, const poly16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sri(tm, a.getLane(i), b.getLane(i), n, 16);
    return poly16x8_t(tm, _nres);
}
inline int64_t vsrid_n_s64(int64_t a, int64_t b, const int n) { return {}; }
inline uint64_t vsrid_n_u64(uint64_t a, uint64_t b, const int n) { return {}; }
inline int8x8_t vsli_n_s8(const int8x8_t& a, const int8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 8);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vsliq_n_s8(const int8x16_t& a, const int8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 8);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vsli_n_s16(const int16x4_t& a, const int16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 16);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vsliq_n_s16(const int16x8_t& a, const int16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 16);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vsli_n_s32(const int32x2_t& a, const int32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 32);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vsliq_n_s32(const int32x4_t& a, const int32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 32);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vsli_n_s64(const int64x1_t& a, const int64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 64);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vsliq_n_s64(const int64x2_t& a, const int64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 64);
    return int64x2_t(tm, _nres);
}
inline uint8x8_t vsli_n_u8(const uint8x8_t& a, const uint8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 8);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vsliq_n_u8(const uint8x16_t& a, const uint8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 8);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vsli_n_u16(const uint16x4_t& a, const uint16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 16);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vsliq_n_u16(const uint16x8_t& a, const uint16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 16);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vsli_n_u32(const uint32x2_t& a, const uint32x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 32);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vsliq_n_u32(const uint32x4_t& a, const uint32x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 32);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vsli_n_u64(const uint64x1_t& a, const uint64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 64);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vsliq_n_u64(const uint64x2_t& a, const uint64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 64);
    return uint64x2_t(tm, _nres);
}
inline poly64x1_t vsli_n_p64(const poly64x1_t& a, const poly64x1_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 64);
    return poly64x1_t(tm, _nres);
}
inline poly64x2_t vsliq_n_p64(const poly64x2_t& a, const poly64x2_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 64);
    return poly64x2_t(tm, _nres);
}
inline poly8x8_t vsli_n_p8(const poly8x8_t& a, const poly8x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 8);
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vsliq_n_p8(const poly8x16_t& a, const poly8x16_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 8);
    return poly8x16_t(tm, _nres);
}
inline poly16x4_t vsli_n_p16(const poly16x4_t& a, const poly16x4_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 16);
    return poly16x4_t(tm, _nres);
}
inline poly16x8_t vsliq_n_p16(const poly16x8_t& a, const poly16x8_t& b, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_sli(tm, a.getLane(i), b.getLane(i), n, 16);
    return poly16x8_t(tm, _nres);
}
inline int64_t vslid_n_s64(int64_t a, int64_t b, const int n) { return {}; }
inline uint64_t vslid_n_u64(uint64_t a, uint64_t b, const int n) { return {}; }
inline int8x8_t vshl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 8, true, false);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vshlq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 8, true, false);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vshl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 16, true, false);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vshlq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 16, true, false);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vshl_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 32, true, false);
    return int32x2_t(tm, _nres);
}
inline int32x4_t vshlq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 32, true, false);
    return int32x4_t(tm, _nres);
}
inline int64x1_t vshl_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 64, true, false);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vshlq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 64, true, false);
    return int64x2_t(tm, _nres);
}
inline int64_t vshld_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vshl_u8(const uint8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 8, false, false);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vshlq_u8(const uint8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 8, false, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vshl_u16(const uint16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 16, false, false);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vshlq_u16(const uint16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 16, false, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vshl_u32(const uint32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 32, false, false);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vshlq_u32(const uint32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 32, false, false);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vshl_u64(const uint64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 64, false, false);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vshlq_u64(const uint64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 64, false, false);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vshld_u64(uint64_t a, int64_t b) { return {}; }
inline int8x8_t vrshl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 8, true, true);
    return int8x8_t(tm, _nres);
}
inline int8x16_t vrshlq_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 8, true, true);
    return int8x16_t(tm, _nres);
}
inline int16x4_t vrshl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 16, true, true);
    return int16x4_t(tm, _nres);
}
inline int16x8_t vrshlq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 16, true, true);
    return int16x8_t(tm, _nres);
}
inline int32x2_t vrshl_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 32, true, true);
    return int32x2_t(tm, _nres);
}
inline int64x1_t vrshl_s64(const int64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 64, true, true);
    return int64x1_t(tm, _nres);
}
inline int64x2_t vrshlq_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 64, true, true);
    return int64x2_t(tm, _nres);
}
inline int64_t vrshld_s64(int64_t a, int64_t b) { return {}; }
inline uint8x8_t vrshl_u8(const uint8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 8, false, true);
    return uint8x8_t(tm, _nres);
}
inline uint8x16_t vrshlq_u8(const uint8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 8, false, true);
    return uint8x16_t(tm, _nres);
}
inline uint16x4_t vrshl_u16(const uint16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 16, false, true);
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vrshlq_u16(const uint16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 16, false, true);
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vrshl_u32(const uint32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 32, false, true);
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vrshlq_u32(const uint32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 32, false, true);
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vrshl_u64(const uint64x1_t& a, const int64x1_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 64, false, true);
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vrshlq_u64(const uint64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsh_reg(tm, a.getLane(i), b.getLane(i), 64, false, true);
    return uint64x2_t(tm, _nres);
}
inline uint64_t vrshld_u64(uint64_t a, int64_t b) { return {}; }

} // namespace salt_cvc5
