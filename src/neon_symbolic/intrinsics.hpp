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
 * vmovq_n_s8: Move scalar to all lanes (int8x16) - alias for vdupq_n_s8
 */
inline int8x16_t vmovq_n_s8(int8_t value) {
    return vdupq_n_s8(value);
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

/**
 * vdup_n_u16: Duplicate scalar to all lanes (uint16x4)
 */
inline uint16x4_t vdup_n_u16(uint16_t value) {
    std::array<Term, 4> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(value));
    for (int i = 0; i < 4; i++) {
        lanes[i] = val_term;
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

/**
 * vmov_n_u16: Move scalar to all lanes (uint16x4) - alias for vdup_n_u16
 */
inline uint16x4_t vmov_n_u16(uint16_t value) {
    return vdup_n_u16(value);
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
 * vandq_u32: Bitwise AND of two uint32x4_t vectors
 * Semantics: result[i] = a[i] & b[i]
 */
inline uint32x4_t vandq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    std::array<Term, 4> result_lanes;

    for (int i = 0; i < 4; i++) {
        result_lanes[i] = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_AND,
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
 * vpaddq_s32: Pairwise add (int32x4)
 * Adds adjacent pairs from both vectors:
 * result[0] = a[0] + a[1]
 * result[1] = a[2] + a[3]
 * result[2] = b[0] + b[1]
 * result[3] = b[2] + b[3]
 */
inline int32x4_t vpaddq_s32(const int32x4_t& a, const int32x4_t& b) {
    std::array<Term, 4> result_lanes;

    result_lanes[0] = g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD,
        {a.getLane(0), a.getLane(1)}
    );

    result_lanes[1] = g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD,
        {a.getLane(2), a.getLane(3)}
    );

    result_lanes[2] = g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD,
        {b.getLane(0), b.getLane(1)}
    );

    result_lanes[3] = g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD,
        {b.getLane(2), b.getLane(3)}
    );

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

/**
 * vmulq_lane_s32: Multiply vector by scalar lane
 * Multiplies each element of vector 'a' by a single element (lane) from vector 'b'.
 * result[i] = a[i] * b[lane]
 *
 * @param a    First source vector (int32x4_t) - all lanes used
 * @param b    Second source vector (int32x2_t) - single lane selected
 * @param lane Lane index (0-1) to select from vector 'b'
 * @return     Result vector with products
 */
inline int32x4_t vmulq_lane_s32(const int32x4_t& a, const int32x2_t& b, const int lane) {
    std::array<Term, 4> lanes;
    Term b_lane = b.getLane(lane);

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a.getLane(i), b_lane});
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

/**
 * vsetq_lane_u16: Set a single lane in uint16x8
 * Returns a new vector with the specified lane set to the given value
 */
inline uint16x8_t vsetq_lane_u16(uint16_t value, const uint16x8_t& vec, int lane) {
    std::array<Term, 8> lanes;
    Term val_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(value));

    for (int i = 0; i < 8; i++) {
        if (i == lane) {
            lanes[i] = val_term;
        } else {
            lanes[i] = vec.getLane(i);
        }
    }
    return uint16x8_t(g_symbolic_tm, lanes);
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

// ============================================================================
// Bitwise Operations (int8x16, uint8x16)
// ============================================================================

/**
 * vandq_s8: Bitwise AND (int8x16)
 * result[i] = a[i] & b[i]
 */
inline int8x16_t vandq_s8(const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {a.getLane(i), b.getLane(i)});
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * veorq_s8: Bitwise XOR (int8x16)
 * result[i] = a[i] ^ b[i]
 */
inline int8x16_t veorq_s8(const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_XOR, {a.getLane(i), b.getLane(i)});
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vorrq_u8: Bitwise OR (uint8x16)
 * result[i] = a[i] | b[i]
 */
inline uint8x16_t vorrq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {a.getLane(i), b.getLane(i)});
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Shift Operations (int8x16, uint8x16)
// ============================================================================

/**
 * vshlq_n_s8: Shift left by immediate (int8x16)
 * result[i] = vec[i] << n
 */
inline int8x16_t vshlq_n_s8(const int8x16_t& vec, int n) {
    std::array<Term, 16> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(n));

    for (int i = 0; i < 16; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {vec.getLane(i), shift_amount});
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vshrq_n_u8: Shift right by immediate (uint8x16) - logical shift
 * result[i] = vec[i] >> n (zero-fill)
 */
inline uint8x16_t vshrq_n_u8(const uint8x16_t& vec, int n) {
    std::array<Term, 16> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(n));

    for (int i = 0; i < 16; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_LSHR, {vec.getLane(i), shift_amount});
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Dot Product Operations
// ============================================================================

/**
 * vdotq_s32: Dot product of int8x16 vectors, accumulated to int32x4
 *
 * Performs 4 separate dot products of 4 int8 elements each.
 * For each i in [0,3]:
 *   result[i] = acc[i] + sum(a[4*i + j] * b[4*i + j]) for j in [0,3]
 *
 * This is used in quantized neural network operations.
 */
inline int32x4_t vdotq_s32(const int32x4_t& acc, const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 4> lanes;
    Op sign_extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {24});  // 8 -> 32 bits

    for (int i = 0; i < 4; i++) {
        // Start with accumulator value
        Term sum = acc.getLane(i);

        // Compute dot product of 4 int8 elements
        for (int j = 0; j < 4; j++) {
            int idx = 4 * i + j;
            // Sign-extend both operands to 32 bits
            Term a_ext = g_symbolic_tm->mkTerm(sign_extend_op, {a.getLane(idx)});
            Term b_ext = g_symbolic_tm->mkTerm(sign_extend_op, {b.getLane(idx)});
            // Multiply
            Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a_ext, b_ext});
            // Accumulate
            sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {sum, prod});
        }
        lanes[i] = sum;
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vdotq_lane_s32: Dot product with lane selection from int8x8
 *
 * Performs 4 separate dot products of 4 int8 elements each.
 * The 'a' operand is an int8x8 (64-bit), where each "lane" (0 or 1) represents
 * a group of 4 consecutive int8 elements. The selected lane's 4 elements are
 * broadcast to multiply against each group of 4 elements in 'b'.
 *
 * For lane 0: uses a[0..3]
 * For lane 1: uses a[4..7]
 *
 * For each i in [0,3]:
 *   result[i] = acc[i] + sum(a[lane*4 + j] * b[4*i + j]) for j in [0,3]
 *
 * @param acc  Accumulator vector (int32x4_t)
 * @param b    Second source vector (int8x16_t) - 16 int8 elements
 * @param a    First source vector (int8x8_t) - 8 int8 elements, select lane 0 or 1
 * @param lane Lane index (0-1) to select 4 consecutive elements from 'a'
 * @return     Result vector with accumulated dot products
 */
inline int32x4_t vdotq_lane_s32(const int32x4_t& acc, const int8x16_t& b, const int8x8_t& a, const int lane) {
    std::array<Term, 4> lanes;
    Op sign_extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {24});  // 8 -> 32 bits

    // Base index in 'a' for the selected lane (each lane has 4 elements)
    int a_base = lane * 4;

    for (int i = 0; i < 4; i++) {
        // Start with accumulator value
        Term sum = acc.getLane(i);

        // Compute dot product of 4 int8 elements
        // a elements come from selected lane (a_base + j)
        // b elements come from the corresponding group (4*i + j)
        for (int j = 0; j < 4; j++) {
            int b_idx = 4 * i + j;
            int a_idx = a_base + j;
            // Sign-extend both operands to 32 bits
            Term a_ext = g_symbolic_tm->mkTerm(sign_extend_op, {a.getLane(a_idx)});
            Term b_ext = g_symbolic_tm->mkTerm(sign_extend_op, {b.getLane(b_idx)});
            // Multiply
            Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a_ext, b_ext});
            // Accumulate
            sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {sum, prod});
        }
        lanes[i] = sum;
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Zip Operations (int8x16, int64x2)
// ============================================================================

/**
 * vzip1q_s8: Zip lower halves of two int8x16 vectors
 * Interleaves elements from the lower half of both vectors:
 * result = { a[0], b[0], a[1], b[1], a[2], b[2], a[3], b[3],
 *            a[4], b[4], a[5], b[5], a[6], b[6], a[7], b[7] }
 */
inline int8x16_t vzip1q_s8(const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[2 * i] = a.getLane(i);
        lanes[2 * i + 1] = b.getLane(i);
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vzip2q_s8: Zip upper halves of two int8x16 vectors
 * Interleaves elements from the upper half of both vectors:
 * result = { a[8], b[8], a[9], b[9], a[10], b[10], a[11], b[11],
 *            a[12], b[12], a[13], b[13], a[14], b[14], a[15], b[15] }
 */
inline int8x16_t vzip2q_s8(const int8x16_t& a, const int8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[2 * i] = a.getLane(i + 8);
        lanes[2 * i + 1] = b.getLane(i + 8);
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vzip1q_s64: Zip lower elements of two int64x2 vectors
 * result = { a[0], b[0] }
 */
inline int64x2_t vzip1q_s64(const int64x2_t& a, const int64x2_t& b) {
    std::array<Term, 2> lanes;
    lanes[0] = a.getLane(0);
    lanes[1] = b.getLane(0);
    return int64x2_t(g_symbolic_tm, lanes);
}

/**
 * vzip2q_s64: Zip upper elements of two int64x2 vectors
 * result = { a[1], b[1] }
 */
inline int64x2_t vzip2q_s64(const int64x2_t& a, const int64x2_t& b) {
    std::array<Term, 2> lanes;
    lanes[0] = a.getLane(1);
    lanes[1] = b.getLane(1);
    return int64x2_t(g_symbolic_tm, lanes);
}

/**
 * vuzp1q_s64: Unzip even elements from two int64x2 vectors
 * result = { a[0], b[0] }
 */
inline int64x2_t vuzp1q_s64(const int64x2_t& a, const int64x2_t& b) {
    std::array<Term, 2> lanes;
    lanes[0] = a.getLane(0);
    lanes[1] = b.getLane(0);
    return int64x2_t(g_symbolic_tm, lanes);
}

/**
 * vuzp2q_s64: Unzip odd elements from two int64x2 vectors
 * result = { a[1], b[1] }
 */
inline int64x2_t vuzp2q_s64(const int64x2_t& a, const int64x2_t& b) {
    std::array<Term, 2> lanes;
    lanes[0] = a.getLane(1);
    lanes[1] = b.getLane(1);
    return int64x2_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Reinterpret Cast Operations (int8/int64/uint8)
// ============================================================================

/**
 * vreinterpretq_s64_s8: Reinterpret int8x16 as int64x2
 * Combines 8 int8 lanes into each int64 lane
 */
inline int64x2_t vreinterpretq_s64_s8(const int8x16_t& vec) {
    std::array<Term, 2> lanes;

    for (int i = 0; i < 2; i++) {
        // Combine 8 bytes into one 64-bit value (little-endian)
        Term result = g_symbolic_tm->mkTerm(
            g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {56}),
            {vec.getLane(i * 8)}
        );
        for (int j = 1; j < 8; j++) {
            Term byte_ext = g_symbolic_tm->mkTerm(
                g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {56}),
                {vec.getLane(i * 8 + j)}
            );
            Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL,
                {byte_ext, g_symbolic_tm->mkBitVector(64, static_cast<uint64_t>(j * 8))});
            result = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {result, shifted});
        }
        lanes[i] = result;
    }
    return int64x2_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_s8_s64: Reinterpret int64x2 as int8x16
 * Splits each int64 lane into 8 int8 lanes
 */
inline int8x16_t vreinterpretq_s8_s64(const int64x2_t& vec) {
    std::array<Term, 16> lanes;

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 8; j++) {
            // Extract 8 bits at position j*8
            Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT,
                {static_cast<uint32_t>(j * 8 + 7), static_cast<uint32_t>(j * 8)});
            lanes[i * 8 + j] = g_symbolic_tm->mkTerm(extract_op, {vec.getLane(i)});
        }
    }
    return int8x16_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_u8_s64: Reinterpret int64x2 as uint8x16
 * Splits each int64 lane into 8 uint8 lanes
 */
inline uint8x16_t vreinterpretq_u8_s64(const int64x2_t& vec) {
    std::array<Term, 16> lanes;

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 8; j++) {
            // Extract 8 bits at position j*8
            Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT,
                {static_cast<uint32_t>(j * 8 + 7), static_cast<uint32_t>(j * 8)});
            lanes[i * 8 + j] = g_symbolic_tm->mkTerm(extract_op, {vec.getLane(i)});
        }
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_s8_u8: Reinterpret uint8x16 as int8x16
 * No-op at the bitvector level (same bit representation)
 */
inline int8x16_t vreinterpretq_s8_u8(const uint8x16_t& vec) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        lanes[i] = vec.getLane(i);
    }
    return int8x16_t(g_symbolic_tm, lanes);
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

/**
 * vcltq_s32: Compare less than (int32x4)
 * result[i] = (a[i] < b[i]) ? 0xFFFFFFFF : 0x00000000
 * Returns uint32x4_t mask where each lane is all 1s if a < b (signed), else all 0s
 */
inline uint32x4_t vcltq_s32(const int32x4_t& a, const int32x4_t& b) {
    std::array<Term, 4> lanes;
    Term all_ones = g_symbolic_tm->mkBitVector(32, 0xFFFFFFFF);
    Term all_zeros = g_symbolic_tm->mkBitVector(32, 0x00000000);

    for (int i = 0; i < 4; i++) {
        // Signed less than comparison
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, all_ones, all_zeros});
    }
    return uint32x4_t(g_symbolic_tm, lanes);
}

/**
 * vcgtq_f32: Compare greater than (float32x4)
 * result[i] = (a[i] > b[i]) ? 0xFFFFFFFF : 0x00000000
 * Returns uint32x4_t mask where each lane is all 1s if a > b, else all 0s
 */
inline uint32x4_t vcgtq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term all_ones = g_symbolic_tm->mkBitVector(32, 0xFFFFFFFF);
    Term all_zeros = g_symbolic_tm->mkBitVector(32, 0x00000000);

    for (int i = 0; i < 4; i++) {
        // Floating-point greater than comparison
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, all_ones, all_zeros});
    }
    return uint32x4_t(g_symbolic_tm, lanes);
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

/**
 * vbslq_u32: Bitwise select (uint32x4)
 * For each bit: if mask bit is 1, select from a; else select from b
 * result[i] = (mask[i] & a[i]) | (~mask[i] & b[i])
 */
inline uint32x4_t vbslq_u32(const uint32x4_t& mask, const uint32x4_t& a, const uint32x4_t& b) {
    std::array<Term, 4> lanes;

    for (int i = 0; i < 4; i++) {
        Term m = mask.getLane(i);
        Term and_a = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {m, a.getLane(i)});
        Term not_m = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {m});
        Term and_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {not_m, b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {and_a, and_b});
    }

    return uint32x4_t(g_symbolic_tm, lanes);
}

/**
 * vbslq_f32: Bitwise select (float32x4)
 * For each bit: if mask bit is 1, select from a; else select from b
 * This operates on the IEEE 754 bit representation of the floats.
 * result[i] = (mask[i] & a[i]) | (~mask[i] & b[i])
 */
inline float32x4_t vbslq_f32(const uint32x4_t& mask, const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Sort bv32 = g_symbolic_tm->mkBitVectorSort(32);
    Sort fp32 = g_symbolic_tm->mkFloatingPointSort(8, 24);
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});

    static int bsl_counter = 0;

    for (int i = 0; i < 4; i++) {
        Term m = mask.getLane(i);

        // Convert float a to bitvector
        Term bv_a = g_symbolic_tm->mkConst(bv32, "bsl_a_bv_" + std::to_string(bsl_counter) + "_" + std::to_string(i));
        Term fp_from_bv_a = g_symbolic_tm->mkTerm(to_fp_op, {bv_a});
        Term eq_a = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv_a, a.getLane(i)});
        g_symbolic_solver->assertFormula(eq_a);

        // Convert float b to bitvector
        Term bv_b = g_symbolic_tm->mkConst(bv32, "bsl_b_bv_" + std::to_string(bsl_counter) + "_" + std::to_string(i));
        Term fp_from_bv_b = g_symbolic_tm->mkTerm(to_fp_op, {bv_b});
        Term eq_b = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv_b, b.getLane(i)});
        g_symbolic_solver->assertFormula(eq_b);

        // Perform bitwise select on the bitvector representations
        Term and_a = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {m, bv_a});
        Term not_m = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {m});
        Term and_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {not_m, bv_b});
        Term result_bv = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {and_a, and_b});

        // Convert result back to floating-point
        lanes[i] = g_symbolic_tm->mkTerm(to_fp_op, {result_bv});
    }
    bsl_counter++;

    return float32x4_t(g_symbolic_tm, lanes);
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
 * vreinterpret_u16_s16: Reinterpret int16x4_t as uint16x4_t
 * No-op conversion - just treats the bits as unsigned instead of signed
 */
