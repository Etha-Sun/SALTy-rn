#ifndef NEON_SYMBOLIC_INTRINSICS_HPP
#define NEON_SYMBOLIC_INTRINSICS_HPP

#include "types.hpp"
#include "memory.hpp"
#include "../symbolic_common.hpp"
#include <climits>
#include <cstdint>
#include <cstring>
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
 * vdup_n_s8: Duplicate scalar to all lanes (int8x8)
 */
inline int8x8_t vdup_n_s8(int8_t value) {
    std::array<Term, 8> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(static_cast<uint8_t>(value)));
    for (int i = 0; i < 8; i++) {
        lanes[i] = val_term;
    }
    return int8x8_t(g_symbolic_tm, lanes);
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

/**
 * vmovq_n_s32: Move scalar to all lanes (int32x4) - alias for vdupq_n_s32
 */
inline int32x4_t vmovq_n_s32(int32_t value) {
    return vdupq_n_s32(value);
}

/**
 * vmovq_n_s16: Move scalar to all lanes (int16x8) - alias for vdupq_n_s16
 */
inline int16x8_t vmovq_n_s16(int16_t value) {
    return vdupq_n_s16(value);
}

/**
 * vdupq_n_u32: Duplicate scalar to all lanes (uint32x4)
 */
inline uint32x4_t vdupq_n_u32(uint32_t value) {
    std::array<Term, 4> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(value));
    for (int i = 0; i < 4; i++) {
        lanes[i] = val_term;
    }
    return uint32x4_t(g_symbolic_tm, lanes);
}

/**
 * vdupq_n_u16: Duplicate scalar to all lanes (uint16x8)
 */
inline uint16x8_t vdupq_n_u16(uint16_t value) {
    std::array<Term, 8> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(value));
    for (int i = 0; i < 8; i++) {
        lanes[i] = val_term;
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vmovq_n_u16: Move scalar to all lanes (uint16x8) - alias for vdupq_n_u16
 */
inline uint16x8_t vmovq_n_u16(uint16_t value) {
    return vdupq_n_u16(value);
}

// ============================================================================
// Pairwise Add and Accumulate Long Operations
// ============================================================================

/**
 * vpadalq_s8: Pairwise Add and Accumulate Long (int8 -> int16)
 * Takes pairs of adjacent int8 elements from input vector, adds them,
 * sign-extends the result to int16, and adds to the accumulator.
 * 
 * Semantics: acc[i] = acc[i] + sign_extend(input[2*i] + input[2*i+1])
 * For i in [0, 7]
 */
inline int16x8_t vpadalq_s8(const int16x8_t& acc, const int8x16_t& input) {
    std::array<Term, 8> result_lanes;
    
    for (int i = 0; i < 8; i++) {
        // Get pair of int8 elements
        Term a = input.getLane(2 * i);
        Term b = input.getLane(2 * i + 1);
        
        // Sign-extend each int8 to int16
        Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b});
        
        // Add the extended values
        Term pair_sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {a_ext, b_ext});
        
        // Add to accumulator
        result_lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getLane(i), pair_sum});
    }
    
    return int16x8_t(g_symbolic_tm, result_lanes);
}

/**
 * vpadalq_s16: Pairwise Add and Accumulate Long (int16 -> int32)
 * Takes pairs of adjacent int16 elements from input vector, adds them,
 * sign-extends the result to int32, and adds to the accumulator.
 * 
 * Semantics: acc[i] = acc[i] + sign_extend(input[2*i] + input[2*i+1])
 * For i in [0, 3]
 */
inline int32x4_t vpadalq_s16(const int32x4_t& acc, const int16x8_t& input) {
    std::array<Term, 4> result_lanes;
    
    for (int i = 0; i < 4; i++) {
        // Get pair of int16 elements
        Term a = input.getLane(2 * i);
        Term b = input.getLane(2 * i + 1);
        
        // Sign-extend each int16 to int32
        Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b});
        
        // Add the extended values
        Term pair_sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {a_ext, b_ext});
        
        // Add to accumulator
        result_lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getLane(i), pair_sum});
    }
    
    return int32x4_t(g_symbolic_tm, result_lanes);
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
 * vaddq_u32: Add two vectors element-wise (wrapping arithmetic, unsigned)
 * Semantics: result[i] = a[i] + b[i] (mod 2^32)
 */
inline uint32x4_t vaddq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    std::array<Term, 4> result_lanes;

    for (int i = 0; i < 4; i++) {
        result_lanes[i] = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_ADD,
            {a.getLane(i), b.getLane(i)}
        );
    }

    return uint32x4_t(g_symbolic_tm, result_lanes);
}

/**
 * vadd_u32: Add two vectors element-wise (uint32x2)
 * Semantics: result[i] = a[i] + b[i] (mod 2^32)
 */
inline uint32x2_t vadd_u32(const uint32x2_t& a, const uint32x2_t& b) {
    std::array<Term, 2> result_lanes;

    for (int i = 0; i < 2; i++) {
        result_lanes[i] = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_ADD,
            {a.getLane(i), b.getLane(i)}
        );
    }

    return uint32x2_t(g_symbolic_tm, result_lanes);
}

/**
 * vadd_s32: Add two vectors element-wise (int32x2)
 * Semantics: result[i] = a[i] + b[i] (mod 2^32)
 */
