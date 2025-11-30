#ifndef NEON_SYMBOLIC_INTRINSICS_HPP
#define NEON_SYMBOLIC_INTRINSICS_HPP

#include "types.hpp"
#include "memory.hpp"
#include "../symbolic_common.hpp"
#include <cstdint>
#include <string>

/**
 * NEON Intrinsic Symbolic Implementations
 */

// ============================================================================
// Duplicate/Constant Operations
// ============================================================================

/**
 * vdupq_n_s8: Duplicate scalar to all lanes (int8x16)
 */
inline int8x16_t vdupq_n_s8(int8_t value) {
    std::array<Term, 16> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(static_cast<uint8_t>(value)));
    for (int i = 0; i < 16; i++) {
        lanes[i] = val_term;
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vdupq_n_s16: Duplicate scalar to all lanes (int16x8)
 */
inline int16x8_t vdupq_n_s16(int16_t value) {
    std::array<Term, 8> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(static_cast<uint16_t>(value)));
    for (int i = 0; i < 8; i++) {
        lanes[i] = val_term;
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vdupq_n_s32: Duplicate scalar to all lanes (int32x4)
 */
inline int32x4_t vdupq_n_s32(int32_t value) {
    std::array<Term, 4> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(value)));
    for (int i = 0; i < 4; i++) {
        lanes[i] = val_term;
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vdup_n_u8: Duplicate scalar to all lanes (uint8x8)
 */
inline uint8x8_t vdup_n_u8(uint8_t value) {
    std::array<Term, 8> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(value));
    for (int i = 0; i < 8; i++) {
        lanes[i] = val_term;
    }
    return uint8x8_t(g_symbolic_tm, lanes);
}

/**
 * vdupq_n_u8: Duplicate scalar to all lanes (uint8x16)
 */
inline uint8x16_t vdupq_n_u8(uint8_t value) {
    std::array<Term, 16> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(value));
    for (int i = 0; i < 16; i++) {
        lanes[i] = val_term;
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Arithmetic Operations (int32x4)
// ============================================================================

/**
 * vaddq_s32: Add two vectors element-wise (wrapping arithmetic)
 * Semantics: result[i] = a[i] + b[i] (mod 2^32)
 */
inline int32x4_t vaddq_s32(const int32x4_t& a, const int32x4_t& b) {
    std::array<Term, 4> result_lanes;

    for (int i = 0; i < 4; i++) {
        result_lanes[i] = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_ADD,
            {a.getLane(i), b.getLane(i)}
        );
    }

    return int32x4_t(g_symbolic_tm, result_lanes);
}

/**
 * vmulq_n_s32: Multiply vector by scalar (wrapping arithmetic)
 * Semantics: result[i] = vec[i] * scalar (mod 2^32)
 */
inline int32x4_t vmulq_n_s32(const int32x4_t& vec, int32_t scalar) {
    std::array<Term, 4> result_lanes;

    uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
    Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

    for (int i = 0; i < 4; i++) {
        result_lanes[i] = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_MULT,
            {vec.getLane(i), scalar_term}
        );
    }

    return int32x4_t(g_symbolic_tm, result_lanes);
}

/**
 * vmulq_s32: Multiply two vectors element-wise
 */
inline int32x4_t vmulq_s32(const int32x4_t& a, const int32x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a.getLane(i), b.getLane(i)});
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmlaq_s32: Multiply-accumulate
 * Semantics: result[i] = acc[i] + a[i] * b[i]
 */
inline int32x4_t vmlaq_s32(const int32x4_t& acc, const int32x4_t& a, const int32x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getLane(i), prod});
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Arithmetic Operations (int16x8)
// ============================================================================

/**
 * vqaddq_s16: Saturating add int16
 */
inline int16x8_t vqaddq_s16(const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 8> lanes;
    Term min_i16 = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(-32768));
    Term max_i16 = g_symbolic_tm->mkBitVector(16, 32767);

    for (int i = 0; i < 8; i++) {
        // Widen to 17 bits for overflow detection (simplified: just clamp)
        Term sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {a.getLane(i), b.getLane(i)});
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {sum, min_i16});
        sum = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i16, sum});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {sum, max_i16});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i16, sum});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Conversion/Widening Operations
// ============================================================================

/**
 * vsubl_s8: Widening subtract (int8 -> int16)
 */
inline int16x8_t vsubl_s8(const int8x8_t& a, const int8x8_t& b) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    for (int i = 0; i < 8; i++) {
        // Sign-extend to 16 bits, then subtract
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {a_ext, b_ext});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vsubl_u8: Widening subtract (uint8 -> uint16)
 */