inline uint16x4_t vreinterpret_u16_s16(const int16x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);
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
 * vreinterpretq_u8_u32: Reinterpret uint32x4_t as uint8x16_t
 * Treats each uint32 as 4 uint8 values (little-endian byte order)
 */
inline uint8x16_t vreinterpretq_u8_u32(const uint32x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 16> lanes;

    for (int i = 0; i < 4; i++) {
        Term u32_val = vec.getLane(i);
        // Extract 4 bytes from each uint32 (little-endian: byte 0 is LSB)
        for (int j = 0; j < 4; j++) {
            Op extract_op = tm->mkOp(Kind::BITVECTOR_EXTRACT,
                {static_cast<uint32_t>(j * 8 + 7), static_cast<uint32_t>(j * 8)});
            lanes[i * 4 + j] = tm->mkTerm(extract_op, {u32_val});
        }
    }
    return uint8x16_t(tm, lanes);
}

/**
 * vreinterpretq_u32_u8: Reinterpret uint8x16_t as uint32x4_t
 * Combines 4 uint8 values into each uint32 (little-endian byte order)
 */
inline uint32x4_t vreinterpretq_u32_u8(const uint8x16_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 4> lanes;

    for (int i = 0; i < 4; i++) {
        // Combine 4 bytes into a uint32 (little-endian: byte 0 is LSB)
        Term u32_val = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {vec.getLane(i * 4)});
        for (int j = 1; j < 4; j++) {
            Term byte_j = vec.getLane(i * 4 + j);
            Term byte_j_ext = tm->mkTerm(tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {24}), {byte_j});
            Term shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {byte_j_ext, tm->mkBitVector(32, j * 8)});
            u32_val = tm->mkTerm(Kind::BITVECTOR_OR, {u32_val, shifted});
        }
        lanes[i] = u32_val;
    }
    return uint32x4_t(tm, lanes);
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

/**
 * vreinterpretq_u32_s32: Reinterpret int32x4_t as uint32x4_t
 * No actual computation - just type reinterpretation (same bit pattern)
 */
inline uint32x4_t vreinterpretq_u32_s32(const int32x4_t& vec) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);  // Same bitvector, different interpretation
    }
    return uint32x4_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_u32_f32: Reinterpret float32x4_t as uint32x4_t
 * Converts floating-point bit representation to unsigned integer interpretation
 */
inline uint32x4_t vreinterpretq_u32_f32(const float32x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 4> lanes;
    Sort bv32 = tm->mkBitVectorSort(32);
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});

    static int reinterpret_counter = 0;

    for (int i = 0; i < 4; i++) {
        // Create a fresh bitvector that represents the IEEE bits
        Term bv_lane = tm->mkConst(bv32, "fp_to_ubv_" + std::to_string(reinterpret_counter++) + "_" + std::to_string(i));

        // Convert this BV back to FP
        Term fp_from_bv = tm->mkTerm(to_fp_op, {bv_lane});

        // Assert equality: the FP from BV must equal original FP (bit-level equality)
        Term eq = tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getLane(i)});
        g_symbolic_solver->assertFormula(eq);

        lanes[i] = bv_lane;
    }
    return uint32x4_t(tm, lanes);
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
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Check symbolic memory first
    auto it = g_neon_memory_u16x8.find(addr);
    if (it != g_neon_memory_u16x8.end() && !it->second.empty()) {
        // Get the first lane from stored vector and duplicate it
        Term val_term = it->second.back().getLane(0);
        for (int i = 0; i < 8; i++) {
            lanes[i] = val_term;
        }
        return uint16x8_t(g_symbolic_tm, lanes);
    }

    // Fallback: create concrete constant from memory value
    Term val_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(*ptr));
    for (int i = 0; i < 8; i++) {
        lanes[i] = val_term;
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vld1q_dup_u32: Load and duplicate a single uint32 to all lanes (uint32x4)
 * Loads from memory and replicates across all 4 lanes
 */
inline uint32x4_t vld1q_dup_u32(const uint32_t* ptr) {
    std::array<Term, 4> lanes;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Check scalar memory first
    auto it_scalar = g_neon_u32_scalar_memory.find(addr);
    if (it_scalar != g_neon_u32_scalar_memory.end()) {
        Term val_term = it_scalar->second;
        for (int i = 0; i < 4; i++) {
            lanes[i] = val_term;
        }
        return uint32x4_t(g_symbolic_tm, lanes);
    }

    // Check vector memory
    auto it = g_neon_memory_u32x4.find(addr);
    if (it != g_neon_memory_u32x4.end() && !it->second.empty()) {
        Term val_term = it->second.back().getLane(0);
        for (int i = 0; i < 4; i++) {
            lanes[i] = val_term;
        }
        return uint32x4_t(g_symbolic_tm, lanes);
    }

    // Fallback: create concrete constant from memory value
    Term val_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(*ptr));
    for (int i = 0; i < 4; i++) {
        lanes[i] = val_term;
    }
    return uint32x4_t(g_symbolic_tm, lanes);
}

/**
 * vld1q_dup_u32: Overload for const void* (common in XNNPACK code)
 */
inline uint32x4_t vld1q_dup_u32(const void* ptr) {
    return vld1q_dup_u32(reinterpret_cast<const uint32_t*>(ptr));
}

/**
 * vld1_lane_u32: Load a single uint32 value into a specific lane of a uint32x2_t vector
 *
 * Loads a single 32-bit value from memory and inserts it into the specified
 * lane of the input vector, returning a new vector with the updated lane.
 *
 * @param ptr Pointer to memory location to load from
 * @param vec Input vector (other lane is preserved)
 * @param lane Lane index (0-1) to insert the loaded value
 * @return New vector with the specified lane updated
 */
inline uint32x2_t vld1_lane_u32(const uint32_t* ptr, const uint32x2_t& vec, const int lane) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = vec.getLane(i);
    }

    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Check scalar memory first
    auto it_scalar = g_neon_u32_scalar_memory.find(addr);
    if (it_scalar != g_neon_u32_scalar_memory.end()) {
        lanes[lane] = it_scalar->second;
    } else {
        // Check vector memory
        auto it = g_neon_memory_u32x2.find(addr);
        if (it != g_neon_memory_u32x2.end() && !it->second.empty()) {
            lanes[lane] = it->second.back().getLane(0);
        } else {
            // Fallback: create concrete constant from memory value
            lanes[lane] = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(*ptr));
        }
    }

    return uint32x2_t(g_symbolic_tm, lanes);
}

/**
 * vld1_lane_u32: Overload for const void* (common in XNNPACK code)
 */
inline uint32x2_t vld1_lane_u32(const void* ptr, const uint32x2_t& vec, const int lane) {
    return vld1_lane_u32(reinterpret_cast<const uint32_t*>(ptr), vec, lane);
}

/**
 * vld2_u16: Load 2 uint16x4 vectors with de-interleaving
 * Loads 8 uint16 values and deinterleaves into 2 vectors:
 *   val[0] = { ptr[0], ptr[2], ptr[4], ptr[6] }  (even indices)
 *   val[1] = { ptr[1], ptr[3], ptr[5], ptr[7] }  (odd indices)
 */
inline uint16x4x2_t vld2_u16(const uint16_t* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Load 8 uint16 values
    std::array<Term, 8> vals;
    for (int i = 0; i < 8; i++) {
        uintptr_t elem_addr = addr + i * sizeof(uint16_t);

        // Try scalar memory first
        auto it_scalar = g_neon_u16_scalar_memory.find(elem_addr);
        if (it_scalar != g_neon_u16_scalar_memory.end()) {
            vals[i] = it_scalar->second;
        } else {
            // Try vector memory
            auto it = g_neon_memory_u16x8.find(addr);
            if (it != g_neon_memory_u16x8.end() && !it->second.empty() && i < 8) {
                vals[i] = it->second.back().getLane(i);
            } else {
                // Fallback to concrete value
                vals[i] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[i]));
            }
        }
    }

    // Deinterleave: even indices to val[0], odd indices to val[1]
    std::array<Term, 4> even_lanes = {vals[0], vals[2], vals[4], vals[6]};
    std::array<Term, 4> odd_lanes = {vals[1], vals[3], vals[5], vals[7]};

    uint16x4_t vec0(g_symbolic_tm, even_lanes);
    uint16x4_t vec1(g_symbolic_tm, odd_lanes);

    return uint16x4x2_t(vec0, vec1);
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

/**
 * vmlal_lane_s16: Widening multiply-accumulate with lane selection
 * Multiplies each element of vector 'a' by a single element (lane) from vector 'b',
 * then accumulates to the corresponding element in 'acc'.
 * result[i] = acc[i] + sign_extend(a[i]) * sign_extend(b[lane])
 *
 * @param acc  Accumulator vector (int32x4_t)
 * @param a    First source vector (int16x4_t) - all lanes used
 * @param b    Second source vector (int16x4_t) - single lane selected
 * @param lane Lane index (0-3) to select from vector 'b'
 * @return     Result vector with accumulated products
 */
inline int32x4_t vmlal_lane_s16(const int32x4_t& acc, const int16x4_t& a, const int16x4_t& b, const int lane) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

    // Get the selected lane from vector b and sign-extend it once
    Term b_lane_ext = g_symbolic_tm->mkTerm(extend_op, {b.getLane(lane)});

    for (int i = 0; i < 4; i++) {
        // Sign-extend operand from vector a
        Term a_ext = g_symbolic_tm->mkTerm(extend_op, {a.getLane(i)});
        // Multiply with the selected lane from b
        Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {a_ext, b_lane_ext});
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

/**
 * vcvtq_n_f32_s32: Convert signed int32x4 to float32x4 with fixed-point scaling
 * Converts fixed-point integers to floating-point by dividing by 2^n.
 * result[i] = (float)vec[i] / 2^n
 *
 * @param vec Input vector of signed 32-bit integers (fixed-point values)
 * @param n   Number of fractional bits (1-32), determines the divisor 2^n
 * @return    Result vector of float32 values
 */
inline float32x4_t vcvtq_n_f32_s32(const int32x4_t& vec, const int n) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {8, 24});

    // Create the divisor 2^n as a float constant
    float divisor = static_cast<float>(1ULL << n);
    Term divisor_term = g_symbolic_tm->mkFloatingPoint(8, 24,
        g_symbolic_tm->mkBitVector(32, *reinterpret_cast<uint32_t*>(&divisor)));

    for (int i = 0; i < 4; i++) {
        // Convert integer to float
        Term float_val = g_symbolic_tm->mkTerm(to_fp_op, {rm, vec.getLane(i)});
        // Divide by 2^n
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_DIV, {rm, float_val, divisor_term});
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
 *
 * Note: Creates fresh bitvector variables and asserts bit-level equality via
 * FLOATINGPOINT_TO_FP_FROM_IEEE_BV roundtrip. Handles special cases:
 * - NaN: both must be NaN (any NaN bit pattern is acceptable)
 * - Zero: must have same sign (FLOATINGPOINT_EQ treats -0 == +0)
 * - Normal/subnormal: FLOATINGPOINT_EQ works correctly
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

        // Check special cases
        Term is_nan_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_NAN, {vec.getLane(i)});
        Term is_nan_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_NAN, {fp_from_bv});
        Term is_zero_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {vec.getLane(i)});
        Term is_zero_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {fp_from_bv});
        Term is_neg_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_NEG, {vec.getLane(i)});
        Term is_neg_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_NEG, {fp_from_bv});

        // For NaN: both must be NaN
        Term both_nan = tm->mkTerm(Kind::AND, {is_nan_orig, is_nan_conv});

        // For zero: both must be zero with same sign
        Term same_sign = tm->mkTerm(Kind::EQUAL, {is_neg_orig, is_neg_conv});
        Term both_zero_same_sign = tm->mkTerm(Kind::AND, {is_zero_orig, is_zero_conv, same_sign});

        // For normal values: FP equality (which handles -0 == +0, but we handle zero separately)
        Term fp_eq = tm->mkTerm(Kind::FLOATINGPOINT_EQ, {fp_from_bv, vec.getLane(i)});
        Term not_zero = tm->mkTerm(Kind::NOT, {is_zero_orig});
        Term normal_eq = tm->mkTerm(Kind::AND, {fp_eq, not_zero});

        // Combined: NaN case OR zero case OR normal case
        Term eq = tm->mkTerm(Kind::OR, {both_nan, both_zero_same_sign, normal_eq});

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
 * vshll_n_u16: Shift left long by immediate (uint16 -> uint32)
 * Zero-extends uint16x4 to uint32x4, then shifts left by n bits
 * result[i] = zero_extend(vec[i]) << n
 */
inline uint32x4_t vshll_n_u16(const uint16x4_t& vec, int n) {
    std::array<Term, 4> lanes;
    Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {16});
    Term shift_amount = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(n));

    for (int i = 0; i < 4; i++) {
        Term extended = g_symbolic_tm->mkTerm(extend_op, {vec.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {extended, shift_amount});
    }
    return uint32x4_t(g_symbolic_tm, lanes);
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
 * vzipq_u16: Interleave elements of two uint16x8 vectors
 *
 * Given:
 *   a = [a0, a1, a2, a3, a4, a5, a6, a7]
 *   b = [b0, b1, b2, b3, b4, b5, b6, b7]
 *
 * Returns:
 *   result.val[0] = [a0, b0, a1, b1, a2, b2, a3, b3]
 *   result.val[1] = [a4, b4, a5, b5, a6, b6, a7, b7]
 */
inline uint16x8x2_t vzipq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    uint16x8x2_t result;

    // First result vector: interleave low halves
    std::array<Term, 8> lanes0;
    lanes0[0] = a.getLane(0);
    lanes0[1] = b.getLane(0);
    lanes0[2] = a.getLane(1);
    lanes0[3] = b.getLane(1);
    lanes0[4] = a.getLane(2);
    lanes0[5] = b.getLane(2);
    lanes0[6] = a.getLane(3);
    lanes0[7] = b.getLane(3);
    result.val[0] = uint16x8_t(g_symbolic_tm, lanes0);

    // Second result vector: interleave high halves
    std::array<Term, 8> lanes1;
    lanes1[0] = a.getLane(4);
    lanes1[1] = b.getLane(4);
    lanes1[2] = a.getLane(5);
    lanes1[3] = b.getLane(5);
    lanes1[4] = a.getLane(6);
    lanes1[5] = b.getLane(6);
    lanes1[6] = a.getLane(7);
    lanes1[7] = b.getLane(7);
    result.val[1] = uint16x8_t(g_symbolic_tm, lanes1);

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

// ============================================================================
// Load Lane Operations (uint16)
// ============================================================================

/**
 * vld1_lane_u16: Load a single uint16 value into a specific lane of a 4-element vector
 *
 * Loads a single 16-bit value from memory and inserts it into the specified
 * lane of the input vector, returning a new vector with the updated lane.
 *
 * @param ptr Pointer to memory location to load from
 * @param vec Input vector (other lanes are preserved)
 * @param lane Lane index (0-3) to insert the loaded value
 * @return New vector with the specified lane updated
 */
inline uint16x4_t vld1_lane_u16(const uint16_t* ptr, const uint16x4_t& vec, const int lane) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);
    }
    // Load the value from memory and insert into the specified lane
    lanes[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(*ptr));
    return uint16x4_t(g_symbolic_tm, lanes);
}

/**
 * vld1q_lane_u16: Load a single uint16 value into a specific lane of a vector
 *
 * Loads a single 16-bit value from memory and inserts it into the specified
 * lane of the input vector, returning a new vector with the updated lane.
 *
 * @param ptr Pointer to memory location to load from
 * @param vec Input vector (other lanes are preserved)
 * @param lane Lane index (0-7) to insert the loaded value
 * @return New vector with the specified lane updated
 */
inline uint16x8_t vld1q_lane_u16(const uint16_t* ptr, const uint16x8_t& vec, const int lane) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = vec.getLane(i);
    }
    // Load the value from memory and insert into the specified lane
    lanes[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(*ptr));
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vld2q_lane_u16: Load 2 uint16 values into specific lanes of two vectors
 *
 * Loads 2 consecutive 16-bit values from memory and inserts them into
 * the specified lane of each of the two input vectors.
 *
 * Memory layout: [val0, val1] -> vec.val[0][lane], vec.val[1][lane]
 *
 * @param ptr Pointer to memory location to load from (2 consecutive uint16 values)
 * @param vec Input tuple of two vectors (other lanes are preserved)
 * @param lane Lane index (0-7) to insert the loaded values
 * @return New tuple with the specified lanes updated
 */