inline int32x2_t vadd_s32(const int32x2_t& a, const int32x2_t& b) {
    std::array<Term, 2> result_lanes;

    for (int i = 0; i < 2; i++) {
        result_lanes[i] = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_ADD,
            {a.getLane(i), b.getLane(i)}
        );
    }

    return int32x2_t(g_symbolic_tm, result_lanes);
}

/**
 * vpadd_s32: Pairwise add (int32x2)
 * result[0] = a[0] + a[1]
 * result[1] = b[0] + b[1]
 */
inline int32x2_t vpadd_s32(const int32x2_t& a, const int32x2_t& b) {
    std::array<Term, 2> result_lanes;
    
    result_lanes[0] = g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD,
        {a.getLane(0), a.getLane(1)}
    );
    
    result_lanes[1] = g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD,
        {b.getLane(0), b.getLane(1)}
    );

    return int32x2_t(g_symbolic_tm, result_lanes);
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

/**
 * vqsubq_s32: Saturating subtract (int32x4)
 * result[i] = saturate(a[i] - b[i]) to INT32_MIN..INT32_MAX
 */
inline int32x4_t vqsubq_s32(const int32x4_t& a, const int32x4_t& b) {
    std::array<Term, 4> lanes;
    // INT32_MIN and INT32_MAX as 64-bit for overflow detection
    Term min_i32_64 = g_symbolic_tm->mkBitVector(64, static_cast<uint64_t>(static_cast<int64_t>(INT32_MIN)));
    Term max_i32_64 = g_symbolic_tm->mkBitVector(64, static_cast<uint64_t>(static_cast<int64_t>(INT32_MAX)));
    Term min_i32_32 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(INT32_MIN)));
    Term max_i32_32 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(INT32_MAX)));
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {32});
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {31, 0});
    
    for (int i = 0; i < 4; i++) {
        // Sign-extend to 64 bits for overflow detection
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i)});
        // Subtract in 64-bit
        Term diff = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {a_ext, b_ext});
        // Saturate
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {diff, min_i32_64});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {diff, max_i32_64});
        // Extract lower 32 bits for the normal case
        Term result_normal = g_symbolic_tm->mkTerm(extract_op, {diff});
        // Select saturated or normal result
        Term result = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i32_32, result_normal});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i32_32, result});
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Lane Access Operations
// ============================================================================

/**
 * vgetq_lane_s32: Get a single lane from int32x4
 * Returns symbolic_int32_t to maintain symbolic tracking
 */
inline symbolic_int32_t vgetq_lane_s32(const int32x4_t& vec, int lane) {
    Term lane_term = vec.getLane(lane);
    return symbolic_int32_t(g_symbolic_tm, lane_term, 0, true);
}

/**
 * vget_lane_s32: Get a single lane from int32x2
 * Returns symbolic_int32_t to maintain symbolic tracking
 */
inline symbolic_int32_t vget_lane_s32(const int32x2_t& vec, int lane) {
    Term lane_term = vec.getLane(lane);
    return symbolic_int32_t(g_symbolic_tm, lane_term, 0, true);
}

/**
 * vgetq_lane_u32: Get a single lane from uint32x4
 * Returns symbolic_uint32_t to maintain symbolic tracking
 */
inline symbolic_uint32_t vgetq_lane_u32(const uint32x4_t& vec, int lane) {
    Term lane_term = vec.getLane(lane);
    return symbolic_uint32_t(g_symbolic_tm, lane_term, 0, true);
}

/**
 * vget_lane_u32: Get a single lane from uint32x2
 * Returns symbolic_uint32_t to maintain symbolic tracking
 */
inline symbolic_uint32_t vget_lane_u32(const uint32x2_t& vec, int lane) {
    Term lane_term = vec.getLane(lane);
    return symbolic_uint32_t(g_symbolic_tm, lane_term, 0, true);
}

// ============================================================================
// Reduction Operations
// ============================================================================

/**
 * vaddvq_s32: Add all lanes of vector (horizontal add/reduce)
 * Returns: a[0] + a[1] + a[2] + a[3]
 * Returns symbolic_int32_t that tracks both symbolic and concrete computation
 */
inline symbolic_int32_t vaddvq_s32(const int32x4_t& a) {
    // Add all lanes together symbolically
    Term sum = a.getLane(0);
    sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {sum, a.getLane(1)});
    sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {sum, a.getLane(2)});
    sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {sum, a.getLane(3)});
    
    // Store the symbolic result for later verification
    g_neon_scalar_results["vaddvq_s32"] = sum;
    
    return symbolic_int32_t(g_symbolic_tm, sum, 0, true);
}

// ============================================================================
// Arithmetic Operations (int8x16)
// ============================================================================

/**
 * vmulq_s8: Multiply two vectors element-wise (int8x16)
 * Semantics: result[i] = a[i] * b[i] (mod 2^8)
 */
inline int8x16_t vmulq_s8(const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 16> result_lanes;
    
    for (int i = 0; i < 16; i++) {
        result_lanes[i] = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_MULT,
            {a.getLane(i), b.getLane(i)}
        );
    }
    
    return int8x16_t(g_symbolic_tm, result_lanes);
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

/**
 * vqrdmulhq_s16: Saturating rounding doubling multiply returning high half (int16x8)
 * result[i] = sat_i16((a[i] * b[i] * 2 + (1 << 15)) >> 16)
 */
