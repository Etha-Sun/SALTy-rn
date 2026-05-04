#pragma once
// NEON intrinsics — cvc5 port, scoped to the operations used by source kernels
// that mirror kernels/target/.  Mirrors src/verification/neon/intrinsics.hpp.

#include "../core/context.hpp"
#include "../core/symbolic_buffer.hpp"
#include "../core/symbolic_scalar.hpp"
#include "../core/symbolic_vector.hpp"

#include <cmath>
#include <cstring>
#include <cvc5/cvc5.h>

#include <array>
#include <cstddef>
#include <cstdint>
#include <string>

namespace salt_cvc5 {

// ===========================================================================
// Type aliases not present in symbolic_vector.hpp's restricted set.
// These are no-ops if a name is already aliased — both refer to the same target.
// ===========================================================================
using int8x8_t    = NeonVector<8, 8>;
using int16x4_t   = NeonVector<16, 4>;
using int32x2_t   = NeonVector<32, 2>;
using uint8x8_t   = NeonVector<8, 8>;
// uint16x4_t / uint32x2_t / float16x4_t already aliased.

using int8x16_t   = NeonVector<8, 16>;
using int16x8_t   = NeonVector<16, 8>;
using int32x4_t   = NeonVector<32, 4>;
using uint8x16_t  = NeonVector<8, 16>;
// uint16x8_t already aliased.
using uint32x4_t  = NeonVector<32, 4>;
using float32x2_t = NeonVector<32, 2>;
using float32x4_t = NeonVector<32, 4>;

// FP16 helpers: BV16 ↔ FP16 (5-bit exponent, 11-bit significand).
// cvc5 has no fp.to_ieee_bv either, so we use the same fresh-const +
// asserted-equality trick the bitwuzla tree uses.
inline Term load_as_fp16(TermManager& tm, Term bv16) {
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    return tm.mkTerm(op, {bv16});
}

inline size_t& fp16_bv_counter() {
    static size_t counter = 0;
    return counter;
}

inline Term store_fp16_as_bv(TermManager& tm, Term fp_val) {
    Sort bv16 = tm.mkBitVectorSort(16);
    Term bv = tm.mkConst(bv16, "_neon_fp16_2bv_" + std::to_string(fp16_bv_counter()++));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    Term fp_from_bv = tm.mkTerm(op, {bv});
    g_ctx->solver->assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, fp_val}));
    return bv;
}

// ===========================================================================
// VDUP / VMOV — broadcast scalar to all lanes
// ===========================================================================
inline uint16x4_t vdup_n_u16(uint16_t v) {
    auto& tm = g_ctx->tm;
    Term val = mk_bv_val(tm, 16, v);
    std::array<Term, 4> l; l.fill(val);
    return uint16x4_t(tm, l);
}
inline uint16x4_t vmov_n_u16(uint16_t v) { return vdup_n_u16(v); }

// ===========================================================================
// VLD1 — full vector load
// ===========================================================================
inline uint16x4_t vld1_u16(const uint16_t* p) {
    auto& b = g_ctx->findBuffer(p);
    return b.loadNeon<16, 4>(b.ptrToByteOffset(p));
}

// VLD1 lane: load one scalar, insert into existing vector at lane
inline uint16x4_t vld1_lane_u16(const uint16_t* p, const uint16x4_t& v, int lane) {
    auto r = v;
    auto& b = g_ctx->findBuffer(p);
    r.setLane(lane, b.loadScalar(b.ptrToByteOffset(p), 16));
    return r;
}

// ===========================================================================
// VST1 lane — store one lane of a vector to memory
// ===========================================================================
inline void vst1_lane_u16(void* ptr, const uint16x4_t& val, int lane) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeScalar(buf.ptrToByteOffset(ptr), val.getLane(lane), 16);
}

inline void vst1_lane_u32(void* ptr, const uint32x2_t& val, int lane) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeScalar(buf.ptrToByteOffset(ptr), val.getLane(lane), 32);
}

// ===========================================================================
// REINTERPRET — same width, different element-type view (no-op on lanes)
// ===========================================================================
inline float16x4_t vreinterpret_f16_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return float16x4_t(tm, lanes);
}

inline uint16x4_t vreinterpret_u16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return uint16x4_t(tm, lanes);
}

// 4×16 → 2×32: pack pairs of 16-bit lanes into 32-bit (little-endian).
inline uint32x2_t vreinterpret_u32_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        // little-endian: lo lane goes in low half
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_CONCAT,
                             {a.getLane(i*2 + 1), a.getLane(i*2)});
    }
    return uint32x2_t(tm, lanes);
}

// ===========================================================================
// FP16 FMA by lane: result[i] = a[i] + b[i] * v[lane]
// (A64 FMLA Vd.4H,Vn.4H,Vm.H[lane]; fused, single rounding)
// ===========================================================================
inline float16x4_t vfma_lane_f16(const float16x4_t& a, const float16x4_t& b,
                                  const float16x4_t& v, int lane) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Term v_fp = load_as_fp16(tm, v.getLane(lane));
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        Term b_fp = load_as_fp16(tm, b.getLane(i));
        Term result_fp = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, b_fp, v_fp, a_fp});
        lanes[i] = store_fp16_as_bv(tm, result_fp);
    }
    return float16x4_t(tm, lanes);
}

// ===========================================================================
// FP16 MIN / MAX (use FP_MIN/FP_MAX — matches RVV semantics)
// ===========================================================================
template <size_t NumLanes>
inline NeonVector<16, NumLanes> neon_vmin_f16_maxnum(
    const NeonVector<16, NumLanes>& a, const NeonVector<16, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        Term b_fp = load_as_fp16(tm, b.getLane(i));
        lanes[i] = store_fp16_as_bv(tm, tm.mkTerm(Kind::FLOATINGPOINT_MIN, {a_fp, b_fp}));
    }
    return NeonVector<16, NumLanes>(tm, lanes);
}

template <size_t NumLanes>
inline NeonVector<16, NumLanes> neon_vmax_f16_maxnum(
    const NeonVector<16, NumLanes>& a, const NeonVector<16, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        Term b_fp = load_as_fp16(tm, b.getLane(i));
        lanes[i] = store_fp16_as_bv(tm, tm.mkTerm(Kind::FLOATINGPOINT_MAX, {a_fp, b_fp}));
    }
    return NeonVector<16, NumLanes>(tm, lanes);
}

inline float16x4_t vmin_f16(const float16x4_t& a, const float16x4_t& b) { return neon_vmin_f16_maxnum(a, b); }
inline float16x4_t vmax_f16(const float16x4_t& a, const float16x4_t& b) { return neon_vmax_f16_maxnum(a, b); }

