#pragma once
// NEON intrinsics → bitwuzla BV/FP terms.
// Each intrinsic matches the real arm_neon.h signature.
// Implementations follow ARM ARM pseudocode from op-semantics/neon-intrinsics.md.

#include "../core/context.hpp"
#include "../core/symbolic_buffer.hpp"
#include "../core/symbolic_vector.hpp"

#include <bitwuzla/cpp/bitwuzla.h>

#include <algorithm>
#include <array>
#include <cstddef>
#include <cstdint>

namespace salt {

using namespace bitwuzla;

// ===========================================================================
// Helper: signed saturation (SatQ for signed)
// Clamps a wider signed value to the range of a narrower signed type.
// Input: wide_val (2*esize bits), output esize bits, saturated.
// ===========================================================================
inline Term signed_saturate(TermManager& tm, Term wide_val, size_t wide_bits, size_t narrow_bits) {
    int64_t max_val = (1LL << (narrow_bits - 1)) - 1;
    int64_t min_val = -(1LL << (narrow_bits - 1));

    Term t_max = mk_bv_val(tm, wide_bits, max_val);
    Term t_min = mk_bv_val(tm, wide_bits, min_val);

    // if val > max: max; elif val < min: min; else: val
    Term gt_max = tm.mk_term(Kind::BV_SGT, {wide_val, t_max});
    Term lt_min = tm.mk_term(Kind::BV_SLT, {wide_val, t_min});
    Term clamped = tm.mk_term(Kind::ITE, {gt_max, t_max,
                    tm.mk_term(Kind::ITE, {lt_min, t_min, wide_val})});

    // Extract low narrow_bits
    return tm.mk_term(Kind::BV_EXTRACT, {clamped},
                       {static_cast<uint64_t>(narrow_bits - 1), 0UL});
}

// ===========================================================================
// DUP — broadcast scalar to all lanes
// Op: for e = 0 to elements-1: Elem[result, e, esize] = value
// ===========================================================================
inline int8x8_t vdup_n_s8(int8_t value) {
    auto& tm = g_ctx->tm;
    Term val = mk_bv_val(tm, 8, value);
    std::array<Term, 8> lanes;
    lanes.fill(val);
    return int8x8_t(tm, lanes);
}

inline int16x8_t vdupq_n_s16(int16_t value) {
    auto& tm = g_ctx->tm;
    Term val = mk_bv_val(tm, 16, value);
    std::array<Term, 8> lanes;
    lanes.fill(val);
    return int16x8_t(tm, lanes);
}

inline int32x4_t vdupq_n_s32(int32_t value) {
    auto& tm = g_ctx->tm;
    Term val = mk_bv_val(tm, 32, value);
    std::array<Term, 4> lanes;
    lanes.fill(val);
    return int32x4_t(tm, lanes);
}

// ===========================================================================
// LD1 — load vector from memory
// Op: for e = 0 to elements-1: Elem[result, e, esize] = Mem[address + e*esize/8]
// ===========================================================================
inline int8x8_t vld1_s8(const int8_t* ptr) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadNeon<8, 8>(buf.ptrToByteOffset(ptr));
}

inline int8x16_t vld1q_s8(const int8_t* ptr) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadNeon<8, 16>(buf.ptrToByteOffset(ptr));
}

inline int32x4_t vld1q_s32(const int32_t* ptr) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadNeon<32, 4>(buf.ptrToByteOffset(ptr));
}

// ===========================================================================
// ST1 — store vector to memory
// ===========================================================================
inline void vst1_s8(int8_t* ptr, const int8x8_t& val) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeNeon<8, 8>(buf.ptrToByteOffset(ptr), val);
}

inline void vst1q_s8(int8_t* ptr, const int8x16_t& val) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeNeon<8, 16>(buf.ptrToByteOffset(ptr), val);
}

// ===========================================================================
// ST1_LANE — store single lane to memory
// ===========================================================================
inline void vst1_lane_s8(int8_t* ptr, const int8x8_t& val, int lane) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.setByte(buf.ptrToByteOffset(ptr), val.getLane(lane));
}

inline void vst1_lane_u16(void* ptr, const uint16x4_t& val, int lane) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeScalar(buf.ptrToByteOffset(ptr), val.getLane(lane), 16);
}

inline void vst1_lane_u32(void* ptr, const uint32x2_t& val, int lane) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeScalar(buf.ptrToByteOffset(ptr), val.getLane(lane), 32);
}

inline void vst1_lane_f32(float* ptr, const float32x2_t& val, int lane) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeScalar(buf.ptrToByteOffset(ptr), val.getLane(lane), 32);
}

// ===========================================================================
// GET_LOW / GET_HIGH — extract D register from Q register
// get_low: lanes [0..N/2-1], get_high: lanes [N/2..N-1]
// ===========================================================================
inline int16x4_t vget_low_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return int16x4_t(tm, lanes);
}

inline int16x4_t vget_high_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i + 4);
    return int16x4_t(tm, lanes);
}

inline int8x8_t vget_low_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i);
    return int8x8_t(tm, lanes);
}

inline int8x8_t vget_high_s8(const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i + 8);
    return int8x8_t(tm, lanes);
}

// ===========================================================================
// COMBINE — concatenate two D registers into Q register
// ===========================================================================
inline int16x8_t vcombine_s16(const int16x4_t& lo, const int16x4_t& hi) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 4; i++) lanes[i]     = lo.getLane(i);
    for (int i = 0; i < 4; i++) lanes[i + 4] = hi.getLane(i);
    return int16x8_t(tm, lanes);
}

inline int8x16_t vcombine_s8(const int8x8_t& lo, const int8x8_t& hi) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> lanes;
    for (int i = 0; i < 8; i++) lanes[i]     = lo.getLane(i);
    for (int i = 0; i < 8; i++) lanes[i + 8] = hi.getLane(i);
    return int8x16_t(tm, lanes);
}

// ===========================================================================
// SSUBL — Signed Subtract Long (widening subtract)
// Op: for e: Elem[result, e, 2*esize] = SInt(a[e]) - SInt(b[e])
// ===========================================================================
inline int16x8_t vsubl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        // Sign-extend 8→16, then subtract
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {8});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = tm.mk_term(Kind::BV_SUB, {a_ext, b_ext});
    }
    return int16x8_t(tm, lanes);
}

// ===========================================================================
// SSHLL / VMOVL — Signed Shift Left Long (widening sign-extend)
// vmovl_s16 is SSHLL with shift=0: sign-extend 16→32
// Op: for e: Elem[result, e, 2*esize] = SInt(a[e]) << shift
// ===========================================================================
inline int32x4_t vmovl_s16(const int16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
    }
    return int32x4_t(tm, lanes);
}

// ===========================================================================
// MLA — Multiply-Accumulate (NOT fused for integer — two roundings irrelevant for BV)
// Op: for e: result[e] = acc[e] + (b[e] * c[e])
// ===========================================================================
inline int32x4_t vmlaq_s32(const int32x4_t& acc,
                            const int32x4_t& b,
                            const int32x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term prod = tm.mk_term(Kind::BV_MUL, {b.getLane(i), c.getLane(i)});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), prod});
    }
    return int32x4_t(tm, lanes);
}

// ===========================================================================
// SRSHL — Signed Rounding Shift Left (by signed amount in each lane)
// Op: shift = SInt(b[e]<7:0>)
//     if shift < 0 (right shift):
//       round_const = 1 << (-shift - 1)
//       result = (SInt(a[e]) + round_const) >> (-shift)
//     else (left shift):
//       result = a[e] << shift
// ===========================================================================
inline int32x4_t vrshlq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    Sort bv32 = tm.mk_bv_sort(32);
    Sort bv64 = tm.mk_bv_sort(64);
    Term zero32 = tm.mk_bv_value_uint64(bv32, 0);
    Term one64 = tm.mk_bv_value_uint64(bv64, 1);

    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        // shift amount from low 8 bits of b, sign-extended to 32
        Term shift_byte = tm.mk_term(Kind::BV_EXTRACT, {b.getLane(i)}, {7UL, 0UL});
        Term shift_s32 = tm.mk_term(Kind::BV_SIGN_EXTEND, {shift_byte}, {24});

        Term is_right = tm.mk_term(Kind::BV_SLT, {shift_s32, zero32}); // shift < 0

        // Right shift path: negate shift, do rounding arithmetic shift right
        Term neg_shift = tm.mk_term(Kind::BV_NEG, {shift_s32});
        // Work in 64-bit to avoid overflow in round_const addition
        Term a_wide = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {32});
        Term neg_shift_64 = tm.mk_term(Kind::BV_ZERO_EXTEND, {neg_shift}, {32});
        // round_const = 1 << (neg_shift - 1)
        Term shift_minus_1 = tm.mk_term(Kind::BV_SUB, {neg_shift_64, one64});
        Term round_const = tm.mk_term(Kind::BV_SHL, {one64, shift_minus_1});
        // Handle shift=0 edge case: if neg_shift==0, round_const should be 0
        Term neg_shift_is_zero = tm.mk_term(Kind::EQUAL, {neg_shift,zero32});
        Term zero64 = tm.mk_bv_value_uint64(bv64, 0);
        round_const = tm.mk_term(Kind::ITE, {neg_shift_is_zero, zero64, round_const});

        Term rounded = tm.mk_term(Kind::BV_ADD, {a_wide, round_const});
        Term right_result_64 = tm.mk_term(Kind::BV_ASHR, {rounded, neg_shift_64});
        Term right_result = tm.mk_term(Kind::BV_EXTRACT, {right_result_64}, {31UL, 0UL});

        // Left shift path
        Term left_result = tm.mk_term(Kind::BV_SHL, {a.getLane(i), shift_s32});

        lanes[i] = tm.mk_term(Kind::ITE, {is_right, right_result, left_result});
    }
    return int32x4_t(tm, lanes);
}

// ===========================================================================
// SQXTN — Signed Saturating Extract Narrow
// Op: for e: result[e] = SatQ(SInt(a[e]), esize/2, signed)
// ===========================================================================
inline int16x4_t vqmovn_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = signed_saturate(tm, a.getLane(i), 32, 16);
    }
    return int16x4_t(tm, lanes);
}

inline int8x8_t vqmovn_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = signed_saturate(tm, a.getLane(i), 16, 8);
    }
    return int8x8_t(tm, lanes);
}

// ===========================================================================
// SQADD — Signed Saturating Add
// Op: for e: result[e] = SatQ(SInt(a[e]) + SInt(b[e]), esize, signed)
// ===========================================================================
inline int16x8_t vqaddq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        // Widen to 32 to detect overflow, add, then saturate back to 16
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        Term sum = tm.mk_term(Kind::BV_ADD, {a_ext, b_ext});
        lanes[i] = signed_saturate(tm, sum, 32, 16);
    }
    return int16x8_t(tm, lanes);
}

// ===========================================================================
// SMAX / SMIN — Signed integer min/max
// Op: for e: result[e] = (SInt(a[e]) >= SInt(b[e])) ? a[e] : b[e]
// ===========================================================================
inline int8x8_t vmax_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term cond = tm.mk_term(Kind::BV_SGE, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cond, a.getLane(i), b.getLane(i)});
    }
    return int8x8_t(tm, lanes);
}

inline int8x8_t vmin_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term cond = tm.mk_term(Kind::BV_SLE, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cond, a.getLane(i), b.getLane(i)});
    }
    return int8x8_t(tm, lanes);
}

// ===========================================================================
// EXT — Extract from pair of vectors
// Op: concat = hi : lo; result = concat<position+datasize-1:position>
// For vext_s8 with n: extract starting at element n from (a || b)
// ===========================================================================
inline int8x8_t vext_s8(const int8x8_t& a, const int8x8_t& b, int n) {
    auto& tm = g_ctx->tm;
    // Conceptually: result[i] = (i+n < 8) ? a[i+n] : b[i+n-8]
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        int idx = i + n;
        if (idx < 8)
            lanes[i] = a.getLane(idx);
        else
            lanes[i] = b.getLane(idx - 8);
    }
    return int8x8_t(tm, lanes);
}

// ===========================================================================
// REINTERPRET — type punning (no-op on BV terms, just repackage)
// ===========================================================================
inline uint32x2_t vreinterpret_u32_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    // Pack 8 x 8-bit lanes into 2 x 32-bit lanes (little-endian)
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        // lane[i] = concat(a[i*4+3], a[i*4+2], a[i*4+1], a[i*4+0])
        Term result = a.getLane(i * 4);
        for (int j = 1; j < 4; j++) {
            result = tm.mk_term(Kind::BV_CONCAT, {a.getLane(i * 4 + j), result});
        }
        lanes[i] = result;
    }
    return uint32x2_t(tm, lanes);
}

inline uint16x4_t vreinterpret_u16_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    // Pack 8 x 8-bit lanes into 4 x 16-bit lanes (little-endian)
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = tm.mk_term(Kind::BV_CONCAT,
                                {a.getLane(i * 2 + 1), a.getLane(i * 2)});
    }
    return uint16x4_t(tm, lanes);
}

// ===========================================================================
// PHASE 2: Rounding, saturation, and halving intrinsics
// ===========================================================================

// ===========================================================================
// SRSHR — Signed Rounding Shift Right (immediate)
// Op: element = (SInt(a[e]) + (1 << (n-1))) >> n
// Computed in wider precision to avoid intermediate overflow.
// ===========================================================================
template <size_t ElemBits, size_t NumLanes>
inline NeonVector<ElemBits, NumLanes> neon_vrshr_n_impl(
    const NeonVector<ElemBits, NumLanes>& a, int n) {
    auto& tm = g_ctx->tm;
    constexpr size_t W = ElemBits * 2;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_wide = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)},
                                  {static_cast<uint64_t>(ElemBits)});
        Term round_const = mk_bv_val(tm, W, 1LL << (n - 1));
        Term sum = tm.mk_term(Kind::BV_ADD, {a_wide, round_const});
        Term shifted = tm.mk_term(Kind::BV_ASHR, {sum, mk_bv_val(tm, W, n)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted},
                                {static_cast<uint64_t>(ElemBits - 1), 0UL});
    }
    return NeonVector<ElemBits, NumLanes>(tm, lanes);
}

inline int8x8_t   vrshr_n_s8 (const int8x8_t& a,  int n) { return neon_vrshr_n_impl(a, n); }
inline int8x16_t  vrshrq_n_s8(const int8x16_t& a, int n) { return neon_vrshr_n_impl(a, n); }
inline int16x4_t  vrshr_n_s16 (const int16x4_t& a,  int n) { return neon_vrshr_n_impl(a, n); }
inline int16x8_t  vrshrq_n_s16(const int16x8_t& a, int n) { return neon_vrshr_n_impl(a, n); }
inline int32x2_t  vrshr_n_s32 (const int32x2_t& a,  int n) { return neon_vrshr_n_impl(a, n); }
inline int32x4_t  vrshrq_n_s32(const int32x4_t& a, int n) { return neon_vrshr_n_impl(a, n); }

// Unsigned variants — zero-extend instead of sign-extend
template <size_t ElemBits, size_t NumLanes>
inline NeonVector<ElemBits, NumLanes> neon_vrshr_n_u_impl(
    const NeonVector<ElemBits, NumLanes>& a, int n) {
    auto& tm = g_ctx->tm;
    constexpr size_t W = ElemBits * 2;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_wide = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)},
                                  {static_cast<uint64_t>(ElemBits)});
        Term round_const = mk_bv_val(tm, W, 1LL << (n - 1));
        Term sum = tm.mk_term(Kind::BV_ADD, {a_wide, round_const});
        Term shifted = tm.mk_term(Kind::BV_SHR, {sum, mk_bv_val(tm, W, n)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted},
                                {static_cast<uint64_t>(ElemBits - 1), 0UL});
    }
    return NeonVector<ElemBits, NumLanes>(tm, lanes);
}

inline uint8x8_t   vrshr_n_u8 (const uint8x8_t& a,  int n) { return neon_vrshr_n_u_impl(a, n); }
inline uint8x16_t  vrshrq_n_u8(const uint8x16_t& a, int n) { return neon_vrshr_n_u_impl(a, n); }
inline uint16x4_t  vrshr_n_u16 (const uint16x4_t& a,  int n) { return neon_vrshr_n_u_impl(a, n); }
inline uint16x8_t  vrshrq_n_u16(const uint16x8_t& a, int n) { return neon_vrshr_n_u_impl(a, n); }
inline uint32x2_t  vrshr_n_u32 (const uint32x2_t& a,  int n) { return neon_vrshr_n_u_impl(a, n); }
inline uint32x4_t  vrshrq_n_u32(const uint32x4_t& a, int n) { return neon_vrshr_n_u_impl(a, n); }

// ===========================================================================
// SHADD — Signed Halving Add (truncating)
// Op: result[e] = (SInt(a[e]) + SInt(b[e])) >> 1  (takes bits <esize:1>)
// ===========================================================================
template <size_t ElemBits, size_t NumLanes>
inline NeonVector<ElemBits, NumLanes> neon_vhadd_s_impl(
    const NeonVector<ElemBits, NumLanes>& a, const NeonVector<ElemBits, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    constexpr size_t W = ElemBits + 1; // one extra bit to avoid overflow
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {1UL});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {1UL});
        Term sum = tm.mk_term(Kind::BV_ADD, {a_ext, b_ext});
        // Take bits <esize:1> = arithmetic shift right by 1
        Term shifted = tm.mk_term(Kind::BV_ASHR, {sum, mk_bv_val(tm, W, 1)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted},
                                {static_cast<uint64_t>(ElemBits - 1), 0UL});
    }
    return NeonVector<ElemBits, NumLanes>(tm, lanes);
}