inline int16x8_t vqrdmulhq_s16(const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});
    
    Term min_i16_32 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(-32768)));
    Term max_i16_32 = g_symbolic_tm->mkBitVector(32, 32767);
    Term rounding = g_symbolic_tm->mkBitVector(32, 1 << 15);
    Term one = g_symbolic_tm->mkBitVector(32, 1);
    Term sixteen = g_symbolic_tm->mkBitVector(32, 16);
    
    for (int i = 0; i < 8; i++) {
        // Sign-extend both operands to 32 bits
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i)});
        
        // Multiply
        Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a_ext, b_ext});
        
        // Double the result
        Term doubled = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {prod, one});
        
        // Add rounding
        Term with_rounding = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {doubled, rounding});
        
        // Arithmetic shift right by 16
        Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, {with_rounding, sixteen});
        
        // Saturate
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {shifted, min_i16_32});
        shifted = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i16_32, shifted});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {shifted, max_i16_32});
        shifted = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i16_32, shifted});
        
        // Extract lower 16 bits
        lanes[i] = g_symbolic_tm->mkTerm(extract_op, {shifted});
    }
    
    return int16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Conversion/Widening Operations
// ============================================================================

/**
 * vaddw_s8: Widening add (int16 + sign_extend(int8) -> int16)
 * Adds int16x8 vector with int8x8 vector (widened to int16)
 * result[i] = wide[i] + sign_extend(narrow[i])
 */
inline int16x8_t vaddw_s8(const int16x8_t& wide, const int8x8_t& narrow) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    
    for (int i = 0; i < 8; i++) {
        // Sign-extend int8 to int16
        Term narrow_ext = g_symbolic_tm->mkTerm(extend_op, {narrow.getLane(i)});
        // Add to wide element
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {wide.getLane(i), narrow_ext});
    }
    
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vsubw_s8: Widening subtract (int16 - sign_extend(int8) -> int16)
 * Subtracts int8x8 vector (widened to int16) from int16x8 vector
 * result[i] = wide[i] - sign_extend(narrow[i])
 */
inline int16x8_t vsubw_s8(const int16x8_t& wide, const int8x8_t& narrow) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    
    for (int i = 0; i < 8; i++) {
        // Sign-extend int8 to int16
        Term narrow_ext = g_symbolic_tm->mkTerm(extend_op, {narrow.getLane(i)});
        // Subtract from wide element
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {wide.getLane(i), narrow_ext});
    }
    
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vaddw_s16: Widening add (int32 + sign_extend(int16) -> int32)
 * Adds int32x4 vector with int16x4 vector (widened to int32)
 * result[i] = wide[i] + sign_extend(narrow[i])
 */
inline int32x4_t vaddw_s16(const int32x4_t& wide, const int16x4_t& narrow) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

    for (int i = 0; i < 4; i++) {
        // Sign-extend int16 to int32
        Term narrow_ext = g_symbolic_tm->mkTerm(extend_op, {narrow.getLane(i)});
        // Add to wide element
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {wide.getLane(i), narrow_ext});
    }

    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vaddw_u8: Widening add (uint16 + zero_extend(uint8) -> uint16)
 * Adds uint16x8 vector with uint8x8 vector (widened to uint16)
 * result[i] = wide[i] + zero_extend(narrow[i])
 */
inline uint16x8_t vaddw_u8(const uint16x8_t& wide, const uint8x8_t& narrow) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8});

    for (int i = 0; i < 8; i++) {
        // Zero-extend uint8 to uint16
        Term narrow_ext = g_symbolic_tm->mkTerm(extend_op, {narrow.getLane(i)});
        // Add to wide element
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {wide.getLane(i), narrow_ext});
    }

    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vaddw_u16: Widening add (uint32 + zero_extend(uint16) -> uint32)
 * Adds uint32x4 vector with uint16x4 vector (widened to uint32)
 * result[i] = wide[i] + zero_extend(narrow[i])
 */
inline uint32x4_t vaddw_u16(const uint32x4_t& wide, const uint16x4_t& narrow) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {16});

    for (int i = 0; i < 4; i++) {
        // Zero-extend uint16 to uint32
        Term narrow_ext = g_symbolic_tm->mkTerm(extend_op, {narrow.getLane(i)});
        // Add to wide element
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {wide.getLane(i), narrow_ext});
    }

    return uint32x4_t(g_symbolic_tm, lanes);
}

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

/**
 * vmovl_u8: Widening move (uint8 -> uint16)
 * Zero-extends each 8-bit element to 16-bit
 */
inline uint16x8_t vmovl_u8(const uint8x8_t& vec) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8});
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(extend_op, {vec.getLane(i)});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
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

/**
 * vqmovn_high_s32: Saturating narrow int32x4 -> int16x4, combine with existing low half
 * Returns int16x8 where low half is 'low' and high half is saturated narrow of 'high'
 */
inline int16x8_t vqmovn_high_s32(const int16x4_t& low, const int32x4_t& high) {
    std::array<Term, 8> lanes;
    Term min_i16 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(-32768)));
    Term max_i16 = g_symbolic_tm->mkBitVector(32, 32767);
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

    // Copy low half
    for (int i = 0; i < 4; i++) {
        lanes[i] = low.getLane(i);
    }
    
    // Saturating narrow high half
    for (int i = 0; i < 4; i++) {
        Term clamped = high.getLane(i);
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {clamped, min_i16});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i16, clamped});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {clamped, max_i16});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i16, clamped});
        lanes[i + 4] = g_symbolic_tm->mkTerm(extract_op, {clamped});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vqmovn_high_s16: Saturating narrow int16x8 -> int8x8, combine with existing low half
 * Returns int8x16 where low half is 'low' and high half is saturated narrow of 'high'
 */