// ===========================================================================
// vzip_f16 — interleave (ZIP1/ZIP2)
// val[0] = { a[0], b[0], a[1], b[1] }
// val[1] = { a[2], b[2], a[3], b[3] }
// ===========================================================================
struct float16x4x2_t {
    float16x4_t val[2];
    float16x4x2_t(const float16x4_t& v0, const float16x4_t& v1) : val{v0, v1} {}
};

inline float16x4x2_t vzip_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lo, hi;
    for (int i = 0; i < 2; i++) {
        lo[2*i]     = a.getLane(i);
        lo[2*i + 1] = b.getLane(i);
        hi[2*i]     = a.getLane(i + 2);
        hi[2*i + 1] = b.getLane(i + 2);
    }
    return float16x4x2_t(float16x4_t(tm, lo), float16x4_t(tm, hi));
}

// ===========================================================================
// PHASE 2 ADDITIONS — full NEON surface for kernels/source/ counterparts of
// kernels/target/.
// ===========================================================================

// ---------------------------------------------------------------------------
// FP32 helpers (BV32 ↔ FP32 round-trip via fresh symbolic constant + asserted
// equality, since cvc5 has no fp.to_ieee_bv).
// ---------------------------------------------------------------------------
inline Term load_as_fp32(TermManager& tm, Term bv32) {
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    return tm.mkTerm(op, {bv32});
}
inline size_t& fp32_bv_counter() {
    static size_t counter = 0;
    return counter;
}
inline Term store_fp32_as_bv(TermManager& tm, Term fp_val) {
    Sort bv32 = tm.mkBitVectorSort(32);
    Term bv = tm.mkConst(bv32, "_neon_fp32_2bv_" + std::to_string(fp32_bv_counter()++));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    Term fp_from_bv = tm.mkTerm(op, {bv});
    g_ctx->solver->assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, fp_val}));
    return bv;
}
inline Term mk_fp32_from_float_concrete(TermManager& tm, float v) {
    uint32_t bits;
    std::memcpy(&bits, &v, sizeof(bits));
    Term bv = tm.mkBitVector(32, static_cast<uint64_t>(bits));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    return tm.mkTerm(op, {bv});
}

// ---------------------------------------------------------------------------
// signed_saturate — narrowing helper used by VQ* intrinsics
// ---------------------------------------------------------------------------
inline Term signed_saturate(TermManager& tm, Term wide_val, size_t wide_bits, size_t narrow_bits) {
    int64_t max_val = (1LL << (narrow_bits - 1)) - 1;
    int64_t min_val = -(1LL << (narrow_bits - 1));
    Term t_max = mk_bv_val(tm, wide_bits, max_val);
    Term t_min = mk_bv_val(tm, wide_bits, min_val);
    Term gt_max = tm.mkTerm(Kind::BITVECTOR_SGT, {wide_val, t_max});
    Term lt_min = tm.mkTerm(Kind::BITVECTOR_SLT, {wide_val, t_min});
    Term clamped = tm.mkTerm(Kind::ITE, {gt_max, t_max,
        tm.mkTerm(Kind::ITE, {lt_min, t_min, wide_val})});
    Op extract_op = tm.mkOp(Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(narrow_bits - 1), 0u});
    return tm.mkTerm(extract_op, {clamped});
}

// ---------------------------------------------------------------------------
// VDUP / VMOV broadcast — common templates for all integer types
// ---------------------------------------------------------------------------
template <size_t Bits, size_t Lanes>
inline NeonVector<Bits, Lanes> neon_vdup_impl_int(int64_t value) {
    auto& tm = g_ctx->tm;
    Term v = mk_bv_val(tm, Bits, value);
    std::array<Term, Lanes> lanes; lanes.fill(v);
    return NeonVector<Bits, Lanes>(tm, lanes);
}
inline int8x8_t   vdup_n_s8(int8_t v)    { return neon_vdup_impl_int<8, 8>(v); }
inline int8x16_t  vdupq_n_s8(int8_t v)   { return neon_vdup_impl_int<8, 16>(v); }
inline int16x4_t  vdup_n_s16(int16_t v)  { return neon_vdup_impl_int<16, 4>(v); }
inline int16x8_t  vdupq_n_s16(int16_t v) { return neon_vdup_impl_int<16, 8>(v); }
inline int32x2_t  vdup_n_s32(int32_t v)  { return neon_vdup_impl_int<32, 2>(v); }
inline int32x4_t  vdupq_n_s32(int32_t v) { return neon_vdup_impl_int<32, 4>(v); }
inline uint8x8_t  vdup_n_u8(uint8_t v)   { return neon_vdup_impl_int<8, 8>(v); }
inline uint8x16_t vdupq_n_u8(uint8_t v)  { return neon_vdup_impl_int<8, 16>(v); }
inline uint16x8_t vdupq_n_u16(uint16_t v){ return neon_vdup_impl_int<16, 8>(v); }
inline uint32x4_t vdupq_n_u32(uint32_t v){ return neon_vdup_impl_int<32, 4>(v); }
inline int16x8_t  vmovq_n_s16(int16_t v) { return vdupq_n_s16(v); }
inline int32x4_t  vmovq_n_s32(int32_t v) { return vdupq_n_s32(v); }

inline float32x4_t vdupq_n_f32(float v) {
    auto& tm = g_ctx->tm;
    Term bv = store_fp32_as_bv(tm, mk_fp32_from_float_concrete(tm, v));
    std::array<Term, 4> lanes; lanes.fill(bv);
    return float32x4_t(tm, lanes);
}
inline float32x4_t vmovq_n_f32(float v) { return vdupq_n_f32(v); }

// ---------------------------------------------------------------------------
// VLD1 / VST1 — full vector loads/stores
// ---------------------------------------------------------------------------
inline int8x8_t   vld1_s8 (const int8_t*  p)  { auto& b = g_ctx->findBuffer(p); return b.loadNeon<8, 8>(b.ptrToByteOffset(p)); }
inline int8x16_t  vld1q_s8(const int8_t*  p)  { auto& b = g_ctx->findBuffer(p); return b.loadNeon<8, 16>(b.ptrToByteOffset(p)); }
inline uint16x8_t vld1q_u16(const uint16_t* p){ auto& b = g_ctx->findBuffer(p); return b.loadNeon<16, 8>(b.ptrToByteOffset(p)); }
inline float32x4_t vld1q_f32(const float* p)  { auto& b = g_ctx->findBuffer(p); return b.loadNeon<32, 4>(b.ptrToByteOffset(p)); }