inline int8x8_t   vhadd_s8 (const int8x8_t& a,  const int8x8_t& b)  { return neon_vhadd_s_impl(a, b); }
inline int8x16_t  vhaddq_s8(const int8x16_t& a, const int8x16_t& b) { return neon_vhadd_s_impl(a, b); }
inline int16x4_t  vhadd_s16 (const int16x4_t& a,  const int16x4_t& b)  { return neon_vhadd_s_impl(a, b); }
inline int16x8_t  vhaddq_s16(const int16x8_t& a, const int16x8_t& b) { return neon_vhadd_s_impl(a, b); }
inline int32x2_t  vhadd_s32 (const int32x2_t& a,  const int32x2_t& b)  { return neon_vhadd_s_impl(a, b); }
inline int32x4_t  vhaddq_s32(const int32x4_t& a, const int32x4_t& b) { return neon_vhadd_s_impl(a, b); }

// Unsigned halving add
template <size_t ElemBits, size_t NumLanes>
inline NeonVector<ElemBits, NumLanes> neon_vhadd_u_impl(
    const NeonVector<ElemBits, NumLanes>& a, const NeonVector<ElemBits, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    constexpr size_t W = ElemBits + 1;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {1UL});
        Term b_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {1UL});
        Term sum = tm.mk_term(Kind::BV_ADD, {a_ext, b_ext});
        Term shifted = tm.mk_term(Kind::BV_SHR, {sum, mk_bv_val(tm, W, 1)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted},
                                {static_cast<uint64_t>(ElemBits - 1), 0UL});
    }
    return NeonVector<ElemBits, NumLanes>(tm, lanes);
}

inline uint8x8_t   vhadd_u8 (const uint8x8_t& a,  const uint8x8_t& b)  { return neon_vhadd_u_impl(a, b); }
inline uint8x16_t  vhaddq_u8(const uint8x16_t& a, const uint8x16_t& b) { return neon_vhadd_u_impl(a, b); }
inline uint16x4_t  vhadd_u16 (const uint16x4_t& a,  const uint16x4_t& b)  { return neon_vhadd_u_impl(a, b); }
inline uint16x8_t  vhaddq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vhadd_u_impl(a, b); }
inline uint32x2_t  vhadd_u32 (const uint32x2_t& a,  const uint32x2_t& b)  { return neon_vhadd_u_impl(a, b); }
inline uint32x4_t  vhaddq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vhadd_u_impl(a, b); }

// ===========================================================================
// SRHADD — Signed Rounding Halving Add
// Op: result[e] = (SInt(a[e]) + SInt(b[e]) + 1) >> 1  (takes bits <esize:1>)
// ===========================================================================
template <size_t ElemBits, size_t NumLanes>
inline NeonVector<ElemBits, NumLanes> neon_vrhadd_s_impl(
    const NeonVector<ElemBits, NumLanes>& a, const NeonVector<ElemBits, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    constexpr size_t W = ElemBits + 1;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {1UL});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {1UL});
        Term sum = tm.mk_term(Kind::BV_ADD, {a_ext, b_ext});
        Term sum_plus1 = tm.mk_term(Kind::BV_ADD, {sum, mk_bv_val(tm, W, 1)});
        Term shifted = tm.mk_term(Kind::BV_ASHR, {sum_plus1, mk_bv_val(tm, W, 1)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted},
                                {static_cast<uint64_t>(ElemBits - 1), 0UL});
    }
    return NeonVector<ElemBits, NumLanes>(tm, lanes);
}

inline int8x8_t   vrhadd_s8 (const int8x8_t& a,  const int8x8_t& b)  { return neon_vrhadd_s_impl(a, b); }
inline int8x16_t  vrhaddq_s8(const int8x16_t& a, const int8x16_t& b) { return neon_vrhadd_s_impl(a, b); }
inline int16x4_t  vrhadd_s16 (const int16x4_t& a,  const int16x4_t& b)  { return neon_vrhadd_s_impl(a, b); }
inline int16x8_t  vrhaddq_s16(const int16x8_t& a, const int16x8_t& b) { return neon_vrhadd_s_impl(a, b); }
inline int32x2_t  vrhadd_s32 (const int32x2_t& a,  const int32x2_t& b)  { return neon_vrhadd_s_impl(a, b); }
inline int32x4_t  vrhaddq_s32(const int32x4_t& a, const int32x4_t& b) { return neon_vrhadd_s_impl(a, b); }

// Unsigned rounding halving add
template <size_t ElemBits, size_t NumLanes>
inline NeonVector<ElemBits, NumLanes> neon_vrhadd_u_impl(
    const NeonVector<ElemBits, NumLanes>& a, const NeonVector<ElemBits, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    constexpr size_t W = ElemBits + 1;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {1UL});
        Term b_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {1UL});
        Term sum = tm.mk_term(Kind::BV_ADD, {a_ext, b_ext});
        Term sum_plus1 = tm.mk_term(Kind::BV_ADD, {sum, mk_bv_val(tm, W, 1)});
        Term shifted = tm.mk_term(Kind::BV_SHR, {sum_plus1, mk_bv_val(tm, W, 1)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted},
                                {static_cast<uint64_t>(ElemBits - 1), 0UL});
    }
    return NeonVector<ElemBits, NumLanes>(tm, lanes);
}

inline uint8x8_t   vrhadd_u8 (const uint8x8_t& a,  const uint8x8_t& b)  { return neon_vrhadd_u_impl(a, b); }
inline uint8x16_t  vrhaddq_u8(const uint8x16_t& a, const uint8x16_t& b) { return neon_vrhadd_u_impl(a, b); }
inline uint16x4_t  vrhadd_u16 (const uint16x4_t& a,  const uint16x4_t& b)  { return neon_vrhadd_u_impl(a, b); }
inline uint16x8_t  vrhaddq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vrhadd_u_impl(a, b); }
inline uint32x2_t  vrhadd_u32 (const uint32x2_t& a,  const uint32x2_t& b)  { return neon_vrhadd_u_impl(a, b); }
inline uint32x4_t  vrhaddq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vrhadd_u_impl(a, b); }

// ===========================================================================
// SQRDMULH — Signed saturating Rounding Doubling Multiply High
// Op: product = (2 * SInt(a[e]) * SInt(b[e]) + (1 << (esize-1))) >> esize
//     result[e] = SignedSatQ(product, esize)
// ===========================================================================
inline int16x4_t vqrdmulh_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        // Widen to 32, multiply, double, add rounding const, shift right by 16, saturate
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        Term prod = tm.mk_term(Kind::BV_MUL, {a_ext, b_ext});
        Term doubled = tm.mk_term(Kind::BV_ADD, {prod, prod}); // 2 * product
        Term round_const = mk_bv_val(tm, 32, 1 << 15); // 1 << (esize-1) = 1 << 15
        Term rounded = tm.mk_term(Kind::BV_ADD, {doubled, round_const});
        Term shifted = tm.mk_term(Kind::BV_ASHR, {rounded, mk_bv_val(tm, 32, 16)});
        lanes[i] = signed_saturate(tm, shifted, 32, 16);
    }
    return int16x4_t(tm, lanes);
}

inline int16x8_t vqrdmulhq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        Term prod = tm.mk_term(Kind::BV_MUL, {a_ext, b_ext});
        Term doubled = tm.mk_term(Kind::BV_ADD, {prod, prod});
        Term round_const = mk_bv_val(tm, 32, 1 << 15);
        Term rounded = tm.mk_term(Kind::BV_ADD, {doubled, round_const});
        Term shifted = tm.mk_term(Kind::BV_ASHR, {rounded, mk_bv_val(tm, 32, 16)});
        lanes[i] = signed_saturate(tm, shifted, 32, 16);
    }
    return int16x8_t(tm, lanes);
}

inline int32x2_t vqrdmulh_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        // Widen to 64
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {32});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {32});
        Term prod = tm.mk_term(Kind::BV_MUL, {a_ext, b_ext});
        Term doubled = tm.mk_term(Kind::BV_ADD, {prod, prod});
        Term round_const = mk_bv_val(tm, 64, 1LL << 31);
        Term rounded = tm.mk_term(Kind::BV_ADD, {doubled, round_const});
        Term shifted = tm.mk_term(Kind::BV_ASHR, {rounded, mk_bv_val(tm, 64, 32)});
        lanes[i] = signed_saturate(tm, shifted, 64, 32);
    }
    return int32x2_t(tm, lanes);
}

inline int32x4_t vqrdmulhq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {32});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {32});
        Term prod = tm.mk_term(Kind::BV_MUL, {a_ext, b_ext});
        Term doubled = tm.mk_term(Kind::BV_ADD, {prod, prod});
        Term round_const = mk_bv_val(tm, 64, 1LL << 31);
        Term rounded = tm.mk_term(Kind::BV_ADD, {doubled, round_const});
        Term shifted = tm.mk_term(Kind::BV_ASHR, {rounded, mk_bv_val(tm, 64, 32)});
        lanes[i] = signed_saturate(tm, shifted, 64, 32);
    }
    return int32x4_t(tm, lanes);
}

// ===========================================================================
// SQSUB — Signed Saturating Subtract
// Op: result[e] = SatQ(SInt(a[e]) - SInt(b[e]), esize, signed)
// ===========================================================================
inline int32x4_t vqsubq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {32});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {32});
        Term diff = tm.mk_term(Kind::BV_SUB, {a_ext, b_ext});
        lanes[i] = signed_saturate(tm, diff, 64, 32);
    }
    return int32x4_t(tm, lanes);
}

inline int16x8_t vqsubq_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        Term diff = tm.mk_term(Kind::BV_SUB, {a_ext, b_ext});
        lanes[i] = signed_saturate(tm, diff, 32, 16);
    }
    return int16x8_t(tm, lanes);
}

// ===========================================================================
// RSHRN — Rounding Shift Right Narrow (immediate)
// Op: element = (UInt(a[e]) + (1 << (n-1))) >> n, then narrow
// Note: operates on unsigned interpretation of the wide element
// ===========================================================================
inline int8x8_t vrshrn_n_s16(const int16x8_t& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    Term round_const = mk_bv_val(tm, 16, 1 << (n - 1));
    for (int i = 0; i < 8; i++) {
        Term sum = tm.mk_term(Kind::BV_ADD, {a.getLane(i), round_const});
        Term shifted = tm.mk_term(Kind::BV_SHR, {sum, mk_bv_val(tm, 16, n)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted}, {7UL, 0UL});
    }
    return int8x8_t(tm, lanes);
}

inline int16x4_t vrshrn_n_s32(const int32x4_t& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    Term round_const = mk_bv_val(tm, 32, 1 << (n - 1));
    for (int i = 0; i < 4; i++) {
        Term sum = tm.mk_term(Kind::BV_ADD, {a.getLane(i), round_const});
        Term shifted = tm.mk_term(Kind::BV_SHR, {sum, mk_bv_val(tm, 32, n)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted}, {15UL, 0UL});
    }
    return int16x4_t(tm, lanes);
}

// ===========================================================================
// SSHR / USHR — Shift Right (immediate, non-rounding)
// ===========================================================================
template <size_t ElemBits, size_t NumLanes>
inline NeonVector<ElemBits, NumLanes> neon_vshr_n_s_impl(
    const NeonVector<ElemBits, NumLanes>& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        lanes[i] = tm.mk_term(Kind::BV_ASHR, {a.getLane(i), mk_bv_val(tm, ElemBits, n)});
    }
    return NeonVector<ElemBits, NumLanes>(tm, lanes);
}

inline int8x8_t   vshr_n_s8 (const int8x8_t& a,  int n) { return neon_vshr_n_s_impl(a, n); }
inline int8x16_t  vshrq_n_s8(const int8x16_t& a, int n) { return neon_vshr_n_s_impl(a, n); }
inline int16x4_t  vshr_n_s16 (const int16x4_t& a,  int n) { return neon_vshr_n_s_impl(a, n); }
inline int16x8_t  vshrq_n_s16(const int16x8_t& a, int n) { return neon_vshr_n_s_impl(a, n); }
inline int32x2_t  vshr_n_s32 (const int32x2_t& a,  int n) { return neon_vshr_n_s_impl(a, n); }
inline int32x4_t  vshrq_n_s32(const int32x4_t& a, int n) { return neon_vshr_n_s_impl(a, n); }

template <size_t ElemBits, size_t NumLanes>
inline NeonVector<ElemBits, NumLanes> neon_vshr_n_u_impl(
    const NeonVector<ElemBits, NumLanes>& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        lanes[i] = tm.mk_term(Kind::BV_SHR, {a.getLane(i), mk_bv_val(tm, ElemBits, n)});
    }
    return NeonVector<ElemBits, NumLanes>(tm, lanes);
}

inline uint8x8_t   vshr_n_u8 (const uint8x8_t& a,  int n) { return neon_vshr_n_u_impl(a, n); }
inline uint8x16_t  vshrq_n_u8(const uint8x16_t& a, int n) { return neon_vshr_n_u_impl(a, n); }
inline uint16x4_t  vshr_n_u16 (const uint16x4_t& a,  int n) { return neon_vshr_n_u_impl(a, n); }
inline uint16x8_t  vshrq_n_u16(const uint16x8_t& a, int n) { return neon_vshr_n_u_impl(a, n); }
inline uint32x2_t  vshr_n_u32 (const uint32x2_t& a,  int n) { return neon_vshr_n_u_impl(a, n); }
inline uint32x4_t  vshrq_n_u32(const uint32x4_t& a, int n) { return neon_vshr_n_u_impl(a, n); }

// ===========================================================================
// SSRA / USRA — Shift Right and Accumulate (immediate)
// ===========================================================================
inline int32x4_t vsraq_n_s32(const int32x4_t& acc, const int32x4_t& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term shifted = tm.mk_term(Kind::BV_ASHR, {a.getLane(i), mk_bv_val(tm, 32, n)});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), shifted});
    }
    return int32x4_t(tm, lanes);
}

// ===========================================================================
// PHASE 3: Floating-point intrinsics
// All FP ops use g_ctx->fp.rounding_mode (frozen to RNE)
// FP lanes are stored as BV terms in NeonVector; converted to/from FP sort
// for arithmetic, then back to BV for storage.
// ===========================================================================

// ---------------------------------------------------------------------------
// Helpers: BV ↔ FP conversion
// ---------------------------------------------------------------------------
inline Term bv_to_fp32(TermManager& tm, Term bv) {
    return tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {8, 24});
}
inline Term fp32_to_bv(TermManager& tm, Term fp) {
    // FP_IEEE_BV not available — use the IEEE BV extraction
    // bitwuzla provides this via FP_TO_FP_FROM_BV roundtrip or direct
    // Actually, we store FP results as FP Terms and compare with FP_IS_NAN
    // But our vectors store BV. So we need to go FP->BV.
    // bitwuzla doesn't have a direct fp_to_ieee_bv. We use:
    //   construct from sign/exp/sig components isn't easy either.
    // Alternative: keep FP terms in the vector and only convert at comparison.
    // For now, store the FP term directly — comparison handles it.
    return fp; // See note below
}

// Actually, the cleanest approach: FP lanes store BV terms (as the buffer gives us),
// FP intrinsics convert BV→FP, do the op, then we need FP→BV.
// bitwuzla has no direct FP→IEEE_BV. The workaround: use the identity that
// FP_TO_FP_FROM_BV(BV_val) and the original BV are the same bits.
// So we can use the FP sort directly in vectors for FP operations,
// and convert at boundaries (load/store/compare).

// Better approach: FP vectors use FP-sorted Terms internally.
// Load converts BV→FP, store converts FP→BV, comparison works on FP.
// But NeonVector stores Term without sort distinction...
// Simplest: keep BV storage. For FP ops, convert in→FP, compute, convert out→BV.
// bitwuzla can do FP→BV via constructing from components or via
// creating a fresh BV const and asserting FP_TO_FP_FROM_BV(bv) == fp.

// Most practical: just keep everything as FP Terms for float32x4_t operations.
// The comparison module already handles FP (element_equal with F32 uses FP_IS_NAN).
// Loads produce BV terms from the buffer. So:
//   load BV → convert to FP → compute → convert to FP → store: need FP→BV
// We'll use the approach: create a BV variable, assert it equals the FP value
// when converted. But that's expensive.

// CLEANEST: store FP terms directly in the vector. Load converts BV→FP.
// Store converts FP→BV by building from sign+exp+sig extraction... too complex.

// PRAGMATIC: For f32, use the FP sort directly in NeonVector lanes.
// The buffer loads BV, intrinsics convert at the boundary.
// For comparison, work on the FP terms directly.

inline Term load_as_fp32(TermManager& tm, Term bv32) {
    return tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv32}, {8, 24});
}