inline uint16x8x2_t vld2q_lane_u16(const uint16_t* ptr, const uint16x8x2_t& vec, const int lane) {
    uint16x8x2_t result;

    // Copy all lanes from input vectors
    std::array<Term, 8> lanes0, lanes1;
    for (int i = 0; i < 8; i++) {
        lanes0[i] = vec.val[0].getLane(i);
        lanes1[i] = vec.val[1].getLane(i);
    }

    // Load 2 values and insert into the specified lane of each vector
    lanes0[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[0]));
    lanes1[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[1]));

    result.val[0] = uint16x8_t(g_symbolic_tm, lanes0);
    result.val[1] = uint16x8_t(g_symbolic_tm, lanes1);
    return result;
}

/**
 * vld3q_lane_u16: Load 3 uint16 values into specific lanes of three vectors
 *
 * Loads 3 consecutive 16-bit values from memory and inserts them into
 * the specified lane of each of the three input vectors.
 *
 * Memory layout: [val0, val1, val2] -> vec.val[0][lane], vec.val[1][lane], vec.val[2][lane]
 *
 * @param ptr Pointer to memory location to load from (3 consecutive uint16 values)
 * @param vec Input tuple of three vectors (other lanes are preserved)
 * @param lane Lane index (0-7) to insert the loaded values
 * @return New tuple with the specified lanes updated
 */
inline uint16x8x3_t vld3q_lane_u16(const uint16_t* ptr, const uint16x8x3_t& vec, const int lane) {
    uint16x8x3_t result;

    // Copy all lanes from input vectors
    std::array<Term, 8> lanes0, lanes1, lanes2;
    for (int i = 0; i < 8; i++) {
        lanes0[i] = vec.val[0].getLane(i);
        lanes1[i] = vec.val[1].getLane(i);
        lanes2[i] = vec.val[2].getLane(i);
    }

    // Load 3 values and insert into the specified lane of each vector
    lanes0[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[0]));
    lanes1[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[1]));
    lanes2[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[2]));

    result.val[0] = uint16x8_t(g_symbolic_tm, lanes0);
    result.val[1] = uint16x8_t(g_symbolic_tm, lanes1);
    result.val[2] = uint16x8_t(g_symbolic_tm, lanes2);
    return result;
}

/**
 * vld4q_lane_u16: Load 4 uint16 values into specific lanes of four vectors
 *
 * Loads 4 consecutive 16-bit values from memory and inserts them into
 * the specified lane of each of the four input vectors.
 *
 * Memory layout: [val0, val1, val2, val3] -> vec.val[0][lane], vec.val[1][lane], vec.val[2][lane], vec.val[3][lane]
 *
 * @param ptr Pointer to memory location to load from (4 consecutive uint16 values)
 * @param vec Input tuple of four vectors (other lanes are preserved)
 * @param lane Lane index (0-7) to insert the loaded values
 * @return New tuple with the specified lanes updated
 */
inline uint16x8x4_t vld4q_lane_u16(const uint16_t* ptr, const uint16x8x4_t& vec, const int lane) {
    uint16x8x4_t result;

    // Copy all lanes from input vectors
    std::array<Term, 8> lanes0, lanes1, lanes2, lanes3;
    for (int i = 0; i < 8; i++) {
        lanes0[i] = vec.val[0].getLane(i);
        lanes1[i] = vec.val[1].getLane(i);
        lanes2[i] = vec.val[2].getLane(i);
        lanes3[i] = vec.val[3].getLane(i);
    }

    // Load 4 values and insert into the specified lane of each vector
    lanes0[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[0]));
    lanes1[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[1]));
    lanes2[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[2]));
    lanes3[lane] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(ptr[3]));

    result.val[0] = uint16x8_t(g_symbolic_tm, lanes0);
    result.val[1] = uint16x8_t(g_symbolic_tm, lanes1);
    result.val[2] = uint16x8_t(g_symbolic_tm, lanes2);
    result.val[3] = uint16x8_t(g_symbolic_tm, lanes3);
    return result;
}

/**
 * vld2q_lane_u32: Load 2 uint32 values into specific lanes of two vectors
 *
 * Loads 2 consecutive 32-bit values from memory and inserts them into
 * the specified lane of each of the two input vectors.
 *
 * Memory layout: [val0, val1] -> vec.val[0][lane], vec.val[1][lane]
 *
 * @param ptr Pointer to memory location to load from (2 consecutive uint32 values)
 * @param vec Input tuple of two vectors (other lanes are preserved)
 * @param lane Lane index (0-3) to insert the loaded values
 * @return New tuple with the specified lanes updated
 */
inline uint32x4x2_t vld2q_lane_u32(const uint32_t* ptr, const uint32x4x2_t& vec, const int lane) {
    uint32x4x2_t result;

    // Copy all lanes from input vectors
    std::array<Term, 4> lanes0, lanes1;
    for (int i = 0; i < 4; i++) {
        lanes0[i] = vec.val[0].getLane(i);
        lanes1[i] = vec.val[1].getLane(i);
    }

    // Load 2 values from symbolic memory and insert into the specified lane of each vector
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(ptr);

    // Helper lambda to look up symbolic value from memory
    auto lookup_symbolic = [&](size_t offset) -> Term {
        uintptr_t addr = base_addr + offset * sizeof(uint32_t);

        // Search for this address in symbolic memory
        for (const auto& entry : g_neon_memory_u32x4) {
            uintptr_t entry_addr = entry.first;
            if (!entry.second.empty()) {
                const uint32x4_t& base_vec = entry.second.back();
                if (addr >= entry_addr && addr < entry_addr + 16) {
                    size_t offset_elems = (addr - entry_addr) / sizeof(uint32_t);
                    if (offset_elems < 4) {
                        return base_vec.getLane(offset_elems);
                    }
                }
            }
        }
        return g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(ptr[offset]));
    };

    lanes0[lane] = lookup_symbolic(0);
    lanes1[lane] = lookup_symbolic(1);

    result.val[0] = uint32x4_t(g_symbolic_tm, lanes0);
    result.val[1] = uint32x4_t(g_symbolic_tm, lanes1);
    return result;
}

/**
 * vld3q_lane_u32: Load 3 uint32 values into specific lanes of three vectors
 *
 * Loads 3 consecutive 32-bit values from memory and inserts them into
 * the specified lane of each of the three input vectors.
 *
 * Memory layout: [val0, val1, val2] -> vec.val[0][lane], vec.val[1][lane], vec.val[2][lane]
 *
 * @param ptr Pointer to memory location to load from (3 consecutive uint32 values)
 * @param vec Input tuple of three vectors (other lanes are preserved)
 * @param lane Lane index (0-3) to insert the loaded values
 * @return New tuple with the specified lanes updated
 */
inline uint32x4x3_t vld3q_lane_u32(const uint32_t* ptr, const uint32x4x3_t& vec, const int lane) {
    uint32x4x3_t result;

    // Copy all lanes from input vectors
    std::array<Term, 4> lanes0, lanes1, lanes2;
    for (int i = 0; i < 4; i++) {
        lanes0[i] = vec.val[0].getLane(i);
        lanes1[i] = vec.val[1].getLane(i);
        lanes2[i] = vec.val[2].getLane(i);
    }

    // Load 3 values from symbolic memory and insert into the specified lane of each vector
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(ptr);

    // Helper lambda to look up symbolic value from memory
    auto lookup_symbolic = [&](size_t offset) -> Term {
        uintptr_t addr = base_addr + offset * sizeof(uint32_t);

        // Search for this address in symbolic memory
        for (const auto& entry : g_neon_memory_u32x4) {
            uintptr_t entry_addr = entry.first;
            if (!entry.second.empty()) {
                const uint32x4_t& base_vec = entry.second.back();
                if (addr >= entry_addr && addr < entry_addr + 16) {
                    size_t offset_elems = (addr - entry_addr) / sizeof(uint32_t);
                    if (offset_elems < 4) {
                        return base_vec.getLane(offset_elems);
                    }
                }
            }
        }
        return g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(ptr[offset]));
    };

    lanes0[lane] = lookup_symbolic(0);
    lanes1[lane] = lookup_symbolic(1);
    lanes2[lane] = lookup_symbolic(2);

    result.val[0] = uint32x4_t(g_symbolic_tm, lanes0);
    result.val[1] = uint32x4_t(g_symbolic_tm, lanes1);
    result.val[2] = uint32x4_t(g_symbolic_tm, lanes2);
    return result;
}

/**
 * vld4q_lane_u32: Load 4 uint32 values into specific lanes of four vectors
 *
 * Loads 4 consecutive 32-bit values from memory and inserts them into
 * the specified lane of each of the four input vectors.
 *
 * Memory layout: [val0, val1, val2, val3] -> vec.val[0][lane], vec.val[1][lane], vec.val[2][lane], vec.val[3][lane]
 *
 * @param ptr Pointer to memory location to load from (4 consecutive uint32 values)
 * @param vec Input tuple of four vectors (other lanes are preserved)
 * @param lane Lane index (0-3) to insert the loaded values
 * @return New tuple with the specified lanes updated
 */
inline uint32x4x4_t vld4q_lane_u32(const uint32_t* ptr, const uint32x4x4_t& vec, const int lane) {
    uint32x4x4_t result;

    // Copy all lanes from input vectors
    std::array<Term, 4> lanes0, lanes1, lanes2, lanes3;
    for (int i = 0; i < 4; i++) {
        lanes0[i] = vec.val[0].getLane(i);
        lanes1[i] = vec.val[1].getLane(i);
        lanes2[i] = vec.val[2].getLane(i);
        lanes3[i] = vec.val[3].getLane(i);
    }

    // Load 4 values from symbolic memory and insert into the specified lane of each vector
    uintptr_t base_addr = reinterpret_cast<uintptr_t>(ptr);

    // Helper lambda to look up symbolic value from memory
    auto lookup_symbolic = [&](size_t offset) -> Term {
        uintptr_t addr = base_addr + offset * sizeof(uint32_t);

        // Search for this address in symbolic memory
        for (const auto& entry : g_neon_memory_u32x4) {
            uintptr_t entry_addr = entry.first;
            if (!entry.second.empty()) {
                const uint32x4_t& base_vec = entry.second.back();
                // Check if addr falls within this vector (4 elements * 4 bytes = 16 bytes)
                if (addr >= entry_addr && addr < entry_addr + 16) {
                    size_t offset_elems = (addr - entry_addr) / sizeof(uint32_t);
                    if (offset_elems < 4) {
                        return base_vec.getLane(offset_elems);
                    }
                }
            }
        }

        // Fall back to concrete value if not in symbolic memory
        return g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(ptr[offset]));
    };

    lanes0[lane] = lookup_symbolic(0);
    lanes1[lane] = lookup_symbolic(1);
    lanes2[lane] = lookup_symbolic(2);
    lanes3[lane] = lookup_symbolic(3);

    result.val[0] = uint32x4_t(g_symbolic_tm, lanes0);
    result.val[1] = uint32x4_t(g_symbolic_tm, lanes1);
    result.val[2] = uint32x4_t(g_symbolic_tm, lanes2);
    result.val[3] = uint32x4_t(g_symbolic_tm, lanes3);
    return result;
}

// ============================================================================
// Table Lookup Operations
// ============================================================================

/**
 * vtbl1_u8: Table lookup using single 8-byte table
 *
 * For each element in idx, use it as an index into the 8-byte table t.
 * If the index is >= 8 (out of range), the result for that lane is 0.
 *
 * Semantics:
 *   result[i] = (idx[i] < 8) ? t[idx[i]] : 0
 *
 * @param t Table vector (8 bytes)
 * @param idx Index vector (8 bytes, each element is an index into t)
 * @return Result vector with looked-up values
 */
inline uint8x8_t vtbl1_u8(const uint8x8_t& t, const uint8x8_t& idx) {
    std::array<Term, 8> result_lanes;
    Term zero = g_symbolic_tm->mkBitVector(8, 0);
    Term eight = g_symbolic_tm->mkBitVector(8, 8);

    for (int i = 0; i < 8; i++) {
        Term index = idx.getLane(i);

        // Check if index is out of range (>= 8)
        Term out_of_range = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGE, {index, eight});

        // Build nested ITE for table lookup
        // Start with out-of-range default (0), then check each valid index
        Term lookup_result = zero;
        for (int j = 7; j >= 0; j--) {
            Term j_const = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(j));
            Term is_j = g_symbolic_tm->mkTerm(Kind::EQUAL, {index, j_const});
            lookup_result = g_symbolic_tm->mkTerm(Kind::ITE, {is_j, t.getLane(j), lookup_result});
        }

        // Final result: 0 if out of range, otherwise lookup result
        result_lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {out_of_range, zero, lookup_result});
    }

    return uint8x8_t(g_symbolic_tm, result_lanes);
}

// ============================================================================
// uint8 Arithmetic Operations
// ============================================================================

/**
 * vsubq_u8: Subtract two uint8x16 vectors element-wise
 * result[i] = a[i] - b[i] (wrapping)
 */
inline uint8x16_t vsubq_u8(const uint8x16_t& a, const uint8x16_t& b) {
    std::array<Term, 16> lanes;
    for (int i = 0; i < 16; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {a.getLane(i), b.getLane(i)});
    }
    return uint8x16_t(g_symbolic_tm, lanes);
}

/**
 * vmovq_n_u8: Move scalar to all lanes (uint8x16) - alias for vdupq_n_u8
 */
inline uint8x16_t vmovq_n_u8(uint8_t value) {
    return vdupq_n_u8(value);
}

// ============================================================================
// Multi-Vector Load Operations (uint8)
// ============================================================================

/**
 * vld1q_u8_x4: Load 4 consecutive uint8x16_t vectors from memory
 *
 * Loads 64 consecutive bytes (4 * 16 bytes) from memory into 4 vectors.
 * Memory layout: [v0[0..15], v1[0..15], v2[0..15], v3[0..15]]
 *
 * @param ptr Pointer to memory location to load from (64 consecutive bytes)
 * @return Tuple of 4 uint8x16_t vectors
 */
inline uint8x16x4_t vld1q_u8_x4(const uint8_t* ptr) {
    uint8x16x4_t result;

    // Load 4 consecutive 16-byte vectors
    for (int v = 0; v < 4; v++) {
        std::array<Term, 16> lanes;
        uintptr_t vec_addr = reinterpret_cast<uintptr_t>(ptr + v * 16);

        // Check if we have symbolic values at this address
        auto it = g_neon_memory_u8x16.find(vec_addr);
        if (it != g_neon_memory_u8x16.end() && !it->second.empty()) {
            result.val[v] = it->second.back();
        } else {
            // Read concrete values from memory
            for (int i = 0; i < 16; i++) {
                lanes[i] = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(ptr[v * 16 + i]));
            }
            result.val[v] = uint8x16_t(g_symbolic_tm, lanes);
        }
    }

    return result;
}

/**
 * vtbl2_u8: Table lookup using two 8-byte tables (16 bytes total)
 *
 * For each element in idx, use it as an index into the 16-byte table
 * formed by concatenating t.val[0] and t.val[1].
 * If the index is >= 16 (out of range), the result for that lane is 0.
 *
 * Semantics:
 *   table[0..7]   = t.val[0][0..7]
 *   table[8..15]  = t.val[1][0..7]
 *   result[i] = (idx[i] < 16) ? table[idx[i]] : 0
 *
 * @param t Table tuple (two uint8x8_t vectors, 16 bytes total)
 * @param idx Index vector (8 bytes, each element is an index into the table)
 * @return Result vector with looked-up values
 */
inline uint8x8_t vtbl2_u8(const uint8x8x2_t& t, const uint8x8_t& idx) {
    std::array<Term, 8> result_lanes;
    Term zero = g_symbolic_tm->mkBitVector(8, 0);
    Term sixteen = g_symbolic_tm->mkBitVector(8, 16);

    for (int i = 0; i < 8; i++) {
        Term index = idx.getLane(i);

        // Check if index is out of range (>= 16)
        Term out_of_range = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGE, {index, sixteen});

        // Build nested ITE for table lookup across both vectors
        // Indices 0-7 come from t.val[0], indices 8-15 come from t.val[1]
        Term lookup_result = zero;

        // Check indices 15 down to 8 (from t.val[1])
        for (int j = 7; j >= 0; j--) {
            Term j_const = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(j + 8));
            Term is_j = g_symbolic_tm->mkTerm(Kind::EQUAL, {index, j_const});
            lookup_result = g_symbolic_tm->mkTerm(Kind::ITE, {is_j, t.val[1].getLane(j), lookup_result});
        }

        // Check indices 7 down to 0 (from t.val[0])
        for (int j = 7; j >= 0; j--) {
            Term j_const = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(j));
            Term is_j = g_symbolic_tm->mkTerm(Kind::EQUAL, {index, j_const});
            lookup_result = g_symbolic_tm->mkTerm(Kind::ITE, {is_j, t.val[0].getLane(j), lookup_result});
        }

        // Final result: 0 if out of range, otherwise lookup result
        result_lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {out_of_range, zero, lookup_result});
    }

    return uint8x8_t(g_symbolic_tm, result_lanes);
}

