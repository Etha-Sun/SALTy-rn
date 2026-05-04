#pragma once
// VerificationContext for the cvc5 port — mirrors src/verification/core/context.hpp
// but uses the cvc5 C++ API.  All identifiers live in `salt_cvc5::` to avoid
// any chance of ODR collisions with the bitwuzla tree even in the unlikely
// event both are linked together.

#include <cvc5/cvc5.h>

#include <cmath>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <map>
#include <memory>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

// _Float16 — same shim as the bitwuzla tree (option (a) from the plan: a fresh
// struct in this tree, completely independent from the one in src/verification).
// Layout-compatible with xnn_float16 (struct path, XNN_HAVE_FLOAT16=0).
#ifndef __FLT16_MAX__
struct _Float16 {
    uint16_t value;
    _Float16() = default;
    explicit constexpr _Float16(uint16_t v) : value(v) {}
    // Implicit xnn_float16 → _Float16 — required because kernels (e.g. f16-vmulcaddc)
    // pass xnn_float16 scalar args to _vf_f16 intrinsics.  Layout-compat is asserted
    // in salt.hpp.  Non-explicit on purpose: makes the conversion implicit.
    _Float16(xnn_float16 v) : value(v.value) {}
    _Float16(float f) {
        uint32_t x;
        __builtin_memcpy(&x, &f, sizeof(x));
        uint16_t sign = static_cast<uint16_t>((x >> 31) << 15);
        int32_t  exp32 = static_cast<int32_t>((x >> 23) & 0xFFu);
        uint32_t mant  = x & 0x7FFFFFu;
        if (exp32 == 0xFF) {
            value = sign | 0x7C00u | (mant ? 0x0200u : 0);
            return;
        }
        int32_t exp16 = exp32 - 127 + 15;
        if (exp16 >= 31) { value = sign | 0x7C00u; return; }
        if (exp16 <= 0) {
            if (exp16 < -10) { value = sign; return; }
            mant |= 0x800000u;
            value = sign | static_cast<uint16_t>(mant >> (14 - exp16));
            return;
        }
        value = sign | static_cast<uint16_t>(exp16 << 10)
              | static_cast<uint16_t>(mant >> 13);
    }
    // See symbolic_buffer.hpp for the out-of-line copy-ctor / dtor that
    // implement the scalar-Term side channel.
    _Float16(const _Float16& other);
    _Float16& operator=(const _Float16& other);
    ~_Float16();
};
#endif

namespace salt_cvc5 {

using cvc5::Term;
using cvc5::Sort;
using cvc5::Op;
using cvc5::Kind;
using cvc5::TermManager;
using cvc5::Solver;
using cvc5::Result;
using cvc5::RoundingMode;

// ---------------------------------------------------------------------------
// FP profile — frozen AArch64 FP environment
// ---------------------------------------------------------------------------
struct FPProfile {
    Term rounding_mode;
    bool flush_to_zero    = false;
    bool flush_to_zero_f16= false;
    bool default_nan      = false;
    bool ah               = false;
};

// ---------------------------------------------------------------------------
// Element kind — for the comparison helper
// ---------------------------------------------------------------------------
enum class ElementKind {
    SINT, UINT, F16, F32, F64, MASK,
};

class SymbolicBuffer; // forward decl

// ---------------------------------------------------------------------------
// VerificationContext
// ---------------------------------------------------------------------------
// Backend-agnostic check_sat() result.  Mirrors the bitwuzla backend's enum
// so generated harness code is portable across backends.
enum class CheckResult { Sat, Unsat, Unknown };

struct VerificationContext {
    TermManager tm;
    std::unique_ptr<Solver> solver;
    FPProfile fp;
    size_t vlen;

    std::map<std::string, std::unique_ptr<SymbolicBuffer>> buffers;
    std::vector<SymbolicBuffer*> registered_buffers;

    explicit VerificationContext(size_t vlen_) : vlen(vlen_) {
        solver = std::make_unique<Solver>(tm);
        solver->setOption("produce-models", "true");
        // fp16 (5/11) is only supported under the experimental FP solver in
        // cvc5 1.3.x.  Enable unconditionally — kernels that don't touch fp16
        // are unaffected.
        solver->setOption("fp-exp", "true");
        fp.rounding_mode = tm.mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
    }

    SymbolicBuffer& registerBuffer(const std::string& name, size_t num_bytes);
    SymbolicBuffer& findBuffer(const void* ptr);
    SymbolicBuffer* findBufferSafe(const void* ptr) noexcept;

    Sort bv_sort(size_t bits) { return tm.mkBitVectorSort(static_cast<uint32_t>(bits)); }
    Sort fp32_sort() { return tm.mkFloatingPointSort(8, 24); }
    Sort fp16_sort() { return tm.mkFloatingPointSort(5, 11); }