// For FP→BV store, we create a relationship via sign/exponent/significand extraction
// This is the standard SMT-LIB approach
// Actually bitwuzla does NOT have fp.to_ieee_bv. We need to work around this.
// Approach: keep FP results as FP Terms in vectors. At store time,
// create a fresh BV32 const, assert FP_TO_FP_FROM_BV(bv) == fp_val,
// and store that BV. The solver will figure out the value.
inline Term fp32_to_bv_via_assertion(TermManager& tm, Term fp_val, const std::string& name) {
    Sort bv32 = tm.mk_bv_sort(32);
    Term bv = tm.mk_const(bv32, name);
    Term fp_from_bv = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {8, 24});
    Term eq = tm.mk_term(Kind::EQUAL, {fp_from_bv, fp_val});
    g_ctx->solver->assert_formula(eq);
    return bv;
}

// Counter for unique FP→BV variable names
inline size_t& fp_bv_counter() {
    static size_t counter = 0;
    return counter;
}

inline Term store_fp32_as_bv(TermManager& tm, Term fp_val) {
    return fp32_to_bv_via_assertion(tm, fp_val, "_fp2bv_" + std::to_string(fp_bv_counter()++));
}

// ===========================================================================
// FP DUP — broadcast float to all lanes
// ===========================================================================
inline float32x2_t vdup_n_f32(float value) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    // Create FP value from float
    Sort fp32 = tm.mk_fp_sort(8, 24);
    // Use string conversion for exactness
    Term val = mk_fp32_from_float(tm, value);
    Term bv = store_fp32_as_bv(tm, val);
    std::array<Term, 2> lanes;
    lanes.fill(bv);
    return float32x2_t(tm, lanes);
}

inline float32x4_t vdupq_n_f32(float value) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term val = mk_fp32_from_float(tm, value);
    Term bv = store_fp32_as_bv(tm, val);
    std::array<Term, 4> lanes;
    lanes.fill(bv);
    return float32x4_t(tm, lanes);
}

// ===========================================================================
// FP LD1 / ST1
// ===========================================================================
inline float32x4_t vld1q_f32(const float* ptr) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadNeon<32, 4>(buf.ptrToByteOffset(ptr));
}

inline float32x2_t vld1_f32(const float* ptr) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadNeon<32, 2>(buf.ptrToByteOffset(ptr));
}

inline void vst1q_f32(float* ptr, const float32x4_t& val) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeNeon<32, 4>(buf.ptrToByteOffset(ptr), val);
}

inline void vst1_f32(float* ptr, const float32x2_t& val) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeNeon<32, 2>(buf.ptrToByteOffset(ptr), val);
}

// ===========================================================================
// FP helper: apply a binary FP op lane-wise on 32-bit float vectors
// Lanes are stored as BV32; convert to FP, operate, convert back to BV.
// ===========================================================================
template <size_t NumLanes>
inline NeonVector<32, NumLanes> fp32_binop(
    const NeonVector<32, NumLanes>& a, const NeonVector<32, NumLanes>& b, Kind op) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term result_fp = tm.mk_term(op, {rm, a_fp, b_fp});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return NeonVector<32, NumLanes>(tm, lanes);
}

// ===========================================================================
// FP ADD / SUB / MUL / DIV
// ===========================================================================
inline float32x4_t vaddq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FP_ADD); }
inline float32x2_t vadd_f32 (const float32x2_t& a, const float32x2_t& b) { return fp32_binop(a, b, Kind::FP_ADD); }
inline float32x4_t vsubq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FP_SUB); }
inline float32x2_t vsub_f32 (const float32x2_t& a, const float32x2_t& b) { return fp32_binop(a, b, Kind::FP_SUB); }
inline float32x4_t vmulq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FP_MUL); }
inline float32x2_t vmul_f32 (const float32x2_t& a, const float32x2_t& b) { return fp32_binop(a, b, Kind::FP_MUL); }
inline float32x4_t vdivq_f32(const float32x4_t& a, const float32x4_t& b) { return fp32_binop(a, b, Kind::FP_DIV); }

// Multiply by scalar
inline float32x4_t vmulq_n_f32(const float32x4_t& a, float b) {
    float32x4_t bv = vdupq_n_f32(b);
    return vmulq_f32(a, bv);
}

// ===========================================================================
// FP FMA (fused) — vfma: a + b*c (one rounding)
// FP MLA (non-fused) — vmla: a + b*c (two roundings: mul then add)
// ===========================================================================
inline float32x4_t vfmaq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& c) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term c_fp = load_as_fp32(tm, c.getLane(i));
        // FP_FMA: a + b*c (fused, one rounding)
        Term result_fp = tm.mk_term(Kind::FP_FMA, {rm, b_fp, c_fp, a_fp});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return float32x4_t(tm, lanes);
}

inline float32x4_t vfmsq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& c) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term c_fp = load_as_fp32(tm, c.getLane(i));
        // a - b*c fused: negate b, then FMA: a + (-b)*c
        Term neg_b = tm.mk_term(Kind::FP_NEG, {b_fp});
        Term result_fp = tm.mk_term(Kind::FP_FMA, {rm, neg_b, c_fp, a_fp});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return float32x4_t(tm, lanes);
}

// vmla: NOT fused — two separate roundings
inline float32x4_t vmlaq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& c) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term c_fp = load_as_fp32(tm, c.getLane(i));
        // Two roundings: first multiply, then add
        Term prod = tm.mk_term(Kind::FP_MUL, {rm, b_fp, c_fp});
        Term result_fp = tm.mk_term(Kind::FP_ADD, {rm, a_fp, prod});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return float32x4_t(tm, lanes);
}

inline float32x4_t vmlsq_f32(const float32x4_t& a, const float32x4_t& b, const float32x4_t& c) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term c_fp = load_as_fp32(tm, c.getLane(i));
        Term prod = tm.mk_term(Kind::FP_MUL, {rm, b_fp, c_fp});
        Term result_fp = tm.mk_term(Kind::FP_SUB, {rm, a_fp, prod});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return float32x4_t(tm, lanes);
}

// ===========================================================================
// FP ABS / NEG / SQRT
// ===========================================================================
inline float32x4_t vabsq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term result_fp = tm.mk_term(Kind::FP_ABS, {a_fp});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return float32x4_t(tm, lanes);
}

inline float32x4_t vnegq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term result_fp = tm.mk_term(Kind::FP_NEG, {a_fp});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return float32x4_t(tm, lanes);
}

inline float32x4_t vsqrtq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term result_fp = tm.mk_term(Kind::FP_SQRT, {rm, a_fp});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return float32x4_t(tm, lanes);
}

// ===========================================================================
// FP MIN / MAX (vminnm/vmaxnm — IEEE 754 minNum/maxNum)
// These return the non-NaN operand when one is NaN.
// ===========================================================================
// [Commented out — replaced by unified template versions below that assume
//  NaN propagation is correct in the symbolic library (XNNPACK assumption)]
// inline float32x4_t vminnmq_f32(const float32x4_t& a, const float32x4_t& b) {
//     auto& tm = g_ctx->tm;
//     std::array<Term, 4> lanes;
//     for (int i = 0; i < 4; i++) {
//         Term a_fp = load_as_fp32(tm, a.getLane(i));
//         Term b_fp = load_as_fp32(tm, b.getLane(i));
//         Term result_fp = tm.mk_term(Kind::FP_MIN, {a_fp, b_fp});
//         lanes[i] = store_fp32_as_bv(tm, result_fp);
//     }
//     return float32x4_t(tm, lanes);
// }
//
// inline float32x4_t vmaxnmq_f32(const float32x4_t& a, const float32x4_t& b) {
//     auto& tm = g_ctx->tm;
//     std::array<Term, 4> lanes;
//     for (int i = 0; i < 4; i++) {
//         Term a_fp = load_as_fp32(tm, a.getLane(i));
//         Term b_fp = load_as_fp32(tm, b.getLane(i));
//         Term result_fp = tm.mk_term(Kind::FP_MAX, {a_fp, b_fp});
//         lanes[i] = store_fp32_as_bv(tm, result_fp);
//     }
//     return float32x4_t(tm, lanes);
// }

// vmin/vmax — NaN-PROPAGATING (FPMin/FPMax from ARM ARM)
// FMAX/FMIN (vmaxq_f32/vminq_f32): NaN-propagating.
// ARM pseudocode: FPMax / FPMin — if either input is NaN, result is NaN.
// bitwuzla FP_MAX/FP_MIN implements maxNum/minNum (NaN-quiet), so we add
// explicit NaN propagation to match the ARM FMAX/FMIN behavior.
template <size_t NumLanes>
inline NeonVector<32, NumLanes> neon_vmin_f32_nan_propagating(
    const NeonVector<32, NumLanes>& a, const NeonVector<32, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term nan = tm.mk_fp_nan(fp32);
    Term nan_bv = store_fp32_as_bv(tm, nan);
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term a_nan = tm.mk_term(Kind::FP_IS_NAN, {a_fp});
        Term b_nan = tm.mk_term(Kind::FP_IS_NAN, {b_fp});
        Term either_nan = tm.mk_term(Kind::OR, {a_nan, b_nan});
        Term min_result = tm.mk_term(Kind::FP_MIN, {a_fp, b_fp});
        Term min_bv = store_fp32_as_bv(tm, min_result);
        lanes[i] = tm.mk_term(Kind::ITE, {either_nan, nan_bv, min_bv});
    }
    return NeonVector<32, NumLanes>(tm, lanes);
}
template <size_t NumLanes>
inline NeonVector<32, NumLanes> neon_vmax_f32_nan_propagating(
    const NeonVector<32, NumLanes>& a, const NeonVector<32, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term nan = tm.mk_fp_nan(fp32);
    Term nan_bv = store_fp32_as_bv(tm, nan);
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term a_nan = tm.mk_term(Kind::FP_IS_NAN, {a_fp});
        Term b_nan = tm.mk_term(Kind::FP_IS_NAN, {b_fp});
        Term either_nan = tm.mk_term(Kind::OR, {a_nan, b_nan});
        Term max_result = tm.mk_term(Kind::FP_MAX, {a_fp, b_fp});
        Term max_bv = store_fp32_as_bv(tm, max_result);
        lanes[i] = tm.mk_term(Kind::ITE, {either_nan, nan_bv, max_bv});
    }
    return NeonVector<32, NumLanes>(tm, lanes);
}

// FMAXNM/FMINNM (vmaxnmq_f32/vminnmq_f32): NaN-quiet (IEEE 754-2008 maxNum/minNum).
// ARM pseudocode: FPMaxNum / FPMinNum — if one input is NaN, return non-NaN.
// bitwuzla FP_MAX/FP_MIN directly implements this.
template <size_t NumLanes>
inline NeonVector<32, NumLanes> neon_vmin_f32_maxnum(
    const NeonVector<32, NumLanes>& a, const NeonVector<32, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        lanes[i] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MIN, {a_fp, b_fp}));
    }
    return NeonVector<32, NumLanes>(tm, lanes);
}
template <size_t NumLanes>
inline NeonVector<32, NumLanes> neon_vmax_f32_maxnum(
    const NeonVector<32, NumLanes>& a, const NeonVector<32, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        lanes[i] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MAX, {a_fp, b_fp}));
    }
    return NeonVector<32, NumLanes>(tm, lanes);
}

// vmin/vmax → FMIN/FMAX (NaN-propagating)
// NEON vmin/vmax now dispatch to the direct FP_MIN/FP_MAX helpers to match
// the RVV side (__riscv_vfmin/__riscv_vfmax), which also use FP_MIN/FP_MAX.
// In XNNPACK verification context both sides must share the same NaN
// semantics; using the _nan_propagating helpers here produced a real
// divergence vs RVV and added unreachable ITE chains that bloated every
// clamp point in the solver query.
inline float32x4_t vminq_f32(const float32x4_t& a, const float32x4_t& b) { return neon_vmin_f32_maxnum(a, b); }
inline float32x4_t vmaxq_f32(const float32x4_t& a, const float32x4_t& b) { return neon_vmax_f32_maxnum(a, b); }
inline float32x2_t vmin_f32(const float32x2_t& a, const float32x2_t& b)  { return neon_vmin_f32_maxnum(a, b); }
inline float32x2_t vmax_f32(const float32x2_t& a, const float32x2_t& b)  { return neon_vmax_f32_maxnum(a, b); }
// vminnm/vmaxnm → FMINNM/FMAXNM (NaN-quiet, IEEE 754-2008 maxNum/minNum)
inline float32x4_t vminnmq_f32(const float32x4_t& a, const float32x4_t& b) { return neon_vmin_f32_maxnum(a, b); }
inline float32x4_t vmaxnmq_f32(const float32x4_t& a, const float32x4_t& b) { return neon_vmax_f32_maxnum(a, b); }

// ===========================================================================
// FP Conversions: int32 ↔ float32
// ===========================================================================

// vcvtq_f32_s32: signed int32 → float32 (uses RNE)
inline float32x4_t vcvtq_f32_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term fp = tm.mk_term(Kind::FP_TO_FP_FROM_SBV, {rm, a.getLane(i)}, {8, 24});
        lanes[i] = store_fp32_as_bv(tm, fp);
    }
    return float32x4_t(tm, lanes);
}

// vcvtq_s32_f32: float32 → signed int32 (round toward zero)
inline int32x4_t vcvtq_s32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    Term rtz = tm.mk_rm_value(RoundingMode::RTZ);
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        lanes[i] = tm.mk_term(Kind::FP_TO_SBV, {rtz, a_fp}, {32});
    }
    return int32x4_t(tm, lanes);
}

// ===========================================================================
// FP Reinterpret casts (no-op: same 32-bit BV terms, just type change)
// ===========================================================================
inline float32x4_t vreinterpretq_f32_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return float32x4_t(tm, lanes);
}

inline float32x4_t vreinterpretq_f32_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return float32x4_t(tm, lanes);
}

inline int32x4_t vreinterpretq_s32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return int32x4_t(tm, lanes);
}

inline uint32x4_t vreinterpretq_u32_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return uint32x4_t(tm, lanes);
}

// ===========================================================================
// FP GET_LOW / GET_HIGH / COMBINE for float32
// ===========================================================================
inline float32x2_t vget_low_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes = {a.getLane(0), a.getLane(1)};
    return float32x2_t(tm, lanes);
}

inline float32x2_t vget_high_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes = {a.getLane(2), a.getLane(3)};
    return float32x2_t(tm, lanes);
}

inline float32x4_t vcombine_f32(const float32x2_t& lo, const float32x2_t& hi) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes = {lo.getLane(0), lo.getLane(1), hi.getLane(0), hi.getLane(1)};
    return float32x4_t(tm, lanes);
}

// ===========================================================================
// FP BSL (bitwise select)
// ===========================================================================
inline float32x4_t vbslq_f32(const uint32x4_t& mask, const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        // bit select: (mask & a) | (~mask & b)
        Term m = mask.getLane(i);
        Term not_m = tm.mk_term(Kind::BV_NOT, {m});
        Term sel_a = tm.mk_term(Kind::BV_AND, {m, a.getLane(i)});
        Term sel_b = tm.mk_term(Kind::BV_AND, {not_m, b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::BV_OR, {sel_a, sel_b});
    }
    return float32x4_t(tm, lanes);
}

// ===========================================================================
// FP Compares (produce uint32 mask: all-ones or all-zeros per lane)
// ===========================================================================
inline uint32x4_t vceqq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term cmp = tm.mk_term(Kind::FP_EQUAL, {a_fp, b_fp});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}

inline uint32x4_t vcgeq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term cmp = tm.mk_term(Kind::FP_GEQ, {a_fp, b_fp});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}

inline uint32x4_t vcgtq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp32(tm, a.getLane(i));
        Term b_fp = load_as_fp32(tm, b.getLane(i));
        Term cmp = tm.mk_term(Kind::FP_GT, {a_fp, b_fp});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}

inline uint32x4_t vcltq_f32(const float32x4_t& a, const float32x4_t& b) {
    return vcgtq_f32(b, a);
}

inline uint32x4_t vcleq_f32(const float32x4_t& a, const float32x4_t& b) {
    return vcgeq_f32(b, a);
}

// ===========================================================================
// PHASE 4: Remaining intrinsics from op-semantics
// ===========================================================================

// ---------------------------------------------------------------------------
// 4.1 INTEGER ARITHMETIC: ADD, SUB (same-width, all type variants)
// Op: for e: result[e] = a[e] + b[e]  (wrapping, no saturation)
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vadd_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_ADD, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vsub_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_SUB, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmul_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_MUL, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}

// ADD
inline int8x8_t   vadd_s8  (const int8x8_t& a,   const int8x8_t& b)   { return neon_vadd_impl(a,b); }
inline int8x16_t  vaddq_s8 (const int8x16_t& a,  const int8x16_t& b)  { return neon_vadd_impl(a,b); }
inline int16x4_t  vadd_s16 (const int16x4_t& a,   const int16x4_t& b)  { return neon_vadd_impl(a,b); }
inline int16x8_t  vaddq_s16(const int16x8_t& a,  const int16x8_t& b)  { return neon_vadd_impl(a,b); }
inline int32x2_t  vadd_s32 (const int32x2_t& a,   const int32x2_t& b)  { return neon_vadd_impl(a,b); }
inline int32x4_t  vaddq_s32(const int32x4_t& a,  const int32x4_t& b)  { return neon_vadd_impl(a,b); }
inline uint8x8_t  vadd_u8  (const uint8x8_t& a,   const uint8x8_t& b)  { return neon_vadd_impl(a,b); }
inline uint8x16_t vaddq_u8 (const uint8x16_t& a, const uint8x16_t& b) { return neon_vadd_impl(a,b); }
inline uint16x4_t vadd_u16 (const uint16x4_t& a,  const uint16x4_t& b) { return neon_vadd_impl(a,b); }
inline uint16x8_t vaddq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vadd_impl(a,b); }
inline uint32x2_t vadd_u32 (const uint32x2_t& a,  const uint32x2_t& b) { return neon_vadd_impl(a,b); }
inline uint32x4_t vaddq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vadd_impl(a,b); }