inline int8x16_t vqmovn_high_s16(const int8x8_t& low, const int16x8_t& high) {
    std::array<Term, 16> lanes;
    Term min_i8 = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(static_cast<uint16_t>(-128)));
    Term max_i8 = g_symbolic_tm->mkBitVector(16, 127);
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

    // Copy low half
    for (int i = 0; i < 8; i++) {
        lanes[i] = low.getLane(i);
    }
    
    // Saturating narrow high half
    for (int i = 0; i < 8; i++) {
        Term clamped = high.getLane(i);
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {clamped, min_i8});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i8, clamped});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {clamped, max_i8});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i8, clamped});
        lanes[i + 8] = g_symbolic_tm->mkTerm(extract_op, {clamped});
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vqmovun_high_s16: Saturating narrow int16x8 -> uint8x8 (unsigned), combine with existing low half
 * Returns uint8x16 where low half is 'low' and high half is saturated unsigned narrow of 'high'
 * Clamps signed int16 values to [0, 255] and narrows to uint8
 */
inline uint8x16_t vqmovun_high_s16(const uint8x8_t& low, const int16x8_t& high) {
    std::array<Term, 16> lanes;
    Term zero_i16 = g_symbolic_tm->mkBitVector(16, 0);
    Term max_u8 = g_symbolic_tm->mkBitVector(16, 255);
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

    // Copy low half
    for (int i = 0; i < 8; i++) {
        lanes[i] = low.getLane(i);
    }

    // Saturating unsigned narrow high half
    for (int i = 0; i < 8; i++) {
        Term clamped = high.getLane(i);
        // Clamp to [0, 255] using signed comparison
        Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {clamped, zero_i16});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, zero_i16, clamped});
        Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {clamped, max_u8});
        clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_u8, clamped});
        // Extract lower 8 bits
        lanes[i + 8] = g_symbolic_tm->mkTerm(extract_op, {clamped});
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Shift Operations
// ============================================================================

/**
 * vshlq_n_s16: Shift left by immediate (int16x8)
 * result[i] = vec[i] << n
 */
inline int16x8_t vshlq_n_s16(const int16x8_t& vec, int n) {
    std::array<Term, 8> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(n));
    
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {vec.getLane(i), shift_amount});
    }
    
    return int16x8_t(g_symbolic_tm, lanes);
}

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

/**
 * vcltq_s16: Compare less than (int16x8)
 * result[i] = (a[i] < b[i]) ? 0xFFFF : 0x0000
 */
inline uint16x8_t vcltq_s16(const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 8> lanes;
    Term all_ones = g_symbolic_tm->mkBitVector(16, 0xFFFF);
    Term all_zeros = g_symbolic_tm->mkBitVector(16, 0x0000);
    
    for (int i = 0; i < 8; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, all_ones, all_zeros});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Bitwise Select Operations
// ============================================================================

/**
 * vbslq_s16: Bitwise select (int16x8)
 * For each bit: if mask bit is 1, select from a; else select from b
 * result[i] = (mask[i] & a[i]) | (~mask[i] & b[i])
 */
inline int16x8_t vbslq_s16(const uint16x8_t& mask, const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 8> lanes;
    
    for (int i = 0; i < 8; i++) {
        Term m = mask.getLane(i);
        Term and_a = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {m, a.getLane(i)});
        Term not_m = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {m});
        Term and_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {not_m, b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {and_a, and_b});
    }
    
    return int16x8_t(g_symbolic_tm, lanes);
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
 * vget_high_s8: Get high half of int8x16
 */
inline int8x8_t vget_high_s8(const int8x16_t& vec) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = vec.getLane(i + 8);
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
 * vget_low_u16: Get low half of uint16x8
 */
inline uint16x4_t vget_low_u16(const uint16x8_t& vec) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

/**
 * vget_high_u16: Get high half of uint16x8
 */
inline uint16x4_t vget_high_u16(const uint16x8_t& vec) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i + 4);
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

/**
 * vget_low_u32: Get low half of uint32x4
 */
inline uint32x2_t vget_low_u32(const uint32x4_t& vec) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = vec.getLane(i);
    }
    return uint32x2_t(g_symbolic_tm, lanes);
}

/**
 * vget_high_u32: Get high half of uint32x4
 */
inline uint32x2_t vget_high_u32(const uint32x4_t& vec) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = vec.getLane(i + 2);
    }
    return uint32x2_t(g_symbolic_tm, lanes);
}

/**
 * vget_low_s32: Get low half of int32x4
 */
inline int32x2_t vget_low_s32(const int32x4_t& vec) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = vec.getLane(i);
    }
    return int32x2_t(g_symbolic_tm, lanes);
}

/**
 * vget_high_s32: Get high half of int32x4
 */
inline int32x2_t vget_high_s32(const int32x4_t& vec) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = vec.getLane(i + 2);
    }
    return int32x2_t(g_symbolic_tm, lanes);
}

/**
 * vget_low_f32: Get low half of float32x4
 */