    // -----------------------------------------------------------------
    // Backend-agnostic helper API — mirrors src/verification/core/context.hpp
    // so generated harness code is portable across backends.  Emitted harness
    // code MUST go through these helpers; never call `tm.mk*` or `solver->`
    // methods directly from generated code.
    // -----------------------------------------------------------------

    // BV constructors
    Term bv_val(size_t bits, uint64_t val) {
        return tm.mkBitVector(static_cast<uint32_t>(bits), val);
    }
    Term bv_const(size_t bits, const std::string& name) {
        return tm.mkConst(bv_sort(bits), name);
    }

    // Logical / equality
    Term equal(Term a, Term b) { return tm.mkTerm(Kind::EQUAL, {a, b}); }
    Term land_(Term a, Term b) { return tm.mkTerm(Kind::AND,   {a, b}); }
    Term lor_ (Term a, Term b) { return tm.mkTerm(Kind::OR,    {a, b}); }
    Term lnot_(Term t)         { return tm.mkTerm(Kind::NOT,   {t});    }
    Term ite  (Term c, Term t, Term e) { return tm.mkTerm(Kind::ITE, {c, t, e}); }

    // BV comparisons (for symbolic-param validity / range constraints)
    Term bv_sgt(Term a, Term b) { return tm.mkTerm(Kind::BITVECTOR_SGT, {a, b}); }
    Term bv_sge(Term a, Term b) { return tm.mkTerm(Kind::BITVECTOR_SGE, {a, b}); }
    Term bv_slt(Term a, Term b) { return tm.mkTerm(Kind::BITVECTOR_SLT, {a, b}); }
    Term bv_sle(Term a, Term b) { return tm.mkTerm(Kind::BITVECTOR_SLE, {a, b}); }
    Term bv_ugt(Term a, Term b) { return tm.mkTerm(Kind::BITVECTOR_UGT, {a, b}); }
    Term bv_uge(Term a, Term b) { return tm.mkTerm(Kind::BITVECTOR_UGE, {a, b}); }
    Term bv_ult(Term a, Term b) { return tm.mkTerm(Kind::BITVECTOR_ULT, {a, b}); }
    Term bv_ule(Term a, Term b) { return tm.mkTerm(Kind::BITVECTOR_ULE, {a, b}); }

    // FP comparisons (for param range constraints)
    Term fp16_geq(Term a, Term b) { return tm.mkTerm(Kind::FLOATINGPOINT_GEQ, {a, b}); }
    Term fp16_leq(Term a, Term b) { return tm.mkTerm(Kind::FLOATINGPOINT_LEQ, {a, b}); }
    // Reinterpret a 16-bit BV as an IEEE-754 binary16 FP term.
    Term fp16_from_bv(Term bv16) {
        Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
        return tm.mkTerm(op, {bv16});
    }

    // Asserts
    void assert_(Term formula)     { solver->assertFormula(formula); }
    void assert_eq(Term t, Term v) { solver->assertFormula(equal(t, v)); }

    // Solving
    CheckResult check() {
        Result r = solver->checkSat();
        if (r.isUnsat()) return CheckResult::Unsat;
        if (r.isSat())   return CheckResult::Sat;
        return CheckResult::Unknown;
    }
    // Base-10 BV value as string (for CEX printing).
    std::string value_str(Term t) {
        return solver->getValue(t).getBitVectorValue(10);
    }

    // Per-query timeout in milliseconds.  cvc5 accepts this as a regular
    // option name and applies it to subsequent checkSat() calls.
    void set_query_timeout_ms(uint64_t ms) {
        solver->setOption("tlimit-per", std::to_string(ms));
    }
};

// ---------------------------------------------------------------------------
// Global thread-local context pointer
// ---------------------------------------------------------------------------
inline thread_local VerificationContext* g_ctx = nullptr;

// Scalar-term side channel for _Float16's copy-ctor (see symbolic_buffer.hpp).
inline thread_local std::unordered_map<const void*, Term> g_scalar_terms;

// ---------------------------------------------------------------------------
// Helper: BV value from signed int64, masked to width
// ---------------------------------------------------------------------------
inline Term mk_bv_val(TermManager& tm, size_t bits, int64_t val) {
    uint64_t mask = (bits >= 64) ? ~0ULL : ((1ULL << bits) - 1);
    return tm.mkBitVector(static_cast<uint32_t>(bits),
                          static_cast<uint64_t>(val) & mask);
}

// ---------------------------------------------------------------------------
// FP16 from concrete _Float16, possibly redirected through scalar side channel
// ---------------------------------------------------------------------------
inline Term mk_fp16_from_f16(TermManager& tm, const _Float16& value) {
    auto it = g_scalar_terms.find(&value);
    if (it != g_scalar_terms.end()) return it->second;
    Term bv = tm.mkBitVector(16, value.value);
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    return tm.mkTerm(op, {bv});
}

} // namespace salt_cvc5