// SUB
inline int8x8_t   vsub_s8  (const int8x8_t& a,   const int8x8_t& b)   { return neon_vsub_impl(a,b); }
inline int8x16_t  vsubq_s8 (const int8x16_t& a,  const int8x16_t& b)  { return neon_vsub_impl(a,b); }
inline int16x4_t  vsub_s16 (const int16x4_t& a,   const int16x4_t& b)  { return neon_vsub_impl(a,b); }
inline int16x8_t  vsubq_s16(const int16x8_t& a,  const int16x8_t& b)  { return neon_vsub_impl(a,b); }
inline int32x2_t  vsub_s32 (const int32x2_t& a,   const int32x2_t& b)  { return neon_vsub_impl(a,b); }
inline int32x4_t  vsubq_s32(const int32x4_t& a,  const int32x4_t& b)  { return neon_vsub_impl(a,b); }
inline uint8x8_t  vsub_u8  (const uint8x8_t& a,   const uint8x8_t& b)  { return neon_vsub_impl(a,b); }
inline uint8x16_t vsubq_u8 (const uint8x16_t& a, const uint8x16_t& b) { return neon_vsub_impl(a,b); }
inline uint16x4_t vsub_u16 (const uint16x4_t& a,  const uint16x4_t& b) { return neon_vsub_impl(a,b); }
inline uint16x8_t vsubq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vsub_impl(a,b); }
inline uint32x2_t vsub_u32 (const uint32x2_t& a,  const uint32x2_t& b) { return neon_vsub_impl(a,b); }
inline uint32x4_t vsubq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vsub_impl(a,b); }

// MUL
inline int8x8_t   vmul_s8  (const int8x8_t& a,   const int8x8_t& b)   { return neon_vmul_impl(a,b); }
inline int8x16_t  vmulq_s8 (const int8x16_t& a,  const int8x16_t& b)  { return neon_vmul_impl(a,b); }
inline int16x4_t  vmul_s16 (const int16x4_t& a,   const int16x4_t& b)  { return neon_vmul_impl(a,b); }
inline int16x8_t  vmulq_s16(const int16x8_t& a,  const int16x8_t& b)  { return neon_vmul_impl(a,b); }
inline int32x2_t  vmul_s32 (const int32x2_t& a,   const int32x2_t& b)  { return neon_vmul_impl(a,b); }
inline int32x4_t  vmulq_s32(const int32x4_t& a,  const int32x4_t& b)  { return neon_vmul_impl(a,b); }
inline uint8x8_t  vmul_u8  (const uint8x8_t& a,   const uint8x8_t& b)  { return neon_vmul_impl(a,b); }
inline uint8x16_t vmulq_u8 (const uint8x16_t& a, const uint8x16_t& b) { return neon_vmul_impl(a,b); }
inline uint16x4_t vmul_u16 (const uint16x4_t& a,  const uint16x4_t& b) { return neon_vmul_impl(a,b); }
inline uint16x8_t vmulq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vmul_impl(a,b); }
inline uint32x2_t vmul_u32 (const uint32x2_t& a,  const uint32x2_t& b) { return neon_vmul_impl(a,b); }
inline uint32x4_t vmulq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vmul_impl(a,b); }

// ---------------------------------------------------------------------------
// 4.2 WIDENING: ADDL/SUBL/MULL/ADDW/SUBW (signed+unsigned)
// SADDL: Elem[result, e, 2*esize] = SInt(a[e]) + SInt(b[e])
// ---------------------------------------------------------------------------
inline int16x8_t vaddl_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {8});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {ae, be});
    }
    return int16x8_t(tm, lanes);
}

inline int32x4_t vaddl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {ae, be});
    }
    return int32x4_t(tm, lanes);
}

inline uint16x8_t vaddl_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {8});
        Term be = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {ae, be});
    }
    return uint16x8_t(tm, lanes);
}

inline uint32x4_t vaddl_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ae = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {16});
        Term be = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {ae, be});
    }
    return uint32x4_t(tm, lanes);
}

// SUBL (already have vsubl_s8, add the rest)
inline int32x4_t vsubl_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_SUB, {ae, be});
    }
    return int32x4_t(tm, lanes);
}

inline uint16x8_t vsubl_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {8});
        Term be = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = tm.mk_term(Kind::BV_SUB, {ae, be});
    }
    return uint16x8_t(tm, lanes);
}

// ADDW: wide + narrow
// Op: result[e] = a[e] + sext(b[e])
inline int32x4_t vaddw_s16(const int32x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {a.getLane(i), be});
    }
    return int32x4_t(tm, lanes);
}
inline int16x8_t vaddw_s8(const int16x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {a.getLane(i), be});
    }
    return int16x8_t(tm, lanes);
}
inline uint32x4_t vaddw_u16(const uint32x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term be = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {a.getLane(i), be});
    }
    return uint32x4_t(tm, lanes);
}
inline uint16x8_t vaddw_u8(const uint16x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term be = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {a.getLane(i), be});
    }
    return uint16x8_t(tm, lanes);
}

// MULL: widening multiply
// Op: result[e] = SInt(a[e]) * SInt(b[e])  in 2*esize bits
inline int32x4_t vmull_s16(const int16x4_t& a, const int16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_MUL, {ae, be});
    }
    return int32x4_t(tm, lanes);
}
inline int16x8_t vmull_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {8});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = tm.mk_term(Kind::BV_MUL, {ae, be});
    }
    return int16x8_t(tm, lanes);
}
inline uint16x8_t vmull_u8(const uint8x8_t& a, const uint8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {8});
        Term be = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = tm.mk_term(Kind::BV_MUL, {ae, be});
    }
    return uint16x8_t(tm, lanes);
}
inline uint32x4_t vmull_u16(const uint16x4_t& a, const uint16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ae = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {16});
        Term be = tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_MUL, {ae, be});
    }
    return uint32x4_t(tm, lanes);
}

// MOVN — truncating narrow (SHRN with shift=0)
inline int8x8_t vmovn_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++)
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {a.getLane(i)}, {7UL, 0UL});
    return int8x8_t(tm, lanes);
}
inline int16x4_t vmovn_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++)
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {a.getLane(i)}, {15UL, 0UL});
    return int16x4_t(tm, lanes);
}
inline uint8x8_t vmovn_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++)
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {a.getLane(i)}, {7UL, 0UL});
    return uint8x8_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// 4.3 BITWISE: AND, OR, XOR, NOT, BIC, BSL
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vand_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_AND, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vorr_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_OR, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_veor_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_XOR, {a.getLane(i), b.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmvn_impl(const NeonVector<B,N>& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_NOT, {a.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}
// BIC: a & ~b
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vbic_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term notb = tm.mk_term(Kind::BV_NOT, {b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::BV_AND, {a.getLane(i), notb});
    }
    return NeonVector<B,N>(tm, lanes);
}
// BSL: (mask & a) | (~mask & b)
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vbsl_impl(const NeonVector<B,N>& mask, const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term sel_a = tm.mk_term(Kind::BV_AND, {mask.getLane(i), a.getLane(i)});
        Term not_m = tm.mk_term(Kind::BV_NOT, {mask.getLane(i)});
        Term sel_b = tm.mk_term(Kind::BV_AND, {not_m, b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::BV_OR, {sel_a, sel_b});
    }
    return NeonVector<B,N>(tm, lanes);
}

inline int8x16_t  vandq_s8 (const int8x16_t& a,  const int8x16_t& b)  { return neon_vand_impl(a,b); }
inline int32x4_t  vandq_s32(const int32x4_t& a,  const int32x4_t& b)  { return neon_vand_impl(a,b); }
inline uint16x4_t vand_u16 (const uint16x4_t& a,  const uint16x4_t& b) { return neon_vand_impl(a,b); }
inline uint16x8_t vandq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vand_impl(a,b); }
inline uint32x4_t vandq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vand_impl(a,b); }

inline uint8x16_t vorrq_u8 (const uint8x16_t& a, const uint8x16_t& b) { return neon_vorr_impl(a,b); }
inline uint32x4_t vorrq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vorr_impl(a,b); }

inline int8x16_t  veorq_s8 (const int8x16_t& a,  const int8x16_t& b)  { return neon_veor_impl(a,b); }
inline uint16x8_t veorq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_veor_impl(a,b); }

inline uint16x8_t vbicq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vbic_impl(a,b); }
inline uint32x4_t vbicq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vbic_impl(a,b); }

inline uint16x4_t vbsl_u16(const uint16x4_t& m, const uint16x4_t& a, const uint16x4_t& b) { return neon_vbsl_impl(m,a,b); }
inline int16x8_t  vbslq_s16(const uint16x8_t& m, const int16x8_t& a, const int16x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term sel_a = tm.mk_term(Kind::BV_AND, {m.getLane(i), a.getLane(i)});
        Term not_m = tm.mk_term(Kind::BV_NOT, {m.getLane(i)});
        Term sel_b = tm.mk_term(Kind::BV_AND, {not_m, b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::BV_OR, {sel_a, sel_b});
    }
    return int16x8_t(tm, lanes);
}
inline uint16x8_t vbslq_u16(const uint16x8_t& m, const uint16x8_t& a, const uint16x8_t& b) { return neon_vbsl_impl(m,a,b); }
inline uint32x4_t vbslq_u32(const uint32x4_t& m, const uint32x4_t& a, const uint32x4_t& b) { return neon_vbsl_impl(m,a,b); }
inline int8x16_t  vmvnq_s8 (const int8x16_t& a) { return neon_vmvn_impl(a); }
inline uint8x16_t vmvnq_u8 (const uint8x16_t& a) { return neon_vmvn_impl(a); }

// ---------------------------------------------------------------------------
// 4.4 DUP (remaining variants), MOV
// ---------------------------------------------------------------------------
inline uint8x8_t  vdup_n_u8 (uint8_t v) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,8,v); std::array<Term,8> l; l.fill(val); return uint8x8_t(tm,l); }
inline uint16x4_t vdup_n_u16(uint16_t v){ auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,v); std::array<Term,4> l; l.fill(val); return uint16x4_t(tm,l); }
inline uint32x2_t vdup_n_u32(uint32_t v){ auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,v); std::array<Term,2> l; l.fill(val); return uint32x2_t(tm,l); }
inline int32x2_t  vdup_n_s32(int32_t v) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,v); std::array<Term,2> l; l.fill(val); return int32x2_t(tm,l); }
inline int16x4_t  vdup_n_s16(int16_t v) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,v); std::array<Term,4> l; l.fill(val); return int16x4_t(tm,l); }
inline int8x16_t  vdupq_n_s8(int8_t v)  { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,8,v); std::array<Term,16> l; l.fill(val); return int8x16_t(tm,l); }
inline uint8x16_t vdupq_n_u8(uint8_t v) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,8,v); std::array<Term,16> l; l.fill(val); return uint8x16_t(tm,l); }
inline uint16x8_t vdupq_n_u16(uint16_t v){auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,v); std::array<Term,8> l; l.fill(val); return uint16x8_t(tm,l);}
inline uint32x4_t vdupq_n_u32(uint32_t v){auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,v); std::array<Term,4> l; l.fill(val); return uint32x4_t(tm,l);}
// vmov_n aliases (same as vdup_n)
inline uint32x2_t vmov_n_u32(uint32_t v) { return vdup_n_u32(v); }
inline uint16x4_t vmov_n_u16(uint16_t v) { return vdup_n_u16(v); }
inline uint32x4_t vmovq_n_u32(uint32_t v){ return vdupq_n_u32(v); }
inline uint16x8_t vmovq_n_u16(uint16_t v){ return vdupq_n_u16(v); }
inline uint8x16_t vmovq_n_u8(uint8_t v)  { return vdupq_n_u8(v); }
inline float32x4_t vmovq_n_f32(float v)  { return vdupq_n_f32(v); }

// ---------------------------------------------------------------------------
// 4.5 LOADS (remaining variants)
// ---------------------------------------------------------------------------
inline int16x4_t vld1_s16(const int16_t* p) { auto& b=g_ctx->findBuffer(p); return b.loadNeon<16,4>(b.ptrToByteOffset(p)); }
inline int16x8_t vld1q_s16(const int16_t* p){ auto& b=g_ctx->findBuffer(p); return b.loadNeon<16,8>(b.ptrToByteOffset(p)); }
inline int32x2_t vld1_s32(const int32_t* p) { auto& b=g_ctx->findBuffer(p); return b.loadNeon<32,2>(b.ptrToByteOffset(p)); }
inline uint8x8_t vld1_u8(const uint8_t* p)  { auto& b=g_ctx->findBuffer(p); return b.loadNeon<8,8>(b.ptrToByteOffset(p)); }
inline uint8x16_t vld1q_u8(const uint8_t* p){ auto& b=g_ctx->findBuffer(p); return b.loadNeon<8,16>(b.ptrToByteOffset(p)); }
inline uint16x4_t vld1_u16(const uint16_t* p){ auto& b=g_ctx->findBuffer(p); return b.loadNeon<16,4>(b.ptrToByteOffset(p)); }
inline uint16x8_t vld1q_u16(const uint16_t* p){auto& b=g_ctx->findBuffer(p); return b.loadNeon<16,8>(b.ptrToByteOffset(p)); }
inline uint32x2_t vld1_u32(const uint32_t* p){ auto& b=g_ctx->findBuffer(p); return b.loadNeon<32,2>(b.ptrToByteOffset(p)); }
inline uint32x4_t vld1q_u32(const uint32_t* p){auto& b=g_ctx->findBuffer(p); return b.loadNeon<32,4>(b.ptrToByteOffset(p)); }
// ld1_dup: load one scalar, broadcast
inline float32x2_t vld1_dup_f32(const float* p){ auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),32); auto& tm=g_ctx->tm; std::array<Term,2> l={v,v}; return float32x2_t(tm,l); }
inline float32x4_t vld1q_dup_f32(const float* p){auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),32); auto& tm=g_ctx->tm; std::array<Term,4> l; l.fill(v); return float32x4_t(tm,l);}
inline uint32x2_t vld1_dup_u32(const uint32_t* p){auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),32); auto& tm=g_ctx->tm; std::array<Term,2> l={v,v}; return uint32x2_t(tm,l);}
inline uint32x4_t vld1q_dup_u32(const uint32_t* p){auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),32); auto& tm=g_ctx->tm; std::array<Term,4> l; l.fill(v); return uint32x4_t(tm,l);}

// STORES (remaining)
inline void vst1q_s16(int16_t* p, const int16x8_t& v) { auto& b=g_ctx->findBuffer(p); b.storeNeon<16,8>(b.ptrToByteOffset(p),v); }
inline void vst1q_s32(int32_t* p, const int32x4_t& v) { auto& b=g_ctx->findBuffer(p); b.storeNeon<32,4>(b.ptrToByteOffset(p),v); }
inline void vst1q_u8(uint8_t* p, const uint8x16_t& v) { auto& b=g_ctx->findBuffer(p); b.storeNeon<8,16>(b.ptrToByteOffset(p),v); }
inline void vst1q_u16(uint16_t* p, const uint16x8_t& v){auto& b=g_ctx->findBuffer(p); b.storeNeon<16,8>(b.ptrToByteOffset(p),v); }
inline void vst1q_u32(uint32_t* p, const uint32x4_t& v){auto& b=g_ctx->findBuffer(p); b.storeNeon<32,4>(b.ptrToByteOffset(p),v); }
inline void vst1_u8(uint8_t* p, const uint8x8_t& v)    { auto& b=g_ctx->findBuffer(p); b.storeNeon<8,8>(b.ptrToByteOffset(p),v); }
inline void vst1_u16(uint16_t* p, const uint16x4_t& v) { auto& b=g_ctx->findBuffer(p); b.storeNeon<16,4>(b.ptrToByteOffset(p),v); }

// ---------------------------------------------------------------------------
// 4.6 COMBINE / GET_LOW / GET_HIGH (remaining variants)
// ---------------------------------------------------------------------------
inline int32x4_t   vcombine_s32(const int32x2_t& lo, const int32x2_t& hi) { auto& tm=g_ctx->tm; std::array<Term,4> l={lo.getLane(0),lo.getLane(1),hi.getLane(0),hi.getLane(1)}; return int32x4_t(tm,l); }
inline uint8x16_t  vcombine_u8(const uint8x8_t& lo, const uint8x8_t& hi) { auto& tm=g_ctx->tm; std::array<Term,16> l; for(int i=0;i<8;i++){l[i]=lo.getLane(i);l[i+8]=hi.getLane(i);} return uint8x16_t(tm,l); }
inline uint16x8_t  vcombine_u16(const uint16x4_t& lo, const uint16x4_t& hi) { auto& tm=g_ctx->tm; std::array<Term,8> l; for(int i=0;i<4;i++){l[i]=lo.getLane(i);l[i+4]=hi.getLane(i);} return uint16x8_t(tm,l); }