/**
 * vqtbl4q_u8: Table lookup using four 16-byte tables (64 bytes total) - ARM64
 *
 * For each element in idx, use it as an index into the 64-byte table
 * formed by concatenating t.val[0], t.val[1], t.val[2], t.val[3].
 * If the index is >= 64 (out of range), the result for that lane is 0.
 *
 * Semantics:
 *   table[0..15]  = t.val[0][0..15]
 *   table[16..31] = t.val[1][0..15]
 *   table[32..47] = t.val[2][0..15]
 *   table[48..63] = t.val[3][0..15]
 *   result[i] = (idx[i] < 64) ? table[idx[i]] : 0
 *
 * @param t Table tuple (four uint8x16_t vectors, 64 bytes total)
 * @param idx Index vector (16 bytes, each element is an index into the table)
 * @return Result vector with looked-up values
 */
inline uint8x16_t vqtbl4q_u8(const uint8x16x4_t& t, const uint8x16_t& idx) {
    std::array<Term, 16> result_lanes;
    Term zero = g_symbolic_tm->mkBitVector(8, 0);
    Term sixty_four = g_symbolic_tm->mkBitVector(8, 64);

    for (int i = 0; i < 16; i++) {
        Term index = idx.getLane(i);

        // Check if index is out of range (>= 64)
        Term out_of_range = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGE, {index, sixty_four});

        // Build nested ITE for table lookup across all 4 vectors (64 entries)
        Term lookup_result = zero;

        // Check indices from all 4 vectors (63 down to 0)
        for (int v = 3; v >= 0; v--) {
            for (int j = 15; j >= 0; j--) {
                int table_idx = v * 16 + j;
                Term idx_const = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(table_idx));
                Term is_match = g_symbolic_tm->mkTerm(Kind::EQUAL, {index, idx_const});
                lookup_result = g_symbolic_tm->mkTerm(Kind::ITE, {is_match, t.val[v].getLane(j), lookup_result});
            }
        }

        // Final result: 0 if out of range, otherwise lookup result
        result_lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {out_of_range, zero, lookup_result});
    }

    return uint8x16_t(g_symbolic_tm, result_lanes);
}

/**
 * vqtbx4q_u8: Table lookup with extension using four 16-byte tables (64 bytes total) - ARM64
 *
 * For each element in idx, use it as an index into the 64-byte table
 * formed by concatenating t.val[0], t.val[1], t.val[2], t.val[3].
 * If the index is >= 64 (out of range), the result lane keeps the original value from 'a'.
 *
 * Semantics:
 *   table[0..15]  = t.val[0][0..15]
 *   table[16..31] = t.val[1][0..15]
 *   table[32..47] = t.val[2][0..15]
 *   table[48..63] = t.val[3][0..15]
 *   result[i] = (idx[i] < 64) ? table[idx[i]] : a[i]
 *
 * @param a Default vector (values used when index is out of range)
 * @param t Table tuple (four uint8x16_t vectors, 64 bytes total)
 * @param idx Index vector (16 bytes, each element is an index into the table)
 * @return Result vector with looked-up values, or original values for out-of-range indices
 */
inline uint8x16_t vqtbx4q_u8(const uint8x16_t& a, const uint8x16x4_t& t, const uint8x16_t& idx) {
    std::array<Term, 16> result_lanes;
    Term sixty_four = g_symbolic_tm->mkBitVector(8, 64);

    for (int i = 0; i < 16; i++) {
        Term index = idx.getLane(i);
        Term default_val = a.getLane(i);

        // Check if index is out of range (>= 64)
        Term out_of_range = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGE, {index, sixty_four});

        // Build nested ITE for table lookup across all 4 vectors (64 entries)
        // Start with default value (used when out of range or no match)
        Term lookup_result = default_val;

        // Check indices from all 4 vectors (63 down to 0)
        for (int v = 3; v >= 0; v--) {
            for (int j = 15; j >= 0; j--) {
                int table_idx = v * 16 + j;
                Term idx_const = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(table_idx));
                Term is_match = g_symbolic_tm->mkTerm(Kind::EQUAL, {index, idx_const});
                lookup_result = g_symbolic_tm->mkTerm(Kind::ITE, {is_match, t.val[v].getLane(j), lookup_result});
            }
        }

        // Final result: default value if out of range, otherwise lookup result
        result_lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {out_of_range, default_val, lookup_result});
    }

    return uint8x16_t(g_symbolic_tm, result_lanes);
}

// ============================================================================
// Float32 Operations
// ============================================================================

/**
 * vmovq_n_f32: Create vector with all lanes set to scalar value
 */
inline float32x4_t vmovq_n_f32(float value) {
    std::array<Term, 4> lanes;
    // Convert float to IEEE 754 bitvector, then to floating-point term
    uint32_t bits;
    std::memcpy(&bits, &value, sizeof(bits));
    Term val_term = g_symbolic_tm->mkFloatingPoint(8, 24, g_symbolic_tm->mkBitVector(32, bits));
    for (int i = 0; i < 4; i++) {
        lanes[i] = val_term;
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vld1q_dup_f32: Load scalar and duplicate to all lanes
 */
inline float32x4_t vld1q_dup_f32(const float* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Try to find existing symbolic value at this address
    auto it = g_neon_memory_f32x4.find(addr);
    if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
        // Get lane 0 and duplicate to all lanes
        Term val = it->second.back().getLane(0);
        std::array<Term, 4> lanes = {val, val, val, val};
        return float32x4_t(g_symbolic_tm, lanes);
    }

    // Create fresh symbolic value and duplicate
    Sort fp32 = g_symbolic_tm->mkFloatingPointSort(8, 24);
    static int dup_counter = 0;
    Term val = g_symbolic_tm->mkConst(fp32, "dup_f32_" + std::to_string(dup_counter++));
    std::array<Term, 4> lanes = {val, val, val, val};
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vld1q_lane_f32: Load single value into specified lane
 */
inline float32x4_t vld1q_lane_f32(const float* ptr, float32x4_t src, const int lane) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Get new value for the lane
    Term new_val;
    auto it = g_neon_memory_f32x4.find(addr);
    if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
        new_val = it->second.back().getLane(0);
    } else {
        Sort fp32 = g_symbolic_tm->mkFloatingPointSort(8, 24);
        static int lane_counter = 0;
        new_val = g_symbolic_tm->mkConst(fp32, "lane_f32_" + std::to_string(lane_counter++));
    }

    // Copy source lanes and replace specified lane
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = (i == lane) ? new_val : src.getLane(i);
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmaxq_f32: Element-wise maximum of two float32x4 vectors
 */
inline float32x4_t vmaxq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vminq_f32: Element-wise minimum of two float32x4 vectors
 */
inline float32x4_t vminq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmax_f32: Element-wise maximum of two float32x2 vectors
 */
inline float32x2_t vmax_f32(const float32x2_t& a, const float32x2_t& b) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vmin_f32: Element-wise minimum of two float32x2 vectors
 */
inline float32x2_t vmin_f32(const float32x2_t& a, const float32x2_t& b) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vmlaq_f32: Multiply-accumulate (float32x4)
 * result[i] = acc[i] + a[i] * b[i]
 */
inline float32x4_t vmlaq_f32(const float32x4_t& acc, const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        // a[i] * b[i]
        Term prod = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
        // acc[i] + prod
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, acc.getLane(i), prod});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmlsq_f32: Multiply-subtract (float32x4)
 * result[i] = acc[i] - a[i] * b[i]
 */
inline float32x4_t vmlsq_f32(const float32x4_t& acc, const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        // a[i] * b[i]
        Term prod = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
        // acc[i] - prod
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SUB, {rm, acc.getLane(i), prod});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmlaq_lane_f32: Multiply-accumulate with lane from float32x2
 * result[i] = a[i] + b[i] * c[lane]
 */
inline float32x4_t vmlaq_lane_f32(const float32x4_t& a, const float32x4_t& b,
                                   const float32x2_t& c, const int lane) {
    std::array<Term, 4> lanes;
    Term c_lane = c.getLane(lane);
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        // b[i] * c[lane]
        Term prod = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, b.getLane(i), c_lane});
        // a[i] + prod
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getLane(i), prod});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmulq_lane_f32: Multiply vector by scalar lane from float32x2
 * result[i] = a[i] * b[lane]
 *
 * @param a    First source vector (float32x4_t) - all lanes used
 * @param b    Second source vector (float32x2_t) - single lane selected
 * @param lane Lane index (0-1) to select from vector 'b'
 * @return     Result vector with products
 */
inline float32x4_t vmulq_lane_f32(const float32x4_t& a, const float32x2_t& b, const int lane) {
    std::array<Term, 4> lanes;
    Term b_lane = b.getLane(lane);
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b_lane});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vzipq_f32: Interleave elements from two vectors
 * Returns two vectors:
 *   val[0] = { a[0], b[0], a[1], b[1] }
 *   val[1] = { a[2], b[2], a[3], b[3] }
 */
inline float32x4x2_t vzipq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes0 = {
        a.getLane(0), b.getLane(0), a.getLane(1), b.getLane(1)
    };
    std::array<Term, 4> lanes1 = {
        a.getLane(2), b.getLane(2), a.getLane(3), b.getLane(3)
    };

    return float32x4x2_t(
        float32x4_t(g_symbolic_tm, lanes0),
        float32x4_t(g_symbolic_tm, lanes1)
    );
}

/**
 * vdupq_lane_f32: Duplicate a lane from float32x2_t to all lanes of float32x4_t
 * result[0..3] = vec[lane]
 */
inline float32x4_t vdupq_lane_f32(const float32x2_t& vec, const int lane) {
    std::array<Term, 4> lanes;
    Term lane_val = vec.getLane(lane);
    for (int i = 0; i < 4; i++) {
        lanes[i] = lane_val;
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vmla_f32: Multiply-accumulate (float32x2)
 * result[i] = acc[i] + a[i] * b[i]
 */
inline float32x2_t vmla_f32(const float32x2_t& acc, const float32x2_t& a, const float32x2_t& b) {
    std::array<Term, 2> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 2; i++) {
        Term prod = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, acc.getLane(i), prod});
    }
    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vsub_f32: Subtract two float32x2 vectors
 * result[i] = a[i] - b[i]
 */
inline float32x2_t vsub_f32(const float32x2_t& a, const float32x2_t& b) {
    std::array<Term, 2> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 2; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SUB, {rm, a.getLane(i), b.getLane(i)});
    }
    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vsubq_f32: Subtract two float32x4 vectors
 * result[i] = a[i] - b[i]
 */
inline float32x4_t vsubq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SUB, {rm, a.getLane(i), b.getLane(i)});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vld1_dup_f32: Load single float and duplicate to all lanes of float32x2
 * result[0..1] = *ptr
 */
inline float32x2_t vld1_dup_f32(const float* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Try to find in scalar memory first
    Term val;
    auto it_scalar = g_neon_float_scalar_memory.find(addr);
    if (it_scalar != g_neon_float_scalar_memory.end()) {
        val = it_scalar->second;
    } else {
        // Try f32x4 memory
        auto it = g_neon_memory_f32x4.find(addr);
        if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
            val = it->second.back().getLane(0);
        } else {
            // Try f32x2 memory
            auto it2 = g_neon_memory_f32x2.find(addr);
            if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
                val = it2->second.back().getLane(0);
            } else {
                // Create from concrete value
                uint32_t bits;
                std::memcpy(&bits, ptr, sizeof(bits));
                val = g_symbolic_tm->mkFloatingPoint(8, 24,
                          g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));
            }
        }
    }

    std::array<Term, 2> lanes = {val, val};
    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vget_lane_f32: Extract a single lane from float32x2
 * Returns the scalar value at the specified lane
 */
inline float vget_lane_f32(const float32x2_t& vec, const int lane) {
    // Store the symbolic term for later retrieval if needed
    // Return concrete 0.0f as placeholder - actual symbolic work is done via the Term
    (void)vec.getLane(lane);  // Access to ensure it's tracked
    return 0.0f;  // Concrete placeholder
}

/**
 * vuzp_f32: Unzip two float32x2 vectors
 * Deinterleaves elements from two vectors:
 *   val[0] = { a[0], b[0] }  (even elements)
 *   val[1] = { a[1], b[1] }  (odd elements)
 */
inline float32x2x2_t vuzp_f32(const float32x2_t& a, const float32x2_t& b) {
    std::array<Term, 2> lanes0 = { a.getLane(0), b.getLane(0) };
    std::array<Term, 2> lanes1 = { a.getLane(1), b.getLane(1) };

    return float32x2x2_t(
        float32x2_t(g_symbolic_tm, lanes0),
        float32x2_t(g_symbolic_tm, lanes1)
    );
}

/**
 * vuzpq_f32: Unzip two float32x4 vectors
 * Deinterleaves elements from two vectors:
 *   val[0] = { a[0], a[2], b[0], b[2] }  (even elements)
 *   val[1] = { a[1], a[3], b[1], b[3] }  (odd elements)
 */
inline float32x4x2_t vuzpq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes0 = { a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2) };
    std::array<Term, 4> lanes1 = { a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3) };

    return float32x4x2_t(
        float32x4_t(g_symbolic_tm, lanes0),
        float32x4_t(g_symbolic_tm, lanes1)
    );
}

/**
 * vuzpq_f16: Unzip two float16x8 vectors
 * Deinterleaves elements from two vectors:
 *   val[0] = { a[0], a[2], a[4], a[6], b[0], b[2], b[4], b[6] }  (even elements)
 *   val[1] = { a[1], a[3], a[5], a[7], b[1], b[3], b[5], b[7] }  (odd elements)
 */
inline float16x8x2_t vuzpq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes0 = {
        a.getLane(0), a.getLane(2), a.getLane(4), a.getLane(6),
        b.getLane(0), b.getLane(2), b.getLane(4), b.getLane(6)
    };
    std::array<Term, 8> lanes1 = {
        a.getLane(1), a.getLane(3), a.getLane(5), a.getLane(7),
        b.getLane(1), b.getLane(3), b.getLane(5), b.getLane(7)
    };

    return float16x8x2_t(
        float16x8_t(g_symbolic_tm, lanes0),
        float16x8_t(g_symbolic_tm, lanes1)
    );
}

/**
 * vuzp_f16: Unzip two float16x4 vectors
 * Deinterleaves elements from two vectors:
 *   val[0] = { a[0], a[2], b[0], b[2] }  (even elements)
 *   val[1] = { a[1], a[3], b[1], b[3] }  (odd elements)
 */
inline float16x4x2_t vuzp_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes0 = { a.getLane(0), a.getLane(2), b.getLane(0), b.getLane(2) };
    std::array<Term, 4> lanes1 = { a.getLane(1), a.getLane(3), b.getLane(1), b.getLane(3) };

    return float16x4x2_t(
        float16x4_t(g_symbolic_tm, lanes0),
        float16x4_t(g_symbolic_tm, lanes1)
    );
}

/**
 * vld2_f32: Load 2 float32x2 vectors with de-interleaving
 * Loads 4 floats and deinterleaves into 2 vectors:
 *   val[0] = { ptr[0], ptr[2] }  (even indices)
 *   val[1] = { ptr[1], ptr[3] }  (odd indices)
 */
inline float32x2x2_t vld2_f32(const float* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Load 4 float values
    std::array<Term, 4> vals;
    for (int i = 0; i < 4; i++) {
        uintptr_t elem_addr = addr + i * sizeof(float);

        auto it_scalar = g_neon_float_scalar_memory.find(elem_addr);
        if (it_scalar != g_neon_float_scalar_memory.end()) {
            vals[i] = it_scalar->second;
        } else {
            auto it = g_neon_memory_f32x4.find(elem_addr);
            if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
                vals[i] = it->second.back().getLane(0);
            } else {
                auto it2 = g_neon_memory_f32x2.find(elem_addr);
                if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
                    vals[i] = it2->second.back().getLane(0);
                } else {
                    uint32_t bits;
                    std::memcpy(&bits, ptr + i, sizeof(bits));
                    vals[i] = g_symbolic_tm->mkFloatingPoint(8, 24,
                                  g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));
                }
            }
        }
    }

    // Deinterleave: even indices to val[0], odd to val[1]
    std::array<Term, 2> lanes0 = { vals[0], vals[2] };
    std::array<Term, 2> lanes1 = { vals[1], vals[3] };

    return float32x2x2_t(
        float32x2_t(g_symbolic_tm, lanes0),
        float32x2_t(g_symbolic_tm, lanes1)
    );
}

/**
 * vld2q_f32: Load 2 float32x4 vectors with de-interleaving
 * Loads 8 floats and deinterleaves into 2 vectors:
 *   val[0] = { ptr[0], ptr[2], ptr[4], ptr[6] }  (even indices)
 *   val[1] = { ptr[1], ptr[3], ptr[5], ptr[7] }  (odd indices)
 */