inline void vst1_s8 (int8_t* p,  const int8x8_t&  v) { auto& b = g_ctx->findBuffer(p); b.storeNeon<8, 8>(b.ptrToByteOffset(p), v); }
inline void vst1q_s8(int8_t* p,  const int8x16_t& v) { auto& b = g_ctx->findBuffer(p); b.storeNeon<8, 16>(b.ptrToByteOffset(p), v); }
inline void vst1_u16(uint16_t* p,const uint16x4_t& v){ auto& b = g_ctx->findBuffer(p); b.storeNeon<16, 4>(b.ptrToByteOffset(p), v); }
inline void vst1q_u16(uint16_t* p,const uint16x8_t& v){auto& b = g_ctx->findBuffer(p); b.storeNeon<16, 8>(b.ptrToByteOffset(p), v); }
inline void vst1q_f32(float* p,  const float32x4_t& v){auto& b = g_ctx->findBuffer(p); b.storeNeon<32, 4>(b.ptrToByteOffset(p), v); }
inline void vst1_f32 (float* p,  const float32x2_t& v){auto& b = g_ctx->findBuffer(p); b.storeNeon<32, 2>(b.ptrToByteOffset(p), v); }
inline void vst1_lane_f32(float* ptr, const float32x2_t& val, int lane) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeScalar(buf.ptrToByteOffset(ptr), val.getLane(lane), 32);
}
inline void vst1_lane_s8(int8_t* ptr, const int8x8_t& val, int lane) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeScalar(buf.ptrToByteOffset(ptr), val.getLane(lane), 8);
}

// ld1 lane / dup variants
template<size_t Bits, size_t Lanes>
inline NeonVector<Bits, Lanes> neon_vld1q_dup(const void* p) {
    auto& tm = g_ctx->tm;
    auto& b = g_ctx->findBuffer(p);
    Term sc = b.loadScalar(b.ptrToByteOffset(p), Bits);
    std::array<Term, Lanes> lanes; lanes.fill(sc);
    return NeonVector<Bits, Lanes>(tm, lanes);
}
inline uint16x8_t vld1q_dup_u16(const uint16_t* p) { return neon_vld1q_dup<16, 8>(p); }
inline int32x2_t vld1_dup_s32(const int32_t* p)    { return neon_vld1q_dup<32, 2>(p); }
inline int32x2_t vld1_lane_s32(const int32_t* p, const int32x2_t& v, int lane) {
    auto r = v;
    auto& b = g_ctx->findBuffer(p);
    r.setLane(lane, b.loadScalar(b.ptrToByteOffset(p), 32));
    return r;
}

// ---------------------------------------------------------------------------
// Generic integer ADD / SUB / MUL — element-wise (templates)
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vadd_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_ADD, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vsub_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_SUB, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmul_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_MULT, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vand_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_AND, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vbic_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term not_b = tm.mkTerm(Kind::BITVECTOR_NOT, {b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_AND, {a.getLane(i), not_b});
    }
    return NeonVector<B,N>(tm, lanes);
}

inline int16x8_t  vaddq_s16(const int16x8_t& a, const int16x8_t& b)  { return neon_vadd_impl(a,b); }
inline int32x4_t  vaddq_s32(const int32x4_t& a, const int32x4_t& b)  { return neon_vadd_impl(a,b); }
inline uint16x4_t vadd_u16 (const uint16x4_t& a, const uint16x4_t& b){ return neon_vadd_impl(a,b); }
inline uint16x8_t vaddq_u16(const uint16x8_t& a, const uint16x8_t& b){ return neon_vadd_impl(a,b); }
inline uint32x4_t vaddq_u32(const uint32x4_t& a, const uint32x4_t& b){ return neon_vadd_impl(a,b); }
inline int32x4_t  vandq_s32(const int32x4_t& a, const int32x4_t& b)  { return neon_vand_impl(a,b); }
inline uint16x4_t vand_u16 (const uint16x4_t& a, const uint16x4_t& b){ return neon_vand_impl(a,b); }
inline uint16x8_t vandq_u16(const uint16x8_t& a, const uint16x8_t& b){ return neon_vand_impl(a,b); }
inline uint32x4_t vandq_u32(const uint32x4_t& a, const uint32x4_t& b){ return neon_vand_impl(a,b); }
inline uint16x8_t vbicq_u16(const uint16x8_t& a, const uint16x8_t& b){ return neon_vbic_impl(a,b); }
inline uint32x4_t vbicq_u32(const uint32x4_t& a, const uint32x4_t& b){ return neon_vbic_impl(a,b); }

// ---------------------------------------------------------------------------
// VBSL — bitwise select: (mask & a) | (~mask & b)
// ---------------------------------------------------------------------------
template <size_t B, size_t N, typename M>
inline NeonVector<B,N> neon_vbsl_impl(const M& mask, const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term m = mask.getLane(i);
        Term not_m = tm.mkTerm(Kind::BITVECTOR_NOT, {m});
        Term sel_a = tm.mkTerm(Kind::BITVECTOR_AND, {m, a.getLane(i)});
        Term sel_b = tm.mkTerm(Kind::BITVECTOR_AND, {not_m, b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_OR, {sel_a, sel_b});
    }
    return NeonVector<B,N>(tm, lanes);
}
inline uint16x4_t vbsl_u16(const uint16x4_t& m, const uint16x4_t& a, const uint16x4_t& b)  { return neon_vbsl_impl(m,a,b); }
inline uint16x8_t vbslq_u16(const uint16x8_t& m, const uint16x8_t& a, const uint16x8_t& b) { return neon_vbsl_impl(m,a,b); }
inline int16x8_t  vbslq_s16(const uint16x8_t& m, const int16x8_t& a, const int16x8_t& b)   { return neon_vbsl_impl<16,8,uint16x8_t>(m,a,b); }
inline float32x4_t vbslq_f32(const uint32x4_t& m, const float32x4_t& a, const float32x4_t& b) { return neon_vbsl_impl<32,4,uint32x4_t>(m,a,b); }
inline float16x4_t vbsl_f16(const uint16x4_t& m, const float16x4_t& a, const float16x4_t& b)  { return neon_vbsl_impl<16,4,uint16x4_t>(m,a,b); }
inline float16x8_t vbslq_f16(const uint16x8_t& m, const float16x8_t& a, const float16x8_t& b) { return neon_vbsl_impl<16,8,uint16x8_t>(m,a,b); }