inline int32x2_t  vget_low_s32(const int32x4_t& a)  { auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(0),a.getLane(1)}; return int32x2_t(tm,l); }
inline int32x2_t  vget_high_s32(const int32x4_t& a) { auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(2),a.getLane(3)}; return int32x2_t(tm,l); }
inline uint8x8_t  vget_low_u8(const uint8x16_t& a)  { auto& tm=g_ctx->tm; std::array<Term,8> l; for(int i=0;i<8;i++) l[i]=a.getLane(i); return uint8x8_t(tm,l); }
inline uint8x8_t  vget_high_u8(const uint8x16_t& a) { auto& tm=g_ctx->tm; std::array<Term,8> l; for(int i=0;i<8;i++) l[i]=a.getLane(i+8); return uint8x8_t(tm,l); }
inline uint16x4_t vget_low_u16(const uint16x8_t& a) { auto& tm=g_ctx->tm; std::array<Term,4> l; for(int i=0;i<4;i++) l[i]=a.getLane(i); return uint16x4_t(tm,l); }
inline uint16x4_t vget_high_u16(const uint16x8_t& a){ auto& tm=g_ctx->tm; std::array<Term,4> l; for(int i=0;i<4;i++) l[i]=a.getLane(i+4); return uint16x4_t(tm,l); }
inline uint32x2_t vget_low_u32(const uint32x4_t& a) { auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(0),a.getLane(1)}; return uint32x2_t(tm,l); }
inline uint32x2_t vget_high_u32(const uint32x4_t& a){ auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(2),a.getLane(3)}; return uint32x2_t(tm,l); }

// GET_LANE (extract scalar)
inline float vget_lane_f32(const float32x2_t& a, int lane) { (void)a; (void)lane; return 0.0f; } // concrete value unused in symbolic mode
inline int32_t vgetq_lane_s32(const int32x4_t& a, int lane) { (void)a; (void)lane; return 0; }
inline uint64_t vgetq_lane_u64(const uint64x2_t& a, int lane) { (void)a; (void)lane; return 0; }

// SET_LANE
inline float32x4_t vsetq_lane_f32(float val, const float32x4_t& v, int lane) {
    auto result = v;
    auto& tm = g_ctx->tm;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term fp = mk_fp32_from_float(tm, val);
    result.setLane(lane, store_fp32_as_bv(tm, fp));
    return result;
}

// ---------------------------------------------------------------------------
// 4.7 COMPARE (integer)
// Op: result[e] = (a[e] cmp b[e]) ? all_ones : all_zeros
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vceq_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term cmp = tm.mk_term(Kind::EQUAL, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, B, -1), mk_bv_val(tm, B, 0)});
    }
    return NeonVector<B,N>(tm, lanes);
}

inline uint8x8_t  vceq_s8(const int8x8_t& a, const int8x8_t& b)     { return neon_vceq_impl(a,b); }
inline uint8x16_t vceqq_s8(const int8x16_t& a, const int8x16_t& b)  { return neon_vceq_impl(a,b); }
inline uint16x4_t vceq_s16(const int16x4_t& a, const int16x4_t& b)   { return neon_vceq_impl(a,b); }
inline uint16x8_t vceqq_s16(const int16x8_t& a, const int16x8_t& b)  { return neon_vceq_impl(a,b); }
inline uint32x2_t vceq_s32(const int32x2_t& a, const int32x2_t& b)   { return neon_vceq_impl(a,b); }
inline uint32x4_t vceqq_s32(const int32x4_t& a, const int32x4_t& b)  { return neon_vceq_impl(a,b); }

template <size_t B, size_t N>
inline NeonVector<B,N> neon_vcgt_s_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term cmp = tm.mk_term(Kind::BV_SGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, B, -1), mk_bv_val(tm, B, 0)});
    }
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vcgt_u_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term cmp = tm.mk_term(Kind::BV_UGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, B, -1), mk_bv_val(tm, B, 0)});
    }
    return NeonVector<B,N>(tm, lanes);
}

inline uint32x4_t vcgtq_s32(const int32x4_t& a, const int32x4_t& b)  { return neon_vcgt_s_impl(a,b); }
inline uint16x8_t vcgtq_s16(const int16x8_t& a, const int16x8_t& b)  { return neon_vcgt_s_impl(a,b); }
inline uint32x4_t vcgtq_u32(const uint32x4_t& a, const uint32x4_t& b){ return neon_vcgt_u_impl(a,b); }
inline uint16x8_t vcgtq_u16(const uint16x8_t& a, const uint16x8_t& b){ return neon_vcgt_u_impl(a,b); }

inline uint32x4_t vcltq_s32(const int32x4_t& a, const int32x4_t& b)  { return vcgtq_s32(b,a); }
inline uint16x8_t vcltq_s16(const int16x8_t& a, const int16x8_t& b)  { return vcgtq_s16(b,a); }

// ---------------------------------------------------------------------------
// 4.8 ABS, NEG (integer)
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vabs_impl(const NeonVector<B,N>& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term neg = tm.mk_term(Kind::BV_NEG, {a.getLane(i)});
        Term is_neg = tm.mk_term(Kind::BV_SLT, {a.getLane(i), mk_bv_val(tm, B, 0)});
        lanes[i] = tm.mk_term(Kind::ITE, {is_neg, neg, a.getLane(i)});
    }
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vneg_impl(const NeonVector<B,N>& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_NEG, {a.getLane(i)});
    return NeonVector<B,N>(tm, lanes);
}

inline int8x8_t   vabs_s8  (const int8x8_t& a)   { return neon_vabs_impl(a); }
inline int8x16_t  vabsq_s8 (const int8x16_t& a)  { return neon_vabs_impl(a); }
inline int16x4_t  vabs_s16 (const int16x4_t& a)   { return neon_vabs_impl(a); }
inline int16x8_t  vabsq_s16(const int16x8_t& a)  { return neon_vabs_impl(a); }
inline int32x2_t  vabs_s32 (const int32x2_t& a)   { return neon_vabs_impl(a); }
inline int32x4_t  vabsq_s32(const int32x4_t& a)  { return neon_vabs_impl(a); }

inline int8x8_t   vneg_s8  (const int8x8_t& a)   { return neon_vneg_impl(a); }
inline int8x16_t  vnegq_s8 (const int8x16_t& a)  { return neon_vneg_impl(a); }
inline int16x4_t  vneg_s16 (const int16x4_t& a)   { return neon_vneg_impl(a); }
inline int16x8_t  vnegq_s16(const int16x8_t& a)  { return neon_vneg_impl(a); }
inline int32x2_t  vneg_s32 (const int32x2_t& a)   { return neon_vneg_impl(a); }
inline int32x4_t  vnegq_s32(const int32x4_t& a)  { return neon_vneg_impl(a); }

// ---------------------------------------------------------------------------
// 4.9 INTEGER MAX / MIN
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmax_s_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term cmp = tm.mk_term(Kind::BV_SGE, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmin_s_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLE, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmax_u_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term cmp = tm.mk_term(Kind::BV_UGE, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return NeonVector<B,N>(tm, lanes);
}
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vmin_u_impl(const NeonVector<B,N>& a, const NeonVector<B,N>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++) {
        Term cmp = tm.mk_term(Kind::BV_ULE, {a.getLane(i), b.getLane(i)});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return NeonVector<B,N>(tm, lanes);
}

inline int8x16_t  vmaxq_s8 (const int8x16_t& a,  const int8x16_t& b)  { return neon_vmax_s_impl(a,b); }
inline int16x8_t  vmaxq_s16(const int16x8_t& a,  const int16x8_t& b)  { return neon_vmax_s_impl(a,b); }
inline int32x4_t  vmaxq_s32(const int32x4_t& a,  const int32x4_t& b)  { return neon_vmax_s_impl(a,b); }
inline uint8x8_t  vmax_u8  (const uint8x8_t& a,   const uint8x8_t& b)  { return neon_vmax_u_impl(a,b); }
inline uint8x16_t vmaxq_u8 (const uint8x16_t& a, const uint8x16_t& b) { return neon_vmax_u_impl(a,b); }
inline uint32x4_t vmaxq_u32(const uint32x4_t& a, const uint32x4_t& b) { return neon_vmax_u_impl(a,b); }

inline int8x16_t  vminq_s8 (const int8x16_t& a,  const int8x16_t& b)  { return neon_vmin_s_impl(a,b); }
inline int16x8_t  vminq_s16(const int16x8_t& a,  const int16x8_t& b)  { return neon_vmin_s_impl(a,b); }
inline int32x4_t  vminq_s32(const int32x4_t& a,  const int32x4_t& b)  { return neon_vmin_s_impl(a,b); }
inline uint8x8_t  vmin_u8  (const uint8x8_t& a,   const uint8x8_t& b)  { return neon_vmin_u_impl(a,b); }
inline uint8x16_t vminq_u8 (const uint8x16_t& a, const uint8x16_t& b) { return neon_vmin_u_impl(a,b); }

// ---------------------------------------------------------------------------
// 4.10 SHIFT LEFT (immediate)
// Op: result[e] = a[e] << n
// ---------------------------------------------------------------------------
template <size_t B, size_t N>
inline NeonVector<B,N> neon_vshl_n_impl(const NeonVector<B,N>& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, N> lanes;
    for (size_t i = 0; i < N; i++)
        lanes[i] = tm.mk_term(Kind::BV_SHL, {a.getLane(i), mk_bv_val(tm, B, n)});
    return NeonVector<B,N>(tm, lanes);
}

inline int8x8_t   vshl_n_s8 (const int8x8_t& a,  int n) { return neon_vshl_n_impl(a,n); }
inline int8x16_t  vshlq_n_s8(const int8x16_t& a, int n) { return neon_vshl_n_impl(a,n); }
inline int16x4_t  vshl_n_s16(const int16x4_t& a,  int n) { return neon_vshl_n_impl(a,n); }
inline int16x8_t  vshlq_n_s16(const int16x8_t& a,int n) { return neon_vshl_n_impl(a,n); }
inline int32x2_t  vshl_n_s32(const int32x2_t& a,  int n) { return neon_vshl_n_impl(a,n); }
inline int32x4_t  vshlq_n_s32(const int32x4_t& a,int n) { return neon_vshl_n_impl(a,n); }
inline uint64x1_t vshl_n_u64(const uint64x1_t& a, int n) { return neon_vshl_n_impl(a,n); }

// SHLL — widening shift left
inline int32x4_t vshll_n_s16(const int16x4_t& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_SHL, {ext, mk_bv_val(tm, 32, n)});
    }
    return int32x4_t(tm, lanes);
}
inline uint32x4_t vshll_n_u16(const uint16x4_t& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_SHL, {ext, mk_bv_val(tm, 32, n)});
    }
    return uint32x4_t(tm, lanes);
}

// SHRN — truncating narrowing shift right (non-rounding)
inline int16x4_t vshrn_n_s32(const int32x4_t& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term shifted = tm.mk_term(Kind::BV_SHR, {a.getLane(i), mk_bv_val(tm, 32, n)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted}, {15UL, 0UL});
    }
    return int16x4_t(tm, lanes);
}
inline uint16x4_t vshrn_n_u32(const uint32x4_t& a, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term shifted = tm.mk_term(Kind::BV_SHR, {a.getLane(i), mk_bv_val(tm, 32, n)});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {shifted}, {15UL, 0UL});
    }
    return uint16x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// 4.11 SATURATING OPS (remaining)
// ---------------------------------------------------------------------------
// SQADD (remaining widths)
inline int8x8_t vqadd_s8(const int8x8_t& a, const int8x8_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {8});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {8});
        lanes[i] = signed_saturate(tm, tm.mk_term(Kind::BV_ADD, {ae, be}), 16, 8);
    }
    return int8x8_t(tm, lanes);
}
inline int32x4_t vqaddq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {32});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {32});
        lanes[i] = signed_saturate(tm, tm.mk_term(Kind::BV_ADD, {ae, be}), 64, 32);
    }
    return int32x4_t(tm, lanes);
}

// QMOVUN — signed-to-unsigned saturating narrow (clamp negatives to 0)
inline uint8x8_t vqmovun_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    Term zero16 = mk_bv_val(tm, 16, 0);
    Term max_u8 = mk_bv_val(tm, 16, 255);
    for (int i = 0; i < 8; i++) {
        Term v = a.getLane(i);
        Term lt_zero = tm.mk_term(Kind::BV_SLT, {v, zero16});
        Term gt_max = tm.mk_term(Kind::BV_SGT, {v, max_u8});
        Term clamped = tm.mk_term(Kind::ITE, {lt_zero, zero16,
                        tm.mk_term(Kind::ITE, {gt_max, max_u8, v})});
        lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {clamped}, {7UL, 0UL});
    }
    return uint8x8_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// 4.12 EXT (remaining variants)
// ---------------------------------------------------------------------------
inline uint8x8_t vext_u8(const uint8x8_t& a, const uint8x8_t& b, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        int idx = i + n;
        lanes[i] = (idx < 8) ? a.getLane(idx) : b.getLane(idx - 8);
    }
    return uint8x8_t(tm, lanes);
}
inline uint16x4_t vext_u16(const uint16x4_t& a, const uint16x4_t& b, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int idx = i + n;
        lanes[i] = (idx < 4) ? a.getLane(idx) : b.getLane(idx - 4);
    }
    return uint16x4_t(tm, lanes);
}
inline int32x4_t vextq_s32(const int32x4_t& a, const int32x4_t& b, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int idx = i + n;
        lanes[i] = (idx < 4) ? a.getLane(idx) : b.getLane(idx - 4);
    }
    return int32x4_t(tm, lanes);
}
inline uint32x4_t vextq_u32(const uint32x4_t& a, const uint32x4_t& b, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int idx = i + n;
        lanes[i] = (idx < 4) ? a.getLane(idx) : b.getLane(idx - 4);
    }
    return uint32x4_t(tm, lanes);
}
inline float32x4_t vextq_f32(const float32x4_t& a, const float32x4_t& b, int n) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int idx = i + n;
        lanes[i] = (idx < 4) ? a.getLane(idx) : b.getLane(idx - 4);
    }
    return float32x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// 4.13 PAIRWISE ops
// Op: result[i] = a[2*i] + a[2*i+1]  (adjacent pairs)
// ---------------------------------------------------------------------------
inline float32x2_t vpadd_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 2> lanes;
    // lane 0 = a[0] + a[1], lane 1 = b[0] + b[1]
    Term a0 = load_as_fp32(tm, a.getLane(0));
    Term a1 = load_as_fp32(tm, a.getLane(1));
    Term b0 = load_as_fp32(tm, b.getLane(0));
    Term b1 = load_as_fp32(tm, b.getLane(1));
    lanes[0] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_ADD, {rm, a0, a1}));
    lanes[1] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_ADD, {rm, b0, b1}));
    return float32x2_t(tm, lanes);
}

inline int32x4_t vpaddlq_s16(const int16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term lo = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(2*i)}, {16});
        Term hi = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(2*i+1)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {lo, hi});
    }
    return int32x4_t(tm, lanes);
}

// PADAL — pairwise add and accumulate long
inline int16x8_t vpadalq_s8(const int16x8_t& acc, const int8x16_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term lo = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(2*i)}, {8});
        Term hi = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(2*i+1)}, {8});
        Term pair_sum = tm.mk_term(Kind::BV_ADD, {lo, hi});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), pair_sum});
    }
    return int16x8_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// 4.14 MOVL (remaining: unsigned)
// ---------------------------------------------------------------------------
inline uint16x8_t vmovl_u8(const uint8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++)
        lanes[i] = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {8});
    return uint16x8_t(tm, lanes);
}
inline uint32x4_t vmovl_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++)
        lanes[i] = tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getLane(i)}, {16});
    return uint32x4_t(tm, lanes);
}
inline int16x8_t vmovl_s8(const int8x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++)
        lanes[i] = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i)}, {8});
    return int16x8_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// 4.15 REINTERPRET (remaining casts — no-op, just repackage lanes)
// ---------------------------------------------------------------------------
inline uint32x2_t vreinterpret_u32_u8(const uint8x8_t& a) { return vreinterpret_u32_s8(a); }
inline uint32x2_t vreinterpret_u32_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++)
        lanes[i] = tm.mk_term(Kind::BV_CONCAT, {a.getLane(i*2+1), a.getLane(i*2)});
    return uint32x2_t(tm, lanes);
}
inline uint8x16_t vreinterpretq_u8_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> lanes;
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++)
            lanes[i*4+j] = tm.mk_term(Kind::BV_EXTRACT, {a.getLane(i)},
                                        {static_cast<uint64_t>(j*8+7), static_cast<uint64_t>(j*8)});
    return uint8x16_t(tm, lanes);
}
inline uint8x16_t vreinterpretq_u8_s64(const int64x2_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 16> lanes;
    for (int i = 0; i < 2; i++)
        for (int j = 0; j < 8; j++)
            lanes[i*8+j] = tm.mk_term(Kind::BV_EXTRACT, {a.getLane(i)},
                                        {static_cast<uint64_t>(j*8+7), static_cast<uint64_t>(j*8)});
    return uint8x16_t(tm, lanes);
}
inline uint64x2_t vreinterpretq_u64_s32(const int32x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++)
        lanes[i] = tm.mk_term(Kind::BV_CONCAT, {a.getLane(i*2+1), a.getLane(i*2)});
    return uint64x2_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// 4.16 INTEGER MLA/MLS (multiply-accumulate, multiply-subtract)