inline float32x2_t vget_low_f32(const float32x4_t& vec) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = vec.getLane(i);
    }
    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vget_high_f32: Get high half of float32x4
 */
inline float32x2_t vget_high_f32(const float32x4_t& vec) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = vec.getLane(i + 2);
    }
    return float32x2_t(g_symbolic_tm, lanes);
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
 * vextq_s32: Extract (rotate/shift) int32x4
 * Concatenates a and b, extracts 4 elements starting at index n
 */
inline int32x4_t vextq_s32(const int32x4_t& a, const int32x4_t& b, int n) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int src_idx = i + n;
        if (src_idx < 4) {
            lanes[i] = a.getLane(src_idx);
        } else {
            lanes[i] = b.getLane(src_idx - 4);
        }
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vextq_u32: Extract (rotate/shift) uint32x4
 * Concatenates a and b, extracts 4 elements starting at index n
 */
inline uint32x4_t vextq_u32(const uint32x4_t& a, const uint32x4_t& b, int n) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int src_idx = i + n;
        if (src_idx < 4) {
            lanes[i] = a.getLane(src_idx);
        } else {
            lanes[i] = b.getLane(src_idx - 4);
        }
    }
    return uint32x4_t(g_symbolic_tm, lanes);
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

/**
 * vreinterpretq_s32_f32: Reinterpret float32x4_t as int32x4_t
 * Converts floating-point bit representation to signed integer interpretation
 */
inline int32x4_t vreinterpretq_s32_f32(const float32x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 4> lanes;
    Sort bv32 = tm->mkBitVectorSort(32);
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    
    static int reinterpret_counter = 0;
    
    for (int i = 0; i < 4; i++) {
        // Create a fresh bitvector that represents the IEEE bits
        Term bv_lane = tm->mkConst(bv32, "fp_to_bv_" + std::to_string(reinterpret_counter++) + "_" + std::to_string(i));
        
        // Convert this BV back to FP
        Term fp_from_bv = tm->mkTerm(to_fp_op, {bv_lane});
        
        // Assert equality: the FP from BV must equal original FP (bit-level equality)
        Term eq = tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getLane(i)});
        g_symbolic_solver->assertFormula(eq);
        
        lanes[i] = bv_lane;
    }
    return int32x4_t(tm, lanes);
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

// ============================================================================
// Floating-Point Duplicate/Constant Operations
// ============================================================================

/**
 * vld1q_dup_u16: Load and duplicate a single uint16 to all lanes (uint16x8)
 * Loads from memory and replicates across all 8 lanes
 */
inline uint16x8_t vld1q_dup_u16(const uint16_t* ptr) {
    std::array<Term, 8> lanes;
    // In symbolic execution, we create a symbolic constant for the loaded value
    Term val_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(*ptr));
    for (int i = 0; i < 8; i++) {
        lanes[i] = val_term;
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vdupq_n_f32: Duplicate scalar float to all lanes (float32x4)
 */
inline float32x4_t vdupq_n_f32(float value) {
    std::array<Term, 4> lanes;
    // Convert float to its IEEE 754 bit representation
    uint32_t bits;
    std::memcpy(&bits, &value, sizeof(float));
    Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    Term val_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});
    for (int i = 0; i < 4; i++) {
        lanes[i] = val_term;
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Widening Multiply Operations
// ============================================================================

/**
 * vmull_s16: Widening multiply (int16x4 * int16x4 -> int32x4)
 * result[i] = sign_extend(a[i]) * sign_extend(b[i])
 */
inline int32x4_t vmull_s16(const int16x4_t& a, const int16x4_t& b) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

    for (int i = 0; i < 4; i++) {
        // Sign-extend both operands from 16 to 32 bits
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i)});
        // Multiply
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a_ext, b_ext});
    }

    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmlal_s16: Widening multiply-accumulate (int32 + int16 * int16 -> int32)
 * result[i] = acc[i] + sign_extend(a[i]) * sign_extend(b[i])
 */
inline int32x4_t vmlal_s16(const int32x4_t& acc, const int16x4_t& a, const int16x4_t& b) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

    for (int i = 0; i < 4; i++) {
        // Sign-extend both operands from 16 to 32 bits
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i)});
        // Multiply
        Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a_ext, b_ext});
        // Accumulate
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getLane(i), prod});
    }

    return int32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Floating-Point Conversion Operations
// ============================================================================

/**
 * vcvtq_f32_s32: Convert signed int32x4 to float32x4
 * result[i] = (float)vec[i]
 */
inline float32x4_t vcvtq_f32_s32(const int32x4_t& vec) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {8, 24});
    
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(to_fp_op, {rm, vec.getLane(i)});
    }
    
    return float32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Floating-Point Arithmetic Operations
// ============================================================================

/**
 * vmulq_f32: Multiply two vectors element-wise (float32x4)
 * result[i] = a[i] * b[i]
 */
inline float32x4_t vmulq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
    }
    
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vaddq_f32: Add two vectors element-wise (float32x4)
 * result[i] = a[i] + b[i]
 */
inline float32x4_t vaddq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getLane(i), b.getLane(i)});
    }

    return float32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Float16 (Half-Precision) Conversion Operations
// ============================================================================

/**
 * vcvtq_f16_s16: Convert signed int16x8 to float16x8
 * result[i] = (float16)vec[i]
 */