// ---------------------------------------------------------------------------
// Integer compare (mask producing all-ones / all-zeros per lane)
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vcmp_int(const NeonVector<B,N>& a, const NeonVector<B,N>& b, Kind cmp) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term c = tm.mkTerm(cmp, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::ITE, {c, mk_bv_val(tm, B, -1), mk_bv_val(tm, B, 0)});
    }
    return NeonVector<B,N>(tm, lanes);
}
inline uint16x8_t vcgtq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vcmp_int(a, b, Kind::BITVECTOR_UGT); }
inline uint32x4_t vcgtq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vcmp_int(a, b, Kind::BITVECTOR_UGT); }
inline uint16x8_t vcltq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term c = tm.mkTerm(Kind::BITVECTOR_SLT, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::ITE, {c, mk_bv_val(tm, 16, -1), mk_bv_val(tm, 16, 0)});
    }
    return uint16x8_t(tm, lanes);
}
inline uint32x4_t vcltq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term c = tm.mkTerm(Kind::BITVECTOR_SLT, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::ITE, {c, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// Integer MIN/MAX (signed, templates)
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmaxs_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term c = tm.mkTerm(Kind::BITVECTOR_SGE, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::ITE, {c, a.getLane(i), b.getLane(i)});
    }
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmins_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm; std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term c = tm.mkTerm(Kind::BITVECTOR_SLE, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::ITE, {c, a.getLane(i), b.getLane(i)});
    }
    return NeonVector<B,N>(tm, lanes);
}
inline int8x8_t   vmax_s8 (const int8x8_t& a, const int8x8_t& b)   { return neon_vmaxs_impl(a, b); }
inline int8x8_t   vmin_s8 (const int8x8_t& a, const int8x8_t& b)   { return neon_vmins_impl(a, b); }
inline int8x16_t  vmaxq_s8(const int8x16_t& a, const int8x16_t& b) { return neon_vmaxs_impl(a, b); }
inline int8x16_t  vminq_s8(const int8x16_t& a, const int8x16_t& b) { return neon_vmins_impl(a, b); }
inline int16x8_t  vmaxq_s16(const int16x8_t& a, const int16x8_t& b) { return neon_vmaxs_impl(a, b); }
inline int16x8_t  vminq_s16(const int16x8_t& a, const int16x8_t& b) { return neon_vmins_impl(a, b); }

// Integer multiply (vector-vector)
inline int32x4_t vmulq_s32(const int32x4_t& a, const int32x4_t& b) { return neon_vmul_impl(a, b); }

// Reinterpret int8 → smaller-lane unsigned (concat-style)
inline uint16x4_t vreinterpret_u16_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_CONCAT, {a.getLane(i*2 + 1), a.getLane(i*2)});
    }
    return uint16x4_t(tm, lanes);
}
inline uint32x2_t vreinterpret_u32_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        // little-endian: lane[i] = concat(a[i*4+3], a[i*4+2], a[i*4+1], a[i*4+0])
        Term result = a.getLane(i * 4);
        for (int j = 1; j < 4; j++) {
            result = tm.mkTerm(Kind::BITVECTOR_CONCAT, {a.getLane(i * 4 + j), result});
        }
        lanes[i] = result;
    }
    return uint32x2_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// Integer EXT (extract from concatenated pair)
// ---------------------------------------------------------------------------
inline int8x8_t vext_s8(const int8x8_t& a, const int8x8_t& b, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        int idx = i + n;
        lanes[i] = (idx < 8) ? a.getLane(idx) : b.getLane(idx - 8);
    }
    return int8x8_t(tm, lanes);
}
inline float16x4_t vext_f16(const float16x4_t& a, const float16x4_t& b, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int idx = i + n;
        lanes[i] = (idx < 4) ? a.getLane(idx) : b.getLane(idx - 4);
    }
    return float16x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// VSHLQ_N — left shift by immediate
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vshl_n_impl(const NeonVector<B,N>& a, int n) {
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, B, n);
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_SHL, {a.getLane(i), sh});
    return NeonVector<B,N>(tm, lanes);
}
inline int16x8_t vshlq_n_s16(const int16x8_t& a, int n) { return neon_vshl_n_impl(a, n); }
inline int32x4_t vshlq_n_s32(const int32x4_t& a, int n) { return neon_vshl_n_impl(a, n); }

// ---------------------------------------------------------------------------
// Widening: VMOVL, VADDL, VSUBL, VADDW, VSUBW, VMULL
// ---------------------------------------------------------------------------
inline int32x4_t vmovl_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = tm.mkTerm(sext, {a.getLane(i)});
    return int32x4_t(tm, lanes);
}
inline int16x8_t vsubl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mkTerm(sext, {a.getLane(i)});
        Term be = tm.mkTerm(sext, {b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_SUB, {ae, be});
    }
    return int16x8_t(tm, lanes);
}
inline int16x8_t vsubl_high_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mkTerm(sext, {a.getLane(i + 8)});
        Term be = tm.mkTerm(sext, {b.getLane(i + 8)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_SUB, {ae, be});
    }
    return int16x8_t(tm, lanes);
}
inline int16x8_t vaddw_s8(const int16x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term be = tm.mkTerm(sext, {b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_ADD, {a.getLane(i), be});
    }
    return int16x8_t(tm, lanes);
}
inline int16x8_t vsubw_s8(const int16x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term be = tm.mkTerm(sext, {b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_SUB, {a.getLane(i), be});
    }
    return int16x8_t(tm, lanes);
}
inline uint16x8_t vaddw_u8(const uint16x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    Op zext = tm.mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8});
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term be = tm.mkTerm(zext, {b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_ADD, {a.getLane(i), be});
    }
    return uint16x8_t(tm, lanes);
}
inline uint32x4_t vaddw_u16(const uint32x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    Op zext = tm.mkOp(Kind::BITVECTOR_ZERO_EXTEND, {16});
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term be = tm.mkTerm(zext, {b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_ADD, {a.getLane(i), be});
    }
    return uint32x4_t(tm, lanes);
}
inline int32x4_t vmull_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ae = tm.mkTerm(sext, {a.getLane(i)});
        Term be = tm.mkTerm(sext, {b.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_MULT, {ae, be});
    }
    return int32x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// VGET_LOW / VGET_HIGH / VCOMBINE / VGETQ_LANE
// ---------------------------------------------------------------------------
inline int16x4_t vget_low_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return int16x4_t(tm, lanes);
}
inline int16x4_t vget_high_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i + 4);
    return int16x4_t(tm, lanes);
}
inline int8x8_t vget_low_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i);
    return int8x8_t(tm, lanes);
}
inline float16x4_t vget_low_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return float16x4_t(tm, lanes);
}
inline float16x4_t vget_high_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i + 4);
    return float16x4_t(tm, lanes);
}
inline float32x2_t vget_low_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 2> lanes = {a.getLane(0), a.getLane(1)};
    return float32x2_t(tm, lanes);
}
inline float32x2_t vget_high_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 2> lanes = {a.getLane(2), a.getLane(3)};
    return float32x2_t(tm, lanes);
}