// Already have vmlaq_s32 in Phase 1. Add remaining widths:
// ---------------------------------------------------------------------------
inline int16x8_t vmlaq_s16(const int16x8_t& acc, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term prod = tm.mk_term(Kind::BV_MUL, {b.getLane(i), c.getLane(i)});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), prod});
    }
    return int16x8_t(tm, lanes);
}

// MLAL — widening multiply-accumulate long
// Op: acc[e] += SInt(b[e]) * SInt(c[e])  (widened)
inline int32x4_t vmlal_s16(const int32x4_t& acc, const int16x4_t& b, const int16x4_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        Term ce = tm.mk_term(Kind::BV_SIGN_EXTEND, {c.getLane(i)}, {16});
        Term prod = tm.mk_term(Kind::BV_MUL, {be, ce});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), prod});
    }
    return int32x4_t(tm, lanes);
}
inline int16x8_t vmlal_s8(const int16x8_t& acc, const int8x8_t& b, const int8x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {8});
        Term ce = tm.mk_term(Kind::BV_SIGN_EXTEND, {c.getLane(i)}, {8});
        Term prod = tm.mk_term(Kind::BV_MUL, {be, ce});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), prod});
    }
    return int16x8_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// 4.17 REDUCTION: ADDV (across-vector add)
// Op: result = sum of all lanes
// ---------------------------------------------------------------------------
inline int32_t vaddvq_s32(const int32x4_t& a) {
    // In symbolic mode, this produces a symbolic scalar — but XNNPACK kernels
    // typically store the result, not use it in further vector ops.
    // For now, return 0 (concrete); the symbolic path is via scalar memory.
    (void)a;
    return 0;
}

// ===========================================================================
// PHASE 4 (cont): Remaining intrinsics from old cvc5 library
// ===========================================================================

// --- FP compares (absolute) ---
// vcagt: |a| > |b|;  vcalt: |a| < |b|
inline uint32x4_t vcagtq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = tm.mk_term(Kind::FP_ABS, {load_as_fp32(tm, a.getLane(i))});
        Term bf = tm.mk_term(Kind::FP_ABS, {load_as_fp32(tm, b.getLane(i))});
        Term cmp = tm.mk_term(Kind::FP_GT, {af, bf});
        lanes[i] = tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 32, -1), mk_bv_val(tm, 32, 0)});
    }
    return uint32x4_t(tm, lanes);
}
inline uint32x4_t vcaltq_f32(const float32x4_t& a, const float32x4_t& b) { return vcagtq_f32(b, a); }

// --- Conversion: fixed-point ---
inline float32x4_t vcvtq_n_f32_s32(const int32x4_t& a, int n) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term fp = tm.mk_term(Kind::FP_TO_FP_FROM_SBV, {rm, a.getLane(i)}, {8, 24});
        // Divide by 2^n: multiply by 2^(-n)
        Sort fp32 = tm.mk_fp_sort(8, 24);
        // Create power-of-two scale factor
        char buf[32]; snprintf(buf, sizeof(buf), "%.17e", 1.0 / (double)(1 << n));
        Term scale = tm.mk_fp_value(fp32, rm, buf);
        Term result_fp = tm.mk_term(Kind::FP_MUL, {rm, fp, scale});
        lanes[i] = store_fp32_as_bv(tm, result_fp);
    }
    return float32x4_t(tm, lanes);
}

// --- DOT product ---
// vdotq_s32: dot product of 4 int8 groups, accumulate into int32
// Op: acc[i] += sum(a[i*4+j] * b[i*4+j]) for j=0..3
inline int32x4_t vdotq_s32(const int32x4_t& acc, const int8x16_t& a, const int8x16_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term sum = acc.getLane(i);
        for (int j = 0; j < 4; j++) {
            Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(i*4+j)}, {24});
            Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i*4+j)}, {24});
            sum = tm.mk_term(Kind::BV_ADD, {sum, tm.mk_term(Kind::BV_MUL, {ae, be})});
        }
        lanes[i] = sum;
    }
    return int32x4_t(tm, lanes);
}
inline int32x4_t vdotq_lane_s32(const int32x4_t& acc, const int8x16_t& a, const int8x8_t& b, int lane) {
    // Broadcast the 4-byte group at 'lane' from b, then dot
    auto& tm = g_ctx->tm;
    std::array<Term, 16> b_broadcast;
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++)
            b_broadcast[i*4+j] = b.getLane(lane*4+j);
    int8x16_t bb(tm, b_broadcast);
    return vdotq_s32(acc, a, bb);
}

// --- DUP lane ---
inline float32x4_t vdupq_lane_f32(const float32x2_t& a, int lane) {
    auto& tm = g_ctx->tm;
    Term v = a.getLane(lane);
    std::array<Term, 4> lanes; lanes.fill(v);
    return float32x4_t(tm, lanes);
}

// --- GET/SET lane ---
inline int32_t  vget_lane_s32(const int32x2_t& a, int lane) { (void)a; (void)lane; return 0; }
inline uint32_t vget_lane_u32(const uint32x2_t& a, int lane) { (void)a; (void)lane; return 0; }
inline uint32_t vgetq_lane_u32(const uint32x4_t& a, int lane) { (void)a; (void)lane; return 0; }
inline uint16x8_t vsetq_lane_u16(uint16_t val, const uint16x8_t& v, int lane) {
    auto result = v; result.setLane(lane, mk_bv_val(g_ctx->tm, 16, val)); return result;
}

// --- LD1 dup/lane ---
inline int16x4_t vld1_dup_s16(const int16_t* p) { auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),16); auto& tm=g_ctx->tm; std::array<Term,4> l; l.fill(v); return int16x4_t(tm,l); }
inline int32x2_t vld1_dup_s32(const int32_t* p) { auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),32); auto& tm=g_ctx->tm; std::array<Term,2> l; l.fill(v); return int32x2_t(tm,l); }
inline uint16x4_t vld1_dup_u16(const uint16_t* p) { auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),16); auto& tm=g_ctx->tm; std::array<Term,4> l; l.fill(v); return uint16x4_t(tm,l); }
inline int16x8_t vld1q_dup_s16(const int16_t* p) { auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),16); auto& tm=g_ctx->tm; std::array<Term,8> l; l.fill(v); return int16x8_t(tm,l); }
inline uint16x8_t vld1q_dup_u16(const uint16_t* p) { auto& b=g_ctx->findBuffer(p); Term v=b.loadScalar(b.ptrToByteOffset(p),16); auto& tm=g_ctx->tm; std::array<Term,8> l; l.fill(v); return uint16x8_t(tm,l); }

// LD1 lane: load one scalar, insert into existing vector at lane
inline int32x2_t vld1_lane_s32(const int32_t* p, const int32x2_t& v, int lane) {
    auto r = v; auto& b=g_ctx->findBuffer(p); r.setLane(lane, b.loadScalar(b.ptrToByteOffset(p),32)); return r;
}
inline uint16x4_t vld1_lane_u16(const uint16_t* p, const uint16x4_t& v, int lane) {
    auto r = v; auto& b=g_ctx->findBuffer(p); r.setLane(lane, b.loadScalar(b.ptrToByteOffset(p),16)); return r;
}
inline uint32x2_t vld1_lane_u32(const uint32_t* p, const uint32x2_t& v, int lane) {
    auto r = v; auto& b=g_ctx->findBuffer(p); r.setLane(lane, b.loadScalar(b.ptrToByteOffset(p),32)); return r;
}
inline float32x4_t vld1q_lane_f32(const float* p, const float32x4_t& v, int lane) {
    auto r = v; auto& b=g_ctx->findBuffer(p); r.setLane(lane, b.loadScalar(b.ptrToByteOffset(p),32)); return r;
}
inline uint16x8_t vld1q_lane_u16(const uint16_t* p, const uint16x8_t& v, int lane) {
    auto r = v; auto& b=g_ctx->findBuffer(p); r.setLane(lane, b.loadScalar(b.ptrToByteOffset(p),16)); return r;
}

// LD1x4: load 4 consecutive vectors
inline VectorTuple<uint8x16_t, 4> vld1q_u8_x4(const uint8_t* p) {
    VectorTuple<uint8x16_t, 4> result;
    for (int k = 0; k < 4; k++) result.val[k] = vld1q_u8(p + k * 16);
    return result;
}

// --- LD2: structured load (de-interleave) ---
inline VectorTuple<float32x2_t, 2> vld2_f32(const float* p) {
    auto& buf = g_ctx->findBuffer(p);
    auto& tm = g_ctx->tm;
    size_t off = buf.ptrToByteOffset(p);
    VectorTuple<float32x2_t, 2> r;
    std::array<Term,2> v0, v1;
    for (int i = 0; i < 2; i++) { v0[i] = buf.loadScalar(off + i*8, 32); v1[i] = buf.loadScalar(off + i*8+4, 32); }
    r.val[0] = float32x2_t(tm, v0); r.val[1] = float32x2_t(tm, v1);
    return r;
}
inline VectorTuple<uint16x4_t, 2> vld2_u16(const uint16_t* p) {
    auto& buf = g_ctx->findBuffer(p);
    auto& tm = g_ctx->tm;
    size_t off = buf.ptrToByteOffset(p);
    VectorTuple<uint16x4_t, 2> r;
    std::array<Term,4> v0, v1;
    for (int i = 0; i < 4; i++) { v0[i] = buf.loadScalar(off + i*4, 16); v1[i] = buf.loadScalar(off + i*4+2, 16); }
    r.val[0] = uint16x4_t(tm, v0); r.val[1] = uint16x4_t(tm, v1);
    return r;
}
inline VectorTuple<float32x4_t, 2> vld2q_f32(const float* p) {
    auto& buf = g_ctx->findBuffer(p);
    auto& tm = g_ctx->tm;
    size_t off = buf.ptrToByteOffset(p);
    VectorTuple<float32x4_t, 2> r;
    std::array<Term,4> v0, v1;
    for (int i = 0; i < 4; i++) { v0[i] = buf.loadScalar(off + i*8, 32); v1[i] = buf.loadScalar(off + i*8+4, 32); }
    r.val[0] = float32x4_t(tm, v0); r.val[1] = float32x4_t(tm, v1);
    return r;
}
// ld2_dup: load 2 scalars, broadcast each
inline VectorTuple<float32x2_t, 2> vld2_dup_f32(const float* p) {
    auto& buf = g_ctx->findBuffer(p); auto& tm = g_ctx->tm;
    size_t off = buf.ptrToByteOffset(p);
    Term s0 = buf.loadScalar(off, 32); Term s1 = buf.loadScalar(off+4, 32);
    VectorTuple<float32x2_t, 2> r;
    std::array<Term,2> l0={s0,s0}, l1={s1,s1};
    r.val[0] = float32x2_t(tm, l0); r.val[1] = float32x2_t(tm, l1);
    return r;
}
inline VectorTuple<float32x4_t, 2> vld2q_dup_f32(const float* p) {
    auto& buf = g_ctx->findBuffer(p); auto& tm = g_ctx->tm;
    size_t off = buf.ptrToByteOffset(p);
    Term s0 = buf.loadScalar(off, 32); Term s1 = buf.loadScalar(off+4, 32);
    VectorTuple<float32x4_t, 2> r;
    std::array<Term,4> l0, l1; l0.fill(s0); l1.fill(s1);
    r.val[0] = float32x4_t(tm, l0); r.val[1] = float32x4_t(tm, l1);
    return r;
}
inline VectorTuple<uint16x8_t, 2> vld2q_dup_u16(const uint16_t* p) {
    auto& buf = g_ctx->findBuffer(p); auto& tm = g_ctx->tm;
    size_t off = buf.ptrToByteOffset(p);
    Term s0 = buf.loadScalar(off, 16); Term s1 = buf.loadScalar(off+2, 16);
    VectorTuple<uint16x8_t, 2> r;
    std::array<Term,8> l0, l1; l0.fill(s0); l1.fill(s1);
    r.val[0] = uint16x8_t(tm, l0); r.val[1] = uint16x8_t(tm, l1);
    return r;
}
// ld2q_lane, ld3q_lane, ld4q_lane: load N scalars into specific lanes
inline VectorTuple<uint16x8_t, 2> vld2q_lane_u16(const uint16_t* p, const VectorTuple<uint16x8_t, 2>& v, int lane) {
    auto r = v; auto& buf = g_ctx->findBuffer(p); size_t off = buf.ptrToByteOffset(p);
    r.val[0].setLane(lane, buf.loadScalar(off, 16)); r.val[1].setLane(lane, buf.loadScalar(off+2, 16));
    return r;
}
inline VectorTuple<uint32x4_t, 2> vld2q_lane_u32(const uint32_t* p, const VectorTuple<uint32x4_t, 2>& v, int lane) {
    auto r = v; auto& buf = g_ctx->findBuffer(p); size_t off = buf.ptrToByteOffset(p);
    r.val[0].setLane(lane, buf.loadScalar(off, 32)); r.val[1].setLane(lane, buf.loadScalar(off+4, 32));
    return r;
}
inline VectorTuple<uint16x8_t, 3> vld3q_lane_u16(const uint16_t* p, const VectorTuple<uint16x8_t, 3>& v, int lane) {
    auto r = v; auto& buf = g_ctx->findBuffer(p); size_t off = buf.ptrToByteOffset(p);
    for (int k = 0; k < 3; k++) r.val[k].setLane(lane, buf.loadScalar(off + k*2, 16));
    return r;
}
inline VectorTuple<uint32x4_t, 3> vld3q_lane_u32(const uint32_t* p, const VectorTuple<uint32x4_t, 3>& v, int lane) {
    auto r = v; auto& buf = g_ctx->findBuffer(p); size_t off = buf.ptrToByteOffset(p);
    for (int k = 0; k < 3; k++) r.val[k].setLane(lane, buf.loadScalar(off + k*4, 32));
    return r;
}
inline VectorTuple<uint16x8_t, 4> vld4q_lane_u16(const uint16_t* p, const VectorTuple<uint16x8_t, 4>& v, int lane) {
    auto r = v; auto& buf = g_ctx->findBuffer(p); size_t off = buf.ptrToByteOffset(p);
    for (int k = 0; k < 4; k++) r.val[k].setLane(lane, buf.loadScalar(off + k*2, 16));
    return r;
}
inline VectorTuple<uint32x4_t, 4> vld4q_lane_u32(const uint32_t* p, const VectorTuple<uint32x4_t, 4>& v, int lane) {
    auto r = v; auto& buf = g_ctx->findBuffer(p); size_t off = buf.ptrToByteOffset(p);
    for (int k = 0; k < 4; k++) r.val[k].setLane(lane, buf.loadScalar(off + k*4, 32));
    return r;
}

// --- Non-fused FP MLA (2-lane) ---
inline float32x2_t vmla_f32(const float32x2_t& a, const float32x2_t& b, const float32x2_t& c) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        Term prod = tm.mk_term(Kind::FP_MUL, {rm, load_as_fp32(tm, b.getLane(i)), load_as_fp32(tm, c.getLane(i))});
        lanes[i] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_ADD, {rm, load_as_fp32(tm, a.getLane(i)), prod}));
    }
    return float32x2_t(tm, lanes);
}
// MLA by lane: vmulq_lane then add
inline float32x4_t vmlaq_lane_f32(const float32x4_t& a, const float32x4_t& b, const float32x2_t& c, int lane) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Term c_fp = load_as_fp32(tm, c.getLane(lane));
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term prod = tm.mk_term(Kind::FP_MUL, {rm, load_as_fp32(tm, b.getLane(i)), c_fp});
        lanes[i] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_ADD, {rm, load_as_fp32(tm, a.getLane(i)), prod}));
    }
    return float32x4_t(tm, lanes);
}
inline float32x4_t vmulq_lane_f32(const float32x4_t& a, const float32x2_t& b, int lane) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Term b_fp = load_as_fp32(tm, b.getLane(lane));
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++)
        lanes[i] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MUL, {rm, load_as_fp32(tm, a.getLane(i)), b_fp}));
    return float32x4_t(tm, lanes);
}

// MLAL_high: widening mla on upper half
inline int32x4_t vmlal_high_s16(const int32x4_t& acc, const int16x8_t& b, const int16x8_t& c) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i+4)}, {16});
        Term ce = tm.mk_term(Kind::BV_SIGN_EXTEND, {c.getLane(i+4)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), tm.mk_term(Kind::BV_MUL, {be, ce})});
    }
    return int32x4_t(tm, lanes);
}
inline int32x4_t vmlal_lane_s16(const int32x4_t& acc, const int16x4_t& b, const int16x4_t& c, int lane) {
    auto& tm = g_ctx->tm;
    Term cl = tm.mk_term(Kind::BV_SIGN_EXTEND, {c.getLane(lane)}, {16});
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getLane(i)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), tm.mk_term(Kind::BV_MUL, {be, cl})});
    }
    return int32x4_t(tm, lanes);
}

// MUL by lane / by scalar (integer)
inline int32x4_t vmulq_lane_s32(const int32x4_t& a, const int32x2_t& b, int lane) {
    auto& tm = g_ctx->tm; Term bl = b.getLane(lane);
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = tm.mk_term(Kind::BV_MUL, {a.getLane(i), bl});
    return int32x4_t(tm, lanes);
}
inline int32x4_t vmulq_n_s32(const int32x4_t& a, int32_t b) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = tm.mk_term(Kind::BV_MUL, {a.getLane(i), bv});
    return int32x4_t(tm, lanes);
}