inline float16x8_t vcvtq_f16_s16(const int16x8_t& vec) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {5, 11});  // IEEE 754 half precision

    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(to_fp_op, {rm, vec.getLane(i)});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Float16 (Half-Precision) Arithmetic Operations
// ============================================================================

/**
 * vmulq_f16: Multiply two vectors element-wise (float16x8)
 * result[i] = a[i] * b[i]
 */
inline float16x8_t vmulq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Float16 (Half-Precision) Reinterpret Operations
// ============================================================================

/**
 * vreinterpretq_u16_f16: Reinterpret float16x8_t as uint16x8_t
 * Converts floating-point bit representation to unsigned integer interpretation
 */
inline uint16x8_t vreinterpretq_u16_f16(const float16x8_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 8> lanes;
    Sort bv16 = tm->mkBitVectorSort(16);
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    static int reinterpret_f16_counter = 0;

    for (int i = 0; i < 8; i++) {
        // Create a fresh bitvector that represents the IEEE bits
        Term bv_lane = tm->mkConst(bv16, "fp16_to_bv_" + std::to_string(reinterpret_f16_counter++) + "_" + std::to_string(i));

        // Convert this BV back to FP16
        Term fp_from_bv = tm->mkTerm(to_fp_op, {bv_lane});

        // Assert equality: the FP from BV must equal original FP (bit-level equality)
        Term eq = tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getLane(i)});
        g_symbolic_solver->assertFormula(eq);

        lanes[i] = bv_lane;
    }
    return uint16x8_t(tm, lanes);
}

/**
 * vreinterpretq_f16_u16: Reinterpret uint16x8_t as float16x8_t
 * Converts unsigned integer bit representation to floating-point interpretation
 */
inline float16x8_t vreinterpretq_f16_u16(const uint16x8_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 8> lanes;
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    for (int i = 0; i < 8; i++) {
        // Convert bitvector to FP16 using IEEE bit interpretation
        lanes[i] = tm->mkTerm(to_fp_op, {vec.getLane(i)});
    }
    return float16x8_t(tm, lanes);
}

/**
 * vreinterpret_u16_f16: Reinterpret float16x4_t as uint16x4_t
 * Converts floating-point bit representation to unsigned integer interpretation
 */
inline uint16x4_t vreinterpret_u16_f16(const float16x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 4> lanes;
    Sort bv16 = tm->mkBitVectorSort(16);
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    static int reinterpret_f16x4_counter = 0;

    for (int i = 0; i < 4; i++) {
        // Create a fresh bitvector that represents the IEEE bits
        Term bv_lane = tm->mkConst(bv16, "fp16x4_to_bv_" + std::to_string(reinterpret_f16x4_counter++) + "_" + std::to_string(i));

        // Convert this BV back to FP16
        Term fp_from_bv = tm->mkTerm(to_fp_op, {bv_lane});

        // Assert equality: the FP from BV must equal original FP (bit-level equality)
        Term eq = tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getLane(i)});
        g_symbolic_solver->assertFormula(eq);

        lanes[i] = bv_lane;
    }
    return uint16x4_t(tm, lanes);
}

// ============================================================================
// Float16 (Half-Precision) Extract Operations
// ============================================================================

/**
 * vget_low_f16: Get low half of float16x8_t
 * Returns the lower 4 lanes as float16x4_t
 */
inline float16x4_t vget_low_f16(const float16x8_t& vec) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);
    }
    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vget_high_f16: Get high half of float16x8_t
 * Returns the upper 4 lanes as float16x4_t
 */
inline float16x4_t vget_high_f16(const float16x8_t& vec) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i + 4);
    }
    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vext_f16: Extract vector from pair of vectors (float16x4_t)
 * Concatenates a and b, then extracts 4 elements starting at index n
 */
inline float16x4_t vext_f16(const float16x4_t& a, const float16x4_t& b, int n) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int src_idx = i + n;
        if (src_idx < 4) {
            lanes[i] = a.getLane(src_idx);
        } else {
            lanes[i] = b.getLane(src_idx - 4);
        }
    }
    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpret_u32_f16: Reinterpret float16x4_t as uint32x2_t
 * Combines pairs of float16 lanes into uint32 lanes
 */
inline uint32x2_t vreinterpret_u32_f16(const float16x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    Sort bv16 = tm->mkBitVectorSort(16);
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    static int reinterpret_f16_u32_counter = 0;

    // First convert each float16 lane to a bitvector
    std::array<Term, 4> bv_lanes;
    for (int i = 0; i < 4; i++) {
        Term bv_lane = tm->mkConst(bv16, "fp16_to_u32_bv_" + std::to_string(reinterpret_f16_u32_counter++) + "_" + std::to_string(i));
        Term fp_from_bv = tm->mkTerm(to_fp_op, {bv_lane});
        Term eq = tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getLane(i)});
        g_symbolic_solver->assertFormula(eq);
        bv_lanes[i] = bv_lane;
    }

    // Combine pairs of 16-bit values into 32-bit values
    std::array<Term, 2> result_lanes;
    for (int i = 0; i < 2; i++) {
        Term low = bv_lanes[i * 2];
        Term high = bv_lanes[i * 2 + 1];
        // Zero-extend both to 32 bits
        Term low_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {16}), {low});
        Term high_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {16}), {high});
        // Shift high part left by 16 bits
        Term high_shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {high_ext, tm->mkBitVector(32, 16)});
        // OR them together
        result_lanes[i] = tm->mkTerm(Kind::BITVECTOR_OR, {low_ext, high_shifted});
    }

    return uint32x2_t(tm, result_lanes);
}