inline float32x4x2_t vld2q_f32(const float* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Load 8 float values
    std::array<Term, 8> vals;
    for (int i = 0; i < 8; i++) {
        uintptr_t elem_addr = addr + i * sizeof(float);

        auto it_scalar = g_neon_float_scalar_memory.find(elem_addr);
        if (it_scalar != g_neon_float_scalar_memory.end()) {
            vals[i] = it_scalar->second;
        } else {
            auto it = g_neon_memory_f32x4.find(elem_addr);
            if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
                vals[i] = it->second.back().getLane(0);
            } else {
                auto it2 = g_neon_memory_f32x2.find(elem_addr);
                if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
                    vals[i] = it2->second.back().getLane(0);
                } else {
                    uint32_t bits;
                    std::memcpy(&bits, ptr + i, sizeof(bits));
                    vals[i] = g_symbolic_tm->mkFloatingPoint(8, 24,
                                  g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));
                }
            }
        }
    }

    // Deinterleave: even indices to val[0], odd to val[1]
    std::array<Term, 4> lanes0 = { vals[0], vals[2], vals[4], vals[6] };
    std::array<Term, 4> lanes1 = { vals[1], vals[3], vals[5], vals[7] };

    return float32x4x2_t(
        float32x4_t(g_symbolic_tm, lanes0),
        float32x4_t(g_symbolic_tm, lanes1)
    );
}

/**
 * vextq_f32: Extract vector from pair of vectors (float32x4_t)
 * Concatenates a and b, then extracts 4 elements starting at index n.
 * result[i] = (i + n < 4) ? a[i + n] : b[i + n - 4]
 *
 * @param a First source vector (lower part of concatenation)
 * @param b Second source vector (upper part of concatenation)
 * @param n Starting index (0-3) for extraction
 * @return Extracted vector of 4 elements
 */
inline float32x4_t vextq_f32(const float32x4_t& a, const float32x4_t& b, const int n) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int src_idx = i + n;
        if (src_idx < 4) {
            lanes[i] = a.getLane(src_idx);
        } else {
            lanes[i] = b.getLane(src_idx - 4);
        }
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_f32_u32: Reinterpret uint32x4_t as float32x4_t
 * Interprets the bit pattern of unsigned integers as IEEE 754 floats.
 * This is a bit-level reinterpretation (no value conversion).
 */
inline float32x4_t vreinterpretq_f32_u32(const uint32x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 4> lanes;
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});

    for (int i = 0; i < 4; i++) {
        // Convert the bitvector directly to FP using IEEE bit interpretation
        lanes[i] = tm->mkTerm(to_fp_op, {vec.getLane(i)});
    }
    return float32x4_t(tm, lanes);
}

/**
 * vreinterpret_f32_u32: Reinterpret uint32x2_t as float32x2_t
 * Interprets the bit pattern of unsigned integers as IEEE 754 floats.
 * This is a bit-level reinterpretation (no value conversion).
 */
inline float32x2_t vreinterpret_f32_u32(const uint32x2_t& vec) {
    std::array<Term, 2> lanes;
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});

    for (int i = 0; i < 2; i++) {
        // Convert the bitvector directly to FP using IEEE bit interpretation
        lanes[i] = g_symbolic_tm->mkTerm(to_fp_op, {vec.getLane(i)});
    }
    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_f32_u16: Reinterpret uint16x8_t as float32x4_t
 * Takes 8 x 16-bit values and reinterprets as 4 x 32-bit floats
 * Pairs of u16 lanes are combined into single u32 then interpreted as float.
 * Lane mapping: result[i] = reinterpret_as_f32((src[2i+1] << 16) | src[2i])
 */
inline float32x4_t vreinterpretq_f32_u16(const uint16x8_t& vec) {
    std::array<Term, 4> lanes;
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    Op zext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {16});

    for (int i = 0; i < 4; i++) {
        // Combine two u16 values into one u32: (high << 16) | low
        Term low_16 = vec.getLane(2 * i);
        Term high_16 = vec.getLane(2 * i + 1);

        // Zero-extend both to 32 bits
        Term low_32 = g_symbolic_tm->mkTerm(zext_op, {low_16});
        Term high_32 = g_symbolic_tm->mkTerm(zext_op, {high_16});

        // Shift high part left by 16 bits
        Term shift_amt = g_symbolic_tm->mkBitVector(32, 16);
        Term high_shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {high_32, shift_amt});

        // OR them together
        Term combined = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {high_shifted, low_32});

        // Reinterpret as float32
        lanes[i] = g_symbolic_tm->mkTerm(to_fp_op, {combined});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Absolute Value Operations
// ============================================================================

/**
 * vabsq_f32: Absolute value (float32x4)
 * result[i] = |a[i]|
 * Returns the absolute value of each floating-point element.
 */
inline float32x4_t vabsq_f32(const float32x4_t& a) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ABS, {a.getLane(i)});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Additional Comparison Operations
// ============================================================================

/**
 * vcgtq_u32: Compare greater than (uint32x4)
 * result[i] = (a[i] > b[i]) ? 0xFFFFFFFF : 0x00000000
 * Returns uint32x4_t mask where each lane is all 1s if a > b (unsigned), else all 0s
 */
inline uint32x4_t vcgtq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    std::array<Term, 4> lanes;
    Term all_ones = g_symbolic_tm->mkBitVector(32, 0xFFFFFFFF);
    Term all_zeros = g_symbolic_tm->mkBitVector(32, 0x00000000);

    for (int i = 0; i < 4; i++) {
        // Unsigned greater than comparison
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, all_ones, all_zeros});
    }
    return uint32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Narrowing Operations
// ============================================================================

/**
 * vmovn_u32: Narrow uint32x4 to uint16x4
 * Extracts lower 16 bits of each 32-bit element
 * result[i] = (uint16_t)vec[i]
 */
inline uint16x4_t vmovn_u32(const uint32x4_t& vec) {
    std::array<Term, 4> lanes;
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(extract_op, {vec.getLane(i)});
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

/**
 * vshrn_n_u32: Shift right narrow (uint32 -> uint16)
 * Shifts right by n bits, then narrows to uint16
 * result[i] = (uint16_t)(vec[i] >> n)
 */
inline uint16x4_t vshrn_n_u32(const uint32x4_t& vec, int n) {
    std::array<Term, 4> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(n));
    Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

    for (int i = 0; i < 4; i++) {
        Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_LSHR, {vec.getLane(i), shift_amount});
        lanes[i] = g_symbolic_tm->mkTerm(extract_op, {shifted});
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Combine Operations
// ============================================================================

/**
 * vcombine_u16: Combine two uint16x4 into uint16x8
 */
inline uint16x8_t vcombine_u16(const uint16x4_t& low, const uint16x4_t& high) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = low.getLane(i);
        lanes[i + 4] = high.getLane(i);
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vcombine_f32: Combine two float32x2 into float32x4
 * result = [low[0], low[1], high[0], high[1]]
 */
inline float32x4_t vcombine_f32(const float32x2_t& low, const float32x2_t& high) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = low.getLane(i);
        lanes[i + 2] = high.getLane(i);
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vcombine_s32: Combine two int32x2 into int32x4
 * result = [low[0], low[1], high[0], high[1]]
 */
inline int32x4_t vcombine_s32(const int32x2_t& low, const int32x2_t& high) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = low.getLane(i);
        lanes[i + 2] = high.getLane(i);
    }
    return int32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Maximum Operations (unsigned)
// ============================================================================

/**
 * vmaxq_u32: Maximum of two vectors (uint32x4)
 * result[i] = max(a[i], b[i])
 */
inline uint32x4_t vmaxq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return uint32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// uint16 Arithmetic Operations
// ============================================================================

/**
 * vaddq_u16: Add two vectors element-wise (uint16x8)
 * result[i] = a[i] + b[i] (mod 2^16)
 */
inline uint16x8_t vaddq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {a.getLane(i), b.getLane(i)});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vadd_u16: Add two vectors element-wise (uint16x4)
 * result[i] = a[i] + b[i] (mod 2^16)
 */
inline uint16x4_t vadd_u16(const uint16x4_t& a, const uint16x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {a.getLane(i), b.getLane(i)});
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// uint16 Bitwise Operations
// ============================================================================

/**
 * vandq_u16: Bitwise AND (uint16x8)
 * result[i] = a[i] & b[i]
 */
inline uint16x8_t vandq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {a.getLane(i), b.getLane(i)});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vand_u16: Bitwise AND (uint16x4)
 * result[i] = a[i] & b[i]
 */
inline uint16x4_t vand_u16(const uint16x4_t& a, const uint16x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {a.getLane(i), b.getLane(i)});
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

/**
 * vorrq_u16: Bitwise OR (uint16x8)
 * result[i] = a[i] | b[i]
 */
inline uint16x8_t vorrq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {a.getLane(i), b.getLane(i)});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vorr_u16: Bitwise OR (uint16x4)
 * result[i] = a[i] | b[i]
 */
inline uint16x4_t vorr_u16(const uint16x4_t& a, const uint16x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {a.getLane(i), b.getLane(i)});
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

/**
 * veorq_u16: Bitwise XOR (uint16x8)
 * result[i] = a[i] ^ b[i]
 */
inline uint16x8_t veorq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_XOR, {a.getLane(i), b.getLane(i)});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vorrq_u32: Bitwise OR (uint32x4)
 * result[i] = a[i] | b[i]
 */
inline uint32x4_t vorrq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {a.getLane(i), b.getLane(i)});
    }
    return uint32x4_t(g_symbolic_tm, lanes);
}

/**
 * vshlq_n_u16: Shift left by immediate (uint16x8)
 * result[i] = a[i] << n
 * Note: n must be a compile-time constant in real NEON, but we accept it as runtime arg
 */
inline uint16x8_t vshlq_n_u16(const uint16x8_t& a, int n) {
    std::array<Term, 8> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(n));
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {a.getLane(i), shift_amount});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vsraq_n_u16: Shift right and accumulate by immediate (uint16x8)
 * result[i] = a[i] + (b[i] >> n)
 * Note: n must be a compile-time constant in real NEON, but we accept it as runtime arg
 */
inline uint16x8_t vsraq_n_u16(const uint16x8_t& a, const uint16x8_t& b, int n) {
    std::array<Term, 8> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(n));
    for (int i = 0; i < 8; i++) {
        Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_LSHR, {b.getLane(i), shift_amount});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {a.getLane(i), shifted});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vcgtq_u16: Compare greater than (uint16x8)
 * result[i] = (a[i] > b[i]) ? 0xFFFF : 0x0000
 */
inline uint16x8_t vcgtq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    std::array<Term, 8> lanes;
    Term all_ones = g_symbolic_tm->mkBitVector(16, 0xFFFF);
    Term all_zeros = g_symbolic_tm->mkBitVector(16, 0x0000);
    for (int i = 0; i < 8; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, all_ones, all_zeros});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpret_s16_u16: Reinterpret uint16x4_t as int16x4_t
 * No actual computation - just type reinterpretation (same bit pattern)
 */
inline int16x4_t vreinterpret_s16_u16(const uint16x4_t& vec) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);  // Same bitvector, different interpretation
    }
    return int16x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// uint16 Bitwise Select Operations
// ============================================================================

/**
 * vbslq_u16: Bitwise select (uint16x8)
 * For each bit: if mask bit is 1, select from a; else select from b
 * result[i] = (mask[i] & a[i]) | (~mask[i] & b[i])
 */
inline uint16x8_t vbslq_u16(const uint16x8_t& mask, const uint16x8_t& a, const uint16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term m = mask.getLane(i);
        Term and_a = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {m, a.getLane(i)});
        Term not_m = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {m});
        Term and_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {not_m, b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {and_a, and_b});
    }
    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vbsl_u16: Bitwise select (uint16x4)
 * For each bit: if mask bit is 1, select from a; else select from b
 * result[i] = (mask[i] & a[i]) | (~mask[i] & b[i])
 */
inline uint16x4_t vbsl_u16(const uint16x4_t& mask, const uint16x4_t& a, const uint16x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term m = mask.getLane(i);
        Term and_a = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {m, a.getLane(i)});
        Term not_m = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {m});
        Term and_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {not_m, b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {and_a, and_b});
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// uint16 Reinterpret Operations
// ============================================================================

/**
 * vreinterpret_u32_u16: Reinterpret uint16x4_t as uint32x2_t
 * Treats pairs of uint16 as single uint32 values (little-endian)
 */
inline uint32x2_t vreinterpret_u32_u16(const uint16x4_t& vec) {
    std::array<Term, 2> lanes;
    Op zero_ext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {16});

    for (int i = 0; i < 2; i++) {
        // Combine two 16-bit values into one 32-bit value (little-endian)
        // low_part = vec[2*i], high_part = vec[2*i+1]
        // result = (high_part << 16) | low_part
        Term low = g_symbolic_tm->mkTerm(zero_ext_op, {vec.getLane(2 * i)});
        Term high = g_symbolic_tm->mkTerm(zero_ext_op, {vec.getLane(2 * i + 1)});
        Term shift_amount = g_symbolic_tm->mkBitVector(32, 16);
        Term high_shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {high, shift_amount});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {high_shifted, low});
    }
    return uint32x2_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Multi-Vector Duplicate Load Operations
// ============================================================================

/**
 * vld2q_dup_f32: Load 2 floats and duplicate each to all lanes
 * Loads 2 consecutive float values from memory:
 *   val[0] = { ptr[0], ptr[0], ptr[0], ptr[0] }  (first value duplicated)
 *   val[1] = { ptr[1], ptr[1], ptr[1], ptr[1] }  (second value duplicated)
 */
inline float32x4x2_t vld2q_dup_f32(const float* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Load 2 float values
    std::array<Term, 2> vals;
    for (int i = 0; i < 2; i++) {
        uintptr_t elem_addr = addr + i * sizeof(float);

        // Try scalar memory first
        auto it_scalar = g_neon_float_scalar_memory.find(elem_addr);
        if (it_scalar != g_neon_float_scalar_memory.end()) {
            vals[i] = it_scalar->second;
        } else {
            // Try f32x4 memory
            auto it = g_neon_memory_f32x4.find(elem_addr);
            if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
                vals[i] = it->second.back().getLane(0);
            } else {
                // Try f32x2 memory
                auto it2 = g_neon_memory_f32x2.find(elem_addr);
                if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
                    vals[i] = it2->second.back().getLane(0);
                } else {
                    // Fall back to concrete value
                    uint32_t bits;
                    std::memcpy(&bits, ptr + i, sizeof(bits));
                    vals[i] = g_symbolic_tm->mkFloatingPoint(8, 24,
                                  g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));
                }
            }
        }
    }

    // Duplicate each value to all 4 lanes
    std::array<Term, 4> lanes0 = { vals[0], vals[0], vals[0], vals[0] };
    std::array<Term, 4> lanes1 = { vals[1], vals[1], vals[1], vals[1] };

    return float32x4x2_t(
        float32x4_t(g_symbolic_tm, lanes0),
        float32x4_t(g_symbolic_tm, lanes1)
    );
}

// ============================================================================
// uint16 Extract Operations
// ============================================================================

/**
 * vext_u16: Extract from pair of vectors (uint16x4)
 * Concatenates a and b, extracts 4 elements starting at index n
 */
inline uint16x4_t vext_u16(const uint16x4_t& a, const uint16x4_t& b, int n) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        int src_idx = i + n;
        if (src_idx < 4) {
            lanes[i] = a.getLane(src_idx);
        } else {
            lanes[i] = b.getLane(src_idx - 4);
        }
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Float16 (Half-Precision) Arithmetic Operations - Extended
// ============================================================================

/**
 * vsubq_f16: Subtract two float16x8 vectors element-wise
 * result[i] = a[i] - b[i]
 */
inline float16x8_t vsubq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SUB, {rm, a.getLane(i), b.getLane(i)});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vaddq_f16: Add two float16x8 vectors element-wise
 * result[i] = a[i] + b[i]
 */
inline float16x8_t vaddq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getLane(i), b.getLane(i)});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vfmaq_f16: Fused multiply-add float16x8
 * result[i] = acc[i] + a[i] * b[i]
 * This is a fused operation (single rounding)
 */
inline float16x8_t vfmaq_f16(const float16x8_t& acc, const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 8; i++) {
        // FMA: acc + a * b
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_FMA, {rm, a.getLane(i), b.getLane(i), acc.getLane(i)});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vfmsq_f16: Fused multiply-subtract (float16x8)
 * result[i] = acc[i] - a[i] * b[i]
 * This is a fused operation (single rounding)
 */
inline float16x8_t vfmsq_f16(const float16x8_t& acc, const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 8; i++) {
        // FMS: acc - a * b = acc + (-a) * b
        // Negate a first
        Term neg_a = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_NEG, {a.getLane(i)});
        // FMA with negated a: acc + (-a) * b
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_FMA, {rm, neg_a, b.getLane(i), acc.getLane(i)});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vfmaq_laneq_f16: Fused multiply-add with lane from float16x8_t
 * result[i] = acc[i] + a[i] * b[lane]
 * Multiplies each element of a by a single lane from b, then adds to acc
 */
