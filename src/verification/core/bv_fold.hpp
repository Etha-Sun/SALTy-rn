#pragma once
// Constant-folding helpers for pure-BV ops (bitwuzla backend).  Mirror of
// src/verification_cvc5/core/bv_fold.hpp; same API, different backend.  When
// all operands are CONST bit-vectors, compute eagerly in C++ and return a
// CONST term; otherwise build the symbolic term as usual.  Soundness: pure BV
// only — never fold across the FP boundary.  Width assumed ≤ 64.

#include <bitwuzla/cpp/bitwuzla.h>
#include <cstdint>
#include <string>

namespace salt {

using bitwuzla::Term;
using bitwuzla::Sort;
using bitwuzla::Kind;
using bitwuzla::TermManager;

inline bool is_bv_const(const Term& t) {
    return t.is_value() && t.sort().is_bv();
}

inline uint32_t bv_width(const Term& t) {
    return static_cast<uint32_t>(t.sort().bv_size());
}

inline uint64_t bv_const_u64(const Term& t) {
    return std::stoull(t.value<std::string>(16), nullptr, 16);
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
    return tm.mk_bv_value_uint64(tm.mk_bv_sort(bits), mask_to_width(val, bits));
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
        return tm.mk_term(KIND, {a, b});                                       \
    }

SALT_DEFINE_BV_BIN_FOLD(fold_bvadd, Kind::BV_ADD, va + vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvsub, Kind::BV_SUB, va - vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvmul, Kind::BV_MUL, va * vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvand, Kind::BV_AND, va & vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvor,  Kind::BV_OR,  va | vb)
SALT_DEFINE_BV_BIN_FOLD(fold_bvxor, Kind::BV_XOR, va ^ vb)
#undef SALT_DEFINE_BV_BIN_FOLD

// SMT-LIB BV shift semantics: shamt ≥ width → 0 (logical).  Bitwuzla's logical
// shift right is BV_SHR (no L prefix).
inline Term fold_bvshl(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        uint64_t va = bv_const_u64(a), vb = bv_const_u64(b);
        return bv_val_term(tm, w, vb >= w ? 0 : va << vb);
    }
    return tm.mk_term(Kind::BV_SHL, {a, b});
}

inline Term fold_bvlshr(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        uint64_t va = bv_const_u64(a), vb = bv_const_u64(b);
        return bv_val_term(tm, w, vb >= w ? 0 : va >> vb);
    }
    return tm.mk_term(Kind::BV_SHR, {a, b});
}

// ---------------------------------------------------------------------------
// Unary
// ---------------------------------------------------------------------------
inline Term fold_bvnot(TermManager& tm, const Term& a) {
    if (is_bv_const(a) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        return bv_val_term(tm, w, ~bv_const_u64(a));
    }
    return tm.mk_term(Kind::BV_NOT, {a});
}

inline Term fold_bvneg(TermManager& tm, const Term& a) {
    if (is_bv_const(a) && bv_width(a) <= 64) {
        uint32_t w = bv_width(a);
        return bv_val_term(tm, w, (uint64_t)0 - bv_const_u64(a));
    }
    return tm.mk_term(Kind::BV_NEG, {a});
}

// ---------------------------------------------------------------------------
// Concat / extract / extend
// ---------------------------------------------------------------------------
inline Term fold_bvconcat(TermManager& tm, const Term& hi, const Term& lo) {
    if (is_bv_const(hi) && is_bv_const(lo) &&
        bv_width(hi) + bv_width(lo) <= 64) {
        uint32_t wl = bv_width(lo);
        uint64_t out = (bv_const_u64(hi) << wl) | bv_const_u64(lo);
        return bv_val_term(tm, bv_width(hi) + wl, out);
    }
    return tm.mk_term(Kind::BV_CONCAT, {hi, lo});
}

inline Term fold_bvextract(TermManager& tm, uint32_t hi, uint32_t lo, const Term& a) {
    if (is_bv_const(a) && bv_width(a) <= 64) {
        uint32_t w = hi - lo + 1;
        return bv_val_term(tm, w, bv_const_u64(a) >> lo);
    }
    return tm.mk_term(Kind::BV_EXTRACT, {a}, {hi, lo});
}

inline Term fold_bvzext(TermManager& tm, uint32_t k, const Term& a) {
    if (is_bv_const(a) && bv_width(a) + k <= 64) {
        return bv_val_term(tm, bv_width(a) + k, bv_const_u64(a));
    }
    return tm.mk_term(Kind::BV_ZERO_EXTEND, {a}, {k});
}

inline Term fold_bvsext(TermManager& tm, uint32_t k, const Term& a) {
    if (is_bv_const(a) && bv_width(a) + k <= 64) {
        return bv_val_term(tm, bv_width(a) + k, (uint64_t)bv_const_i64(a));
    }
    return tm.mk_term(Kind::BV_SIGN_EXTEND, {a}, {k});
}

// ---------------------------------------------------------------------------
// Equality / ITE
// ---------------------------------------------------------------------------
inline Term fold_eq(TermManager& tm, const Term& a, const Term& b) {
    if (is_bv_const(a) && is_bv_const(b) && bv_width(a) <= 64) {
        return bv_const_u64(a) == bv_const_u64(b) ? tm.mk_true() : tm.mk_false();
    }
    return tm.mk_term(Kind::EQUAL, {a, b});
}

inline Term fold_ite(TermManager& tm, const Term& c, const Term& t, const Term& e) {
    if (c.is_value() && c.sort().is_bool()) {
        return c.value<bool>() ? t : e;
    }
    return tm.mk_term(Kind::ITE, {c, t, e});
}

} // namespace salt