inline uint16x8_t vsubl_u8(const uint8x8_t& a, const uint8x8_t& b) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8});
    for (int i = 0; i < 8; i++) {
        // Zero-extend to 16 bits, then subtract
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {a_ext, b_ext});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vsubl_high_s8: Widening subtract high half (int8 -> int16)
 */
inline int16x8_t vsubl_high_s8(const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    for (int i = 0; i < 8; i++) {
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i + 8)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i + 8)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {a_ext, b_ext});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vsubl_high_u8: Widening subtract high half (uint8 -> uint16)
 */
inline uint16x8_t vsubl_high_u8(const uint8x16_t& a, const uint8x16_t& b) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8});
    for (int i = 0; i < 8; i++) {
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i + 8)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i + 8)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {a_ext, b_ext});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vmovl_s16: Widening move (int16 -> int32)
 */
inline int32x4_t vmovl_s16(const int16x4_t& vec) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(extend_op, {vec.getLane(i)});
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Narrowing Operations
// ============================================================================

/**
 * vqmovn_s32: Saturating narrow int32 -> int16
 */
inline int16x4_t vqmovn_s32(const int32x4_t& vec) {
    std::array<Term, 4> lanes;
    Term min_i16 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(-32768));
    Term max_i16 = g_symbolic_tm->mkBitVector(32, 32767);
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

    for (int i = 0; i < 4; i++) {
        // Clamp to int16 range
        Term clamped = vec.getLane(i);
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {clamped, min_i16});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i16, clamped});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {clamped, max_i16});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i16, clamped});
        // Extract lower 16 bits
        lanes[i] = g_symbolic_tm->mkTerm(extract_op, {clamped});
    }
    return int16x4_t(g_symbolic_tm, lanes);
}

/**
 * vqmovn_s16: Saturating narrow int16 -> int8
 */
inline int8x8_t vqmovn_s16(const int16x8_t& vec) {
    std::array<Term, 8> lanes;
    Term min_i8 = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(-128));
    Term max_i8 = g_symbolic_tm->mkBitVector(16, 127);
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

    for (int i = 0; i < 8; i++) {
        Term clamped = vec.getLane(i);
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {clamped, min_i8});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i8, clamped});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {clamped, max_i8});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i8, clamped});
        lanes[i] = g_symbolic_tm->mkTerm(extract_op, {clamped});
    }
    return int8x8_t(g_symbolic_tm, lanes);
}

/**
 * vqmovun_s16: Saturating narrow int16 -> uint8 (unsigned)
 * Clamps signed int16 values to [0, 255] and narrows to uint8
 */
inline uint8x8_t vqmovun_s16(const int16x8_t& vec) {
    std::array<Term, 8> lanes;
    Term zero_i16 = g_symbolic_tm->mkBitVector(16, 0);
    Term max_u8 = g_symbolic_tm->mkBitVector(16, 255);
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

    for (int i = 0; i < 8; i++) {
        Term clamped = vec.getLane(i);
        // Clamp to [0, 255] using signed comparison
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {clamped, zero_i16});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, zero_i16, clamped});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {clamped, max_u8});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_u8, clamped});
        // Extract lower 8 bits
        lanes[i] = g_symbolic_tm->mkTerm(extract_op, {clamped});
    }
    return uint8x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Shift Operations
// ============================================================================

/**
 * vrshlq_s32: Rounding shift left (negative = shift right)
 */
inline int32x4_t vrshlq_s32(const int32x4_t& vec, const int32x4_t& shift_vec) {
    std::array<Term, 4> lanes;

    Term shift_term = shift_vec.getLane(0);
    Term abs_shift = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NEG, {shift_term});

    Term one = g_symbolic_tm->mkBitVector(32, 1);
    Term shift_minus_one = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {abs_shift, one});
    Term rounding = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {one, shift_minus_one});
    
    for (int i = 0; i < 4; i++) {
        Term with_rounding = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {vec.getLane(i), rounding});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, {with_rounding, abs_shift});
    }
    
    return int32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Comparison Operations
// ============================================================================

/**
 * vmaxq_s8: Maximum of two vectors (int8x16)
 */