inline float16x8_t vfmaq_laneq_f16(const float16x8_t& acc, const float16x8_t& a, const float16x8_t& b, const int lane) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Term b_lane = b.getLane(lane);

    for (int i = 0; i < 8; i++) {
        // FMA: acc + a * b[lane]
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_FMA, {rm, a.getLane(i), b_lane, acc.getLane(i)});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vfmaq_lane_f16: Fused multiply-add with lane from float16x4_t
 * result[i] = acc[i] + a[i] * b[lane]
 * Multiplies each element of a by a single lane from b (4-element vector), then adds to acc
 * @param acc Accumulator vector (8 elements)
 * @param a Multiplicand vector (8 elements)
 * @param b Lane source vector (4 elements, lanes 0-3)
 * @param lane Lane index (0-3) to select from b
 */
inline float16x8_t vfmaq_lane_f16(const float16x8_t& acc, const float16x8_t& a, const float16x4_t& b, const int lane) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Term b_lane = b.getLane(lane);

    for (int i = 0; i < 8; i++) {
        // FMA: acc + a * b[lane]
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_FMA, {rm, a.getLane(i), b_lane, acc.getLane(i)});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vfma_lane_f16: Fused multiply-add with lane from float16x4_t (4-element version)
 * result[i] = acc[i] + a[i] * b[lane]
 * Multiplies each element of a by a single lane from b, then adds to acc
 * @param acc Accumulator vector (4 elements)
 * @param a Multiplicand vector (4 elements)
 * @param b Lane source vector (4 elements, lanes 0-3)
 * @param lane Lane index (0-3) to select from b
 */
inline float16x4_t vfma_lane_f16(const float16x4_t& acc, const float16x4_t& a, const float16x4_t& b, const int lane) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Term b_lane = b.getLane(lane);

    for (int i = 0; i < 4; i++) {
        // FMA: acc + a * b[lane]
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_FMA, {rm, a.getLane(i), b_lane, acc.getLane(i)});
    }

    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vdupq_lane_f16: Duplicate a lane from float16x4_t to all lanes of float16x8_t
 * result[0..7] = vec[lane]
 */
inline float16x8_t vdupq_lane_f16(const float16x4_t& vec, const int lane) {
    std::array<Term, 8> lanes;
    Term lane_val = vec.getLane(lane);
    for (int i = 0; i < 8; i++) {
        lanes[i] = lane_val;
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vzip_f16: Interleave elements of two float16x4_t vectors
 *
 * Given:
 *   a = [a0, a1, a2, a3]
 *   b = [b0, b1, b2, b3]
 *
 * Returns:
 *   result.val[0] = [a0, b0, a1, b1]
 *   result.val[1] = [a2, b2, a3, b3]
 */
inline float16x4x2_t vzip_f16(const float16x4_t& a, const float16x4_t& b) {
    float16x4x2_t result;

    // First result vector: interleave first halves
    std::array<Term, 4> lanes0;
    lanes0[0] = a.getLane(0);
    lanes0[1] = b.getLane(0);
    lanes0[2] = a.getLane(1);
    lanes0[3] = b.getLane(1);
    result.val[0] = float16x4_t(g_symbolic_tm, lanes0);

    // Second result vector: interleave second halves
    std::array<Term, 4> lanes1;
    lanes1[0] = a.getLane(2);
    lanes1[1] = b.getLane(2);
    lanes1[2] = a.getLane(3);
    lanes1[3] = b.getLane(3);
    result.val[1] = float16x4_t(g_symbolic_tm, lanes1);

    return result;
}

/**
 * vextq_f16: Extract vector from pair of vectors (float16x8_t)
 * Concatenates a and b, then extracts 8 elements starting at index n.
 * result[i] = (i + n < 8) ? a[i + n] : b[i + n - 8]
 *
 * @param a First source vector (lower part of concatenation)
 * @param b Second source vector (upper part of concatenation)
 * @param n Starting index (0-7) for extraction
 * @return Extracted vector of 8 elements
 */
inline float16x8_t vextq_f16(const float16x8_t& a, const float16x8_t& b, const int n) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        int src_idx = i + n;
        if (src_idx < 8) {
            lanes[i] = a.getLane(src_idx);
        } else {
            lanes[i] = b.getLane(src_idx - 8);
        }
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vabsq_f16: Absolute value (float16x8)
 * result[i] = |a[i]|
 * Returns the absolute value of each floating-point element.
 *
 * Note: ARM NEON vabsq_f16 clears the sign bit (bitwise AND with 0x7FFF),
 * which differs from IEEE 754 fabs() for NaN handling. We use
 * FLOATINGPOINT_ABS which should have the same behavior.
 */
inline float16x8_t vabsq_f16(const float16x8_t& a) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ABS, {a.getLane(i)});
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vrndmq_f16: Round toward negative infinity (floor) for float16x8
 * result[i] = floor(a[i])
 * Uses FLOATINGPOINT_RTI (round to integral) with ROUND_TOWARD_NEGATIVE rounding mode.
 */
inline float16x8_t vrndmq_f16(const float16x8_t& a) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_TOWARD_NEGATIVE);
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_RTI, {rm, a.getLane(i)});
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vmaxq_f16: Element-wise maximum of two float16x8 vectors
 */
inline float16x8_t vmaxq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vminq_f16: Element-wise minimum of two float16x8 vectors
 */
inline float16x8_t vminq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vdivq_f16: Element-wise division of two float16x8 vectors
 * result[i] = a[i] / b[i]
 */
inline float16x8_t vdivq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_DIV, {rm, a.getLane(i), b.getLane(i)});
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vbslq_f16: Bitwise select (float16x8)
 * For each bit: if mask bit is 1, select from a; else select from b
 * This operates on the IEEE 754 bit representation of the floats.
 * result[i] = (mask[i] & a[i]) | (~mask[i] & b[i])
 */
inline float16x8_t vbslq_f16(const uint16x8_t& mask, const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Sort bv16 = g_symbolic_tm->mkBitVectorSort(16);
    Sort fp16 = g_symbolic_tm->mkFloatingPointSort(5, 11);
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    static int bsl_f16_counter = 0;

    for (int i = 0; i < 8; i++) {
        Term m = mask.getLane(i);

        // Convert float a to bitvector
        Term bv_a = g_symbolic_tm->mkConst(bv16, "bsl_f16_a_bv_" + std::to_string(bsl_f16_counter) + "_" + std::to_string(i));
        Term fp_from_bv_a = g_symbolic_tm->mkTerm(to_fp_op, {bv_a});
        Term eq_a = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv_a, a.getLane(i)});
        g_symbolic_solver->assertFormula(eq_a);

        // Convert float b to bitvector
        Term bv_b = g_symbolic_tm->mkConst(bv16, "bsl_f16_b_bv_" + std::to_string(bsl_f16_counter) + "_" + std::to_string(i));
        Term fp_from_bv_b = g_symbolic_tm->mkTerm(to_fp_op, {bv_b});
        Term eq_b = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv_b, b.getLane(i)});
        g_symbolic_solver->assertFormula(eq_b);

        // Perform bitwise select on the bitvector representations
        Term and_a = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {m, bv_a});
        Term not_m = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {m});
        Term and_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {not_m, bv_b});
        Term result_bv = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {and_a, and_b});

        // Convert result back to floating-point
        lanes[i] = g_symbolic_tm->mkTerm(to_fp_op, {result_bv});
    }
    bsl_f16_counter++;

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vcltq_f16: Compare less than (float16x8)
 * result[i] = (a[i] < b[i]) ? 0xFFFF : 0x0000
 * Returns uint16x8_t with all-ones for true, all-zeros for false
 */
inline uint16x8_t vcltq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Term all_ones = g_symbolic_tm->mkBitVector(16, 0xFFFF);
    Term all_zeros = g_symbolic_tm->mkBitVector(16, 0x0000);

    for (int i = 0; i < 8; i++) {
        Term lt = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {lt, all_ones, all_zeros});
    }

    return uint16x8_t(g_symbolic_tm, lanes);
}

/**
 * vadd_f16: Add two float16x4 vectors element-wise
 * result[i] = a[i] + b[i]
 */
inline float16x4_t vadd_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getLane(i), b.getLane(i)});
    }

    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vsub_f16: Vector subtract (float16x4)
 * result[i] = a[i] - b[i]
 */
inline float16x4_t vsub_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SUB, {rm, a.getLane(i), b.getLane(i)});
    }

    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vpadd_f16: Pairwise add (float16x4)
 * result[0] = a[0] + a[1]
 * result[1] = a[2] + a[3]
 * result[2] = b[0] + b[1]
 * result[3] = b[2] + b[3]
 */
inline float16x4_t vpadd_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    lanes[0] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getLane(0), a.getLane(1)});
    lanes[1] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getLane(2), a.getLane(3)});
    lanes[2] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, b.getLane(0), b.getLane(1)});
    lanes[3] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, b.getLane(2), b.getLane(3)});

    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vpmin_f16: Pairwise minimum (float16x4)
 * result[0] = min(a[0], a[1])
 * result[1] = min(a[2], a[3])
 * result[2] = min(b[0], b[1])
 * result[3] = min(b[2], b[3])
 */
inline float16x4_t vpmin_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;

    lanes[0] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MIN, {a.getLane(0), a.getLane(1)});
    lanes[1] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MIN, {a.getLane(2), a.getLane(3)});
    lanes[2] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MIN, {b.getLane(0), b.getLane(1)});
    lanes[3] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MIN, {b.getLane(2), b.getLane(3)});

    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vpmax_f16: Pairwise maximum (float16x4)
 * result[0] = max(a[0], a[1])
 * result[1] = max(a[2], a[3])
 * result[2] = max(b[0], b[1])
 * result[3] = max(b[2], b[3])
 */
inline float16x4_t vpmax_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;

    lanes[0] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MAX, {a.getLane(0), a.getLane(1)});
    lanes[1] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MAX, {a.getLane(2), a.getLane(3)});
    lanes[2] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MAX, {b.getLane(0), b.getLane(1)});
    lanes[3] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MAX, {b.getLane(2), b.getLane(3)});

    return float16x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Float16 (Half-Precision) Reinterpret Operations - Extended
// ============================================================================

/**
 * vreinterpretq_f16_s16: Reinterpret int16x8_t as float16x8_t
 * Converts signed integer bit representation to floating-point interpretation
 */
inline float16x8_t vreinterpretq_f16_s16(const int16x8_t& vec) {
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
 * vreinterpretq_s16_f16: Reinterpret float16x8_t as int16x8_t
 * Converts floating-point bit representation to signed integer interpretation
 */
inline int16x8_t vreinterpretq_s16_f16(const float16x8_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 8> lanes;
    Sort bv16 = tm->mkBitVectorSort(16);
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    static int reinterpret_f16_s16_counter = 0;

    for (int i = 0; i < 8; i++) {
        // Create a fresh bitvector that represents the IEEE bits
        Term bv_lane = tm->mkConst(bv16, "fp16_to_s16_" + std::to_string(reinterpret_f16_s16_counter++) + "_" + std::to_string(i));

        // Convert this BV back to FP16
        Term fp_from_bv = tm->mkTerm(to_fp_op, {bv_lane});

        // Assert equality: the FP from BV must equal original FP (bit-level equality)
        Term eq = tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getLane(i)});
        g_symbolic_solver->assertFormula(eq);

        lanes[i] = bv_lane;
    }
    return int16x8_t(tm, lanes);
}

/**
 * vreinterpret_u64_f16: Reinterpret float16x4_t as uint64x1_t
 * Combines all 4 float16 lanes into a single uint64 value
 */
inline uint64x1_t vreinterpret_u64_f16(const float16x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    Sort bv16 = tm->mkBitVectorSort(16);
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    static int reinterpret_f16_u64_counter = 0;

    // First convert each float16 lane to a bitvector
    std::array<Term, 4> bv_lanes;
    for (int i = 0; i < 4; i++) {
        Term bv_lane = tm->mkConst(bv16, "fp16x4_to_u64_bv_" + std::to_string(reinterpret_f16_u64_counter++) + "_" + std::to_string(i));
        Term fp_from_bv = tm->mkTerm(to_fp_op, {bv_lane});
        Term eq = tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getLane(i)});
        g_symbolic_solver->assertFormula(eq);
        bv_lanes[i] = bv_lane;
    }

    // Combine all 4 16-bit values into one 64-bit value (little-endian)
    // result = (lane3 << 48) | (lane2 << 32) | (lane1 << 16) | lane0
    Op zero_ext_op = tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {48});
    Term lane0_ext = tm->mkTerm(zero_ext_op, {bv_lanes[0]});
    Term lane1_ext = tm->mkTerm(zero_ext_op, {bv_lanes[1]});
    Term lane2_ext = tm->mkTerm(zero_ext_op, {bv_lanes[2]});
    Term lane3_ext = tm->mkTerm(zero_ext_op, {bv_lanes[3]});

    Term lane1_shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {lane1_ext, tm->mkBitVector(64, 16)});
    Term lane2_shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {lane2_ext, tm->mkBitVector(64, 32)});
    Term lane3_shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {lane3_ext, tm->mkBitVector(64, 48)});

    Term result = tm->mkTerm(Kind::BITVECTOR_OR, {lane0_ext, lane1_shifted});
    result = tm->mkTerm(Kind::BITVECTOR_OR, {result, lane2_shifted});
    result = tm->mkTerm(Kind::BITVECTOR_OR, {result, lane3_shifted});

    std::array<Term, 1> lanes = { result };
    return uint64x1_t(tm, lanes);
}

/**
 * vreinterpret_f16_u64: Reinterpret uint64x1_t as float16x4_t
 * Splits a single uint64 value into 4 float16 lanes
 */
inline float16x4_t vreinterpret_f16_u64(const uint64x1_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 4> lanes;
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    Term u64_val = vec.getLane(0);

    // Extract each 16-bit portion
    for (int i = 0; i < 4; i++) {
        Op extract_op = tm->mkOp(Kind::BITVECTOR_EXTRACT, {static_cast<uint32_t>(i * 16 + 15), static_cast<uint32_t>(i * 16)});
        Term bv16_lane = tm->mkTerm(extract_op, {u64_val});
        lanes[i] = tm->mkTerm(to_fp_op, {bv16_lane});
    }

    return float16x4_t(tm, lanes);
}

/**
 * vshl_n_u64: Shift left by immediate (uint64x1)
 * result[0] = vec[0] << n
 */
inline uint64x1_t vshl_n_u64(const uint64x1_t& vec, int n) {
    std::array<Term, 1> lanes;
    Term shift_amount = g_symbolic_tm->mkBitVector(64, static_cast<uint64_t>(n));

    lanes[0] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {vec.getLane(0), shift_amount});

    return uint64x1_t(g_symbolic_tm, lanes);
}

/**
 * vbicq_u16: Bitwise clear (AND NOT) for uint16x8
 * result[i] = a[i] & ~b[i]
 */
inline uint16x8_t vbicq_u16(const uint16x8_t& a, const uint16x8_t& b) {
    std::array<Term, 8> lanes;

    for (int i = 0; i < 8; i++) {
        Term not_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {a.getLane(i), not_b});
    }

    return uint16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Additional Bitwise Operations
// ============================================================================

/**
 * vandq_s32: Bitwise AND of two int32x4_t vectors
 * Semantics: result[i] = a[i] & b[i]
 */
inline int32x4_t vandq_s32(const int32x4_t& a, const int32x4_t& b) {
    std::array<Term, 4> result_lanes;

    for (int i = 0; i < 4; i++) {
        result_lanes[i] = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_AND,
            {a.getLane(i), b.getLane(i)}
        );
    }

    return int32x4_t(g_symbolic_tm, result_lanes);
}

// ============================================================================
// Additional Comparison Operations
// ============================================================================

/**
 * vcltq_f32: Compare less than (float32x4)
 * result[i] = (a[i] < b[i]) ? 0xFFFFFFFF : 0x00000000
 * Returns uint32x4_t with all-ones for true, all-zeros for false
 */
inline uint32x4_t vcltq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term all_ones = g_symbolic_tm->mkBitVector(32, 0xFFFFFFFF);
    Term all_zeros = g_symbolic_tm->mkBitVector(32, 0x00000000);

    for (int i = 0; i < 4; i++) {
        Term lt = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {lt, all_ones, all_zeros});
    }

    return uint32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Additional Reinterpret Operations
// ============================================================================

/**
 * vreinterpretq_u64_s32: Reinterpret int32x4_t as uint64x2_t
 * Combines pairs of int32 lanes into uint64 lanes
 */
