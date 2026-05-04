#pragma once
// SymbolicScalar<T> — typed wrapper carrying a cvc5::Term through C arithmetic.
// cvc5 port — mirrors src/verification/core/symbolic_scalar.hpp.
//
// Dispatches to BV or FP operations based on the C type via SymTraits<T>.
// Has NO implicit conversion to T — a missing intrinsic overload is a
// compile error, not a silent collapse to zero.

#include "context.hpp"
#include "symbolic_buffer.hpp"

#include <cvc5/cvc5.h>

#include <cstddef>
#include <cstdint>
#include <string>
#include <type_traits>

// Forward-declare xnn_float16 (defined in xnn_minimal.h, included later by salt.hpp).
struct xnn_float16;

namespace salt_cvc5 {

// ---------------------------------------------------------------------------
// SymTraits<T> — maps C types to cvc5 sort kind and parameters
// ---------------------------------------------------------------------------
template<typename T> struct SymTraits;

template<> struct SymTraits<int8_t> {
    static constexpr bool is_fp = false;
    static constexpr size_t bits = 8;
    static constexpr bool is_signed = true;
};
template<> struct SymTraits<uint8_t> {
    static constexpr bool is_fp = false;
    static constexpr size_t bits = 8;
    static constexpr bool is_signed = false;
};
template<> struct SymTraits<int16_t> {
    static constexpr bool is_fp = false;
    static constexpr size_t bits = 16;
    static constexpr bool is_signed = true;
};
template<> struct SymTraits<uint16_t> {
    static constexpr bool is_fp = false;
    static constexpr size_t bits = 16;
    static constexpr bool is_signed = false;
};
template<> struct SymTraits<int32_t> {
    static constexpr bool is_fp = false;
    static constexpr size_t bits = 32;
    static constexpr bool is_signed = true;
};
template<> struct SymTraits<uint32_t> {
    static constexpr bool is_fp = false;
    static constexpr size_t bits = 32;
    static constexpr bool is_signed = false;
};
template<> struct SymTraits<int64_t> {
    static constexpr bool is_fp = false;
    static constexpr size_t bits = 64;
    static constexpr bool is_signed = true;
};
template<> struct SymTraits<uint64_t> {
    static constexpr bool is_fp = false;
    static constexpr size_t bits = 64;
    static constexpr bool is_signed = false;
};
template<> struct SymTraits<float> {
    static constexpr bool is_fp = true;
    static constexpr size_t bits = 32;
    static constexpr bool is_signed = true;
    static Sort sort(TermManager& tm) { return tm.mkFloatingPointSort(8, 24); }
};
template<> struct SymTraits<xnn_float16> {
    static constexpr bool is_fp = true;
    static constexpr size_t bits = 16;
    static constexpr bool is_signed = true;
    static Sort sort(TermManager& tm) { return tm.mkFloatingPointSort(5, 11); }
};

// ---------------------------------------------------------------------------
// Helper: float → IEEE 754 bit pattern → cvc5 FP value
// (cvc5 has no `mk_fp_value(sort, rm, decimal_string)` like bitwuzla — instead
// we go through the BV bit pattern.)
// ---------------------------------------------------------------------------
inline Term mk_fp32_from_float_pattern(TermManager& tm, float v) {
    uint32_t bits;
    __builtin_memcpy(&bits, &v, sizeof(bits));
    Term bv = tm.mkBitVector(32, static_cast<uint64_t>(bits));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    return tm.mkTerm(op, {bv});
}

inline Term mk_fp16_from_bits(TermManager& tm, uint16_t bits) {
    Term bv = tm.mkBitVector(16, static_cast<uint64_t>(bits));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    return tm.mkTerm(op, {bv});
}

// ---------------------------------------------------------------------------
// SymbolicScalar<T>
// ---------------------------------------------------------------------------
template<typename T>
class SymbolicScalar {
    Term term_;
    using Tr = SymTraits<T>;

public:
    // From symbolic buffer read at byte offset
    SymbolicScalar(SymbolicBuffer& buf, size_t byte_offset) {
        if constexpr (Tr::is_fp) {
            Term bv = buf.loadScalar(byte_offset, Tr::bits);
            if constexpr (Tr::bits == 32) {
                Op op = g_ctx->tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
                term_ = g_ctx->tm.mkTerm(op, {bv});
            } else {
                Op op = g_ctx->tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
                term_ = g_ctx->tm.mkTerm(op, {bv});
            }
        } else {
            term_ = buf.loadScalar(byte_offset, Tr::bits);
        }
    }