// ============================================================================
// Signed 8-bit Bilinear Interpolation Intrinsics
// ============================================================================

/**
 * vld1q_dup_s16: Load and duplicate int16 to all lanes (int16x8)
 * Loads a single int16 from memory and replicates across all 8 lanes
 */
inline int16x8_t vld1q_dup_s16(const int16_t* ptr) {
    std::array<Term, 8> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(static_cast<uint16_t>(*ptr)));
    for (int i = 0; i < 8; i++) {
        lanes[i] = val_term;
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vld1_dup_s16: Load and duplicate int16 to all lanes (int16x4)
 * Loads a single int16 from memory and replicates across all 4 lanes
 */
inline int16x4_t vld1_dup_s16(const int16_t* ptr) {
    std::array<Term, 4> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(static_cast<uint16_t>(*ptr)));
    for (int i = 0; i < 4; i++) {
        lanes[i] = val_term;
    }
    return int16x4_t(g_symbolic_tm, lanes);
}

/**
 * vmovl_s8: Widening move (int8 -> int16)
 * Sign-extends each 8-bit element to 16-bit
 */
inline int16x8_t vmovl_s8(const int8x8_t& vec) {
    std::array<Term, 8> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(extend_op, {vec.getLane(i)});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vsubq_s16: Subtract two int16x8 vectors element-wise
 * result[i] = a[i] - b[i]
 */
inline int16x8_t vsubq_s16(const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {a.getLane(i), b.getLane(i)});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vshll_n_s16: Shift left long by immediate (int16 -> int32)
 * Sign-extends int16x4 to int32x4, then shifts left by n bits
 * result[i] = sign_extend(vec[i]) << n
 */
inline int32x4_t vshll_n_s16(const int16x4_t& vec, int n) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    Term shift_amount = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(n));

    for (int i = 0; i < 4; i++) {
        Term extended = g_symbolic_tm->mkTerm(extend_op, {vec.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {extended, shift_amount});
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vshlq_n_s32: Shift left by immediate (int32x4)
 * result[i] = vec[i] << n
 */
inline int32x4_t vshlq_n_s32(const int32x4_t& vec, int n) {
    std::array<Term, 4> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(n));

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {vec.getLane(i), shift_amount});
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmlal_high_s16: Widening multiply-accumulate high half (ARM64)
 * Takes high half of int16x8 vectors, multiplies, and accumulates to int32x4
 * result[i] = acc[i] + sign_extend(a[i+4]) * sign_extend(b[i+4])
 */
inline int32x4_t vmlal_high_s16(const int32x4_t& acc, const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

    for (int i = 0; i < 4; i++) {
        // Use high half (lanes 4-7)
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i + 4)});
        Term b_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(i + 4)});
        Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a_ext, b_ext});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getLane(i), prod});
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vuzp2q_s16: Unzip second elements from two int16x8 vectors (ARM64)
 * Takes odd-indexed elements from each vector
 * result = {a[1], a[3], a[5], a[7], b[1], b[3], b[5], b[7]}
 */
inline int16x8_t vuzp2q_s16(const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 8> lanes;
    // Take odd elements from a
    lanes[0] = a.getLane(1);
    lanes[1] = a.getLane(3);
    lanes[2] = a.getLane(5);
    lanes[3] = a.getLane(7);
    // Take odd elements from b
    lanes[4] = b.getLane(1);
    lanes[5] = b.getLane(3);
    lanes[6] = b.getLane(5);
    lanes[7] = b.getLane(7);
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vshrn_n_s32: Shift right narrow (int32 -> int16)
 * Shifts right by n bits, then narrows to int16
 * result[i] = (int16_t)(vec[i] >> n)
 */
inline int16x4_t vshrn_n_s32(const int32x4_t& vec, int n) {
    std::array<Term, 4> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(n));
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

    for (int i = 0; i < 4; i++) {
        Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, {vec.getLane(i), shift_amount});
        lanes[i] = g_symbolic_tm->mkTerm(extract_op, {shifted});
    }
    return int16x4_t(g_symbolic_tm, lanes);
}

/**
 * vrshrn_n_s16: Rounding shift right narrow (int16 -> int8)
 * Adds rounding constant before shifting, then narrows to int8
 * result[i] = (int8_t)((vec[i] + (1 << (n-1))) >> n)
 */
inline int8x8_t vrshrn_n_s16(const int16x8_t& vec, int n) {
    std::array<Term, 8> lanes;
    Term rounding = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(1 << (n - 1)));
    Term shift_amount = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(n));
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

    for (int i = 0; i < 8; i++) {
        Term with_rounding = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {vec.getLane(i), rounding});
        Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, {with_rounding, shift_amount});
        lanes[i] = g_symbolic_tm->mkTerm(extract_op, {shifted});
    }
    return int8x8_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_s16_s32: Reinterpret int32x4_t as int16x8_t
 * Treats each int32 as two int16 values (little-endian)
 */