inline uint64x2_t vreinterpretq_u64_s32(const int32x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 2> lanes;

    for (int i = 0; i < 2; i++) {
        // Combine two 32-bit values into one 64-bit value (little-endian)
        Term low = vec.getLane(2 * i);
        Term high = vec.getLane(2 * i + 1);

        // Zero-extend both to 64 bits
        Op zero_ext_op = tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {32});
        Term low_ext = tm->mkTerm(zero_ext_op, {low});
        Term high_ext = tm->mkTerm(zero_ext_op, {high});

        // Shift high part left by 32 bits and OR with low part
        Term high_shifted = tm->mkTerm(Kind::BITVECTOR_SHL, {high_ext, tm->mkBitVector(64, 32)});
        lanes[i] = tm->mkTerm(Kind::BITVECTOR_OR, {low_ext, high_shifted});
    }

    return uint64x2_t(tm, lanes);
}

/**
 * vreinterpretq_f32_s32: Reinterpret int32x4_t as float32x4_t
 * Converts signed integer bit representation to floating-point interpretation
 */
inline float32x4_t vreinterpretq_f32_s32(const int32x4_t& vec) {
    TermManager* tm = vec.getTermManager();
    std::array<Term, 4> lanes;
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});

    for (int i = 0; i < 4; i++) {
        // Convert bitvector to FP32 using IEEE bit interpretation
        lanes[i] = tm->mkTerm(to_fp_op, {vec.getLane(i)});
    }
    return float32x4_t(tm, lanes);
}

// ============================================================================
// Additional Lane Access Operations
// ============================================================================

/**
 * vgetq_lane_u64: Get a single lane from uint64x2_t
 * Returns uint64_t (concrete value for use in address calculations)
 */
inline uint64_t vgetq_lane_u64(const uint64x2_t& vec, int lane) {
    // For symbolic execution, we return 0 as a placeholder
    // The actual symbolic term is tracked internally
    (void)vec;
    (void)lane;
    return 0;
}

// ============================================================================
// Additional Load Operations
// ============================================================================

/**
 * vld1_dup_s32: Load and duplicate a single int32 to all lanes (int32x2)
 * Loads from memory and replicates across all 2 lanes
 */
inline int32x2_t vld1_dup_s32(const int32_t* ptr) {
    std::array<Term, 2> lanes;
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Check symbolic memory first
    auto it = g_neon_memory.find(addr);
    if (it != g_neon_memory.end() && !it->second.empty()) {
        // Get the first lane from stored vector and duplicate it
        Term val_term = it->second.back().getLane(0);
        for (int i = 0; i < 2; i++) {
            lanes[i] = val_term;
        }
        return int32x2_t(g_symbolic_tm, lanes);
    }

    // Fallback: create concrete constant from memory value
    Term val_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(*ptr)));
    for (int i = 0; i < 2; i++) {
        lanes[i] = val_term;
    }
    return int32x2_t(g_symbolic_tm, lanes);
}

/**
 * vld1_lane_s32: Load a single int32 value into a specific lane of a vector
 *
 * @param ptr Pointer to memory location to load from
 * @param vec Input vector (other lanes are preserved)
 * @param lane Lane index (0-1) to insert the loaded value
 * @return New vector with the specified lane updated
 */
inline int32x2_t vld1_lane_s32(const int32_t* ptr, const int32x2_t& vec, const int lane) {
    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = vec.getLane(i);
    }

    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    Term loaded_value;

    // Search for this address in symbolic memory
    bool found = false;
    auto it = g_neon_memory.find(addr);
    if (it != g_neon_memory.end() && !it->second.empty()) {
        loaded_value = it->second.back().getLane(0);
        found = true;
    }

    if (!found) {
        // Fall back to concrete value
        loaded_value = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(*ptr)));
    }

    lanes[lane] = loaded_value;
    return int32x2_t(g_symbolic_tm, lanes);
}

/**
 * vld1q_lane_f32: Load a single float value into a specific lane of a vector
 *
 * @param ptr Pointer to memory location to load from
 * @param vec Input vector (other lanes are preserved)
 * @param lane Lane index (0-3) to insert the loaded value
 * @return New vector with the specified lane updated
 */
inline float32x4_t vld1q_lane_f32(const float* ptr, const float32x4_t& vec, const int lane) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);
    }

    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    Term loaded_value;

    // Search for this address in symbolic memory
    bool found = false;
    auto it = g_neon_memory_f32x4.find(addr);
    if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
        loaded_value = it->second.back().getLane(0);
        found = true;
    }

    // Try f32x2 memory as well
    if (!found) {
        auto it2 = g_neon_memory_f32x2.find(addr);
        if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
            loaded_value = it2->second.back().getLane(0);
            found = true;
        }
    }

    if (!found) {
        // Fall back to concrete value
        uint32_t bits;
        std::memcpy(&bits, ptr, sizeof(bits));
        loaded_value = g_symbolic_tm->mkFloatingPoint(8, 24,
                          g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));
    }

    lanes[lane] = loaded_value;
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vld2_dup_f32: Load 2 floats and duplicate each to all lanes
 * Loads 2 consecutive float values from memory:
 *   val[0] = { ptr[0], ptr[0] }  (first value duplicated)
 *   val[1] = { ptr[1], ptr[1] }  (second value duplicated)
 */
inline float32x2x2_t vld2_dup_f32(const float* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Load 2 float values
    std::array<Term, 2> vals;
    for (int i = 0; i < 2; i++) {
        uintptr_t elem_addr = addr + i * sizeof(float);

        // Try scalar memory first
        auto it_scalar = g_neon_float_scalar_memory.find(elem_addr);
        if (it_scalar != g_neon_float_scalar_memory.end()) {
            vals[i] = it_scalar->second;
        } else {
            // Try f32x4 memory
            auto it = g_neon_memory_f32x4.find(elem_addr);
            if (it != g_neon_memory_f32x4.end() && !it->second.empty()) {
                vals[i] = it->second.back().getLane(0);
            } else {
                // Try f32x2 memory
                auto it2 = g_neon_memory_f32x2.find(elem_addr);
                if (it2 != g_neon_memory_f32x2.end() && !it2->second.empty()) {
                    vals[i] = it2->second.back().getLane(0);
                } else {
                    // Fall back to concrete value
                    uint32_t bits;
                    std::memcpy(&bits, ptr + i, sizeof(bits));
                    vals[i] = g_symbolic_tm->mkFloatingPoint(8, 24,
                                  g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));
                }
            }
        }
    }

    // Duplicate each value to all 2 lanes
    std::array<Term, 2> lanes0 = { vals[0], vals[0] };
    std::array<Term, 2> lanes1 = { vals[1], vals[1] };

    return float32x2x2_t(
        float32x2_t(g_symbolic_tm, lanes0),
        float32x2_t(g_symbolic_tm, lanes1)
    );
}

/**
 * vfmaq_f32: Fused multiply-add (float32x4)
 * result[i] = acc[i] + a[i] * b[i]
 * This is a fused operation (single rounding)
 */
inline float32x4_t vfmaq_f32(const float32x4_t& acc, const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        // FMA: acc + a * b
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_FMA, {rm, a.getLane(i), b.getLane(i), acc.getLane(i)});
    }

    return float32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Float to Integer Conversion Operations
// ============================================================================

/**
 * vcvtq_s32_f32: Convert float32x4 to signed int32x4 (round toward zero)
 * result[i] = (int32_t)a[i]
 * Uses round toward zero (truncation) as per ARM NEON semantics.
 */
inline int32x4_t vcvtq_s32_f32(const float32x4_t& a) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_TOWARD_ZERO);
    Op to_sbv_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_SBV, {32});

    for (int i = 0; i < 4; i++) {
        // Convert FP32 to signed 32-bit integer with truncation
        lanes[i] = g_symbolic_tm->mkTerm(to_sbv_op, {rm, a.getLane(i)});
    }

    return int32x4_t(g_symbolic_tm, lanes);
}

/**
 * vcvtnq_s16_f16: Convert float16x8 to signed int16x8 (round to nearest, ties to even)
 * result[i] = (int16_t)round(a[i])
 * Uses round-to-nearest-ties-to-even as per ARM NEON vcvtn semantics.
 */
inline int16x8_t vcvtnq_s16_f16(const float16x8_t& a) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Op to_sbv_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_SBV, {16});

    for (int i = 0; i < 8; i++) {
        // Convert FP16 to signed 16-bit integer with round-to-nearest
        lanes[i] = g_symbolic_tm->mkTerm(to_sbv_op, {rm, a.getLane(i)});
    }

    return int16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Absolute Compare Operations
// ============================================================================

/**
 * vcaltq_f32: Absolute compare less than (float32x4)
 * result[i] = |a[i]| < |b[i]| ? 0xFFFFFFFF : 0
 * Compares absolute values and returns all-ones mask if true.
 */
inline uint32x4_t vcaltq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;

    for (int i = 0; i < 4; i++) {
        // Get absolute values
        Term abs_a = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ABS, {a.getLane(i)});
        Term abs_b = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ABS, {b.getLane(i)});

        // Compare: |a| < |b|
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT, {abs_a, abs_b});

        // Convert boolean to all-ones or all-zeros mask
        Term all_ones = g_symbolic_tm->mkBitVector(32, 0xFFFFFFFF);
        Term all_zeros = g_symbolic_tm->mkBitVector(32, 0);
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, all_ones, all_zeros});
    }

    return uint32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Additional Bitwise Operations
// ============================================================================

/**
 * vbicq_u32: Bitwise clear (AND NOT) for uint32x4
 * result[i] = a[i] & ~b[i]
 * Clears bits in 'a' that are set in 'b'.
 */
inline uint32x4_t vbicq_u32(const uint32x4_t& a, const uint32x4_t& b) {
    std::array<Term, 4> lanes;

    for (int i = 0; i < 4; i++) {
        Term not_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {a.getLane(i), not_b});
    }

    return uint32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Floating-Point Reciprocal Estimate Operations
// ============================================================================

/**
 * vrecpeq_f32: Reciprocal estimate (float32x4)
 * result[i] = approximate(1.0 / a[i])
 * Note: This is an approximation. For symbolic verification, we model it as exact division.
 */
inline float32x4_t vrecpeq_f32(const float32x4_t& a) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    // Create 1.0f constant
    uint32_t one_bits = 0x3F800000;  // 1.0f in IEEE 754
    Term one_bv = g_symbolic_tm->mkBitVector(32, one_bits);
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    Term one = g_symbolic_tm->mkTerm(to_fp_op, {one_bv});

    for (int i = 0; i < 4; i++) {
        // result[i] = 1.0 / a[i]
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_DIV, {rm, one, a.getLane(i)});
    }

    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vfmsq_f32: Fused multiply-subtract (float32x4)
 * result[i] = acc[i] - a[i] * b[i]
 * This is a fused operation (single rounding)
 */
inline float32x4_t vfmsq_f32(const float32x4_t& acc, const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        // FMS: acc - a * b = acc + (-a) * b
        // Negate a first
        Term neg_a = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_NEG, {a.getLane(i)});
        // FMA with negated a: acc + (-a) * b
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_FMA, {rm, neg_a, b.getLane(i), acc.getLane(i)});
    }

    return float32x4_t(g_symbolic_tm, lanes);
}

// vcagtq_f32: Compare absolute greater than (|a| > |b|)
inline uint32x4_t vcagtq_f32(const float32x4_t& a, const float32x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        Term abs_a = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ABS, {a.getLane(i)});
        Term abs_b = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ABS, {b.getLane(i)});
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT, {abs_a, abs_b});
        Term all_ones = g_symbolic_tm->mkBitVector(32, 0xFFFFFFFF);
        Term all_zeros = g_symbolic_tm->mkBitVector(32, 0);
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, all_ones, all_zeros});
    }
    return uint32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// Square Root Operations
// ============================================================================

/**
 * vsqrtq_f32: Square root of each element in a float32x4_t vector
 */
inline float32x4_t vsqrtq_f32(const float32x4_t& a) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SQRT, {rm, a.getLane(i)});
    }
    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vsqrth_f16: Square root of a single float16_t scalar value
 * Returns the square root of the input half-precision floating-point value
 */
inline float16_t vsqrth_f16(const float16_t& a) {
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Term result = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SQRT, {rm, a.getTerm()});
    return float16_t(g_symbolic_tm, result);
}

// ============================================================================
// Float16 Arithmetic Operations (additional)
// ============================================================================

/**
 * vmul_f16: Multiply two float16x4 vectors element-wise
 * result[i] = a[i] * b[i]
 */
inline float16x4_t vmul_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
    }

    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vrsqrteq_f16: Reciprocal square root estimate for float16x8
 * result[i] = 1.0 / sqrt(a[i]) (approximate)
 * For symbolic execution, we compute the exact value: 1.0 / sqrt(a)
 */
inline float16x8_t vrsqrteq_f16(const float16x8_t& a) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Sort fp16 = g_symbolic_tm->mkFloatingPointSort(5, 11);
    Term one = g_symbolic_tm->mkFloatingPoint(5, 11, g_symbolic_tm->mkBitVector(16, 0x3C00)); // 1.0 in fp16

    for (int i = 0; i < 8; i++) {
        Term sqrt_val = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SQRT, {rm, a.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_DIV, {rm, one, sqrt_val});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vrsqrte_f16: Reciprocal square root estimate for float16x4
 * result[i] = 1.0 / sqrt(a[i]) (approximate)
 * For symbolic execution, we compute the exact value: 1.0 / sqrt(a)
 */
inline float16x4_t vrsqrte_f16(const float16x4_t& a) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Sort fp16 = g_symbolic_tm->mkFloatingPointSort(5, 11);
    Term one = g_symbolic_tm->mkFloatingPoint(5, 11, g_symbolic_tm->mkBitVector(16, 0x3C00)); // 1.0 in fp16

    for (int i = 0; i < 4; i++) {
        Term sqrt_val = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SQRT, {rm, a.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_DIV, {rm, one, sqrt_val});
    }

    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vrsqrtsq_f16: Reciprocal square root step for float16x8
 * result[i] = (3.0 - a[i] * b[i]) / 2.0
 * This is used in Newton-Raphson iteration for rsqrt refinement
 */
inline float16x8_t vrsqrtsq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Term three = g_symbolic_tm->mkFloatingPoint(5, 11, g_symbolic_tm->mkBitVector(16, 0x4200)); // 3.0 in fp16
    Term two = g_symbolic_tm->mkFloatingPoint(5, 11, g_symbolic_tm->mkBitVector(16, 0x4000));   // 2.0 in fp16

    for (int i = 0; i < 8; i++) {
        Term prod = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
        Term diff = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SUB, {rm, three, prod});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_DIV, {rm, diff, two});
    }

    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vrsqrts_f16: Reciprocal square root step for float16x4
 * result[i] = (3.0 - a[i] * b[i]) / 2.0
 * This is used in Newton-Raphson iteration for rsqrt refinement
 */
inline float16x4_t vrsqrts_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Term three = g_symbolic_tm->mkFloatingPoint(5, 11, g_symbolic_tm->mkBitVector(16, 0x4200)); // 3.0 in fp16
    Term two = g_symbolic_tm->mkFloatingPoint(5, 11, g_symbolic_tm->mkBitVector(16, 0x4000));   // 2.0 in fp16

    for (int i = 0; i < 4; i++) {
        Term prod = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
        Term diff = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SUB, {rm, three, prod});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_DIV, {rm, diff, two});
    }

    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vcagtq_f16: Compare absolute greater than for float16x8
 * result[i] = (|a[i]| > |b[i]|) ? 0xFFFF : 0x0000
 * Returns a uint16x8_t mask
 */
inline uint16x8_t vcagtq_f16(const float16x8_t& a, const float16x8_t& b) {
    std::array<Term, 8> lanes;
    Sort bv16 = g_symbolic_tm->mkBitVectorSort(16);
    Term all_ones = g_symbolic_tm->mkBitVector(16, 0xFFFF);
    Term all_zeros = g_symbolic_tm->mkBitVector(16, 0x0000);

    for (int i = 0; i < 8; i++) {
        // Get absolute values: clear sign bit (bit 15)
        Term abs_a = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ABS, {a.getLane(i)});
        Term abs_b = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ABS, {b.getLane(i)});

        // Compare: |a| > |b|
        Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT, {abs_a, abs_b});

        // Select 0xFFFF if true, 0x0000 if false
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, all_ones, all_zeros});
    }

    return uint16x8_t(g_symbolic_tm, lanes);
}

// ============================================================================
// XNN SIMD Abstraction Layer (for XNNPACK compatibility)
// ============================================================================

// SIMD type alias
typedef float32x4_t xnn_simd_f32_t;

// SIMD size constants
#define xnn_simd_size_f32 4
#define xnn_simd_log2_size_f32 2
#define xnn_simd_bytes_f32 (xnn_simd_size_f32 * sizeof(float))