inline int16x8_t vcombine_s16(const int16x4_t& lo, const int16x4_t& hi) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 4; i++) { lanes[i] = lo.getLane(i); lanes[i+4] = hi.getLane(i); }
    return int16x8_t(tm, lanes);
}
inline int8x16_t vcombine_s8(const int8x8_t& lo, const int8x8_t& hi) {
    auto& tm = g_ctx->tm; std::array<Term, 16> lanes;
    for (int i = 0; i < 8; i++) { lanes[i] = lo.getLane(i); lanes[i+8] = hi.getLane(i); }
    return int8x16_t(tm, lanes);
}
inline int32x4_t vcombine_s32(const int32x2_t& lo, const int32x2_t& hi) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 2; i++) { lanes[i] = lo.getLane(i); lanes[i+2] = hi.getLane(i); }
    return int32x4_t(tm, lanes);
}
inline float32x4_t vcombine_f32(const float32x2_t& lo, const float32x2_t& hi) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 2; i++) { lanes[i] = lo.getLane(i); lanes[i+2] = hi.getLane(i); }
    return float32x4_t(tm, lanes);
}
inline uint8x16_t vcombine_u8(const uint8x8_t& lo, const uint8x8_t& hi) {
    auto& tm = g_ctx->tm; std::array<Term, 16> lanes;
    for (int i = 0; i < 8; i++) { lanes[i] = lo.getLane(i); lanes[i+8] = hi.getLane(i); }
    return uint8x16_t(tm, lanes);
}
inline uint16x8_t vcombine_u16(const uint16x4_t& lo, const uint16x4_t& hi) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 4; i++) { lanes[i] = lo.getLane(i); lanes[i+4] = hi.getLane(i); }
    return uint16x8_t(tm, lanes);
}

// vgetq_lane_u64: extract a 64-bit lane (used in NaN-detection codepath of qs8)
inline uint64_t vgetq_lane_u64(const NeonVector<64, 2>& a, int lane) {
    (void)a; (void)lane; return 0; // concrete-int return — not used in symbolic path
}

// ---------------------------------------------------------------------------
// Saturating arithmetic
// ---------------------------------------------------------------------------
inline int32x4_t vqsubq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {32});
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ae = tm.mkTerm(sext, {a.getLane(i)});
        Term be = tm.mkTerm(sext, {b.getLane(i)});
        Term diff = tm.mkTerm(Kind::BITVECTOR_SUB, {ae, be});
        lanes[i] = signed_saturate(tm, diff, 64, 32);
    }
    return int32x4_t(tm, lanes);
}
inline int16x8_t vqaddq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mkTerm(sext, {a.getLane(i)});
        Term be = tm.mkTerm(sext, {b.getLane(i)});
        Term sum = tm.mkTerm(Kind::BITVECTOR_ADD, {ae, be});
        lanes[i] = signed_saturate(tm, sum, 32, 16);
    }
    return int16x8_t(tm, lanes);
}
inline int16x4_t vqmovn_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = signed_saturate(tm, a.getLane(i), 32, 16);
    return int16x4_t(tm, lanes);
}
inline int8x8_t vqmovn_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = signed_saturate(tm, a.getLane(i), 16, 8);
    return int8x8_t(tm, lanes);
}
inline int16x8_t vqmovn_high_s32(const int16x4_t& lo, const int32x4_t& hi) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = lo.getLane(i);
    for (int i = 0; i < 4; i++) lanes[i + 4] = signed_saturate(tm, hi.getLane(i), 32, 16);
    return int16x8_t(tm, lanes);
}
inline int8x16_t vqmovn_high_s16(const int8x8_t& lo, const int16x8_t& hi) {
    auto& tm = g_ctx->tm; std::array<Term, 16> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = lo.getLane(i);
    for (int i = 0; i < 8; i++) lanes[i + 8] = signed_saturate(tm, hi.getLane(i), 16, 8);
    return int8x16_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// VQRDMULHQ_S16 — Signed Saturating Rounding Doubling Multiply High
// ---------------------------------------------------------------------------
inline int16x8_t vqrdmulhq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    Op sext16 = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    std::array<Term, 8> lanes;
    Term round_const = mk_bv_val(tm, 32, 1 << 15);
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mkTerm(sext16, {a.getLane(i)});
        Term be = tm.mkTerm(sext16, {b.getLane(i)});
        Term prod = tm.mkTerm(Kind::BITVECTOR_MULT, {ae, be});
        Term doubled = tm.mkTerm(Kind::BITVECTOR_ADD, {prod, prod});
        Term rounded = tm.mkTerm(Kind::BITVECTOR_ADD, {doubled, round_const});
        Term shifted = tm.mkTerm(Kind::BITVECTOR_ASHR, {rounded, mk_bv_val(tm, 32, 16)});
        lanes[i] = signed_saturate(tm, shifted, 32, 16);
    }
    return int16x8_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// VRSHLQ_S32 — Signed rounding shift left by signed amount per lane
// ---------------------------------------------------------------------------
inline int32x4_t vrshlq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    Term zero32 = mk_bv_val(tm, 32, 0);
    Term one64 = mk_bv_val(tm, 64, 1);
    Term zero64 = mk_bv_val(tm, 64, 0);
    Op extract7_0 = tm.mkOp(Kind::BITVECTOR_EXTRACT, {7u, 0u});
    Op extract31_0 = tm.mkOp(Kind::BITVECTOR_EXTRACT, {31u, 0u});
    Op sext24 = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {24});
    Op sext32 = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {32});
    Op zext32 = tm.mkOp(Kind::BITVECTOR_ZERO_EXTEND, {32});
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term shift_byte = tm.mkTerm(extract7_0, {b.getLane(i)});
        Term shift_s32 = tm.mkTerm(sext24, {shift_byte});
        Term is_right = tm.mkTerm(Kind::BITVECTOR_SLT, {shift_s32, zero32});
        Term neg_shift = tm.mkTerm(Kind::BITVECTOR_NEG, {shift_s32});
        Term a_wide = tm.mkTerm(sext32, {a.getLane(i)});
        Term neg_shift_64 = tm.mkTerm(zext32, {neg_shift});
        Term shift_minus_1 = tm.mkTerm(Kind::BITVECTOR_SUB, {neg_shift_64, one64});
        Term round_const = tm.mkTerm(Kind::BITVECTOR_SHL, {one64, shift_minus_1});
        Term neg_shift_is_zero = tm.mkTerm(Kind::EQUAL, {neg_shift, zero32});
        round_const = tm.mkTerm(Kind::ITE, {neg_shift_is_zero, zero64, round_const});
        Term rounded = tm.mkTerm(Kind::BITVECTOR_ADD, {a_wide, round_const});
        Term right_result_64 = tm.mkTerm(Kind::BITVECTOR_ASHR, {rounded, neg_shift_64});
        Term right_result = tm.mkTerm(extract31_0, {right_result_64});
        Term left_result = tm.mkTerm(Kind::BITVECTOR_SHL, {a.getLane(i), shift_s32});
        lanes[i] = tm.mkTerm(Kind::ITE, {is_right, right_result, left_result});
    }
    return int32x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// VMLA_S32 — multiply-accumulate (NOT fused for integer)