    // From concrete value (creates constant term)
    SymbolicScalar(T val) {
        if constexpr (Tr::is_fp) {
            if constexpr (Tr::bits == 32) {
                term_ = mk_fp32_from_float_pattern(g_ctx->tm, static_cast<float>(val));
            } else {
                // xnn_float16 carries an underlying uint16_t bit pattern.
                term_ = mk_fp16_from_bits(g_ctx->tm,
                    *reinterpret_cast<const uint16_t*>(&val));
            }
        } else {
            term_ = mk_bv_val(g_ctx->tm, Tr::bits, static_cast<int64_t>(val));
        }
    }

    // From raw Term
    explicit SymbolicScalar(Term t) : term_(std::move(t)) {}

    Term term() const { return term_; }

    // --- Arithmetic ---
    SymbolicScalar operator+(SymbolicScalar r) const {
        if constexpr (Tr::is_fp)
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::FLOATINGPOINT_ADD,
                {g_ctx->fp.rounding_mode, term_, r.term_}));
        else
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_ADD, {term_, r.term_}));
    }
    SymbolicScalar operator-(SymbolicScalar r) const {
        if constexpr (Tr::is_fp)
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::FLOATINGPOINT_SUB,
                {g_ctx->fp.rounding_mode, term_, r.term_}));
        else
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_SUB, {term_, r.term_}));
    }
    SymbolicScalar operator-() const {
        if constexpr (Tr::is_fp)
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::FLOATINGPOINT_NEG, {term_}));
        else
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_NEG, {term_}));
    }
    SymbolicScalar operator*(SymbolicScalar r) const {
        if constexpr (Tr::is_fp)
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::FLOATINGPOINT_MULT,
                {g_ctx->fp.rounding_mode, term_, r.term_}));
        else
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_MULT, {term_, r.term_}));
    }

    // --- Shift (integer only — compile error on FP) ---
    SymbolicScalar operator>>(int shift) const {
        static_assert(!Tr::is_fp, "shift not defined for FP SymbolicScalar");
        if constexpr (Tr::is_signed)
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_ASHR,
                {term_, mk_bv_val(g_ctx->tm, Tr::bits, shift)}));
        else
            return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_LSHR,
                {term_, mk_bv_val(g_ctx->tm, Tr::bits, shift)}));
    }
    SymbolicScalar operator<<(int shift) const {
        static_assert(!Tr::is_fp, "shift not defined for FP SymbolicScalar");
        return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_SHL,
            {term_, mk_bv_val(g_ctx->tm, Tr::bits, shift)}));
    }

    // --- Bitwise (integer only) ---
    SymbolicScalar operator&(SymbolicScalar r) const {
        static_assert(!Tr::is_fp, "bitwise AND not defined for FP");
        return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_AND, {term_, r.term_}));
    }
    SymbolicScalar operator|(SymbolicScalar r) const {
        static_assert(!Tr::is_fp, "bitwise OR not defined for FP");
        return SymbolicScalar(g_ctx->tm.mkTerm(Kind::BITVECTOR_OR, {term_, r.term_}));
    }

    // --- Cast to another type ---
    template<typename U>
    SymbolicScalar<U> cast() const {
        using TrU = SymTraits<U>;
        // FP → FP
        if constexpr (Tr::is_fp && TrU::is_fp) {
            uint32_t exp_bits = (TrU::bits == 32) ? 8 : 5;
            uint32_t sig_bits = (TrU::bits == 32) ? 24 : 11;
            Op op = g_ctx->tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {exp_bits, sig_bits});
            return SymbolicScalar<U>(g_ctx->tm.mkTerm(op, {g_ctx->fp.rounding_mode, term_}));
        }
        // Int → FP
        else if constexpr (!Tr::is_fp && TrU::is_fp) {
            Kind k = Tr::is_signed ? Kind::FLOATINGPOINT_TO_FP_FROM_SBV
                                    : Kind::FLOATINGPOINT_TO_FP_FROM_UBV;
            uint32_t exp_bits = (TrU::bits == 32) ? 8 : 5;
            uint32_t sig_bits = (TrU::bits == 32) ? 24 : 11;
            Op op = g_ctx->tm.mkOp(k, {exp_bits, sig_bits});
            return SymbolicScalar<U>(g_ctx->tm.mkTerm(op, {g_ctx->fp.rounding_mode, term_}));
        }
        // FP → Int
        else if constexpr (Tr::is_fp && !TrU::is_fp) {
            Kind k = TrU::is_signed ? Kind::FLOATINGPOINT_TO_SBV : Kind::FLOATINGPOINT_TO_UBV;
            Op op = g_ctx->tm.mkOp(k, {static_cast<uint32_t>(TrU::bits)});
            return SymbolicScalar<U>(g_ctx->tm.mkTerm(op, {g_ctx->fp.rounding_mode, term_}));
        }
        // Int → Int
        else {
            constexpr size_t sb = Tr::bits, db = TrU::bits;
            if constexpr (db > sb) {
                Kind k = Tr::is_signed ? Kind::BITVECTOR_SIGN_EXTEND : Kind::BITVECTOR_ZERO_EXTEND;
                Op op = g_ctx->tm.mkOp(k, {static_cast<uint32_t>(db - sb)});
                return SymbolicScalar<U>(g_ctx->tm.mkTerm(op, {term_}));
            } else if constexpr (db < sb) {
                Op op = g_ctx->tm.mkOp(Kind::BITVECTOR_EXTRACT,
                    {static_cast<uint32_t>(db - 1), 0u});
                return SymbolicScalar<U>(g_ctx->tm.mkTerm(op, {term_}));
            } else {
                return SymbolicScalar<U>(term_);
            }
        }
    }

    // NO implicit operator T(); use concrete_zero() only for explicit C-compat dummies.
    T concrete_zero() const { return T(0); }
};

