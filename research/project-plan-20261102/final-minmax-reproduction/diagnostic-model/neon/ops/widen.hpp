#pragma once
// NEON widening multiply/add/sub/abd/shift-long/pairwise-long
#include "arith_help.hpp"
namespace salt_cvc5 {

inline int16x8_t vmull_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),8,16,true), _next(tm,b.getLane(i),8,16,true));
    return int16x8_t(tm, _nres);
}
inline int64x2_t vmull_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),32,64,true), _next(tm,b.getLane(i),32,64,true));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmull_n_s16(const int16x4_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),16,32,true), _next(tm,mk_bv_val(tm,16,(int64_t)b),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmull_n_s32(const int32x2_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),32,64,true), _next(tm,mk_bv_val(tm,32,(int64_t)b),32,64,true));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmull_lane_s16(const int16x4_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),16,32,true), _next(tm,v.getLane(lane),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmull_lane_s32(const int32x2_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),32,64,true), _next(tm,v.getLane(lane),32,64,true));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmull_laneq_s16(const int16x4_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),16,32,true), _next(tm,v.getLane(lane),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmull_laneq_s32(const int32x2_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),32,64,true), _next(tm,v.getLane(lane),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vmull_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),8,16,false), _next(tm,b.getLane(i),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vmull_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),16,32,false), _next(tm,b.getLane(i),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmull_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),32,64,false), _next(tm,b.getLane(i),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmull_n_u16(const uint16x4_t& a, uint16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),16,32,false), _next(tm,mk_bv_val(tm,16,(int64_t)b),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmull_n_u32(const uint32x2_t& a, uint32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),32,64,false), _next(tm,mk_bv_val(tm,32,(int64_t)b),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmull_lane_u16(const uint16x4_t& a, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),16,32,false), _next(tm,v.getLane(lane),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmull_lane_u32(const uint32x2_t& a, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),32,64,false), _next(tm,v.getLane(lane),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmull_laneq_u16(const uint16x4_t& a, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),16,32,false), _next(tm,v.getLane(lane),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmull_laneq_u32(const uint32x2_t& a, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i),32,64,false), _next(tm,v.getLane(lane),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vmull_high_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+8),8,16,true), _next(tm,b.getLane(i+8),8,16,true));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vmull_high_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+4),16,32,true), _next(tm,b.getLane(i+4),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmull_high_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+2),32,64,true), _next(tm,b.getLane(i+2),32,64,true));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmull_high_n_s16(const int16x8_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+4),16,32,true), _next(tm,mk_bv_val(tm,16,(int64_t)b),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmull_high_n_s32(const int32x4_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+2),32,64,true), _next(tm,mk_bv_val(tm,32,(int64_t)b),32,64,true));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmull_high_lane_s16(const int16x8_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+4),16,32,true), _next(tm,v.getLane(lane),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmull_high_lane_s32(const int32x4_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+2),32,64,true), _next(tm,v.getLane(lane),32,64,true));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmull_high_laneq_s16(const int16x8_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+4),16,32,true), _next(tm,v.getLane(lane),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmull_high_laneq_s32(const int32x4_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+2),32,64,true), _next(tm,v.getLane(lane),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vmull_high_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+8),8,16,false), _next(tm,b.getLane(i+8),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vmull_high_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+4),16,32,false), _next(tm,b.getLane(i+4),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmull_high_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+2),32,64,false), _next(tm,b.getLane(i+2),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmull_high_n_u16(const uint16x8_t& a, uint16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+4),16,32,false), _next(tm,mk_bv_val(tm,16,(int64_t)b),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmull_high_n_u32(const uint32x4_t& a, uint32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+2),32,64,false), _next(tm,mk_bv_val(tm,32,(int64_t)b),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmull_high_lane_u16(const uint16x8_t& a, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+4),16,32,false), _next(tm,v.getLane(lane),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmull_high_lane_u32(const uint32x4_t& a, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+2),32,64,false), _next(tm,v.getLane(lane),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmull_high_laneq_u16(const uint16x8_t& a, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+4),16,32,false), _next(tm,v.getLane(lane),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmull_high_laneq_u32(const uint32x4_t& a, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvmul(tm, _next(tm,a.getLane(i+2),32,64,false), _next(tm,v.getLane(lane),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vmlal_s8(const int16x8_t& a, const int8x8_t& b, const int8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),8,16,true), _next(tm,c.getLane(i),8,16,true)));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vmlal_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,true), _next(tm,c.getLane(i),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlal_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,true), _next(tm,c.getLane(i),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlal_lane_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,true), _next(tm,v.getLane(lane),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlal_lane_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,true), _next(tm,v.getLane(lane),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlal_laneq_s16(const int32x4_t& a, const int16x4_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,true), _next(tm,v.getLane(lane),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlal_laneq_s32(const int64x2_t& a, const int32x2_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,true), _next(tm,v.getLane(lane),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlal_n_s16(const int32x4_t& a, const int16x4_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,true), _next(tm,mk_bv_val(tm,16,(int64_t)c),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlal_n_s32(const int64x2_t& a, const int32x2_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,true), _next(tm,mk_bv_val(tm,32,(int64_t)c),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vmlal_u8(const uint16x8_t& a, const uint8x8_t& b, const uint8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),8,16,false), _next(tm,c.getLane(i),8,16,false)));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vmlal_u16(const uint32x4_t& a, const uint16x4_t& b, const uint16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,false), _next(tm,c.getLane(i),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlal_u32(const uint64x2_t& a, const uint32x2_t& b, const uint32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,false), _next(tm,c.getLane(i),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlal_lane_u16(const uint32x4_t& a, const uint16x4_t& b, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,false), _next(tm,v.getLane(lane),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlal_lane_u32(const uint64x2_t& a, const uint32x2_t& b, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,false), _next(tm,v.getLane(lane),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlal_laneq_u16(const uint32x4_t& a, const uint16x4_t& b, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,false), _next(tm,v.getLane(lane),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlal_laneq_u32(const uint64x2_t& a, const uint32x2_t& b, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,false), _next(tm,v.getLane(lane),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlal_n_u16(const uint32x4_t& a, const uint16x4_t& b, uint16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,false), _next(tm,mk_bv_val(tm,16,(int64_t)c),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlal_n_u32(const uint64x2_t& a, const uint32x2_t& b, uint32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,false), _next(tm,mk_bv_val(tm,32,(int64_t)c),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vmlal_high_s8(const int16x8_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+8),8,16,true), _next(tm,c.getLane(i+8),8,16,true)));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vmlal_high_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,true), _next(tm,c.getLane(i+4),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlal_high_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,true), _next(tm,c.getLane(i+2),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlal_high_lane_s16(const int32x4_t& a, const int16x8_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,true), _next(tm,v.getLane(lane),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlal_high_lane_s32(const int64x2_t& a, const int32x4_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,true), _next(tm,v.getLane(lane),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlal_high_laneq_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,true), _next(tm,v.getLane(lane),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlal_high_laneq_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,true), _next(tm,v.getLane(lane),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlal_high_n_s16(const int32x4_t& a, const int16x8_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,true), _next(tm,mk_bv_val(tm,16,(int64_t)c),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlal_high_n_s32(const int64x2_t& a, const int32x4_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,true), _next(tm,mk_bv_val(tm,32,(int64_t)c),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vmlal_high_u8(const uint16x8_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+8),8,16,false), _next(tm,c.getLane(i+8),8,16,false)));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vmlal_high_u16(const uint32x4_t& a, const uint16x8_t& b, const uint16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,false), _next(tm,c.getLane(i+4),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlal_high_u32(const uint64x2_t& a, const uint32x4_t& b, const uint32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,false), _next(tm,c.getLane(i+2),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlal_high_lane_u16(const uint32x4_t& a, const uint16x8_t& b, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,false), _next(tm,v.getLane(lane),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlal_high_lane_u32(const uint64x2_t& a, const uint32x4_t& b, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,false), _next(tm,v.getLane(lane),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlal_high_laneq_u16(const uint32x4_t& a, const uint16x8_t& b, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,false), _next(tm,v.getLane(lane),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlal_high_laneq_u32(const uint64x2_t& a, const uint32x4_t& b, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,false), _next(tm,v.getLane(lane),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlal_high_n_u16(const uint32x4_t& a, const uint16x8_t& b, uint16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,false), _next(tm,mk_bv_val(tm,16,(int64_t)c),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlal_high_n_u32(const uint64x2_t& a, const uint32x4_t& b, uint32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,false), _next(tm,mk_bv_val(tm,32,(int64_t)c),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vmlsl_s8(const int16x8_t& a, const int8x8_t& b, const int8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),8,16,true), _next(tm,c.getLane(i),8,16,true)));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vmlsl_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,true), _next(tm,c.getLane(i),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlsl_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,true), _next(tm,c.getLane(i),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlsl_lane_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,true), _next(tm,v.getLane(lane),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlsl_lane_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,true), _next(tm,v.getLane(lane),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlsl_laneq_s16(const int32x4_t& a, const int16x4_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,true), _next(tm,v.getLane(lane),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlsl_laneq_s32(const int64x2_t& a, const int32x2_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,true), _next(tm,v.getLane(lane),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlsl_n_s16(const int32x4_t& a, const int16x4_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,true), _next(tm,mk_bv_val(tm,16,(int64_t)c),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlsl_n_s32(const int64x2_t& a, const int32x2_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,true), _next(tm,mk_bv_val(tm,32,(int64_t)c),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vmlsl_u8(const uint16x8_t& a, const uint8x8_t& b, const uint8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),8,16,false), _next(tm,c.getLane(i),8,16,false)));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vmlsl_u16(const uint32x4_t& a, const uint16x4_t& b, const uint16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,false), _next(tm,c.getLane(i),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlsl_u32(const uint64x2_t& a, const uint32x2_t& b, const uint32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,false), _next(tm,c.getLane(i),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlsl_lane_u16(const uint32x4_t& a, const uint16x4_t& b, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,false), _next(tm,v.getLane(lane),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlsl_lane_u32(const uint64x2_t& a, const uint32x2_t& b, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,false), _next(tm,v.getLane(lane),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlsl_laneq_u16(const uint32x4_t& a, const uint16x4_t& b, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,false), _next(tm,v.getLane(lane),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlsl_laneq_u32(const uint64x2_t& a, const uint32x2_t& b, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,false), _next(tm,v.getLane(lane),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlsl_n_u16(const uint32x4_t& a, const uint16x4_t& b, uint16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),16,32,false), _next(tm,mk_bv_val(tm,16,(int64_t)c),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlsl_n_u32(const uint64x2_t& a, const uint32x2_t& b, uint32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i),32,64,false), _next(tm,mk_bv_val(tm,32,(int64_t)c),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vmlsl_high_s8(const int16x8_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+8),8,16,true), _next(tm,c.getLane(i+8),8,16,true)));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vmlsl_high_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,true), _next(tm,c.getLane(i+4),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlsl_high_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,true), _next(tm,c.getLane(i+2),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlsl_high_lane_s16(const int32x4_t& a, const int16x8_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,true), _next(tm,v.getLane(lane),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlsl_high_lane_s32(const int64x2_t& a, const int32x4_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,true), _next(tm,v.getLane(lane),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlsl_high_laneq_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,true), _next(tm,v.getLane(lane),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlsl_high_laneq_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,true), _next(tm,v.getLane(lane),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline int32x4_t vmlsl_high_n_s16(const int32x4_t& a, const int16x8_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,true), _next(tm,mk_bv_val(tm,16,(int64_t)c),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmlsl_high_n_s32(const int64x2_t& a, const int32x4_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,true), _next(tm,mk_bv_val(tm,32,(int64_t)c),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vmlsl_high_u8(const uint16x8_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+8),8,16,false), _next(tm,c.getLane(i+8),8,16,false)));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vmlsl_high_u16(const uint32x4_t& a, const uint16x8_t& b, const uint16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,false), _next(tm,c.getLane(i+4),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlsl_high_u32(const uint64x2_t& a, const uint32x4_t& b, const uint32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,false), _next(tm,c.getLane(i+2),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlsl_high_lane_u16(const uint32x4_t& a, const uint16x8_t& b, const uint16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,false), _next(tm,v.getLane(lane),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlsl_high_lane_u32(const uint64x2_t& a, const uint32x4_t& b, const uint32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,false), _next(tm,v.getLane(lane),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlsl_high_laneq_u16(const uint32x4_t& a, const uint16x8_t& b, const uint16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,false), _next(tm,v.getLane(lane),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlsl_high_laneq_u32(const uint64x2_t& a, const uint32x4_t& b, const uint32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,false), _next(tm,v.getLane(lane),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline uint32x4_t vmlsl_high_n_u16(const uint32x4_t& a, const uint16x8_t& b, uint16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+4),16,32,false), _next(tm,mk_bv_val(tm,16,(int64_t)c),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmlsl_high_n_u32(const uint64x2_t& a, const uint32x4_t& b, uint32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), fold_bvmul(tm, _next(tm,b.getLane(i+2),32,64,false), _next(tm,mk_bv_val(tm,32,(int64_t)c),32,64,false)));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vaddl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i),8,16,true), _next(tm,b.getLane(i),8,16,true));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vaddl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i),16,32,true), _next(tm,b.getLane(i),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vaddl_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i),32,64,true), _next(tm,b.getLane(i),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vaddl_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i),8,16,false), _next(tm,b.getLane(i),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vaddl_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i),16,32,false), _next(tm,b.getLane(i),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vaddl_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i),32,64,false), _next(tm,b.getLane(i),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vaddl_high_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i+8),8,16,true), _next(tm,b.getLane(i+8),8,16,true));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vaddl_high_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i+4),16,32,true), _next(tm,b.getLane(i+4),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vaddl_high_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i+2),32,64,true), _next(tm,b.getLane(i+2),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vaddl_high_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i+8),8,16,false), _next(tm,b.getLane(i+8),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vaddl_high_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i+4),16,32,false), _next(tm,b.getLane(i+4),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vaddl_high_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(i+2),32,64,false), _next(tm,b.getLane(i+2),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int32x4_t vsubl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i),16,32,true), _next(tm,b.getLane(i),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vsubl_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i),32,64,true), _next(tm,b.getLane(i),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vsubl_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i),8,16,false), _next(tm,b.getLane(i),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vsubl_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i),16,32,false), _next(tm,b.getLane(i),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vsubl_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i),32,64,false), _next(tm,b.getLane(i),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int32x4_t vsubl_high_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i+4),16,32,true), _next(tm,b.getLane(i+4),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vsubl_high_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i+2),32,64,true), _next(tm,b.getLane(i+2),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vsubl_high_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i+8),8,16,false), _next(tm,b.getLane(i+8),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vsubl_high_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i+4),16,32,false), _next(tm,b.getLane(i+4),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vsubl_high_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, _next(tm,a.getLane(i+2),32,64,false), _next(tm,b.getLane(i+2),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int32x4_t vaddw_s16(const int32x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vaddw_s32(const int64x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint64x2_t vaddw_u32(const uint64x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vaddw_high_s8(const int16x8_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i+8),8,16,true));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vaddw_high_s16(const int32x4_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i+4),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vaddw_high_s32(const int64x2_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i+2),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vaddw_high_u8(const uint16x8_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i+8),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vaddw_high_u16(const uint32x4_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i+4),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vaddw_high_u32(const uint64x2_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _next(tm,b.getLane(i+2),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int32x4_t vsubw_s16(const int32x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vsubw_s32(const int64x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vsubw_u8(const uint16x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vsubw_u16(const uint32x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vsubw_u32(const uint64x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vsubw_high_s8(const int16x8_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i+8),8,16,true));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vsubw_high_s16(const int32x4_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i+4),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vsubw_high_s32(const int64x2_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i+2),32,64,true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vsubw_high_u8(const uint16x8_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i+8),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vsubw_high_u16(const uint32x4_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i+4),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vsubw_high_u32(const uint64x2_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvsub(tm, a.getLane(i), _next(tm,b.getLane(i+2),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vabdl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nabdl(tm, a.getLane(i), b.getLane(i), 8, 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vabdl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nabdl(tm, a.getLane(i), b.getLane(i), 16, 32, true);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vabdl_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nabdl(tm, a.getLane(i), b.getLane(i), 32, 64, true);
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vabdl_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nabdl(tm, a.getLane(i), b.getLane(i), 8, 16, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vabdl_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nabdl(tm, a.getLane(i), b.getLane(i), 16, 32, false);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vabdl_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nabdl(tm, a.getLane(i), b.getLane(i), 32, 64, false);
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vabdl_high_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nabdl(tm, a.getLane(i+8), b.getLane(i+8), 8, 16, true);
    return int16x8_t(tm, _nres);
}
inline int32x4_t vabdl_high_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nabdl(tm, a.getLane(i+4), b.getLane(i+4), 16, 32, true);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vabdl_high_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nabdl(tm, a.getLane(i+2), b.getLane(i+2), 32, 64, true);
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vabdl_high_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = _nabdl(tm, a.getLane(i+8), b.getLane(i+8), 8, 16, false);
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vabdl_high_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nabdl(tm, a.getLane(i+4), b.getLane(i+4), 16, 32, false);
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vabdl_high_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nabdl(tm, a.getLane(i+2), b.getLane(i+2), 32, 64, false);
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vabal_s8(const int16x8_t& a, const int8x8_t& b, const int8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i), c.getLane(i), 8, 16, true));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vabal_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i), c.getLane(i), 16, 32, true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vabal_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i), c.getLane(i), 32, 64, true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vabal_u8(const uint16x8_t& a, const uint8x8_t& b, const uint8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i), c.getLane(i), 8, 16, false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vabal_u16(const uint32x4_t& a, const uint16x4_t& b, const uint16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i), c.getLane(i), 16, 32, false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vabal_u32(const uint64x2_t& a, const uint32x2_t& b, const uint32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i), c.getLane(i), 32, 64, false));
    return uint64x2_t(tm, _nres);
}
inline int16x8_t vabal_high_s8(const int16x8_t& a, const int8x16_t& b, const int8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i+8), c.getLane(i+8), 8, 16, true));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vabal_high_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i+4), c.getLane(i+4), 16, 32, true));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vabal_high_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i+2), c.getLane(i+2), 32, 64, true));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vabal_high_u8(const uint16x8_t& a, const uint8x16_t& b, const uint8x16_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i+8), c.getLane(i+8), 8, 16, false));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vabal_high_u16(const uint32x4_t& a, const uint16x8_t& b, const uint16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i+4), c.getLane(i+4), 16, 32, false));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vabal_high_u32(const uint64x2_t& a, const uint32x4_t& b, const uint32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), _nabdl(tm, b.getLane(i+2), c.getLane(i+2), 32, 64, false));
    return uint64x2_t(tm, _nres);
}
inline int32x4_t vqdmull_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqdmull(tm, a.getLane(i), b.getLane(i), 16, 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmull_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqdmull(tm, a.getLane(i), b.getLane(i), 32, 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmullh_s16(int16_t a, int16_t b) { return {}; }
inline int64_t vqdmulls_s32(int32_t a, int32_t b) { return {}; }
inline int32x4_t vqdmull_n_s16(const int16x4_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqdmull(tm, a.getLane(i), mk_bv_val(tm,16,(int64_t)b), 16, 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmull_n_s32(const int32x2_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqdmull(tm, a.getLane(i), mk_bv_val(tm,32,(int64_t)b), 32, 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmull_lane_s16(const int16x4_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqdmull(tm, a.getLane(i), v.getLane(lane), 16, 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmull_lane_s32(const int32x2_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqdmull(tm, a.getLane(i), v.getLane(lane), 32, 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmullh_lane_s16(int16_t a, const int16x4_t& v, const int lane) { return {}; }
inline int64_t vqdmulls_lane_s32(int32_t a, const int32x2_t& v, const int lane) { return {}; }
inline int32x4_t vqdmull_laneq_s16(const int16x4_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqdmull(tm, a.getLane(i), v.getLane(lane), 16, 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmull_laneq_s32(const int32x2_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqdmull(tm, a.getLane(i), v.getLane(lane), 32, 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmullh_laneq_s16(int16_t a, const int16x8_t& v, const int lane) { return {}; }
inline int64_t vqdmulls_laneq_s32(int32_t a, const int32x4_t& v, const int lane) { return {}; }
inline int32x4_t vqdmull_high_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqdmull(tm, a.getLane(i+4), b.getLane(i+4), 16, 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmull_high_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqdmull(tm, a.getLane(i+2), b.getLane(i+2), 32, 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmull_high_n_s16(const int16x8_t& a, int16_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqdmull(tm, a.getLane(i+4), mk_bv_val(tm,16,(int64_t)b), 16, 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmull_high_n_s32(const int32x4_t& a, int32_t b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqdmull(tm, a.getLane(i+2), mk_bv_val(tm,32,(int64_t)b), 32, 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmull_high_lane_s16(const int16x8_t& a, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqdmull(tm, a.getLane(i+4), v.getLane(lane), 16, 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmull_high_lane_s32(const int32x4_t& a, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqdmull(tm, a.getLane(i+2), v.getLane(lane), 32, 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmull_high_laneq_s16(const int16x8_t& a, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nqdmull(tm, a.getLane(i+4), v.getLane(lane), 16, 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmull_high_laneq_s32(const int32x4_t& a, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nqdmull(tm, a.getLane(i+2), v.getLane(lane), 32, 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlal_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), c.getLane(i), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlal_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), c.getLane(i), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmlalh_s16(int32_t a, int16_t b, int16_t c) { return {}; }
inline int64_t vqdmlals_s32(int64_t a, int32_t b, int32_t c) { return {}; }
inline int32x4_t vqdmlal_lane_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), v.getLane(lane), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlal_lane_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), v.getLane(lane), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmlalh_lane_s16(int32_t a, int16_t b, const int16x4_t& v, const int lane) { return {}; }
inline int64_t vqdmlals_lane_s32(int64_t a, int32_t b, const int32x2_t& v, const int lane) { return {}; }
inline int32x4_t vqdmlal_laneq_s16(const int32x4_t& a, const int16x4_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), v.getLane(lane), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlal_laneq_s32(const int64x2_t& a, const int32x2_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), v.getLane(lane), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmlalh_laneq_s16(int32_t a, int16_t b, const int16x8_t& v, const int lane) { return {}; }
inline int64_t vqdmlals_laneq_s32(int64_t a, int32_t b, const int32x4_t& v, const int lane) { return {}; }
inline int32x4_t vqdmlal_n_s16(const int32x4_t& a, const int16x4_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), mk_bv_val(tm,16,(int64_t)c), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlal_n_s32(const int64x2_t& a, const int32x2_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), mk_bv_val(tm,32,(int64_t)c), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlal_high_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+4), c.getLane(i+4), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlal_high_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+2), c.getLane(i+2), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlal_high_lane_s16(const int32x4_t& a, const int16x8_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+4), v.getLane(lane), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlal_high_lane_s32(const int64x2_t& a, const int32x4_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+2), v.getLane(lane), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlal_high_laneq_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+4), v.getLane(lane), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlal_high_laneq_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+2), v.getLane(lane), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlal_high_n_s16(const int32x4_t& a, const int16x8_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+4), mk_bv_val(tm,16,(int64_t)c), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlal_high_n_s32(const int64x2_t& a, const int32x4_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_sadd(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+2), mk_bv_val(tm,32,(int64_t)c), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlsl_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), c.getLane(i), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlsl_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), c.getLane(i), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmlslh_s16(int32_t a, int16_t b, int16_t c) { return {}; }
inline int64_t vqdmlsls_s32(int64_t a, int32_t b, int32_t c) { return {}; }
inline int32x4_t vqdmlsl_lane_s16(const int32x4_t& a, const int16x4_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), v.getLane(lane), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlsl_lane_s32(const int64x2_t& a, const int32x2_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), v.getLane(lane), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmlslh_lane_s16(int32_t a, int16_t b, const int16x4_t& v, const int lane) { return {}; }
inline int64_t vqdmlsls_lane_s32(int64_t a, int32_t b, const int32x2_t& v, const int lane) { return {}; }
inline int32x4_t vqdmlsl_laneq_s16(const int32x4_t& a, const int16x4_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), v.getLane(lane), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlsl_laneq_s32(const int64x2_t& a, const int32x2_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), v.getLane(lane), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32_t vqdmlslh_laneq_s16(int32_t a, int16_t b, const int16x8_t& v, const int lane) { return {}; }
inline int64_t vqdmlsls_laneq_s32(int64_t a, int32_t b, const int32x4_t& v, const int lane) { return {}; }
inline int32x4_t vqdmlsl_n_s16(const int32x4_t& a, const int16x4_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), mk_bv_val(tm,16,(int64_t)c), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlsl_n_s32(const int64x2_t& a, const int32x2_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i), mk_bv_val(tm,32,(int64_t)c), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlsl_high_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+4), c.getLane(i+4), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlsl_high_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+2), c.getLane(i+2), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlsl_high_lane_s16(const int32x4_t& a, const int16x8_t& b, const int16x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+4), v.getLane(lane), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlsl_high_lane_s32(const int64x2_t& a, const int32x4_t& b, const int32x2_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+2), v.getLane(lane), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlsl_high_laneq_s16(const int32x4_t& a, const int16x8_t& b, const int16x8_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+4), v.getLane(lane), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlsl_high_laneq_s32(const int64x2_t& a, const int32x4_t& b, const int32x4_t& v, const int lane) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+2), v.getLane(lane), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int32x4_t vqdmlsl_high_n_s16(const int32x4_t& a, const int16x8_t& b, int16_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+4), mk_bv_val(tm,16,(int64_t)c), 16, 32), 32);
    return int32x4_t(tm, _nres);
}
inline int64x2_t vqdmlsl_high_n_s32(const int64x2_t& a, const int32x4_t& b, int32_t c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = _nsat_ssub(tm, a.getLane(i), _nqdmull(tm, b.getLane(i+2), mk_bv_val(tm,32,(int64_t)c), 32, 64), 64);
    return int64x2_t(tm, _nres);
}
inline int16x8_t vshll_n_s8(const int8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),8,16,true), mk_bv_val(tm,16,n));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vshll_n_s16(const int16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),16,32,true), mk_bv_val(tm,32,n));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vshll_n_s32(const int32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),32,64,true), mk_bv_val(tm,64,n));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vshll_n_u8(const uint8x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),8,16,false), mk_bv_val(tm,16,n));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vshll_n_u16(const uint16x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),16,32,false), mk_bv_val(tm,32,n));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vshll_n_u32(const uint32x2_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),32,64,false), mk_bv_val(tm,64,n));
    return uint64x2_t(tm, _nres);
}
inline float32x4_t vcvtq_low_f32_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),16,32,false), mk_bv_val(tm,32,0));
    return float32x4_t(tm, _nres);
}
inline int16x8_t vshll_high_n_s8(const int8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+8),8,16,true), mk_bv_val(tm,16,n));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vshll_high_n_s16(const int16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+4),16,32,true), mk_bv_val(tm,32,n));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vshll_high_n_s32(const int32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+2),32,64,true), mk_bv_val(tm,64,n));
    return int64x2_t(tm, _nres);
}
inline uint16x8_t vshll_high_n_u8(const uint8x16_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+8),8,16,false), mk_bv_val(tm,16,n));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vshll_high_n_u16(const uint16x8_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+4),16,32,false), mk_bv_val(tm,32,n));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vshll_high_n_u32(const uint32x4_t& a, const int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+2),32,64,false), mk_bv_val(tm,64,n));
    return uint64x2_t(tm, _nres);
}
inline float32x4_t vcvtq_high_f32_bf16(const bfloat16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+4),16,32,false), mk_bv_val(tm,32,0));
    return float32x4_t(tm, _nres);
}
inline int64x2_t vmovl_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),32,64,true), mk_bv_val(tm,64,0));
    return int64x2_t(tm, _nres);
}
inline int16x8_t vmovl_high_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+8),8,16,true), mk_bv_val(tm,16,0));
    return int16x8_t(tm, _nres);
}
inline int32x4_t vmovl_high_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+4),16,32,true), mk_bv_val(tm,32,0));
    return int32x4_t(tm, _nres);
}
inline int64x2_t vmovl_high_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+2),32,64,true), mk_bv_val(tm,64,0));
    return int64x2_t(tm, _nres);
}
inline uint64x2_t vmovl_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i),32,64,false), mk_bv_val(tm,64,0));
    return uint64x2_t(tm, _nres);
}
inline uint16x8_t vmovl_high_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+8),8,16,false), mk_bv_val(tm,16,0));
    return uint16x8_t(tm, _nres);
}
inline uint32x4_t vmovl_high_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+4),16,32,false), mk_bv_val(tm,32,0));
    return uint32x4_t(tm, _nres);
}
inline uint64x2_t vmovl_high_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvshl(tm, _next(tm,a.getLane(i+2),32,64,false), mk_bv_val(tm,64,0));
    return uint64x2_t(tm, _nres);
}
inline int16x4_t vpaddl_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),8,16,true), _next(tm,a.getLane(2*i+1),8,16,true));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vpaddlq_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),8,16,true), _next(tm,a.getLane(2*i+1),8,16,true));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vpaddl_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),16,32,true), _next(tm,a.getLane(2*i+1),16,32,true));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vpaddlq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),16,32,true), _next(tm,a.getLane(2*i+1),16,32,true));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vpaddl_s32(const int32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),32,64,true), _next(tm,a.getLane(2*i+1),32,64,true));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vpaddlq_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),32,64,true), _next(tm,a.getLane(2*i+1),32,64,true));
    return int64x2_t(tm, _nres);
}
inline int64_t vaddlv_s32(const int32x2_t& a) { return {}; }
inline uint16x4_t vpaddl_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),8,16,false), _next(tm,a.getLane(2*i+1),8,16,false));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vpaddlq_u8(const uint8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),8,16,false), _next(tm,a.getLane(2*i+1),8,16,false));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vpaddl_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),16,32,false), _next(tm,a.getLane(2*i+1),16,32,false));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vpaddlq_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),16,32,false), _next(tm,a.getLane(2*i+1),16,32,false));
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vpaddl_u32(const uint32x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),32,64,false), _next(tm,a.getLane(2*i+1),32,64,false));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vpaddlq_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, _next(tm,a.getLane(2*i),32,64,false), _next(tm,a.getLane(2*i+1),32,64,false));
    return uint64x2_t(tm, _nres);
}
inline uint64_t vaddlv_u32(const uint32x2_t& a) { return {}; }
inline int16x4_t vpadal_s8(const int16x4_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),8,16,true), _next(tm,b.getLane(2*i+1),8,16,true)));
    return int16x4_t(tm, _nres);
}
inline int16x8_t vpadalq_s8(const int16x8_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),8,16,true), _next(tm,b.getLane(2*i+1),8,16,true)));
    return int16x8_t(tm, _nres);
}
inline int32x2_t vpadal_s16(const int32x2_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),16,32,true), _next(tm,b.getLane(2*i+1),16,32,true)));
    return int32x2_t(tm, _nres);
}
inline int32x4_t vpadalq_s16(const int32x4_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),16,32,true), _next(tm,b.getLane(2*i+1),16,32,true)));
    return int32x4_t(tm, _nres);
}
inline int64x1_t vpadal_s32(const int64x1_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),32,64,true), _next(tm,b.getLane(2*i+1),32,64,true)));
    return int64x1_t(tm, _nres);
}
inline int64x2_t vpadalq_s32(const int64x2_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),32,64,true), _next(tm,b.getLane(2*i+1),32,64,true)));
    return int64x2_t(tm, _nres);
}
inline uint16x4_t vpadal_u8(const uint16x4_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),8,16,false), _next(tm,b.getLane(2*i+1),8,16,false)));
    return uint16x4_t(tm, _nres);
}
inline uint16x8_t vpadalq_u8(const uint16x8_t& a, const uint8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> _nres;
    for (size_t i = 0; i < 8; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),8,16,false), _next(tm,b.getLane(2*i+1),8,16,false)));
    return uint16x8_t(tm, _nres);
}
inline uint32x2_t vpadal_u16(const uint32x2_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),16,32,false), _next(tm,b.getLane(2*i+1),16,32,false)));
    return uint32x2_t(tm, _nres);
}
inline uint32x4_t vpadalq_u16(const uint32x4_t& a, const uint16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> _nres;
    for (size_t i = 0; i < 4; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),16,32,false), _next(tm,b.getLane(2*i+1),16,32,false)));
    return uint32x4_t(tm, _nres);
}
inline uint64x1_t vpadal_u32(const uint64x1_t& a, const uint32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 1> _nres;
    for (size_t i = 0; i < 1; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),32,64,false), _next(tm,b.getLane(2*i+1),32,64,false)));
    return uint64x1_t(tm, _nres);
}
inline uint64x2_t vpadalq_u32(const uint64x2_t& a, const uint32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> _nres;
    for (size_t i = 0; i < 2; i++) _nres[i] = fold_bvadd(tm, a.getLane(i), fold_bvadd(tm, _next(tm,b.getLane(2*i),32,64,false), _next(tm,b.getLane(2*i+1),32,64,false)));
    return uint64x2_t(tm, _nres);
}

} // namespace salt_cvc5