// ---------------------------------------------------------------------------
inline int32x4_t vmlaq_s32(const int32x4_t& acc, const int32x4_t& b, const int32x4_t& c) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term prod = tm.mkTerm(Kind::BITVECTOR_MULT, {b.getLane(i), c.getLane(i)});
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_ADD, {acc.getLane(i), prod});
    }
    return int32x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// FP arithmetic (float32) — vector-vector
// ---------------------------------------------------------------------------
template <size_t N>
inline NeonVector<32, N> fp32_binop(const NeonVector<32, N>& a, const NeonVector<32, N>& b, Kind op) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term res_fp = (op == Kind::FLOATINGPOINT_MAX || op == Kind::FLOATINGPOINT_MIN)
                       ? tm.mkTerm(op, {a_fp, b_fp})
                       : tm.mkTerm(op, {rm, a_fp, b_fp});
        lanes[i] = store_fp32_as_bv(tm, res_fp);
    }
    return NeonVector<32, N>(tm, lanes);
}
inline float32x4_t vaddq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FLOATINGPOINT_ADD); }
inline float32x4_t vsubq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FLOATINGPOINT_SUB); }
inline float32x4_t vmulq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FLOATINGPOINT_MULT); }
inline float32x4_t vdivq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FLOATINGPOINT_DIV); }
inline float32x4_t vminq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FLOATINGPOINT_MIN); }
inline float32x4_t vmaxq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FLOATINGPOINT_MAX); }

inline float32x4_t vfmaq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& c) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        Term bf = load_as_fp32(tm, b.getLane(i));
        Term cf = load_as_fp32(tm, c.getLane(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, bf, cf, af});
        lanes[i] = store_fp32_as_bv(tm, res);
    }
    return float32x4_t(tm, lanes);
}
inline float32x4_t vmlaq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& c) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        Term bf = load_as_fp32(tm, b.getLane(i));
        Term cf = load_as_fp32(tm, c.getLane(i));
        Term prod = tm.mkTerm(Kind::FLOATINGPOINT_MULT, {rm, bf, cf});
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_ADD, {rm, af, prod});
        lanes[i] = store_fp32_as_bv(tm, res);
    }
    return float32x4_t(tm, lanes);
}
inline float32x4_t vabsq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        lanes[i] = store_fp32_as_bv(tm, tm.mkTerm(Kind::FLOATINGPOINT_ABS, {af}));
    }
    return float32x4_t(tm, lanes);
}

// FP compare → uint32 mask
inline uint32x4_t vcgeq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        Term bf = load_as_fp32(tm, b.getLane(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {af, bf});
        lanes[i] = tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}
inline uint32x4_t vcgtq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        Term bf = load_as_fp32(tm, b.getLane(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_GT, {af, bf});
        lanes[i] = tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}
inline uint32x4_t vcltq_f32(const float32x4_t& a, const float32x4_t& b) { return vcgtq_f32(b, a); }

// "absolute" compares (vcalt/vcagt = compare with abs(b)) — used by vapproxgelu/velu
inline uint32x4_t vcaltq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        Term bf = load_as_fp32(tm, b.getLane(i));
        Term aa = tm.mkTerm(Kind::FLOATINGPOINT_ABS, {af});
        Term ba = tm.mkTerm(Kind::FLOATINGPOINT_ABS, {bf});
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_LT, {aa, ba});
        lanes[i] = tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// FP conversions
// ---------------------------------------------------------------------------
inline float32x4_t vcvtq_f32_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Op cvt = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {8, 24});
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term fp = tm.mkTerm(cvt, {rm, a.getLane(i)});
        lanes[i] = store_fp32_as_bv(tm, fp);
    }
    return float32x4_t(tm, lanes);
}
inline int32x4_t vcvtq_s32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term rtz = tm.mkRoundingMode(RoundingMode::ROUND_TOWARD_ZERO);
    Op cvt = tm.mkOp(Kind::FLOATINGPOINT_TO_SBV, {32});
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        lanes[i] = tm.mkTerm(cvt, {rtz, af});
    }
    return int32x4_t(tm, lanes);
}

// FP reinterpret no-ops
inline float32x4_t vreinterpretq_f32_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return float32x4_t(tm, lanes);
}
inline int32x4_t vreinterpretq_s32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return int32x4_t(tm, lanes);
}
inline float16x8_t vreinterpretq_f16_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i);
    return float16x8_t(tm, lanes);
}
inline uint16x8_t vreinterpretq_u16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i);
    return uint16x8_t(tm, lanes);
}
inline int16x8_t vreinterpretq_s16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i);
    return int16x8_t(tm, lanes);
}
inline float16x8_t vreinterpretq_f16_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i);
    return float16x8_t(tm, lanes);
}
// uint64x2_t reinterpret of int32x4_t (used in qs8 NaN-detection codepath)
inline NeonVector<64, 2> vreinterpretq_u64_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        // little-endian: lane[i] = concat(s32[2i+1], s32[2i])
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_CONCAT, {a.getLane(2*i + 1), a.getLane(2*i)});
    }
    return NeonVector<64, 2>(tm, lanes);
}

// ---------------------------------------------------------------------------
// FP16 ops (vminq_f16 / vmaxq_f16 / vaddq_f16 / vfmaq_f16 / vdivq_f16) on vec8
// ---------------------------------------------------------------------------
template <size_t N>
inline NeonVector<16, N> fp16_binop(const NeonVector<16, N>& a, const NeonVector<16, N>& b, Kind op) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term af = load_as_fp16(tm, a.getLane(i));
        Term bf = load_as_fp16(tm, b.getLane(i));
        Term res = (op == Kind::FLOATINGPOINT_MAX || op == Kind::FLOATINGPOINT_MIN)
                    ? tm.mkTerm(op, {af, bf})
                    : tm.mkTerm(op, {rm, af, bf});
        lanes[i] = store_fp16_as_bv(tm, res);
    }
    return NeonVector<16, N>(tm, lanes);
}
inline float16x8_t vaddq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FLOATINGPOINT_ADD); }
inline float16x8_t vminq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FLOATINGPOINT_MIN); }
inline float16x8_t vmaxq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FLOATINGPOINT_MAX); }
inline float16x8_t vdivq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FLOATINGPOINT_DIV); }
inline float16x8_t vfmaq_f16(const float16x8_t& a, const float16x8_t& b, const float16x8_t& c) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term af = load_as_fp16(tm, a.getLane(i));
        Term bf = load_as_fp16(tm, b.getLane(i));
        Term cf = load_as_fp16(tm, c.getLane(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, bf, cf, af});
        lanes[i] = store_fp16_as_bv(tm, res);
    }
    return float16x8_t(tm, lanes);
}
inline float16x8_t vabsq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term af = load_as_fp16(tm, a.getLane(i));
        lanes[i] = store_fp16_as_bv(tm, tm.mkTerm(Kind::FLOATINGPOINT_ABS, {af}));
    }
    return float16x8_t(tm, lanes);
}
inline uint16x8_t vcagtq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term af = load_as_fp16(tm, a.getLane(i));
        Term bf = load_as_fp16(tm, b.getLane(i));
        Term aa = tm.mkTerm(Kind::FLOATINGPOINT_ABS, {af});
        Term ba = tm.mkTerm(Kind::FLOATINGPOINT_ABS, {bf});
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_GT, {aa, ba});
        lanes[i] = tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 16, -1), mk_bv_val(tm, 16, 0)});
    }
    return uint16x8_t(tm, lanes);
}
inline uint32x4_t vcagtq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        Term bf = load_as_fp32(tm, b.getLane(i));
        Term aa = tm.mkTerm(Kind::FLOATINGPOINT_ABS, {af});
        Term ba = tm.mkTerm(Kind::FLOATINGPOINT_ABS, {bf});
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_GT, {aa, ba});
        lanes[i] = tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}