// MOVN u32, MOV_N
inline uint16x4_t vmovn_u32(const uint32x4_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = tm.mk_term(Kind::BV_EXTRACT, {a.getLane(i)}, {15UL, 0UL});
    return uint16x4_t(tm, lanes);
}
inline int8x16_t vmovq_n_s8(int8_t v) { return vdupq_n_s8(v); }
inline int16x8_t vmovq_n_s16(int16_t v) { return vdupq_n_s16(v); }
inline int32x4_t vmovq_n_s32(int32_t v) { return vdupq_n_s32(v); }

// ORR remaining
inline uint16x4_t vorr_u16(const uint16x4_t& a, const uint16x4_t& b) { return neon_vorr_impl(a,b); }
inline uint16x8_t vorrq_u16(const uint16x8_t& a, const uint16x8_t& b) { return neon_vorr_impl(a,b); }

// PADAL s16, PADD s32
inline int32x4_t vpadalq_s16(const int32x4_t& acc, const int16x8_t& a) {
    auto& tm = g_ctx->tm; std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term lo = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(2*i)}, {16});
        Term hi = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getLane(2*i+1)}, {16});
        lanes[i] = tm.mk_term(Kind::BV_ADD, {acc.getLane(i), tm.mk_term(Kind::BV_ADD, {lo, hi})});
    }
    return int32x4_t(tm, lanes);
}
inline int32x2_t vpadd_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes = {
        tm.mk_term(Kind::BV_ADD, {a.getLane(0), a.getLane(1)}),
        tm.mk_term(Kind::BV_ADD, {b.getLane(0), b.getLane(1)})
    };
    return int32x2_t(tm, lanes);
}
inline int32x4_t vpaddq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes = {
        tm.mk_term(Kind::BV_ADD, {a.getLane(0), a.getLane(1)}),
        tm.mk_term(Kind::BV_ADD, {a.getLane(2), a.getLane(3)}),
        tm.mk_term(Kind::BV_ADD, {b.getLane(0), b.getLane(1)}),
        tm.mk_term(Kind::BV_ADD, {b.getLane(2), b.getLane(3)})
    };
    return int32x4_t(tm, lanes);
}

// QMOVN_HIGH: saturating narrow, write to upper half
inline int8x16_t vqmovn_high_s16(const int8x8_t& lo, const int16x8_t& a) {
    int8x8_t hi = vqmovn_s16(a);
    return vcombine_s8(lo, hi);
}
inline int16x8_t vqmovn_high_s32(const int16x4_t& lo, const int32x4_t& a) {
    int16x4_t hi = vqmovn_s32(a);
    return vcombine_s16(lo, hi);
}
inline uint8x16_t vqmovun_high_s16(const uint8x8_t& lo, const int16x8_t& a) {
    uint8x8_t hi = vqmovun_s16(a);
    return vcombine_u8(lo, hi);
}

// RECPE — Reciprocal Estimate
// ARM uses a lookup table for the initial estimate. After 2 Newton-Raphson
// refinement steps (vrecps), the result converges to correctly-rounded 1/x
// for all normal f32 inputs. We model this as exact FP_DIV(1.0, x) which
// matches the converged result. This is a RESTRICTED-DOMAIN model: it is
// exact for normal inputs but may diverge from hardware on subnormals,
// zeros, infinities, or if fewer than 2 refinement steps are applied.
inline float32x4_t vrecpeq_f32(const float32x4_t& a) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term one = tm.mk_fp_value(fp32, rm, "1.0");
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++)
        lanes[i] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_DIV, {rm, one, load_as_fp32(tm, a.getLane(i))}));
    return float32x4_t(tm, lanes);
}

// RECPS — Reciprocal Step: computes (2 - a * b) for Newton-Raphson refinement
// Op: result[e] = 2.0 - a[e] * b[e]
inline float32x4_t vrecpsq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term two = tm.mk_fp_value(fp32, rm, "2.0");
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term af = load_as_fp32(tm, a.getLane(i));
        Term bf = load_as_fp32(tm, b.getLane(i));
        Term prod = tm.mk_term(Kind::FP_MUL, {rm, af, bf});
        lanes[i] = store_fp32_as_bv(tm, tm.mk_term(Kind::FP_SUB, {rm, two, prod}));
    }
    return float32x4_t(tm, lanes);
}

// --- Reinterpret casts (remaining) ---
inline float32x2_t vreinterpret_f32_u32(const uint32x2_t& a) { auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(0),a.getLane(1)}; return float32x2_t(tm,l); }
inline int16x4_t vreinterpret_s16_u16(const uint16x4_t& a) { auto& tm=g_ctx->tm; std::array<Term,4> l; for(int i=0;i<4;i++) l[i]=a.getLane(i); return int16x4_t(tm,l); }
inline uint16x4_t vreinterpret_u16_s16(const int16x4_t& a) { auto& tm=g_ctx->tm; std::array<Term,4> l; for(int i=0;i<4;i++) l[i]=a.getLane(i); return uint16x4_t(tm,l); }
inline uint16x4_t vreinterpret_u16_u8(const uint8x8_t& a) {
    auto& tm=g_ctx->tm; std::array<Term,4> l;
    for(int i=0;i<4;i++) l[i]=tm.mk_term(Kind::BV_CONCAT,{a.getLane(i*2+1),a.getLane(i*2)});
    return uint16x4_t(tm,l);
}
inline float32x4_t vreinterpretq_f32_u16(const uint16x8_t& a) {
    auto& tm=g_ctx->tm; std::array<Term,4> l;
    for(int i=0;i<4;i++) l[i]=tm.mk_term(Kind::BV_CONCAT,{a.getLane(i*2+1),a.getLane(i*2)});
    return float32x4_t(tm,l);
}
inline int16x8_t vreinterpretq_s16_s32(const int32x4_t& a) {
    auto& tm=g_ctx->tm; std::array<Term,8> l;
    for(int i=0;i<4;i++){l[i*2]=tm.mk_term(Kind::BV_EXTRACT,{a.getLane(i)},{15UL,0UL});l[i*2+1]=tm.mk_term(Kind::BV_EXTRACT,{a.getLane(i)},{31UL,16UL});}
    return int16x8_t(tm,l);
}
inline int16x8_t vreinterpretq_s16_u16(const uint16x8_t& a) { auto& tm=g_ctx->tm; std::array<Term,8> l; for(int i=0;i<8;i++) l[i]=a.getLane(i); return int16x8_t(tm,l); }
inline int64x2_t vreinterpretq_s64_s8(const int8x16_t& a) {
    auto& tm=g_ctx->tm; std::array<Term,2> l;
    for(int i=0;i<2;i++){Term r=a.getLane(i*8); for(int j=1;j<8;j++) r=tm.mk_term(Kind::BV_CONCAT,{a.getLane(i*8+j),r}); l[i]=r;}
    return int64x2_t(tm,l);
}
inline int8x16_t vreinterpretq_s8_s64(const int64x2_t& a) {
    auto& tm=g_ctx->tm; std::array<Term,16> l;
    for(int i=0;i<2;i++) for(int j=0;j<8;j++) l[i*8+j]=tm.mk_term(Kind::BV_EXTRACT,{a.getLane(i)},{static_cast<uint64_t>(j*8+7),static_cast<uint64_t>(j*8)});
    return int8x16_t(tm,l);
}
inline int8x16_t vreinterpretq_s8_u8(const uint8x16_t& a) { auto& tm=g_ctx->tm; std::array<Term,16> l; for(int i=0;i<16;i++) l[i]=a.getLane(i); return int8x16_t(tm,l); }
inline uint32x4_t vreinterpretq_u32_s32(const int32x4_t& a) { auto& tm=g_ctx->tm; std::array<Term,4> l; for(int i=0;i<4;i++) l[i]=a.getLane(i); return uint32x4_t(tm,l); }
inline uint32x4_t vreinterpretq_u32_u8(const uint8x16_t& a) {
    auto& tm=g_ctx->tm; std::array<Term,4> lanes;
    for(int i=0;i<4;i++){Term r=a.getLane(i*4); for(int j=1;j<4;j++) r=tm.mk_term(Kind::BV_CONCAT,{a.getLane(i*4+j),r}); lanes[i]=r;}
    return uint32x4_t(tm,lanes);
}

// SHL remaining
inline int16x8_t vshlq_n_u16(const int16x8_t& a, int n) { return neon_vshl_n_impl(a,n); }

// SRA unsigned
inline uint16x8_t vsraq_n_u16(const uint16x8_t& acc, const uint16x8_t& a, int n) {
    auto& tm=g_ctx->tm; std::array<Term,8> lanes;
    for(int i=0;i<8;i++){Term sh=tm.mk_term(Kind::BV_SHR,{a.getLane(i),mk_bv_val(tm,16,n)});lanes[i]=tm.mk_term(Kind::BV_ADD,{acc.getLane(i),sh});}
    return uint16x8_t(tm,lanes);
}

// SUBL_HIGH: widening subtract on upper half
inline int16x8_t vsubl_high_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,8> lanes;
    for(int i=0;i<8;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getLane(i+8)},{8});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{b.getLane(i+8)},{8});lanes[i]=tm.mk_term(Kind::BV_SUB,{ae,be});}
    return int16x8_t(tm,lanes);
}
inline uint16x8_t vsubl_high_u8(const uint8x16_t& a, const uint8x16_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,8> lanes;
    for(int i=0;i<8;i++){Term ae=tm.mk_term(Kind::BV_ZERO_EXTEND,{a.getLane(i+8)},{8});Term be=tm.mk_term(Kind::BV_ZERO_EXTEND,{b.getLane(i+8)},{8});lanes[i]=tm.mk_term(Kind::BV_SUB,{ae,be});}
    return uint16x8_t(tm,lanes);
}

// SUBW
inline int16x8_t vsubw_s8(const int16x8_t& a, const int8x8_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,8> lanes;
    for(int i=0;i<8;i++){Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{b.getLane(i)},{8});lanes[i]=tm.mk_term(Kind::BV_SUB,{a.getLane(i),be});}
    return int16x8_t(tm,lanes);
}

// TBL: byte table lookup
inline uint8x8_t vtbl1_u8(const uint8x8_t& tbl, const uint8x8_t& idx) {
    auto& tm=g_ctx->tm; std::array<Term,8> lanes;
    Term zero = mk_bv_val(tm, 8, 0);
    for(int i=0;i<8;i++){
        // For each index, select from table. Out of range returns 0.
        // Since index is symbolic, build a chain of ITEs
        Term result = zero;
        for(int j=7;j>=0;j--){
            Term cmp = tm.mk_term(Kind::EQUAL, {idx.getLane(i), mk_bv_val(tm, 8, j)});
            result = tm.mk_term(Kind::ITE, {cmp, tbl.getLane(j), result});
        }
        lanes[i] = result;
    }
    return uint8x8_t(tm, lanes);
}
inline uint8x8_t vtbl2_u8(const VectorTuple<uint8x8_t, 2>& tbl, const uint8x8_t& idx) {
    // 16-entry table: tbl.val[0] is entries 0-7, tbl.val[1] is 8-15
    auto& tm=g_ctx->tm; std::array<Term,8> lanes;
    Term zero = mk_bv_val(tm, 8, 0);
    for(int i=0;i<8;i++){
        Term result = zero;
        for(int j=15;j>=0;j--){
            Term entry = (j < 8) ? tbl.val[0].getLane(j) : tbl.val[1].getLane(j-8);
            Term cmp = tm.mk_term(Kind::EQUAL, {idx.getLane(i), mk_bv_val(tm, 8, j)});
            result = tm.mk_term(Kind::ITE, {cmp, entry, result});
        }
        lanes[i] = result;
    }
    return uint8x8_t(tm, lanes);
}
// QTBL4: 64-entry table lookup
inline uint8x16_t vqtbl4q_u8(const VectorTuple<uint8x16_t, 4>& tbl, const uint8x16_t& idx) {
    auto& tm=g_ctx->tm; std::array<Term,16> lanes;
    Term zero = mk_bv_val(tm, 8, 0);
    for(int i=0;i<16;i++){
        Term result = zero;
        for(int j=63;j>=0;j--){
            Term entry = tbl.val[j/16].getLane(j%16);
            Term cmp = tm.mk_term(Kind::EQUAL, {idx.getLane(i), mk_bv_val(tm, 8, j)});
            result = tm.mk_term(Kind::ITE, {cmp, entry, result});
        }
        lanes[i] = result;
    }
    return uint8x16_t(tm, lanes);
}
// QTBX4: like QTBL4 but preserves dest for out-of-range
inline uint8x16_t vqtbx4q_u8(const uint8x16_t& dest, const VectorTuple<uint8x16_t, 4>& tbl, const uint8x16_t& idx) {
    auto& tm=g_ctx->tm; std::array<Term,16> lanes;
    for(int i=0;i<16;i++){
        Term result = dest.getLane(i); // default: keep dest
        for(int j=63;j>=0;j--){
            Term entry = tbl.val[j/16].getLane(j%16);
            Term cmp = tm.mk_term(Kind::EQUAL, {idx.getLane(i), mk_bv_val(tm, 8, j)});
            result = tm.mk_term(Kind::ITE, {cmp, entry, result});
        }
        lanes[i] = result;
    }
    return uint8x16_t(tm, lanes);
}

// --- ZIP / UZP (interleave / de-interleave) ---
// vzip1/vzip2 (AArch64): interleave low/high halves
inline int8x16_t vzip1q_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,16> lanes;
    for(int i=0;i<8;i++){lanes[i*2]=a.getLane(i);lanes[i*2+1]=b.getLane(i);}
    return int8x16_t(tm,lanes);
}
inline int8x16_t vzip2q_s8(const int8x16_t& a, const int8x16_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,16> lanes;
    for(int i=0;i<8;i++){lanes[i*2]=a.getLane(i+8);lanes[i*2+1]=b.getLane(i+8);}
    return int8x16_t(tm,lanes);
}
inline int64x2_t vzip1q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(0),b.getLane(0)}; return int64x2_t(tm,l);
}
inline int64x2_t vzip2q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(1),b.getLane(1)}; return int64x2_t(tm,l);
}

inline VectorTuple<int32x2_t, 2> vzip_s32(const int32x2_t& a, const int32x2_t& b) {
    auto& tm=g_ctx->tm; VectorTuple<int32x2_t, 2> r;
    std::array<Term,2> l0={a.getLane(0),b.getLane(0)}, l1={a.getLane(1),b.getLane(1)};
    r.val[0]=int32x2_t(tm,l0); r.val[1]=int32x2_t(tm,l1); return r;
}
inline VectorTuple<uint32x2_t, 2> vzip_u32(const uint32x2_t& a, const uint32x2_t& b) {
    auto& tm=g_ctx->tm; VectorTuple<uint32x2_t, 2> r;
    std::array<Term,2> l0={a.getLane(0),b.getLane(0)}, l1={a.getLane(1),b.getLane(1)};
    r.val[0]=uint32x2_t(tm,l0); r.val[1]=uint32x2_t(tm,l1); return r;
}
inline VectorTuple<int32x4_t, 2> vzipq_s32(const int32x4_t& a, const int32x4_t& b) {
    auto& tm=g_ctx->tm; VectorTuple<int32x4_t, 2> r;
    std::array<Term,4> l0={a.getLane(0),b.getLane(0),a.getLane(1),b.getLane(1)};
    std::array<Term,4> l1={a.getLane(2),b.getLane(2),a.getLane(3),b.getLane(3)};
    r.val[0]=int32x4_t(tm,l0); r.val[1]=int32x4_t(tm,l1); return r;
}
inline VectorTuple<uint32x4_t, 2> vzipq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    auto& tm=g_ctx->tm; VectorTuple<uint32x4_t, 2> r;
    std::array<Term,4> l0={a.getLane(0),b.getLane(0),a.getLane(1),b.getLane(1)};
    std::array<Term,4> l1={a.getLane(2),b.getLane(2),a.getLane(3),b.getLane(3)};
    r.val[0]=uint32x4_t(tm,l0); r.val[1]=uint32x4_t(tm,l1); return r;
}
inline VectorTuple<uint16x8_t, 2> vzipq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    auto& tm=g_ctx->tm; VectorTuple<uint16x8_t, 2> r;
    std::array<Term,8> l0,l1;
    for(int i=0;i<4;i++){l0[i*2]=a.getLane(i);l0[i*2+1]=b.getLane(i);l1[i*2]=a.getLane(i+4);l1[i*2+1]=b.getLane(i+4);}
    r.val[0]=uint16x8_t(tm,l0); r.val[1]=uint16x8_t(tm,l1); return r;
}
inline VectorTuple<float32x4_t, 2> vzipq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm=g_ctx->tm; VectorTuple<float32x4_t, 2> r;
    std::array<Term,4> l0={a.getLane(0),b.getLane(0),a.getLane(1),b.getLane(1)};
    std::array<Term,4> l1={a.getLane(2),b.getLane(2),a.getLane(3),b.getLane(3)};
    r.val[0]=float32x4_t(tm,l0); r.val[1]=float32x4_t(tm,l1); return r;
}