inline int16x8_t vreinterpretq_s16_s32(const int32x4_t& vec) {
    std::array<Term, 8> lanes;
    Op extract_low = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});
    Op extract_high = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {31, 16});

    for (int i = 0; i < 4; i++) {
        lanes[i * 2] = g_symbolic_tm->mkTerm(extract_low, {vec.getLane(i)});
        lanes[i * 2 + 1] = g_symbolic_tm->mkTerm(extract_high, {vec.getLane(i)});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Duplicate/Move Operations (uint32)
// ============================================================================

/**
 * vmovq_n_u32: Move scalar to all lanes (uint32x4) - alias for vdupq_n_u32
 */
inline uint32x4_t vmovq_n_u32(uint32_t value) {
    return vdupq_n_u32(value);
}

/**
 * vmov_n_u32: Move scalar to all lanes (uint32x2) - alias for vdup_n_u32
 */
inline uint32x2_t vmov_n_u32(uint32_t value) {
    std::array<Term, 2> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(value));
    for (int i = 0; i < 2; i++) {
        lanes[i] = val_term;
    }
    return uint32x2_t(g_symbolic_tm, lanes);
}

/**
 * vdup_n_u32: Duplicate scalar to all lanes (uint32x2)
 */
inline uint32x2_t vdup_n_u32(uint32_t value) {
    return vmov_n_u32(value);
}

// ============================================================================
// Zip Operations
// ============================================================================

/**
 * vzipq_u32: Interleave elements of two uint32x4 vectors
 *
 * Given:
 *   a = [a0, a1, a2, a3]
 *   b = [b0, b1, b2, b3]
 *
 * Returns:
 *   result.val[0] = [a0, b0, a1, b1]
 *   result.val[1] = [a2, b2, a3, b3]
 */
inline uint32x4x2_t vzipq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    uint32x4x2_t result;

    // First result vector: interleave low halves
    std::array<Term, 4> lanes0;
    lanes0[0] = a.getLane(0);
    lanes0[1] = b.getLane(0);
    lanes0[2] = a.getLane(1);
    lanes0[3] = b.getLane(1);
    result.val[0] = uint32x4_t(g_symbolic_tm, lanes0);

    // Second result vector: interleave high halves
    std::array<Term, 4> lanes1;
    lanes1[0] = a.getLane(2);
    lanes1[1] = b.getLane(2);
    lanes1[2] = a.getLane(3);
    lanes1[3] = b.getLane(3);
    result.val[1] = uint32x4_t(g_symbolic_tm, lanes1);

    return result;
}

/**
 * vzip_u32: Interleave elements of two uint32x2 vectors
 *
 * Given:
 *   a = [a0, a1]
 *   b = [b0, b1]
 *
 * Returns:
 *   result.val[0] = [a0, b0]
 *   result.val[1] = [a1, b1]
 */
inline uint32x2x2_t vzip_u32(const uint32x2_t& a, const uint32x2_t& b) {
    uint32x2x2_t result;

    // First result vector
    std::array<Term, 2> lanes0;
    lanes0[0] = a.getLane(0);
    lanes0[1] = b.getLane(0);
    result.val[0] = uint32x2_t(g_symbolic_tm, lanes0);

    // Second result vector
    std::array<Term, 2> lanes1;
    lanes1[0] = a.getLane(1);
    lanes1[1] = b.getLane(1);
    result.val[1] = uint32x2_t(g_symbolic_tm, lanes1);

    return result;
}

/**
 * vzipq_s32: Interleave elements of two int32x4 vectors
 *
 * Given:
 *   a = [a0, a1, a2, a3]
 *   b = [b0, b1, b2, b3]
 *
 * Returns:
 *   result.val[0] = [a0, b0, a1, b1]
 *   result.val[1] = [a2, b2, a3, b3]
 */
inline int32x4x2_t vzipq_s32(const int32x4_t& a, const int32x4_t& b) {
    int32x4x2_t result;

    // First result vector: interleave low halves
    std::array<Term, 4> lanes0;
    lanes0[0] = a.getLane(0);
    lanes0[1] = b.getLane(0);
    lanes0[2] = a.getLane(1);
    lanes0[3] = b.getLane(1);
    result.val[0] = int32x4_t(g_symbolic_tm, lanes0);

    // Second result vector: interleave high halves
    std::array<Term, 4> lanes1;
    lanes1[0] = a.getLane(2);
    lanes1[1] = b.getLane(2);
    lanes1[2] = a.getLane(3);
    lanes1[3] = b.getLane(3);
    result.val[1] = int32x4_t(g_symbolic_tm, lanes1);

    return result;
}

/**
 * vzip_s32: Interleave elements of two int32x2 vectors
 *
 * Given:
 *   a = [a0, a1]
 *   b = [b0, b1]
 *
 * Returns:
 *   result.val[0] = [a0, b0]
 *   result.val[1] = [a1, b1]
 */
inline int32x2x2_t vzip_s32(const int32x2_t& a, const int32x2_t& b) {
    int32x2x2_t result;

    // First result vector
    std::array<Term, 2> lanes0;
    lanes0[0] = a.getLane(0);
    lanes0[1] = b.getLane(0);
    result.val[0] = int32x2_t(g_symbolic_tm, lanes0);

    // Second result vector
    std::array<Term, 2> lanes1;
    lanes1[0] = a.getLane(1);
    lanes1[1] = b.getLane(1);
    result.val[1] = int32x2_t(g_symbolic_tm, lanes1);

    return result;
}

#endif
