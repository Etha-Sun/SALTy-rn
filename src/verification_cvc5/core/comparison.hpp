#pragma once
// Per-element comparison dispatched by ElementKind — cvc5 port.

#include "context.hpp"
#include "symbolic_buffer.hpp"

#include <cvc5/cvc5.h>
#include <vector>

namespace salt_cvc5 {

// FP-aware equality at sort (eb, sb): treats +0 == -0 (avoids spurious
// counterexamples from BV-rep ambiguity for FP zero), is bit-equivalent for
// normal values, and false for NaN-vs-anything except NaN-vs-NaN (which the
// `both_nan` clause accepts as the standard NaN-equivalent verification rule).
inline Term _fp_element_equal(TermManager& tm, Term a, Term b, uint32_t eb, uint32_t sb) {
    Op fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {eb, sb});
    Term a_fp = tm.mkTerm(fp_op, {a});
    Term b_fp = tm.mkTerm(fp_op, {b});
    Term a_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {a_fp});
    Term b_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {b_fp});
    Term both_nan = tm.mkTerm(Kind::AND, {a_nan, b_nan});
    Term fp_eq = tm.mkTerm(Kind::FLOATINGPOINT_EQ, {a_fp, b_fp});
    return tm.mkTerm(Kind::OR, {both_nan, fp_eq});
}

inline Term element_equal(TermManager& tm, Term a, Term b, ElementKind kind) {
    switch (kind) {
    case ElementKind::SINT:
    case ElementKind::UINT:
    case ElementKind::MASK: return tm.mkTerm(Kind::EQUAL, {a, b});
    case ElementKind::F16:  return _fp_element_equal(tm, a, b, 5, 11);
    case ElementKind::BF16: return _fp_element_equal(tm, a, b, 8, 8);  // 1+8 exp + 7 mant
    case ElementKind::F32:  return _fp_element_equal(tm, a, b, 8, 24);
    case ElementKind::F64:  return _fp_element_equal(tm, a, b, 11, 53);
    }
    __builtin_unreachable();
}

// ---------------------------------------------------------------------------
// Buffer-level comparison: compare num_elements elements of elem_bytes width.
// Returns a single Bool term: conjunction of all per-element equalities.
// Mirror of src/verification/core/comparison.hpp's buffers_equal.
// ---------------------------------------------------------------------------
inline Term buffers_equal(TermManager& tm,
                           const SymbolicBuffer& a,
                           const SymbolicBuffer& b,
                           size_t num_elements,
                           size_t elem_bytes,
                           ElementKind kind) {
    size_t elem_bits = elem_bytes * 8;
    std::vector<Term> equalities;
    equalities.reserve(num_elements);

    for (size_t i = 0; i < num_elements; i++) {
        size_t offset = i * elem_bytes;
        Term a_elem = a.loadScalar(offset, elem_bits);
        Term b_elem = b.loadScalar(offset, elem_bits);
        equalities.push_back(element_equal(tm, a_elem, b_elem, kind));
    }

    if (equalities.size() == 1) return equalities[0];

    // AND all equalities together.
    Term result = equalities[0];
    for (size_t i = 1; i < equalities.size(); i++) {
        result = tm.mkTerm(Kind::AND, {result, equalities[i]});
    }
    return result;
}

// Strided 2D logical output region: compares rows×cols elements at affine
// offsets r*row_stride + c*col_stride (bytes), ignoring everything in between
// (e.g. row padding). Used for non-contiguous outputs (transpose, GEMM).
inline Term buffers_equal_strided(TermManager& tm,
                                  const SymbolicBuffer& a,
                                  const SymbolicBuffer& b,
                                  size_t rows, size_t cols,
                                  size_t row_stride, size_t col_stride,
                                  size_t elem_bytes,
                                  ElementKind kind) {
    size_t elem_bits = elem_bytes * 8;
    std::vector<Term> equalities;
    equalities.reserve(rows * cols);
    for (size_t r = 0; r < rows; r++) {
        for (size_t c = 0; c < cols; c++) {
            size_t off = r * row_stride + c * col_stride;
            equalities.push_back(element_equal(tm, a.loadScalar(off, elem_bits),
                                               b.loadScalar(off, elem_bits), kind));
        }
    }
    if (equalities.empty()) return tm.mkTrue();
    Term result = equalities[0];
    for (size_t i = 1; i < equalities.size(); i++) {
        result = tm.mkTerm(Kind::AND, {result, equalities[i]});
    }
    return result;
}

} // namespace salt_cvc5
