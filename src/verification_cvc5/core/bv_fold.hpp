#pragma once
// Constant-folding helpers for pure-BV ops.  When all operands are CONST
// bit-vectors, compute the result eagerly in C++ and return a CONST term;
// otherwise build the symbolic term as usual.  Soundness: pure BV only —
// never fold across the FP boundary (FLOATINGPOINT_TO_FP_FROM_IEEE_BV and
// anything FP-typed).  Width assumed ≤ 64 (true for the BFDOT pipeline).

#include <cvc5/cvc5.h>
#include <cstdint>
#include <string>

namespace salt_cvc5 {

using cvc5::Term;
using cvc5::Sort;
using cvc5::Op;
using cvc5::Kind;
using cvc5::TermManager;

inline bool is_bv_const(const Term& t) { return t.isBitVectorValue(); }

inline uint32_t bv_width(const Term& t) {
    return t.getSort().getBitVectorSize();
}

// Width must be ≤ 64.  Caller is responsible for not folding wider terms.
inline uint64_t bv_const_u64(const Term& t) {
    return std::stoull(t.getBitVectorValue(16), nullptr, 16);
}

inline int64_t bv_const_i64(const Term& t) {
    uint64_t v = bv_const_u64(t);
    uint32_t w = bv_width(t);
    if (w == 64) return (int64_t)v;
    uint64_t sign_bit = (uint64_t)1 << (w - 1);
    if (v & sign_bit) return (int64_t)(v | ~(((uint64_t)1 << w) - 1));
    return (int64_t)v;
}

inline uint64_t mask_to_width(uint64_t v, uint32_t bits) {
    return bits >= 64 ? v : v & (((uint64_t)1 << bits) - 1);
}

inline Term bv_val_term(TermManager& tm, uint32_t bits, uint64_t val) {
    return tm.mkBitVector(bits, mask_to_width(val, bits));
}

// ---------------------------------------------------------------------------
// Binary BV ops with same-width result
// ---------------------------------------------------------------------------
#define SALT_DEFINE_BV_BIN_FOLD(NAME, KIND, EXPR)                              \
    inline Term NAME(TermManager& tm, const Term& a, const Term& b) {          \
        if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {           \
            uint32_t w  = bv_width(a);                                         \
            uint64_t va = bv_const_u64(a);                                     \
            uint64_t vb = bv_const_u64(b);                                     \
            (void)w; (void)va; (void)vb;                                       \
            return bv_val_term(tm, w, (EXPR));                                 \
        }                                                                      \
        return tm.mkTerm(KIND, {a, b});                                        \
    }

SALT_DEFINE_BV_BIN_FOLD(fold_bvadd, Kind::BITVECTOR_ADD,  va + vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvsub, Kind::BITVECTOR_SUB,  va - vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvmul, Kind::BITVECTOR_MULT, va * vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvand, Kind::BITVECTOR_AND,  va & vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvor,  Kind::BITVECTOR_OR,   va | vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvxor, Kind::BITVECTOR_XOR,  va ^ vb)
#undef SALT_DEFINE_BV_BIN_FOLD

// SMT-LIB BV shift: shamt ≥ width → result is 0 (logical) / sign-broadcast
// (arithmetic).  bvashr intentionally omitted — not used in BFDOT pipeline,
// not worth the corner-case audit.
inline Term fold_bvshl(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        uint64_t va = bv_const_u64(a), vb = bv_const_u64(b);
        return bv_val_term(tm, w, vb >= w ? 0 : va << vb);
    }
    return tm.mkTerm(Kind::BITVECTOR_SHL, {a, b});
}

inline Term fold_bvlshr(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        uint64_t va = bv_const_u64(a), vb = bv_const_u64(b);
        return bv_val_term(tm, w, vb >= w ? 0 : va >> vb);
    }
    return tm.mkTerm(Kind::BITVECTOR_LSHR, {a, b});
}

// ---------------------------------------------------------------------------
// Unary
// ---------------------------------------------------------------------------
inline Term fold_bvnot(TermManager& tm, const Term& a) {
    if (is_bv_const(a) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        return bv_val_term(tm, w, ~bv_const_u64(a));
    }
    return tm.mkTerm(Kind::BITVECTOR_NOT, {a});
}

inline Term fold_bvneg(TermManager& tm, const Term& a) {
    if (is_bv_const(a) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        return bv_val_term(tm, w, (uint64_t)0 - bv_const_u64(a));
    }
    return tm.mkTerm(Kind::BITVECTOR_NEG, {a});
}

// ---------------------------------------------------------------------------
// Concat / extract / extend.  Result-width guard so the uint64_t backing path
// is only used when the synthesized constant fits in 64 bits.
// ---------------------------------------------------------------------------
inline Term fold_bvconcat(TermManager& tm, const Term& hi, const Term& lo) {
    if (is_bv_const(hi) && is_bv_const(lo) &&
        bv_width(hi) + bv_width(lo) <= 64) {
        uint32_t wl = bv_width(lo);
        uint64_t out = (bv_const_u64(hi) << wl) | bv_const_u64(lo);
        return bv_val_term(tm, bv_width(hi) + wl, out);
    }
    return tm.mkTerm(Kind::BITVECTOR_CONCAT, {hi, lo});
}

inline Term fold_bvextract(TermManager& tm, uint32_t hi, uint32_t lo, const Term& a) {
    Op op = tm.mkOp(Kind::BITVECTOR_EXTRACT, {hi, lo});
    if (is_bv_const(a) && bv_width(a) <= 64) {
        uint32_t w = hi - lo + 1;
        return bv_val_term(tm, w, bv_const_u64(a) >> lo);
    }
    return tm.mkTerm(op, {a});
}

inline Term fold_bvzext(TermManager& tm, uint32_t k, const Term& a) {
    Op op = tm.mkOp(Kind::BITVECTOR_ZERO_EXTEND, {k});
    if (is_bv_const(a) && bv_width(a) + k <= 64) {
        return bv_val_term(tm, bv_width(a) + k, bv_const_u64(a));
    }
    return tm.mkTerm(op, {a});
}

inline Term fold_bvsext(TermManager& tm, uint32_t k, const Term& a) {
    Op op = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {k});
    if (is_bv_const(a) && bv_width(a) + k <= 64) {
        return bv_val_term(tm, bv_width(a) + k, (uint64_t)bv_const_i64(a));
    }
    return tm.mkTerm(op, {a});
}

// ---------------------------------------------------------------------------
// Equality / ITE — collapses vmerge and mask paths once the condition is
// known concrete.
// ---------------------------------------------------------------------------
inline Term fold_eq(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {
        return tm.mkBoolean(bv_const_u64(a) == bv_const_u64(b));
    }
    return tm.mkTerm(Kind::EQUAL, {a, b});
}

inline Term fold_ite(TermManager& tm, const Term& c, const Term& t, const Term& e) {
    if (c.isBooleanValue()) return c.getBooleanValue() ? t : e;
    return tm.mkTerm(Kind::ITE, {c, t, e});
}

} // namespace salt_cvc5