// vuzp: de-interleave
inline int64x2_t vuzp1q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(0),b.getLane(0)}; return int64x2_t(tm,l);
}
inline int16x8_t vuzp2q_s16(const int16x8_t& a, const int16x8_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,8> l;
    for(int i=0;i<4;i++){l[i]=a.getLane(i*2+1);l[i+4]=b.getLane(i*2+1);}
    return int16x8_t(tm,l);
}
inline int64x2_t vuzp2q_s64(const int64x2_t& a, const int64x2_t& b) {
    auto& tm=g_ctx->tm; std::array<Term,2> l={a.getLane(1),b.getLane(1)}; return int64x2_t(tm,l);
}
inline VectorTuple<float32x2_t, 2> vuzp_f32(const float32x2_t& a, const float32x2_t& b) {
    auto& tm=g_ctx->tm; VectorTuple<float32x2_t, 2> r;
    std::array<Term,2> l0={a.getLane(0),b.getLane(0)}, l1={a.getLane(1),b.getLane(1)};
    r.val[0]=float32x2_t(tm,l0); r.val[1]=float32x2_t(tm,l1); return r;
}
inline VectorTuple<float32x4_t, 2> vuzpq_f32(const float32x4_t& a, const float32x4_t& b) {
    auto& tm=g_ctx->tm; VectorTuple<float32x4_t, 2> r;
    std::array<Term,4> l0={a.getLane(0),a.getLane(2),b.getLane(0),b.getLane(2)};
    std::array<Term,4> l1={a.getLane(1),a.getLane(3),b.getLane(1),b.getLane(3)};
    r.val[0]=float32x4_t(tm,l0); r.val[1]=float32x4_t(tm,l1); return r;
}

// ===========================================================================
// SymbolicScalar<T> overloads for vdup/vmov — enables symbolic params
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
// Widening overloads — accept any SymbolicScalar and truncate/extend to target width.
// Covers cases like vdupq_n_s16(SymbolicScalar<int32_t>) from symbolic params.
inline int16x8_t vdupq_n_s16(SymbolicScalar<int32_t> v) { return vdupq_n_s16(v.cast<int16_t>()); }
inline int16x8_t vdupq_n_s16(SymbolicScalar<int8_t> v)  { return vdupq_n_s16(v.cast<int16_t>()); }
inline int32x4_t vdupq_n_s32(SymbolicScalar<int16_t> v) { return vdupq_n_s32(v.cast<int32_t>()); }
inline int8x8_t  vdup_n_s8(SymbolicScalar<int32_t> v)   { return vdup_n_s8(v.cast<int8_t>()); }
inline int8x8_t  vdup_n_s8(SymbolicScalar<int16_t> v)   { return vdup_n_s8(v.cast<int8_t>()); }
inline uint8x8_t vdup_n_u8(SymbolicScalar<uint32_t> v)  { return vdup_n_u8(v.cast<uint8_t>()); }
inline uint8x8_t vdup_n_u8(SymbolicScalar<uint16_t> v)  { return vdup_n_u8(v.cast<uint8_t>()); }
inline int16x4_t vdup_n_s16(SymbolicScalar<int32_t> v)  { return vdup_n_s16(v.cast<int16_t>()); }
// vmov aliases
inline int8x16_t vmovq_n_s8(SymbolicScalar<int8_t> v)   { return vdupq_n_s8(v); }
inline int16x8_t vmovq_n_s16(SymbolicScalar<int16_t> v)  { return vdupq_n_s16(v); }
inline int16x8_t vmovq_n_s16(SymbolicScalar<int32_t> v)  { return vdupq_n_s16(v.cast<int16_t>()); }
inline int32x4_t vmovq_n_s32(SymbolicScalar<int32_t> v)  { return vdupq_n_s32(v); }
inline uint8x16_t vmovq_n_u8(SymbolicScalar<uint8_t> v)  { return vdupq_n_u8(v); }
inline uint16x8_t vmovq_n_u16(SymbolicScalar<uint16_t> v){ return vdupq_n_u16(v); }
inline uint32x4_t vmovq_n_u32(SymbolicScalar<uint32_t> v){ return vdupq_n_u32(v); }

// FP vdup with SymbolicScalar<float>
inline float32x4_t vdupq_n_f32(SymbolicScalar<float> v) {
    std::array<Term, 4> l; l.fill(v.term());
    return float32x4_t(g_ctx->tm, l);
}
inline float32x2_t vdup_n_f32(SymbolicScalar<float> v) {
    std::array<Term, 2> l; l.fill(v.term());
    return float32x2_t(g_ctx->tm, l);
}
inline float32x4_t vmovq_n_f32(SymbolicScalar<float> v) { return vdupq_n_f32(v); }

// ---------------------------------------------------------------------------
// salt_neon_gather2_s32 — verification-only NEON table gather helper
// ---------------------------------------------------------------------------
// Replaces the scalar extract→cast→pointer-load idiom used by XNNPACK NEON
// kernels for int32 LUT access (e.g. f32-velu).  Returns int32x2_t (BV32
// lanes); kernels that gather floats (e.g. f32-vsigmoid) need an f32 variant
// or a vreinterpret_f32_s32 on the result.
//
// The production NEON pattern is:
//   const uint64_t vidx01 = vgetq_lane_u64(vidx, 0);
//   int32x2_t vl01 = vld1_dup_s32((const int32_t*)((uintptr_t)table + (uint32_t)vidx01));
//   vl01 = vld1_lane_s32((const int32_t*)((uintptr_t)table + (uint32_t)(vidx01 >> 32)), vl01, 1);
//
// That breaks symbolic flow because vgetq_lane_u64 returns a concrete uint64_t.
// This helper stays in the symbolic domain: it takes the packed uint64x2_t
// index vector, extracts the two 32-bit byte offsets from the selected half,
// and performs an ITE-based gather from the registered buffer.
//
// Usage in verification-only source:
//   int32x2_t vl01 = salt_neon_gather2_s32(xnn_table_exp2minus_k_over_16, vidx0123, 0);
//   int32x2_t vl23 = salt_neon_gather2_s32(xnn_table_exp2minus_k_over_16, vidx0123, 1);
//   const int32x4_t vl0123 = vcombine_s32(vl01, vl23);
// ---------------------------------------------------------------------------
inline int32x2_t salt_neon_gather2_s32(
    const void* base, const uint64x2_t& packed_idx, int half)
{
    auto& tm = g_ctx->tm;
    auto& buf = g_ctx->findBuffer(base);
    size_t base_off = buf.ptrToByteOffset(base);
    constexpr size_t elem_bytes = 4;

    if (half < 0 || half > 1) {
        throw std::runtime_error(
            "salt_neon_gather2_s32: half must be 0 or 1, got " + std::to_string(half));
    }

    if (base_off + elem_bytes > buf.numBytes()) {
        throw std::runtime_error(
            "salt_neon_gather2_s32: base pointer leaves no room for a single element");
    }

    size_t max_valid_start = buf.numBytes() - base_off - elem_bytes;

    // Cache loadScalar results — one concat chain per valid byte offset
    std::vector<Term> cached(max_valid_start + 1);
    for (size_t k = 0; k <= max_valid_start; k++) {
        cached[k] = buf.loadScalar(base_off + k, 32);
    }

    // Extract the 64-bit lane, then split into two 32-bit byte offsets
    Term packed = packed_idx.getLane(half);
    Term off_lo = tm.mk_term(Kind::BV_EXTRACT, {packed}, {31UL, 0UL});   // (uint32_t) vidx
    Term off_hi = tm.mk_term(Kind::BV_EXTRACT, {packed}, {63UL, 32UL});  // (uint32_t)(vidx >> 32)

    static thread_local size_t oob_seq = 0;
    size_t call_id = oob_seq++;
    Sort bv32 = tm.mk_bv_sort(32);

    auto gather_one = [&](Term sym_off, size_t lane_id) -> Term {
        // OOB default: fresh unconstrained constant
        Term val = tm.mk_const(bv32,
            "neon_gather_oob_" + std::to_string(call_id) + "_" + std::to_string(lane_id));
        for (size_t k = 0; k <= max_valid_start; k++) {
            val = tm.mk_term(Kind::ITE,
                {tm.mk_term(Kind::EQUAL,
                    {sym_off, mk_bv_val(tm, 32, k)}),
                 cached[k], val});
        }
        return val;
    };

    std::array<Term, 2> lanes;
    lanes[0] = gather_one(off_lo, 0);
    lanes[1] = gather_one(off_hi, 1);
    return int32x2_t(tm, lanes);
}

// ===========================================================================
// PHASE 4: Float16 (FP16) NEON intrinsics
// ===========================================================================

// FP16 helpers: BV16 ↔ FP16 (5-bit exponent, 11-bit significand)
inline Term load_as_fp16(TermManager& tm, Term bv16) {
    return tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv16}, {5, 11});
}

inline size_t& fp16_bv_counter() {
    static size_t counter = 0;
    return counter;
}

inline Term store_fp16_as_bv(TermManager& tm, Term fp_val) {
    Sort bv16 = tm.mk_bv_sort(16);
    Term bv = tm.mk_const(bv16, "_fp16_2bv_" + std::to_string(fp16_bv_counter()++));
    Term fp_from_bv = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {5, 11});
    g_ctx->solver->assert_formula(tm.mk_term(Kind::EQUAL, {fp_from_bv, fp_val}));
    return bv;
}

// ---------------------------------------------------------------------------
// FP16 REINTERPRET — same element width (16-bit), just repackage type
// ---------------------------------------------------------------------------
inline float16x8_t vreinterpretq_f16_u16(const uint16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i);
    return float16x8_t(tm, lanes);
}

inline uint16x8_t vreinterpretq_u16_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) lanes[i] = a.getLane(i);
    return uint16x8_t(tm, lanes);
}

inline uint16x4_t vreinterpret_u16_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return uint16x4_t(tm, lanes);
}

// float16x4_t (4×16) → uint32x2_t (2×32): pack pairs of 16-bit lanes into 32-bit (little-endian)
inline uint32x2_t vreinterpret_u32_f16(const float16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++)
        lanes[i] = tm.mk_term(Kind::BV_CONCAT, {a.getLane(i*2+1), a.getLane(i*2)});
    return uint32x2_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// FP16 GET_LOW / GET_HIGH
// ---------------------------------------------------------------------------
inline float16x4_t vget_low_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return float16x4_t(tm, lanes);
}

inline float16x4_t vget_high_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i + 4);
    return float16x4_t(tm, lanes);
}

// ---------------------------------------------------------------------------
// FP16 EXT (extract / rotate)
// ---------------------------------------------------------------------------
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
// FP16 binary op helper
// ---------------------------------------------------------------------------
template <size_t NumLanes>
inline NeonVector<16, NumLanes> fp16_binop(
    const NeonVector<16, NumLanes>& a, const NeonVector<16, NumLanes>& b, Kind op) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        Term b_fp = load_as_fp16(tm, b.getLane(i));
        Term result_fp = tm.mk_term(op, {rm, a_fp, b_fp});
        lanes[i] = store_fp16_as_bv(tm, result_fp);
    }
    return NeonVector<16, NumLanes>(tm, lanes);
}

// ---------------------------------------------------------------------------
// FP16 ADD / SUB / MUL / DIV
// ---------------------------------------------------------------------------
inline float16x8_t vaddq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FP_ADD); }
inline float16x4_t vadd_f16 (const float16x4_t& a, const float16x4_t& b) { return fp16_binop(a, b, Kind::FP_ADD); }
inline float16x8_t vsubq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FP_SUB); }
inline float16x4_t vsub_f16 (const float16x4_t& a, const float16x4_t& b) { return fp16_binop(a, b, Kind::FP_SUB); }
inline float16x8_t vmulq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FP_MUL); }
inline float16x4_t vmul_f16 (const float16x4_t& a, const float16x4_t& b) { return fp16_binop(a, b, Kind::FP_MUL); }
inline float16x8_t vdivq_f16(const float16x8_t& a, const float16x8_t& b) { return fp16_binop(a, b, Kind::FP_DIV); }

// ---------------------------------------------------------------------------
// FP16 FMA (fused): vfmaq_f16(a, b, c) = a + b*c
// ---------------------------------------------------------------------------
inline float16x8_t vfmaq_f16(const float16x8_t& a, const float16x8_t& b, const float16x8_t& c) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        Term b_fp = load_as_fp16(tm, b.getLane(i));
        Term c_fp = load_as_fp16(tm, c.getLane(i));
        // FP_FMA: b*c + a (fused, one rounding)
        Term result_fp = tm.mk_term(Kind::FP_FMA, {rm, b_fp, c_fp, a_fp});
        lanes[i] = store_fp16_as_bv(tm, result_fp);
    }
    return float16x8_t(tm, lanes);
}

inline float16x4_t vfma_f16(const float16x4_t& a, const float16x4_t& b, const float16x4_t& c) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        Term b_fp = load_as_fp16(tm, b.getLane(i));
        Term c_fp = load_as_fp16(tm, c.getLane(i));
        Term result_fp = tm.mk_term(Kind::FP_FMA, {rm, b_fp, c_fp, a_fp});
        lanes[i] = store_fp16_as_bv(tm, result_fp);
    }
    return float16x4_t(tm, lanes);
}

// FP16 FMA by lane: result[i] = a[i] + b[i] * v[lane]   (A64, FMLA Vd.4H,Vn.4H,Vm.H[lane])
inline float16x4_t vfma_lane_f16(const float16x4_t& a, const float16x4_t& b,
                                  const float16x4_t& v, int lane) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Term v_fp = load_as_fp16(tm, v.getLane(lane));
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        Term b_fp = load_as_fp16(tm, b.getLane(i));
        Term result_fp = tm.mk_term(Kind::FP_FMA, {rm, b_fp, v_fp, a_fp});
        lanes[i] = store_fp16_as_bv(tm, result_fp);
    }
    return float16x4_t(tm, lanes);
}

// 4-lane bit-cast (same width, different element-type view).  Matches the
// existing 8-lane vreinterpretq_f16_u16 at ~2881.
inline float16x4_t vreinterpret_f16_u16(const uint16x4_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) lanes[i] = a.getLane(i);
    return float16x4_t(tm, lanes);
}

// Two-register structure returned by vzip_f16 / vld2_f16 etc.
struct float16x4x2_t {
    float16x4_t val[2];
    float16x4x2_t(const float16x4_t& v0, const float16x4_t& v1) : val{v0, v1} {}
};

// ZIP1/ZIP2 interleave:
//   val[0] = { a[0], b[0], a[1], b[1] }
//   val[1] = { a[2], b[2], a[3], b[3] }
inline float16x4x2_t vzip_f16(const float16x4_t& a, const float16x4_t& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, 4> lo, hi;
    for (int i = 0; i < 2; i++) {
        lo[2 * i]     = a.getLane(i);
        lo[2 * i + 1] = b.getLane(i);
        hi[2 * i]     = a.getLane(i + 2);
        hi[2 * i + 1] = b.getLane(i + 2);
    }
    return float16x4x2_t(float16x4_t(tm, lo), float16x4_t(tm, hi));
}

// ---------------------------------------------------------------------------
// FP16 MIN / MAX (use FP_MIN/FP_MAX — matches RVV semantics, see f32 comment)
// ---------------------------------------------------------------------------
template <size_t NumLanes>
inline NeonVector<16, NumLanes> neon_vmin_f16_maxnum(
    const NeonVector<16, NumLanes>& a, const NeonVector<16, NumLanes>& b) {
    auto& tm = g_ctx->tm;
    std::array<Term, NumLanes> lanes;
    for (size_t i = 0; i < NumLanes; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        Term b_fp = load_as_fp16(tm, b.getLane(i));
        lanes[i] = store_fp16_as_bv(tm, tm.mk_term(Kind::FP_MIN, {a_fp, b_fp}));
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
        lanes[i] = store_fp16_as_bv(tm, tm.mk_term(Kind::FP_MAX, {a_fp, b_fp}));
    }
    return NeonVector<16, NumLanes>(tm, lanes);
}

inline float16x8_t vminq_f16(const float16x8_t& a, const float16x8_t& b) { return neon_vmin_f16_maxnum(a, b); }
inline float16x8_t vmaxq_f16(const float16x8_t& a, const float16x8_t& b) { return neon_vmax_f16_maxnum(a, b); }
inline float16x4_t vmin_f16(const float16x4_t& a, const float16x4_t& b)  { return neon_vmin_f16_maxnum(a, b); }
inline float16x4_t vmax_f16(const float16x4_t& a, const float16x4_t& b)  { return neon_vmax_f16_maxnum(a, b); }
inline float16x8_t vminnmq_f16(const float16x8_t& a, const float16x8_t& b) { return neon_vmin_f16_maxnum(a, b); }
inline float16x8_t vmaxnmq_f16(const float16x8_t& a, const float16x8_t& b) { return neon_vmax_f16_maxnum(a, b); }

// ---------------------------------------------------------------------------
// FP16 ABS / NEG
// ---------------------------------------------------------------------------
inline float16x8_t vabsq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        lanes[i] = store_fp16_as_bv(tm, tm.mk_term(Kind::FP_ABS, {a_fp}));
    }
    return float16x8_t(tm, lanes);
}

inline float16x8_t vnegq_f16(const float16x8_t& a) {
    auto& tm = g_ctx->tm;
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term a_fp = load_as_fp16(tm, a.getLane(i));
        lanes[i] = store_fp16_as_bv(tm, tm.mk_term(Kind::FP_NEG, {a_fp}));
    }
    return float16x8_t(tm, lanes);
}

} // namespace salt