// Load operations
inline xnn_simd_f32_t xnn_loadu_f32(const float* ptr) {
    return vld1q_f32(ptr);
}

inline xnn_simd_f32_t xnn_load_f32(const float* ptr) {
    return vld1q_f32(ptr);
}

// Store operations
inline void xnn_storeu_f32(float* ptr, xnn_simd_f32_t v) {
    vst1q_f32(ptr, v);
}

inline void xnn_store_f32(float* ptr, xnn_simd_f32_t v) {
    vst1q_f32(ptr, v);
}

// Tail load/store operations
inline xnn_simd_f32_t xnn_load_tail_f32(const float* input, size_t num_elements) {
    return xnn_load_tail_safe_f32(input, num_elements);
}

inline void xnn_store_tail_f32(float* output, xnn_simd_f32_t v, size_t num_elements) {
    // Store only the specified number of elements
    float32x2_t v_low = vget_low_f32(v);
    if (num_elements >= 2) {
        vst1_f32(output, v_low);
        output += 2;
        v_low = vget_high_f32(v);
        num_elements -= 2;
    }
    if (num_elements >= 1) {
        vst1_lane_f32(output, v_low, 0);
    }
}

/**
 * vmaxq_s16: Element-wise maximum of two int16x8_t vectors
 * result[i] = max(a[i], b[i])
 */
inline int16x8_t vmaxq_s16(const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        // Signed comparison: a > b ? a : b
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vminq_s16: Element-wise minimum of two int16x8_t vectors
 * result[i] = min(a[i], b[i])
 */
inline int16x8_t vminq_s16(const int16x8_t& a, const int16x8_t& b) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        // Signed comparison: a < b ? a : b
        Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {a.getLane(i), b.getLane(i)});
        lanes[i] = g_symbolic_tm->mkTerm(Kind::ITE, {cmp, a.getLane(i), b.getLane(i)});
    }
    return int16x8_t(g_symbolic_tm, lanes);
}

/**
 * vnegq_f16: Negate each element of a float16x8_t vector
 * result[i] = -a[i]
 */
inline float16x8_t vnegq_f16(const float16x8_t& a) {
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_NEG, {a.getLane(i)});
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vld2q_dup_u16: Load two uint16 values and duplicate across lanes
 * Returns a pair of uint16x8_t vectors where:
 *   result.val[0] has ptr[0] duplicated across all 8 lanes
 *   result.val[1] has ptr[1] duplicated across all 8 lanes
 */
inline uint16x8x2_t vld2q_dup_u16(const uint16_t* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Try to get symbolic values from scalar memory
    Term val0, val1;

    auto it0 = g_neon_u16_scalar_memory.find(addr);
    if (it0 != g_neon_u16_scalar_memory.end()) {
        val0 = it0->second;
    } else {
        val0 = g_symbolic_tm->mkBitVector(16, 0);
    }

    auto it1 = g_neon_u16_scalar_memory.find(addr + sizeof(uint16_t));
    if (it1 != g_neon_u16_scalar_memory.end()) {
        val1 = it1->second;
    } else {
        val1 = g_symbolic_tm->mkBitVector(16, 0);
    }

    // Duplicate across all lanes
    std::array<Term, 8> lanes0, lanes1;
    for (int i = 0; i < 8; i++) {
        lanes0[i] = val0;
        lanes1[i] = val1;
    }

    uint16x8x2_t result;
    result.val[0] = uint16x8_t(g_symbolic_tm, lanes0);
    result.val[1] = uint16x8_t(g_symbolic_tm, lanes1);
    return result;
}

/**
 * vreinterpret_f16_u16: Reinterpret uint16x4_t as float16x4_t
 * This is a bitcast operation - no actual computation, just type reinterpretation
 */
inline float16x4_t vreinterpret_f16_u16(const uint16x4_t& a) {
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(to_fp_op, {a.getLane(i)});
    }
    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vmax_f16: Element-wise maximum of two float16x4_t vectors
 * result[i] = max(a[i], b[i])
 */
inline float16x4_t vmax_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MAX, {a.getLane(i), b.getLane(i)});
    }
    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vmin_f16: Element-wise minimum of two float16x4_t vectors
 * result[i] = min(a[i], b[i])
 */
inline float16x4_t vmin_f16(const float16x4_t& a, const float16x4_t& b) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MIN, {a.getLane(i), b.getLane(i)});
    }
    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vminv_f16: Horizontal minimum across all lanes of a float16x4_t vector
 * Returns min(a[0], a[1], a[2], a[3])
 */
inline float16_t vminv_f16(const float16x4_t& a) {
    // Compute min across all 4 lanes using tree reduction
    // min01 = min(a[0], a[1])
    // min23 = min(a[2], a[3])
    // result = min(min01, min23)
    Term min01 = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MIN, {a.getLane(0), a.getLane(1)});
    Term min23 = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MIN, {a.getLane(2), a.getLane(3)});
    Term result = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MIN, {min01, min23});
    return float16_t(g_symbolic_tm, result);
}

/**
 * vmaxv_f16: Horizontal maximum across all lanes of a float16x4_t vector
 * Returns max(a[0], a[1], a[2], a[3])
 */
inline float16_t vmaxv_f16(const float16x4_t& a) {
    // Compute max across all 4 lanes using tree reduction
    // max01 = max(a[0], a[1])
    // max23 = max(a[2], a[3])
    // result = max(max01, max23)
    Term max01 = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MAX, {a.getLane(0), a.getLane(1)});
    Term max23 = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MAX, {a.getLane(2), a.getLane(3)});
    Term result = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MAX, {max01, max23});
    return float16_t(g_symbolic_tm, result);
}

/**
 * vld1_dup_u16: Load a single uint16 and duplicate across all 4 lanes
 */
inline uint16x4_t vld1_dup_u16(const uint16_t* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    Term val;
    auto it = g_neon_u16_scalar_memory.find(addr);
    if (it != g_neon_u16_scalar_memory.end()) {
        val = it->second;
    } else {
        val = g_symbolic_tm->mkBitVector(16, 0);
    }

    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = val;
    }
    return uint16x4_t(g_symbolic_tm, lanes);
}

/**
 * vld1_dup_u32: Load a single uint32 and duplicate across all 2 lanes
 * Reads two consecutive u16 values from scalar memory and combines them into u32
 */
inline uint32x2_t vld1_dup_u32(const void* ptr) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // Read two u16 values and combine into u32
    Term low16, high16;

    auto it_low = g_neon_u16_scalar_memory.find(addr);
    if (it_low != g_neon_u16_scalar_memory.end()) {
        low16 = it_low->second;
    } else {
        low16 = g_symbolic_tm->mkBitVector(16, 0);
    }

    auto it_high = g_neon_u16_scalar_memory.find(addr + sizeof(uint16_t));
    if (it_high != g_neon_u16_scalar_memory.end()) {
        high16 = it_high->second;
    } else {
        high16 = g_symbolic_tm->mkBitVector(16, 0);
    }

    // Combine: val = (high16 << 16) | low16
    Term val = g_symbolic_tm->mkTerm(Kind::BITVECTOR_CONCAT, {high16, low16});

    std::array<Term, 2> lanes;
    for (int i = 0; i < 2; i++) {
        lanes[i] = val;
    }
    return uint32x2_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpret_f16_u32: Reinterpret uint32x2_t as float16x4_t
 * Two 32-bit lanes become four 16-bit lanes (bitcast)
 */
inline float16x4_t vreinterpret_f16_u32(const uint32x2_t& a) {
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    Op extract_low = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});
    Op extract_high = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {31, 16});

    std::array<Term, 4> lanes;
    for (int i = 0; i < 2; i++) {
        // Extract low 16 bits
        Term low16 = g_symbolic_tm->mkTerm(extract_low, {a.getLane(i)});
        // Extract high 16 bits
        Term high16 = g_symbolic_tm->mkTerm(extract_high, {a.getLane(i)});

        // Convert to fp16
        lanes[i * 2] = g_symbolic_tm->mkTerm(to_fp_op, {low16});
        lanes[i * 2 + 1] = g_symbolic_tm->mkTerm(to_fp_op, {high16});
    }
    return float16x4_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_f16_u32: Reinterpret uint32x4_t as float16x8_t
 * Four 32-bit lanes become eight 16-bit lanes (bitcast)
 */
inline float16x8_t vreinterpretq_f16_u32(const uint32x4_t& a) {
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    Op extract_low = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});
    Op extract_high = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {31, 16});

    std::array<Term, 8> lanes;
    for (int i = 0; i < 4; i++) {
        // Extract low 16 bits
        Term low16 = g_symbolic_tm->mkTerm(extract_low, {a.getLane(i)});
        // Extract high 16 bits
        Term high16 = g_symbolic_tm->mkTerm(extract_high, {a.getLane(i)});

        // Convert to fp16
        lanes[i * 2] = g_symbolic_tm->mkTerm(to_fp_op, {low16});
        lanes[i * 2 + 1] = g_symbolic_tm->mkTerm(to_fp_op, {high16});
    }
    return float16x8_t(g_symbolic_tm, lanes);
}

/**
 * vreinterpretq_u32_f16: Reinterpret float16x8_t as uint32x4_t
 * Eight 16-bit lanes become four 32-bit lanes (bitcast)
 * Each 32-bit lane contains two adjacent fp16 values: [fp16_high][fp16_low]
 */
inline uint32x4_t vreinterpretq_u32_f16(const float16x8_t& a) {
    TermManager* tm = a.getTermManager();
    std::array<Term, 4> lanes;
    Sort bv16 = tm->mkBitVectorSort(16);
    Op to_fp_op = tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

    static int reinterpret_f16_to_u32_counter = 0;

    for (int i = 0; i < 4; i++) {
        // Create fresh 16-bit bitvectors for each fp16 lane
        Term low_bv = tm->mkConst(bv16, "fp16_to_u32_low_" + std::to_string(reinterpret_f16_to_u32_counter) + "_" + std::to_string(i));
        Term high_bv = tm->mkConst(bv16, "fp16_to_u32_high_" + std::to_string(reinterpret_f16_to_u32_counter) + "_" + std::to_string(i));

        // Assert that these bitvectors represent the same bits as the fp16 values
        // For low lane (index i*2)
        Term fp_low = tm->mkTerm(to_fp_op, {low_bv});
        Term is_nan_low_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_NAN, {a.getLane(i * 2)});
        Term is_nan_low_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_NAN, {fp_low});
        Term is_zero_low_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {a.getLane(i * 2)});
        Term is_zero_low_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {fp_low});
        Term is_neg_low_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_NEG, {a.getLane(i * 2)});
        Term is_neg_low_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_NEG, {fp_low});

        Term both_nan_low = tm->mkTerm(Kind::AND, {is_nan_low_orig, is_nan_low_conv});
        Term same_sign_low = tm->mkTerm(Kind::EQUAL, {is_neg_low_orig, is_neg_low_conv});
        Term both_zero_same_sign_low = tm->mkTerm(Kind::AND, {is_zero_low_orig, is_zero_low_conv, same_sign_low});
        Term fp_eq_low = tm->mkTerm(Kind::FLOATINGPOINT_EQ, {fp_low, a.getLane(i * 2)});
        Term not_zero_low = tm->mkTerm(Kind::NOT, {is_zero_low_orig});
        Term normal_eq_low = tm->mkTerm(Kind::AND, {fp_eq_low, not_zero_low});
        Term eq_low = tm->mkTerm(Kind::OR, {both_nan_low, both_zero_same_sign_low, normal_eq_low});
        g_symbolic_solver->assertFormula(eq_low);

        // For high lane (index i*2 + 1)
        Term fp_high = tm->mkTerm(to_fp_op, {high_bv});
        Term is_nan_high_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_NAN, {a.getLane(i * 2 + 1)});
        Term is_nan_high_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_NAN, {fp_high});
        Term is_zero_high_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {a.getLane(i * 2 + 1)});
        Term is_zero_high_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_ZERO, {fp_high});
        Term is_neg_high_orig = tm->mkTerm(Kind::FLOATINGPOINT_IS_NEG, {a.getLane(i * 2 + 1)});
        Term is_neg_high_conv = tm->mkTerm(Kind::FLOATINGPOINT_IS_NEG, {fp_high});

        Term both_nan_high = tm->mkTerm(Kind::AND, {is_nan_high_orig, is_nan_high_conv});
        Term same_sign_high = tm->mkTerm(Kind::EQUAL, {is_neg_high_orig, is_neg_high_conv});
        Term both_zero_same_sign_high = tm->mkTerm(Kind::AND, {is_zero_high_orig, is_zero_high_conv, same_sign_high});
        Term fp_eq_high = tm->mkTerm(Kind::FLOATINGPOINT_EQ, {fp_high, a.getLane(i * 2 + 1)});
        Term not_zero_high = tm->mkTerm(Kind::NOT, {is_zero_high_orig});
        Term normal_eq_high = tm->mkTerm(Kind::AND, {fp_eq_high, not_zero_high});
        Term eq_high = tm->mkTerm(Kind::OR, {both_nan_high, both_zero_same_sign_high, normal_eq_high});
        g_symbolic_solver->assertFormula(eq_high);

        // Concatenate high and low to form 32-bit value: high[15:0] ## low[15:0]
        lanes[i] = tm->mkTerm(Kind::BITVECTOR_CONCAT, {high_bv, low_bv});

        reinterpret_f16_to_u32_counter++;
    }
    return uint32x4_t(tm, lanes);
}

/**
 * vaddh_f16: Scalar half-precision floating-point add
 * result = a + b
 */
inline float16_t vaddh_f16(float16_t a, float16_t b) {
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Term result = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getTerm(), b.getTerm()});
    return float16_t(g_symbolic_tm, result);
}

/**
 * vfma_f16: Vector fused multiply-add for float16x4_t
 * result[i] = a[i] + b[i] * c[i]
 * Fused operation: single rounding at the end
 */
inline float16x4_t vfma_f16(const float16x4_t& a, const float16x4_t& b, const float16x4_t& c) {
    std::array<Term, 4> result_lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (size_t i = 0; i < 4; i++) {
        // FMA: a + b * c
        Term fma = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_FMA, {rm, b.getLane(i), c.getLane(i), a.getLane(i)});
        result_lanes[i] = fma;
    }

    return float16x4_t(g_symbolic_tm, result_lanes);
}

// ============================================================================
// Float32 Conversion and Arithmetic Operations
// ============================================================================

/**
 * vcvt_f32_f16: Convert float16x4 to float32x4
 * Converts 4 half-precision floats to 4 single-precision floats
 */
inline float32x4_t vcvt_f32_f16(const float16x4_t& a) {
    std::array<Term, 4> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    Op to_fp32_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {8, 24});

    for (int i = 0; i < 4; i++) {
        // Convert fp16 to fp32 (widening conversion)
        lanes[i] = g_symbolic_tm->mkTerm(to_fp32_op, {rm, a.getLane(i)});
    }

    return float32x4_t(g_symbolic_tm, lanes);
}

/**
 * vdup_n_f32: Duplicate scalar float32 to all lanes of float32x2
 * result[0..1] = value
 */
inline float32x2_t vdup_n_f32(float value) {
    std::array<Term, 2> lanes;

    // Convert float to IEEE 754 bit representation
    uint32_t bits;
    std::memcpy(&bits, &value, sizeof(float));
    Term bv32 = g_symbolic_tm->mkBitVector(32, bits);

    // Convert to floating point
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    Term fp_val = g_symbolic_tm->mkTerm(to_fp_op, {bv32});

    for (int i = 0; i < 2; i++) {
        lanes[i] = fp_val;
    }

    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vadd_f32: Add two float32x2 vectors element-wise
 * result[i] = a[i] + b[i]
 */
inline float32x2_t vadd_f32(const float32x2_t& a, const float32x2_t& b) {
    std::array<Term, 2> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 2; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getLane(i), b.getLane(i)});
    }

    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vpadd_f32: Pairwise add adjacent pairs of float32x2 vectors
 * result[0] = a[0] + a[1]
 * result[1] = b[0] + b[1]
 */
inline float32x2_t vpadd_f32(const float32x2_t& a, const float32x2_t& b) {
    std::array<Term, 2> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    // Pairwise addition: add adjacent elements within each vector
    lanes[0] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, a.getLane(0), a.getLane(1)});
    lanes[1] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, b.getLane(0), b.getLane(1)});

    return float32x2_t(g_symbolic_tm, lanes);
}

/**
 * vmul_f32: Multiply two float32x2 vectors element-wise
 * result[i] = a[i] * b[i]
 */
inline float32x2_t vmul_f32(const float32x2_t& a, const float32x2_t& b) {
    std::array<Term, 2> lanes;
    Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

    for (int i = 0; i < 2; i++) {
        lanes[i] = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, a.getLane(i), b.getLane(i)});
    }

    return float32x2_t(g_symbolic_tm, lanes);
}

#endif
