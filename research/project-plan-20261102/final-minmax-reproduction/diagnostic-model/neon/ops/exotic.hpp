#pragma once
// NEON dot/mmla/fp-cvt-width/poly/fp16-widen/bf16/complex/crypto-bitops/famax (fp8 best-effort)
#include "arith_help.hpp"
namespace salt_cvc5 {

inline int32x2_t vdot_s32(const int32x2_t& r, const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(5),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(6),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(7),8,32,true)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vdotq_s32(const int32x4_t& r, const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(5),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(6),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(7),8,32,true)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,true), _next(tm,b.getLane(8),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,true), _next(tm,b.getLane(9),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,true), _next(tm,b.getLane(10),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,true), _next(tm,b.getLane(11),8,32,true)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,true), _next(tm,b.getLane(12),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,true), _next(tm,b.getLane(13),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,true), _next(tm,b.getLane(14),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,true), _next(tm,b.getLane(15),8,32,true)));
    return int32x4_t(tm, _nres);
}
inline int32x2_t vdot_lane_s32(const int32x2_t& r, const int8x8_t& a, const int8x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vdotq_laneq_s32(const int32x4_t& r, const int8x16_t& a, const int8x16_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    return int32x4_t(tm, _nres);
}
inline int32x2_t vdot_laneq_s32(const int32x2_t& r, const int8x8_t& a, const int8x16_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vdotq_lane_s32(const int32x4_t& r, const int8x16_t& a, const int8x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,true)));
    return int32x4_t(tm, _nres);
}
inline uint32x2_t vdot_u32(const uint32x2_t& r, const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(5),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(6),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(7),8,32,false)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vdotq_u32(const uint32x4_t& r, const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(5),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(6),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(7),8,32,false)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(8),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(9),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(10),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(11),8,32,false)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(12),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(13),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(14),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(15),8,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint32x2_t vdot_lane_u32(const uint32x2_t& r, const uint8x8_t& a, const uint8x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vdotq_laneq_u32(const uint32x4_t& r, const uint8x16_t& a, const uint8x16_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint32x2_t vdot_laneq_u32(const uint32x2_t& r, const uint8x8_t& a, const uint8x16_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vdotq_lane_u32(const uint32x4_t& r, const uint8x16_t& a, const uint8x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,false)));
    return uint32x4_t(tm, _nres);
}
inline int32x2_t vusdot_s32(const int32x2_t& r, const uint8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(5),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(6),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(7),8,32,true)));
    return int32x2_t(tm, _nres);
}
inline int32x2_t vusdot_lane_s32(const int32x2_t& r, const uint8x8_t& a, const int8x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    return int32x2_t(tm, _nres);
}
inline int32x2_t vusdot_laneq_s32(const int32x2_t& r, const uint8x8_t& a, const int8x16_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vusdotq_s32(const int32x4_t& r, const uint8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(5),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(6),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(7),8,32,true)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(8),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(9),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(10),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(11),8,32,true)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(12),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(13),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(14),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(15),8,32,true)));
    return int32x4_t(tm, _nres);
}
inline int32x4_t vusdotq_lane_s32(const int32x4_t& r, const uint8x16_t& a, const int8x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    return int32x4_t(tm, _nres);
}
inline int32x4_t vusdotq_laneq_s32(const int32x4_t& r, const uint8x16_t& a, const int8x16_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(4*lane+0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(4*lane+1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(4*lane+2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(4*lane+3),8,32,true)));
    return int32x4_t(tm, _nres);
}
inline int32x2_t vsudot_lane_s32(const int32x2_t& r, const int8x8_t& a, const uint8x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    return int32x2_t(tm, _nres);
}
inline int32x2_t vsudot_laneq_s32(const int32x2_t& r, const int8x8_t& a, const uint8x16_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vsudotq_lane_s32(const int32x4_t& r, const int8x16_t& a, const uint8x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    return int32x4_t(tm, _nres);
}
inline int32x4_t vsudotq_laneq_s32(const int32x4_t& r, const int8x16_t& a, const uint8x16_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,true), _next(tm,b.getLane(4*lane+0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,true), _next(tm,b.getLane(4*lane+1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,true), _next(tm,b.getLane(4*lane+2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,true), _next(tm,b.getLane(4*lane+3),8,32,false)));
    return int32x4_t(tm, _nres);
}
inline int32x4_t vmmlaq_s32(const int32x4_t& r, const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(3),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(4),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(5),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(6),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(7),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,true), _next(tm,b.getLane(8),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,true), _next(tm,b.getLane(9),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,true), _next(tm,b.getLane(10),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,true), _next(tm,b.getLane(11),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,true), _next(tm,b.getLane(12),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,true), _next(tm,b.getLane(13),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,true), _next(tm,b.getLane(14),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,true), _next(tm,b.getLane(15),8,32,true)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,true), _next(tm,b.getLane(0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,true), _next(tm,b.getLane(1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,true), _next(tm,b.getLane(2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,true), _next(tm,b.getLane(3),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,true), _next(tm,b.getLane(4),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,true), _next(tm,b.getLane(5),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,true), _next(tm,b.getLane(6),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,true), _next(tm,b.getLane(7),8,32,true)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,true), _next(tm,b.getLane(8),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,true), _next(tm,b.getLane(9),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,true), _next(tm,b.getLane(10),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,true), _next(tm,b.getLane(11),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,true), _next(tm,b.getLane(12),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,true), _next(tm,b.getLane(13),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,true), _next(tm,b.getLane(14),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,true), _next(tm,b.getLane(15),8,32,true)));
    return int32x4_t(tm, _nres);
}
inline uint32x4_t vmmlaq_u32(const uint32x4_t& r, const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(3),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(5),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(6),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(7),8,32,false)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(8),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(9),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(10),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(11),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(12),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(13),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(14),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(15),8,32,false)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(0),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(1),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(2),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(3),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(4),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(5),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(6),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(7),8,32,false)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(8),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(9),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(10),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(11),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(12),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(13),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(14),8,32,false))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(15),8,32,false)));
    return uint32x4_t(tm, _nres);
}
inline int32x4_t vusmmlaq_s32(const int32x4_t& r, const uint8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(0), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(3),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(4),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(5),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(6),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(7),8,32,true)));
    _nres[1] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(1), fold_bvmul(tm, _next(tm,a.getLane(0),8,32,false), _next(tm,b.getLane(8),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(1),8,32,false), _next(tm,b.getLane(9),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(2),8,32,false), _next(tm,b.getLane(10),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(3),8,32,false), _next(tm,b.getLane(11),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(4),8,32,false), _next(tm,b.getLane(12),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(5),8,32,false), _next(tm,b.getLane(13),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(6),8,32,false), _next(tm,b.getLane(14),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(7),8,32,false), _next(tm,b.getLane(15),8,32,true)));
    _nres[2] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(2), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(0),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(1),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(2),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(3),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(4),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(5),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(6),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(7),8,32,true)));
    _nres[3] = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, r.getLane(3), fold_bvmul(tm, _next(tm,a.getLane(8),8,32,false), _next(tm,b.getLane(8),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(9),8,32,false), _next(tm,b.getLane(9),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(10),8,32,false), _next(tm,b.getLane(10),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(11),8,32,false), _next(tm,b.getLane(11),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(12),8,32,false), _next(tm,b.getLane(12),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(13),8,32,false), _next(tm,b.getLane(13),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(14),8,32,false), _next(tm,b.getLane(14),8,32,true))), fold_bvmul(tm, _next(tm,a.getLane(15),8,32,false), _next(tm,b.getLane(15),8,32,true)));
    return int32x4_t(tm, _nres);
}
inline float16x8_t vmmlaq_f16_mf8_fpm(const float16x8_t& r, const mfloat8x16_t& a, const mfloat8x16_t& b, fpm_t fpm) { return r; }
inline float32x4_t vmmlaq_f32_mf8_fpm(const float32x4_t& r, const mfloat8x16_t& a, const mfloat8x16_t& b, fpm_t fpm) { return r; }
inline float16x4_t vcvt_f16_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,0), 16), 16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcvt_f32_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,0), 32), 32);
    return float32x2_t(tm, _nres);
}
inline mfloat8x8_t vcvt_mf8_f32_fpm(const float32x4_t& vn, const float32x4_t& vm, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x8_t vcvt_mf8_f16_fpm(const float16x4_t& vn, const float16x4_t& vm, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return mfloat8x8_t(tm, _nres);
}
inline mfloat8x16_t vcvtq_mf8_f16_fpm(const float16x8_t& vn, const float16x8_t& vm, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return mfloat8x16_t(tm, _nres);
}
inline float16x8_t vcvt_high_f16_f32(const float16x4_t& r, const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcvt_high_f32_f64(const float32x2_t& r, const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres; _nres.fill(mk_bv_val(tm,32,0));
    return float32x4_t(tm, _nres);
}
inline mfloat8x16_t vcvt_high_mf8_f32_fpm(const mfloat8x8_t& vd, const float32x4_t& vn, const float32x4_t& vm, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return mfloat8x16_t(tm, _nres);
}
inline float32x4_t vcvt_f32_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(i),16), rm_of(tm,0), 32), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcvt_f64_f32(const float32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(i),32), rm_of(tm,0), 64), 64);
    return float64x2_t(tm, _nres);
}
inline float32x4_t vcvt_high_f32_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres; _nres.fill(mk_bv_val(tm,32,0));
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcvt_high_f64_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres; _nres.fill(mk_bv_val(tm,64,0));
    return float64x2_t(tm, _nres);
}
inline float32x2_t vcvtx_f32_f64(const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(i),64), rm_of(tm,0), 32), 32);
    return float32x2_t(tm, _nres);
}
inline float32_t vcvtxd_f32_f64(float64_t a) { return {}; }
inline float32x4_t vcvtx_high_f32_f64(const float32x2_t& r, const float64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres; _nres.fill(mk_bv_val(tm,32,0));
    return float32x4_t(tm, _nres);
}
inline poly8x8_t vmul_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvextract(tm,7,0,_nclmul(tm,a.getLane(i),b.getLane(i),8,16));
    return poly8x8_t(tm, _nres);
}
inline poly8x16_t vmulq_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvextract(tm,7,0,_nclmul(tm,a.getLane(i),b.getLane(i),8,16));
    return poly8x16_t(tm, _nres);
}
inline poly16x8_t vmull_p8(const poly8x8_t& a, const poly8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nclmul(tm,a.getLane(i),b.getLane(i),8,16);
    return poly16x8_t(tm, _nres);
}
inline poly128_t vmull_p64(poly64_t a, poly64_t b) { return {}; }
inline poly16x8_t vmull_high_p8(const poly8x16_t& a, const poly8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nclmul(tm,a.getLane(i+8),b.getLane(i+8),8,16);
    return poly16x8_t(tm, _nres);
}
inline poly128_t vmull_high_p64(const poly64x2_t& a, const poly64x2_t& b) { return {}; }
inline float32x2_t vfmlal_low_f16(const float32x2_t& r, const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(0),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(1),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlalq_low_f16(const float32x4_t& r, const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(0),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(1),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(2),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(3),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlal_lane_low_f16(const float32x2_t& r, const float16x4_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x2_t vfmlal_laneq_low_f16(const float32x2_t& r, const float16x4_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlalq_lane_low_f16(const float32x4_t& r, const float16x8_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vfmlalq_laneq_low_f16(const float32x4_t& r, const float16x8_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlal_high_f16(const float32x2_t& r, const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(2),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(3),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlalq_high_f16(const float32x4_t& r, const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(4),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(4),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(5),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(5),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(6),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(6),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(7),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(7),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlal_lane_high_f16(const float32x2_t& r, const float16x4_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlalq_lane_high_f16(const float32x4_t& r, const float16x8_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(4),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(5),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(6),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(7),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlal_laneq_high_f16(const float32x2_t& r, const float16x4_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlalq_laneq_high_f16(const float32x4_t& r, const float16x8_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(4),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(5),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(6),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(7),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlsl_low_f16(const float32x2_t& r, const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(0),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(1),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlslq_low_f16(const float32x4_t& r, const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(0),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(1),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(2),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(3),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlsl_lane_low_f16(const float32x2_t& r, const float16x4_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x2_t vfmlsl_laneq_low_f16(const float32x2_t& r, const float16x4_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlslq_lane_low_f16(const float32x4_t& r, const float16x8_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vfmlslq_laneq_low_f16(const float32x4_t& r, const float16x8_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(0),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(1),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlsl_high_f16(const float32x2_t& r, const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(2),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(3),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlslq_high_f16(const float32x4_t& r, const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(4),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(4),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(5),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(5),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(6),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(6),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(7),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(7),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlsl_lane_high_f16(const float32x2_t& r, const float16x4_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlslq_lane_high_f16(const float32x4_t& r, const float16x8_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(4),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(5),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(6),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(7),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vfmlsl_laneq_high_f16(const float32x2_t& r, const float16x4_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(2),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(3),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vfmlslq_laneq_high_f16(const float32x4_t& r, const float16x8_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(4),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[1] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(5),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[2] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(6),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    _nres[3] = fp_to_lane(tm, nfp_sub(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,fp_cvt_fp(tm, lane_to_fp(tm,a.getLane(7),16), rm_of(tm,0), 32),fp_cvt_fp(tm, lane_to_fp(tm,b.getLane(lane),16), rm_of(tm,0), 32))), 32);
    return float32x4_t(tm, _nres);
}
inline float16x8_t vmlalbq_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, fpm_t fpm) { return vd; }
inline float16x8_t vmlalbq_lane_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float16x8_t vmlalbq_laneq_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float16x8_t vmlaltq_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, fpm_t fpm) { return vd; }
inline float16x8_t vmlaltq_lane_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float16x8_t vmlaltq_laneq_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x2_t vbfdot_f32(const float32x2_t& r, const bfloat16x4_t& a, const bfloat16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(0)),bf16_to_fp(tm,b.getLane(0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(1)),bf16_to_fp(tm,b.getLane(1)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(2)),bf16_to_fp(tm,b.getLane(2)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(3)),bf16_to_fp(tm,b.getLane(3)))),32);
    return float32x2_t(tm, _nres);
}
inline float32x2_t vbfdot_lane_f32(const float32x2_t& r, const bfloat16x4_t& a, const bfloat16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(0)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(1)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(2)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(3)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vbfdotq_laneq_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(0)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(1)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(2)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(3)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(4)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(5)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(6)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(7)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    return float32x4_t(tm, _nres);
}
inline float32x2_t vbfdot_laneq_f32(const float32x2_t& r, const bfloat16x4_t& a, const bfloat16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(0)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(1)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(2)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(3)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vbfdotq_lane_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(0)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(1)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(2)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(3)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(4)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(5)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(6)),bf16_to_fp(tm,b.getLane(2*lane+0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(7)),bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vbfmlalbq_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(0),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(0)), bf16_to_fp(tm,b.getLane(0)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(1),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(2)), bf16_to_fp(tm,b.getLane(2)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(2),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(4)), bf16_to_fp(tm,b.getLane(4)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(3),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(6)), bf16_to_fp(tm,b.getLane(6)))),32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vbfmlalbq_lane_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(0),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(0)), bf16_to_fp(tm,b.getLane(2*lane+0)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(1),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(2)), bf16_to_fp(tm,b.getLane(2*lane+0)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(2),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(4)), bf16_to_fp(tm,b.getLane(2*lane+0)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(3),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(6)), bf16_to_fp(tm,b.getLane(2*lane+0)))),32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vbfmlalbq_laneq_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(0),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(0)), bf16_to_fp(tm,b.getLane(2*lane+0)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(1),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(2)), bf16_to_fp(tm,b.getLane(2*lane+0)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(2),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(4)), bf16_to_fp(tm,b.getLane(2*lane+0)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(3),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(6)), bf16_to_fp(tm,b.getLane(2*lane+0)))),32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vbfmlaltq_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(0),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(1)), bf16_to_fp(tm,b.getLane(1)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(1),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(3)), bf16_to_fp(tm,b.getLane(3)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(2),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(5)), bf16_to_fp(tm,b.getLane(5)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(3),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(7)), bf16_to_fp(tm,b.getLane(7)))),32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vbfmlaltq_lane_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(0),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(1)), bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(1),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(3)), bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(2),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(5)), bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(3),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(7)), bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vbfmlaltq_laneq_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(0),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(1)), bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(1),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(3)), bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(2),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(5)), bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm, lane_to_fp(tm,r.getLane(3),32), nfp_mul(tm, bf16_to_fp(tm,a.getLane(7)), bf16_to_fp(tm,b.getLane(2*lane+1)))),32);
    return float32x4_t(tm, _nres);
}
inline float32x4_t vbfmmlaq_f32(const float32x4_t& r, const bfloat16x8_t& a, const bfloat16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(0),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(0)),bf16_to_fp(tm,b.getLane(0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(1)),bf16_to_fp(tm,b.getLane(1)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(2)),bf16_to_fp(tm,b.getLane(2)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(3)),bf16_to_fp(tm,b.getLane(3)))),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(1),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(0)),bf16_to_fp(tm,b.getLane(4)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(1)),bf16_to_fp(tm,b.getLane(5)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(2)),bf16_to_fp(tm,b.getLane(6)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(3)),bf16_to_fp(tm,b.getLane(7)))),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(2),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(4)),bf16_to_fp(tm,b.getLane(0)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(5)),bf16_to_fp(tm,b.getLane(1)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(6)),bf16_to_fp(tm,b.getLane(2)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(7)),bf16_to_fp(tm,b.getLane(3)))),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm,nfp_add(tm,nfp_add(tm,nfp_add(tm,lane_to_fp(tm,r.getLane(3),32),nfp_mul(tm,bf16_to_fp(tm,a.getLane(4)),bf16_to_fp(tm,b.getLane(4)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(5)),bf16_to_fp(tm,b.getLane(5)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(6)),bf16_to_fp(tm,b.getLane(6)))),nfp_mul(tm,bf16_to_fp(tm,a.getLane(7)),bf16_to_fp(tm,b.getLane(7)))),32);
    return float32x4_t(tm, _nres);
}
inline bfloat16x8_t vcvtq_low_bf16_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp32_to_bf16(tm,a.getLane(0));
    _nres[1] = fp32_to_bf16(tm,a.getLane(1));
    _nres[2] = fp32_to_bf16(tm,a.getLane(2));
    _nres[3] = fp32_to_bf16(tm,a.getLane(3));
    _nres[4] = mk_bv_val(tm,16,0);
    _nres[5] = mk_bv_val(tm,16,0);
    _nres[6] = mk_bv_val(tm,16,0);
    _nres[7] = mk_bv_val(tm,16,0);
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16_t vcvth_bf16_f32(float32_t a) { return {}; }
inline float16x4_t vcmla_f16(const float16x4_t& r, const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(0),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(3),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcmla_f32(const float32x2_t& r, const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(0),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x4_t vcmla_lane_f16(const float16x4_t& r, const float16x4_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcmla_lane_f32(const float32x2_t& r, const float32x2_t& a, const float32x2_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x4_t vcmla_laneq_f16(const float16x4_t& r, const float16x4_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vcmlaq_f16(const float16x8_t& r, const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(0),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(3),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(4),16),lane_to_fp(tm,b.getLane(4),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(4),16),lane_to_fp(tm,b.getLane(5),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(6),16),lane_to_fp(tm,b.getLane(6),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(6),16),lane_to_fp(tm,b.getLane(7),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_f32(const float32x4_t& r, const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(0),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),32),lane_to_fp(tm,b.getLane(2),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),32),lane_to_fp(tm,b.getLane(3),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcmlaq_f64(const float64x2_t& r, const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),64),lane_to_fp(tm,b.getLane(0),64),lane_to_fp(tm,r.getLane(0),64)),64);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),64),lane_to_fp(tm,b.getLane(1),64),lane_to_fp(tm,r.getLane(1),64)),64);
    return float64x2_t(tm, _nres);
}
inline float16x8_t vcmlaq_lane_f16(const float16x8_t& r, const float16x8_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(4),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(4),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(6),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(6),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_lane_f32(const float32x4_t& r, const float32x4_t& a, const float32x2_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float16x8_t vcmlaq_laneq_f16(const float16x8_t& r, const float16x8_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(4),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(4),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(6),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(6),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_laneq_f32(const float32x4_t& r, const float32x4_t& a, const float32x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(2),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float16x4_t vcmla_rot90_f16(const float16x4_t& r, const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(0),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(3),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcmla_rot90_f32(const float32x2_t& r, const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(0),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x4_t vcmla_rot90_lane_f16(const float16x4_t& r, const float16x4_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcmla_rot90_lane_f32(const float32x2_t& r, const float32x2_t& a, const float32x2_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x4_t vcmla_rot90_laneq_f16(const float16x4_t& r, const float16x4_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot90_f16(const float16x8_t& r, const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(0),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(3),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(5),16)),lane_to_fp(tm,b.getLane(5),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(5),16),lane_to_fp(tm,b.getLane(4),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(7),16)),lane_to_fp(tm,b.getLane(7),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(7),16),lane_to_fp(tm,b.getLane(6),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot90_f32(const float32x4_t& r, const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(0),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),32)),lane_to_fp(tm,b.getLane(3),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),32),lane_to_fp(tm,b.getLane(2),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcmlaq_rot90_f64(const float64x2_t& r, const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),64)),lane_to_fp(tm,b.getLane(1),64),lane_to_fp(tm,r.getLane(0),64)),64);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),64),lane_to_fp(tm,b.getLane(0),64),lane_to_fp(tm,r.getLane(1),64)),64);
    return float64x2_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot90_lane_f16(const float16x8_t& r, const float16x8_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(5),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(5),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(7),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(7),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot90_lane_f32(const float32x4_t& r, const float32x4_t& a, const float32x2_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot90_laneq_f16(const float16x8_t& r, const float16x8_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(5),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(5),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(7),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(7),16),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot90_laneq_f32(const float32x4_t& r, const float32x4_t& a, const float32x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float16x4_t vcmla_rot180_f16(const float16x4_t& r, const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(0),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(3),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcmla_rot180_f32(const float32x2_t& r, const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(0),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x4_t vcmla_rot180_lane_f16(const float16x4_t& r, const float16x4_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcmla_rot180_lane_f32(const float32x2_t& r, const float32x2_t& a, const float32x2_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x4_t vcmla_rot180_laneq_f16(const float16x4_t& r, const float16x4_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot180_f16(const float16x8_t& r, const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(0),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(3),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(4),16)),lane_to_fp(tm,b.getLane(4),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(4),16)),lane_to_fp(tm,b.getLane(5),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(6),16)),lane_to_fp(tm,b.getLane(6),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(6),16)),lane_to_fp(tm,b.getLane(7),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot180_f32(const float32x4_t& r, const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(0),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),32)),lane_to_fp(tm,b.getLane(2),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),32)),lane_to_fp(tm,b.getLane(3),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcmlaq_rot180_f64(const float64x2_t& r, const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),64)),lane_to_fp(tm,b.getLane(0),64),lane_to_fp(tm,r.getLane(0),64)),64);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),64)),lane_to_fp(tm,b.getLane(1),64),lane_to_fp(tm,r.getLane(1),64)),64);
    return float64x2_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot180_lane_f16(const float16x8_t& r, const float16x8_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(4),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(4),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(6),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(6),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot180_lane_f32(const float32x4_t& r, const float32x4_t& a, const float32x2_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot180_laneq_f16(const float16x8_t& r, const float16x8_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(4),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(4),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(6),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(6),16)),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot180_laneq_f32(const float32x4_t& r, const float32x4_t& a, const float32x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(2),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float16x4_t vcmla_rot270_f16(const float16x4_t& r, const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(0),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(3),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcmla_rot270_f32(const float32x2_t& r, const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(0),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x4_t vcmla_rot270_lane_f16(const float16x4_t& r, const float16x4_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcmla_rot270_lane_f32(const float32x2_t& r, const float32x2_t& a, const float32x2_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x4_t vcmla_rot270_laneq_f16(const float16x4_t& r, const float16x4_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(3),16)),16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot270_f16(const float16x8_t& r, const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(0),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(3),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(5),16),lane_to_fp(tm,b.getLane(5),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(5),16)),lane_to_fp(tm,b.getLane(4),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(7),16),lane_to_fp(tm,b.getLane(7),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(7),16)),lane_to_fp(tm,b.getLane(6),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot270_f32(const float32x4_t& r, const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(0),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),32),lane_to_fp(tm,b.getLane(3),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),32)),lane_to_fp(tm,b.getLane(2),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcmlaq_rot270_f64(const float64x2_t& r, const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),64),lane_to_fp(tm,b.getLane(1),64),lane_to_fp(tm,r.getLane(0),64)),64);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),64)),lane_to_fp(tm,b.getLane(0),64),lane_to_fp(tm,r.getLane(1),64)),64);
    return float64x2_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot270_lane_f16(const float16x8_t& r, const float16x8_t& a, const float16x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(5),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(5),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(7),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(7),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot270_lane_f32(const float32x4_t& r, const float32x4_t& a, const float32x2_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float16x8_t vcmlaq_rot270_laneq_f16(const float16x8_t& r, const float16x8_t& a, const float16x8_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(0),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(1),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(2),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(3),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(5),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(4),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(5),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(5),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(7),16),lane_to_fp(tm,b.getLane(2*lane+1),16),lane_to_fp(tm,r.getLane(6),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(7),16)),lane_to_fp(tm,b.getLane(2*lane),16),lane_to_fp(tm,r.getLane(7),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcmlaq_rot270_laneq_f32(const float32x4_t& r, const float32x4_t& a, const float32x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(1),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(3),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(2),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(3),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(3),32)),32);
    return float32x4_t(tm, _nres);
}
inline float16x4_t vcadd_rot90_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(1),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(0),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(3),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcadd_rot90_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(1),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(0),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x8_t vcaddq_rot90_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(1),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(0),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(3),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(4),16),lane_to_fp(tm,b.getLane(5),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(5),16),lane_to_fp(tm,b.getLane(4),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(6),16),lane_to_fp(tm,b.getLane(7),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(7),16),lane_to_fp(tm,b.getLane(6),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcaddq_rot90_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(1),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(0),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(2),32),lane_to_fp(tm,b.getLane(3),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(3),32),lane_to_fp(tm,b.getLane(2),32)),32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcaddq_rot90_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(0),64),lane_to_fp(tm,b.getLane(1),64)),64);
    _nres[1] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(1),64),lane_to_fp(tm,b.getLane(0),64)),64);
    return float64x2_t(tm, _nres);
}
inline float16x4_t vcadd_rot270_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(1),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(0),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(3),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2),16)),16);
    return float16x4_t(tm, _nres);
}
inline float32x2_t vcadd_rot270_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(1),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(0),32)),32);
    return float32x2_t(tm, _nres);
}
inline float16x8_t vcaddq_rot270_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(0),16),lane_to_fp(tm,b.getLane(1),16)),16);
    _nres[1] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(1),16),lane_to_fp(tm,b.getLane(0),16)),16);
    _nres[2] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(2),16),lane_to_fp(tm,b.getLane(3),16)),16);
    _nres[3] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(3),16),lane_to_fp(tm,b.getLane(2),16)),16);
    _nres[4] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(4),16),lane_to_fp(tm,b.getLane(5),16)),16);
    _nres[5] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(5),16),lane_to_fp(tm,b.getLane(4),16)),16);
    _nres[6] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(6),16),lane_to_fp(tm,b.getLane(7),16)),16);
    _nres[7] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(7),16),lane_to_fp(tm,b.getLane(6),16)),16);
    return float16x8_t(tm, _nres);
}
inline float32x4_t vcaddq_rot270_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(1),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(0),32)),32);
    _nres[2] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(2),32),lane_to_fp(tm,b.getLane(3),32)),32);
    _nres[3] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(3),32),lane_to_fp(tm,b.getLane(2),32)),32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vcaddq_rot270_f64(const float64x2_t& a, const float64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_add(tm,lane_to_fp(tm,a.getLane(0),64),lane_to_fp(tm,b.getLane(1),64)),64);
    _nres[1] = fp_to_lane(tm,nfp_sub(tm,lane_to_fp(tm,a.getLane(1),64),lane_to_fp(tm,b.getLane(0),64)),64);
    return float64x2_t(tm, _nres);
}
inline uint8x16_t veor3q_u8(const uint8x16_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvxor(tm, fold_bvxor(tm,a.getLane(i),b.getLane(i)), c.getLane(i));
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t veor3q_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, fold_bvxor(tm,a.getLane(i),b.getLane(i)), c.getLane(i));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t veor3q_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, fold_bvxor(tm,a.getLane(i),b.getLane(i)), c.getLane(i));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t veor3q_u64(const uint64x2_t& a, const uint64x2_t& b, const uint64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, fold_bvxor(tm,a.getLane(i),b.getLane(i)), c.getLane(i));
    return uint64x2_t(tm, _nres);
}
inline int8x16_t veor3q_s8(const int8x16_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvxor(tm, fold_bvxor(tm,a.getLane(i),b.getLane(i)), c.getLane(i));
    return int8x16_t(tm, _nres);
}
inline int16x8_t veor3q_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, fold_bvxor(tm,a.getLane(i),b.getLane(i)), c.getLane(i));
    return int16x8_t(tm, _nres);
}
inline int32x4_t veor3q_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, fold_bvxor(tm,a.getLane(i),b.getLane(i)), c.getLane(i));
    return int32x4_t(tm, _nres);
}
inline int64x2_t veor3q_s64(const int64x2_t& a, const int64x2_t& b, const int64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, fold_bvxor(tm,a.getLane(i),b.getLane(i)), c.getLane(i));
    return int64x2_t(tm, _nres);
}
inline uint8x16_t vbcaxq_u8(const uint8x16_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvand(tm,b.getLane(i),fold_bvnot(tm,c.getLane(i))));
    return uint8x16_t(tm, _nres);
}
inline uint16x8_t vbcaxq_u16(const uint16x8_t& a, const uint16x8_t& b, const uint16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvand(tm,b.getLane(i),fold_bvnot(tm,c.getLane(i))));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vbcaxq_u32(const uint32x4_t& a, const uint32x4_t& b, const uint32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvand(tm,b.getLane(i),fold_bvnot(tm,c.getLane(i))));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vbcaxq_u64(const uint64x2_t& a, const uint64x2_t& b, const uint64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvand(tm,b.getLane(i),fold_bvnot(tm,c.getLane(i))));
    return uint64x2_t(tm, _nres);
}
inline int8x16_t vbcaxq_s8(const int8x16_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres;
    for (size_t i = 0; i < 16; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvand(tm,b.getLane(i),fold_bvnot(tm,c.getLane(i))));
    return int8x16_t(tm, _nres);
}
inline int16x8_t vbcaxq_s16(const int16x8_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvand(tm,b.getLane(i),fold_bvnot(tm,c.getLane(i))));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vbcaxq_s32(const int32x4_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvand(tm,b.getLane(i),fold_bvnot(tm,c.getLane(i))));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vbcaxq_s64(const int64x2_t& a, const int64x2_t& b, const int64x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvand(tm,b.getLane(i),fold_bvnot(tm,c.getLane(i))));
    return int64x2_t(tm, _nres);
}
inline uint64x2_t vrax1q_u64(const uint64x2_t& a, const uint64x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvxor(tm, a.getLane(i), fold_bvor(tm, fold_bvshl(tm,b.getLane(i),mk_bv_val(tm,64,1)), fold_bvlshr(tm,b.getLane(i),mk_bv_val(tm,64,63))));
    return uint64x2_t(tm, _nres);
}
inline uint64x2_t vxarq_u64(const uint64x2_t& a, const uint64x2_t& b, const int imm6) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvor(tm, fold_bvlshr(tm,fold_bvxor(tm,a.getLane(i),b.getLane(i)),mk_bv_val(tm,64,imm6)), fold_bvshl(tm,fold_bvxor(tm,a.getLane(i),b.getLane(i)),mk_bv_val(tm,64,64-(imm6))));
    return uint64x2_t(tm, _nres);
}
inline float16x4_t vamax_f16(const float16x4_t& vn, const float16x4_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_max(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),16)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),16))), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vamaxq_f16(const float16x8_t& vn, const float16x8_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_max(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),16)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),16))), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vamax_f32(const float32x2_t& vn, const float32x2_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_max(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),32)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vamaxq_f32(const float32x4_t& vn, const float32x4_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_max(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),32)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),32))), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vamaxq_f64(const float64x2_t& vn, const float64x2_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_max(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),64)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),64))), 64);
    return float64x2_t(tm, _nres);
}
inline float16x4_t vamin_f16(const float16x4_t& vn, const float16x4_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_min(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),16)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),16))), 16);
    return float16x4_t(tm, _nres);
}
inline float16x8_t vaminq_f16(const float16x8_t& vn, const float16x8_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fp_to_lane(tm, nfp_min(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),16)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),16))), 16);
    return float16x8_t(tm, _nres);
}
inline float32x2_t vamin_f32(const float32x2_t& vn, const float32x2_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_min(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),32)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),32))), 32);
    return float32x2_t(tm, _nres);
}
inline float32x4_t vaminq_f32(const float32x4_t& vn, const float32x4_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fp_to_lane(tm, nfp_min(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),32)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),32))), 32);
    return float32x4_t(tm, _nres);
}
inline float64x2_t vaminq_f64(const float64x2_t& vn, const float64x2_t& vm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fp_to_lane(tm, nfp_min(tm, nfp_abs(tm,lane_to_fp(tm,vn.getLane(i),64)), nfp_abs(tm,lane_to_fp(tm,vm.getLane(i),64))), 64);
    return float64x2_t(tm, _nres);
}
inline float32x2_t vdot_f32_mf8_fpm(const float32x2_t& vd, const mfloat8x8_t& vn, const mfloat8x8_t& vm, fpm_t fpm) { return vd; }
inline float32x4_t vdotq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, fpm_t fpm) { return vd; }
inline float32x2_t vdot_lane_f32_mf8_fpm(const float32x2_t& vd, const mfloat8x8_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x2_t vdot_laneq_f32_mf8_fpm(const float32x2_t& vd, const mfloat8x8_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vdotq_lane_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vdotq_laneq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float16x4_t vdot_f16_mf8_fpm(const float16x4_t& vd, const mfloat8x8_t& vn, const mfloat8x8_t& vm, fpm_t fpm) { return vd; }
inline float16x8_t vdotq_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, fpm_t fpm) { return vd; }
inline float16x4_t vdot_lane_f16_mf8_fpm(const float16x4_t& vd, const mfloat8x8_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float16x4_t vdot_laneq_f16_mf8_fpm(const float16x4_t& vd, const mfloat8x8_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float16x8_t vdotq_lane_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float16x8_t vdotq_laneq_f16_mf8_fpm(const float16x8_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline uint8x16_t vluti2_lane_u8(const uint8x8_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return uint8x16_t(tm, _nres);
}
inline uint8x16_t vluti2_laneq_u8(const uint8x8_t& vn, const uint8x16_t& vm, const int index) { return vm; }
inline uint8x16_t vluti2q_lane_u8(const uint8x16_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline uint8x16_t vluti2q_laneq_u8(const uint8x16_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline int8x16_t vluti2_lane_s8(const int8x8_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return int8x16_t(tm, _nres);
}
inline int8x16_t vluti2_laneq_s8(const int8x8_t& vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return int8x16_t(tm, _nres);
}
inline int8x16_t vluti2q_lane_s8(const int8x16_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline int8x16_t vluti2q_laneq_s8(const int8x16_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline poly8x16_t vluti2_lane_p8(const poly8x8_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return poly8x16_t(tm, _nres);
}
inline poly8x16_t vluti2_laneq_p8(const poly8x8_t& vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return poly8x16_t(tm, _nres);
}
inline poly8x16_t vluti2q_lane_p8(const poly8x16_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline poly8x16_t vluti2q_laneq_p8(const poly8x16_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline mfloat8x16_t vluti2_lane_mf8(const mfloat8x8_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return mfloat8x16_t(tm, _nres);
}
inline mfloat8x16_t vluti2_laneq_mf8(const mfloat8x8_t& vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> _nres; _nres.fill(mk_bv_val(tm,8,0));
    return mfloat8x16_t(tm, _nres);
}
inline mfloat8x16_t vluti2q_lane_mf8(const mfloat8x16_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline mfloat8x16_t vluti2q_laneq_mf8(const mfloat8x16_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline uint16x8_t vluti2_lane_u16(const uint16x4_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return uint16x8_t(tm, _nres);
}
inline uint16x8_t vluti2_laneq_u16(const uint16x4_t& vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return uint16x8_t(tm, _nres);
}
inline uint16x8_t vluti2q_lane_u16(const uint16x8_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline uint16x8_t vluti2q_laneq_u16(const uint16x8_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline int16x8_t vluti2_lane_s16(const int16x4_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return int16x8_t(tm, _nres);
}
inline int16x8_t vluti2_laneq_s16(const int16x4_t& vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return int16x8_t(tm, _nres);
}
inline int16x8_t vluti2q_lane_s16(const int16x8_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline int16x8_t vluti2q_laneq_s16(const int16x8_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline float16x8_t vluti2_lane_f16(const float16x4_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float16x8_t vluti2_laneq_f16(const float16x4_t& vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float16x8_t vluti2q_lane_f16(const float16x8_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline float16x8_t vluti2q_laneq_f16(const float16x8_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline bfloat16x8_t vluti2_lane_bf16(const bfloat16x4_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vluti2_laneq_bf16(const bfloat16x4_t& vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vluti2q_lane_bf16(const bfloat16x8_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline bfloat16x8_t vluti2q_laneq_bf16(const bfloat16x8_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline poly16x8_t vluti2_lane_p16(const poly16x4_t& vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return poly16x8_t(tm, _nres);
}
inline poly16x8_t vluti2_laneq_p16(const poly16x4_t& vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return poly16x8_t(tm, _nres);
}
inline poly16x8_t vluti2q_lane_p16(const poly16x8_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline poly16x8_t vluti2q_laneq_p16(const poly16x8_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline uint8x16_t vluti4q_lane_u8(const uint8x16_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline uint8x16_t vluti4q_laneq_u8(const uint8x16_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline int8x16_t vluti4q_lane_s8(const int8x16_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline int8x16_t vluti4q_laneq_s8(const int8x16_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline poly8x16_t vluti4q_lane_p8(const poly8x16_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline poly8x16_t vluti4q_laneq_p8(const poly8x16_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline mfloat8x16_t vluti4q_lane_mf8(const mfloat8x16_t& vn, const uint8x8_t& vm, const int index) { return vn; }
inline mfloat8x16_t vluti4q_laneq_mf8(const mfloat8x16_t& vn, const uint8x16_t& vm, const int index) { return vn; }
inline uint16x8_t vluti4q_lane_u16_x2(uint16x8x2_t vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return uint16x8_t(tm, _nres);
}
inline uint16x8_t vluti4q_laneq_u16_x2(uint16x8x2_t vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return uint16x8_t(tm, _nres);
}
inline int16x8_t vluti4q_lane_s16_x2(int16x8x2_t vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return int16x8_t(tm, _nres);
}
inline int16x8_t vluti4q_laneq_s16_x2(int16x8x2_t vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return int16x8_t(tm, _nres);
}
inline float16x8_t vluti4q_lane_f16_x2(float16x8x2_t vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float16x8_t vluti4q_laneq_f16_x2(float16x8x2_t vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline bfloat16x8_t vluti4q_lane_bf16_x2(bfloat16x8x2_t vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vluti4q_laneq_bf16_x2(bfloat16x8x2_t vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline poly16x8_t vluti4q_lane_p16_x2(poly16x8x2_t vn, const uint8x8_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return poly16x8_t(tm, _nres);
}
inline poly16x8_t vluti4q_laneq_p16_x2(poly16x8x2_t vn, const uint8x16_t& vm, const int index) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return poly16x8_t(tm, _nres);
}
inline float32x4_t vmlallbbq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, fpm_t fpm) { return vd; }
inline float32x4_t vmlallbbq_lane_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vmlallbbq_laneq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vmlallbtq_lane_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vmlallbtq_laneq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vmlalltbq_lane_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vmlalltbq_laneq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vmlallttq_lane_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x8_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vmlallttq_laneq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, const int lane, fpm_t fpm) { return vd; }
inline float32x4_t vmlallbtq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, fpm_t fpm) { return vd; }
inline float32x4_t vmlalltbq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, fpm_t fpm) { return vd; }
inline float32x4_t vmlallttq_f32_mf8_fpm(const float32x4_t& vd, const mfloat8x16_t& vn, const mfloat8x16_t& vm, fpm_t fpm) { return vd; }
inline float16x8_t vcvt1_f16_mf8_fpm(const mfloat8x8_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float16x8_t vcvt1_low_f16_mf8_fpm(const mfloat8x16_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float16x8_t vcvt1_high_f16_mf8_fpm(const mfloat8x16_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float16x8_t vcvt2_f16_mf8_fpm(const mfloat8x8_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float16x8_t vcvt2_low_f16_mf8_fpm(const mfloat8x16_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline float16x8_t vcvt2_high_f16_mf8_fpm(const mfloat8x16_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return float16x8_t(tm, _nres);
}
inline bfloat16x8_t vcvt1_bf16_mf8_fpm(const mfloat8x8_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vcvt1_low_bf16_mf8_fpm(const mfloat8x16_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vcvt1_high_bf16_mf8_fpm(const mfloat8x16_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vcvt2_bf16_mf8_fpm(const mfloat8x8_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vcvt2_low_bf16_mf8_fpm(const mfloat8x16_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline bfloat16x8_t vcvt2_high_bf16_mf8_fpm(const mfloat8x16_t& vn, fpm_t fpm) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres; _nres.fill(mk_bv_val(tm,16,0));
    return bfloat16x8_t(tm, _nres);
}
inline float16x4_t vscale_f16(const float16x4_t& vn, const int16x4_t& vm) { return vn; }
inline float16x8_t vscaleq_f16(const float16x8_t& vn, const int16x8_t& vm) { return vn; }
inline float32x2_t vscale_f32(const float32x2_t& vn, const int32x2_t& vm) { return vn; }
inline float32x4_t vscaleq_f32(const float32x4_t& vn, const int32x4_t& vm) { return vn; }
inline float64x2_t vscaleq_f64(const float64x2_t& vn, const int64x2_t& vm) { return vn; }
inline uint32x2_t vrecpe_u32(const uint32x2_t& a) { return a; }
inline uint32x4_t vrecpeq_u32(const uint32x4_t& a) { return a; }
inline uint32x2_t vrsqrte_u32(const uint32x2_t& a) { return a; }
inline uint32x4_t vrsqrteq_u32(const uint32x4_t& a) { return a; }
inline float32x2_t vcmla_laneq_f32(const float32x2_t& r, const float32x2_t& a, const float32x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(0),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float32x2_t vcmla_rot90_laneq_f32(const float32x2_t& r, const float32x2_t& a, const float32x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float32x2_t vcmla_rot180_laneq_f32(const float32x2_t& r, const float32x2_t& a, const float32x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(0),32)),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline float32x2_t vcmla_rot270_laneq_f32(const float32x2_t& r, const float32x2_t& a, const float32x4_t& b, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    _nres[0] = fp_to_lane(tm,nfp_fma(tm,lane_to_fp(tm,a.getLane(1),32),lane_to_fp(tm,b.getLane(2*lane+1),32),lane_to_fp(tm,r.getLane(0),32)),32);
    _nres[1] = fp_to_lane(tm,nfp_fma(tm,nfp_neg(tm,lane_to_fp(tm,a.getLane(1),32)),lane_to_fp(tm,b.getLane(2*lane),32),lane_to_fp(tm,r.getLane(1),32)),32);
    return float32x2_t(tm, _nres);
}
inline bfloat16x8_t vcvtq_high_bf16_f32(const bfloat16x8_t& inactive, const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    _nres[0] = inactive.getLane(0);
    _nres[1] = inactive.getLane(1);
    _nres[2] = inactive.getLane(2);
    _nres[3] = inactive.getLane(3);
    _nres[4] = fp32_to_bf16(tm,a.getLane(0));
    _nres[5] = fp32_to_bf16(tm,a.getLane(1));
    _nres[6] = fp32_to_bf16(tm,a.getLane(2));
    _nres[7] = fp32_to_bf16(tm,a.getLane(3));
    return bfloat16x8_t(tm, _nres);
}
inline uint32_t __crc32b(uint32_t a, uint8_t b) { return {}; }
inline uint32_t __crc32h(uint32_t a, uint16_t b) { return {}; }
inline uint32_t __crc32w(uint32_t a, uint32_t b) { return {}; }
inline uint32_t __crc32d(uint32_t a, uint64_t b) { return {}; }
inline uint32_t __crc32cb(uint32_t a, uint8_t b) { return {}; }
inline uint32_t __crc32ch(uint32_t a, uint16_t b) { return {}; }
inline uint32_t __crc32cw(uint32_t a, uint32_t b) { return {}; }
inline uint32_t __crc32cd(uint32_t a, uint64_t b) { return {}; }

} // namespace salt_cvc5
