#pragma once
// Per-element comparison dispatched by ElementKind — cvc5 port.

#include "context.hpp"
#include "symbolic_buffer.hpp"

#include <cvc5/cvc5.h>
#include <vector>

namespace salt_cvc5 {

inline Term element_equal(TermManager& tm, Term a, Term b, ElementKind kind) {
    switch (kind) {
    case ElementKind::SINT:
    case ElementKind::UINT:
    case ElementKind::MASK:
        return tm.mkTerm(Kind::EQUAL, {a, b});
    case ElementKind::F32: {
        Op fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
        Term a_fp = tm.mkTerm(fp_op, {a});
        Term b_fp = tm.mkTerm(fp_op, {b});
        Term a_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {a_fp});
        Term b_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {b_fp});
        Term both_nan = tm.mkTerm(Kind::AND, {a_nan, b_nan});
        Term bit_eq = tm.mkTerm(Kind::EQUAL, {a, b});
        return tm.mkTerm(Kind::OR, {both_nan, bit_eq});
    }
    case ElementKind::F16: {
        Op fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
        Term a_fp = tm.mkTerm(fp_op, {a});
        Term b_fp = tm.mkTerm(fp_op, {b});
        Term a_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {a_fp});
        Term b_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {b_fp});
        Term both_nan = tm.mkTerm(Kind::AND, {a_nan, b_nan});
        Term bit_eq = tm.mkTerm(Kind::EQUAL, {a, b});
        return tm.mkTerm(Kind::OR, {both_nan, bit_eq});
    }
    case ElementKind::F64: {
        Op fp_op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {11, 53});
        Term a_fp = tm.mkTerm(fp_op, {a});
        Term b_fp = tm.mkTerm(fp_op, {b});
        Term a_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {a_fp});
        Term b_nan = tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN, {b_fp});
        Term both_nan = tm.mkTerm(Kind::AND, {a_nan, b_nan});
        Term bit_eq = tm.mkTerm(Kind::EQUAL, {a, b});
        return tm.mkTerm(Kind::OR, {both_nan, bit_eq});
    }
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

} // namespace salt_cvc5
