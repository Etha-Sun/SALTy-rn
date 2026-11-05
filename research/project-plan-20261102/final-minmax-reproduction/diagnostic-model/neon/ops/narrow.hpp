#pragma once
// NEON narrowing: xtn/saturating/shift-right/high-half
#include "arith_help.hpp"
namespace salt_cvc5 {

inline int16x4_t vmovn_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvextract(tm,15,0,a.getLane(0));
    _nres[1] = fold_bvextract(tm,15,0,a.getLane(1));
    _nres[2] = fold_bvextract(tm,15,0,a.getLane(2));
    _nres[3] = fold_bvextract(tm,15,0,a.getLane(3));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vmovn_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvextract(tm,31,0,a.getLane(0));
    _nres[1] = fold_bvextract(tm,31,0,a.getLane(1));
    return int32x2_t(tm, _nres);
}
inline uint16x4_t vmovn_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvextract(tm,15,0,a.getLane(0));
    _nres[1] = fold_bvextract(tm,15,0,a.getLane(1));
    _nres[2] = fold_bvextract(tm,15,0,a.getLane(2));
    _nres[3] = fold_bvextract(tm,15,0,a.getLane(3));
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vmovn_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvextract(tm,31,0,a.getLane(0));
    _nres[1] = fold_bvextract(tm,31,0,a.getLane(1));
    return uint32x2_t(tm, _nres);
}
inline int8x16_t vmovn_high_s16(const int8x8_t& r, const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = fold_bvextract(tm,7,0,a.getLane(0));
    _nres[9] = fold_bvextract(tm,7,0,a.getLane(1));
    _nres[10] = fold_bvextract(tm,7,0,a.getLane(2));
    _nres[11] = fold_bvextract(tm,7,0,a.getLane(3));
    _nres[12] = fold_bvextract(tm,7,0,a.getLane(4));
    _nres[13] = fold_bvextract(tm,7,0,a.getLane(5));
    _nres[14] = fold_bvextract(tm,7,0,a.getLane(6));
    _nres[15] = fold_bvextract(tm,7,0,a.getLane(7));
    return int8x16_t(tm, _nres);
}
inline int16x8_t vmovn_high_s32(const int16x4_t& r, const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = fold_bvextract(tm,15,0,a.getLane(0));
    _nres[5] = fold_bvextract(tm,15,0,a.getLane(1));
    _nres[6] = fold_bvextract(tm,15,0,a.getLane(2));
    _nres[7] = fold_bvextract(tm,15,0,a.getLane(3));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vmovn_high_s64(const int32x2_t& r, const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = fold_bvextract(tm,31,0,a.getLane(0));
    _nres[3] = fold_bvextract(tm,31,0,a.getLane(1));
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vmovn_high_u16(const uint8x8_t& r, const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = fold_bvextract(tm,7,0,a.getLane(0));
    _nres[9] = fold_bvextract(tm,7,0,a.getLane(1));
    _nres[10] = fold_bvextract(tm,7,0,a.getLane(2));
    _nres[11] = fold_bvextract(tm,7,0,a.getLane(3));
    _nres[12] = fold_bvextract(tm,7,0,a.getLane(4));
    _nres[13] = fold_bvextract(tm,7,0,a.getLane(5));
    _nres[14] = fold_bvextract(tm,7,0,a.getLane(6));
    _nres[15] = fold_bvextract(tm,7,0,a.getLane(7));
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vmovn_high_u32(const uint16x4_t& r, const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = fold_bvextract(tm,15,0,a.getLane(0));
    _nres[5] = fold_bvextract(tm,15,0,a.getLane(1));
    _nres[6] = fold_bvextract(tm,15,0,a.getLane(2));
    _nres[7] = fold_bvextract(tm,15,0,a.getLane(3));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vmovn_high_u64(const uint32x2_t& r, const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = fold_bvextract(tm,31,0,a.getLane(0));
    _nres[3] = fold_bvextract(tm,31,0,a.getLane(1));
    return uint32x4_t(tm, _nres);
}
inline int32x2_t vqmovn_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nsat_clamp_s(tm,a.getLane(0),64,32);
    _nres[1] = _nsat_clamp_s(tm,a.getLane(1),64,32);
    return int32x2_t(tm, _nres);
}
inline int8_t vqmovnh_s16(int16_t a) { return {}; }
inline int16_t vqmovns_s32(int32_t a) { return {}; }
inline int32_t vqmovnd_s64(int64_t a) { return {}; }
inline int32x4_t vqmovn_high_s64(const int32x2_t& r, const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nsat_clamp_s(tm,a.getLane(0),64,32);
    _nres[3] = _nsat_clamp_s(tm,a.getLane(1),64,32);
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vqmovn_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _nnar_u(tm,a.getLane(0),16,8);
    _nres[1] = _nnar_u(tm,a.getLane(1),16,8);
    _nres[2] = _nnar_u(tm,a.getLane(2),16,8);
    _nres[3] = _nnar_u(tm,a.getLane(3),16,8);
    _nres[4] = _nnar_u(tm,a.getLane(4),16,8);
    _nres[5] = _nnar_u(tm,a.getLane(5),16,8);
    _nres[6] = _nnar_u(tm,a.getLane(6),16,8);
    _nres[7] = _nnar_u(tm,a.getLane(7),16,8);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vqmovn_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _nnar_u(tm,a.getLane(0),32,16);
    _nres[1] = _nnar_u(tm,a.getLane(1),32,16);
    _nres[2] = _nnar_u(tm,a.getLane(2),32,16);
    _nres[3] = _nnar_u(tm,a.getLane(3),32,16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vqmovn_u64(const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nnar_u(tm,a.getLane(0),64,32);
    _nres[1] = _nnar_u(tm,a.getLane(1),64,32);
    return uint32x2_t(tm, _nres);
}
inline uint8_t vqmovnh_u16(uint16_t a) { return {}; }
inline uint16_t vqmovns_u32(uint32_t a) { return {}; }
inline uint32_t vqmovnd_u64(uint64_t a) { return {}; }
inline uint8x16_t vqmovn_high_u16(const uint8x8_t& r, const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _nnar_u(tm,a.getLane(0),16,8);
    _nres[9] = _nnar_u(tm,a.getLane(1),16,8);
    _nres[10] = _nnar_u(tm,a.getLane(2),16,8);
    _nres[11] = _nnar_u(tm,a.getLane(3),16,8);
    _nres[12] = _nnar_u(tm,a.getLane(4),16,8);
    _nres[13] = _nnar_u(tm,a.getLane(5),16,8);
    _nres[14] = _nnar_u(tm,a.getLane(6),16,8);
    _nres[15] = _nnar_u(tm,a.getLane(7),16,8);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vqmovn_high_u32(const uint16x4_t& r, const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _nnar_u(tm,a.getLane(0),32,16);
    _nres[5] = _nnar_u(tm,a.getLane(1),32,16);
    _nres[6] = _nnar_u(tm,a.getLane(2),32,16);
    _nres[7] = _nnar_u(tm,a.getLane(3),32,16);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vqmovn_high_u64(const uint32x2_t& r, const uint64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nnar_u(tm,a.getLane(0),64,32);
    _nres[3] = _nnar_u(tm,a.getLane(1),64,32);
    return uint32x4_t(tm, _nres);
}
inline uint8x8_t vqmovun_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _nsat_clamp_u(tm,a.getLane(0),16,8);
    _nres[1] = _nsat_clamp_u(tm,a.getLane(1),16,8);
    _nres[2] = _nsat_clamp_u(tm,a.getLane(2),16,8);
    _nres[3] = _nsat_clamp_u(tm,a.getLane(3),16,8);
    _nres[4] = _nsat_clamp_u(tm,a.getLane(4),16,8);
    _nres[5] = _nsat_clamp_u(tm,a.getLane(5),16,8);
    _nres[6] = _nsat_clamp_u(tm,a.getLane(6),16,8);
    _nres[7] = _nsat_clamp_u(tm,a.getLane(7),16,8);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vqmovun_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _nsat_clamp_u(tm,a.getLane(0),32,16);
    _nres[1] = _nsat_clamp_u(tm,a.getLane(1),32,16);
    _nres[2] = _nsat_clamp_u(tm,a.getLane(2),32,16);
    _nres[3] = _nsat_clamp_u(tm,a.getLane(3),32,16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vqmovun_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nsat_clamp_u(tm,a.getLane(0),64,32);
    _nres[1] = _nsat_clamp_u(tm,a.getLane(1),64,32);
    return uint32x2_t(tm, _nres);
}
inline uint8_t vqmovunh_s16(int16_t a) { return {}; }
inline uint16_t vqmovuns_s32(int32_t a) { return {}; }
inline uint32_t vqmovund_s64(int64_t a) { return {}; }
inline uint8x16_t vqmovun_high_s16(const uint8x8_t& r, const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _nsat_clamp_u(tm,a.getLane(0),16,8);
    _nres[9] = _nsat_clamp_u(tm,a.getLane(1),16,8);
    _nres[10] = _nsat_clamp_u(tm,a.getLane(2),16,8);
    _nres[11] = _nsat_clamp_u(tm,a.getLane(3),16,8);
    _nres[12] = _nsat_clamp_u(tm,a.getLane(4),16,8);
    _nres[13] = _nsat_clamp_u(tm,a.getLane(5),16,8);
    _nres[14] = _nsat_clamp_u(tm,a.getLane(6),16,8);
    _nres[15] = _nsat_clamp_u(tm,a.getLane(7),16,8);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vqmovun_high_s32(const uint16x4_t& r, const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _nsat_clamp_u(tm,a.getLane(0),32,16);
    _nres[5] = _nsat_clamp_u(tm,a.getLane(1),32,16);
    _nres[6] = _nsat_clamp_u(tm,a.getLane(2),32,16);
    _nres[7] = _nsat_clamp_u(tm,a.getLane(3),32,16);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vqmovun_high_s64(const uint32x2_t& r, const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nsat_clamp_u(tm,a.getLane(0),64,32);
    _nres[3] = _nsat_clamp_u(tm,a.getLane(1),64,32);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vshrn_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(0),n,16,false));
    _nres[1] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(1),n,16,false));
    _nres[2] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(2),n,16,false));
    _nres[3] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(3),n,16,false));
    _nres[4] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(4),n,16,false));
    _nres[5] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(5),n,16,false));
    _nres[6] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(6),n,16,false));
    _nres[7] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(7),n,16,false));
    return int8x8_t(tm, _nres);
}
inline int16x4_t vshrn_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(0),n,32,false));
    _nres[1] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(1),n,32,false));
    _nres[2] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(2),n,32,false));
    _nres[3] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(3),n,32,false));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vshrn_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvextract(tm,31,0,_nsh_shr_imm(tm,a.getLane(0),n,64,false));
    _nres[1] = fold_bvextract(tm,31,0,_nsh_shr_imm(tm,a.getLane(1),n,64,false));
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vshrn_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(0),n,16,false));
    _nres[1] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(1),n,16,false));
    _nres[2] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(2),n,16,false));
    _nres[3] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(3),n,16,false));
    _nres[4] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(4),n,16,false));
    _nres[5] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(5),n,16,false));
    _nres[6] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(6),n,16,false));
    _nres[7] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(7),n,16,false));
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vshrn_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(0),n,32,false));
    _nres[1] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(1),n,32,false));
    _nres[2] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(2),n,32,false));
    _nres[3] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(3),n,32,false));
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vshrn_n_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvextract(tm,31,0,_nsh_shr_imm(tm,a.getLane(0),n,64,false));
    _nres[1] = fold_bvextract(tm,31,0,_nsh_shr_imm(tm,a.getLane(1),n,64,false));
    return uint32x2_t(tm, _nres);
}
inline int8x16_t vshrn_high_n_s16(const int8x8_t& r, const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(0),n,16,false));
    _nres[9] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(1),n,16,false));
    _nres[10] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(2),n,16,false));
    _nres[11] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(3),n,16,false));
    _nres[12] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(4),n,16,false));
    _nres[13] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(5),n,16,false));
    _nres[14] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(6),n,16,false));
    _nres[15] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(7),n,16,false));
    return int8x16_t(tm, _nres);
}
inline int16x8_t vshrn_high_n_s32(const int16x4_t& r, const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(0),n,32,false));
    _nres[5] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(1),n,32,false));
    _nres[6] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(2),n,32,false));
    _nres[7] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(3),n,32,false));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vshrn_high_n_s64(const int32x2_t& r, const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = fold_bvextract(tm,31,0,_nsh_shr_imm(tm,a.getLane(0),n,64,false));
    _nres[3] = fold_bvextract(tm,31,0,_nsh_shr_imm(tm,a.getLane(1),n,64,false));
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vshrn_high_n_u16(const uint8x8_t& r, const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(0),n,16,false));
    _nres[9] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(1),n,16,false));
    _nres[10] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(2),n,16,false));
    _nres[11] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(3),n,16,false));
    _nres[12] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(4),n,16,false));
    _nres[13] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(5),n,16,false));
    _nres[14] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(6),n,16,false));
    _nres[15] = fold_bvextract(tm,7,0,_nsh_shr_imm(tm,a.getLane(7),n,16,false));
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vshrn_high_n_u32(const uint16x4_t& r, const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(0),n,32,false));
    _nres[5] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(1),n,32,false));
    _nres[6] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(2),n,32,false));
    _nres[7] = fold_bvextract(tm,15,0,_nsh_shr_imm(tm,a.getLane(3),n,32,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vshrn_high_n_u64(const uint32x2_t& r, const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = fold_bvextract(tm,31,0,_nsh_shr_imm(tm,a.getLane(0),n,64,false));
    _nres[3] = fold_bvextract(tm,31,0,_nsh_shr_imm(tm,a.getLane(1),n,64,false));
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vrshrn_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(0),n,16,false));
    _nres[1] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(1),n,16,false));
    _nres[2] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(2),n,16,false));
    _nres[3] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(3),n,16,false));
    _nres[4] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(4),n,16,false));
    _nres[5] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(5),n,16,false));
    _nres[6] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(6),n,16,false));
    _nres[7] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(7),n,16,false));
    return int8x8_t(tm, _nres);
}
inline int16x4_t vrshrn_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(0),n,32,false));
    _nres[1] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(1),n,32,false));
    _nres[2] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(2),n,32,false));
    _nres[3] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(3),n,32,false));
    return int16x4_t(tm, _nres);
}
inline int32x2_t vrshrn_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvextract(tm,31,0,_nsh_rshr_imm(tm,a.getLane(0),n,64,false));
    _nres[1] = fold_bvextract(tm,31,0,_nsh_rshr_imm(tm,a.getLane(1),n,64,false));
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vrshrn_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(0),n,16,false));
    _nres[1] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(1),n,16,false));
    _nres[2] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(2),n,16,false));
    _nres[3] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(3),n,16,false));
    _nres[4] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(4),n,16,false));
    _nres[5] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(5),n,16,false));
    _nres[6] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(6),n,16,false));
    _nres[7] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(7),n,16,false));
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vrshrn_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(0),n,32,false));
    _nres[1] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(1),n,32,false));
    _nres[2] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(2),n,32,false));
    _nres[3] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(3),n,32,false));
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vrshrn_n_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvextract(tm,31,0,_nsh_rshr_imm(tm,a.getLane(0),n,64,false));
    _nres[1] = fold_bvextract(tm,31,0,_nsh_rshr_imm(tm,a.getLane(1),n,64,false));
    return uint32x2_t(tm, _nres);
}
inline int8x16_t vrshrn_high_n_s16(const int8x8_t& r, const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(0),n,16,false));
    _nres[9] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(1),n,16,false));
    _nres[10] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(2),n,16,false));
    _nres[11] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(3),n,16,false));
    _nres[12] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(4),n,16,false));
    _nres[13] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(5),n,16,false));
    _nres[14] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(6),n,16,false));
    _nres[15] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(7),n,16,false));
    return int8x16_t(tm, _nres);
}
inline int16x8_t vrshrn_high_n_s32(const int16x4_t& r, const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(0),n,32,false));
    _nres[5] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(1),n,32,false));
    _nres[6] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(2),n,32,false));
    _nres[7] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(3),n,32,false));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vrshrn_high_n_s64(const int32x2_t& r, const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = fold_bvextract(tm,31,0,_nsh_rshr_imm(tm,a.getLane(0),n,64,false));
    _nres[3] = fold_bvextract(tm,31,0,_nsh_rshr_imm(tm,a.getLane(1),n,64,false));
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vrshrn_high_n_u16(const uint8x8_t& r, const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(0),n,16,false));
    _nres[9] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(1),n,16,false));
    _nres[10] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(2),n,16,false));
    _nres[11] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(3),n,16,false));
    _nres[12] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(4),n,16,false));
    _nres[13] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(5),n,16,false));
    _nres[14] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(6),n,16,false));
    _nres[15] = fold_bvextract(tm,7,0,_nsh_rshr_imm(tm,a.getLane(7),n,16,false));
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vrshrn_high_n_u32(const uint16x4_t& r, const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(0),n,32,false));
    _nres[5] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(1),n,32,false));
    _nres[6] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(2),n,32,false));
    _nres[7] = fold_bvextract(tm,15,0,_nsh_rshr_imm(tm,a.getLane(3),n,32,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vrshrn_high_n_u64(const uint32x2_t& r, const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = fold_bvextract(tm,31,0,_nsh_rshr_imm(tm,a.getLane(0),n,64,false));
    _nres[3] = fold_bvextract(tm,31,0,_nsh_rshr_imm(tm,a.getLane(1),n,64,false));
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vqshrn_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(0),n,16,true),16,8);
    _nres[1] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(1),n,16,true),16,8);
    _nres[2] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(2),n,16,true),16,8);
    _nres[3] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(3),n,16,true),16,8);
    _nres[4] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(4),n,16,true),16,8);
    _nres[5] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(5),n,16,true),16,8);
    _nres[6] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(6),n,16,true),16,8);
    _nres[7] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(7),n,16,true),16,8);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vqshrn_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(0),n,32,true),32,16);
    _nres[1] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(1),n,32,true),32,16);
    _nres[2] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(2),n,32,true),32,16);
    _nres[3] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(3),n,32,true),32,16);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vqshrn_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(0),n,64,true),64,32);
    _nres[1] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(1),n,64,true),64,32);
    return int32x2_t(tm, _nres);
}
inline int8_t vqshrnh_n_s16(int16_t a, const int n) { return {}; }
inline int16_t vqshrns_n_s32(int32_t a, const int n) { return {}; }
inline int32_t vqshrnd_n_s64(int64_t a, const int n) { return {}; }
inline int8x16_t vqshrn_high_n_s16(const int8x8_t& r, const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(0),n,16,true),16,8);
    _nres[9] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(1),n,16,true),16,8);
    _nres[10] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(2),n,16,true),16,8);
    _nres[11] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(3),n,16,true),16,8);
    _nres[12] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(4),n,16,true),16,8);
    _nres[13] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(5),n,16,true),16,8);
    _nres[14] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(6),n,16,true),16,8);
    _nres[15] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(7),n,16,true),16,8);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vqshrn_high_n_s32(const int16x4_t& r, const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(0),n,32,true),32,16);
    _nres[5] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(1),n,32,true),32,16);
    _nres[6] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(2),n,32,true),32,16);
    _nres[7] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(3),n,32,true),32,16);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vqshrn_high_n_s64(const int32x2_t& r, const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(0),n,64,true),64,32);
    _nres[3] = _nsat_clamp_s(tm,_nsh_shr_imm(tm,a.getLane(1),n,64,true),64,32);
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vqshrn_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,16,false),16,8);
    _nres[1] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,16,false),16,8);
    _nres[2] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(2),n,16,false),16,8);
    _nres[3] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(3),n,16,false),16,8);
    _nres[4] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(4),n,16,false),16,8);
    _nres[5] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(5),n,16,false),16,8);
    _nres[6] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(6),n,16,false),16,8);
    _nres[7] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(7),n,16,false),16,8);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vqshrn_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,32,false),32,16);
    _nres[1] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,32,false),32,16);
    _nres[2] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(2),n,32,false),32,16);
    _nres[3] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(3),n,32,false),32,16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vqshrn_n_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,64,false),64,32);
    _nres[1] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,64,false),64,32);
    return uint32x2_t(tm, _nres);
}
inline uint8_t vqshrnh_n_u16(uint16_t a, const int n) { return {}; }
inline uint16_t vqshrns_n_u32(uint32_t a, const int n) { return {}; }
inline uint32_t vqshrnd_n_u64(uint64_t a, const int n) { return {}; }
inline uint8x16_t vqshrn_high_n_u16(const uint8x8_t& r, const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,16,false),16,8);
    _nres[9] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,16,false),16,8);
    _nres[10] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(2),n,16,false),16,8);
    _nres[11] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(3),n,16,false),16,8);
    _nres[12] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(4),n,16,false),16,8);
    _nres[13] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(5),n,16,false),16,8);
    _nres[14] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(6),n,16,false),16,8);
    _nres[15] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(7),n,16,false),16,8);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vqshrn_high_n_u32(const uint16x4_t& r, const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,32,false),32,16);
    _nres[5] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,32,false),32,16);
    _nres[6] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(2),n,32,false),32,16);
    _nres[7] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(3),n,32,false),32,16);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vqshrn_high_n_u64(const uint32x2_t& r, const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,64,false),64,32);
    _nres[3] = _nnar_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,64,false),64,32);
    return uint32x4_t(tm, _nres);
}
inline uint8x8_t vqshrun_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,16,true),16,8);
    _nres[1] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,16,true),16,8);
    _nres[2] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(2),n,16,true),16,8);
    _nres[3] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(3),n,16,true),16,8);
    _nres[4] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(4),n,16,true),16,8);
    _nres[5] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(5),n,16,true),16,8);
    _nres[6] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(6),n,16,true),16,8);
    _nres[7] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(7),n,16,true),16,8);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vqshrun_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,32,true),32,16);
    _nres[1] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,32,true),32,16);
    _nres[2] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(2),n,32,true),32,16);
    _nres[3] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(3),n,32,true),32,16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vqshrun_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,64,true),64,32);
    _nres[1] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,64,true),64,32);
    return uint32x2_t(tm, _nres);
}
inline uint8_t vqshrunh_n_s16(int16_t a, const int n) { return {}; }
inline uint16_t vqshruns_n_s32(int32_t a, const int n) { return {}; }
inline uint32_t vqshrund_n_s64(int64_t a, const int n) { return {}; }
inline uint8x16_t vqshrun_high_n_s16(const uint8x8_t& r, const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,16,true),16,8);
    _nres[9] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,16,true),16,8);
    _nres[10] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(2),n,16,true),16,8);
    _nres[11] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(3),n,16,true),16,8);
    _nres[12] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(4),n,16,true),16,8);
    _nres[13] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(5),n,16,true),16,8);
    _nres[14] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(6),n,16,true),16,8);
    _nres[15] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(7),n,16,true),16,8);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vqshrun_high_n_s32(const uint16x4_t& r, const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,32,true),32,16);
    _nres[5] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,32,true),32,16);
    _nres[6] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(2),n,32,true),32,16);
    _nres[7] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(3),n,32,true),32,16);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vqshrun_high_n_s64(const uint32x2_t& r, const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(0),n,64,true),64,32);
    _nres[3] = _nsat_clamp_u(tm,_nsh_shr_imm(tm,a.getLane(1),n,64,true),64,32);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vqrshrn_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(0),n,16,true),16,8);
    _nres[1] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(1),n,16,true),16,8);
    _nres[2] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(2),n,16,true),16,8);
    _nres[3] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(3),n,16,true),16,8);
    _nres[4] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(4),n,16,true),16,8);
    _nres[5] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(5),n,16,true),16,8);
    _nres[6] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(6),n,16,true),16,8);
    _nres[7] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(7),n,16,true),16,8);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vqrshrn_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(0),n,32,true),32,16);
    _nres[1] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(1),n,32,true),32,16);
    _nres[2] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(2),n,32,true),32,16);
    _nres[3] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(3),n,32,true),32,16);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vqrshrn_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(0),n,64,true),64,32);
    _nres[1] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(1),n,64,true),64,32);
    return int32x2_t(tm, _nres);
}
inline int8_t vqrshrnh_n_s16(int16_t a, const int n) { return {}; }
inline int16_t vqrshrns_n_s32(int32_t a, const int n) { return {}; }
inline int32_t vqrshrnd_n_s64(int64_t a, const int n) { return {}; }
inline int8x16_t vqrshrn_high_n_s16(const int8x8_t& r, const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(0),n,16,true),16,8);
    _nres[9] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(1),n,16,true),16,8);
    _nres[10] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(2),n,16,true),16,8);
    _nres[11] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(3),n,16,true),16,8);
    _nres[12] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(4),n,16,true),16,8);
    _nres[13] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(5),n,16,true),16,8);
    _nres[14] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(6),n,16,true),16,8);
    _nres[15] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(7),n,16,true),16,8);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vqrshrn_high_n_s32(const int16x4_t& r, const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(0),n,32,true),32,16);
    _nres[5] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(1),n,32,true),32,16);
    _nres[6] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(2),n,32,true),32,16);
    _nres[7] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(3),n,32,true),32,16);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vqrshrn_high_n_s64(const int32x2_t& r, const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(0),n,64,true),64,32);
    _nres[3] = _nsat_clamp_s(tm,_nsh_rshr_imm(tm,a.getLane(1),n,64,true),64,32);
    return int32x4_t(tm, _nres);
}
inline uint8x8_t vqrshrn_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,16,false),16,8);
    _nres[1] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,16,false),16,8);
    _nres[2] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(2),n,16,false),16,8);
    _nres[3] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(3),n,16,false),16,8);
    _nres[4] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(4),n,16,false),16,8);
    _nres[5] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(5),n,16,false),16,8);
    _nres[6] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(6),n,16,false),16,8);
    _nres[7] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(7),n,16,false),16,8);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vqrshrn_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,32,false),32,16);
    _nres[1] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,32,false),32,16);
    _nres[2] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(2),n,32,false),32,16);
    _nres[3] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(3),n,32,false),32,16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vqrshrn_n_u64(const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,64,false),64,32);
    _nres[1] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,64,false),64,32);
    return uint32x2_t(tm, _nres);
}
inline uint8_t vqrshrnh_n_u16(uint16_t a, const int n) { return {}; }
inline uint16_t vqrshrns_n_u32(uint32_t a, const int n) { return {}; }
inline uint32_t vqrshrnd_n_u64(uint64_t a, const int n) { return {}; }
inline uint8x16_t vqrshrn_high_n_u16(const uint8x8_t& r, const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,16,false),16,8);
    _nres[9] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,16,false),16,8);
    _nres[10] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(2),n,16,false),16,8);
    _nres[11] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(3),n,16,false),16,8);
    _nres[12] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(4),n,16,false),16,8);
    _nres[13] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(5),n,16,false),16,8);
    _nres[14] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(6),n,16,false),16,8);
    _nres[15] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(7),n,16,false),16,8);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vqrshrn_high_n_u32(const uint16x4_t& r, const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,32,false),32,16);
    _nres[5] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,32,false),32,16);
    _nres[6] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(2),n,32,false),32,16);
    _nres[7] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(3),n,32,false),32,16);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vqrshrn_high_n_u64(const uint32x2_t& r, const uint64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,64,false),64,32);
    _nres[3] = _nnar_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,64,false),64,32);
    return uint32x4_t(tm, _nres);
}
inline uint8x8_t vqrshrun_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,16,true),16,8);
    _nres[1] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,16,true),16,8);
    _nres[2] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(2),n,16,true),16,8);
    _nres[3] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(3),n,16,true),16,8);
    _nres[4] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(4),n,16,true),16,8);
    _nres[5] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(5),n,16,true),16,8);
    _nres[6] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(6),n,16,true),16,8);
    _nres[7] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(7),n,16,true),16,8);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vqrshrun_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,32,true),32,16);
    _nres[1] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,32,true),32,16);
    _nres[2] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(2),n,32,true),32,16);
    _nres[3] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(3),n,32,true),32,16);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vqrshrun_n_s64(const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,64,true),64,32);
    _nres[1] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,64,true),64,32);
    return uint32x2_t(tm, _nres);
}
inline uint8_t vqrshrunh_n_s16(int16_t a, const int n) { return {}; }
inline uint16_t vqrshruns_n_s32(int32_t a, const int n) { return {}; }
inline uint32_t vqrshrund_n_s64(int64_t a, const int n) { return {}; }
inline uint8x16_t vqrshrun_high_n_s16(const uint8x8_t& r, const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,16,true),16,8);
    _nres[9] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,16,true),16,8);
    _nres[10] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(2),n,16,true),16,8);
    _nres[11] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(3),n,16,true),16,8);
    _nres[12] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(4),n,16,true),16,8);
    _nres[13] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(5),n,16,true),16,8);
    _nres[14] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(6),n,16,true),16,8);
    _nres[15] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(7),n,16,true),16,8);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vqrshrun_high_n_s32(const uint16x4_t& r, const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,32,true),32,16);
    _nres[5] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,32,true),32,16);
    _nres[6] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(2),n,32,true),32,16);
    _nres[7] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(3),n,32,true),32,16);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vqrshrun_high_n_s64(const uint32x2_t& r, const int64x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(0),n,64,true),64,32);
    _nres[3] = _nsat_clamp_u(tm,_nsh_rshr_imm(tm,a.getLane(1),n,64,true),64,32);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vaddhn_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, false, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, false, false);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, false, false);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, false, false);
    _nres[4] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, false, false);
    _nres[5] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, false, false);
    _nres[6] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, false, false);
    _nres[7] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, false, false);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vaddhn_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, false, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, false, false);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, false, false);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, false, false);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vaddhn_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, false, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, false, false);
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vaddhn_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, false, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, false, false);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, false, false);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, false, false);
    _nres[4] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, false, false);
    _nres[5] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, false, false);
    _nres[6] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, false, false);
    _nres[7] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, false, false);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vaddhn_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, false, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, false, false);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, false, false);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, false, false);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vaddhn_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, false, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, false, false);
    return uint32x2_t(tm, _nres);
}
inline int8x16_t vaddhn_high_s16(const int8x8_t& r, const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, false, false);
    _nres[9] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, false, false);
    _nres[10] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, false, false);
    _nres[11] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, false, false);
    _nres[12] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, false, false);
    _nres[13] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, false, false);
    _nres[14] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, false, false);
    _nres[15] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, false, false);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vaddhn_high_s32(const int16x4_t& r, const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, false, false);
    _nres[5] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, false, false);
    _nres[6] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, false, false);
    _nres[7] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, false, false);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vaddhn_high_s64(const int32x2_t& r, const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, false, false);
    _nres[3] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, false, false);
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vaddhn_high_u16(const uint8x8_t& r, const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, false, false);
    _nres[9] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, false, false);
    _nres[10] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, false, false);
    _nres[11] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, false, false);
    _nres[12] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, false, false);
    _nres[13] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, false, false);
    _nres[14] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, false, false);
    _nres[15] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, false, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vaddhn_high_u32(const uint16x4_t& r, const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, false, false);
    _nres[5] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, false, false);
    _nres[6] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, false, false);
    _nres[7] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, false, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vaddhn_high_u64(const uint32x2_t& r, const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, false, false);
    _nres[3] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, false, false);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vsubhn_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, true, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, true, false);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, true, false);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, true, false);
    _nres[4] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, true, false);
    _nres[5] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, true, false);
    _nres[6] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, true, false);
    _nres[7] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, true, false);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vsubhn_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, true, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, true, false);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, true, false);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, true, false);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vsubhn_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, true, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, true, false);
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vsubhn_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, true, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, true, false);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, true, false);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, true, false);
    _nres[4] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, true, false);
    _nres[5] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, true, false);
    _nres[6] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, true, false);
    _nres[7] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, true, false);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vsubhn_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, true, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, true, false);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, true, false);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, true, false);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vsubhn_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, true, false);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, true, false);
    return uint32x2_t(tm, _nres);
}
inline int8x16_t vsubhn_high_s16(const int8x8_t& r, const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, true, false);
    _nres[9] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, true, false);
    _nres[10] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, true, false);
    _nres[11] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, true, false);
    _nres[12] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, true, false);
    _nres[13] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, true, false);
    _nres[14] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, true, false);
    _nres[15] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, true, false);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vsubhn_high_s32(const int16x4_t& r, const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, true, false);
    _nres[5] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, true, false);
    _nres[6] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, true, false);
    _nres[7] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, true, false);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vsubhn_high_s64(const int32x2_t& r, const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, true, false);
    _nres[3] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, true, false);
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vsubhn_high_u16(const uint8x8_t& r, const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, true, false);
    _nres[9] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, true, false);
    _nres[10] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, true, false);
    _nres[11] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, true, false);
    _nres[12] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, true, false);
    _nres[13] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, true, false);
    _nres[14] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, true, false);
    _nres[15] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, true, false);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vsubhn_high_u32(const uint16x4_t& r, const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, true, false);
    _nres[5] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, true, false);
    _nres[6] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, true, false);
    _nres[7] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, true, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vsubhn_high_u64(const uint32x2_t& r, const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, true, false);
    _nres[3] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, true, false);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vraddhn_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, false, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, false, true);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, false, true);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, false, true);
    _nres[4] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, false, true);
    _nres[5] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, false, true);
    _nres[6] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, false, true);
    _nres[7] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, false, true);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vraddhn_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, false, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, false, true);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, false, true);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, false, true);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vraddhn_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, false, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, false, true);
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vraddhn_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, false, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, false, true);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, false, true);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, false, true);
    _nres[4] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, false, true);
    _nres[5] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, false, true);
    _nres[6] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, false, true);
    _nres[7] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, false, true);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vraddhn_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, false, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, false, true);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, false, true);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, false, true);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vraddhn_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, false, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, false, true);
    return uint32x2_t(tm, _nres);
}
inline int8x16_t vraddhn_high_s16(const int8x8_t& r, const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, false, true);
    _nres[9] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, false, true);
    _nres[10] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, false, true);
    _nres[11] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, false, true);
    _nres[12] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, false, true);
    _nres[13] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, false, true);
    _nres[14] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, false, true);
    _nres[15] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, false, true);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vraddhn_high_s32(const int16x4_t& r, const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, false, true);
    _nres[5] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, false, true);
    _nres[6] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, false, true);
    _nres[7] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, false, true);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vraddhn_high_s64(const int32x2_t& r, const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, false, true);
    _nres[3] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, false, true);
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vraddhn_high_u16(const uint8x8_t& r, const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, false, true);
    _nres[9] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, false, true);
    _nres[10] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, false, true);
    _nres[11] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, false, true);
    _nres[12] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, false, true);
    _nres[13] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, false, true);
    _nres[14] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, false, true);
    _nres[15] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, false, true);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vraddhn_high_u32(const uint16x4_t& r, const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, false, true);
    _nres[5] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, false, true);
    _nres[6] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, false, true);
    _nres[7] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, false, true);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vraddhn_high_u64(const uint32x2_t& r, const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, false, true);
    _nres[3] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, false, true);
    return uint32x4_t(tm, _nres);
}
inline int8x8_t vrsubhn_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, true, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, true, true);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, true, true);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, true, true);
    _nres[4] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, true, true);
    _nres[5] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, true, true);
    _nres[6] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, true, true);
    _nres[7] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, true, true);
    return int8x8_t(tm, _nres);
}
inline int16x4_t vrsubhn_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, true, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, true, true);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, true, true);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, true, true);
    return int16x4_t(tm, _nres);
}
inline int32x2_t vrsubhn_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, true, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, true, true);
    return int32x2_t(tm, _nres);
}
inline uint8x8_t vrsubhn_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, true, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, true, true);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, true, true);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, true, true);
    _nres[4] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, true, true);
    _nres[5] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, true, true);
    _nres[6] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, true, true);
    _nres[7] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, true, true);
    return uint8x8_t(tm, _nres);
}
inline uint16x4_t vrsubhn_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, true, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, true, true);
    _nres[2] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, true, true);
    _nres[3] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, true, true);
    return uint16x4_t(tm, _nres);
}
inline uint32x2_t vrsubhn_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, true, true);
    _nres[1] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, true, true);
    return uint32x2_t(tm, _nres);
}
inline int8x16_t vrsubhn_high_s16(const int8x8_t& r, const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, true, true);
    _nres[9] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, true, true);
    _nres[10] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, true, true);
    _nres[11] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, true, true);
    _nres[12] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, true, true);
    _nres[13] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, true, true);
    _nres[14] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, true, true);
    _nres[15] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, true, true);
    return int8x16_t(tm, _nres);
}
inline int16x8_t vrsubhn_high_s32(const int16x4_t& r, const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, true, true);
    _nres[5] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, true, true);
    _nres[6] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, true, true);
    _nres[7] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, true, true);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vrsubhn_high_s64(const int32x2_t& r, const int64x2_t& a, const int64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, true, true);
    _nres[3] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, true, true);
    return int32x4_t(tm, _nres);
}
inline uint8x16_t vrsubhn_high_u16(const uint8x8_t& r, const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = r.getLane(4);
    _nres[5] = r.getLane(5);
    _nres[6] = r.getLane(6);
    _nres[7] = r.getLane(7);
    _nres[8] = _naddhn(tm, a.getLane(0), b.getLane(0), 16, 8, true, true);
    _nres[9] = _naddhn(tm, a.getLane(1), b.getLane(1), 16, 8, true, true);
    _nres[10] = _naddhn(tm, a.getLane(2), b.getLane(2), 16, 8, true, true);
    _nres[11] = _naddhn(tm, a.getLane(3), b.getLane(3), 16, 8, true, true);
    _nres[12] = _naddhn(tm, a.getLane(4), b.getLane(4), 16, 8, true, true);
    _nres[13] = _naddhn(tm, a.getLane(5), b.getLane(5), 16, 8, true, true);
    _nres[14] = _naddhn(tm, a.getLane(6), b.getLane(6), 16, 8, true, true);
    _nres[15] = _naddhn(tm, a.getLane(7), b.getLane(7), 16, 8, true, true);
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vrsubhn_high_u32(const uint16x4_t& r, const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = r.getLane(2);
    _nres[3] = r.getLane(3);
    _nres[4] = _naddhn(tm, a.getLane(0), b.getLane(0), 32, 16, true, true);
    _nres[5] = _naddhn(tm, a.getLane(1), b.getLane(1), 32, 16, true, true);
    _nres[6] = _naddhn(tm, a.getLane(2), b.getLane(2), 32, 16, true, true);
    _nres[7] = _naddhn(tm, a.getLane(3), b.getLane(3), 32, 16, true, true);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vrsubhn_high_u64(const uint32x2_t& r, const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = r.getLane(0);
    _nres[1] = r.getLane(1);
    _nres[2] = _naddhn(tm, a.getLane(0), b.getLane(0), 64, 32, true, true);
    _nres[3] = _naddhn(tm, a.getLane(1), b.getLane(1), 64, 32, true, true);
    return uint32x4_t(tm, _nres);
}

} // namespace salt_cvc5