inline int8x16_t vmaxq_s8(const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vminq_s8: Minimum of two vectors (int8x16)
 */
inline int8x16_t vminq_s8(const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vmax_s8: Maximum of two vectors (int8x8)
 */
inline int8x8_t vmax_s8(const int8x8_t& a, const int8x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return int8x8_t(g_symbolic_tm, lanes);
}

/**
 * vmin_s8: Minimum of two vectors (int8x8)
 */
inline int8x8_t vmin_s8(const int8x8_t& a, const int8x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return int8x8_t(g_symbolic_tm, lanes);
}

/**
 * vmax_u8: Maximum of two vectors (uint8x8)
 */
inline uint8x8_t vmax_u8(const uint8x8_t& a, const uint8x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return uint8x8_t(g_symbolic_tm, lanes);
}

/**
 * vmin_u8: Minimum of two vectors (uint8x8)
 */
inline uint8x8_t vmin_u8(const uint8x8_t& a, const uint8x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ULT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return uint8x8_t(g_symbolic_tm, lanes);
}

/**
 * vmaxq_u8: Maximum of two vectors (uint8x16)
 */
inline uint8x16_t vmaxq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

/**
 * vminq_u8: Minimum of two vectors (uint8x16)
 */
inline uint8x16_t vminq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ULT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Extract/Combine Operations
// ============================================================================

/**
 * vget_low_s8: Get low half of int8x16
 */
inline int8x8_t vget_low_s8(const int8x16_t& vec) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = vec.getLane(i);
    }
    return int8x8_t(g_symbolic_tm, lanes);
}

/**
 * vget_low_u8: Get low half of uint8x16
 */
inline uint8x8_t vget_low_u8(const uint8x16_t& vec) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = vec.getLane(i);
    }
    return uint8x8_t(g_symbolic_tm, lanes);
}

/**
 * vget_high_u8: Get high half of uint8x16
 */
inline uint8x8_t vget_high_u8(const uint8x16_t& vec) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = vec.getLane(i + 8);
    }
    return uint8x8_t(g_symbolic_tm, lanes);
}

/**
 * vget_low_s16: Get low half of int16x8
 */
inline int16x4_t vget_low_s16(const int16x8_t& vec) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);
    }
    return int16x4_t(g_symbolic_tm, lanes);
}

/**
 * vget_high_s16: Get high half of int16x8
 */
inline int16x4_t vget_high_s16(const int16x8_t& vec) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i + 4);
    }
    return int16x4_t(g_symbolic_tm, lanes);
}

/**
 * vcombine_s16: Combine two int16x4 into int16x8
 */
inline int16x8_t vcombine_s16(const int16x4_t& low, const int16x4_t& high) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = low.getLane(i);
        lanes[i + 4] = high.getLane(i);
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vcombine_s8: Combine two int8x8 into int8x16
 */
inline int8x16_t vcombine_s8(const int8x8_t& low, const int8x8_t& high) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = low.getLane(i);
        lanes[i + 8] = high.getLane(i);
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vcombine_u8: Combine two uint8x8 into uint8x16
 */
inline uint8x16_t vcombine_u8(const uint8x8_t& low, const uint8x8_t& high) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = low.getLane(i);
        lanes[i + 8] = high.getLane(i);
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

/**
 * vext_s8: Extract (shift right)
 */
inline int8x8_t vext_s8(const int8x8_t& a, const int8x8_t& b, int n) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        int src_idx = (i + n) % 16;  // Conceptually concatenate a and b
        if (src_idx < 8) {
            lanes[i] = a.getLane(src_idx);
        } else {
            lanes[i] = b.getLane(src_idx - 8);
        }
    }
    return int8x8_t(g_symbolic_tm, lanes);
}

/**
 * vext_u8: Extract (shift right) for uint8x8_t
 */
inline uint8x8_t vext_u8(const uint8x8_t& a, const uint8x8_t& b, int n) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        int src_idx = (i + n) % 16;  // Conceptually concatenate a and b
        if (src_idx < 8) {
            lanes[i] = a.getLane(src_idx);
        } else {
            lanes[i] = b.getLane(src_idx - 8);
        }
    }
    return uint8x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Reinterpret Operations
// ============================================================================

/**
 * vreinterpret_u32_s8: Reinterpret int8x8_t as uint32x2_t
 * Combines bytes 0-3 into uint32_t[0], bytes 4-7 into uint32_t[1]
 */
