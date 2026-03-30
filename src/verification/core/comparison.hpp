#pragma once
// Comparison functions dispatched by ElementKind.
// element_equal: per-element comparison
// buffers_equal: element-wise comparison over two SymbolicBuffers

#include "context.hpp"
#include "symbolic_buffer.hpp"

#include <bitwuzla/cpp/bitwuzla.h>

#include <vector>

namespace salt {

using namespace bitwuzla;

// ---------------------------------------------------------------------------
// Per-element comparison
//   SINT/UINT/MASK → raw BV equality
//   F16/F32/F64    → NaN-equivalent: isNaN(a) ? isNaN(b) : bit-exact
// ---------------------------------------------------------------------------
inline Term element_equal(TermManager& tm, Term a, Term b, ElementKind kind) {
    switch (kind) {
    case ElementKind::SINT:
    case ElementKind::UINT:
    case ElementKind::MASK:
        return tm.mk_term(Kind::EQUAL, {a, b});

    case ElementKind::F32: {
        // Interpret BV as IEEE 754 float32 for NaN check
        Sort fp32 = tm.mk_fp_sort(8, 24);
        Term a_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {a}, {8, 24});
        Term b_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {b}, {8, 24});
        Term a_nan = tm.mk_term(Kind::FP_IS_NAN, {a_fp});
        Term b_nan = tm.mk_term(Kind::FP_IS_NAN, {b_fp});
        Term both_nan = tm.mk_term(Kind::AND, {a_nan, b_nan});
        Term bit_eq = tm.mk_term(Kind::EQUAL, {a, b});
        // NaN-equivalent: both NaN OR bit-exact
        return tm.mk_term(Kind::OR, {both_nan, bit_eq});
    }

    case ElementKind::F16: {
        Sort fp16 = tm.mk_fp_sort(5, 11);
        Term a_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {a}, {5, 11});
        Term b_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {b}, {5, 11});
        Term a_nan = tm.mk_term(Kind::FP_IS_NAN, {a_fp});
        Term b_nan = tm.mk_term(Kind::FP_IS_NAN, {b_fp});
        Term both_nan = tm.mk_term(Kind::AND, {a_nan, b_nan});
        Term bit_eq = tm.mk_term(Kind::EQUAL, {a, b});
        return tm.mk_term(Kind::OR, {both_nan, bit_eq});
    }

    case ElementKind::F64: {
        Sort fp64 = tm.mk_fp_sort(11, 53);
        Term a_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {a}, {11, 53});
        Term b_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {b}, {11, 53});
        Term a_nan = tm.mk_term(Kind::FP_IS_NAN, {a_fp});
        Term b_nan = tm.mk_term(Kind::FP_IS_NAN, {b_fp});
        Term both_nan = tm.mk_term(Kind::AND, {a_nan, b_nan});
        Term bit_eq = tm.mk_term(Kind::EQUAL, {a, b});
        return tm.mk_term(Kind::OR, {both_nan, bit_eq});
    }
    }
    __builtin_unreachable();
}

// ---------------------------------------------------------------------------
// Buffer-level comparison: compare num_elements elements of elem_bytes width
// Returns a single Bool term: conjunction of all per-element equalities
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

    // AND all equalities together
    Term result = equalities[0];
    for (size_t i = 1; i < equalities.size(); i++) {
        result = tm.mk_term(Kind::AND, {result, equalities[i]});
    }
    return result;
}

} // namespace salt