inline uint16x8_t vcltq_f16(const float16x8_t& a, const float16x8_t& b) {
    auto& tm = g_ctx->tm; std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term af = load_as_fp16(tm, a.getLane(i));
        Term bf = load_as_fp16(tm, b.getLane(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_LT, {af, bf});
        lanes[i] = tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 16, -1), mk_bv_val(tm, 16, 0)});
    }
    return uint16x8_t(tm, lanes);
}

// FP16 ↔ int16 conversions
inline int16x8_t vcvtnq_s16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    Term rne = g_ctx->fp.rounding_mode;
    Op cvt = tm.mkOp(Kind::FLOATINGPOINT_TO_SBV, {16});
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term af = load_as_fp16(tm, a.getLane(i));
        lanes[i] = tm.mkTerm(cvt, {rne, af});
    }
    return int16x8_t(tm, lanes);
}
inline float16x8_t vcvtq_f16_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Op cvt = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {5, 11});
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term fp = tm.mkTerm(cvt, {rm, a.getLane(i)});
        lanes[i] = store_fp16_as_bv(tm, fp);
    }
    return float16x8_t(tm, lanes);
}

// ===========================================================================
// External function for f16-vmulcaddc — declared as a no-op stub so the source
// kernel compiles. (Actual semantics would come from XNNPACK; the harness
// presumably does not exercise this codepath, so we only need a definition.)
// ===========================================================================
// (Intentionally not added here — if needed by a harness, add to the harness file.)

// ===========================================================================
// SymbolicScalar<T> overloads for vdup/vmov — enables --symbolic-params kernels.
// Mirror of bitwuzla tree lines 2706-2777.  Integer lanes hold raw BV terms;
// float32 lanes hold BV terms (per concrete vdupq_n_f32 above), so the float
// overloads pipe through store_fp32_as_bv before filling lanes.
// ===========================================================================
inline int8x8_t vdup_n_s8(SymbolicScalar<int8_t> v) {
    std::array<Term, 8> l; l.fill(v.term());
    return int8x8_t(g_ctx->tm, l);
}
inline uint8x8_t vdup_n_u8(SymbolicScalar<uint8_t> v) {
    std::array<Term, 8> l; l.fill(v.term());
    return uint8x8_t(g_ctx->tm, l);
}
inline int16x4_t vdup_n_s16(SymbolicScalar<int16_t> v) {
    std::array<Term, 4> l; l.fill(v.term());
    return int16x4_t(g_ctx->tm, l);
}
inline int8x16_t vdupq_n_s8(SymbolicScalar<int8_t> v) {
    std::array<Term, 16> l; l.fill(v.term());
    return int8x16_t(g_ctx->tm, l);
}
inline uint8x16_t vdupq_n_u8(SymbolicScalar<uint8_t> v) {
    std::array<Term, 16> l; l.fill(v.term());
    return uint8x16_t(g_ctx->tm, l);
}
inline int16x8_t vdupq_n_s16(SymbolicScalar<int16_t> v) {
    std::array<Term, 8> l; l.fill(v.term());
    return int16x8_t(g_ctx->tm, l);
}
inline uint16x8_t vdupq_n_u16(SymbolicScalar<uint16_t> v) {
    std::array<Term, 8> l; l.fill(v.term());
    return uint16x8_t(g_ctx->tm, l);
}
inline int32x4_t vdupq_n_s32(SymbolicScalar<int32_t> v) {
    std::array<Term, 4> l; l.fill(v.term());
    return int32x4_t(g_ctx->tm, l);
}
inline uint32x4_t vdupq_n_u32(SymbolicScalar<uint32_t> v) {
    std::array<Term, 4> l; l.fill(v.term());
    return uint32x4_t(g_ctx->tm, l);
}
inline int32x2_t vdup_n_s32(SymbolicScalar<int32_t> v) {
    std::array<Term, 2> l; l.fill(v.term());
    return int32x2_t(g_ctx->tm, l);
}
// Width-bridging overloads — accept any integer SymbolicScalar and cast to lane width.
inline int16x8_t vdupq_n_s16(SymbolicScalar<int32_t> v) { return vdupq_n_s16(v.template cast<int16_t>()); }
inline int16x8_t vdupq_n_s16(SymbolicScalar<int8_t> v)  { return vdupq_n_s16(v.template cast<int16_t>()); }
inline int32x4_t vdupq_n_s32(SymbolicScalar<int16_t> v) { return vdupq_n_s32(v.template cast<int32_t>()); }
inline int8x8_t  vdup_n_s8(SymbolicScalar<int32_t> v)   { return vdup_n_s8(v.template cast<int8_t>()); }
inline int8x8_t  vdup_n_s8(SymbolicScalar<int16_t> v)   { return vdup_n_s8(v.template cast<int8_t>()); }
inline uint8x8_t vdup_n_u8(SymbolicScalar<uint32_t> v)  { return vdup_n_u8(v.template cast<uint8_t>()); }
inline uint8x8_t vdup_n_u8(SymbolicScalar<uint16_t> v)  { return vdup_n_u8(v.template cast<uint8_t>()); }
inline int16x4_t vdup_n_s16(SymbolicScalar<int32_t> v)  { return vdup_n_s16(v.template cast<int16_t>()); }
// vmov aliases
inline int8x16_t  vmovq_n_s8(SymbolicScalar<int8_t> v)    { return vdupq_n_s8(v); }
inline int16x8_t  vmovq_n_s16(SymbolicScalar<int16_t> v)  { return vdupq_n_s16(v); }
inline int16x8_t  vmovq_n_s16(SymbolicScalar<int32_t> v)  { return vdupq_n_s16(v.template cast<int16_t>()); }
inline int32x4_t  vmovq_n_s32(SymbolicScalar<int32_t> v)  { return vdupq_n_s32(v); }
inline uint8x16_t vmovq_n_u8(SymbolicScalar<uint8_t> v)   { return vdupq_n_u8(v); }
inline uint16x8_t vmovq_n_u16(SymbolicScalar<uint16_t> v) { return vdupq_n_u16(v); }
inline uint32x4_t vmovq_n_u32(SymbolicScalar<uint32_t> v) { return vdupq_n_u32(v); }

