#pragma once
// SymbolicScalar<T> — typed wrapper carrying a bitwuzla Term through C arithmetic.
//
// Dispatches to BV or FP operations based on the C type via SymTraits<T>.
// Has NO implicit conversion to T — a missing intrinsic overload is a
// compile error, not a silent collapse to zero.

#include "context.hpp"
#include "symbolic_buffer.hpp"

#include <bitwuzla/cpp/bitwuzla.h>

#include <cstddef>
#include <cstdint>
#include <string>
#include <type_traits>

// Forward-declare xnn_float16 (defined in xnn_minimal.h, included later by salt.hpp).
// This assumes XNN_HAVE_FLOAT16=0, where xnn_float16 is a struct wrapping uint16_t.
// If XNN_HAVE_FLOAT16=1, xnn_float16 is a typedef for _Float16 and this breaks.
struct xnn_float16;

namespace salt {

using namespace bitwuzla;

// ---------------------------------------------------------------------------
// SymTraits<T> — maps C types to bitwuzla sort kind and parameters
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
    static Sort sort(TermManager& tm) { return tm.mk_fp_sort(8, 24); }
};
template<> struct SymTraits<xnn_float16> {
    static constexpr bool is_fp = true;
    static constexpr size_t bits = 16;
    static constexpr bool is_signed = true;
    static Sort sort(TermManager& tm) { return tm.mk_fp_sort(5, 11); }
};

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
            term_ = g_ctx->tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv},
                                       {Tr::sort(g_ctx->tm)});
        } else {
            term_ = buf.loadScalar(byte_offset, Tr::bits);
        }
    }

    // From concrete value (creates constant term)
    SymbolicScalar(T val) {
        if constexpr (Tr::is_fp) {
            term_ = g_ctx->tm.mk_fp_value(
                Tr::sort(g_ctx->tm), g_ctx->fp.rounding_mode,
                std::to_string(static_cast<double>(val)));
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
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::FP_ADD,
                {g_ctx->fp.rounding_mode, term_, r.term_}));
        else
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_ADD, {term_, r.term_}));
    }
    SymbolicScalar operator-(SymbolicScalar r) const {
        if constexpr (Tr::is_fp)
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::FP_SUB,
                {g_ctx->fp.rounding_mode, term_, r.term_}));
        else
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_SUB, {term_, r.term_}));
    }
    SymbolicScalar operator-() const {
        if constexpr (Tr::is_fp)
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::FP_NEG, {term_}));
        else
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_NEG, {term_}));
    }
    SymbolicScalar operator*(SymbolicScalar r) const {
        if constexpr (Tr::is_fp)
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::FP_MUL,
                {g_ctx->fp.rounding_mode, term_, r.term_}));
        else
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_MUL, {term_, r.term_}));
    }

    // --- Shift (integer only — compile error on FP) ---
    SymbolicScalar operator>>(int shift) const {
        static_assert(!Tr::is_fp, "shift not defined for FP SymbolicScalar");
        if constexpr (Tr::is_signed)
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_ASHR,
                {term_, mk_bv_val(g_ctx->tm, Tr::bits, shift)}));
        else
            return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_SHR,
                {term_, mk_bv_val(g_ctx->tm, Tr::bits, shift)}));
    }
    SymbolicScalar operator<<(int shift) const {
        static_assert(!Tr::is_fp, "shift not defined for FP SymbolicScalar");
        return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_SHL,
            {term_, mk_bv_val(g_ctx->tm, Tr::bits, shift)}));
    }

    // --- Bitwise (integer only) ---
    SymbolicScalar operator&(SymbolicScalar r) const {
        static_assert(!Tr::is_fp, "bitwise AND not defined for FP");
        return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_AND, {term_, r.term_}));
    }
    SymbolicScalar operator|(SymbolicScalar r) const {
        static_assert(!Tr::is_fp, "bitwise OR not defined for FP");
        return SymbolicScalar(g_ctx->tm.mk_term(Kind::BV_OR, {term_, r.term_}));
    }

    // --- Cast to another type ---
    template<typename U>
    SymbolicScalar<U> cast() const {
        using TrU = SymTraits<U>;
        // FP → FP
        if constexpr (Tr::is_fp && TrU::is_fp) {
            return SymbolicScalar<U>(g_ctx->tm.mk_term(Kind::FP_TO_FP_FROM_FP,
                {g_ctx->fp.rounding_mode, term_}, {TrU::sort(g_ctx->tm)}));
        }
        // Int → FP
        else if constexpr (!Tr::is_fp && TrU::is_fp) {
            Kind k = Tr::is_signed ? Kind::FP_TO_FP_FROM_SBV : Kind::FP_TO_FP_FROM_UBV;
            return SymbolicScalar<U>(g_ctx->tm.mk_term(k,
                {g_ctx->fp.rounding_mode, term_}, {TrU::sort(g_ctx->tm)}));
        }
        // FP → Int
        else if constexpr (Tr::is_fp && !TrU::is_fp) {
            Kind k = TrU::is_signed ? Kind::FP_TO_SBV : Kind::FP_TO_UBV;
            return SymbolicScalar<U>(g_ctx->tm.mk_term(k,
                {g_ctx->fp.rounding_mode, term_}, {TrU::bits}));
        }
        // Int → Int
        else {
            constexpr size_t sb = Tr::bits, db = TrU::bits;
            if constexpr (db > sb) {
                Kind k = Tr::is_signed ? Kind::BV_SIGN_EXTEND : Kind::BV_ZERO_EXTEND;
                return SymbolicScalar<U>(g_ctx->tm.mk_term(k, {term_}, {db - sb}));
            } else if constexpr (db < sb) {
                return SymbolicScalar<U>(g_ctx->tm.mk_term(
                    Kind::BV_EXTRACT, {term_},
                    {static_cast<uint64_t>(db - 1), 0UL}));
            } else {
                return SymbolicScalar<U>(term_);
            }
        }
    }

    // NO implicit operator T(), Use concrete_zero() only when you explicitly need a C-compatible dummy.
    T concrete_zero() const { return T(0); }
};

} // namespace salt