inline uint32x2_t vreinterpret_u32_s8(const int8x8_t& vec) {
    TermManager* tm = vec.getTermManager();
    // Combine bytes 0-3 into first uint32_t
    // bytes 0-3: vec[0] (low 8 bits), vec[1] (next 8 bits), vec[2], vec[3]
    Term u32_0 = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {vec.getLane(0)});
    for (int i = 1; i < 4; i++) {
        Term byte_i = vec.getLane(i);
        // Zero-extend byte_i to 32 bits, shift left, then OR
        Term byte_i_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {byte_i});
        Term shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {byte_i_ext, tm->mkBitVector(32, i * 8)});
        u32_0 = tm->mkTerm(Kind::BITVECTOR_OR, {u32_0, shifted});
    }
    
    // Combine bytes 4-7 into second uint32_t
    Term u32_1 = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {vec.getLane(4)});
    for (int i = 5; i < 8; i++) {
        Term byte_i = vec.getLane(i);
        Term byte_i_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {byte_i});
        Term shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {byte_i_ext, tm->mkBitVector(32, (i - 4) * 8)});
        u32_1 = tm->mkTerm(Kind::BITVECTOR_OR, {u32_1, shifted});
    }
    
    return uint32x2_t(tm, {u32_0, u32_1});
}

/**
 * vreinterpret_u16_s8: Reinterpret int8x8_t as uint16x4_t
 */
inline uint16x4_t vreinterpret_u16_s8(const int8x8_t& vec) {
    TermManager* tm = vec.getTermManager();
    // Combine pairs of bytes into uint16_t
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term byte0 = vec.getLane(i * 2);
        Term byte1 = vec.getLane(i * 2 + 1);
        Term byte0_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8}), {byte0});
        Term byte1_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8}), {byte1});
        Term shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {byte1_ext, tm->mkBitVector(16, 8)});
        lanes[i] = tm->mkTerm(Kind::BITVECTOR_OR, {byte0_ext, shifted});
    }
    return uint16x4_t(tm, lanes);
}

/**
 * vreinterpret_u32_u8: Reinterpret uint8x8_t as uint32x2_t
 * Combines bytes 0-3 into uint32_t[0], bytes 4-7 into uint32_t[1]
 */
inline uint32x2_t vreinterpret_u32_u8(const uint8x8_t& vec) {
    TermManager* tm = vec.getTermManager();
    // Combine bytes 0-3 into first uint32_t
    Term u32_0 = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {vec.getLane(0)});
    for (int i = 1; i < 4; i++) {
        Term byte_i = vec.getLane(i);
        Term byte_i_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {byte_i});
        Term shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {byte_i_ext, tm->mkBitVector(32, i * 8)});
        u32_0 = tm->mkTerm(Kind::BITVECTOR_OR, {u32_0, shifted});
    }
    
    // Combine bytes 4-7 into second uint32_t
    Term u32_1 = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {vec.getLane(4)});
    for (int i = 5; i < 8; i++) {
        Term byte_i = vec.getLane(i);
        Term byte_i_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {byte_i});
        Term shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {byte_i_ext, tm->mkBitVector(32, (i - 4) * 8)});
        u32_1 = tm->mkTerm(Kind::BITVECTOR_OR, {u32_1, shifted});
    }
    
    return uint32x2_t(tm, {u32_0, u32_1});
}

/**
 * vreinterpret_u16_u8: Reinterpret uint8x8_t as uint16x4_t
 */
inline uint16x4_t vreinterpret_u16_u8(const uint8x8_t& vec) {
    TermManager* tm = vec.getTermManager();
    // Combine pairs of bytes into uint16_t
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term byte0 = vec.getLane(i * 2);
        Term byte1 = vec.getLane(i * 2 + 1);
        Term byte0_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8}), {byte0});
        Term byte1_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8}), {byte1});
        Term shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {byte1_ext, tm->mkBitVector(16, 8)});
        lanes[i] = tm->mkTerm(Kind::BITVECTOR_OR, {byte0_ext, shifted});
    }
    return uint16x4_t(tm, lanes);
}

/**
 * vreinterpretq_s16_u16: Reinterpret uint16x8_t as int16x8_t
 * No-op conversion - just treats the bits as signed instead of unsigned
 */
inline int16x8_t vreinterpretq_s16_u16(const uint16x8_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = vec.getLane(i);
    }
    return int16x8_t(tm, lanes);
}

// ============================================================================
// Helper Functions
// ============================================================================

// Helper to convert a term to the expected bit-width
inline Term convertToWidth(Term term, size_t target_width) {
    size_t current_width = term.getSort().getBitVectorSize();
    if (current_width == target_width) {
        return term;
    } else if (current_width < target_width) {
        // Sign-extend to target width
        size_t extend_bits = target_width - current_width;
        Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {static_cast<uint32_t>(extend_bits)});
        return g_symbolic_tm->mkTerm(sext_op, {term});
        } else {
        // Extract lower bits to target width
        Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {static_cast<uint32_t>(target_width - 1), 0});
        return g_symbolic_tm->mkTerm(extract_op, {term});
    }
}

#endif