// FP vdup with SymbolicScalar<float> — store BV pattern in lanes (matches concrete vdupq_n_f32).
inline float32x4_t vdupq_n_f32(SymbolicScalar<float> v) {
    auto& tm = g_ctx->tm;
    Term bv = store_fp32_as_bv(tm, v.term());
    std::array<Term, 4> l; l.fill(bv);
    return float32x4_t(tm, l);
}
inline float32x2_t vdup_n_f32(SymbolicScalar<float> v) {
    auto& tm = g_ctx->tm;
    Term bv = store_fp32_as_bv(tm, v.term());
    std::array<Term, 2> l; l.fill(bv);
    return float32x2_t(tm, l);
}
inline float32x4_t vmovq_n_f32(SymbolicScalar<float> v) { return vdupq_n_f32(v); }

// ===========================================================================
// XNNPACK SIMD abstraction shim — f16-neonfp16arith
// ===========================================================================
// Provides the symbol surface that upstream XNNPACK NEON kernels assume from
// `src/xnnpack/simd/f16-neonfp16arith.h`.  Lets unmodified upstream sources
// compile in salt's verification harness without manual lowering.

// Bare-NEON intrinsics the shim builds on (not previously defined in this tree).
inline float16x8_t vsubq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FLOATINGPOINT_SUB); }
inline float16x8_t vmulq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FLOATINGPOINT_MULT); }
inline float16x8_t vdupq_n_f16(float v) {
    auto& tm = g_ctx->tm;
    _Float16 fp(v);
    Term bv = mk_bv_val(tm, 16, fp.value);
    std::array<Term, 8> lanes; lanes.fill(bv);
    return float16x8_t(tm, lanes);
}

using xnn_simd_f16_t = float16x8_t;
constexpr size_t xnn_simd_size_f16  = 8;
constexpr size_t xnn_simd_bytes_f16 = 16;

// Unaligned vector load/store at f16 granularity.
inline xnn_simd_f16_t xnn_loadu_f16(const xnn_float16* p) {
    auto& b = g_ctx->findBuffer(p);
    return b.loadNeon<16, 8>(b.ptrToByteOffset(p));
}
inline void xnn_storeu_f16(xnn_float16* p, const xnn_simd_f16_t& v) {
    auto& b = g_ctx->findBuffer(p);
    b.storeNeon<16, 8>(b.ptrToByteOffset(p), v);
}
// Tail load: lanes [0, n) ← memory; lanes [n, 8) ← 0.
inline xnn_simd_f16_t xnn_load_tail_f16(const xnn_float16* p, size_t n) {
    auto& tm = g_ctx->tm;
    auto& b  = g_ctx->findBuffer(p);
    size_t off = b.ptrToByteOffset(p);
    Term zero = mk_bv_val(tm, 16, 0);
    std::array<Term, 8> lanes;
    for (size_t i = 0; i < 8; i++) {
        lanes[i] = (i < n) ? b.loadScalar(off + i * 2, 16) : zero;
    }
    return float16x8_t(tm, lanes);
}
// Tail store: write lanes [0, n) of v; bytes past p[n] untouched.
inline void xnn_store_tail_f16(xnn_float16* p, const xnn_simd_f16_t& v, size_t n) {
    auto& b = g_ctx->findBuffer(p);
    size_t off = b.ptrToByteOffset(p);
    for (size_t i = 0; i < n; i++) {
        b.storeScalar(off + i * 2, v.getLane(i), 16);
    }
}
inline xnn_simd_f16_t xnn_add_f16(const xnn_simd_f16_t& a, const xnn_simd_f16_t& b) { return vaddq_f16(a, b); }
inline xnn_simd_f16_t xnn_sub_f16(const xnn_simd_f16_t& a, const xnn_simd_f16_t& b) { return vsubq_f16(a, b); }
inline xnn_simd_f16_t xnn_mul_f16(const xnn_simd_f16_t& a, const xnn_simd_f16_t& b) { return vmulq_f16(a, b); }
inline xnn_simd_f16_t xnn_min_f16(const xnn_simd_f16_t& a, const xnn_simd_f16_t& b) { return vminq_f16(a, b); }
inline xnn_simd_f16_t xnn_max_f16(const xnn_simd_f16_t& a, const xnn_simd_f16_t& b) { return vmaxq_f16(a, b); }
// XNNPACK signature: xnn_fmadd_f16(a, b, c) computes a*b + c.
// NEON signature:    vfmaq_f16(c, a, b)     computes c + a*b.  Operand reorder.
inline xnn_simd_f16_t xnn_fmadd_f16(const xnn_simd_f16_t& a, const xnn_simd_f16_t& b, const xnn_simd_f16_t& c) {
    return vfmaq_f16(c, a, b);
}
// Bit-level left shift on the f16 representation (shifts the underlying u16).
inline xnn_simd_f16_t xnn_sll_f16(const xnn_simd_f16_t& a, int n) {
    auto& tm = g_ctx->tm;
    Term shift = mk_bv_val(tm, 16, (uint64_t)n);
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = tm.mkTerm(Kind::BITVECTOR_SHL, {a.getLane(i), shift});
    }
    return float16x8_t(tm, lanes);
}

} // namespace salt_cvc5

// XNNPACK macros (preprocessor — must live outside the namespace).
#ifndef XNN_INLINE
#define XNN_INLINE inline
#endif
#ifndef XNN_UNLIKELY
#define XNN_UNLIKELY(x) __builtin_expect(!!(x), 0)
#endif
#ifndef XNN_LOG2_SIZEOF_FLOAT16
#define XNN_LOG2_SIZEOF_FLOAT16 1
#endif
#ifndef XNN_FORCE_REALIZATION
// Codegen hint in upstream XNNPACK; semantic no-op for symbolic verification.
#define XNN_FORCE_REALIZATION(x) ((void)(x))
#endif
#ifndef XNN_SIMD_CONST_F16_FROM_FLOAT
// Declares `const xnn_simd_f16_t name = vdupq_n_f16((float)val);`
// Resolved via `using namespace salt;` in the harness scope.
#define XNN_SIMD_CONST_F16_FROM_FLOAT(name, val) \
    const xnn_simd_f16_t name = vdupq_n_f16((float)(val))
#endif