// ---------------------------------------------------------------------------
// Free-standing operators: concrete op SymbolicScalar (and vice versa).
// ---------------------------------------------------------------------------
template<typename T>
SymbolicScalar<T> operator+(T lhs, SymbolicScalar<T> rhs) { return SymbolicScalar<T>(lhs) + rhs; }
template<typename T>
SymbolicScalar<T> operator-(T lhs, SymbolicScalar<T> rhs) { return SymbolicScalar<T>(lhs) - rhs; }
template<typename T>
SymbolicScalar<T> operator*(T lhs, SymbolicScalar<T> rhs) { return SymbolicScalar<T>(lhs) * rhs; }

// Cross-type: int32_t op SymbolicScalar<int16_t>, etc.
template<typename L, typename R>
auto operator-(L lhs, SymbolicScalar<R> rhs) -> std::enable_if_t<!std::is_same_v<L,R> && !SymTraits<L>::is_fp && !SymTraits<R>::is_fp,
    SymbolicScalar<std::conditional_t<(sizeof(L) >= sizeof(R)), L, R>>>
{
    using Wide = std::conditional_t<(sizeof(L) >= sizeof(R)), L, R>;
    return SymbolicScalar<Wide>(static_cast<Wide>(lhs)) - rhs.template cast<Wide>();
}
template<typename L, typename R>
auto operator+(L lhs, SymbolicScalar<R> rhs) -> std::enable_if_t<!std::is_same_v<L,R> && !SymTraits<L>::is_fp && !SymTraits<R>::is_fp,
    SymbolicScalar<std::conditional_t<(sizeof(L) >= sizeof(R)), L, R>>>
{
    using Wide = std::conditional_t<(sizeof(L) >= sizeof(R)), L, R>;
    return SymbolicScalar<Wide>(static_cast<Wide>(lhs)) + rhs.template cast<Wide>();
}

} // namespace salt_cvc5
