#pragma once
// NEON load/store: vld1-4/vst1-4, lane, dup, contiguous-xN (via SymbolicBuffer)
#include "nhelp.hpp"
namespace salt_cvc5 {

inline int16x4_t vld1_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<16,4>(_o);
}
inline int16x8_t vld1q_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<16,8>(_o);
}
inline int32x2_t vld1_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<32,2>(_o);
}
inline int32x4_t vld1q_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<32,4>(_o);
}
inline int64x1_t vld1_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<64,1>(_o);
}
inline int64x2_t vld1q_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<64,2>(_o);
}
inline uint8x8_t vld1_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<8,8>(_o);
}
inline uint64x1_t vld1_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<64,1>(_o);
}
inline uint64x2_t vld1q_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<64,2>(_o);
}
inline poly64x1_t vld1_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<64,1>(_o);
}
inline poly64x2_t vld1q_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<64,2>(_o);
}
inline float16x4_t vld1_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<16,4>(_o);
}
inline poly8x8_t vld1_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<8,8>(_o);
}
inline poly8x16_t vld1q_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<8,16>(_o);
}
inline poly16x4_t vld1_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<16,4>(_o);
}
inline poly16x8_t vld1q_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<16,8>(_o);
}
inline float64x1_t vld1_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<64,1>(_o);
}
inline float64x2_t vld1q_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<64,2>(_o);
}
inline mfloat8x8_t vld1_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<8,8>(_o);
}
inline mfloat8x16_t vld1q_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return _b.loadNeon<8,16>(_o);
}
inline int8x8_t vld1_lane_s8(int8_t const * ptr, const int8x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 8));
    return _r;
}
inline int8x16_t vld1q_lane_s8(int8_t const * ptr, const int8x16_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 8));
    return _r;
}
inline int16x4_t vld1_lane_s16(int16_t const * ptr, const int16x4_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 16));
    return _r;
}
inline int16x8_t vld1q_lane_s16(int16_t const * ptr, const int16x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 16));
    return _r;
}
inline int32x4_t vld1q_lane_s32(int32_t const * ptr, const int32x4_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 32));
    return _r;
}
inline int64x1_t vld1_lane_s64(int64_t const * ptr, const int64x1_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline int64x2_t vld1q_lane_s64(int64_t const * ptr, const int64x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline uint8x8_t vld1_lane_u8(uint8_t const * ptr, const uint8x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 8));
    return _r;
}
inline uint8x16_t vld1q_lane_u8(uint8_t const * ptr, const uint8x16_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 8));
    return _r;
}
inline uint16x8_t vld1q_lane_u16(uint16_t const * ptr, const uint16x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 16));
    return _r;
}
inline uint32x2_t vld1_lane_u32(uint32_t const * ptr, const uint32x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 32));
    return _r;
}
inline uint32x4_t vld1q_lane_u32(uint32_t const * ptr, const uint32x4_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 32));
    return _r;
}
inline uint64x1_t vld1_lane_u64(uint64_t const * ptr, const uint64x1_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline uint64x2_t vld1q_lane_u64(uint64_t const * ptr, const uint64x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline poly64x1_t vld1_lane_p64(poly64_t const * ptr, const poly64x1_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline poly64x2_t vld1q_lane_p64(poly64_t const * ptr, const poly64x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline float16x4_t vld1_lane_f16(float16_t const * ptr, const float16x4_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 16));
    return _r;
}
inline float16x8_t vld1q_lane_f16(float16_t const * ptr, const float16x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 16));
    return _r;
}
inline float32x2_t vld1_lane_f32(float32_t const * ptr, const float32x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 32));
    return _r;
}
inline poly8x8_t vld1_lane_p8(poly8_t const * ptr, const poly8x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 8));
    return _r;
}
inline poly8x16_t vld1q_lane_p8(poly8_t const * ptr, const poly8x16_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 8));
    return _r;
}
inline poly16x4_t vld1_lane_p16(poly16_t const * ptr, const poly16x4_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 16));
    return _r;
}
inline poly16x8_t vld1q_lane_p16(poly16_t const * ptr, const poly16x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 16));
    return _r;
}
inline float64x1_t vld1_lane_f64(float64_t const * ptr, const float64x1_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline float64x2_t vld1q_lane_f64(float64_t const * ptr, const float64x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline mfloat8x8_t vld1_lane_mf8(mfloat8_t const * ptr, const mfloat8x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 8));
    return _r;
}
inline mfloat8x16_t vld1q_lane_mf8(mfloat8_t const * ptr, const mfloat8x16_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 8));
    return _r;
}
inline int64x1_t vld1_dup_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,64);
    std::array<Term,1> _a; _a.fill(_v);
    return int64x1_t(tm,_a);
}
inline poly64x1_t vld1_dup_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,64);
    std::array<Term,1> _a; _a.fill(_v);
    return poly64x1_t(tm,_a);
}
inline float64x1_t vld1_dup_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,64);
    std::array<Term,1> _a; _a.fill(_v);
    return float64x1_t(tm,_a);
}
inline int64x1x2_t vld2_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x1x2_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8)};
}
inline uint64x1x2_t vld2_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x1x2_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8)};
}
inline poly64x1x2_t vld2_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x1x2_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8)};
}
inline float64x1x2_t vld2_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x1x2_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8)};
}
inline int64x1x3_t vld3_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x1x3_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16)};
}
inline uint64x1x3_t vld3_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x1x3_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16)};
}
inline poly64x1x3_t vld3_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x1x3_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16)};
}
inline float64x1x3_t vld3_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x1x3_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16)};
}
inline int64x1x4_t vld4_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x1x4_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16), _b.loadNeon<64,1>(_o+24)};
}
inline uint64x1x4_t vld4_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x1x4_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16), _b.loadNeon<64,1>(_o+24)};
}
inline poly64x1x4_t vld4_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x1x4_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16), _b.loadNeon<64,1>(_o+24)};
}
inline float64x1x4_t vld4_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x1x4_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16), _b.loadNeon<64,1>(_o+24)};
}
inline int8x8x2_t vld1_s8_x2(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int8x8x2_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8)};
}
inline int8x16x2_t vld1q_s8_x2(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int8x16x2_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16)};
}
inline int16x4x2_t vld1_s16_x2(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int16x4x2_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8)};
}
inline int16x8x2_t vld1q_s16_x2(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int16x8x2_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16)};
}
inline int32x2x2_t vld1_s32_x2(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int32x2x2_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8)};
}
inline int32x4x2_t vld1q_s32_x2(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int32x4x2_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16)};
}
inline uint8x8x2_t vld1_u8_x2(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint8x8x2_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8)};
}
inline uint8x16x2_t vld1q_u8_x2(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint8x16x2_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16)};
}
inline uint16x4x2_t vld1_u16_x2(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint16x4x2_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8)};
}
inline uint16x8x2_t vld1q_u16_x2(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint16x8x2_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16)};
}
inline uint32x2x2_t vld1_u32_x2(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint32x2x2_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8)};
}
inline uint32x4x2_t vld1q_u32_x2(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint32x4x2_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16)};
}
inline float16x4x2_t vld1_f16_x2(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float16x4x2_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8)};
}
inline float16x8x2_t vld1q_f16_x2(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float16x8x2_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16)};
}
inline float32x2x2_t vld1_f32_x2(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float32x2x2_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8)};
}
inline float32x4x2_t vld1q_f32_x2(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float32x4x2_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16)};
}
inline poly8x8x2_t vld1_p8_x2(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly8x8x2_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8)};
}
inline poly8x16x2_t vld1q_p8_x2(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly8x16x2_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16)};
}
inline poly16x4x2_t vld1_p16_x2(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly16x4x2_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8)};
}
inline poly16x8x2_t vld1q_p16_x2(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly16x8x2_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16)};
}
inline int64x1x2_t vld1_s64_x2(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x1x2_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8)};
}
inline uint64x1x2_t vld1_u64_x2(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x1x2_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8)};
}
inline poly64x1x2_t vld1_p64_x2(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x1x2_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8)};
}
inline int64x2x2_t vld1q_s64_x2(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x2x2_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16)};
}
inline uint64x2x2_t vld1q_u64_x2(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x2x2_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16)};
}
inline poly64x2x2_t vld1q_p64_x2(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x2x2_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16)};
}
inline float64x1x2_t vld1_f64_x2(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x1x2_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8)};
}
inline float64x2x2_t vld1q_f64_x2(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x2x2_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16)};
}
inline mfloat8x8x2_t vld1_mf8_x2(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return mfloat8x8x2_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8)};
}
inline mfloat8x16x2_t vld1q_mf8_x2(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return mfloat8x16x2_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16)};
}
inline int8x8x3_t vld1_s8_x3(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int8x8x3_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8), _b.loadNeon<8,8>(_o+16)};
}
inline int8x16x3_t vld1q_s8_x3(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int8x16x3_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16), _b.loadNeon<8,16>(_o+32)};
}
inline int16x4x3_t vld1_s16_x3(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int16x4x3_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16)};
}
inline int16x8x3_t vld1q_s16_x3(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int16x8x3_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32)};
}
inline int32x2x3_t vld1_s32_x3(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int32x2x3_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8), _b.loadNeon<32,2>(_o+16)};
}
inline int32x4x3_t vld1q_s32_x3(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int32x4x3_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16), _b.loadNeon<32,4>(_o+32)};
}
inline uint8x8x3_t vld1_u8_x3(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint8x8x3_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8), _b.loadNeon<8,8>(_o+16)};
}
inline uint8x16x3_t vld1q_u8_x3(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint8x16x3_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16), _b.loadNeon<8,16>(_o+32)};
}
inline uint16x4x3_t vld1_u16_x3(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint16x4x3_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16)};
}
inline uint16x8x3_t vld1q_u16_x3(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint16x8x3_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32)};
}
inline uint32x2x3_t vld1_u32_x3(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint32x2x3_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8), _b.loadNeon<32,2>(_o+16)};
}
inline uint32x4x3_t vld1q_u32_x3(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint32x4x3_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16), _b.loadNeon<32,4>(_o+32)};
}
inline float16x4x3_t vld1_f16_x3(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float16x4x3_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16)};
}
inline float16x8x3_t vld1q_f16_x3(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float16x8x3_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32)};
}
inline float32x2x3_t vld1_f32_x3(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float32x2x3_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8), _b.loadNeon<32,2>(_o+16)};
}
inline float32x4x3_t vld1q_f32_x3(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float32x4x3_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16), _b.loadNeon<32,4>(_o+32)};
}
inline poly8x8x3_t vld1_p8_x3(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly8x8x3_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8), _b.loadNeon<8,8>(_o+16)};
}
inline poly8x16x3_t vld1q_p8_x3(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly8x16x3_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16), _b.loadNeon<8,16>(_o+32)};
}
inline poly16x4x3_t vld1_p16_x3(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly16x4x3_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16)};
}
inline poly16x8x3_t vld1q_p16_x3(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly16x8x3_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32)};
}
inline int64x1x3_t vld1_s64_x3(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x1x3_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16)};
}
inline uint64x1x3_t vld1_u64_x3(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x1x3_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16)};
}
inline poly64x1x3_t vld1_p64_x3(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x1x3_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16)};
}
inline int64x2x3_t vld1q_s64_x3(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x2x3_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16), _b.loadNeon<64,2>(_o+32)};
}
inline uint64x2x3_t vld1q_u64_x3(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x2x3_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16), _b.loadNeon<64,2>(_o+32)};
}
inline poly64x2x3_t vld1q_p64_x3(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x2x3_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16), _b.loadNeon<64,2>(_o+32)};
}
inline float64x1x3_t vld1_f64_x3(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x1x3_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16)};
}
inline float64x2x3_t vld1q_f64_x3(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x2x3_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16), _b.loadNeon<64,2>(_o+32)};
}
inline mfloat8x8x3_t vld1_mf8_x3(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return mfloat8x8x3_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8), _b.loadNeon<8,8>(_o+16)};
}
inline mfloat8x16x3_t vld1q_mf8_x3(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return mfloat8x16x3_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16), _b.loadNeon<8,16>(_o+32)};
}
inline int8x8x4_t vld1_s8_x4(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int8x8x4_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8), _b.loadNeon<8,8>(_o+16), _b.loadNeon<8,8>(_o+24)};
}
inline int8x16x4_t vld1q_s8_x4(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int8x16x4_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16), _b.loadNeon<8,16>(_o+32), _b.loadNeon<8,16>(_o+48)};
}
inline int16x4x4_t vld1_s16_x4(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int16x4x4_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16), _b.loadNeon<16,4>(_o+24)};
}
inline int16x8x4_t vld1q_s16_x4(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int16x8x4_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32), _b.loadNeon<16,8>(_o+48)};
}
inline int32x2x4_t vld1_s32_x4(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int32x2x4_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8), _b.loadNeon<32,2>(_o+16), _b.loadNeon<32,2>(_o+24)};
}
inline int32x4x4_t vld1q_s32_x4(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int32x4x4_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16), _b.loadNeon<32,4>(_o+32), _b.loadNeon<32,4>(_o+48)};
}
inline uint8x8x4_t vld1_u8_x4(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint8x8x4_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8), _b.loadNeon<8,8>(_o+16), _b.loadNeon<8,8>(_o+24)};
}
inline uint16x4x4_t vld1_u16_x4(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint16x4x4_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16), _b.loadNeon<16,4>(_o+24)};
}
inline uint16x8x4_t vld1q_u16_x4(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint16x8x4_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32), _b.loadNeon<16,8>(_o+48)};
}
inline uint32x2x4_t vld1_u32_x4(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint32x2x4_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8), _b.loadNeon<32,2>(_o+16), _b.loadNeon<32,2>(_o+24)};
}
inline uint32x4x4_t vld1q_u32_x4(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint32x4x4_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16), _b.loadNeon<32,4>(_o+32), _b.loadNeon<32,4>(_o+48)};
}
inline float16x4x4_t vld1_f16_x4(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float16x4x4_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16), _b.loadNeon<16,4>(_o+24)};
}
inline float16x8x4_t vld1q_f16_x4(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float16x8x4_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32), _b.loadNeon<16,8>(_o+48)};
}
inline float32x2x4_t vld1_f32_x4(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float32x2x4_t{_b.loadNeon<32,2>(_o+0), _b.loadNeon<32,2>(_o+8), _b.loadNeon<32,2>(_o+16), _b.loadNeon<32,2>(_o+24)};
}
inline float32x4x4_t vld1q_f32_x4(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float32x4x4_t{_b.loadNeon<32,4>(_o+0), _b.loadNeon<32,4>(_o+16), _b.loadNeon<32,4>(_o+32), _b.loadNeon<32,4>(_o+48)};
}
inline poly8x8x4_t vld1_p8_x4(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly8x8x4_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8), _b.loadNeon<8,8>(_o+16), _b.loadNeon<8,8>(_o+24)};
}
inline poly8x16x4_t vld1q_p8_x4(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly8x16x4_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16), _b.loadNeon<8,16>(_o+32), _b.loadNeon<8,16>(_o+48)};
}
inline poly16x4x4_t vld1_p16_x4(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly16x4x4_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16), _b.loadNeon<16,4>(_o+24)};
}
inline poly16x8x4_t vld1q_p16_x4(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly16x8x4_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32), _b.loadNeon<16,8>(_o+48)};
}
inline int64x1x4_t vld1_s64_x4(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x1x4_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16), _b.loadNeon<64,1>(_o+24)};
}
inline uint64x1x4_t vld1_u64_x4(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x1x4_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16), _b.loadNeon<64,1>(_o+24)};
}
inline poly64x1x4_t vld1_p64_x4(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x1x4_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16), _b.loadNeon<64,1>(_o+24)};
}
inline int64x2x4_t vld1q_s64_x4(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return int64x2x4_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16), _b.loadNeon<64,2>(_o+32), _b.loadNeon<64,2>(_o+48)};
}
inline uint64x2x4_t vld1q_u64_x4(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return uint64x2x4_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16), _b.loadNeon<64,2>(_o+32), _b.loadNeon<64,2>(_o+48)};
}
inline poly64x2x4_t vld1q_p64_x4(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return poly64x2x4_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16), _b.loadNeon<64,2>(_o+32), _b.loadNeon<64,2>(_o+48)};
}
inline float64x1x4_t vld1_f64_x4(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x1x4_t{_b.loadNeon<64,1>(_o+0), _b.loadNeon<64,1>(_o+8), _b.loadNeon<64,1>(_o+16), _b.loadNeon<64,1>(_o+24)};
}
inline float64x2x4_t vld1q_f64_x4(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return float64x2x4_t{_b.loadNeon<64,2>(_o+0), _b.loadNeon<64,2>(_o+16), _b.loadNeon<64,2>(_o+32), _b.loadNeon<64,2>(_o+48)};
}
inline mfloat8x8x4_t vld1_mf8_x4(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return mfloat8x8x4_t{_b.loadNeon<8,8>(_o+0), _b.loadNeon<8,8>(_o+8), _b.loadNeon<8,8>(_o+16), _b.loadNeon<8,8>(_o+24)};
}
inline mfloat8x16x4_t vld1q_mf8_x4(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return mfloat8x16x4_t{_b.loadNeon<8,16>(_o+0), _b.loadNeon<8,16>(_o+16), _b.loadNeon<8,16>(_o+32), _b.loadNeon<8,16>(_o+48)};
}
inline bfloat16x8_t vld1q_lane_bf16(bfloat16_t const * ptr, const bfloat16x8_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 16));
    return _r;
}
inline bfloat16x4x2_t vld1_bf16_x2(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return bfloat16x4x2_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8)};
}
inline bfloat16x8x2_t vld1q_bf16_x2(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return bfloat16x8x2_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16)};
}
inline bfloat16x4x3_t vld1_bf16_x3(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return bfloat16x4x3_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16)};
}
inline bfloat16x8x3_t vld1q_bf16_x3(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return bfloat16x8x3_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32)};
}
inline bfloat16x4x4_t vld1_bf16_x4(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return bfloat16x4x4_t{_b.loadNeon<16,4>(_o+0), _b.loadNeon<16,4>(_o+8), _b.loadNeon<16,4>(_o+16), _b.loadNeon<16,4>(_o+24)};
}
inline bfloat16x8x4_t vld1q_bf16_x4(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    return bfloat16x8x4_t{_b.loadNeon<16,8>(_o+0), _b.loadNeon<16,8>(_o+16), _b.loadNeon<16,8>(_o+32), _b.loadNeon<16,8>(_o+48)};
}
inline void vst1_s16(int16_t * ptr, const int16x4_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o, val);
}
inline void vst1q_s16(int16_t * ptr, const int16x8_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o, val);
}
inline void vst1_s32(int32_t * ptr, const int32x2_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o, val);
}
inline void vst1q_s32(int32_t * ptr, const int32x4_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o, val);
}
inline void vst1_s64(int64_t * ptr, const int64x1_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o, val);
}
inline void vst1q_s64(int64_t * ptr, const int64x2_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o, val);
}
inline void vst1_u64(uint64_t * ptr, const uint64x1_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o, val);
}
inline void vst1q_u64(uint64_t * ptr, const uint64x2_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o, val);
}
inline void vst1_p64(poly64_t * ptr, const poly64x1_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o, val);
}
inline void vst1q_p64(poly64_t * ptr, const poly64x2_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o, val);
}
inline void vst1_f16(float16_t * ptr, const float16x4_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o, val);
}
inline void vst1_p8(poly8_t * ptr, const poly8x8_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o, val);
}
inline void vst1q_p8(poly8_t * ptr, const poly8x16_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o, val);
}
inline void vst1_p16(poly16_t * ptr, const poly16x4_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o, val);
}
inline void vst1q_p16(poly16_t * ptr, const poly16x8_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o, val);
}
inline void vst1_f64(float64_t * ptr, const float64x1_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o, val);
}
inline void vst1q_f64(float64_t * ptr, const float64x2_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o, val);
}
inline void vst1_mf8(mfloat8_t * ptr, const mfloat8x8_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o, val);
}
inline void vst1q_mf8(mfloat8_t * ptr, const mfloat8x16_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o, val);
}
inline void vst1q_lane_s8(int8_t * ptr, const int8x16_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 8);
}
inline void vst1_lane_s16(int16_t * ptr, const int16x4_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 16);
}
inline void vst1q_lane_s16(int16_t * ptr, const int16x8_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 16);
}
inline void vst1q_lane_s32(int32_t * ptr, const int32x4_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 32);
}
inline void vst1_lane_s64(int64_t * ptr, const int64x1_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vst1q_lane_s64(int64_t * ptr, const int64x2_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vst1q_lane_u8(uint8_t * ptr, const uint8x16_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 8);
}
inline void vst1q_lane_u16(uint16_t * ptr, const uint16x8_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 16);
}
inline void vst1q_lane_u32(uint32_t * ptr, const uint32x4_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 32);
}
inline void vst1q_lane_u64(uint64_t * ptr, const uint64x2_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vst1_lane_p64(poly64_t * ptr, const poly64x1_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vst1q_lane_p64(poly64_t * ptr, const poly64x2_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vst1q_lane_f16(float16_t * ptr, const float16x8_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 16);
}
inline void vst1_lane_p8(poly8_t * ptr, const poly8x8_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 8);
}
inline void vst1q_lane_p8(poly8_t * ptr, const poly8x16_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 8);
}
inline void vst1_lane_p16(poly16_t * ptr, const poly16x4_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 16);
}
inline void vst1q_lane_p16(poly16_t * ptr, const poly16x8_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 16);
}
inline void vst1_lane_f64(float64_t * ptr, const float64x1_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vst1q_lane_f64(float64_t * ptr, const float64x2_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vst1_lane_mf8(mfloat8_t * ptr, const mfloat8x8_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 8);
}
inline void vst1q_lane_mf8(mfloat8_t * ptr, const mfloat8x16_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 8);
}
inline void vst2_s64(int64_t * ptr, int64x1x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
}
inline void vst2_u64(uint64_t * ptr, uint64x1x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
}
inline void vst2_p64(poly64_t * ptr, poly64x1x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
}
inline void vst2_f64(float64_t * ptr, float64x1x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
}
inline void vst3_s64(int64_t * ptr, int64x1x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
}
inline void vst3_u64(uint64_t * ptr, uint64x1x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
}
inline void vst3_p64(poly64_t * ptr, poly64x1x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
}
inline void vst3_f64(float64_t * ptr, float64x1x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
}
inline void vst4_s64(int64_t * ptr, int64x1x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
    _b.storeNeon<64,1>(_o+24, val.val[3]);
}
inline void vst4_u64(uint64_t * ptr, uint64x1x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
    _b.storeNeon<64,1>(_o+24, val.val[3]);
}
inline void vst4_p64(poly64_t * ptr, poly64x1x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
    _b.storeNeon<64,1>(_o+24, val.val[3]);
}
inline void vst4_f64(float64_t * ptr, float64x1x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
    _b.storeNeon<64,1>(_o+24, val.val[3]);
}
inline void vst1_s8_x2(int8_t * ptr, int8x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
}
inline void vst1q_s8_x2(int8_t * ptr, int8x16x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
}
inline void vst1_s16_x2(int16_t * ptr, int16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
}
inline void vst1q_s16_x2(int16_t * ptr, int16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
}
inline void vst1_s32_x2(int32_t * ptr, int32x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
}
inline void vst1q_s32_x2(int32_t * ptr, int32x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
}
inline void vst1_u8_x2(uint8_t * ptr, uint8x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
}
inline void vst1q_u8_x2(uint8_t * ptr, uint8x16x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
}
inline void vst1_u16_x2(uint16_t * ptr, uint16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
}
inline void vst1q_u16_x2(uint16_t * ptr, uint16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
}
inline void vst1_u32_x2(uint32_t * ptr, uint32x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
}
inline void vst1q_u32_x2(uint32_t * ptr, uint32x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
}
inline void vst1_f16_x2(float16_t * ptr, float16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
}
inline void vst1q_f16_x2(float16_t * ptr, float16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
}
inline void vst1_f32_x2(float32_t * ptr, float32x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
}
inline void vst1q_f32_x2(float32_t * ptr, float32x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
}
inline void vst1_p8_x2(poly8_t * ptr, poly8x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
}
inline void vst1q_p8_x2(poly8_t * ptr, poly8x16x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
}
inline void vst1_p16_x2(poly16_t * ptr, poly16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
}
inline void vst1q_p16_x2(poly16_t * ptr, poly16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
}
inline void vst1_s64_x2(int64_t * ptr, int64x1x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
}
inline void vst1_u64_x2(uint64_t * ptr, uint64x1x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
}
inline void vst1_p64_x2(poly64_t * ptr, poly64x1x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
}
inline void vst1q_s64_x2(int64_t * ptr, int64x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
}
inline void vst1q_u64_x2(uint64_t * ptr, uint64x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
}
inline void vst1q_p64_x2(poly64_t * ptr, poly64x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
}
inline void vst1_f64_x2(float64_t * ptr, float64x1x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
}
inline void vst1q_f64_x2(float64_t * ptr, float64x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
}
inline void vst1_mf8_x2(mfloat8_t * ptr, mfloat8x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
}
inline void vst1q_mf8_x2(mfloat8_t * ptr, mfloat8x16x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
}
inline void vst1_s8_x3(int8_t * ptr, int8x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
    _b.storeNeon<8,8>(_o+16, val.val[2]);
}
inline void vst1q_s8_x3(int8_t * ptr, int8x16x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
    _b.storeNeon<8,16>(_o+32, val.val[2]);
}
inline void vst1_s16_x3(int16_t * ptr, int16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
}
inline void vst1q_s16_x3(int16_t * ptr, int16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
}
inline void vst1_s32_x3(int32_t * ptr, int32x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
    _b.storeNeon<32,2>(_o+16, val.val[2]);
}
inline void vst1q_s32_x3(int32_t * ptr, int32x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
    _b.storeNeon<32,4>(_o+32, val.val[2]);
}
inline void vst1_u8_x3(uint8_t * ptr, uint8x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
    _b.storeNeon<8,8>(_o+16, val.val[2]);
}
inline void vst1q_u8_x3(uint8_t * ptr, uint8x16x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
    _b.storeNeon<8,16>(_o+32, val.val[2]);
}
inline void vst1_u16_x3(uint16_t * ptr, uint16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
}
inline void vst1q_u16_x3(uint16_t * ptr, uint16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
}
inline void vst1_u32_x3(uint32_t * ptr, uint32x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
    _b.storeNeon<32,2>(_o+16, val.val[2]);
}
inline void vst1q_u32_x3(uint32_t * ptr, uint32x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
    _b.storeNeon<32,4>(_o+32, val.val[2]);
}
inline void vst1_f16_x3(float16_t * ptr, float16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
}
inline void vst1q_f16_x3(float16_t * ptr, float16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
}
inline void vst1_f32_x3(float32_t * ptr, float32x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
    _b.storeNeon<32,2>(_o+16, val.val[2]);
}
inline void vst1q_f32_x3(float32_t * ptr, float32x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
    _b.storeNeon<32,4>(_o+32, val.val[2]);
}
inline void vst1_p8_x3(poly8_t * ptr, poly8x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
    _b.storeNeon<8,8>(_o+16, val.val[2]);
}
inline void vst1q_p8_x3(poly8_t * ptr, poly8x16x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
    _b.storeNeon<8,16>(_o+32, val.val[2]);
}
inline void vst1_p16_x3(poly16_t * ptr, poly16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
}
inline void vst1q_p16_x3(poly16_t * ptr, poly16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
}
inline void vst1_s64_x3(int64_t * ptr, int64x1x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
}
inline void vst1_u64_x3(uint64_t * ptr, uint64x1x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
}
inline void vst1_p64_x3(poly64_t * ptr, poly64x1x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
}
inline void vst1q_s64_x3(int64_t * ptr, int64x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
    _b.storeNeon<64,2>(_o+32, val.val[2]);
}
inline void vst1q_u64_x3(uint64_t * ptr, uint64x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
    _b.storeNeon<64,2>(_o+32, val.val[2]);
}
inline void vst1q_p64_x3(poly64_t * ptr, poly64x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
    _b.storeNeon<64,2>(_o+32, val.val[2]);
}
inline void vst1_f64_x3(float64_t * ptr, float64x1x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
}
inline void vst1q_f64_x3(float64_t * ptr, float64x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
    _b.storeNeon<64,2>(_o+32, val.val[2]);
}
inline void vst1_mf8_x3(mfloat8_t * ptr, mfloat8x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
    _b.storeNeon<8,8>(_o+16, val.val[2]);
}
inline void vst1q_mf8_x3(mfloat8_t * ptr, mfloat8x16x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
    _b.storeNeon<8,16>(_o+32, val.val[2]);
}
inline void vst1_s8_x4(int8_t * ptr, int8x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
    _b.storeNeon<8,8>(_o+16, val.val[2]);
    _b.storeNeon<8,8>(_o+24, val.val[3]);
}
inline void vst1q_s8_x4(int8_t * ptr, int8x16x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
    _b.storeNeon<8,16>(_o+32, val.val[2]);
    _b.storeNeon<8,16>(_o+48, val.val[3]);
}
inline void vst1_s16_x4(int16_t * ptr, int16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
    _b.storeNeon<16,4>(_o+24, val.val[3]);
}
inline void vst1q_s16_x4(int16_t * ptr, int16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
    _b.storeNeon<16,8>(_o+48, val.val[3]);
}
inline void vst1_s32_x4(int32_t * ptr, int32x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
    _b.storeNeon<32,2>(_o+16, val.val[2]);
    _b.storeNeon<32,2>(_o+24, val.val[3]);
}
inline void vst1q_s32_x4(int32_t * ptr, int32x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
    _b.storeNeon<32,4>(_o+32, val.val[2]);
    _b.storeNeon<32,4>(_o+48, val.val[3]);
}
inline void vst1_u8_x4(uint8_t * ptr, uint8x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
    _b.storeNeon<8,8>(_o+16, val.val[2]);
    _b.storeNeon<8,8>(_o+24, val.val[3]);
}
inline void vst1q_u8_x4(uint8_t * ptr, uint8x16x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
    _b.storeNeon<8,16>(_o+32, val.val[2]);
    _b.storeNeon<8,16>(_o+48, val.val[3]);
}
inline void vst1_u16_x4(uint16_t * ptr, uint16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
    _b.storeNeon<16,4>(_o+24, val.val[3]);
}
inline void vst1q_u16_x4(uint16_t * ptr, uint16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
    _b.storeNeon<16,8>(_o+48, val.val[3]);
}
inline void vst1_u32_x4(uint32_t * ptr, uint32x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
    _b.storeNeon<32,2>(_o+16, val.val[2]);
    _b.storeNeon<32,2>(_o+24, val.val[3]);
}
inline void vst1q_u32_x4(uint32_t * ptr, uint32x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
    _b.storeNeon<32,4>(_o+32, val.val[2]);
    _b.storeNeon<32,4>(_o+48, val.val[3]);
}
inline void vst1_f16_x4(float16_t * ptr, float16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
    _b.storeNeon<16,4>(_o+24, val.val[3]);
}
inline void vst1q_f16_x4(float16_t * ptr, float16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
    _b.storeNeon<16,8>(_o+48, val.val[3]);
}
inline void vst1_f32_x4(float32_t * ptr, float32x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,2>(_o+0, val.val[0]);
    _b.storeNeon<32,2>(_o+8, val.val[1]);
    _b.storeNeon<32,2>(_o+16, val.val[2]);
    _b.storeNeon<32,2>(_o+24, val.val[3]);
}
inline void vst1q_f32_x4(float32_t * ptr, float32x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<32,4>(_o+0, val.val[0]);
    _b.storeNeon<32,4>(_o+16, val.val[1]);
    _b.storeNeon<32,4>(_o+32, val.val[2]);
    _b.storeNeon<32,4>(_o+48, val.val[3]);
}
inline void vst1_p8_x4(poly8_t * ptr, poly8x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
    _b.storeNeon<8,8>(_o+16, val.val[2]);
    _b.storeNeon<8,8>(_o+24, val.val[3]);
}
inline void vst1q_p8_x4(poly8_t * ptr, poly8x16x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
    _b.storeNeon<8,16>(_o+32, val.val[2]);
    _b.storeNeon<8,16>(_o+48, val.val[3]);
}
inline void vst1_p16_x4(poly16_t * ptr, poly16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
    _b.storeNeon<16,4>(_o+24, val.val[3]);
}
inline void vst1q_p16_x4(poly16_t * ptr, poly16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
    _b.storeNeon<16,8>(_o+48, val.val[3]);
}
inline void vst1_s64_x4(int64_t * ptr, int64x1x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
    _b.storeNeon<64,1>(_o+24, val.val[3]);
}
inline void vst1_u64_x4(uint64_t * ptr, uint64x1x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
    _b.storeNeon<64,1>(_o+24, val.val[3]);
}
inline void vst1_p64_x4(poly64_t * ptr, poly64x1x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
    _b.storeNeon<64,1>(_o+24, val.val[3]);
}
inline void vst1q_s64_x4(int64_t * ptr, int64x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
    _b.storeNeon<64,2>(_o+32, val.val[2]);
    _b.storeNeon<64,2>(_o+48, val.val[3]);
}
inline void vst1q_u64_x4(uint64_t * ptr, uint64x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
    _b.storeNeon<64,2>(_o+32, val.val[2]);
    _b.storeNeon<64,2>(_o+48, val.val[3]);
}
inline void vst1q_p64_x4(poly64_t * ptr, poly64x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
    _b.storeNeon<64,2>(_o+32, val.val[2]);
    _b.storeNeon<64,2>(_o+48, val.val[3]);
}
inline void vst1_f64_x4(float64_t * ptr, float64x1x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,1>(_o+0, val.val[0]);
    _b.storeNeon<64,1>(_o+8, val.val[1]);
    _b.storeNeon<64,1>(_o+16, val.val[2]);
    _b.storeNeon<64,1>(_o+24, val.val[3]);
}
inline void vst1q_f64_x4(float64_t * ptr, float64x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<64,2>(_o+0, val.val[0]);
    _b.storeNeon<64,2>(_o+16, val.val[1]);
    _b.storeNeon<64,2>(_o+32, val.val[2]);
    _b.storeNeon<64,2>(_o+48, val.val[3]);
}
inline void vst1_mf8_x4(int8_t * ptr, int8x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,8>(_o+0, val.val[0]);
    _b.storeNeon<8,8>(_o+8, val.val[1]);
    _b.storeNeon<8,8>(_o+16, val.val[2]);
    _b.storeNeon<8,8>(_o+24, val.val[3]);
}
inline void vst1q_mf8_x4(int8_t * ptr, int8x16x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<8,16>(_o+0, val.val[0]);
    _b.storeNeon<8,16>(_o+16, val.val[1]);
    _b.storeNeon<8,16>(_o+32, val.val[2]);
    _b.storeNeon<8,16>(_o+48, val.val[3]);
}
inline void vst1q_bf16(bfloat16_t * ptr, const bfloat16x8_t& val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o, val);
}
inline void vst1q_lane_bf16(bfloat16_t * ptr, const bfloat16x8_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 16);
}
inline void vst1_bf16_x2(bfloat16_t * ptr, bfloat16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
}
inline void vst1q_bf16_x2(bfloat16_t * ptr, bfloat16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
}
inline void vst1_bf16_x3(bfloat16_t * ptr, bfloat16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
}
inline void vst1q_bf16_x3(bfloat16_t * ptr, bfloat16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
}
inline void vst1_bf16_x4(bfloat16_t * ptr, bfloat16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,4>(_o+0, val.val[0]);
    _b.storeNeon<16,4>(_o+8, val.val[1]);
    _b.storeNeon<16,4>(_o+16, val.val[2]);
    _b.storeNeon<16,4>(_o+24, val.val[3]);
}
inline void vst1q_bf16_x4(bfloat16_t * ptr, bfloat16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeNeon<16,8>(_o+0, val.val[0]);
    _b.storeNeon<16,8>(_o+16, val.val[1]);
    _b.storeNeon<16,8>(_o+32, val.val[2]);
    _b.storeNeon<16,8>(_o+48, val.val[3]);
}
inline int8x8x2_t vld2_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+2,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+14,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+15,8)};
    return int8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline int8x16x2_t vld2q_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+2,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+30,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+31,8)};
    return int8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline int16x4x2_t vld2_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16)};
    return int16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline int16x8x2_t vld2q_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+28,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+30,16)};
    return int16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int32x2x2_t vld2_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+8,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+12,32)};
    return int32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline int32x4x2_t vld2q_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+8,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+24,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+12,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+28,32)};
    return int32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline uint8x8x2_t vld2_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+2,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+14,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+15,8)};
    return uint8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline uint8x16x2_t vld2q_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+2,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+30,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+31,8)};
    return uint8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline uint16x4x2_t vld2_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16)};
    return uint16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline uint16x8x2_t vld2q_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+28,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+30,16)};
    return uint16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline uint32x2x2_t vld2_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+8,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+12,32)};
    return uint32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline uint32x4x2_t vld2q_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+8,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+24,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+12,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+28,32)};
    return uint32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline float16x4x2_t vld2_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16)};
    return float16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline float16x8x2_t vld2q_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+28,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+30,16)};
    return float16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline float32x2x2_t vld2_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+8,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+12,32)};
    return float32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline float32x4x2_t vld2q_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+8,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+24,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+12,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+28,32)};
    return float32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline poly8x8x2_t vld2_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+2,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+14,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+15,8)};
    return poly8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline poly8x16x2_t vld2q_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+2,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+30,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+31,8)};
    return poly8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline poly16x4x2_t vld2_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16)};
    return poly16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline poly16x8x2_t vld2q_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+28,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+30,16)};
    return poly16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int64x2x2_t vld2q_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+16,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+24,64)};
    return int64x2x2_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1)};
}
inline uint64x2x2_t vld2q_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+16,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+24,64)};
    return uint64x2x2_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1)};
}
inline poly64x2x2_t vld2q_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+16,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+24,64)};
    return poly64x2x2_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1)};
}
inline float64x2x2_t vld2q_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+16,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+24,64)};
    return float64x2x2_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1)};
}
inline mfloat8x8x2_t vld2_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+2,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+14,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+15,8)};
    return mfloat8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline mfloat8x16x2_t vld2q_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+2,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+30,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+31,8)};
    return mfloat8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline int16x4x2_t vld2_lane_s16(int16_t const * ptr, int16x4x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline int16x8x2_t vld2q_lane_s16(int16_t const * ptr, int16x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline int32x2x2_t vld2_lane_s32(int32_t const * ptr, int32x2x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    return _r;
}
inline int32x4x2_t vld2q_lane_s32(int32_t const * ptr, int32x4x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    return _r;
}
inline uint16x4x2_t vld2_lane_u16(uint16_t const * ptr, uint16x4x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline uint16x8x2_t vld2q_lane_u16(uint16_t const * ptr, uint16x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline uint32x2x2_t vld2_lane_u32(uint32_t const * ptr, uint32x2x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    return _r;
}
inline uint32x4x2_t vld2q_lane_u32(uint32_t const * ptr, uint32x4x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    return _r;
}
inline float16x4x2_t vld2_lane_f16(float16_t const * ptr, float16x4x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline float16x8x2_t vld2q_lane_f16(float16_t const * ptr, float16x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline float32x2x2_t vld2_lane_f32(float32_t const * ptr, float32x2x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    return _r;
}
inline float32x4x2_t vld2q_lane_f32(float32_t const * ptr, float32x4x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    return _r;
}
inline poly16x4x2_t vld2_lane_p16(poly16_t const * ptr, poly16x4x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline poly16x8x2_t vld2q_lane_p16(poly16_t const * ptr, poly16x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline int8x8x2_t vld2_lane_s8(int8_t const * ptr, int8x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    return _r;
}
inline uint8x8x2_t vld2_lane_u8(uint8_t const * ptr, uint8x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    return _r;
}
inline poly8x8x2_t vld2_lane_p8(poly8_t const * ptr, poly8x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    return _r;
}
inline int8x16x2_t vld2q_lane_s8(int8_t const * ptr, int8x16x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    return _r;
}
inline uint8x16x2_t vld2q_lane_u8(uint8_t const * ptr, uint8x16x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    return _r;
}
inline poly8x16x2_t vld2q_lane_p8(poly8_t const * ptr, poly8x16x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    return _r;
}
inline int64x1x2_t vld2_lane_s64(int64_t const * ptr, int64x1x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    return _r;
}
inline int64x2x2_t vld2q_lane_s64(int64_t const * ptr, int64x2x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    return _r;
}
inline uint64x1x2_t vld2_lane_u64(uint64_t const * ptr, uint64x1x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    return _r;
}
inline uint64x2x2_t vld2q_lane_u64(uint64_t const * ptr, uint64x2x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    return _r;
}
inline poly64x1x2_t vld2_lane_p64(poly64_t const * ptr, poly64x1x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    return _r;
}
inline poly64x2x2_t vld2q_lane_p64(poly64_t const * ptr, poly64x2x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    return _r;
}
inline float64x1x2_t vld2_lane_f64(float64_t const * ptr, float64x1x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    return _r;
}
inline float64x2x2_t vld2q_lane_f64(float64_t const * ptr, float64x2x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    return _r;
}
inline mfloat8x8x2_t vld2_lane_mf8(mfloat8_t const * ptr, mfloat8x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    return _r;
}
inline mfloat8x16x2_t vld2q_lane_mf8(mfloat8_t const * ptr, mfloat8x16x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    return _r;
}
inline bfloat16x4x2_t vld2_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16)};
    return bfloat16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline bfloat16x8x2_t vld2q_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+4,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+28,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+30,16)};
    return bfloat16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline bfloat16x4x2_t vld2_lane_bf16(bfloat16_t const * ptr, bfloat16x4x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline bfloat16x8x2_t vld2q_lane_bf16(bfloat16_t const * ptr, bfloat16x8x2_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    return _r;
}
inline int8x8x3_t vld3_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+21,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+22,8)};
    std::array<Term,8> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+23,8)};
    return int8x8x3_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2)};
}
inline int8x16x3_t vld3q_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+30,8), _b.loadScalar(_o+33,8), _b.loadScalar(_o+36,8), _b.loadScalar(_o+39,8), _b.loadScalar(_o+42,8), _b.loadScalar(_o+45,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+31,8), _b.loadScalar(_o+34,8), _b.loadScalar(_o+37,8), _b.loadScalar(_o+40,8), _b.loadScalar(_o+43,8), _b.loadScalar(_o+46,8)};
    std::array<Term,16> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+32,8), _b.loadScalar(_o+35,8), _b.loadScalar(_o+38,8), _b.loadScalar(_o+41,8), _b.loadScalar(_o+44,8), _b.loadScalar(_o+47,8)};
    return int8x16x3_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2)};
}
inline int16x4x3_t vld3_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16)};
    return int16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline int16x8x3_t vld3q_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+42,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+44,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+46,16)};
    return int16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline int32x2x3_t vld3_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+12,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+16,32)};
    std::array<Term,2> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+20,32)};
    return int32x2x3_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2)};
}
inline int32x4x3_t vld3q_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+12,32), _b.loadScalar(_o+24,32), _b.loadScalar(_o+36,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+28,32), _b.loadScalar(_o+40,32)};
    std::array<Term,4> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+32,32), _b.loadScalar(_o+44,32)};
    return int32x4x3_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2)};
}
inline uint8x8x3_t vld3_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+21,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+22,8)};
    std::array<Term,8> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+23,8)};
    return uint8x8x3_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2)};
}
inline uint8x16x3_t vld3q_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+30,8), _b.loadScalar(_o+33,8), _b.loadScalar(_o+36,8), _b.loadScalar(_o+39,8), _b.loadScalar(_o+42,8), _b.loadScalar(_o+45,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+31,8), _b.loadScalar(_o+34,8), _b.loadScalar(_o+37,8), _b.loadScalar(_o+40,8), _b.loadScalar(_o+43,8), _b.loadScalar(_o+46,8)};
    std::array<Term,16> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+32,8), _b.loadScalar(_o+35,8), _b.loadScalar(_o+38,8), _b.loadScalar(_o+41,8), _b.loadScalar(_o+44,8), _b.loadScalar(_o+47,8)};
    return uint8x16x3_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2)};
}
inline uint16x4x3_t vld3_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16)};
    return uint16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline uint16x8x3_t vld3q_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+42,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+44,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+46,16)};
    return uint16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline uint32x2x3_t vld3_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+12,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+16,32)};
    std::array<Term,2> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+20,32)};
    return uint32x2x3_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2)};
}
inline uint32x4x3_t vld3q_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+12,32), _b.loadScalar(_o+24,32), _b.loadScalar(_o+36,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+28,32), _b.loadScalar(_o+40,32)};
    std::array<Term,4> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+32,32), _b.loadScalar(_o+44,32)};
    return uint32x4x3_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2)};
}
inline float16x4x3_t vld3_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16)};
    return float16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline float16x8x3_t vld3q_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+42,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+44,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+46,16)};
    return float16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline float32x2x3_t vld3_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+12,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+16,32)};
    std::array<Term,2> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+20,32)};
    return float32x2x3_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2)};
}
inline float32x4x3_t vld3q_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+12,32), _b.loadScalar(_o+24,32), _b.loadScalar(_o+36,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+28,32), _b.loadScalar(_o+40,32)};
    std::array<Term,4> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+32,32), _b.loadScalar(_o+44,32)};
    return float32x4x3_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2)};
}
inline poly8x8x3_t vld3_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+21,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+22,8)};
    std::array<Term,8> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+23,8)};
    return poly8x8x3_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2)};
}
inline poly8x16x3_t vld3q_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+30,8), _b.loadScalar(_o+33,8), _b.loadScalar(_o+36,8), _b.loadScalar(_o+39,8), _b.loadScalar(_o+42,8), _b.loadScalar(_o+45,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+31,8), _b.loadScalar(_o+34,8), _b.loadScalar(_o+37,8), _b.loadScalar(_o+40,8), _b.loadScalar(_o+43,8), _b.loadScalar(_o+46,8)};
    std::array<Term,16> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+32,8), _b.loadScalar(_o+35,8), _b.loadScalar(_o+38,8), _b.loadScalar(_o+41,8), _b.loadScalar(_o+44,8), _b.loadScalar(_o+47,8)};
    return poly8x16x3_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2)};
}
inline poly16x4x3_t vld3_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16)};
    return poly16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline poly16x8x3_t vld3q_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+42,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+44,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+46,16)};
    return poly16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline int64x2x3_t vld3q_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+24,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+32,64)};
    std::array<Term,2> _a2={_b.loadScalar(_o+16,64), _b.loadScalar(_o+40,64)};
    return int64x2x3_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2)};
}
inline uint64x2x3_t vld3q_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+24,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+32,64)};
    std::array<Term,2> _a2={_b.loadScalar(_o+16,64), _b.loadScalar(_o+40,64)};
    return uint64x2x3_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2)};
}
inline poly64x2x3_t vld3q_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+24,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+32,64)};
    std::array<Term,2> _a2={_b.loadScalar(_o+16,64), _b.loadScalar(_o+40,64)};
    return poly64x2x3_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2)};
}
inline float64x2x3_t vld3q_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+24,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+32,64)};
    std::array<Term,2> _a2={_b.loadScalar(_o+16,64), _b.loadScalar(_o+40,64)};
    return float64x2x3_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2)};
}
inline mfloat8x8x3_t vld3_mf8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+21,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+22,8)};
    std::array<Term,8> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+23,8)};
    return mfloat8x8x3_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2)};
}
inline mfloat8x16x3_t vld3q_mf8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+3,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+30,8), _b.loadScalar(_o+33,8), _b.loadScalar(_o+36,8), _b.loadScalar(_o+39,8), _b.loadScalar(_o+42,8), _b.loadScalar(_o+45,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+31,8), _b.loadScalar(_o+34,8), _b.loadScalar(_o+37,8), _b.loadScalar(_o+40,8), _b.loadScalar(_o+43,8), _b.loadScalar(_o+46,8)};
    std::array<Term,16> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+32,8), _b.loadScalar(_o+35,8), _b.loadScalar(_o+38,8), _b.loadScalar(_o+41,8), _b.loadScalar(_o+44,8), _b.loadScalar(_o+47,8)};
    return mfloat8x16x3_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2)};
}
inline int16x4x3_t vld3_lane_s16(int16_t const * ptr, int16x4x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline int16x8x3_t vld3q_lane_s16(int16_t const * ptr, int16x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline int32x2x3_t vld3_lane_s32(int32_t const * ptr, int32x2x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    return _r;
}
inline int32x4x3_t vld3q_lane_s32(int32_t const * ptr, int32x4x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    return _r;
}
inline uint16x4x3_t vld3_lane_u16(uint16_t const * ptr, uint16x4x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline uint16x8x3_t vld3q_lane_u16(uint16_t const * ptr, uint16x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline uint32x2x3_t vld3_lane_u32(uint32_t const * ptr, uint32x2x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    return _r;
}
inline uint32x4x3_t vld3q_lane_u32(uint32_t const * ptr, uint32x4x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    return _r;
}
inline float16x4x3_t vld3_lane_f16(float16_t const * ptr, float16x4x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline float16x8x3_t vld3q_lane_f16(float16_t const * ptr, float16x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline float32x2x3_t vld3_lane_f32(float32_t const * ptr, float32x2x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    return _r;
}
inline float32x4x3_t vld3q_lane_f32(float32_t const * ptr, float32x4x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    return _r;
}
inline poly16x4x3_t vld3_lane_p16(poly16_t const * ptr, poly16x4x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline poly16x8x3_t vld3q_lane_p16(poly16_t const * ptr, poly16x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline int8x8x3_t vld3_lane_s8(int8_t const * ptr, int8x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    return _r;
}
inline uint8x8x3_t vld3_lane_u8(uint8_t const * ptr, uint8x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    return _r;
}
inline poly8x8x3_t vld3_lane_p8(poly8_t const * ptr, poly8x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    return _r;
}
inline int8x16x3_t vld3q_lane_s8(int8_t const * ptr, int8x16x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    return _r;
}
inline uint8x16x3_t vld3q_lane_u8(uint8_t const * ptr, uint8x16x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    return _r;
}
inline poly8x16x3_t vld3q_lane_p8(poly8_t const * ptr, poly8x16x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    return _r;
}
inline int64x1x3_t vld3_lane_s64(int64_t const * ptr, int64x1x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    return _r;
}
inline int64x2x3_t vld3q_lane_s64(int64_t const * ptr, int64x2x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    return _r;
}
inline uint64x1x3_t vld3_lane_u64(uint64_t const * ptr, uint64x1x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    return _r;
}
inline uint64x2x3_t vld3q_lane_u64(uint64_t const * ptr, uint64x2x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    return _r;
}
inline poly64x1x3_t vld3_lane_p64(poly64_t const * ptr, poly64x1x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    return _r;
}
inline poly64x2x3_t vld3q_lane_p64(poly64_t const * ptr, poly64x2x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    return _r;
}
inline float64x1x3_t vld3_lane_f64(float64_t const * ptr, float64x1x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    return _r;
}
inline float64x2x3_t vld3q_lane_f64(float64_t const * ptr, float64x2x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    return _r;
}
inline mfloat8x8x3_t vld3_lane_mf8(mfloat8_t const * ptr, mfloat8x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    return _r;
}
inline mfloat8x16x3_t vld3q_lane_mf8(mfloat8_t const * ptr, mfloat8x16x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    return _r;
}
inline bfloat16x4x3_t vld3_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16)};
    return bfloat16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline bfloat16x8x3_t vld3q_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+6,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+42,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+44,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+46,16)};
    return bfloat16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline bfloat16x4x3_t vld3_lane_bf16(bfloat16_t const * ptr, bfloat16x4x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline bfloat16x8x3_t vld3q_lane_bf16(bfloat16_t const * ptr, bfloat16x8x3_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    return _r;
}
inline int8x8x4_t vld4_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+28,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+29,8)};
    std::array<Term,8> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+30,8)};
    std::array<Term,8> _a3={_b.loadScalar(_o+3,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+31,8)};
    return int8x8x4_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2), NeonVector<8,8>(tm,_a3)};
}
inline int8x16x4_t vld4q_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+32,8), _b.loadScalar(_o+36,8), _b.loadScalar(_o+40,8), _b.loadScalar(_o+44,8), _b.loadScalar(_o+48,8), _b.loadScalar(_o+52,8), _b.loadScalar(_o+56,8), _b.loadScalar(_o+60,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+33,8), _b.loadScalar(_o+37,8), _b.loadScalar(_o+41,8), _b.loadScalar(_o+45,8), _b.loadScalar(_o+49,8), _b.loadScalar(_o+53,8), _b.loadScalar(_o+57,8), _b.loadScalar(_o+61,8)};
    std::array<Term,16> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+30,8), _b.loadScalar(_o+34,8), _b.loadScalar(_o+38,8), _b.loadScalar(_o+42,8), _b.loadScalar(_o+46,8), _b.loadScalar(_o+50,8), _b.loadScalar(_o+54,8), _b.loadScalar(_o+58,8), _b.loadScalar(_o+62,8)};
    std::array<Term,16> _a3={_b.loadScalar(_o+3,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+31,8), _b.loadScalar(_o+35,8), _b.loadScalar(_o+39,8), _b.loadScalar(_o+43,8), _b.loadScalar(_o+47,8), _b.loadScalar(_o+51,8), _b.loadScalar(_o+55,8), _b.loadScalar(_o+59,8), _b.loadScalar(_o+63,8)};
    return int8x16x4_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2), NeonVector<8,16>(tm,_a3)};
}
inline int16x4x4_t vld4_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16)};
    std::array<Term,4> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16)};
    return int16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline int16x8x4_t vld4q_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+48,16), _b.loadScalar(_o+56,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+42,16), _b.loadScalar(_o+50,16), _b.loadScalar(_o+58,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+44,16), _b.loadScalar(_o+52,16), _b.loadScalar(_o+60,16)};
    std::array<Term,8> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+46,16), _b.loadScalar(_o+54,16), _b.loadScalar(_o+62,16)};
    return int16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline int32x2x4_t vld4_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+16,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+20,32)};
    std::array<Term,2> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+24,32)};
    std::array<Term,2> _a3={_b.loadScalar(_o+12,32), _b.loadScalar(_o+28,32)};
    return int32x2x4_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2), NeonVector<32,2>(tm,_a3)};
}
inline int32x4x4_t vld4q_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+32,32), _b.loadScalar(_o+48,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+36,32), _b.loadScalar(_o+52,32)};
    std::array<Term,4> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+24,32), _b.loadScalar(_o+40,32), _b.loadScalar(_o+56,32)};
    std::array<Term,4> _a3={_b.loadScalar(_o+12,32), _b.loadScalar(_o+28,32), _b.loadScalar(_o+44,32), _b.loadScalar(_o+60,32)};
    return int32x4x4_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2), NeonVector<32,4>(tm,_a3)};
}
inline uint8x8x4_t vld4_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+28,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+29,8)};
    std::array<Term,8> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+30,8)};
    std::array<Term,8> _a3={_b.loadScalar(_o+3,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+31,8)};
    return uint8x8x4_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2), NeonVector<8,8>(tm,_a3)};
}
inline uint8x16x4_t vld4q_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+32,8), _b.loadScalar(_o+36,8), _b.loadScalar(_o+40,8), _b.loadScalar(_o+44,8), _b.loadScalar(_o+48,8), _b.loadScalar(_o+52,8), _b.loadScalar(_o+56,8), _b.loadScalar(_o+60,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+33,8), _b.loadScalar(_o+37,8), _b.loadScalar(_o+41,8), _b.loadScalar(_o+45,8), _b.loadScalar(_o+49,8), _b.loadScalar(_o+53,8), _b.loadScalar(_o+57,8), _b.loadScalar(_o+61,8)};
    std::array<Term,16> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+30,8), _b.loadScalar(_o+34,8), _b.loadScalar(_o+38,8), _b.loadScalar(_o+42,8), _b.loadScalar(_o+46,8), _b.loadScalar(_o+50,8), _b.loadScalar(_o+54,8), _b.loadScalar(_o+58,8), _b.loadScalar(_o+62,8)};
    std::array<Term,16> _a3={_b.loadScalar(_o+3,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+31,8), _b.loadScalar(_o+35,8), _b.loadScalar(_o+39,8), _b.loadScalar(_o+43,8), _b.loadScalar(_o+47,8), _b.loadScalar(_o+51,8), _b.loadScalar(_o+55,8), _b.loadScalar(_o+59,8), _b.loadScalar(_o+63,8)};
    return uint8x16x4_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2), NeonVector<8,16>(tm,_a3)};
}
inline uint16x4x4_t vld4_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16)};
    std::array<Term,4> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16)};
    return uint16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline uint16x8x4_t vld4q_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+48,16), _b.loadScalar(_o+56,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+42,16), _b.loadScalar(_o+50,16), _b.loadScalar(_o+58,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+44,16), _b.loadScalar(_o+52,16), _b.loadScalar(_o+60,16)};
    std::array<Term,8> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+46,16), _b.loadScalar(_o+54,16), _b.loadScalar(_o+62,16)};
    return uint16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline uint32x2x4_t vld4_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+16,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+20,32)};
    std::array<Term,2> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+24,32)};
    std::array<Term,2> _a3={_b.loadScalar(_o+12,32), _b.loadScalar(_o+28,32)};
    return uint32x2x4_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2), NeonVector<32,2>(tm,_a3)};
}
inline uint32x4x4_t vld4q_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+32,32), _b.loadScalar(_o+48,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+36,32), _b.loadScalar(_o+52,32)};
    std::array<Term,4> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+24,32), _b.loadScalar(_o+40,32), _b.loadScalar(_o+56,32)};
    std::array<Term,4> _a3={_b.loadScalar(_o+12,32), _b.loadScalar(_o+28,32), _b.loadScalar(_o+44,32), _b.loadScalar(_o+60,32)};
    return uint32x4x4_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2), NeonVector<32,4>(tm,_a3)};
}
inline float16x4x4_t vld4_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16)};
    std::array<Term,4> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16)};
    return float16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline float16x8x4_t vld4q_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+48,16), _b.loadScalar(_o+56,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+42,16), _b.loadScalar(_o+50,16), _b.loadScalar(_o+58,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+44,16), _b.loadScalar(_o+52,16), _b.loadScalar(_o+60,16)};
    std::array<Term,8> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+46,16), _b.loadScalar(_o+54,16), _b.loadScalar(_o+62,16)};
    return float16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline float32x2x4_t vld4_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+16,32)};
    std::array<Term,2> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+20,32)};
    std::array<Term,2> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+24,32)};
    std::array<Term,2> _a3={_b.loadScalar(_o+12,32), _b.loadScalar(_o+28,32)};
    return float32x2x4_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2), NeonVector<32,2>(tm,_a3)};
}
inline float32x4x4_t vld4q_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,32), _b.loadScalar(_o+16,32), _b.loadScalar(_o+32,32), _b.loadScalar(_o+48,32)};
    std::array<Term,4> _a1={_b.loadScalar(_o+4,32), _b.loadScalar(_o+20,32), _b.loadScalar(_o+36,32), _b.loadScalar(_o+52,32)};
    std::array<Term,4> _a2={_b.loadScalar(_o+8,32), _b.loadScalar(_o+24,32), _b.loadScalar(_o+40,32), _b.loadScalar(_o+56,32)};
    std::array<Term,4> _a3={_b.loadScalar(_o+12,32), _b.loadScalar(_o+28,32), _b.loadScalar(_o+44,32), _b.loadScalar(_o+60,32)};
    return float32x4x4_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2), NeonVector<32,4>(tm,_a3)};
}
inline poly8x8x4_t vld4_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+28,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+29,8)};
    std::array<Term,8> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+30,8)};
    std::array<Term,8> _a3={_b.loadScalar(_o+3,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+31,8)};
    return poly8x8x4_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2), NeonVector<8,8>(tm,_a3)};
}
inline poly8x16x4_t vld4q_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+32,8), _b.loadScalar(_o+36,8), _b.loadScalar(_o+40,8), _b.loadScalar(_o+44,8), _b.loadScalar(_o+48,8), _b.loadScalar(_o+52,8), _b.loadScalar(_o+56,8), _b.loadScalar(_o+60,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+33,8), _b.loadScalar(_o+37,8), _b.loadScalar(_o+41,8), _b.loadScalar(_o+45,8), _b.loadScalar(_o+49,8), _b.loadScalar(_o+53,8), _b.loadScalar(_o+57,8), _b.loadScalar(_o+61,8)};
    std::array<Term,16> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+30,8), _b.loadScalar(_o+34,8), _b.loadScalar(_o+38,8), _b.loadScalar(_o+42,8), _b.loadScalar(_o+46,8), _b.loadScalar(_o+50,8), _b.loadScalar(_o+54,8), _b.loadScalar(_o+58,8), _b.loadScalar(_o+62,8)};
    std::array<Term,16> _a3={_b.loadScalar(_o+3,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+31,8), _b.loadScalar(_o+35,8), _b.loadScalar(_o+39,8), _b.loadScalar(_o+43,8), _b.loadScalar(_o+47,8), _b.loadScalar(_o+51,8), _b.loadScalar(_o+55,8), _b.loadScalar(_o+59,8), _b.loadScalar(_o+63,8)};
    return poly8x16x4_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2), NeonVector<8,16>(tm,_a3)};
}
inline poly16x4x4_t vld4_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16)};
    std::array<Term,4> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16)};
    return poly16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline poly16x8x4_t vld4q_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+48,16), _b.loadScalar(_o+56,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+42,16), _b.loadScalar(_o+50,16), _b.loadScalar(_o+58,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+44,16), _b.loadScalar(_o+52,16), _b.loadScalar(_o+60,16)};
    std::array<Term,8> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+46,16), _b.loadScalar(_o+54,16), _b.loadScalar(_o+62,16)};
    return poly16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline int64x2x4_t vld4q_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+32,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+40,64)};
    std::array<Term,2> _a2={_b.loadScalar(_o+16,64), _b.loadScalar(_o+48,64)};
    std::array<Term,2> _a3={_b.loadScalar(_o+24,64), _b.loadScalar(_o+56,64)};
    return int64x2x4_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2), NeonVector<64,2>(tm,_a3)};
}
inline uint64x2x4_t vld4q_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+32,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+40,64)};
    std::array<Term,2> _a2={_b.loadScalar(_o+16,64), _b.loadScalar(_o+48,64)};
    std::array<Term,2> _a3={_b.loadScalar(_o+24,64), _b.loadScalar(_o+56,64)};
    return uint64x2x4_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2), NeonVector<64,2>(tm,_a3)};
}
inline poly64x2x4_t vld4q_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+32,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+40,64)};
    std::array<Term,2> _a2={_b.loadScalar(_o+16,64), _b.loadScalar(_o+48,64)};
    std::array<Term,2> _a3={_b.loadScalar(_o+24,64), _b.loadScalar(_o+56,64)};
    return poly64x2x4_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2), NeonVector<64,2>(tm,_a3)};
}
inline float64x2x4_t vld4q_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,2> _a0={_b.loadScalar(_o+0,64), _b.loadScalar(_o+32,64)};
    std::array<Term,2> _a1={_b.loadScalar(_o+8,64), _b.loadScalar(_o+40,64)};
    std::array<Term,2> _a2={_b.loadScalar(_o+16,64), _b.loadScalar(_o+48,64)};
    std::array<Term,2> _a3={_b.loadScalar(_o+24,64), _b.loadScalar(_o+56,64)};
    return float64x2x4_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2), NeonVector<64,2>(tm,_a3)};
}
inline mfloat8x8x4_t vld4_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+28,8)};
    std::array<Term,8> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+29,8)};
    std::array<Term,8> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+30,8)};
    std::array<Term,8> _a3={_b.loadScalar(_o+3,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+31,8)};
    return mfloat8x8x4_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2), NeonVector<8,8>(tm,_a3)};
}
inline mfloat8x16x4_t vld4q_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,16> _a0={_b.loadScalar(_o+0,8), _b.loadScalar(_o+4,8), _b.loadScalar(_o+8,8), _b.loadScalar(_o+12,8), _b.loadScalar(_o+16,8), _b.loadScalar(_o+20,8), _b.loadScalar(_o+24,8), _b.loadScalar(_o+28,8), _b.loadScalar(_o+32,8), _b.loadScalar(_o+36,8), _b.loadScalar(_o+40,8), _b.loadScalar(_o+44,8), _b.loadScalar(_o+48,8), _b.loadScalar(_o+52,8), _b.loadScalar(_o+56,8), _b.loadScalar(_o+60,8)};
    std::array<Term,16> _a1={_b.loadScalar(_o+1,8), _b.loadScalar(_o+5,8), _b.loadScalar(_o+9,8), _b.loadScalar(_o+13,8), _b.loadScalar(_o+17,8), _b.loadScalar(_o+21,8), _b.loadScalar(_o+25,8), _b.loadScalar(_o+29,8), _b.loadScalar(_o+33,8), _b.loadScalar(_o+37,8), _b.loadScalar(_o+41,8), _b.loadScalar(_o+45,8), _b.loadScalar(_o+49,8), _b.loadScalar(_o+53,8), _b.loadScalar(_o+57,8), _b.loadScalar(_o+61,8)};
    std::array<Term,16> _a2={_b.loadScalar(_o+2,8), _b.loadScalar(_o+6,8), _b.loadScalar(_o+10,8), _b.loadScalar(_o+14,8), _b.loadScalar(_o+18,8), _b.loadScalar(_o+22,8), _b.loadScalar(_o+26,8), _b.loadScalar(_o+30,8), _b.loadScalar(_o+34,8), _b.loadScalar(_o+38,8), _b.loadScalar(_o+42,8), _b.loadScalar(_o+46,8), _b.loadScalar(_o+50,8), _b.loadScalar(_o+54,8), _b.loadScalar(_o+58,8), _b.loadScalar(_o+62,8)};
    std::array<Term,16> _a3={_b.loadScalar(_o+3,8), _b.loadScalar(_o+7,8), _b.loadScalar(_o+11,8), _b.loadScalar(_o+15,8), _b.loadScalar(_o+19,8), _b.loadScalar(_o+23,8), _b.loadScalar(_o+27,8), _b.loadScalar(_o+31,8), _b.loadScalar(_o+35,8), _b.loadScalar(_o+39,8), _b.loadScalar(_o+43,8), _b.loadScalar(_o+47,8), _b.loadScalar(_o+51,8), _b.loadScalar(_o+55,8), _b.loadScalar(_o+59,8), _b.loadScalar(_o+63,8)};
    return mfloat8x16x4_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2), NeonVector<8,16>(tm,_a3)};
}
inline int16x4x4_t vld4_lane_s16(int16_t const * ptr, int16x4x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline int16x8x4_t vld4q_lane_s16(int16_t const * ptr, int16x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline int32x2x4_t vld4_lane_s32(int32_t const * ptr, int32x2x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    _r.val[3].setLane(lane, _b.loadScalar(_o+12, 32));
    return _r;
}
inline int32x4x4_t vld4q_lane_s32(int32_t const * ptr, int32x4x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    _r.val[3].setLane(lane, _b.loadScalar(_o+12, 32));
    return _r;
}
inline uint16x4x4_t vld4_lane_u16(uint16_t const * ptr, uint16x4x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline uint16x8x4_t vld4q_lane_u16(uint16_t const * ptr, uint16x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline uint32x2x4_t vld4_lane_u32(uint32_t const * ptr, uint32x2x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    _r.val[3].setLane(lane, _b.loadScalar(_o+12, 32));
    return _r;
}
inline uint32x4x4_t vld4q_lane_u32(uint32_t const * ptr, uint32x4x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    _r.val[3].setLane(lane, _b.loadScalar(_o+12, 32));
    return _r;
}
inline float16x4x4_t vld4_lane_f16(float16_t const * ptr, float16x4x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline float16x8x4_t vld4q_lane_f16(float16_t const * ptr, float16x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline float32x2x4_t vld4_lane_f32(float32_t const * ptr, float32x2x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    _r.val[3].setLane(lane, _b.loadScalar(_o+12, 32));
    return _r;
}
inline float32x4x4_t vld4q_lane_f32(float32_t const * ptr, float32x4x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 32));
    _r.val[1].setLane(lane, _b.loadScalar(_o+4, 32));
    _r.val[2].setLane(lane, _b.loadScalar(_o+8, 32));
    _r.val[3].setLane(lane, _b.loadScalar(_o+12, 32));
    return _r;
}
inline poly16x4x4_t vld4_lane_p16(poly16_t const * ptr, poly16x4x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline poly16x8x4_t vld4q_lane_p16(poly16_t const * ptr, poly16x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline int8x8x4_t vld4_lane_s8(int8_t const * ptr, int8x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    _r.val[3].setLane(lane, _b.loadScalar(_o+3, 8));
    return _r;
}
inline uint8x8x4_t vld4_lane_u8(uint8_t const * ptr, uint8x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    _r.val[3].setLane(lane, _b.loadScalar(_o+3, 8));
    return _r;
}
inline poly8x8x4_t vld4_lane_p8(poly8_t const * ptr, poly8x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    _r.val[3].setLane(lane, _b.loadScalar(_o+3, 8));
    return _r;
}
inline int8x16x4_t vld4q_lane_s8(int8_t const * ptr, int8x16x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    _r.val[3].setLane(lane, _b.loadScalar(_o+3, 8));
    return _r;
}
inline uint8x16x4_t vld4q_lane_u8(uint8_t const * ptr, uint8x16x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    _r.val[3].setLane(lane, _b.loadScalar(_o+3, 8));
    return _r;
}
inline poly8x16x4_t vld4q_lane_p8(poly8_t const * ptr, poly8x16x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    _r.val[3].setLane(lane, _b.loadScalar(_o+3, 8));
    return _r;
}
inline int64x1x4_t vld4_lane_s64(int64_t const * ptr, int64x1x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    _r.val[3].setLane(lane, _b.loadScalar(_o+24, 64));
    return _r;
}
inline int64x2x4_t vld4q_lane_s64(int64_t const * ptr, int64x2x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    _r.val[3].setLane(lane, _b.loadScalar(_o+24, 64));
    return _r;
}
inline uint64x1x4_t vld4_lane_u64(uint64_t const * ptr, uint64x1x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    _r.val[3].setLane(lane, _b.loadScalar(_o+24, 64));
    return _r;
}
inline uint64x2x4_t vld4q_lane_u64(uint64_t const * ptr, uint64x2x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    _r.val[3].setLane(lane, _b.loadScalar(_o+24, 64));
    return _r;
}
inline poly64x1x4_t vld4_lane_p64(poly64_t const * ptr, poly64x1x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    _r.val[3].setLane(lane, _b.loadScalar(_o+24, 64));
    return _r;
}
inline poly64x2x4_t vld4q_lane_p64(poly64_t const * ptr, poly64x2x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    _r.val[3].setLane(lane, _b.loadScalar(_o+24, 64));
    return _r;
}
inline float64x1x4_t vld4_lane_f64(float64_t const * ptr, float64x1x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    _r.val[3].setLane(lane, _b.loadScalar(_o+24, 64));
    return _r;
}
inline float64x2x4_t vld4q_lane_f64(float64_t const * ptr, float64x2x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 64));
    _r.val[1].setLane(lane, _b.loadScalar(_o+8, 64));
    _r.val[2].setLane(lane, _b.loadScalar(_o+16, 64));
    _r.val[3].setLane(lane, _b.loadScalar(_o+24, 64));
    return _r;
}
inline mfloat8x8x4_t vld4_lane_mf8(mfloat8_t const * ptr, mfloat8x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    _r.val[3].setLane(lane, _b.loadScalar(_o+3, 8));
    return _r;
}
inline mfloat8x16x4_t vld4q_lane_mf8(mfloat8_t const * ptr, mfloat8x16x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 8));
    _r.val[1].setLane(lane, _b.loadScalar(_o+1, 8));
    _r.val[2].setLane(lane, _b.loadScalar(_o+2, 8));
    _r.val[3].setLane(lane, _b.loadScalar(_o+3, 8));
    return _r;
}
inline bfloat16x4x4_t vld4_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,4> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16)};
    std::array<Term,4> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16)};
    std::array<Term,4> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16)};
    std::array<Term,4> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16)};
    return bfloat16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline bfloat16x8x4_t vld4q_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    std::array<Term,8> _a0={_b.loadScalar(_o+0,16), _b.loadScalar(_o+8,16), _b.loadScalar(_o+16,16), _b.loadScalar(_o+24,16), _b.loadScalar(_o+32,16), _b.loadScalar(_o+40,16), _b.loadScalar(_o+48,16), _b.loadScalar(_o+56,16)};
    std::array<Term,8> _a1={_b.loadScalar(_o+2,16), _b.loadScalar(_o+10,16), _b.loadScalar(_o+18,16), _b.loadScalar(_o+26,16), _b.loadScalar(_o+34,16), _b.loadScalar(_o+42,16), _b.loadScalar(_o+50,16), _b.loadScalar(_o+58,16)};
    std::array<Term,8> _a2={_b.loadScalar(_o+4,16), _b.loadScalar(_o+12,16), _b.loadScalar(_o+20,16), _b.loadScalar(_o+28,16), _b.loadScalar(_o+36,16), _b.loadScalar(_o+44,16), _b.loadScalar(_o+52,16), _b.loadScalar(_o+60,16)};
    std::array<Term,8> _a3={_b.loadScalar(_o+6,16), _b.loadScalar(_o+14,16), _b.loadScalar(_o+22,16), _b.loadScalar(_o+30,16), _b.loadScalar(_o+38,16), _b.loadScalar(_o+46,16), _b.loadScalar(_o+54,16), _b.loadScalar(_o+62,16)};
    return bfloat16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline bfloat16x4x4_t vld4_lane_bf16(bfloat16_t const * ptr, bfloat16x4x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline bfloat16x8x4_t vld4q_lane_bf16(bfloat16_t const * ptr, bfloat16x8x4_t src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.val[0].setLane(lane, _b.loadScalar(_o+0, 16));
    _r.val[1].setLane(lane, _b.loadScalar(_o+2, 16));
    _r.val[2].setLane(lane, _b.loadScalar(_o+4, 16));
    _r.val[3].setLane(lane, _b.loadScalar(_o+6, 16));
    return _r;
}
inline void vst2_s8(int8_t * ptr, int8x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+3, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+10, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+11, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+14, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+15, val.val[1].getLane(7), 8);
}
inline void vst2q_s8(int8_t * ptr, int8x16x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+3, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+10, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+11, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+14, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+15, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+22, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+23, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+26, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+27, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+30, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+31, val.val[1].getLane(15), 8);
}
inline void vst2_s16(int16_t * ptr, int16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
}
inline void vst2q_s16(int16_t * ptr, int16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+22, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+30, val.val[1].getLane(7), 16);
}
inline void vst2_s32(int32_t * ptr, int32x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+12, val.val[1].getLane(1), 32);
}
inline void vst2q_s32(int32_t * ptr, int32x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+12, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+28, val.val[1].getLane(3), 32);
}
inline void vst2_u8(uint8_t * ptr, uint8x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+3, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+10, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+11, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+14, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+15, val.val[1].getLane(7), 8);
}
inline void vst2q_u8(uint8_t * ptr, uint8x16x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+3, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+10, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+11, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+14, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+15, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+22, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+23, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+26, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+27, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+30, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+31, val.val[1].getLane(15), 8);
}
inline void vst2_u16(uint16_t * ptr, uint16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
}
inline void vst2q_u16(uint16_t * ptr, uint16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+22, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+30, val.val[1].getLane(7), 16);
}
inline void vst2_u32(uint32_t * ptr, uint32x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+12, val.val[1].getLane(1), 32);
}
inline void vst2q_u32(uint32_t * ptr, uint32x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+12, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+28, val.val[1].getLane(3), 32);
}
inline void vst2_f16(float16_t * ptr, float16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
}
inline void vst2q_f16(float16_t * ptr, float16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+22, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+30, val.val[1].getLane(7), 16);
}
inline void vst2_f32(float32_t * ptr, float32x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+12, val.val[1].getLane(1), 32);
}
inline void vst2q_f32(float32_t * ptr, float32x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+12, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+28, val.val[1].getLane(3), 32);
}
inline void vst2_p8(poly8_t * ptr, poly8x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+3, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+10, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+11, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+14, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+15, val.val[1].getLane(7), 8);
}
inline void vst2q_p8(poly8_t * ptr, poly8x16x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+3, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+10, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+11, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+14, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+15, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+22, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+23, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+26, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+27, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+30, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+31, val.val[1].getLane(15), 8);
}
inline void vst2_p16(poly16_t * ptr, poly16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
}
inline void vst2q_p16(poly16_t * ptr, poly16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+22, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+30, val.val[1].getLane(7), 16);
}
inline void vst2q_s64(int64_t * ptr, int64x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+24, val.val[1].getLane(1), 64);
}
inline void vst2q_u64(uint64_t * ptr, uint64x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+24, val.val[1].getLane(1), 64);
}
inline void vst2q_p64(poly64_t * ptr, poly64x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+24, val.val[1].getLane(1), 64);
}
inline void vst2q_f64(float64_t * ptr, float64x2x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+24, val.val[1].getLane(1), 64);
}
inline void vst2_mf8(mfloat8_t * ptr, mfloat8x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+3, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+10, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+11, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+14, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+15, val.val[1].getLane(7), 8);
}
inline void vst2q_mf8(mfloat8_t * ptr, mfloat8x16x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+3, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+10, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+11, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+14, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+15, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+22, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+23, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+26, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+27, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+30, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+31, val.val[1].getLane(15), 8);
}
inline void vst2_lane_s8(int8_t * ptr, int8x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
}
inline void vst2_lane_u8(uint8_t * ptr, uint8x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
}
inline void vst2_lane_p8(poly8_t * ptr, poly8x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
}
inline void vst2_lane_mf8(mfloat8_t * ptr, mfloat8x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
}
inline void vst2_lane_s16(int16_t * ptr, int16x4x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2q_lane_s16(int16_t * ptr, int16x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2_lane_s32(int32_t * ptr, int32x2x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
}
inline void vst2q_lane_s32(int32_t * ptr, int32x4x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
}
inline void vst2_lane_u16(uint16_t * ptr, uint16x4x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2q_lane_u16(uint16_t * ptr, uint16x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2_lane_u32(uint32_t * ptr, uint32x2x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
}
inline void vst2q_lane_u32(uint32_t * ptr, uint32x4x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
}
inline void vst2_lane_f16(float16_t * ptr, float16x4x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2q_lane_f16(float16_t * ptr, float16x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2_lane_f32(float32_t * ptr, float32x2x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
}
inline void vst2q_lane_f32(float32_t * ptr, float32x4x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
}
inline void vst2_lane_p16(poly16_t * ptr, poly16x4x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2q_lane_p16(poly16_t * ptr, poly16x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2q_lane_s8(int8_t * ptr, int8x16x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
}
inline void vst2q_lane_u8(uint8_t * ptr, uint8x16x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
}
inline void vst2q_lane_p8(poly8_t * ptr, poly8x16x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
}
inline void vst2q_lane_mf8(mfloat8_t * ptr, mfloat8x16x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
}
inline void vst2_lane_s64(int64_t * ptr, int64x1x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
}
inline void vst2q_lane_s64(int64_t * ptr, int64x2x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
}
inline void vst2_lane_u64(uint64_t * ptr, uint64x1x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
}
inline void vst2q_lane_u64(uint64_t * ptr, uint64x2x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
}
inline void vst2_lane_p64(poly64_t * ptr, poly64x1x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
}
inline void vst2q_lane_p64(poly64_t * ptr, poly64x2x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
}
inline void vst2_lane_f64(float64_t * ptr, float64x1x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
}
inline void vst2q_lane_f64(float64_t * ptr, float64x2x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
}
inline void vst2_bf16(bfloat16_t * ptr, bfloat16x4x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
}
inline void vst2q_bf16(bfloat16_t * ptr, bfloat16x8x2_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+6, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+22, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+30, val.val[1].getLane(7), 16);
}
inline void vst2_lane_bf16(bfloat16_t * ptr, bfloat16x4x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst2q_lane_bf16(bfloat16_t * ptr, bfloat16x8x2_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
}
inline void vst3_s8(int8_t * ptr, int8x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+8, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+10, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+11, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+15, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+16, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+17, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+20, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+21, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+22, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+23, val.val[2].getLane(7), 8);
}
inline void vst3q_s8(int8_t * ptr, int8x16x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+8, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+10, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+11, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+15, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+16, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+17, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+20, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+21, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+22, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+23, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(8), 8);
    _b.storeScalar(_o+27, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+28, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+29, val.val[2].getLane(9), 8);
    _b.storeScalar(_o+30, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+31, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+32, val.val[2].getLane(10), 8);
    _b.storeScalar(_o+33, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+34, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+35, val.val[2].getLane(11), 8);
    _b.storeScalar(_o+36, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+37, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+38, val.val[2].getLane(12), 8);
    _b.storeScalar(_o+39, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+40, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+41, val.val[2].getLane(13), 8);
    _b.storeScalar(_o+42, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+43, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+44, val.val[2].getLane(14), 8);
    _b.storeScalar(_o+45, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+46, val.val[1].getLane(15), 8);
    _b.storeScalar(_o+47, val.val[2].getLane(15), 8);
}
inline void vst3_s16(int16_t * ptr, int16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
}
inline void vst3q_s16(int16_t * ptr, int16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+30, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+32, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+34, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+36, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+38, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+40, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+42, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+44, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+46, val.val[2].getLane(7), 16);
}
inline void vst3_s32(int32_t * ptr, int32x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[2].getLane(1), 32);
}
inline void vst3q_s32(int32_t * ptr, int32x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+28, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+32, val.val[2].getLane(2), 32);
    _b.storeScalar(_o+36, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+40, val.val[1].getLane(3), 32);
    _b.storeScalar(_o+44, val.val[2].getLane(3), 32);
}
inline void vst3_u8(uint8_t * ptr, uint8x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+8, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+10, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+11, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+15, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+16, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+17, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+20, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+21, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+22, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+23, val.val[2].getLane(7), 8);
}
inline void vst3q_u8(uint8_t * ptr, uint8x16x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+8, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+10, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+11, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+15, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+16, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+17, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+20, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+21, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+22, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+23, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(8), 8);
    _b.storeScalar(_o+27, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+28, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+29, val.val[2].getLane(9), 8);
    _b.storeScalar(_o+30, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+31, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+32, val.val[2].getLane(10), 8);
    _b.storeScalar(_o+33, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+34, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+35, val.val[2].getLane(11), 8);
    _b.storeScalar(_o+36, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+37, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+38, val.val[2].getLane(12), 8);
    _b.storeScalar(_o+39, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+40, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+41, val.val[2].getLane(13), 8);
    _b.storeScalar(_o+42, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+43, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+44, val.val[2].getLane(14), 8);
    _b.storeScalar(_o+45, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+46, val.val[1].getLane(15), 8);
    _b.storeScalar(_o+47, val.val[2].getLane(15), 8);
}
inline void vst3_u16(uint16_t * ptr, uint16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
}
inline void vst3q_u16(uint16_t * ptr, uint16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+30, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+32, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+34, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+36, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+38, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+40, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+42, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+44, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+46, val.val[2].getLane(7), 16);
}
inline void vst3_u32(uint32_t * ptr, uint32x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[2].getLane(1), 32);
}
inline void vst3q_u32(uint32_t * ptr, uint32x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+28, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+32, val.val[2].getLane(2), 32);
    _b.storeScalar(_o+36, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+40, val.val[1].getLane(3), 32);
    _b.storeScalar(_o+44, val.val[2].getLane(3), 32);
}
inline void vst3_f16(float16_t * ptr, float16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
}
inline void vst3q_f16(float16_t * ptr, float16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+30, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+32, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+34, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+36, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+38, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+40, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+42, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+44, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+46, val.val[2].getLane(7), 16);
}
inline void vst3_f32(float32_t * ptr, float32x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[2].getLane(1), 32);
}
inline void vst3q_f32(float32_t * ptr, float32x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+16, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+28, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+32, val.val[2].getLane(2), 32);
    _b.storeScalar(_o+36, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+40, val.val[1].getLane(3), 32);
    _b.storeScalar(_o+44, val.val[2].getLane(3), 32);
}
inline void vst3_p8(poly8_t * ptr, poly8x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+8, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+10, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+11, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+15, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+16, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+17, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+20, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+21, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+22, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+23, val.val[2].getLane(7), 8);
}
inline void vst3q_p8(poly8_t * ptr, poly8x16x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+8, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+10, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+11, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+15, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+16, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+17, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+20, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+21, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+22, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+23, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(8), 8);
    _b.storeScalar(_o+27, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+28, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+29, val.val[2].getLane(9), 8);
    _b.storeScalar(_o+30, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+31, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+32, val.val[2].getLane(10), 8);
    _b.storeScalar(_o+33, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+34, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+35, val.val[2].getLane(11), 8);
    _b.storeScalar(_o+36, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+37, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+38, val.val[2].getLane(12), 8);
    _b.storeScalar(_o+39, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+40, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+41, val.val[2].getLane(13), 8);
    _b.storeScalar(_o+42, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+43, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+44, val.val[2].getLane(14), 8);
    _b.storeScalar(_o+45, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+46, val.val[1].getLane(15), 8);
    _b.storeScalar(_o+47, val.val[2].getLane(15), 8);
}
inline void vst3_p16(poly16_t * ptr, poly16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
}
inline void vst3q_p16(poly16_t * ptr, poly16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+30, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+32, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+34, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+36, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+38, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+40, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+42, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+44, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+46, val.val[2].getLane(7), 16);
}
inline void vst3q_s64(int64_t * ptr, int64x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(0), 64);
    _b.storeScalar(_o+24, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+32, val.val[1].getLane(1), 64);
    _b.storeScalar(_o+40, val.val[2].getLane(1), 64);
}
inline void vst3q_u64(uint64_t * ptr, uint64x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(0), 64);
    _b.storeScalar(_o+24, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+32, val.val[1].getLane(1), 64);
    _b.storeScalar(_o+40, val.val[2].getLane(1), 64);
}
inline void vst3q_p64(poly64_t * ptr, poly64x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(0), 64);
    _b.storeScalar(_o+24, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+32, val.val[1].getLane(1), 64);
    _b.storeScalar(_o+40, val.val[2].getLane(1), 64);
}
inline void vst3q_f64(float64_t * ptr, float64x2x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(0), 64);
    _b.storeScalar(_o+24, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+32, val.val[1].getLane(1), 64);
    _b.storeScalar(_o+40, val.val[2].getLane(1), 64);
}
inline void vst3_mf8(mfloat8_t * ptr, mfloat8x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+8, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+10, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+11, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+15, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+16, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+17, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+20, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+21, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+22, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+23, val.val[2].getLane(7), 8);
}
inline void vst3q_mf8(mfloat8_t * ptr, mfloat8x16x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+4, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+7, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+8, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+10, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+11, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+15, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+16, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+17, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+18, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+19, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+20, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+21, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+22, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+23, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(8), 8);
    _b.storeScalar(_o+27, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+28, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+29, val.val[2].getLane(9), 8);
    _b.storeScalar(_o+30, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+31, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+32, val.val[2].getLane(10), 8);
    _b.storeScalar(_o+33, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+34, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+35, val.val[2].getLane(11), 8);
    _b.storeScalar(_o+36, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+37, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+38, val.val[2].getLane(12), 8);
    _b.storeScalar(_o+39, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+40, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+41, val.val[2].getLane(13), 8);
    _b.storeScalar(_o+42, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+43, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+44, val.val[2].getLane(14), 8);
    _b.storeScalar(_o+45, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+46, val.val[1].getLane(15), 8);
    _b.storeScalar(_o+47, val.val[2].getLane(15), 8);
}
inline void vst3_lane_s8(int8_t * ptr, int8x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
}
inline void vst3_lane_u8(uint8_t * ptr, uint8x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
}
inline void vst3_lane_p8(poly8_t * ptr, poly8x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
}
inline void vst3_lane_mf8(mfloat8_t * ptr, mfloat8x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
}
inline void vst3_lane_s16(int16_t * ptr, int16x4x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3q_lane_s16(int16_t * ptr, int16x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3_lane_s32(int32_t * ptr, int32x2x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
}
inline void vst3q_lane_s32(int32_t * ptr, int32x4x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
}
inline void vst3_lane_u16(uint16_t * ptr, uint16x4x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3q_lane_u16(uint16_t * ptr, uint16x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3_lane_u32(uint32_t * ptr, uint32x2x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
}
inline void vst3q_lane_u32(uint32_t * ptr, uint32x4x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
}
inline void vst3_lane_f16(float16_t * ptr, float16x4x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3q_lane_f16(float16_t * ptr, float16x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3_lane_f32(float32_t * ptr, float32x2x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
}
inline void vst3q_lane_f32(float32_t * ptr, float32x4x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
}
inline void vst3_lane_p16(poly16_t * ptr, poly16x4x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3q_lane_p16(poly16_t * ptr, poly16x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3q_lane_s8(int8_t * ptr, int8x16x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
}
inline void vst3q_lane_u8(uint8_t * ptr, uint8x16x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
}
inline void vst3q_lane_p8(poly8_t * ptr, poly8x16x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
}
inline void vst3_lane_s64(int64_t * ptr, int64x1x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
}
inline void vst3q_lane_s64(int64_t * ptr, int64x2x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
}
inline void vst3_lane_u64(uint64_t * ptr, uint64x1x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
}
inline void vst3q_lane_u64(uint64_t * ptr, uint64x2x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
}
inline void vst3_lane_p64(poly64_t * ptr, poly64x1x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
}
inline void vst3q_lane_p64(poly64_t * ptr, poly64x2x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
}
inline void vst3_lane_f64(float64_t * ptr, float64x1x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
}
inline void vst3q_lane_f64(float64_t * ptr, float64x2x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
}
inline void vst3q_lane_mf8(mfloat8_t * ptr, mfloat8x16x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
}
inline void vst3_bf16(bfloat16_t * ptr, bfloat16x4x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
}
inline void vst3q_bf16(bfloat16_t * ptr, bfloat16x8x3_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+8, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+14, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+16, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+20, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+22, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+30, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+32, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+34, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+36, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+38, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+40, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+42, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+44, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+46, val.val[2].getLane(7), 16);
}
inline void vst3_lane_bf16(bfloat16_t * ptr, bfloat16x4x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst3q_lane_bf16(bfloat16_t * ptr, bfloat16x8x3_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
}
inline void vst4_s8(int8_t * ptr, int8x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(0), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+7, val.val[3].getLane(1), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+10, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+11, val.val[3].getLane(2), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+15, val.val[3].getLane(3), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+18, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+19, val.val[3].getLane(4), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+22, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+23, val.val[3].getLane(5), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+27, val.val[3].getLane(6), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+30, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+31, val.val[3].getLane(7), 8);
}
inline void vst4q_s8(int8_t * ptr, int8x16x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(0), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+7, val.val[3].getLane(1), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+10, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+11, val.val[3].getLane(2), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+15, val.val[3].getLane(3), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+18, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+19, val.val[3].getLane(4), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+22, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+23, val.val[3].getLane(5), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+27, val.val[3].getLane(6), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+30, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+31, val.val[3].getLane(7), 8);
    _b.storeScalar(_o+32, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+33, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+34, val.val[2].getLane(8), 8);
    _b.storeScalar(_o+35, val.val[3].getLane(8), 8);
    _b.storeScalar(_o+36, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+37, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+38, val.val[2].getLane(9), 8);
    _b.storeScalar(_o+39, val.val[3].getLane(9), 8);
    _b.storeScalar(_o+40, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+41, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+42, val.val[2].getLane(10), 8);
    _b.storeScalar(_o+43, val.val[3].getLane(10), 8);
    _b.storeScalar(_o+44, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+45, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+46, val.val[2].getLane(11), 8);
    _b.storeScalar(_o+47, val.val[3].getLane(11), 8);
    _b.storeScalar(_o+48, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+49, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+50, val.val[2].getLane(12), 8);
    _b.storeScalar(_o+51, val.val[3].getLane(12), 8);
    _b.storeScalar(_o+52, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+53, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+54, val.val[2].getLane(13), 8);
    _b.storeScalar(_o+55, val.val[3].getLane(13), 8);
    _b.storeScalar(_o+56, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+57, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+58, val.val[2].getLane(14), 8);
    _b.storeScalar(_o+59, val.val[3].getLane(14), 8);
    _b.storeScalar(_o+60, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+61, val.val[1].getLane(15), 8);
    _b.storeScalar(_o+62, val.val[2].getLane(15), 8);
    _b.storeScalar(_o+63, val.val[3].getLane(15), 8);
}
inline void vst4_s16(int16_t * ptr, int16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
}
inline void vst4q_s16(int16_t * ptr, int16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
    _b.storeScalar(_o+32, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+34, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+36, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+38, val.val[3].getLane(4), 16);
    _b.storeScalar(_o+40, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+42, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+44, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+46, val.val[3].getLane(5), 16);
    _b.storeScalar(_o+48, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+50, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+52, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+54, val.val[3].getLane(6), 16);
    _b.storeScalar(_o+56, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+58, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+60, val.val[2].getLane(7), 16);
    _b.storeScalar(_o+62, val.val[3].getLane(7), 16);
}
inline void vst4_s32(int32_t * ptr, int32x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(0), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+28, val.val[3].getLane(1), 32);
}
inline void vst4q_s32(int32_t * ptr, int32x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(0), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+28, val.val[3].getLane(1), 32);
    _b.storeScalar(_o+32, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+36, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+40, val.val[2].getLane(2), 32);
    _b.storeScalar(_o+44, val.val[3].getLane(2), 32);
    _b.storeScalar(_o+48, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+52, val.val[1].getLane(3), 32);
    _b.storeScalar(_o+56, val.val[2].getLane(3), 32);
    _b.storeScalar(_o+60, val.val[3].getLane(3), 32);
}
inline void vst4_u8(uint8_t * ptr, uint8x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(0), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+7, val.val[3].getLane(1), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+10, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+11, val.val[3].getLane(2), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+15, val.val[3].getLane(3), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+18, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+19, val.val[3].getLane(4), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+22, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+23, val.val[3].getLane(5), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+27, val.val[3].getLane(6), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+30, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+31, val.val[3].getLane(7), 8);
}
inline void vst4q_u8(uint8_t * ptr, uint8x16x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(0), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+7, val.val[3].getLane(1), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+10, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+11, val.val[3].getLane(2), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+15, val.val[3].getLane(3), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+18, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+19, val.val[3].getLane(4), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+22, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+23, val.val[3].getLane(5), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+27, val.val[3].getLane(6), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+30, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+31, val.val[3].getLane(7), 8);
    _b.storeScalar(_o+32, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+33, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+34, val.val[2].getLane(8), 8);
    _b.storeScalar(_o+35, val.val[3].getLane(8), 8);
    _b.storeScalar(_o+36, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+37, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+38, val.val[2].getLane(9), 8);
    _b.storeScalar(_o+39, val.val[3].getLane(9), 8);
    _b.storeScalar(_o+40, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+41, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+42, val.val[2].getLane(10), 8);
    _b.storeScalar(_o+43, val.val[3].getLane(10), 8);
    _b.storeScalar(_o+44, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+45, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+46, val.val[2].getLane(11), 8);
    _b.storeScalar(_o+47, val.val[3].getLane(11), 8);
    _b.storeScalar(_o+48, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+49, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+50, val.val[2].getLane(12), 8);
    _b.storeScalar(_o+51, val.val[3].getLane(12), 8);
    _b.storeScalar(_o+52, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+53, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+54, val.val[2].getLane(13), 8);
    _b.storeScalar(_o+55, val.val[3].getLane(13), 8);
    _b.storeScalar(_o+56, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+57, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+58, val.val[2].getLane(14), 8);
    _b.storeScalar(_o+59, val.val[3].getLane(14), 8);
    _b.storeScalar(_o+60, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+61, val.val[1].getLane(15), 8);
    _b.storeScalar(_o+62, val.val[2].getLane(15), 8);
    _b.storeScalar(_o+63, val.val[3].getLane(15), 8);
}
inline void vst4_u16(uint16_t * ptr, uint16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
}
inline void vst4q_u16(uint16_t * ptr, uint16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
    _b.storeScalar(_o+32, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+34, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+36, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+38, val.val[3].getLane(4), 16);
    _b.storeScalar(_o+40, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+42, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+44, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+46, val.val[3].getLane(5), 16);
    _b.storeScalar(_o+48, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+50, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+52, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+54, val.val[3].getLane(6), 16);
    _b.storeScalar(_o+56, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+58, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+60, val.val[2].getLane(7), 16);
    _b.storeScalar(_o+62, val.val[3].getLane(7), 16);
}
inline void vst4_u32(uint32_t * ptr, uint32x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(0), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+28, val.val[3].getLane(1), 32);
}
inline void vst4q_u32(uint32_t * ptr, uint32x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(0), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+28, val.val[3].getLane(1), 32);
    _b.storeScalar(_o+32, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+36, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+40, val.val[2].getLane(2), 32);
    _b.storeScalar(_o+44, val.val[3].getLane(2), 32);
    _b.storeScalar(_o+48, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+52, val.val[1].getLane(3), 32);
    _b.storeScalar(_o+56, val.val[2].getLane(3), 32);
    _b.storeScalar(_o+60, val.val[3].getLane(3), 32);
}
inline void vst4_f16(float16_t * ptr, float16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
}
inline void vst4q_f16(float16_t * ptr, float16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
    _b.storeScalar(_o+32, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+34, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+36, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+38, val.val[3].getLane(4), 16);
    _b.storeScalar(_o+40, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+42, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+44, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+46, val.val[3].getLane(5), 16);
    _b.storeScalar(_o+48, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+50, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+52, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+54, val.val[3].getLane(6), 16);
    _b.storeScalar(_o+56, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+58, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+60, val.val[2].getLane(7), 16);
    _b.storeScalar(_o+62, val.val[3].getLane(7), 16);
}
inline void vst4_f32(float32_t * ptr, float32x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(0), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+28, val.val[3].getLane(1), 32);
}
inline void vst4q_f32(float32_t * ptr, float32x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(0), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(0), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(0), 32);
    _b.storeScalar(_o+16, val.val[0].getLane(1), 32);
    _b.storeScalar(_o+20, val.val[1].getLane(1), 32);
    _b.storeScalar(_o+24, val.val[2].getLane(1), 32);
    _b.storeScalar(_o+28, val.val[3].getLane(1), 32);
    _b.storeScalar(_o+32, val.val[0].getLane(2), 32);
    _b.storeScalar(_o+36, val.val[1].getLane(2), 32);
    _b.storeScalar(_o+40, val.val[2].getLane(2), 32);
    _b.storeScalar(_o+44, val.val[3].getLane(2), 32);
    _b.storeScalar(_o+48, val.val[0].getLane(3), 32);
    _b.storeScalar(_o+52, val.val[1].getLane(3), 32);
    _b.storeScalar(_o+56, val.val[2].getLane(3), 32);
    _b.storeScalar(_o+60, val.val[3].getLane(3), 32);
}
inline void vst4_p8(poly8_t * ptr, poly8x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(0), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+7, val.val[3].getLane(1), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+10, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+11, val.val[3].getLane(2), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+15, val.val[3].getLane(3), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+18, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+19, val.val[3].getLane(4), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+22, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+23, val.val[3].getLane(5), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+27, val.val[3].getLane(6), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+30, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+31, val.val[3].getLane(7), 8);
}
inline void vst4q_p8(poly8_t * ptr, poly8x16x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(0), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+7, val.val[3].getLane(1), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+10, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+11, val.val[3].getLane(2), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+15, val.val[3].getLane(3), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+18, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+19, val.val[3].getLane(4), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+22, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+23, val.val[3].getLane(5), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+27, val.val[3].getLane(6), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+30, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+31, val.val[3].getLane(7), 8);
    _b.storeScalar(_o+32, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+33, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+34, val.val[2].getLane(8), 8);
    _b.storeScalar(_o+35, val.val[3].getLane(8), 8);
    _b.storeScalar(_o+36, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+37, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+38, val.val[2].getLane(9), 8);
    _b.storeScalar(_o+39, val.val[3].getLane(9), 8);
    _b.storeScalar(_o+40, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+41, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+42, val.val[2].getLane(10), 8);
    _b.storeScalar(_o+43, val.val[3].getLane(10), 8);
    _b.storeScalar(_o+44, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+45, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+46, val.val[2].getLane(11), 8);
    _b.storeScalar(_o+47, val.val[3].getLane(11), 8);
    _b.storeScalar(_o+48, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+49, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+50, val.val[2].getLane(12), 8);
    _b.storeScalar(_o+51, val.val[3].getLane(12), 8);
    _b.storeScalar(_o+52, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+53, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+54, val.val[2].getLane(13), 8);
    _b.storeScalar(_o+55, val.val[3].getLane(13), 8);
    _b.storeScalar(_o+56, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+57, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+58, val.val[2].getLane(14), 8);
    _b.storeScalar(_o+59, val.val[3].getLane(14), 8);
    _b.storeScalar(_o+60, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+61, val.val[1].getLane(15), 8);
    _b.storeScalar(_o+62, val.val[2].getLane(15), 8);
    _b.storeScalar(_o+63, val.val[3].getLane(15), 8);
}
inline void vst4_p16(poly16_t * ptr, poly16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
}
inline void vst4q_p16(poly16_t * ptr, poly16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
    _b.storeScalar(_o+32, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+34, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+36, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+38, val.val[3].getLane(4), 16);
    _b.storeScalar(_o+40, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+42, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+44, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+46, val.val[3].getLane(5), 16);
    _b.storeScalar(_o+48, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+50, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+52, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+54, val.val[3].getLane(6), 16);
    _b.storeScalar(_o+56, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+58, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+60, val.val[2].getLane(7), 16);
    _b.storeScalar(_o+62, val.val[3].getLane(7), 16);
}
inline void vst4q_s64(int64_t * ptr, int64x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(0), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(0), 64);
    _b.storeScalar(_o+32, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+40, val.val[1].getLane(1), 64);
    _b.storeScalar(_o+48, val.val[2].getLane(1), 64);
    _b.storeScalar(_o+56, val.val[3].getLane(1), 64);
}
inline void vst4q_u64(uint64_t * ptr, uint64x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(0), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(0), 64);
    _b.storeScalar(_o+32, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+40, val.val[1].getLane(1), 64);
    _b.storeScalar(_o+48, val.val[2].getLane(1), 64);
    _b.storeScalar(_o+56, val.val[3].getLane(1), 64);
}
inline void vst4q_p64(poly64_t * ptr, poly64x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(0), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(0), 64);
    _b.storeScalar(_o+32, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+40, val.val[1].getLane(1), 64);
    _b.storeScalar(_o+48, val.val[2].getLane(1), 64);
    _b.storeScalar(_o+56, val.val[3].getLane(1), 64);
}
inline void vst4q_f64(float64_t * ptr, float64x2x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(0), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(0), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(0), 64);
    _b.storeScalar(_o+32, val.val[0].getLane(1), 64);
    _b.storeScalar(_o+40, val.val[1].getLane(1), 64);
    _b.storeScalar(_o+48, val.val[2].getLane(1), 64);
    _b.storeScalar(_o+56, val.val[3].getLane(1), 64);
}
inline void vst4_mf8(mfloat8_t * ptr, mfloat8x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(0), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+7, val.val[3].getLane(1), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+10, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+11, val.val[3].getLane(2), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+15, val.val[3].getLane(3), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+18, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+19, val.val[3].getLane(4), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+22, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+23, val.val[3].getLane(5), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+27, val.val[3].getLane(6), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+30, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+31, val.val[3].getLane(7), 8);
}
inline void vst4q_mf8(mfloat8_t * ptr, mfloat8x16x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(0), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(0), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(0), 8);
    _b.storeScalar(_o+4, val.val[0].getLane(1), 8);
    _b.storeScalar(_o+5, val.val[1].getLane(1), 8);
    _b.storeScalar(_o+6, val.val[2].getLane(1), 8);
    _b.storeScalar(_o+7, val.val[3].getLane(1), 8);
    _b.storeScalar(_o+8, val.val[0].getLane(2), 8);
    _b.storeScalar(_o+9, val.val[1].getLane(2), 8);
    _b.storeScalar(_o+10, val.val[2].getLane(2), 8);
    _b.storeScalar(_o+11, val.val[3].getLane(2), 8);
    _b.storeScalar(_o+12, val.val[0].getLane(3), 8);
    _b.storeScalar(_o+13, val.val[1].getLane(3), 8);
    _b.storeScalar(_o+14, val.val[2].getLane(3), 8);
    _b.storeScalar(_o+15, val.val[3].getLane(3), 8);
    _b.storeScalar(_o+16, val.val[0].getLane(4), 8);
    _b.storeScalar(_o+17, val.val[1].getLane(4), 8);
    _b.storeScalar(_o+18, val.val[2].getLane(4), 8);
    _b.storeScalar(_o+19, val.val[3].getLane(4), 8);
    _b.storeScalar(_o+20, val.val[0].getLane(5), 8);
    _b.storeScalar(_o+21, val.val[1].getLane(5), 8);
    _b.storeScalar(_o+22, val.val[2].getLane(5), 8);
    _b.storeScalar(_o+23, val.val[3].getLane(5), 8);
    _b.storeScalar(_o+24, val.val[0].getLane(6), 8);
    _b.storeScalar(_o+25, val.val[1].getLane(6), 8);
    _b.storeScalar(_o+26, val.val[2].getLane(6), 8);
    _b.storeScalar(_o+27, val.val[3].getLane(6), 8);
    _b.storeScalar(_o+28, val.val[0].getLane(7), 8);
    _b.storeScalar(_o+29, val.val[1].getLane(7), 8);
    _b.storeScalar(_o+30, val.val[2].getLane(7), 8);
    _b.storeScalar(_o+31, val.val[3].getLane(7), 8);
    _b.storeScalar(_o+32, val.val[0].getLane(8), 8);
    _b.storeScalar(_o+33, val.val[1].getLane(8), 8);
    _b.storeScalar(_o+34, val.val[2].getLane(8), 8);
    _b.storeScalar(_o+35, val.val[3].getLane(8), 8);
    _b.storeScalar(_o+36, val.val[0].getLane(9), 8);
    _b.storeScalar(_o+37, val.val[1].getLane(9), 8);
    _b.storeScalar(_o+38, val.val[2].getLane(9), 8);
    _b.storeScalar(_o+39, val.val[3].getLane(9), 8);
    _b.storeScalar(_o+40, val.val[0].getLane(10), 8);
    _b.storeScalar(_o+41, val.val[1].getLane(10), 8);
    _b.storeScalar(_o+42, val.val[2].getLane(10), 8);
    _b.storeScalar(_o+43, val.val[3].getLane(10), 8);
    _b.storeScalar(_o+44, val.val[0].getLane(11), 8);
    _b.storeScalar(_o+45, val.val[1].getLane(11), 8);
    _b.storeScalar(_o+46, val.val[2].getLane(11), 8);
    _b.storeScalar(_o+47, val.val[3].getLane(11), 8);
    _b.storeScalar(_o+48, val.val[0].getLane(12), 8);
    _b.storeScalar(_o+49, val.val[1].getLane(12), 8);
    _b.storeScalar(_o+50, val.val[2].getLane(12), 8);
    _b.storeScalar(_o+51, val.val[3].getLane(12), 8);
    _b.storeScalar(_o+52, val.val[0].getLane(13), 8);
    _b.storeScalar(_o+53, val.val[1].getLane(13), 8);
    _b.storeScalar(_o+54, val.val[2].getLane(13), 8);
    _b.storeScalar(_o+55, val.val[3].getLane(13), 8);
    _b.storeScalar(_o+56, val.val[0].getLane(14), 8);
    _b.storeScalar(_o+57, val.val[1].getLane(14), 8);
    _b.storeScalar(_o+58, val.val[2].getLane(14), 8);
    _b.storeScalar(_o+59, val.val[3].getLane(14), 8);
    _b.storeScalar(_o+60, val.val[0].getLane(15), 8);
    _b.storeScalar(_o+61, val.val[1].getLane(15), 8);
    _b.storeScalar(_o+62, val.val[2].getLane(15), 8);
    _b.storeScalar(_o+63, val.val[3].getLane(15), 8);
}
inline void vst4_lane_s8(int8_t * ptr, int8x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(lane), 8);
}
inline void vst4_lane_u8(uint8_t * ptr, uint8x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(lane), 8);
}
inline void vst4_lane_p8(poly8_t * ptr, poly8x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(lane), 8);
}
inline void vst4_lane_mf8(mfloat8_t * ptr, mfloat8x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(lane), 8);
}
inline void vst4_lane_s16(int16_t * ptr, int16x4x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4q_lane_s16(int16_t * ptr, int16x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4_lane_s32(int32_t * ptr, int32x2x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(lane), 32);
}
inline void vst4q_lane_s32(int32_t * ptr, int32x4x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(lane), 32);
}
inline void vst4_lane_u16(uint16_t * ptr, uint16x4x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4q_lane_u16(uint16_t * ptr, uint16x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4_lane_u32(uint32_t * ptr, uint32x2x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(lane), 32);
}
inline void vst4q_lane_u32(uint32_t * ptr, uint32x4x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(lane), 32);
}
inline void vst4_lane_f16(float16_t * ptr, float16x4x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4q_lane_f16(float16_t * ptr, float16x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4_lane_f32(float32_t * ptr, float32x2x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(lane), 32);
}
inline void vst4q_lane_f32(float32_t * ptr, float32x4x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 32);
    _b.storeScalar(_o+4, val.val[1].getLane(lane), 32);
    _b.storeScalar(_o+8, val.val[2].getLane(lane), 32);
    _b.storeScalar(_o+12, val.val[3].getLane(lane), 32);
}
inline void vst4_lane_p16(poly16_t * ptr, poly16x4x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4q_lane_p16(poly16_t * ptr, poly16x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4q_lane_s8(int8_t * ptr, int8x16x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(lane), 8);
}
inline void vst4q_lane_u8(uint8_t * ptr, uint8x16x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(lane), 8);
}
inline void vst4q_lane_p8(poly8_t * ptr, poly8x16x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(lane), 8);
}
inline void vst4_lane_s64(int64_t * ptr, int64x1x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(lane), 64);
}
inline void vst4q_lane_s64(int64_t * ptr, int64x2x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(lane), 64);
}
inline void vst4_lane_u64(uint64_t * ptr, uint64x1x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(lane), 64);
}
inline void vst4q_lane_u64(uint64_t * ptr, uint64x2x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(lane), 64);
}
inline void vst4_lane_p64(poly64_t * ptr, poly64x1x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(lane), 64);
}
inline void vst4q_lane_p64(poly64_t * ptr, poly64x2x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(lane), 64);
}
inline void vst4_lane_f64(float64_t * ptr, float64x1x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(lane), 64);
}
inline void vst4q_lane_f64(float64_t * ptr, float64x2x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 64);
    _b.storeScalar(_o+8, val.val[1].getLane(lane), 64);
    _b.storeScalar(_o+16, val.val[2].getLane(lane), 64);
    _b.storeScalar(_o+24, val.val[3].getLane(lane), 64);
}
inline void vst4q_lane_mf8(mfloat8_t * ptr, mfloat8x16x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 8);
    _b.storeScalar(_o+1, val.val[1].getLane(lane), 8);
    _b.storeScalar(_o+2, val.val[2].getLane(lane), 8);
    _b.storeScalar(_o+3, val.val[3].getLane(lane), 8);
}
inline void vst4_bf16(bfloat16_t * ptr, bfloat16x4x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
}
inline void vst4q_bf16(bfloat16_t * ptr, bfloat16x8x4_t val) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(0), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(0), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(0), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(0), 16);
    _b.storeScalar(_o+8, val.val[0].getLane(1), 16);
    _b.storeScalar(_o+10, val.val[1].getLane(1), 16);
    _b.storeScalar(_o+12, val.val[2].getLane(1), 16);
    _b.storeScalar(_o+14, val.val[3].getLane(1), 16);
    _b.storeScalar(_o+16, val.val[0].getLane(2), 16);
    _b.storeScalar(_o+18, val.val[1].getLane(2), 16);
    _b.storeScalar(_o+20, val.val[2].getLane(2), 16);
    _b.storeScalar(_o+22, val.val[3].getLane(2), 16);
    _b.storeScalar(_o+24, val.val[0].getLane(3), 16);
    _b.storeScalar(_o+26, val.val[1].getLane(3), 16);
    _b.storeScalar(_o+28, val.val[2].getLane(3), 16);
    _b.storeScalar(_o+30, val.val[3].getLane(3), 16);
    _b.storeScalar(_o+32, val.val[0].getLane(4), 16);
    _b.storeScalar(_o+34, val.val[1].getLane(4), 16);
    _b.storeScalar(_o+36, val.val[2].getLane(4), 16);
    _b.storeScalar(_o+38, val.val[3].getLane(4), 16);
    _b.storeScalar(_o+40, val.val[0].getLane(5), 16);
    _b.storeScalar(_o+42, val.val[1].getLane(5), 16);
    _b.storeScalar(_o+44, val.val[2].getLane(5), 16);
    _b.storeScalar(_o+46, val.val[3].getLane(5), 16);
    _b.storeScalar(_o+48, val.val[0].getLane(6), 16);
    _b.storeScalar(_o+50, val.val[1].getLane(6), 16);
    _b.storeScalar(_o+52, val.val[2].getLane(6), 16);
    _b.storeScalar(_o+54, val.val[3].getLane(6), 16);
    _b.storeScalar(_o+56, val.val[0].getLane(7), 16);
    _b.storeScalar(_o+58, val.val[1].getLane(7), 16);
    _b.storeScalar(_o+60, val.val[2].getLane(7), 16);
    _b.storeScalar(_o+62, val.val[3].getLane(7), 16);
}
inline void vst4_lane_bf16(bfloat16_t * ptr, bfloat16x4x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline void vst4q_lane_bf16(bfloat16_t * ptr, bfloat16x8x4_t val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o+0, val.val[0].getLane(lane), 16);
    _b.storeScalar(_o+2, val.val[1].getLane(lane), 16);
    _b.storeScalar(_o+4, val.val[2].getLane(lane), 16);
    _b.storeScalar(_o+6, val.val[3].getLane(lane), 16);
}
inline int8x16_t vld1q_dup_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,8);
    std::array<Term,16> _a; _a.fill(_v);
    return int8x16_t(tm,_a);
}
inline int16x8_t vld1q_dup_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,16);
    std::array<Term,8> _a; _a.fill(_v);
    return int16x8_t(tm,_a);
}
inline int32x4_t vld1q_dup_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,32);
    std::array<Term,4> _a; _a.fill(_v);
    return int32x4_t(tm,_a);
}
inline int64x2_t vld1q_dup_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,64);
    std::array<Term,2> _a; _a.fill(_v);
    return int64x2_t(tm,_a);
}
inline uint8x16_t vld1q_dup_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,8);
    std::array<Term,16> _a; _a.fill(_v);
    return uint8x16_t(tm,_a);
}
inline uint32x4_t vld1q_dup_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,32);
    std::array<Term,4> _a; _a.fill(_v);
    return uint32x4_t(tm,_a);
}
inline uint64x2_t vld1q_dup_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,64);
    std::array<Term,2> _a; _a.fill(_v);
    return uint64x2_t(tm,_a);
}
inline poly64x2_t vld1q_dup_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,64);
    std::array<Term,2> _a; _a.fill(_v);
    return poly64x2_t(tm,_a);
}
inline poly8x8_t vld1_dup_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,8);
    std::array<Term,8> _a; _a.fill(_v);
    return poly8x8_t(tm,_a);
}
inline poly8x16_t vld1q_dup_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,8);
    std::array<Term,16> _a; _a.fill(_v);
    return poly8x16_t(tm,_a);
}
inline poly16x4_t vld1_dup_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,16);
    std::array<Term,4> _a; _a.fill(_v);
    return poly16x4_t(tm,_a);
}
inline poly16x8_t vld1q_dup_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,16);
    std::array<Term,8> _a; _a.fill(_v);
    return poly16x8_t(tm,_a);
}
inline float64x2_t vld1q_dup_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,64);
    std::array<Term,2> _a; _a.fill(_v);
    return float64x2_t(tm,_a);
}
inline mfloat8x8_t vld1_dup_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,8);
    std::array<Term,8> _a; _a.fill(_v);
    return mfloat8x8_t(tm,_a);
}
inline mfloat8x16_t vld1q_dup_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,8);
    std::array<Term,16> _a; _a.fill(_v);
    return mfloat8x16_t(tm,_a);
}
inline bfloat16x4_t vld1_dup_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,16);
    std::array<Term,4> _a; _a.fill(_v);
    return bfloat16x4_t(tm,_a);
}
inline bfloat16x8_t vld1q_dup_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v=_b.loadScalar(_o,16);
    std::array<Term,8> _a; _a.fill(_v);
    return bfloat16x8_t(tm,_a);
}
inline int8x8x2_t vld2_dup_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    return int8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline int8x16x2_t vld2q_dup_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    return int8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline int16x4x2_t vld2_dup_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    return int16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline int16x8x2_t vld2q_dup_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    return int16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int32x2x2_t vld2_dup_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    return int32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline int32x4x2_t vld2q_dup_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    return int32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline uint8x8x2_t vld2_dup_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    return uint8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline uint8x16x2_t vld2q_dup_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    return uint8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline uint16x4x2_t vld2_dup_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    return uint16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline uint16x8x2_t vld2q_dup_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    return uint16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline uint32x2x2_t vld2_dup_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    return uint32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline uint32x4x2_t vld2q_dup_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    return uint32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline float16x4x2_t vld2_dup_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    return float16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline float16x8x2_t vld2q_dup_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    return float16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline float32x2x2_t vld2_dup_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    return float32x2x2_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1)};
}
inline float32x4x2_t vld2q_dup_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    return float32x4x2_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1)};
}
inline poly8x8x2_t vld2_dup_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    return poly8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline poly8x16x2_t vld2q_dup_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    return poly8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline poly16x4x2_t vld2_dup_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    return poly16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline poly16x8x2_t vld2q_dup_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    return poly16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int64x1x2_t vld2_dup_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    return int64x1x2_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1)};
}
inline uint64x1x2_t vld2_dup_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    return uint64x1x2_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1)};
}
inline poly64x1x2_t vld2_dup_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    return poly64x1x2_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1)};
}
inline int64x2x2_t vld2q_dup_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    return int64x2x2_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1)};
}
inline uint64x2x2_t vld2q_dup_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    return uint64x2x2_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1)};
}
inline poly64x2x2_t vld2q_dup_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    return poly64x2x2_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1)};
}
inline float64x1x2_t vld2_dup_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    return float64x1x2_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1)};
}
inline float64x2x2_t vld2q_dup_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    return float64x2x2_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1)};
}
inline mfloat8x8x2_t vld2_dup_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    return mfloat8x8x2_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1)};
}
inline mfloat8x16x2_t vld2q_dup_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    return mfloat8x16x2_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1)};
}
inline bfloat16x4x2_t vld2_dup_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    return bfloat16x4x2_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1)};
}
inline bfloat16x8x2_t vld2q_dup_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    return bfloat16x8x2_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1)};
}
inline int8x8x3_t vld3_dup_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,8> _a2; _a2.fill(_v2);
    return int8x8x3_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2)};
}
inline int8x16x3_t vld3q_dup_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,16> _a2; _a2.fill(_v2);
    return int8x16x3_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2)};
}
inline int16x4x3_t vld3_dup_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    return int16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline int16x8x3_t vld3q_dup_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    return int16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline int32x2x3_t vld3_dup_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,2> _a2; _a2.fill(_v2);
    return int32x2x3_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2)};
}
inline int32x4x3_t vld3q_dup_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,4> _a2; _a2.fill(_v2);
    return int32x4x3_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2)};
}
inline uint8x8x3_t vld3_dup_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,8> _a2; _a2.fill(_v2);
    return uint8x8x3_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2)};
}
inline uint8x16x3_t vld3q_dup_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,16> _a2; _a2.fill(_v2);
    return uint8x16x3_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2)};
}
inline uint16x4x3_t vld3_dup_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    return uint16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline uint16x8x3_t vld3q_dup_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    return uint16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline uint32x2x3_t vld3_dup_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,2> _a2; _a2.fill(_v2);
    return uint32x2x3_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2)};
}
inline uint32x4x3_t vld3q_dup_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,4> _a2; _a2.fill(_v2);
    return uint32x4x3_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2)};
}
inline float16x4x3_t vld3_dup_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    return float16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline float16x8x3_t vld3q_dup_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    return float16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline float32x2x3_t vld3_dup_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,2> _a2; _a2.fill(_v2);
    return float32x2x3_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2)};
}
inline float32x4x3_t vld3q_dup_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,4> _a2; _a2.fill(_v2);
    return float32x4x3_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2)};
}
inline poly8x8x3_t vld3_dup_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,8> _a2; _a2.fill(_v2);
    return poly8x8x3_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2)};
}
inline poly8x16x3_t vld3q_dup_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,16> _a2; _a2.fill(_v2);
    return poly8x16x3_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2)};
}
inline poly16x4x3_t vld3_dup_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    return poly16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline poly16x8x3_t vld3q_dup_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    return poly16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline int64x1x3_t vld3_dup_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,1> _a2; _a2.fill(_v2);
    return int64x1x3_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1), NeonVector<64,1>(tm,_a2)};
}
inline uint64x1x3_t vld3_dup_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,1> _a2; _a2.fill(_v2);
    return uint64x1x3_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1), NeonVector<64,1>(tm,_a2)};
}
inline poly64x1x3_t vld3_dup_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,1> _a2; _a2.fill(_v2);
    return poly64x1x3_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1), NeonVector<64,1>(tm,_a2)};
}
inline int64x2x3_t vld3q_dup_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,2> _a2; _a2.fill(_v2);
    return int64x2x3_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2)};
}
inline uint64x2x3_t vld3q_dup_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,2> _a2; _a2.fill(_v2);
    return uint64x2x3_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2)};
}
inline poly64x2x3_t vld3q_dup_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,2> _a2; _a2.fill(_v2);
    return poly64x2x3_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2)};
}
inline float64x1x3_t vld3_dup_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,1> _a2; _a2.fill(_v2);
    return float64x1x3_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1), NeonVector<64,1>(tm,_a2)};
}
inline float64x2x3_t vld3q_dup_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,2> _a2; _a2.fill(_v2);
    return float64x2x3_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2)};
}
inline mfloat8x8x3_t vld3_dup_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,8> _a2; _a2.fill(_v2);
    return mfloat8x8x3_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2)};
}
inline mfloat8x16x3_t vld3q_dup_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,16> _a2; _a2.fill(_v2);
    return mfloat8x16x3_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2)};
}
inline bfloat16x4x3_t vld3_dup_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    return bfloat16x4x3_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2)};
}
inline bfloat16x8x3_t vld3q_dup_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    return bfloat16x8x3_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2)};
}
inline int8x8x4_t vld4_dup_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+3,8); std::array<Term,8> _a3; _a3.fill(_v3);
    return int8x8x4_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2), NeonVector<8,8>(tm,_a3)};
}
inline int8x16x4_t vld4q_dup_s8(int8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,16> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+3,8); std::array<Term,16> _a3; _a3.fill(_v3);
    return int8x16x4_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2), NeonVector<8,16>(tm,_a3)};
}
inline int16x4x4_t vld4_dup_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,4> _a3; _a3.fill(_v3);
    return int16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline int16x8x4_t vld4q_dup_s16(int16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,8> _a3; _a3.fill(_v3);
    return int16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline int32x2x4_t vld4_dup_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,2> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+12,32); std::array<Term,2> _a3; _a3.fill(_v3);
    return int32x2x4_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2), NeonVector<32,2>(tm,_a3)};
}
inline int32x4x4_t vld4q_dup_s32(int32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,4> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+12,32); std::array<Term,4> _a3; _a3.fill(_v3);
    return int32x4x4_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2), NeonVector<32,4>(tm,_a3)};
}
inline uint8x8x4_t vld4_dup_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+3,8); std::array<Term,8> _a3; _a3.fill(_v3);
    return uint8x8x4_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2), NeonVector<8,8>(tm,_a3)};
}
inline uint8x16x4_t vld4q_dup_u8(uint8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,16> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+3,8); std::array<Term,16> _a3; _a3.fill(_v3);
    return uint8x16x4_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2), NeonVector<8,16>(tm,_a3)};
}
inline uint16x4x4_t vld4_dup_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,4> _a3; _a3.fill(_v3);
    return uint16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline uint16x8x4_t vld4q_dup_u16(uint16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,8> _a3; _a3.fill(_v3);
    return uint16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline uint32x2x4_t vld4_dup_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,2> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+12,32); std::array<Term,2> _a3; _a3.fill(_v3);
    return uint32x2x4_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2), NeonVector<32,2>(tm,_a3)};
}
inline uint32x4x4_t vld4q_dup_u32(uint32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,4> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+12,32); std::array<Term,4> _a3; _a3.fill(_v3);
    return uint32x4x4_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2), NeonVector<32,4>(tm,_a3)};
}
inline float16x4x4_t vld4_dup_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,4> _a3; _a3.fill(_v3);
    return float16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline float16x8x4_t vld4q_dup_f16(float16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,8> _a3; _a3.fill(_v3);
    return float16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline float32x2x4_t vld4_dup_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,2> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+12,32); std::array<Term,2> _a3; _a3.fill(_v3);
    return float32x2x4_t{NeonVector<32,2>(tm,_a0), NeonVector<32,2>(tm,_a1), NeonVector<32,2>(tm,_a2), NeonVector<32,2>(tm,_a3)};
}
inline float32x4x4_t vld4q_dup_f32(float32_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,32); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+4,32); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+8,32); std::array<Term,4> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+12,32); std::array<Term,4> _a3; _a3.fill(_v3);
    return float32x4x4_t{NeonVector<32,4>(tm,_a0), NeonVector<32,4>(tm,_a1), NeonVector<32,4>(tm,_a2), NeonVector<32,4>(tm,_a3)};
}
inline poly8x8x4_t vld4_dup_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+3,8); std::array<Term,8> _a3; _a3.fill(_v3);
    return poly8x8x4_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2), NeonVector<8,8>(tm,_a3)};
}
inline poly8x16x4_t vld4q_dup_p8(poly8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,16> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+3,8); std::array<Term,16> _a3; _a3.fill(_v3);
    return poly8x16x4_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2), NeonVector<8,16>(tm,_a3)};
}
inline poly16x4x4_t vld4_dup_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,4> _a3; _a3.fill(_v3);
    return poly16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline poly16x8x4_t vld4q_dup_p16(poly16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,8> _a3; _a3.fill(_v3);
    return poly16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline int64x1x4_t vld4_dup_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,1> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+24,64); std::array<Term,1> _a3; _a3.fill(_v3);
    return int64x1x4_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1), NeonVector<64,1>(tm,_a2), NeonVector<64,1>(tm,_a3)};
}
inline uint64x1x4_t vld4_dup_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,1> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+24,64); std::array<Term,1> _a3; _a3.fill(_v3);
    return uint64x1x4_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1), NeonVector<64,1>(tm,_a2), NeonVector<64,1>(tm,_a3)};
}
inline poly64x1x4_t vld4_dup_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,1> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+24,64); std::array<Term,1> _a3; _a3.fill(_v3);
    return poly64x1x4_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1), NeonVector<64,1>(tm,_a2), NeonVector<64,1>(tm,_a3)};
}
inline int64x2x4_t vld4q_dup_s64(int64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,2> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+24,64); std::array<Term,2> _a3; _a3.fill(_v3);
    return int64x2x4_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2), NeonVector<64,2>(tm,_a3)};
}
inline uint64x2x4_t vld4q_dup_u64(uint64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,2> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+24,64); std::array<Term,2> _a3; _a3.fill(_v3);
    return uint64x2x4_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2), NeonVector<64,2>(tm,_a3)};
}
inline poly64x2x4_t vld4q_dup_p64(poly64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,2> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+24,64); std::array<Term,2> _a3; _a3.fill(_v3);
    return poly64x2x4_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2), NeonVector<64,2>(tm,_a3)};
}
inline float64x1x4_t vld4_dup_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,1> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,1> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,1> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+24,64); std::array<Term,1> _a3; _a3.fill(_v3);
    return float64x1x4_t{NeonVector<64,1>(tm,_a0), NeonVector<64,1>(tm,_a1), NeonVector<64,1>(tm,_a2), NeonVector<64,1>(tm,_a3)};
}
inline float64x2x4_t vld4q_dup_f64(float64_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,64); std::array<Term,2> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+8,64); std::array<Term,2> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+16,64); std::array<Term,2> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+24,64); std::array<Term,2> _a3; _a3.fill(_v3);
    return float64x2x4_t{NeonVector<64,2>(tm,_a0), NeonVector<64,2>(tm,_a1), NeonVector<64,2>(tm,_a2), NeonVector<64,2>(tm,_a3)};
}
inline mfloat8x8x4_t vld4_dup_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+3,8); std::array<Term,8> _a3; _a3.fill(_v3);
    return mfloat8x8x4_t{NeonVector<8,8>(tm,_a0), NeonVector<8,8>(tm,_a1), NeonVector<8,8>(tm,_a2), NeonVector<8,8>(tm,_a3)};
}
inline mfloat8x16x4_t vld4q_dup_mf8(mfloat8_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,8); std::array<Term,16> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+1,8); std::array<Term,16> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+2,8); std::array<Term,16> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+3,8); std::array<Term,16> _a3; _a3.fill(_v3);
    return mfloat8x16x4_t{NeonVector<8,16>(tm,_a0), NeonVector<8,16>(tm,_a1), NeonVector<8,16>(tm,_a2), NeonVector<8,16>(tm,_a3)};
}
inline bfloat16x4x4_t vld4_dup_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,4> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,4> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,4> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,4> _a3; _a3.fill(_v3);
    return bfloat16x4x4_t{NeonVector<16,4>(tm,_a0), NeonVector<16,4>(tm,_a1), NeonVector<16,4>(tm,_a2), NeonVector<16,4>(tm,_a3)};
}
inline bfloat16x8x4_t vld4q_dup_bf16(bfloat16_t const * ptr) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    Term _v0=_b.loadScalar(_o+0,16); std::array<Term,8> _a0; _a0.fill(_v0);
    Term _v1=_b.loadScalar(_o+2,16); std::array<Term,8> _a1; _a1.fill(_v1);
    Term _v2=_b.loadScalar(_o+4,16); std::array<Term,8> _a2; _a2.fill(_v2);
    Term _v3=_b.loadScalar(_o+6,16); std::array<Term,8> _a3; _a3.fill(_v3);
    return bfloat16x8x4_t{NeonVector<16,8>(tm,_a0), NeonVector<16,8>(tm,_a1), NeonVector<16,8>(tm,_a2), NeonVector<16,8>(tm,_a3)};
}
inline uint64x1_t vldap1_lane_u64(uint64_t const * ptr, const uint64x1_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline uint64x2_t vldap1q_lane_u64(uint64_t const * ptr, const uint64x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline int64x1_t vldap1_lane_s64(int64_t const * ptr, const int64x1_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline int64x2_t vldap1q_lane_s64(int64_t const * ptr, const int64x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline float64x1_t vldap1_lane_f64(float64_t const * ptr, const float64x1_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline float64x2_t vldap1q_lane_f64(float64_t const * ptr, const float64x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline poly64x1_t vldap1_lane_p64(poly64_t const * ptr, const poly64x1_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline poly64x2_t vldap1q_lane_p64(poly64_t const * ptr, const poly64x2_t& src, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    auto _r = src;
    _r.setLane(lane, _b.loadScalar(_o, 64));
    return _r;
}
inline void vstl1_lane_u64(uint64_t * ptr, const uint64x1_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vstl1q_lane_u64(uint64_t * ptr, const uint64x2_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vstl1_lane_s64(int64_t * ptr, const int64x1_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vstl1q_lane_s64(int64_t * ptr, const int64x2_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vstl1_lane_f64(float64_t * ptr, const float64x1_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vstl1q_lane_f64(float64_t * ptr, const float64x2_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vstl1_lane_p64(poly64_t * ptr, const poly64x1_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline void vstl1q_lane_p64(poly64_t * ptr, const poly64x2_t& val, const int lane) {
    auto& tm = g_ctx->tm;
    auto& _b = g_ctx->findBuffer(ptr);
    size_t _o = _b.ptrToByteOffset(ptr);
    _b.storeScalar(_o, val.getLane(lane), 64);
}
inline poly128_t vldrq_p128(poly128_t const * ptr) { return {}; }
inline void vstrq_p128(poly128_t * ptr, poly128_t val) { }

} // namespace salt_cvc5
