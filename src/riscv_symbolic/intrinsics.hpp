#ifndef RISCV_SYMBOLIC_INTRINSICS_HPP
#define RISCV_SYMBOLIC_INTRINSICS_HPP

#include "types.hpp"
#include "memory.hpp"
#include "../symbolic_common.hpp"
#include <cstdint>
#include <string>

/**
 * RISC-V Vector Extension Intrinsic Symbolic Implementations
 */

// ============================================================================
// Vector Length Setting Instructions
// ============================================================================

/**
 * __riscv_vsetvl_e32m1: Set vector length for 32-bit elements with LMUL=1
 * Semantics: Returns the actual vector length that will be used
 */
inline size_t __riscv_vsetvl_e32m1(size_t avl) {
    g_current_vl = avl;
    return avl;
}

/**
 * __riscv_vsetvl_e8m1: Set vector length for 8-bit elements with LMUL=1
 */
inline size_t __riscv_vsetvl_e8m1(size_t avl) {
    g_current_vl = avl;
    return avl;
}

// ============================================================================
// Arithmetic Operations (int32m1)
// ============================================================================

inline vint32m1_t __riscv_vadd_vv_i32m1(const vint32m1_t& a, const vint32m1_t& b, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    for (size_t i = 0; i < vl; i++) {
        result_elements.push_back(
            g_symbolic_tm->mkTerm(
                Kind::BITVECTOR_ADD,
                {a.getElement(i), b.getElement(i)}
            )
        );
    }

    return vint32m1_t(g_symbolic_tm, result_elements);
}

inline vint32m1_t __riscv_vmul_vx_i32m1(const vint32m1_t& vec, int32_t scalar, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
    Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

    for (size_t i = 0; i < vl; i++) {
        result_elements.push_back(
            g_symbolic_tm->mkTerm(
                Kind::BITVECTOR_MULT,
                {vec.getElement(i), scalar_term}
            )
        );
    }

    return vint32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Arithmetic Operations (int32m4)
// ============================================================================

/**
 * __riscv_vadd_vv_i32m4: Add two vectors element-wise (int32m4)
 */
inline vint32m4_t __riscv_vadd_vv_i32m4(const vint32m4_t& a, const vint32m4_t& b, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    for (size_t i = 0; i < vl; i++) {
        result_elements.push_back(
            g_symbolic_tm->mkTerm(
                Kind::BITVECTOR_ADD,
                {a.getElement(i), b.getElement(i)}
            )
        );
    }

    return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vadd_vx_i32m4: Add scalar to vector (int32m4)
 */
inline vint32m4_t __riscv_vadd_vx_i32m4(const vint32m4_t& vec, int32_t scalar, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
    Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

    for (size_t i = 0; i < vl; i++) {
        result_elements.push_back(
            g_symbolic_tm->mkTerm(
                Kind::BITVECTOR_ADD,
                {vec.getElement(i), scalar_term}
            )
        );
    }

    return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmul_vx_i32m4: Multiply vector by scalar (int32m4)
 */
inline vint32m4_t __riscv_vmul_vx_i32m4(const vint32m4_t& vec, int32_t scalar, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
    Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

    for (size_t i = 0; i < vl; i++) {
        result_elements.push_back(
            g_symbolic_tm->mkTerm(
                Kind::BITVECTOR_MULT,
                {vec.getElement(i), scalar_term}
            )
        );
    }

    return vint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Shift Operations
// ============================================================================

/**
 * __riscv_vsra_vx_i32m4: Arithmetic right shift by scalar
 */
inline vint32m4_t __riscv_vsra_vx_i32m4(const vint32m4_t& vec, uint32_t shift, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    Term shift_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));

    for (size_t i = 0; i < vl; i++) {
        result_elements.push_back(
            g_symbolic_tm->mkTerm(
                Kind::BITVECTOR_ASHR,  // Arithmetic shift right
                {vec.getElement(i), shift_term}
            )
        );
    }

    return vint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Comparison Operations
// ============================================================================

/**
 * __riscv_vmax_vx_i32m4: Maximum of vector and scalar
 */
inline vint32m4_t __riscv_vmax_vx_i32m4(const vint32m4_t& vec, int32_t scalar, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
    Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

    for (size_t i = 0; i < vl; i++) {
        // max(a, b) = (a > b) ? a : b
        Term cmp = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_SGT,  // Signed greater than
            {vec.getElement(i), scalar_term}
        );
        result_elements.push_back(
            g_symbolic_tm->mkTerm(
                Kind::ITE,  // If-then-else
                {cmp, vec.getElement(i), scalar_term}
            )
        );
    }

    return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmin_vx_i32m4: Minimum of vector and scalar
 */
inline vint32m4_t __riscv_vmin_vx_i32m4(const vint32m4_t& vec, int32_t scalar, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
    Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

    for (size_t i = 0; i < vl; i++) {
        // min(a, b) = (a < b) ? a : b
        Term cmp = g_symbolic_tm->mkTerm(
            Kind::BITVECTOR_SLT,  // Signed less than
            {vec.getElement(i), scalar_term}
        );
        result_elements.push_back(
            g_symbolic_tm->mkTerm(
                Kind::ITE,
                {cmp, vec.getElement(i), scalar_term}
            )
        );
    }

    return vint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Conversion Operations
// ============================================================================

/**
 * __riscv_vsext_vf4_i32m4: Sign-extend int8 to int32 (widening by 4x)
 */
inline vint32m4_t __riscv_vsext_vf4_i32m4(const vint8m1_t& vec, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {24});
    for (size_t i = 0; i < vl; i++) {
        Term extended = g_symbolic_tm->mkTerm(
            sext_op,
            {vec.getElement(i)}
        );
        result_elements.push_back(extended);
    }

    return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vncvt_x_x_w_i16m2: Narrow int32m4 to int16m2 (truncate upper bits)
 */
inline vint16m2_t __riscv_vncvt_x_x_w_i16m2(const vint32m4_t& vec, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    Op extract_op_16 = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});
    for (size_t i = 0; i < vl; i++) {
        // Extract lower 16 bits
        Term narrowed = g_symbolic_tm->mkTerm(
            extract_op_16,
            {vec.getElement(i)}
        );
        result_elements.push_back(narrowed);
    }

    return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vncvt_x_x_w_i8m1: Narrow int16m2 to int8m1 (truncate upper bits)
 */
inline vint8m1_t __riscv_vncvt_x_x_w_i8m1(const vint16m2_t& vec, size_t vl) {
    std::vector<Term> result_elements;
    result_elements.reserve(vl);

    Op extract_op_8 = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});
    for (size_t i = 0; i < vl; i++) {
        // Extract lower 8 bits
        Term narrowed = g_symbolic_tm->mkTerm(
            extract_op_8,
            {vec.getElement(i)}
        );
        result_elements.push_back(narrowed);
    }

    return vint8m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Helper Functions
// ============================================================================

// Helper to convert a term to the expected bit-width
inline Term convertToWidthRV(Term term, size_t target_width) {
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
