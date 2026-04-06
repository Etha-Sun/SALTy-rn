#pragma once
// VerificationContext — owns solver state, buffers, hardware config, FP profile.
// Replaces all cvc5 globals (g_symbolic_tm, g_symbolic_solver, g_current_vl, etc.)

#include <bitwuzla/cpp/bitwuzla.h>
#include <cmath>

#include <cstddef>
#include <cstdint>
#include <functional>
#include <map>
#include <memory>
#include <stdexcept>
#include <string>
#include <vector>

namespace salt {

using namespace bitwuzla;

// ---------------------------------------------------------------------------
// FP profile — frozen AArch64 FP environment
// ---------------------------------------------------------------------------
struct FPProfile {
    Term rounding_mode;          // RNE for the frozen profile
    bool flush_to_zero    = false; // FZ=0: preserve f32/f64 subnormals
    bool flush_to_zero_f16= false; // FZ16=0: preserve f16 subnormals
    bool default_nan      = false; // DN=0: ARM preserves NaN payloads, RVV produces canonical
    bool ah               = false; // AH=0: -0 < +0 in min/max
};

// ---------------------------------------------------------------------------
// Element kind — determines comparison strategy and op encoding
// ---------------------------------------------------------------------------
enum class ElementKind {
    SINT,   // signed integer (BV, arithmetic shift)
    UINT,   // unsigned integer (BV, logical shift)
    F16,    // IEEE 754 binary16
    F32,    // IEEE 754 binary32
    F64,    // IEEE 754 binary64
    MASK,   // 1-bit per element
};

// ---------------------------------------------------------------------------
// Forward declaration
// ---------------------------------------------------------------------------
class SymbolicBuffer;

// ---------------------------------------------------------------------------
// VerificationContext
// ---------------------------------------------------------------------------
struct VerificationContext {
    TermManager tm;
    Options opts;
    std::unique_ptr<Bitwuzla> solver;
    FPProfile fp;
    size_t vlen; // VLEN in bits — REQUIRED, no default

    // Buffer registry
    std::map<std::string, std::unique_ptr<SymbolicBuffer>> buffers;
    std::vector<SymbolicBuffer*> registered_buffers; // for address-based lookup

    explicit VerificationContext(size_t vlen) : vlen(vlen) {
        opts.set(Option::PRODUCE_MODELS, true);
        solver = std::make_unique<Bitwuzla>(tm, opts);
        fp.rounding_mode = tm.mk_rm_value(RoundingMode::RNE);
    }

    // Create and register a buffer by name
    SymbolicBuffer& registerBuffer(const std::string& name, size_t num_bytes);

    // Find which buffer owns a given pointer (for load/store intrinsics)
    SymbolicBuffer& findBuffer(const void* ptr);

    // Helper: commonly used sorts
    Sort bv_sort(size_t bits) { return tm.mk_bv_sort(bits); }
    Sort fp32_sort() { return tm.mk_fp_sort(8, 24); }
    Sort fp16_sort() { return tm.mk_fp_sort(5, 11); }

    // Helper: create a BV constant from a uint64
    Term bv_val(size_t bits, uint64_t val) {
        return tm.mk_bv_value_uint64(tm.mk_bv_sort(bits), val);
    }

    // Helper: create a named symbolic BV constant
    Term bv_const(size_t bits, const std::string& name) {
        return tm.mk_const(tm.mk_bv_sort(bits), name);
    }
};

// ---------------------------------------------------------------------------
// Global context pointer — intrinsics access solver via this
// ---------------------------------------------------------------------------
inline thread_local VerificationContext* g_ctx = nullptr;

// ---------------------------------------------------------------------------
// Helper: create a BV value from a signed int64, masking to the sort width.
// bitwuzla mk_bv_value_uint64 requires the value to fit unsigned in the width.
// ---------------------------------------------------------------------------
inline Term mk_bv_val(TermManager& tm, size_t bits, int64_t val) {
    uint64_t mask = (bits >= 64) ? ~0ULL : ((1ULL << bits) - 1);
    return tm.mk_bv_value_uint64(tm.mk_bv_sort(bits), static_cast<uint64_t>(val) & mask);
}

// ---------------------------------------------------------------------------
// Helper: create an FP32 term from a concrete float value.
// Handles special values (inf, nan) that bitwuzla's string-based API rejects.
// ---------------------------------------------------------------------------
// Safe float-to-string for mk_fp_value: handles inf/nan that bitwuzla rejects.
// Writes to buf and returns it. If special, returns nullptr (caller must use
// mk_fp_pos_inf/mk_fp_neg_inf/mk_fp_nan instead).
inline const char* float_to_real_str(char* buf, size_t bufsz, double value) {
    if (std::isinf(value) || std::isnan(value)) return nullptr;
    snprintf(buf, bufsz, "%.17f", value);
    return buf;
}

inline Term mk_fp32_from_float(TermManager& tm, float value) {
    Sort fp32 = tm.mk_fp_sort(8, 24);
    if (std::isinf(value)) {
        return value < 0 ? tm.mk_fp_neg_inf(fp32) : tm.mk_fp_pos_inf(fp32);
    }
    if (std::isnan(value)) {
        return tm.mk_fp_nan(fp32);
    }
    Term rm = g_ctx->fp.rounding_mode;
    char buf[64];
    snprintf(buf, sizeof(buf), "%.17f", static_cast<double>(value));
    return tm.mk_fp_value(fp32, rm, buf);
}

} // namespace salt
