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

// True iff `t` is a concrete BV constant whose value equals `val` (masked to
// t's width).  Width > 64 is treated as "not a known value" (returns false),
// so the wide-BV identity paths are conservatively skipped.
inline bool is_bv_val(const Term& t, uint64_t val) {
    if (!is_bv_const(t) || bv_width(t) > 64) return false;
    return bv_const_u64(t) == mask_to_width(val, bv_width(t));
}

// ---------------------------------------------------------------------------
// Binary BV ops with same-width result.  Each does all-const evaluation, then
// algebraic identities on a symbolic operand.  Soundness: integer BV only (the
// FP traps x*0≠0 / ±0 don't apply to BITVECTOR_MULT); identities that need two
// equal operands use cvc5's hash-consed `==` (structural identity ⇒ equal).
// ---------------------------------------------------------------------------
inline Term fold_bvadd(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64)
        return bv_val_term(tm, bv_width(a), bv_const_u64(a) + bv_const_u64(b));
    if (is_bv_val(b, 0)) return a;                       // x + 0 = x
    if (is_bv_val(a, 0)) return b;                       // 0 + x = x
    return tm.mkTerm(Kind::BITVECTOR_ADD, {a, b});
}

inline Term fold_bvsub(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64)
        return bv_val_term(tm, bv_width(a), bv_const_u64(a) - bv_const_u64(b));
    if (is_bv_val(b, 0)) return a;                       // x - 0 = x
    if (a == b) return bv_val_term(tm, bv_width(a), 0);  // x - x = 0
    return tm.mkTerm(Kind::BITVECTOR_SUB, {a, b});
}

inline Term fold_bvmul(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64)
        return bv_val_term(tm, bv_width(a), bv_const_u64(a) * bv_const_u64(b));
    if (is_bv_val(b, 0)) return bv_val_term(tm, bv_width(b), 0);   // x * 0 = 0
    if (is_bv_val(a, 0)) return bv_val_term(tm, bv_width(a), 0);   // 0 * x = 0
    if (is_bv_val(b, 1)) return a;                       // x * 1 = x
    if (is_bv_val(a, 1)) return b;                       // 1 * x = x
    return tm.mkTerm(Kind::BITVECTOR_MULT, {a, b});
}

inline Term fold_bvand(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64)
        return bv_val_term(tm, bv_width(a), bv_const_u64(a) & bv_const_u64(b));
    if (is_bv_val(b, 0)) return bv_val_term(tm, bv_width(b), 0);   // x & 0 = 0
    if (is_bv_val(a, 0)) return bv_val_term(tm, bv_width(a), 0);   // 0 & x = 0
    if (is_bv_val(b, ~0ULL)) return a;                  // x & 1..1 = x
    if (is_bv_val(a, ~0ULL)) return b;                  // 1..1 & x = x
    if (a == b) return a;                               // x & x = x
    return tm.mkTerm(Kind::BITVECTOR_AND, {a, b});
}

inline Term fold_bvor(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64)
        return bv_val_term(tm, bv_width(a), bv_const_u64(a) | bv_const_u64(b));
    if (is_bv_val(b, 0)) return a;                       // x | 0 = x
    if (is_bv_val(a, 0)) return b;                       // 0 | x = x
    if (is_bv_val(b, ~0ULL)) return bv_val_term(tm, bv_width(b), ~0ULL); // x | 1..1 = 1..1
    if (is_bv_val(a, ~0ULL)) return bv_val_term(tm, bv_width(a), ~0ULL);
    if (a == b) return a;                               // x | x = x
    return tm.mkTerm(Kind::BITVECTOR_OR, {a, b});
}

inline Term fold_bvxor(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64)
        return bv_val_term(tm, bv_width(a), bv_const_u64(a) ^ bv_const_u64(b));
    if (is_bv_val(b, 0)) return a;                       // x ^ 0 = x
    if (is_bv_val(a, 0)) return b;                       // 0 ^ x = x
    if (a == b) return bv_val_term(tm, bv_width(a), 0);  // x ^ x = 0
    return tm.mkTerm(Kind::BITVECTOR_XOR, {a, b});
}

// SMT-LIB BV shift: shamt ≥ width → result is 0 (logical) / sign-broadcast
// (arithmetic).  bvashr intentionally omitted — not used in BFDOT pipeline,
// not worth the corner-case audit.
inline Term fold_bvshl(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        uint64_t va = bv_const_u64(a), vb = bv_const_u64(b);
        return bv_val_term(tm, w, vb >= w ? 0 : va << vb);
    }
    if (is_bv_val(b, 0)) return a;                       // x << 0 = x
    return tm.mkTerm(Kind::BITVECTOR_SHL, {a, b});
}

inline Term fold_bvlshr(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        uint64_t va = bv_const_u64(a), vb = bv_const_u64(b);
        return bv_val_term(tm, w, vb >= w ? 0 : va >> vb);
    }
    if (is_bv_val(b, 0)) return a;                       // x >> 0 = x
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
    if (a.getKind() == Kind::BITVECTOR_NOT) return a[0];  // ~~x = x
    return tm.mkTerm(Kind::BITVECTOR_NOT, {a});
}

inline Term fold_bvneg(TermManager& tm, const Term& a) {
    if (is_bv_const(a) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        return bv_val_term(tm, w, (uint64_t)0 - bv_const_u64(a));
    }
    if (a.getKind() == Kind::BITVECTOR_NEG) return a[0];  // -(-x) = x
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
    if (lo == 0 && hi == bv_width(a) - 1) return a;     // extract[w-1:0] x = x
    return tm.mkTerm(op, {a});
}

inline Term fold_bvzext(TermManager& tm, uint32_t k, const Term& a) {
    Op op = tm.mkOp(Kind::BITVECTOR_ZERO_EXTEND, {k});
    if (is_bv_const(a) && bv_width(a) + k <= 64) {
        return bv_val_term(tm, bv_width(a) + k, bv_const_u64(a));
    }
    if (k == 0) return a;                               // zero_extend by 0 = x
    return tm.mkTerm(op, {a});
}

inline Term fold_bvsext(TermManager& tm, uint32_t k, const Term& a) {
    Op op = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {k});
    if (is_bv_const(a) && bv_width(a) + k <= 64) {
        return bv_val_term(tm, bv_width(a) + k, (uint64_t)bv_const_i64(a));
    }
    if (k == 0) return a;                               // sign_extend by 0 = x
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
    if (a == b) return tm.mkBoolean(true);              // x = x
    return tm.mkTerm(Kind::EQUAL, {a, b});
}

inline Term fold_ite(TermManager& tm, const Term& c, const Term& t, const Term& e) {
    if (c.isBooleanValue()) return c.getBooleanValue() ? t : e;
    return tm.mkTerm(Kind::ITE, {c, t, e});
}

} // namespace salt_cvc5
