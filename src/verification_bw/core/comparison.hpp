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
//   F16/BF16/F32/F64 → both_nan OR fp_eq (FP-aware: +0 == -0; NaN-vs-NaN
//                       accepted via both_nan; everything else IEEE-equal)
// ---------------------------------------------------------------------------
inline Term _fp_element_equal(TermManager& tm, Term a, Term b, uint64_t eb, uint64_t sb) {
    Term a_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {a}, {eb, sb});
    Term b_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {b}, {eb, sb});
    Term a_nan = tm.mk_term(Kind::FP_IS_NAN, {a_fp});
    Term b_nan = tm.mk_term(Kind::FP_IS_NAN, {b_fp});
    Term both_nan = tm.mk_term(Kind::AND, {a_nan, b_nan});
    Term fp_eq = tm.mk_term(Kind::FP_EQUAL, {a_fp, b_fp});
    return tm.mk_term(Kind::OR, {both_nan, fp_eq});
}

// FP-aware tolerance: accepts a and b if their ULP distance is <= ulp_tol. Map
// each IEEE bit pattern to a monotonic signed key (adjacent floats differ by 1;
// +0/-0 collapse), then bound |key(a) - key(b)|. NaN stays exact (both-NaN
// accepted, exactly-one-NaN rejected); Inf needs no special case. Pure BV except
// the NaN guard — ideal for this (fast BV) backend.
inline Term _fp_within_ulp(TermManager& tm, Term a, Term b,
                           uint64_t eb, uint64_t sb, uint64_t ulp_tol) {
    uint64_t W = eb + sb;
    Sort sW = tm.mk_bv_sort(W);
    Term zeroW = tm.mk_bv_value_uint64(sW, 0);
    Term sign_mask = tm.mk_bv_value_uint64(sW, (uint64_t)1 << (W - 1));
    Term a_neg = tm.mk_term(Kind::BV_SLT, {a, zeroW});
    Term b_neg = tm.mk_term(Kind::BV_SLT, {b, zeroW});
    Term key_a = tm.mk_term(Kind::ITE, {a_neg, tm.mk_term(Kind::BV_SUB, {sign_mask, a}), a});
    Term key_b = tm.mk_term(Kind::ITE, {b_neg, tm.mk_term(Kind::BV_SUB, {sign_mask, b}), b});
    Term ka = tm.mk_term(Kind::BV_SIGN_EXTEND, {key_a}, {1});
    Term kb = tm.mk_term(Kind::BV_SIGN_EXTEND, {key_b}, {1});
    Term diff = tm.mk_term(Kind::BV_SUB, {ka, kb});
    Sort sW1 = tm.mk_bv_sort(W + 1);
    Term zeroW1 = tm.mk_bv_value_uint64(sW1, 0);
    Term is_neg = tm.mk_term(Kind::BV_SLT, {diff, zeroW1});
    Term absd = tm.mk_term(Kind::ITE, {is_neg, tm.mk_term(Kind::BV_NEG, {diff}), diff});
    Term ulp_ok = tm.mk_term(Kind::BV_ULE, {absd, tm.mk_bv_value_uint64(sW1, ulp_tol)});
    Term a_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {a}, {eb, sb});
    Term b_fp = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {b}, {eb, sb});
    Term a_nan = tm.mk_term(Kind::FP_IS_NAN, {a_fp});
    Term b_nan = tm.mk_term(Kind::FP_IS_NAN, {b_fp});
    Term both_nan = tm.mk_term(Kind::AND, {a_nan, b_nan});
    Term neither_nan = tm.mk_term(Kind::NOT, {tm.mk_term(Kind::OR, {a_nan, b_nan})});
    return tm.mk_term(Kind::OR, {both_nan, tm.mk_term(Kind::AND, {neither_nan, ulp_ok})});
}

// ulp_tol == 0 keeps the exact bit-equivalent check (default). ulp_tol > 0
// relaxes FP outputs to a ULP bound; integer/mask outputs stay exact regardless.
inline Term element_equal(TermManager& tm, Term a, Term b, ElementKind kind, uint64_t ulp_tol = 0) {
    switch (kind) {
    case ElementKind::SINT:
    case ElementKind::UINT:
    case ElementKind::MASK: return tm.mk_term(Kind::EQUAL, {a, b});
    case ElementKind::F16:  return ulp_tol ? _fp_within_ulp(tm, a, b, 5, 11, ulp_tol)  : _fp_element_equal(tm, a, b, 5, 11);
    case ElementKind::BF16: return ulp_tol ? _fp_within_ulp(tm, a, b, 8, 8,  ulp_tol)  : _fp_element_equal(tm, a, b, 8, 8);
    case ElementKind::F32:  return ulp_tol ? _fp_within_ulp(tm, a, b, 8, 24, ulp_tol)  : _fp_element_equal(tm, a, b, 8, 24);
    case ElementKind::F64:  return ulp_tol ? _fp_within_ulp(tm, a, b, 11, 53, ulp_tol) : _fp_element_equal(tm, a, b, 11, 53);
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
                           ElementKind kind,
                           uint64_t ulp_tol = 0) {
    size_t elem_bits = elem_bytes * 8;
    std::vector<Term> equalities;
    equalities.reserve(num_elements);

    for (size_t i = 0; i < num_elements; i++) {
        size_t offset = i * elem_bytes;
        Term a_elem = a.loadScalar(offset, elem_bits);
        Term b_elem = b.loadScalar(offset, elem_bits);
        equalities.push_back(element_equal(tm, a_elem, b_elem, kind, ulp_tol));
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
