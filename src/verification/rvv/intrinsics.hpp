#pragma once
// RVV intrinsics → bitwuzla BV/FP terms.
// Each intrinsic matches the real riscv_vector.h signature.
// Implementations follow RVV spec pseudocode from op-semantics/rvv-intrinsics.md.

#include "../core/bv_fold.hpp"
#include "../core/context.hpp"
#include "../core/symbolic_buffer.hpp"
#include "../core/symbolic_vector.hpp"

#include <bitwuzla/cpp/bitwuzla.h>

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <vector>

namespace salt {

using namespace bitwuzla;

// ===========================================================================
// vxrm constants (fixed-point rounding modes)
// ===========================================================================
constexpr unsigned __RISCV_VXRM_RNU = 0; // round-to-nearest-up
constexpr unsigned __RISCV_VXRM_RNE = 1; // round-to-nearest-even
constexpr unsigned __RISCV_VXRM_RDN = 2; // round-down (truncate)
constexpr unsigned __RISCV_VXRM_ROD = 3; // round-to-odd

// ===========================================================================
// Helper: rounding right shift for vxrm modes
// Returns (val >> shift) with rounding adjustment per vxrm
// ===========================================================================
inline Term rounded_shift_right(TermManager& tm, Term val, size_t shift,
                                 size_t bits, unsigned vxrm, bool is_signed) {
    if (shift == 0) return val;

    Sort sort = tm.mk_bv_sort(bits);
    Term shift_amt = tm.mk_bv_value_uint64(sort, shift);
    Term shifted = is_signed
        ? tm.mk_term(Kind::BV_ASHR, {val, shift_amt})
        : fold_bvlshr(tm, val, shift_amt);

    if (vxrm == __RISCV_VXRM_RDN) {
        return shifted; // truncate, no rounding
    }

    // Extract the rounding bit (bit at position shift-1)
    Term round_bit = tm.mk_term(Kind::BV_EXTRACT, {val},
                                  {static_cast<uint64_t>(shift - 1),
                                   static_cast<uint64_t>(shift - 1)});
    Term round_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {round_bit},
                                  {static_cast<uint64_t>(bits - 1)});

    if (vxrm == __RISCV_VXRM_RNU) {
        // RNU: add rounding bit
        return fold_bvadd(tm, shifted, round_ext);
    }

    if (vxrm == __RISCV_VXRM_RNE) {
        // RNE: round up iff round_bit=1 AND (lower bits nonzero OR result odd).
        // For shift==1 there are no lower bits, so the OR collapses to result_odd.
        Term result_bit0 = tm.mk_term(Kind::BV_EXTRACT, {shifted}, {0UL, 0UL});
        Term result_odd = fold_eq(tm, result_bit0, tm.mk_bv_value_uint64(tm.mk_bv_sort(1), 1));
        Term tie_breaker;
        if (shift >= 2) {
            Term lower = tm.mk_term(Kind::BV_EXTRACT, {val},
                                      {static_cast<uint64_t>(shift - 2), 0UL});
            Term lower_zero = fold_eq(tm, lower, tm.mk_bv_value_uint64(tm.mk_bv_sort(shift - 1), 0));
            tie_breaker = tm.mk_term(Kind::OR,
                {tm.mk_term(Kind::NOT, {lower_zero}), result_odd});
        } else {
            tie_breaker = result_odd;
        }
        Term should_round = tm.mk_term(Kind::AND, {
            fold_eq(tm, round_bit, tm.mk_bv_value_uint64(tm.mk_bv_sort(1), 1)),
            tie_breaker
        });
        Term one = tm.mk_bv_value_uint64(sort, 1);
        Term zero = tm.mk_bv_value_uint64(sort, 0);
        Term adj = fold_ite(tm, should_round, one, zero);
        return fold_bvadd(tm, shifted, adj);
    }

    // ROD: if any truncated bits are nonzero, set bit 0 of result to 1
    if (vxrm == __RISCV_VXRM_ROD) {
        Term truncated = tm.mk_term(Kind::BV_EXTRACT, {val},
                                      {static_cast<uint64_t>(shift - 1), 0UL});
        Term trunc_zero = fold_eq(tm, truncated, tm.mk_bv_value_uint64(tm.mk_bv_sort(shift), 0));
        Term one = tm.mk_bv_value_uint64(sort, 1);
        Term bit0_set = fold_bvor(tm, shifted, one);
        return fold_ite(tm, trunc_zero, shifted, bit0_set);
    }

    return shifted; // fallback
}

// ===========================================================================
// Helper: signed saturation (clip) for vnclip
// ===========================================================================
inline Term signed_clip(TermManager& tm, Term wide_val, size_t wide_bits, size_t narrow_bits) {
    int64_t max_val = (1LL << (narrow_bits - 1)) - 1;
    int64_t min_val = -(1LL << (narrow_bits - 1));

    Term t_max = mk_bv_val(tm, wide_bits, max_val);
    Term t_min = mk_bv_val(tm, wide_bits, min_val);

    Term gt_max = tm.mk_term(Kind::BV_SGT, {wide_val, t_max});
    Term lt_min = tm.mk_term(Kind::BV_SLT, {wide_val, t_min});
    Term clamped = tm.mk_term(Kind::ITE, {gt_max, t_max,
                    fold_ite(tm, lt_min, t_min, wide_val)});

    return tm.mk_term(Kind::BV_EXTRACT, {clamped},
                       {static_cast<uint64_t>(narrow_bits - 1), 0UL});
}

// ===========================================================================
// VSETVL — returns min(avl, vlmax) where vlmax = VLEN/SEW * LMUL
// ===========================================================================
inline size_t __riscv_vsetvl_e8m1(size_t avl)  { return std::min(avl, g_ctx->vlen / 8 * 1); }
inline size_t __riscv_vsetvl_e8m2(size_t avl)  { return std::min(avl, g_ctx->vlen / 8 * 2); }
inline size_t __riscv_vsetvl_e8m4(size_t avl)  { return std::min(avl, g_ctx->vlen / 8 * 4); }
inline size_t __riscv_vsetvl_e8m8(size_t avl)  { return std::min(avl, g_ctx->vlen / 8 * 8); }
inline size_t __riscv_vsetvl_e16m1(size_t avl) { return std::min(avl, g_ctx->vlen / 16 * 1); }
inline size_t __riscv_vsetvl_e16m2(size_t avl) { return std::min(avl, g_ctx->vlen / 16 * 2); }
inline size_t __riscv_vsetvl_e16m4(size_t avl) { return std::min(avl, g_ctx->vlen / 16 * 4); }
inline size_t __riscv_vsetvl_e16m8(size_t avl) { return std::min(avl, g_ctx->vlen / 16 * 8); }
inline size_t __riscv_vsetvl_e32m1(size_t avl) { return std::min(avl, g_ctx->vlen / 32 * 1); }
inline size_t __riscv_vsetvl_e32m2(size_t avl) { return std::min(avl, g_ctx->vlen / 32 * 2); }
inline size_t __riscv_vsetvl_e32m4(size_t avl) { return std::min(avl, g_ctx->vlen / 32 * 4); }
inline size_t __riscv_vsetvl_e32m8(size_t avl) { return std::min(avl, g_ctx->vlen / 32 * 8); }

// ===========================================================================
// VLE / VSE — vector load/store
// ===========================================================================
inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 8);
}

inline void __riscv_vse8_v_i8m2(int8_t* ptr, const vint8m2_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}

// ===========================================================================
// VWSUB — Widening Subtract (vector-scalar)
// Op: for i: res[i] = sext(op1[i]) - sext(op2)
// ===========================================================================
inline vint16m4_t __riscv_vwsub_vx_i16m4(const vint8m2_t& op1, int8_t op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_bv = mk_bv_val(tm, 8, op2);
    Term op2_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op2_bv}, {8}); // 8→16

    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {8});
        result.push_back(fold_bvsub(tm, a_ext, op2_ext));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// VSEXT — Sign Extend (vf2: double width)
// Op: for i: res[i] = sext(op1[i])
// ===========================================================================
inline vint32m8_t __riscv_vsext_vf2_i32m8(const vint16m4_t& op1, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        result.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {16}));
    }
    return RVVVector(tm, 32, result);
}

// ===========================================================================
// VMV — Move scalar to all vector elements
// Op: for i: res[i] = src
// ===========================================================================
inline vint32m8_t __riscv_vmv_v_x_i32m8(int32_t src, size_t vl) {
    auto& tm = g_ctx->tm;
    Term val = mk_bv_val(tm, 32, src);
    std::vector<Term> result(vl, val);
    return RVVVector(tm, 32, result);
}

// ===========================================================================
// VMACC — Multiply-Accumulate (vd = vd + rs1 * vs2)
// Op: for i: res[i] = (rs1 * vs2[i]) + vd[i]
// ===========================================================================
inline vint32m8_t __riscv_vmacc_vx_i32m8(const vint32m8_t& vd, int32_t rs1,
                                           const vint32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rs1_bv = mk_bv_val(tm, 32, rs1);

    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term prod = fold_bvmul(tm, rs1_bv, vs2.getElement(i));
        result.push_back(fold_bvadd(tm, vd.getElement(i), prod));
    }
    return RVVVector(tm, 32, result);
}

// ===========================================================================
// VSSRA — Scaling Shift Right Arithmetic (with rounding per vxrm)
// Op: for i: res[i] = rounded_shift_right(op1[i], shift, vxrm)
// ===========================================================================
inline vint32m8_t __riscv_vssra_vx_i32m8(const vint32m8_t& op1, size_t shift,
                                           unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        result.push_back(rounded_shift_right(tm, op1.getElement(i), shift, 32,
                                              vxrm, /*is_signed=*/true));
    }
    return RVVVector(tm, 32, result);
}

// ===========================================================================
// VNCLIP — Narrowing Clip with rounding (signed)
// Op: for i: res[i] = clip(rounded_shift_right(op1[i], shift))
// clip saturates to the narrower signed range
// ===========================================================================
inline vint16m4_t __riscv_vnclip_wx_i16m4(const vint32m8_t& op1, size_t shift,
                                            unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 32,
                                            vxrm, /*is_signed=*/true);
        result.push_back(signed_clip(tm, shifted, 32, 16));
    }
    return RVVVector(tm, 16, result);
}

inline vint8m2_t __riscv_vnclip_wx_i8m2(const vint16m4_t& op1, size_t shift,
                                          unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 16,
                                            vxrm, /*is_signed=*/true);
        result.push_back(signed_clip(tm, shifted, 16, 8));
    }
    return RVVVector(tm, 8, result);
}

// ===========================================================================
// VSADD — Saturating Add (signed, vector-scalar)
// Op: for i: res[i] = sat(op1[i] + op2)
// ===========================================================================
inline vint16m4_t __riscv_vsadd_vx_i16m4(const vint16m4_t& op1, int16_t op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_bv = mk_bv_val(tm, 16, op2);

    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        // Widen to 32 to detect overflow, then saturate back
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {16});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op2_bv}, {16});
        Term sum = fold_bvadd(tm, a_ext, b_ext);
        result.push_back(signed_clip(tm, sum, 32, 16));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// VMAX / VMIN — Signed max/min (vector-scalar)
// Op: for i: res[i] = max/min(op1[i], op2) signed
// ===========================================================================
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t& op1, int8_t op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_bv = mk_bv_val(tm, 8, op2);
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = tm.mk_term(Kind::BV_SGE, {op1.getElement(i), op2_bv});
        result.push_back(fold_ite(tm, cond, op1.getElement(i), op2_bv));
    }
    return RVVVector(tm, 8, result);
}

inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t& op1, int8_t op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_bv = mk_bv_val(tm, 8, op2);
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = tm.mk_term(Kind::BV_SLE, {op1.getElement(i), op2_bv});
        result.push_back(fold_ite(tm, cond, op1.getElement(i), op2_bv));
    }
    return RVVVector(tm, 8, result);
}

// ===========================================================================
// PHASE 2: Additional rounding, saturation, averaging intrinsics
// ===========================================================================

// ===========================================================================
// VSSRL — Scaling Shift Right Logical (unsigned, with rounding per vxrm)
// Same as vssra but uses logical (unsigned) shift
// ===========================================================================
inline RVVVector rvv_vssrl_impl(const RVVVector& op1, size_t shift,
                                 unsigned vxrm, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        result.push_back(rounded_shift_right(tm, op1.getElement(i), shift, bits,
                                              vxrm, /*is_signed=*/false));
    }
    return RVVVector(tm, bits, result);
}

inline vuint32m8_t __riscv_vssrl_vx_u32m8(const vuint32m8_t& op1, size_t shift,
                                            unsigned vxrm, size_t vl) {
    return rvv_vssrl_impl(op1, shift, vxrm, vl, 32);
}
inline vuint16m4_t __riscv_vssrl_vx_u16m4(const vuint16m4_t& op1, size_t shift,
                                            unsigned vxrm, size_t vl) {
    return rvv_vssrl_impl(op1, shift, vxrm, vl, 16);
}
inline vuint8m1_t __riscv_vssrl_vx_u8m1(const vuint8m1_t& op1, size_t shift,
                                          unsigned vxrm, size_t vl) {
    return rvv_vssrl_impl(op1, shift, vxrm, vl, 8);
}
inline vuint8m2_t __riscv_vssrl_vx_u8m2(const vuint8m2_t& op1, size_t shift,
                                          unsigned vxrm, size_t vl) {
    return rvv_vssrl_impl(op1, shift, vxrm, vl, 8);
}
inline vuint16m2_t __riscv_vssrl_vx_u16m2(const vuint16m2_t& op1, size_t shift,
                                            unsigned vxrm, size_t vl) {
    return rvv_vssrl_impl(op1, shift, vxrm, vl, 16);
}

// Additional LMUL variants of vssra
inline vint16m4_t __riscv_vssra_vx_i16m4(const vint16m4_t& op1, size_t shift,
                                           unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        result.push_back(rounded_shift_right(tm, op1.getElement(i), shift, 16,
                                              vxrm, /*is_signed=*/true));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// VAADD / VAADDU — Averaging Add (signed/unsigned)
// Op: res[i] = (op1[i] + op2[i] + round) >> 1
// Round depends on vxrm: RNU adds 1, RDN adds 0
// ===========================================================================
inline RVVVector rvv_vaadd_vv_impl(const RVVVector& op1, const RVVVector& op2,
                                    unsigned vxrm, size_t vl, size_t bits, bool is_signed) {
    auto& tm = g_ctx->tm;
    size_t W = bits + 1;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = is_signed
            ? tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {1UL})
            : tm.mk_term(Kind::BV_ZERO_EXTEND, {op1.getElement(i)}, {1UL});
        Term b_ext = is_signed
            ? tm.mk_term(Kind::BV_SIGN_EXTEND, {op2.getElement(i)}, {1UL})
            : tm.mk_term(Kind::BV_ZERO_EXTEND, {op2.getElement(i)}, {1UL});
        Term sum = fold_bvadd(tm, a_ext, b_ext);
        // Apply rounding per vxrm then shift right by 1
        Term shifted = rounded_shift_right(tm, sum, 1, W, vxrm, is_signed);
        result.push_back(tm.mk_term(Kind::BV_EXTRACT, {shifted},
                                     {static_cast<uint64_t>(bits - 1), 0UL}));
    }
    return RVVVector(tm, bits, result);
}

inline vint8m2_t __riscv_vaadd_vv_i8m2(const vint8m2_t& op1, const vint8m2_t& op2,
                                         unsigned vxrm, size_t vl) {
    return rvv_vaadd_vv_impl(op1, op2, vxrm, vl, 8, true);
}
inline vint16m4_t __riscv_vaadd_vv_i16m4(const vint16m4_t& op1, const vint16m4_t& op2,
                                           unsigned vxrm, size_t vl) {
    return rvv_vaadd_vv_impl(op1, op2, vxrm, vl, 16, true);
}
inline vint32m8_t __riscv_vaadd_vv_i32m8(const vint32m8_t& op1, const vint32m8_t& op2,
                                           unsigned vxrm, size_t vl) {
    return rvv_vaadd_vv_impl(op1, op2, vxrm, vl, 32, true);
}
inline vuint8m2_t __riscv_vaaddu_vv_u8m2(const vuint8m2_t& op1, const vuint8m2_t& op2,
                                           unsigned vxrm, size_t vl) {
    return rvv_vaadd_vv_impl(op1, op2, vxrm, vl, 8, false);
}
inline vuint16m4_t __riscv_vaaddu_vv_u16m4(const vuint16m4_t& op1, const vuint16m4_t& op2,
                                             unsigned vxrm, size_t vl) {
    return rvv_vaadd_vv_impl(op1, op2, vxrm, vl, 16, false);
}
inline vuint32m8_t __riscv_vaaddu_vv_u32m8(const vuint32m8_t& op1, const vuint32m8_t& op2,
                                             unsigned vxrm, size_t vl) {
    return rvv_vaadd_vv_impl(op1, op2, vxrm, vl, 32, false);
}

// Scalar variants (vx)
inline RVVVector rvv_vaadd_vx_impl(const RVVVector& op1, int64_t op2,
                                    unsigned vxrm, size_t vl, size_t bits, bool is_signed) {
    auto& tm = g_ctx->tm;
    size_t W = bits + 1;
    Term op2_bv = mk_bv_val(tm, bits, op2);
    Term op2_ext = is_signed
        ? tm.mk_term(Kind::BV_SIGN_EXTEND, {op2_bv}, {1UL})
        : tm.mk_term(Kind::BV_ZERO_EXTEND, {op2_bv}, {1UL});
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = is_signed
            ? tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {1UL})
            : tm.mk_term(Kind::BV_ZERO_EXTEND, {op1.getElement(i)}, {1UL});
        Term sum = fold_bvadd(tm, a_ext, op2_ext);
        Term shifted = rounded_shift_right(tm, sum, 1, W, vxrm, is_signed);
        result.push_back(tm.mk_term(Kind::BV_EXTRACT, {shifted},
                                     {static_cast<uint64_t>(bits - 1), 0UL}));
    }
    return RVVVector(tm, bits, result);
}

inline vint8m2_t __riscv_vaadd_vx_i8m2(const vint8m2_t& op1, int8_t op2,
                                         unsigned vxrm, size_t vl) {
    return rvv_vaadd_vx_impl(op1, op2, vxrm, vl, 8, true);
}
inline vuint8m2_t __riscv_vaaddu_vx_u8m2(const vuint8m2_t& op1, uint8_t op2,
                                           unsigned vxrm, size_t vl) {
    return rvv_vaadd_vx_impl(op1, op2, vxrm, vl, 8, false);
}
inline vint16m4_t __riscv_vaadd_vx_i16m4(const vint16m4_t& op1, int16_t op2,
                                           unsigned vxrm, size_t vl) {
    return rvv_vaadd_vx_impl(op1, op2, vxrm, vl, 16, true);
}
inline vint32m8_t __riscv_vaadd_vx_i32m8(const vint32m8_t& op1, int32_t op2,
                                           unsigned vxrm, size_t vl) {
    return rvv_vaadd_vx_impl(op1, op2, vxrm, vl, 32, true);
}
inline vuint16m4_t __riscv_vaaddu_vx_u16m4(const vuint16m4_t& op1, uint16_t op2,
                                             unsigned vxrm, size_t vl) {
    return rvv_vaadd_vx_impl(op1, op2, vxrm, vl, 16, false);
}
inline vuint32m8_t __riscv_vaaddu_vx_u32m8(const vuint32m8_t& op1, uint32_t op2,
                                             unsigned vxrm, size_t vl) {
    return rvv_vaadd_vx_impl(op1, op2, vxrm, vl, 32, false);
}

// ===========================================================================
// VNCLIPU — Unsigned Narrowing Clip with rounding
// Op: res[i] = clip_unsigned(rounded_shift_right(op1[i], shift))
// ===========================================================================
inline Term unsigned_clip(TermManager& tm, Term wide_val, size_t wide_bits, size_t narrow_bits) {
    uint64_t max_val = (1ULL << narrow_bits) - 1;
    Term t_max = mk_bv_val(tm, wide_bits, static_cast<int64_t>(max_val));
    Term t_zero = mk_bv_val(tm, wide_bits, 0);

    // Unsigned: clamp to [0, max_val]
    Term gt_max = tm.mk_term(Kind::BV_UGT, {wide_val, t_max});
    // For signed input narrowed to unsigned, also clamp negative to 0
    Term lt_zero = tm.mk_term(Kind::BV_SLT, {wide_val, t_zero});
    Term clamped = tm.mk_term(Kind::ITE, {gt_max, t_max,
                    fold_ite(tm, lt_zero, t_zero, wide_val)});
    return tm.mk_term(Kind::BV_EXTRACT, {clamped},
                       {static_cast<uint64_t>(narrow_bits - 1), 0UL});
}

inline vuint8m1_t __riscv_vnclipu_wx_u8m1(const vuint16m2_t& op1, size_t shift,
                                            unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 16,
                                            vxrm, /*is_signed=*/false);
        result.push_back(unsigned_clip(tm, shifted, 16, 8));
    }
    return RVVVector(tm, 8, result);
}

inline vuint16m2_t __riscv_vnclipu_wx_u16m2(const vuint32m4_t& op1, size_t shift,
                                              unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 32,
                                            vxrm, /*is_signed=*/false);
        result.push_back(unsigned_clip(tm, shifted, 32, 16));
    }
    return RVVVector(tm, 16, result);
}
inline vuint8m2_t __riscv_vnclipu_wx_u8m2(const vuint16m4_t& op1, size_t shift,
                                            unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 16,
                                            vxrm, /*is_signed=*/false);
        result.push_back(unsigned_clip(tm, shifted, 16, 8));
    }
    return RVVVector(tm, 8, result);
}
inline vuint16m4_t __riscv_vnclipu_wx_u16m4(const vuint32m8_t& op1, size_t shift,
                                              unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 32,
                                            vxrm, /*is_signed=*/false);
        result.push_back(unsigned_clip(tm, shifted, 32, 16));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// VSSUB — Saturating Subtract (signed, vector-scalar)
// ===========================================================================
inline vint16m4_t __riscv_vssub_vx_i16m4(const vint16m4_t& op1, int16_t op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_bv = mk_bv_val(tm, 16, op2);
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {16});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op2_bv}, {16});
        Term diff = fold_bvsub(tm, a_ext, b_ext);
        result.push_back(signed_clip(tm, diff, 32, 16));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// Additional LMUL/width variants of existing ops for broader kernel coverage
// ===========================================================================

// vnclip additional variants
inline vint16m2_t __riscv_vnclip_wx_i16m2(const vint32m4_t& op1, size_t shift,
                                            unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 32,
                                            vxrm, /*is_signed=*/true);
        result.push_back(signed_clip(tm, shifted, 32, 16));
    }
    return RVVVector(tm, 16, result);
}

inline vint8m1_t __riscv_vnclip_wx_i8m1(const vint16m2_t& op1, size_t shift,
                                          unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 16,
                                            vxrm, /*is_signed=*/true);
        result.push_back(signed_clip(tm, shifted, 16, 8));
    }
    return RVVVector(tm, 8, result);
}
inline vint8m4_t __riscv_vnclip_wx_i8m4(const vint16m8_t& op1, size_t shift,
                                          unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 16,
                                            vxrm, /*is_signed=*/true);
        result.push_back(signed_clip(tm, shifted, 16, 8));
    }
    return RVVVector(tm, 8, result);
}

// vssra additional variants — generic impl
inline RVVVector rvv_vssra_impl(const RVVVector& op1, size_t shift,
                                 unsigned vxrm, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        result.push_back(rounded_shift_right(tm, op1.getElement(i), shift, bits,
                                              vxrm, /*is_signed=*/true));
    }
    return RVVVector(tm, bits, result);
}
inline vint8m1_t  __riscv_vssra_vx_i8m1(const vint8m1_t& op1, size_t shift, unsigned vxrm, size_t vl)   { return rvv_vssra_impl(op1, shift, vxrm, vl, 8); }
inline vint8m2_t  __riscv_vssra_vx_i8m2(const vint8m2_t& op1, size_t shift, unsigned vxrm, size_t vl)   { return rvv_vssra_impl(op1, shift, vxrm, vl, 8); }
inline vint16m2_t __riscv_vssra_vx_i16m2(const vint16m2_t& op1, size_t shift, unsigned vxrm, size_t vl) { return rvv_vssra_impl(op1, shift, vxrm, vl, 16); }
inline vint32m1_t __riscv_vssra_vx_i32m1(const vint32m1_t& op1, size_t shift, unsigned vxrm, size_t vl) { return rvv_vssra_impl(op1, shift, vxrm, vl, 32); }
inline vint32m2_t __riscv_vssra_vx_i32m2(const vint32m2_t& op1, size_t shift, unsigned vxrm, size_t vl) { return rvv_vssra_impl(op1, shift, vxrm, vl, 32); }
inline vint32m4_t __riscv_vssra_vx_i32m4(const vint32m4_t& op1, size_t shift, unsigned vxrm, size_t vl) { return rvv_vssra_impl(op1, shift, vxrm, vl, 32); }

// ===========================================================================
// PHASE 3: Floating-point RVV intrinsics
// ===========================================================================

// FP helpers (same as NEON side)
inline Term rvv_load_as_fp32(TermManager& tm, Term bv) {
    return tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {8, 24});
}

inline size_t& rvv_fp_bv_counter() {
    static size_t counter = 0;
    return counter;
}

inline Term rvv_store_fp32_as_bv(TermManager& tm, Term fp_val) {
    Sort bv32 = tm.mk_bv_sort(32);
    Term bv = tm.mk_const(bv32, "_rvv_fp2bv_" + std::to_string(rvv_fp_bv_counter()++));
    Term fp_from_bv = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {8, 24});
    g_ctx->solver->assert_formula(fold_eq(tm, fp_from_bv, fp_val));
    return bv;
}

// Helper: apply binary FP op element-wise
inline RVVVector rvv_fp32_binop(const RVVVector& a, const RVVVector& b, Kind op, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    // Per RVV spec: FP_MAX/FP_MIN are comparison-based (no rounding mode).
    // FP_ADD/FP_SUB/FP_MUL/FP_DIV are arithmetic (need rounding mode).
    bool needs_rm = (op != Kind::FP_MAX && op != Kind::FP_MIN);
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term res_fp = needs_rm ? tm.mk_term(op, {rm, a_fp, b_fp}) : tm.mk_term(op, {a_fp, b_fp});
        result.push_back(rvv_store_fp32_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 32, result);
}

// ===========================================================================
// VLE / VSE for float32
// ===========================================================================
inline vfloat32m1_t __riscv_vle32_v_f32m1(const float* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 32);
}
inline vfloat32m2_t __riscv_vle32_v_f32m2(const float* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 32);
}
inline vfloat32m4_t __riscv_vle32_v_f32m4(const float* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 32);
}
inline vfloat32m8_t __riscv_vle32_v_f32m8(const float* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 32);
}

inline void __riscv_vse32_v_f32m1(float* ptr, const vfloat32m1_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}
inline void __riscv_vse32_v_f32m2(float* ptr, const vfloat32m2_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}
inline void __riscv_vse32_v_f32m4(float* ptr, const vfloat32m4_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}
inline void __riscv_vse32_v_f32m8(float* ptr, const vfloat32m8_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}

// ===========================================================================
// FP arithmetic: add, sub, mul, div
// ===========================================================================
inline vfloat32m1_t __riscv_vfadd_vv_f32m1(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_ADD, vl);
}
inline vfloat32m2_t __riscv_vfadd_vv_f32m2(const vfloat32m2_t& a, const vfloat32m2_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_ADD, vl);
}

inline vfloat32m1_t __riscv_vfsub_vv_f32m1(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_SUB, vl);
}
inline vfloat32m2_t __riscv_vfsub_vv_f32m2(const vfloat32m2_t& a, const vfloat32m2_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_SUB, vl);
}

inline vfloat32m1_t __riscv_vfmul_vv_f32m1(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_MUL, vl);
}
inline vfloat32m2_t __riscv_vfmul_vv_f32m2(const vfloat32m2_t& a, const vfloat32m2_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_MUL, vl);
}

inline vfloat32m1_t __riscv_vfdiv_vv_f32m1(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_DIV, vl);
}

// Scalar variants (_vf)
inline vfloat32m2_t __riscv_vfmul_vf_f32m2(const vfloat32m2_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);

    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_MUL, {rm, a_fp, b_fp});
        result.push_back(rvv_store_fp32_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 32, result);
}


// ===========================================================================
// FP FMA (fused multiply-accumulate): vd = vd + vs1 * vs2
// ===========================================================================
inline vfloat32m1_t __riscv_vfmacc_vv_f32m1(const vfloat32m1_t& vd, const vfloat32m1_t& vs1,
                                              const vfloat32m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp32(tm, vs2.getElement(i));
        // FMA: vd + vs1 * vs2
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, vs1_fp, vs2_fp, vd_fp});
        result.push_back(rvv_store_fp32_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 32, result);
}

// vfnmsac: vd = vd - vs1 * vs2  (fused)
inline vfloat32m1_t __riscv_vfnmsac_vv_f32m1(const vfloat32m1_t& vd, const vfloat32m1_t& vs1,
                                               const vfloat32m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp32(tm, vs2.getElement(i));
        Term neg_vs1 = tm.mk_term(Kind::FP_NEG, {vs1_fp});
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, neg_vs1, vs2_fp, vd_fp});
        result.push_back(rvv_store_fp32_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 32, result);
}

// ===========================================================================
// FP MIN / MAX (IEEE 754 minNum/maxNum)
// ===========================================================================
inline vfloat32m1_t __riscv_vfmin_vv_f32m1(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_MIN, vl);
}
inline vfloat32m2_t __riscv_vfmin_vv_f32m2(const vfloat32m2_t& a, const vfloat32m2_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_MIN, vl);
}
inline vfloat32m4_t __riscv_vfmin_vv_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_MIN, vl);
}
inline vfloat32m1_t __riscv_vfmax_vv_f32m1(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_MAX, vl);
}
inline vfloat32m2_t __riscv_vfmax_vv_f32m2(const vfloat32m2_t& a, const vfloat32m2_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_MAX, vl);
}
inline vfloat32m4_t __riscv_vfmax_vv_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) {
    return rvv_fp32_binop(a, b, Kind::FP_MAX, vl);
}

// ===========================================================================
// FP ABS / NEG / SQRT
// ===========================================================================
inline vfloat32m1_t __riscv_vfabs_v_f32m1(const vfloat32m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        result.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_ABS, {a_fp})));
    }
    return RVVVector(tm, 32, result);
}

inline vfloat32m1_t __riscv_vfneg_v_f32m1(const vfloat32m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        result.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_NEG, {a_fp})));
    }
    return RVVVector(tm, 32, result);
}

inline vfloat32m1_t __riscv_vfsqrt_v_f32m1(const vfloat32m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        result.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_SQRT, {rm, a_fp})));
    }
    return RVVVector(tm, 32, result);
}

// FP ABS m2, m4
inline vfloat32m2_t __riscv_vfabs_v_f32m2(const vfloat32m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_ABS, {rvv_load_as_fp32(tm, a.getElement(i))})));
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfabs_v_f32m4(const vfloat32m4_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_ABS, {rvv_load_as_fp32(tm, a.getElement(i))})));
    return RVVVector(tm, 32, r);
}
// FP NEG m2, m4
inline vfloat32m2_t __riscv_vfneg_v_f32m2(const vfloat32m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_NEG, {rvv_load_as_fp32(tm, a.getElement(i))})));
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfneg_v_f32m4(const vfloat32m4_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_NEG, {rvv_load_as_fp32(tm, a.getElement(i))})));
    return RVVVector(tm, 32, r);
}
// FP SQRT m2, m4
inline vfloat32m2_t __riscv_vfsqrt_v_f32m2(const vfloat32m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_SQRT, {rm, rvv_load_as_fp32(tm, a.getElement(i))})));
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfsqrt_v_f32m4(const vfloat32m4_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_SQRT, {rm, rvv_load_as_fp32(tm, a.getElement(i))})));
    return RVVVector(tm, 32, r);
}

// ===========================================================================
// FP Conversions: int ↔ float
// ===========================================================================

// vfcvt_f_x: signed int32 → float32
inline vfloat32m1_t __riscv_vfcvt_f_x_v_f32m1(const vint32m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term fp = tm.mk_term(Kind::FP_TO_FP_FROM_SBV, {rm, a.getElement(i)}, {8, 24});
        result.push_back(rvv_store_fp32_as_bv(tm, fp));
    }
    return RVVVector(tm, 32, result);
}

// vfcvt_rtz_x_f: float32 → signed int32 (round toward zero)
inline vint32m1_t __riscv_vfcvt_rtz_x_f_v_i32m1(const vfloat32m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rtz = tm.mk_rm_value(RoundingMode::RTZ);
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        result.push_back(tm.mk_term(Kind::FP_TO_SBV, {rtz, a_fp}, {32}));
    }
    return RVVVector(tm, 32, result);
}

// vfcvt_x_f: float32 → signed int32 (uses dynamic frm — we use RNE)
inline vint32m1_t __riscv_vfcvt_x_f_v_i32m1(const vfloat32m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode; // RNE
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        result.push_back(tm.mk_term(Kind::FP_TO_SBV, {rm, a_fp}, {32}));
    }
    return RVVVector(tm, 32, result);
}

// With explicit rounding mode
inline vint32m8_t __riscv_vfcvt_x_f_v_i32m8(const vfloat32m8_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        result.push_back(tm.mk_term(Kind::FP_TO_SBV, {rm, a_fp}, {32}));
    }
    return RVVVector(tm, 32, result);
}

// ===========================================================================
// FP broadcast (vmv scalar to vector)
// ===========================================================================
inline vfloat32m1_t __riscv_vfmv_v_f_f32m1(float src, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term fp = mk_fp32_from_float(tm, src);
    Term bv = rvv_store_fp32_as_bv(tm, fp);
    std::vector<Term> result(vl, bv);
    return RVVVector(tm, 32, result);
}

// ===========================================================================
// PHASE 4: Remaining RVV intrinsics from old cvc5 library
// Generic helpers + thin LMUL wrappers
// ===========================================================================

// ---------------------------------------------------------------------------
// Generic integer binary ops (vv and vx variants)
// ---------------------------------------------------------------------------
#define RVV_BIN_VV(name, kind, bits)                                          \
inline RVVVector __riscv_##name(const RVVVector& a, const RVVVector& b, size_t vl) { \
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);               \
    for (size_t i = 0; i < vl; i++)                                           \
        r.push_back(tm.mk_term(Kind::kind, {a.getElement(i), b.getElement(i)})); \
    return RVVVector(tm, bits, r);                                            \
}

#define RVV_BIN_VX(name, kind, bits, scalar_type)                             \
inline RVVVector __riscv_##name(const RVVVector& a, scalar_type op2, size_t vl) { \
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, bits, op2);               \
    std::vector<Term> r; r.reserve(vl);                                       \
    for (size_t i = 0; i < vl; i++)                                           \
        r.push_back(tm.mk_term(Kind::kind, {a.getElement(i), bv}));          \
    return RVVVector(tm, bits, r);                                            \
}

// VADD vv
RVV_BIN_VV(vadd_vv_i8m1,  BV_ADD, 8)
RVV_BIN_VV(vadd_vv_i8m2,  BV_ADD, 8)
RVV_BIN_VV(vadd_vv_i16m2, BV_ADD, 16)
RVV_BIN_VV(vadd_vv_i16m4, BV_ADD, 16)
RVV_BIN_VV(vadd_vv_i32m1, BV_ADD, 32)
RVV_BIN_VV(vadd_vv_i32m2, BV_ADD, 32)
RVV_BIN_VV(vadd_vv_i32m4, BV_ADD, 32)
RVV_BIN_VV(vadd_vv_i32m8, BV_ADD, 32)
RVV_BIN_VV(vadd_vv_u8m1,  BV_ADD, 8)
RVV_BIN_VV(vadd_vv_u8m2,  BV_ADD, 8)
RVV_BIN_VV(vadd_vv_u16m2, BV_ADD, 16)
RVV_BIN_VV(vadd_vv_u16m4, BV_ADD, 16)
RVV_BIN_VV(vadd_vv_u32m1, BV_ADD, 32)
RVV_BIN_VV(vadd_vv_u32m2, BV_ADD, 32)
RVV_BIN_VV(vadd_vv_u32m4, BV_ADD, 32)
// VADD vx
RVV_BIN_VX(vadd_vx_i8m1,   BV_ADD, 8,  int8_t)
RVV_BIN_VX(vadd_vx_i8m2,   BV_ADD, 8,  int8_t)
RVV_BIN_VX(vadd_vx_i16m1,  BV_ADD, 16, int16_t)
RVV_BIN_VX(vadd_vx_i16m2,  BV_ADD, 16, int16_t)
RVV_BIN_VX(vadd_vx_i16m4,  BV_ADD, 16, int16_t)
RVV_BIN_VX(vadd_vx_i32m1,  BV_ADD, 32, int32_t)
RVV_BIN_VX(vadd_vx_i32m2,  BV_ADD, 32, int32_t)
RVV_BIN_VX(vadd_vx_i32m4,  BV_ADD, 32, int32_t)
RVV_BIN_VX(vadd_vx_i32m8,  BV_ADD, 32, int32_t)
RVV_BIN_VX(vadd_vx_u8m1,   BV_ADD, 8,  uint8_t)
RVV_BIN_VX(vadd_vx_u8m2,   BV_ADD, 8,  uint8_t)
RVV_BIN_VX(vadd_vx_u16m2,  BV_ADD, 16, uint16_t)
RVV_BIN_VX(vadd_vx_u16m4,  BV_ADD, 16, uint16_t)
RVV_BIN_VX(vadd_vx_u32m1,  BV_ADD, 32, uint32_t)
RVV_BIN_VX(vadd_vx_u32m2,  BV_ADD, 32, uint32_t)
RVV_BIN_VX(vadd_vx_u32m4,  BV_ADD, 32, uint32_t)
// VSUB vv
RVV_BIN_VV(vsub_vv_i8m1,  BV_SUB, 8)
RVV_BIN_VV(vsub_vv_i8m2,  BV_SUB, 8)
RVV_BIN_VV(vsub_vv_i16m2, BV_SUB, 16)
RVV_BIN_VV(vsub_vv_i16m4, BV_SUB, 16)
RVV_BIN_VV(vsub_vv_i32m1, BV_SUB, 32)
RVV_BIN_VV(vsub_vv_i32m2, BV_SUB, 32)
RVV_BIN_VV(vsub_vv_i32m4, BV_SUB, 32)
RVV_BIN_VV(vsub_vv_i32m8, BV_SUB, 32)
// VSUB vx
RVV_BIN_VX(vsub_vx_i8m1,   BV_SUB, 8,  int8_t)
RVV_BIN_VX(vsub_vx_i8m2,   BV_SUB, 8,  int8_t)
RVV_BIN_VX(vsub_vx_i16m1,  BV_SUB, 16, int16_t)
RVV_BIN_VX(vsub_vx_i16m2,  BV_SUB, 16, int16_t)
RVV_BIN_VX(vsub_vx_i16m4,  BV_SUB, 16, int16_t)
RVV_BIN_VX(vsub_vx_i16mf2, BV_SUB, 16, int16_t)
RVV_BIN_VX(vsub_vx_i32m1,  BV_SUB, 32, int32_t)
RVV_BIN_VX(vsub_vx_i32m2,  BV_SUB, 32, int32_t)
RVV_BIN_VX(vsub_vx_i32m4,  BV_SUB, 32, int32_t)
RVV_BIN_VX(vsub_vx_i32m8,  BV_SUB, 32, int32_t)
// VMUL vv
RVV_BIN_VV(vmul_vv_i32m1, BV_MUL, 32)
RVV_BIN_VV(vmul_vv_i32m2, BV_MUL, 32)
RVV_BIN_VV(vmul_vv_i32m4, BV_MUL, 32)
RVV_BIN_VV(vmul_vv_i32m8, BV_MUL, 32)
// VMUL vx
RVV_BIN_VX(vmul_vx_i32m1, BV_MUL, 32, int32_t)
RVV_BIN_VX(vmul_vx_i32m2, BV_MUL, 32, int32_t)
RVV_BIN_VX(vmul_vx_i32m4, BV_MUL, 32, int32_t)
RVV_BIN_VX(vmul_vx_i32m8, BV_MUL, 32, int32_t)
// VAND
RVV_BIN_VV(vand_vv_i8m1,   BV_AND, 8)
RVV_BIN_VV(vand_vv_i8m2,   BV_AND, 8)
RVV_BIN_VV(vand_vv_i32m4,  BV_AND, 32)
RVV_BIN_VX(vand_vx_i8m1,   BV_AND, 8,  int8_t)
RVV_BIN_VX(vand_vx_i8m2,   BV_AND, 8,  int8_t)
RVV_BIN_VX(vand_vx_i32m1,  BV_AND, 32, int32_t)
RVV_BIN_VX(vand_vx_i32m4,  BV_AND, 32, int32_t)
RVV_BIN_VX(vand_vx_i32m8,  BV_AND, 32, int32_t)
RVV_BIN_VX(vand_vx_u16m2,  BV_AND, 16, uint16_t)
RVV_BIN_VX(vand_vx_u16m4,  BV_AND, 16, uint16_t)
RVV_BIN_VX(vand_vx_u16m8,  BV_AND, 16, uint16_t)
// VOR
RVV_BIN_VV(vor_vv_i8m1,  BV_OR, 8)
RVV_BIN_VV(vor_vv_i8m2,  BV_OR, 8)
RVV_BIN_VV(vor_vv_u8m1,  BV_OR, 8)
RVV_BIN_VV(vor_vv_u8m2,  BV_OR, 8)
RVV_BIN_VX(vor_vx_i8m1,  BV_OR, 8,  int8_t)
RVV_BIN_VX(vor_vx_i8m2,  BV_OR, 8,  int8_t)
RVV_BIN_VX(vor_vx_u8m1,  BV_OR, 8,  uint8_t)
RVV_BIN_VX(vor_vx_u8m2,  BV_OR, 8,  uint8_t)
// VXOR
RVV_BIN_VV(vxor_vv_i8m1,  BV_XOR, 8)
RVV_BIN_VV(vxor_vv_i8m2,  BV_XOR, 8)
RVV_BIN_VX(vxor_vx_i8m1,  BV_XOR, 8,  int8_t)
RVV_BIN_VX(vxor_vx_i8m2,  BV_XOR, 8,  int8_t)
// VRSUB (reverse subtract: op2 - a[i])
inline RVVVector rvv_vrsub_vx_impl(const RVVVector& a, int64_t op2, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, bits, op2);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(fold_bvsub(tm, bv, a.getElement(i)));
    return RVVVector(tm, bits, r);
}
inline RVVVector __riscv_vrsub_vx_i8m1(const RVVVector& a, int8_t op2, size_t vl) { return rvv_vrsub_vx_impl(a, op2, vl, 8); }
inline RVVVector __riscv_vrsub_vx_i8m2(const RVVVector& a, int8_t op2, size_t vl) { return rvv_vrsub_vx_impl(a, op2, vl, 8); }
inline RVVVector __riscv_vrsub_vx_i16m1(const RVVVector& a, int16_t op2, size_t vl) { return rvv_vrsub_vx_impl(a, op2, vl, 16); }
inline RVVVector __riscv_vrsub_vx_i16m2(const RVVVector& a, int16_t op2, size_t vl) { return rvv_vrsub_vx_impl(a, op2, vl, 16); }
inline RVVVector __riscv_vrsub_vx_i16m4(const RVVVector& a, int16_t op2, size_t vl) { return rvv_vrsub_vx_impl(a, op2, vl, 16); }
inline RVVVector __riscv_vrsub_vx_i32m1(const RVVVector& a, int32_t op2, size_t vl) { return rvv_vrsub_vx_impl(a, op2, vl, 32); }
inline RVVVector __riscv_vrsub_vx_i32m4(const RVVVector& a, int32_t op2, size_t vl) { return rvv_vrsub_vx_impl(a, op2, vl, 32); }
// VSLL (shift left)
#define RVV_SLL_VX(name, bits, stype)                                         \
inline RVVVector __riscv_##name(const RVVVector& a, stype op2, size_t vl) {  \
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, bits, op2);               \
    std::vector<Term> r; r.reserve(vl);                                       \
    for (size_t i = 0; i < vl; i++)                                           \
        r.push_back(fold_bvshl(tm, a.getElement(i), sh));       \
    return RVVVector(tm, bits, r);                                            \
}
RVV_SLL_VX(vsll_vx_i8m1,  8,  size_t)
RVV_SLL_VX(vsll_vx_i8m2,  8,  size_t)
RVV_SLL_VX(vsll_vx_i16m1, 16, size_t)
RVV_SLL_VX(vsll_vx_i16m2, 16, size_t)
RVV_SLL_VX(vsll_vx_i16m4, 16, size_t)
RVV_SLL_VX(vsll_vx_i32m1, 32, size_t)
RVV_SLL_VX(vsll_vx_i32m2, 32, size_t)
RVV_SLL_VX(vsll_vx_i32m4, 32, size_t)
RVV_SLL_VX(vsll_vx_i32m8, 32, size_t)
RVV_SLL_VX(vsll_vx_u8m1,  8,  size_t)
RVV_SLL_VX(vsll_vx_u8m2,  8,  size_t)
RVV_SLL_VX(vsll_vx_u16m2, 16, size_t)
RVV_SLL_VX(vsll_vx_u16m4, 16, size_t)
RVV_SLL_VX(vsll_vx_u32m1, 32, size_t)
RVV_SLL_VX(vsll_vx_u32m2, 32, size_t)
RVV_SLL_VX(vsll_vx_u32m4, 32, size_t)
RVV_SLL_VX(vsll_vx_u32m8, 32, size_t)
// VSRA (arithmetic shift right)
#define RVV_SRA_VX(name, bits)                                                \
inline RVVVector __riscv_##name(const RVVVector& a, size_t shift, size_t vl) { \
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, bits, shift);             \
    std::vector<Term> r; r.reserve(vl);                                       \
    for (size_t i = 0; i < vl; i++)                                           \
        r.push_back(tm.mk_term(Kind::BV_ASHR, {a.getElement(i), sh}));      \
    return RVVVector(tm, bits, r);                                            \
}
RVV_SRA_VX(vsra_vx_i16m2, 16)
RVV_SRA_VX(vsra_vx_i16m4, 16)
RVV_SRA_VX(vsra_vx_i32m1, 32)
RVV_SRA_VX(vsra_vx_i32m2, 32)
RVV_SRA_VX(vsra_vx_i32m4, 32)
RVV_SRA_VX(vsra_vx_i32m8, 32)
// VSRL (logical shift right)
#define RVV_SRL_VX(name, bits)                                                \
inline RVVVector __riscv_##name(const RVVVector& a, size_t shift, size_t vl) { \
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, bits, shift);             \
    std::vector<Term> r; r.reserve(vl);                                       \
    for (size_t i = 0; i < vl; i++)                                           \
        r.push_back(fold_bvlshr(tm, a.getElement(i), sh));      \
    return RVVVector(tm, bits, r);                                            \
}
RVV_SRL_VX(vsrl_vx_u8m1,  8)
RVV_SRL_VX(vsrl_vx_u8m2,  8)
RVV_SRL_VX(vsrl_vx_u16m1, 16)
RVV_SRL_VX(vsrl_vx_u16m2, 16)
RVV_SRL_VX(vsrl_vx_u16m4, 16)
RVV_SRL_VX(vsrl_vx_u32m1, 32)
RVV_SRL_VX(vsrl_vx_u32m4, 32)

// ---------------------------------------------------------------------------
// Integer max/min (signed/unsigned, vv and vx)
// ---------------------------------------------------------------------------
#define RVV_MINMAX_VX(name, cmp_kind, bits, stype)                            \
inline RVVVector __riscv_##name(const RVVVector& a, stype op2, size_t vl) {  \
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, bits, op2);               \
    std::vector<Term> r; r.reserve(vl);                                       \
    for (size_t i = 0; i < vl; i++) {                                         \
        Term cond = tm.mk_term(Kind::cmp_kind, {a.getElement(i), bv});       \
        r.push_back(fold_ite(tm, cond, a.getElement(i), bv));    \
    }                                                                          \
    return RVVVector(tm, bits, r);                                            \
}
#define RVV_MINMAX_VV(name, cmp_kind, bits)                                   \
inline RVVVector __riscv_##name(const RVVVector& a, const RVVVector& b, size_t vl) { \
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);               \
    for (size_t i = 0; i < vl; i++) {                                         \
        Term cond = tm.mk_term(Kind::cmp_kind, {a.getElement(i), b.getElement(i)}); \
        r.push_back(fold_ite(tm, cond, a.getElement(i), b.getElement(i))); \
    }                                                                          \
    return RVVVector(tm, bits, r);                                            \
}
RVV_MINMAX_VX(vmax_vx_i8m1,   BV_SGE, 8,  int8_t)
RVV_MINMAX_VX(vmax_vx_i16m2,  BV_SGE, 16, int16_t)
RVV_MINMAX_VX(vmax_vx_i16m4,  BV_SGE, 16, int16_t)
RVV_MINMAX_VX(vmax_vx_i32m1,  BV_SGE, 32, int32_t)
RVV_MINMAX_VX(vmax_vx_i32m2,  BV_SGE, 32, int32_t)
RVV_MINMAX_VX(vmax_vx_i32m4,  BV_SGE, 32, int32_t)
RVV_MINMAX_VX(vmax_vx_i32m8,  BV_SGE, 32, int32_t)
RVV_MINMAX_VX(vmin_vx_i8m1,   BV_SLE, 8,  int8_t)
RVV_MINMAX_VX(vmin_vx_i16m2,  BV_SLE, 16, int16_t)
RVV_MINMAX_VX(vmin_vx_i16m4,  BV_SLE, 16, int16_t)
RVV_MINMAX_VX(vmin_vx_i32m1,  BV_SLE, 32, int32_t)
RVV_MINMAX_VX(vmin_vx_i32m2,  BV_SLE, 32, int32_t)
RVV_MINMAX_VX(vmin_vx_i32m4,  BV_SLE, 32, int32_t)
RVV_MINMAX_VX(vmin_vx_i32m8,  BV_SLE, 32, int32_t)
RVV_MINMAX_VX(vminu_vx_u32m1, BV_ULE, 32, uint32_t)
RVV_MINMAX_VX(vminu_vx_u32m4, BV_ULE, 32, uint32_t)
RVV_MINMAX_VX(vmaxu_vx_u32m1, BV_UGE, 32, uint32_t)
RVV_MINMAX_VX(vmaxu_vx_u32m4, BV_UGE, 32, uint32_t)
RVV_MINMAX_VV(vmax_vv_i32m1,  BV_SGE, 32)
RVV_MINMAX_VV(vmax_vv_i32m2,  BV_SGE, 32)
RVV_MINMAX_VV(vmax_vv_i32m4,  BV_SGE, 32)
RVV_MINMAX_VV(vmax_vv_i32m8,  BV_SGE, 32)
RVV_MINMAX_VV(vmin_vv_i32m1,  BV_SLE, 32)
RVV_MINMAX_VV(vmin_vv_i32m2,  BV_SLE, 32)
RVV_MINMAX_VV(vmin_vv_i32m4,  BV_SLE, 32)
RVV_MINMAX_VV(vmin_vv_i32m8,  BV_SLE, 32)

// ---------------------------------------------------------------------------
// Widening ops: WMACC, WMUL, WADD, WSUB, WCVT
// ---------------------------------------------------------------------------
// VWMUL: widening multiply (signed)
inline RVVVector rvv_vwmul_vv_impl(const RVVVector& a, const RVVVector& b, size_t vl, size_t narrow_bits) {
    auto& tm = g_ctx->tm; size_t wide = narrow_bits * 2;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {narrow_bits});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {narrow_bits});
        r.push_back(fold_bvmul(tm, ae, be));
    }
    return RVVVector(tm, wide, r);
}
inline RVVVector rvv_vwmul_vx_impl(const RVVVector& a, int64_t b, size_t vl, size_t narrow_bits) {
    auto& tm = g_ctx->tm; size_t wide = narrow_bits * 2;
    Term bv = mk_bv_val(tm, narrow_bits, b);
    Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {bv}, {narrow_bits});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {narrow_bits});
        r.push_back(fold_bvmul(tm, ae, be));
    }
    return RVVVector(tm, wide, r);
}

inline vint32m4_t __riscv_vwmul_vv_i32m4(const vint16m2_t& a, const vint16m2_t& b, size_t vl) { return rvv_vwmul_vv_impl(a,b,vl,16); }
inline vint32m8_t __riscv_vwmul_vv_i32m8(const vint16m4_t& a, const vint16m4_t& b, size_t vl) { return rvv_vwmul_vv_impl(a,b,vl,16); }
inline vint32m4_t __riscv_vwmul_vx_i32m4(const vint16m2_t& a, int16_t b, size_t vl) { return rvv_vwmul_vx_impl(a,b,vl,16); }
inline vint32m8_t __riscv_vwmul_vx_i32m8(const vint16m4_t& a, int16_t b, size_t vl) { return rvv_vwmul_vx_impl(a,b,vl,16); }

// VWMACC: widening multiply-accumulate (acc += a * b widened)
inline RVVVector rvv_vwmacc_vv_impl(const RVVVector& acc, const RVVVector& a, const RVVVector& b, size_t vl, size_t narrow_bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {narrow_bits});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {narrow_bits});
        Term prod = fold_bvmul(tm, ae, be);
        r.push_back(fold_bvadd(tm, acc.getElement(i), prod));
    }
    return RVVVector(tm, narrow_bits * 2, r);
}
inline RVVVector rvv_vwmacc_vx_impl(const RVVVector& acc, int64_t rs1, const RVVVector& b, size_t vl, size_t narrow_bits) {
    auto& tm = g_ctx->tm; size_t wide = narrow_bits * 2;
    Term bv = mk_bv_val(tm, narrow_bits, rs1);
    Term rs1_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {bv}, {narrow_bits});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {narrow_bits});
        Term prod = fold_bvmul(tm, rs1_ext, be);
        r.push_back(fold_bvadd(tm, acc.getElement(i), prod));
    }
    return RVVVector(tm, wide, r);
}
inline vint32m1_t __riscv_vwmacc_vv_i32m1(const vint32m1_t& acc, const vint16mf2_t& a, const vint16mf2_t& b, size_t vl) { return rvv_vwmacc_vv_impl(acc,a,b,vl,16); }
inline vint32m4_t __riscv_vwmacc_vv_i32m4(const vint32m4_t& acc, const vint16m2_t& a, const vint16m2_t& b, size_t vl) { return rvv_vwmacc_vv_impl(acc,a,b,vl,16); }
inline vint32m4_t __riscv_vwmacc_vx_i32m4(const vint32m4_t& acc, int16_t rs1, const vint16m2_t& b, size_t vl) { return rvv_vwmacc_vx_impl(acc,rs1,b,vl,16); }
inline vint32m8_t __riscv_vwmacc_vv_i32m8(const vint32m8_t& acc, const vint16m4_t& a, const vint16m4_t& b, size_t vl) { return rvv_vwmacc_vv_impl(acc,a,b,vl,16); }
inline vint32m1_t __riscv_vwmacc_vx_i32m1(const vint32m1_t& acc, int16_t rs1, const vint16mf2_t& b, size_t vl) { return rvv_vwmacc_vx_impl(acc,rs1,b,vl,16); }
inline vint32m8_t __riscv_vwmacc_vx_i32m8(const vint32m8_t& acc, int16_t rs1, const vint16m4_t& b, size_t vl) { return rvv_vwmacc_vx_impl(acc,rs1,b,vl,16); }

// VWADD: widening add
inline RVVVector rvv_vwadd_vx_impl(const RVVVector& a, int64_t b, size_t vl, size_t narrow_bits, bool is_signed) {
    auto& tm = g_ctx->tm; size_t wide = narrow_bits * 2;
    Term bv = mk_bv_val(tm, narrow_bits, b);
    Term be = is_signed ? tm.mk_term(Kind::BV_SIGN_EXTEND, {bv}, {narrow_bits}) : tm.mk_term(Kind::BV_ZERO_EXTEND, {bv}, {narrow_bits});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = is_signed ? tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {narrow_bits})
                            : tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getElement(i)}, {narrow_bits});
        r.push_back(fold_bvadd(tm, ae, be));
    }
    return RVVVector(tm, wide, r);
}
inline vint16m2_t __riscv_vwadd_vx_i16m2(const vint8m1_t& a, int8_t b, size_t vl) { return rvv_vwadd_vx_impl(a,b,vl,8,true); }
inline vint16m4_t __riscv_vwadd_vx_i16m4(const vint8m2_t& a, int8_t b, size_t vl) { return rvv_vwadd_vx_impl(a,b,vl,8,true); }
inline vint32m2_t __riscv_vwadd_vx_i32m2(const vint16m1_t& a, int16_t b, size_t vl) { return rvv_vwadd_vx_impl(a,b,vl,16,true); }
inline vint32m4_t __riscv_vwadd_vx_i32m4(const vint16m2_t& a, int16_t b, size_t vl) { return rvv_vwadd_vx_impl(a,b,vl,16,true); }
inline vint32m8_t __riscv_vwadd_vx_i32m8(const vint16m4_t& a, int16_t b, size_t vl) { return rvv_vwadd_vx_impl(a,b,vl,16,true); }

// VWADD_VV: widening add (both narrow)
inline RVVVector rvv_vwadd_vv_impl(const RVVVector& a, const RVVVector& b, size_t vl, size_t narrow_bits, bool is_signed) {
    auto& tm = g_ctx->tm; size_t wide = narrow_bits * 2;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = is_signed ? tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {narrow_bits})
                            : tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getElement(i)}, {narrow_bits});
        Term be = is_signed ? tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {narrow_bits})
                            : tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getElement(i)}, {narrow_bits});
        r.push_back(fold_bvadd(tm, ae, be));
    }
    return RVVVector(tm, wide, r);
}
inline vint16m2_t __riscv_vwadd_vv_i16m2(const vint8m1_t& a, const vint8m1_t& b, size_t vl) { return rvv_vwadd_vv_impl(a,b,vl,8,true); }
inline vint32m4_t __riscv_vwadd_vv_i32m4(const vint16m2_t& a, const vint16m2_t& b, size_t vl) { return rvv_vwadd_vv_impl(a,b,vl,16,true); }
inline vint32m8_t __riscv_vwadd_vv_i32m8(const vint16m4_t& a, const vint16m4_t& b, size_t vl) { return rvv_vwadd_vv_impl(a,b,vl,16,true); }
inline vuint16m2_t __riscv_vwaddu_vv_u16m2(const vuint8m1_t& a, const vuint8m1_t& b, size_t vl) { return rvv_vwadd_vv_impl(a,b,vl,8,false); }
inline vuint32m4_t __riscv_vwaddu_vv_u32m4(const vuint16m2_t& a, const vuint16m2_t& b, size_t vl) { return rvv_vwadd_vv_impl(a,b,vl,16,false); }

// VWADD_WV: wide + narrow (result stays wide)
inline RVVVector rvv_vwadd_wv_impl(const RVVVector& a, const RVVVector& b, size_t vl, size_t narrow_bits, bool is_signed) {
    auto& tm = g_ctx->tm; size_t wide = narrow_bits * 2;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term be = is_signed ? tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {narrow_bits})
                            : tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getElement(i)}, {narrow_bits});
        r.push_back(fold_bvadd(tm, a.getElement(i), be));
    }
    return RVVVector(tm, wide, r);
}
inline vint16m2_t __riscv_vwadd_wv_i16m2(const vint16m2_t& a, const vint8m1_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,8,true); }
inline vint32m4_t __riscv_vwadd_wv_i32m4(const vint32m4_t& a, const vint16m2_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,16,true); }
inline vint32m8_t __riscv_vwadd_wv_i32m8(const vint32m8_t& a, const vint16m4_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,16,true); }
inline vuint16m2_t __riscv_vwaddu_wv_u16m2(const vuint16m2_t& a, const vuint8m1_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,8,false); }
inline vuint32m4_t __riscv_vwaddu_wv_u32m4(const vuint32m4_t& a, const vuint16m2_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,16,false); }

// VWSUB vv (already have vwsub_vx)
inline vint16m2_t __riscv_vwsub_vv_i16m2(const vint8m1_t& a, const vint8m1_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {8});
        r.push_back(fold_bvsub(tm, ae, be));
    }
    return RVVVector(tm, 16, r);
}
inline vint16m2_t __riscv_vwsub_vx_i16m2(const vint8m1_t& a, int8_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 8, b);
    Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {bv}, {8});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8});
        r.push_back(fold_bvsub(tm, ae, be));
    }
    return RVVVector(tm, 16, r);
}

// VWSUB additional variants
inline vint16m4_t __riscv_vwsub_vv_i16m4(const vint8m2_t& a, const vint8m2_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {8});
        r.push_back(fold_bvsub(tm, ae, be));
    }
    return RVVVector(tm, 16, r);
}
inline vint32m4_t __riscv_vwsub_vv_i32m4(const vint16m2_t& a, const vint16m2_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {16});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {16});
        r.push_back(fold_bvsub(tm, ae, be));
    }
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vwsub_vv_i32m8(const vint16m4_t& a, const vint16m4_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {16});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {16});
        r.push_back(fold_bvsub(tm, ae, be));
    }
    return RVVVector(tm, 32, r);
}

// VWCVT / VWCVTU: widening conversion (sign/zero extend)
inline vint16m2_t __riscv_vwcvt_x_x_v_i16m2(const vint8m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8}));
    return RVVVector(tm, 16, r);
}
inline vuint16m1_t __riscv_vwcvtu_x_x_v_u16m1(const vuint8mf2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getElement(i)}, {8}));
    return RVVVector(tm, 16, r);
}
inline vuint16m2_t __riscv_vwcvtu_x_x_v_u16m2(const vuint8m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getElement(i)}, {8}));
    return RVVVector(tm, 16, r);
}
inline vint16m4_t __riscv_vwcvt_x_x_v_i16m4(const vint8m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8}));
    return RVVVector(tm, 16, r);
}
inline vint32m4_t __riscv_vwcvt_x_x_v_i32m4(const vint16m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {16}));
    return RVVVector(tm, 32, r);
}
inline vuint16m4_t __riscv_vwcvtu_x_x_v_u16m4(const vuint8m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getElement(i)}, {8}));
    return RVVVector(tm, 16, r);
}
inline vuint32m4_t __riscv_vwcvtu_x_x_v_u32m4(const vuint16m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_ZERO_EXTEND, {a.getElement(i)}, {16}));
    return RVVVector(tm, 32, r);
}

// VSEXT additional variants
inline vint16m2_t __riscv_vsext_vf2_i16m2(const vint8m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8}));
    return RVVVector(tm, 16, r);
}
inline vint16m4_t __riscv_vsext_vf2_i16m4(const vint8m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8}));
    return RVVVector(tm, 16, r);
}
inline vint16mf2_t __riscv_vsext_vf2_i16mf2(const vint8mf4_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8}));
    return RVVVector(tm, 16, r);
}
inline vint32m4_t __riscv_vsext_vf2_i32m4(const vint16m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {16}));
    return RVVVector(tm, 32, r);
}
inline vint32m4_t __riscv_vsext_vf4_i32m4(const vint8m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {24}));
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// Narrowing: VNCVT, VNSRA
// ---------------------------------------------------------------------------
inline RVVVector rvv_vncvt_impl(const RVVVector& a, size_t vl, size_t narrow_bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mk_term(Kind::BV_EXTRACT, {a.getElement(i)}, {static_cast<uint64_t>(narrow_bits-1), 0UL}));
    return RVVVector(tm, narrow_bits, r);
}
inline vint16m2_t __riscv_vncvt_x_x_w_i16m2(const vint32m4_t& a, size_t vl) { return rvv_vncvt_impl(a, vl, 16); }
inline vint16m4_t __riscv_vncvt_x_x_w_i16m4(const vint32m8_t& a, size_t vl) { return rvv_vncvt_impl(a, vl, 16); }
inline vint8m1_t  __riscv_vncvt_x_x_w_i8m1(const vint16m2_t& a, size_t vl)  { return rvv_vncvt_impl(a, vl, 8); }
inline vint8m2_t  __riscv_vncvt_x_x_w_i8m2(const vint16m4_t& a, size_t vl)  { return rvv_vncvt_impl(a, vl, 8); }

inline RVVVector rvv_vnsra_impl(const RVVVector& a, size_t shift, size_t vl, size_t wide_bits, size_t narrow_bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = tm.mk_term(Kind::BV_ASHR, {a.getElement(i), mk_bv_val(tm, wide_bits, shift)});
        r.push_back(tm.mk_term(Kind::BV_EXTRACT, {shifted}, {static_cast<uint64_t>(narrow_bits-1), 0UL}));
    }
    return RVVVector(tm, narrow_bits, r);
}
inline vint16m2_t __riscv_vnsra_wx_i16m2(const vint32m4_t& a, size_t shift, size_t vl) { return rvv_vnsra_impl(a,shift,vl,32,16); }
inline vint16m4_t __riscv_vnsra_wx_i16m4(const vint32m8_t& a, size_t shift, size_t vl) { return rvv_vnsra_impl(a,shift,vl,32,16); }
inline vint8m1_t  __riscv_vnsra_wx_i8m1(const vint16m2_t& a, size_t shift, size_t vl) { return rvv_vnsra_impl(a,shift,vl,16,8); }
inline vint8m2_t  __riscv_vnsra_wx_i8m2(const vint16m4_t& a, size_t shift, size_t vl) { return rvv_vnsra_impl(a,shift,vl,16,8); }

// ---------------------------------------------------------------------------
// Loads/stores (remaining variants)
// ---------------------------------------------------------------------------
inline vint16m1_t __riscv_vle16_v_i16m1(const int16_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,16); }
inline vint16m2_t __riscv_vle16_v_i16m2(const int16_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,16); }
inline vuint16m1_t __riscv_vle16_v_u16m1(const uint16_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,16); }
inline vuint8m1_t  __riscv_vle8_v_u8m1(const uint8_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,8); }
inline vint8m1_t   __riscv_vle8_v_i8m1(const int8_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,8); }
inline vint32m1_t  __riscv_vle32_v_i32m1(const int32_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,32); }
inline vint32m4_t  __riscv_vle32_v_i32m4(const int32_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,32); }
inline vuint32m1_t __riscv_vle32_v_u32m1(const uint32_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,32); }

inline void __riscv_vse16_v_i16m1(int16_t* p, const vint16m1_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse16_v_i16m2(int16_t* p, const vint16m2_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse32_v_i32m1(int32_t* p, const vint32m1_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse32_v_i32m4(int32_t* p, const vint32m4_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse8_v_i8m1(int8_t* p, const vint8m1_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse8_v_u8m1(uint8_t* p, const vuint8m1_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }

// Additional integer load variants
inline vint8m4_t   __riscv_vle8_v_i8m4(const int8_t* p, size_t vl)     { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,8); }
inline vuint8m2_t  __riscv_vle8_v_u8m2(const uint8_t* p, size_t vl)    { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,8); }
inline vuint8m4_t  __riscv_vle8_v_u8m4(const uint8_t* p, size_t vl)    { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,8); }
inline vint16m4_t  __riscv_vle16_v_i16m4(const int16_t* p, size_t vl)  { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,16); }
inline vuint16m2_t __riscv_vle16_v_u16m2(const uint16_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,16); }
inline vuint16m4_t __riscv_vle16_v_u16m4(const uint16_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,16); }
inline vint32m2_t  __riscv_vle32_v_i32m2(const int32_t* p, size_t vl)  { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,32); }
inline vint32m8_t  __riscv_vle32_v_i32m8(const int32_t* p, size_t vl)  { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,32); }
inline vuint32m2_t __riscv_vle32_v_u32m2(const uint32_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,32); }
inline vuint32m4_t __riscv_vle32_v_u32m4(const uint32_t* p, size_t vl) { auto& b=g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p),vl,32); }

// Additional integer store variants
inline void __riscv_vse8_v_i8m4(int8_t* p, const vint8m4_t& v, size_t vl)     { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse8_v_u8m2(uint8_t* p, const vuint8m2_t& v, size_t vl)   { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse8_v_u8m4(uint8_t* p, const vuint8m4_t& v, size_t vl)   { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse16_v_i16m4(int16_t* p, const vint16m4_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse16_v_u16m1(uint16_t* p, const vuint16m1_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse16_v_u16m2(uint16_t* p, const vuint16m2_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse16_v_u16m4(uint16_t* p, const vuint16m4_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse32_v_i32m2(int32_t* p, const vint32m2_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse32_v_i32m8(int32_t* p, const vint32m8_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse32_v_u32m1(uint32_t* p, const vuint32m1_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse32_v_u32m2(uint32_t* p, const vuint32m2_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }
inline void __riscv_vse32_v_u32m4(uint32_t* p, const vuint32m4_t& v, size_t vl) { auto& b=g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p),v); }

// ---------------------------------------------------------------------------
// vluxei32 — indexed (gather) load with symbolic byte offsets
// ---------------------------------------------------------------------------
// Pure semantic model: no solver assertions added.  OOB offsets yield a fresh
// unconstrained symbolic constant per lane (never aliases a real table entry).
// Entry terms are cached so loadScalar concat chains are built once per call.
//
// NOTE: the OOB model collapses all distinct OOB offsets for a given lane to
// one value.  This is sound when OOB is unreachable (the common case for LUT
// kernels) but is not a fully faithful generic memory model.
// ---------------------------------------------------------------------------
inline RVVVector rvv_vluxei32_impl(
    const void* base, const RVVVector& byte_offsets,
    size_t vl, size_t elem_bits)
{
    auto& tm = g_ctx->tm;
    auto& buf = g_ctx->findBuffer(base);
    size_t base_off = buf.ptrToByteOffset(base);
    size_t elem_bytes = elem_bits / 8;

    // Concrete guard: buffer must hold at least one element from base
    if (base_off + elem_bytes > buf.numBytes()) {
        throw std::runtime_error(
            "vluxei32: base pointer leaves no room for a single element");
    }

    size_t max_valid_start = buf.numBytes() - base_off - elem_bytes;

    // Cache loadScalar results — one concat chain per valid byte offset
    std::vector<Term> cached(max_valid_start + 1);
    for (size_t k = 0; k <= max_valid_start; k++) {
        cached[k] = buf.loadScalar(base_off + k, elem_bits);
    }

    // Unique counter for OOB variable names across calls
    static thread_local size_t oob_seq = 0;
    size_t call_id = oob_seq++;

    std::vector<Term> result;
    result.reserve(vl);
    Sort elem_sort = tm.mk_bv_sort(elem_bits);

    for (size_t i = 0; i < vl; i++) {
        Term sym_off = byte_offsets.getElement(i);

        // OOB default: fresh unconstrained constant per lane per call
        Term val = tm.mk_const(elem_sort,
            "vlux_oob_" + std::to_string(call_id) + "_" + std::to_string(i));

        // ITE chain over every valid byte offset
        for (size_t k = 0; k <= max_valid_start; k++) {
            val = fold_ite(tm, fold_eq(tm, sym_off, mk_bv_val(tm, 32, k)),
                 cached[k], val);
        }
        result.push_back(val);
    }
    return RVVVector(tm, elem_bits, result);
}

// i32 overloads (sufficient for f32-velu LUT; add u32/f32 when needed)
inline vint32m1_t __riscv_vluxei32_v_i32m1(const int32_t* base, vuint32m1_t off, size_t vl) { return rvv_vluxei32_impl(base, off, vl, 32); }
inline vint32m2_t __riscv_vluxei32_v_i32m2(const int32_t* base, vuint32m2_t off, size_t vl) { return rvv_vluxei32_impl(base, off, vl, 32); }
inline vint32m4_t __riscv_vluxei32_v_i32m4(const int32_t* base, vuint32m4_t off, size_t vl) { return rvv_vluxei32_impl(base, off, vl, 32); }
inline vint32m8_t __riscv_vluxei32_v_i32m8(const int32_t* base, vuint32m8_t off, size_t vl) { return rvv_vluxei32_impl(base, off, vl, 32); }

// ---------------------------------------------------------------------------
// VMACC additional variants
// ---------------------------------------------------------------------------
inline RVVVector rvv_vmacc_vx_impl(const RVVVector& vd, int64_t rs1, const RVVVector& vs2, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm; Term rs = mk_bv_val(tm, bits, rs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_ADD, {vd.getElement(i), fold_bvmul(tm, rs, vs2.getElement(i))}));
    return RVVVector(tm, bits, r);
}
inline vint32m1_t __riscv_vmacc_vx_i32m1(const vint32m1_t& vd, int32_t rs1, const vint32m1_t& vs2, size_t vl) { return rvv_vmacc_vx_impl(vd, rs1, vs2, vl, 32); }
inline vint32m2_t __riscv_vmacc_vx_i32m2(const vint32m2_t& vd, int32_t rs1, const vint32m2_t& vs2, size_t vl) { return rvv_vmacc_vx_impl(vd, rs1, vs2, vl, 32); }
inline vint32m4_t __riscv_vmacc_vx_i32m4(const vint32m4_t& vd, int32_t rs1, const vint32m4_t& vs2, size_t vl) { return rvv_vmacc_vx_impl(vd, rs1, vs2, vl, 32); }

// ---------------------------------------------------------------------------
// VMV broadcast (remaining LMUL)
// ---------------------------------------------------------------------------
inline vint32m1_t __riscv_vmv_v_x_i32m1(int32_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,v); return RVVVector(tm,32,std::vector<Term>(vl,val)); }
inline vint32m4_t __riscv_vmv_v_x_i32m4(int32_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,v); return RVVVector(tm,32,std::vector<Term>(vl,val)); }
inline vint16m1_t __riscv_vmv_v_x_i16m1(int16_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,v); return RVVVector(tm,16,std::vector<Term>(vl,val)); }
inline vint16m2_t __riscv_vmv_v_x_i16m2(int16_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,v); return RVVVector(tm,16,std::vector<Term>(vl,val)); }
inline vint8m1_t  __riscv_vmv_v_x_i8m1(int8_t v, size_t vl)   { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,8,v); return RVVVector(tm,8,std::vector<Term>(vl,val)); }
inline vint8m2_t  __riscv_vmv_v_x_i8m2(int8_t v, size_t vl)   { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,8,v); return RVVVector(tm,8,std::vector<Term>(vl,val)); }
inline vint16m4_t __riscv_vmv_v_x_i16m4(int16_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,v); return RVVVector(tm,16,std::vector<Term>(vl,val)); }
inline vint32m2_t __riscv_vmv_v_x_i32m2(int32_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,v); return RVVVector(tm,32,std::vector<Term>(vl,val)); }
inline vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,static_cast<int64_t>(v)); return RVVVector(tm,32,std::vector<Term>(vl,val)); }
inline vuint32m4_t __riscv_vmv_v_x_u32m4(uint32_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,static_cast<int64_t>(v)); return RVVVector(tm,32,std::vector<Term>(vl,val)); }
inline vuint16m1_t __riscv_vmv_v_x_u16m1(uint16_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,static_cast<int64_t>(v)); return RVVVector(tm,16,std::vector<Term>(vl,val)); }

// VSADD additional variants
inline vint16m1_t __riscv_vsadd_vx_i16m1(const vint16m1_t& a, int16_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,16,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{16});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{16});r.push_back(signed_clip(tm,fold_bvadd(tm, ae, be),32,16));}
    return RVVVector(tm,16,r);
}
inline vint16m2_t __riscv_vsadd_vx_i16m2(const vint16m2_t& a, int16_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,16,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{16});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{16});r.push_back(signed_clip(tm,fold_bvadd(tm, ae, be),32,16));}
    return RVVVector(tm,16,r);
}
// VSADD i8 variants
inline vint8m1_t __riscv_vsadd_vx_i8m1(const vint8m1_t& a, int8_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,8,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{8});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{8});r.push_back(signed_clip(tm,fold_bvadd(tm, ae, be),16,8));}
    return RVVVector(tm,8,r);
}
inline vint8m2_t __riscv_vsadd_vx_i8m2(const vint8m2_t& a, int8_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,8,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{8});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{8});r.push_back(signed_clip(tm,fold_bvadd(tm, ae, be),16,8));}
    return RVVVector(tm,8,r);
}
// VSADD i32 variants
inline vint32m1_t __riscv_vsadd_vx_i32m1(const vint32m1_t& a, int32_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,32,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{32});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{32});r.push_back(signed_clip(tm,fold_bvadd(tm, ae, be),64,32));}
    return RVVVector(tm,32,r);
}
inline vint32m4_t __riscv_vsadd_vx_i32m4(const vint32m4_t& a, int32_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,32,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{32});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{32});r.push_back(signed_clip(tm,fold_bvadd(tm, ae, be),64,32));}
    return RVVVector(tm,32,r);
}
// VSSUB additional
inline vint16m1_t __riscv_vssub_vx_i16m1(const vint16m1_t& a, int16_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,16,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{16});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{16});r.push_back(signed_clip(tm,fold_bvsub(tm, ae, be),32,16));}
    return RVVVector(tm,16,r);
}
inline vint16m2_t __riscv_vssub_vx_i16m2(const vint16m2_t& a, int16_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,16,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{16});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{16});r.push_back(signed_clip(tm,fold_bvsub(tm, ae, be),32,16));}
    return RVVVector(tm,16,r);
}
// VSSUB
inline vint32m1_t __riscv_vssub_vx_i32m1(const vint32m1_t& a, int32_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,32,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{32});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{32});r.push_back(signed_clip(tm,fold_bvsub(tm, ae, be),64,32));}
    return RVVVector(tm,32,r);
}
inline vint32m4_t __riscv_vssub_vx_i32m4(const vint32m4_t& a, int32_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,32,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{32});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{32});r.push_back(signed_clip(tm,fold_bvsub(tm, ae, be),64,32));}
    return RVVVector(tm,32,r);
}

// ---------------------------------------------------------------------------
// VMERGE (select based on mask)
// ---------------------------------------------------------------------------
inline RVVVector rvv_vmerge_vxm_impl(const RVVVector& a, int64_t b, const MaskVector& mask, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, bits, b);
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, bv, a.getElement(i)));
    }
    return RVVVector(tm, bits, r);
}

// vmerge_vvm: merge two vectors based on mask — mask=1 picks b, mask=0 picks a
inline vfloat32m1_t __riscv_vmerge_vvm_f32m1(const vfloat32m1_t& a, const vfloat32m1_t& b, const vbool32_t& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term src_v = (i < b.getVL()) ? b.getElement(i) : mk_bv_val(tm, b.elemBits(), 0);
        r.push_back(fold_ite(tm, sel, src_v, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// VSLIDEDOWN / VSLIDEUP / VSLIDE1DOWN
// ---------------------------------------------------------------------------
inline RVVVector rvv_vslidedown_impl(const RVVVector& a, size_t offset, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm; Term zero = mk_bv_val(tm, bits, 0);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back((i + offset < a.getVL()) ? a.getElement(i + offset) : zero);
    return RVVVector(tm, bits, r);
}
inline RVVVector rvv_vslideup_impl(const RVVVector& dst, const RVVVector& src, size_t offset, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back((i >= offset && (i - offset) < src.getVL()) ? src.getElement(i - offset) : dst.getElement(i));
    return RVVVector(tm, bits, r);
}

inline vfloat32m1_t __riscv_vslidedown_vx_f32m1(const vfloat32m1_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,32); }
inline vint32m1_t   __riscv_vslidedown_vx_i32m1(const vint32m1_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,32); }
inline vint8m1_t    __riscv_vslidedown_vx_i8m1(const vint8m1_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,8); }
inline vuint32m1_t  __riscv_vslidedown_vx_u32m1(const vuint32m1_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,32); }
inline vuint16m1_t  __riscv_vslidedown_vx_u16m1(const vuint16m1_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,16); }
inline vuint8m1_t   __riscv_vslidedown_vx_u8m1(const vuint8m1_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,8); }

inline vfloat32m1_t __riscv_vslideup_vx_f32m1(const vfloat32m1_t& dst, const vfloat32m1_t& src, size_t off, size_t vl) { return rvv_vslideup_impl(dst,src,off,vl,32); }
inline vuint32m1_t  __riscv_vslideup_vx_u32m1(const vuint32m1_t& dst, const vuint32m1_t& src, size_t off, size_t vl) { return rvv_vslideup_impl(dst,src,off,vl,32); }
inline vuint16m1_t  __riscv_vslideup_vx_u16m1(const vuint16m1_t& dst, const vuint16m1_t& src, size_t off, size_t vl) { return rvv_vslideup_impl(dst,src,off,vl,16); }
inline vuint8m1_t   __riscv_vslideup_vx_u8m1(const vuint8m1_t& dst, const vuint8m1_t& src, size_t off, size_t vl) { return rvv_vslideup_impl(dst,src,off,vl,8); }

// VSLIDE1DOWN
inline vint32m1_t __riscv_vslide1down_vx_i32m1(const vint32m1_t& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl - 1; i++) r.push_back(a.getElement(i + 1));
    r.push_back(mk_bv_val(tm, 32, b));
    return RVVVector(tm, 32, r);
}
inline vuint32m1_t __riscv_vslide1down_vx_u32m1(const vuint32m1_t& a, uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl - 1; i++) r.push_back(a.getElement(i + 1));
    r.push_back(mk_bv_val(tm, 32, b));
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// VRGATHER
// ---------------------------------------------------------------------------
inline RVVVector rvv_vrgather_vv_impl(const RVVVector& src, const RVVVector& idx, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm; Term zero = mk_bv_val(tm, bits, 0);
    size_t idx_bits = idx.elemBits();
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term result = zero;
        for (size_t j = src.getVL(); j > 0; j--) {
            Term cmp = fold_eq(tm, idx.getElement(i), mk_bv_val(tm, idx_bits, j-1));
            result = fold_ite(tm, cmp, src.getElement(j-1), result);
        }
        r.push_back(result);
    }
    return RVVVector(tm, bits, r);
}
inline vfloat32m1_t __riscv_vrgather_vv_f32m1(const vfloat32m1_t& s, const vuint32m1_t& i, size_t vl) { return rvv_vrgather_vv_impl(s,i,vl,32); }
inline vuint32m1_t  __riscv_vrgather_vv_u32m1(const vuint32m1_t& s, const vuint32m1_t& i, size_t vl) { return rvv_vrgather_vv_impl(s,i,vl,32); }
inline vuint16m1_t  __riscv_vrgather_vv_u16m1(const vuint16m1_t& s, const vuint16m1_t& i, size_t vl) { return rvv_vrgather_vv_impl(s,i,vl,16); }
inline vuint8m1_t   __riscv_vrgather_vv_u8m1(const vuint8m1_t& s, const vuint8m1_t& i, size_t vl) { return rvv_vrgather_vv_impl(s,i,vl,8); }

// ---------------------------------------------------------------------------
// VREINTERPRET (no-op: just return the same vector with different type alias)
// ---------------------------------------------------------------------------
inline RVVVector __riscv_vreinterpret_v_i8m1_u8m1(const RVVVector& a)  { return a; }
inline RVVVector __riscv_vreinterpret_v_u8m1_i8m1(const RVVVector& a)  { return a; }
inline RVVVector __riscv_vreinterpret_v_u16m1_i16m1(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_u16m2_i16m2(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_u32m4_i32m4(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_i32m4_u32m4(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_i32m4_f32m4(const RVVVector& a){ return a; }
// m8 reinterprets — bit-level no-ops on the underlying BV terms
inline RVVVector __riscv_vreinterpret_v_f32m8_i32m8(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_f32m8_u32m8(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_i32m8_u32m8(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_i32m8_f32m8(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_u32m8_i32m8(const RVVVector& a){ return a; }
inline RVVVector __riscv_vreinterpret_v_u32m8_f32m8(const RVVVector& a){ return a; }
// u32m1 <-> u8m1: reinterpret 32-bit elements as 8-bit (different element count)
// This is a no-op on the underlying bitvector — just change elem_bits
inline RVVVector __riscv_vreinterpret_v_u32m1_u8m1(const RVVVector& a) { return a; }

// ---------------------------------------------------------------------------
// VID: index vector (vid[i] = i)
// ---------------------------------------------------------------------------
inline RVVVector __riscv_vid_v_u32m1(size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 32, i));
    return RVVVector(tm, 32, r);
}
// LMUL=m2 variant — logically identical for our model: vl elements of 32 bits.
// The underlying register group size doesn't affect the symbolic semantics.
inline RVVVector __riscv_vid_v_u32m2(size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 32, i));
    return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vid_v_u16m1(size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 16, i));
    return RVVVector(tm, 16, r);
}

// ---------------------------------------------------------------------------
// VSETVLMAX
// ---------------------------------------------------------------------------
inline size_t __riscv_vsetvlmax_e32m1() { return g_ctx->vlen / 32; }

// ---------------------------------------------------------------------------
// Misc: VUNDEFINED, VLMUL_TRUNC, VSET
// ---------------------------------------------------------------------------
inline RVVVector __riscv_vundefined_u8m2() { return RVVVector(); }
inline RVVVector __riscv_vlmul_trunc_v_i32m4_i32m1(const RVVVector& a) { return a; }

// ---------------------------------------------------------------------------
// FP: remaining variants from old library (non-f16)
// ---------------------------------------------------------------------------
inline vfloat32m4_t __riscv_vfadd_vv_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_ADD,vl); }
inline vfloat32m4_t __riscv_vfsub_vv_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_SUB,vl); }
inline vfloat32m4_t __riscv_vfmul_vv_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_MUL,vl); }

inline vfloat32m1_t __riscv_vfmul_vf_f32m1(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MUL, {rm, a_fp, b_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmul_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MUL, {rm, a_fp, b_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m8_t __riscv_vfmul_vf_f32m8(const vfloat32m8_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MUL, {rm, a_fp, b_fp})));
    }
    return RVVVector(tm, 32, r);
}

// FP arithmetic additional LMUL
inline vfloat32m8_t __riscv_vfadd_vv_f32m8(const vfloat32m8_t& a, const vfloat32m8_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_ADD,vl); }
inline vfloat32m8_t __riscv_vfsub_vv_f32m8(const vfloat32m8_t& a, const vfloat32m8_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_SUB,vl); }
inline vfloat32m8_t __riscv_vfmul_vv_f32m8(const vfloat32m8_t& a, const vfloat32m8_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_MUL,vl); }
inline vfloat32m2_t __riscv_vfdiv_vv_f32m2(const vfloat32m2_t& a, const vfloat32m2_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_DIV,vl); }
inline vfloat32m4_t __riscv_vfdiv_vv_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_DIV,vl); }
inline vfloat32m8_t __riscv_vfdiv_vv_f32m8(const vfloat32m8_t& a, const vfloat32m8_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FP_DIV,vl); }

// FP scalar add/sub (_vf) variants
inline RVVVector rvv_fp32_binop_vf(const RVVVector& a, float b, Kind op, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Term b_fp = mk_fp32_from_float(tm, b);
    bool needs_rm = (op != Kind::FP_MAX && op != Kind::FP_MIN);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res_fp = needs_rm ? tm.mk_term(op, {rm, a_fp, b_fp}) : tm.mk_term(op, {a_fp, b_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m1_t __riscv_vfadd_vf_f32m1(const vfloat32m1_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_ADD,vl); }
inline vfloat32m2_t __riscv_vfadd_vf_f32m2(const vfloat32m2_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_ADD,vl); }
inline vfloat32m4_t __riscv_vfadd_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_ADD,vl); }
inline vfloat32m8_t __riscv_vfadd_vf_f32m8(const vfloat32m8_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_ADD,vl); }
inline vfloat32m1_t __riscv_vfsub_vf_f32m1(const vfloat32m1_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_SUB,vl); }
inline vfloat32m2_t __riscv_vfsub_vf_f32m2(const vfloat32m2_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_SUB,vl); }
inline vfloat32m4_t __riscv_vfsub_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_SUB,vl); }
inline vfloat32m8_t __riscv_vfsub_vf_f32m8(const vfloat32m8_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_SUB,vl); }
inline vfloat32m1_t __riscv_vfdiv_vf_f32m1(const vfloat32m1_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_DIV,vl); }
inline vfloat32m2_t __riscv_vfdiv_vf_f32m2(const vfloat32m2_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_DIV,vl); }
inline vfloat32m4_t __riscv_vfdiv_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) { return rvv_fp32_binop_vf(a,b,Kind::FP_DIV,vl); }

// FP FMA additional
inline vfloat32m4_t __riscv_vfmacc_vv_f32m4(const vfloat32m4_t& vd, const vfloat32m4_t& vs1, const vfloat32m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, v1, v2, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}
// vfmadd: vd = vd * vs1 + vs2
inline vfloat32m1_t __riscv_vfmadd_vv_f32m1(const vfloat32m1_t& vd, const vfloat32m1_t& vs1,
                                              const vfloat32m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, vd_fp, v1, v2})));
    }
    return RVVVector(tm, 32, r);
}
// vfmadd m4: vd = vd * vs1 + vs2
inline vfloat32m4_t __riscv_vfmadd_vv_f32m4(const vfloat32m4_t& vd, const vfloat32m4_t& vs1,
                                              const vfloat32m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, vd_fp, v1, v2})));
    }
    return RVVVector(tm, 32, r);
}

// vfmacc vv m2, m8
inline vfloat32m2_t __riscv_vfmacc_vv_f32m2(const vfloat32m2_t& vd, const vfloat32m2_t& vs1, const vfloat32m2_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, v1, v2, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m8_t __riscv_vfmacc_vv_f32m8(const vfloat32m8_t& vd, const vfloat32m8_t& vs1, const vfloat32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, v1, v2, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}
// vfnmsac additional (m2, m4)
inline vfloat32m2_t __riscv_vfnmsac_vv_f32m2(const vfloat32m2_t& vd, const vfloat32m2_t& vs1,
                                               const vfloat32m2_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp32(tm, vs2.getElement(i));
        Term neg_vs1 = tm.mk_term(Kind::FP_NEG, {vs1_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, neg_vs1, vs2_fp, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfnmsac_vv_f32m4(const vfloat32m4_t& vd, const vfloat32m4_t& vs1,
                                               const vfloat32m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp32(tm, vs2.getElement(i));
        Term neg_vs1 = tm.mk_term(Kind::FP_NEG, {vs1_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, neg_vs1, vs2_fp, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}
// vfmadd m2
inline vfloat32m2_t __riscv_vfmadd_vv_f32m2(const vfloat32m2_t& vd, const vfloat32m2_t& vs1,
                                              const vfloat32m2_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, vd_fp, v1, v2})));
    }
    return RVVVector(tm, 32, r);
}

// vfmacc vf additional (m2, m8)
inline vfloat32m2_t __riscv_vfmacc_vf_f32m2(const vfloat32m2_t& vd, float rs1, const vfloat32m2_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Term rs1_fp = mk_fp32_from_float(tm, rs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, rs1_fp, v2, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m8_t __riscv_vfmacc_vf_f32m8(const vfloat32m8_t& vd, float rs1, const vfloat32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Term rs1_fp = mk_fp32_from_float(tm, rs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, rs1_fp, v2, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}

inline vfloat32m1_t __riscv_vfmacc_vf_f32m1(const vfloat32m1_t& vd, float rs1, const vfloat32m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term rs1_fp = mk_fp32_from_float(tm, rs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, rs1_fp, v2, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmacc_vf_f32m4(const vfloat32m4_t& vd, float rs1, const vfloat32m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    Term rs1_fp = mk_fp32_from_float(tm, rs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_FMA, {rm, rs1_fp, v2, vd_fp})));
    }
    return RVVVector(tm, 32, r);
}

// FP min/max scalar
inline vfloat32m1_t __riscv_vfmin_vf_f32m1(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MIN, {a_fp, b_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m1_t __riscv_vfmax_vf_f32m1(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MAX, {a_fp, b_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m2_t __riscv_vfmin_vf_f32m2(const vfloat32m2_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MIN, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp})));
    return RVVVector(tm, 32, r);
}
inline vfloat32m2_t __riscv_vfmax_vf_f32m2(const vfloat32m2_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MAX, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp})));
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmin_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MIN, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp})));
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmax_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MAX, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp})));
    return RVVVector(tm, 32, r);
}

// FP min/max masked-undisturbed (_mu): where mask bit is 0, keep merge value
// FP min/max masked-undisturbed — m1
inline vfloat32m1_t __riscv_vfmax_vf_f32m1_mu(const vbool32_t& mask, const vfloat32m1_t& merge,
                                                const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term active = fold_eq(tm, mask.getBit(i), mk_bv_val(tm, 1, 1));
        Term computed = rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MAX, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp}));
        r.push_back(fold_ite(tm, active, computed, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m1_t __riscv_vfmin_vf_f32m1_mu(const vbool32_t& mask, const vfloat32m1_t& merge,
                                                const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term active = fold_eq(tm, mask.getBit(i), mk_bv_val(tm, 1, 1));
        Term computed = rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MIN, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp}));
        r.push_back(fold_ite(tm, active, computed, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// FP min/max masked-undisturbed — m4
inline vfloat32m4_t __riscv_vfmax_vf_f32m4_mu(const vbool8_t& mask, const vfloat32m4_t& merge,
                                                const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term active = fold_eq(tm, mask.getBit(i), mk_bv_val(tm, 1, 1));
        Term computed = rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MAX, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp}));
        r.push_back(fold_ite(tm, active, computed, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmin_vf_f32m4_mu(const vbool8_t& mask, const vfloat32m4_t& merge,
                                                const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term active = fold_eq(tm, mask.getBit(i), mk_bv_val(tm, 1, 1));
        Term computed = rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MIN, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp}));
        r.push_back(fold_ite(tm, active, computed, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// FP conversions additional
inline vfloat32m4_t __riscv_vfcvt_f_x_v_f32m4(const vint32m4_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_TO_FP_FROM_SBV, {rm, a.getElement(i)}, {8, 24})));
    return RVVVector(tm, 32, r);
}
inline vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(const vint32m8_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_TO_FP_FROM_SBV, {rm, a.getElement(i)}, {8, 24})));
    return RVVVector(tm, 32, r);
}
inline vint32m4_t __riscv_vfcvt_rtz_x_f_v_i32m4(const vfloat32m4_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rtz = tm.mk_rm_value(RoundingMode::RTZ);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::FP_TO_SBV, {rtz, rvv_load_as_fp32(tm, a.getElement(i))}, {32}));
    return RVVVector(tm, 32, r);
}
inline vfloat32m2_t __riscv_vfcvt_f_x_v_f32m2(const vint32m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_TO_FP_FROM_SBV, {rm, a.getElement(i)}, {8, 24})));
    return RVVVector(tm, 32, r);
}
inline vint32m2_t __riscv_vfcvt_rtz_x_f_v_i32m2(const vfloat32m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rtz = tm.mk_rm_value(RoundingMode::RTZ);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::FP_TO_SBV, {rtz, rvv_load_as_fp32(tm, a.getElement(i))}, {32}));
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vfcvt_rtz_x_f_v_i32m8(const vfloat32m8_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rtz = tm.mk_rm_value(RoundingMode::RTZ);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::FP_TO_SBV, {rtz, rvv_load_as_fp32(tm, a.getElement(i))}, {32}));
    return RVVVector(tm, 32, r);
}
inline vint32m2_t __riscv_vfcvt_x_f_v_i32m2(const vfloat32m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::FP_TO_SBV, {rm, rvv_load_as_fp32(tm, a.getElement(i))}, {32}));
    return RVVVector(tm, 32, r);
}
inline vint32m4_t __riscv_vfcvt_x_f_v_i32m4(const vfloat32m4_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::FP_TO_SBV, {rm, rvv_load_as_fp32(tm, a.getElement(i))}, {32}));
    return RVVVector(tm, 32, r);
}

// FP broadcast additional
inline vfloat32m2_t __riscv_vfmv_v_f_f32m2(float src, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term bv = rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm, src));
    return RVVVector(tm, 32, std::vector<Term>(vl, bv));
}
inline vfloat32m4_t __riscv_vfmv_v_f_f32m4(float src, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term bv = rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm, src));
    return RVVVector(tm, 32, std::vector<Term>(vl, bv));
}
inline vfloat32m8_t __riscv_vfmv_v_f_f32m8(float src, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term bv = rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm, src));
    return RVVVector(tm, 32, std::vector<Term>(vl, bv));
}

// FP equality compare (mask producing) — m1
inline MaskVector __riscv_vmfeq_vv_f32m1_b32(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_EQUAL, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// FP not-equal compare (mask producing) — for NaN detection: vmfne(x,x) is true iff x is NaN
inline MaskVector __riscv_vmfne_vv_f32m1_b32(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_EQUAL, {a_fp, b_fp});
        // NOT equal → flip the result
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 0), mk_bv_val(tm, 1, 1)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfne_vv_f32m4_b8(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_EQUAL, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 0), mk_bv_val(tm, 1, 1)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfne_vv_f32m8_b4(const vfloat32m8_t& a, const vfloat32m8_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_EQUAL, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 0), mk_bv_val(tm, 1, 1)));
    }
    return MaskVector(tm, bits);
}

// FP compare (mask producing)
inline MaskVector __riscv_vmflt_vf_f32m1_b32(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LT, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfgt_vf_f32m1_b32(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_GT, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfgt_vv_f32m1_b32(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_GT, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// FP equality compare (mask producing)
inline MaskVector __riscv_vmfeq_vv_f32m4_b8(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_EQUAL, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// Integer compare (mask producing)
inline MaskVector __riscv_vmslt_vx_i16m2_b8(const vint16m2_t& a, int16_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// i32m2 signed compare against scalar — produces b16 mask (EEW=32, ratio=2 → b16).
// Used by conv-hwc2chw gather-style bounds checks.
inline MaskVector __riscv_vmslt_vx_i32m2_b16(const vint32m2_t& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmsge_vx_i32m2_b16(const vint32m2_t& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SGE, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
// Bitwise AND of two b16 masks.  b16 is just the MaskVector alias for 1-bit
// per element; `vl` truncates to the active lane count.
inline MaskVector __riscv_vmand_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(fold_bvand(tm, a.getBit(i), b.getBit(i)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmslt_vx_i8m1_b8(const vint8m1_t& a, int8_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 8, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmsltu_vx_u32m4_b8(const vuint32m4_t& a, uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_ULT, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// VFMERGE
inline vfloat32m1_t __riscv_vfmerge_vfm_f32m1(const vfloat32m1_t& a, float b, const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term bv = rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm, b));
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, bv, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

inline vfloat32m4_t __riscv_vfmerge_vfm_f32m4(const vfloat32m4_t& a, float b, const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    Term bv = rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm, b));
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, bv, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// VWREDSUM (widening reduction sum)
inline vint32m1_t __riscv_vwredsum_vs_i16m2_i32m1(const vint16m2_t& src, const vint32m1_t& init, size_t vl) {
    auto& tm = g_ctx->tm;
    Term acc = init.getElement(0);
    for (size_t i = 0; i < vl; i++) {
        Term ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {src.getElement(i)}, {16});
        acc = fold_bvadd(tm, acc, ext);
    }
    return RVVVector(tm, 32, std::vector<Term>{acc});
}

// VREDSUM (same-width reduction)
inline vint32m1_t __riscv_vredsum_vs_i32m4_i32m1(const vint32m4_t& src, const vint32m1_t& init, size_t vl) {
    auto& tm = g_ctx->tm;
    Term acc = init.getElement(0);
    for (size_t i = 0; i < vl; i++) acc = fold_bvadd(tm, acc, src.getElement(i));
    return RVVVector(tm, 32, std::vector<Term>{acc});
}

// VSMUL (fractional multiply with saturation)
inline RVVVector rvv_vsmul_vx_impl(const RVVVector& a, int64_t b, unsigned vxrm, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, bits, b);
    size_t wide = bits * 2;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {bits});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {bv}, {bits});
        Term prod = fold_bvmul(tm, ae, be);
        Term shifted = rounded_shift_right(tm, prod, bits - 1, wide, vxrm, true);
        r.push_back(signed_clip(tm, shifted, wide, bits));
    }
    return RVVVector(tm, bits, r);
}
inline vint16m1_t __riscv_vsmul_vx_i16m1(const vint16m1_t& a, int16_t b, unsigned vxrm, size_t vl) { return rvv_vsmul_vx_impl(a, b, vxrm, vl, 16); }
inline vint16m2_t __riscv_vsmul_vx_i16m2(const vint16m2_t& a, int16_t b, unsigned vxrm, size_t vl) { return rvv_vsmul_vx_impl(a, b, vxrm, vl, 16); }
inline vint16m4_t __riscv_vsmul_vx_i16m4(const vint16m4_t& a, int16_t b, unsigned vxrm, size_t vl) { return rvv_vsmul_vx_impl(a, b, vxrm, vl, 16); }
inline vint32m1_t __riscv_vsmul_vx_i32m1(const vint32m1_t& a, int32_t b, unsigned vxrm, size_t vl) { return rvv_vsmul_vx_impl(a, b, vxrm, vl, 32); }
inline vint32m4_t __riscv_vsmul_vx_i32m4(const vint32m4_t& a, int32_t b, unsigned vxrm, size_t vl) { return rvv_vsmul_vx_impl(a, b, vxrm, vl, 32); }

// ---------------------------------------------------------------------------
// Additional VMERGE int variants
// ---------------------------------------------------------------------------
inline vint32m1_t __riscv_vmerge_vxm_i32m1(const vint32m1_t& a, int32_t b, const MaskVector& mask, size_t vl) {
    return rvv_vmerge_vxm_impl(a, b, mask, vl, 32);
}
inline vint32m4_t __riscv_vmerge_vxm_i32m4(const vint32m4_t& a, int32_t b, const MaskVector& mask, size_t vl) {
    return rvv_vmerge_vxm_impl(a, b, mask, vl, 32);
}
inline vint16m2_t __riscv_vmerge_vxm_i16m2(const vint16m2_t& a, int16_t b, const MaskVector& mask, size_t vl) {
    return rvv_vmerge_vxm_impl(a, b, mask, vl, 16);
}
inline vint8m1_t __riscv_vmerge_vxm_i8m1(const vint8m1_t& a, int8_t b, const MaskVector& mask, size_t vl) {
    return rvv_vmerge_vxm_impl(a, b, mask, vl, 8);
}
inline vint16m4_t __riscv_vmerge_vxm_i16m4(const vint16m4_t& a, int16_t b, const MaskVector& mask, size_t vl) {
    return rvv_vmerge_vxm_impl(a, b, mask, vl, 16);
}

// vmerge_vvm for float m2, m4
inline vfloat32m2_t __riscv_vmerge_vvm_f32m2(const vfloat32m2_t& a, const vfloat32m2_t& b, const vbool16_t& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term src_v = (i < b.getVL()) ? b.getElement(i) : mk_bv_val(tm, b.elemBits(), 0);
        r.push_back(fold_ite(tm, sel, src_v, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vmerge_vvm_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, const vbool8_t& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term src_v = (i < b.getVL()) ? b.getElement(i) : mk_bv_val(tm, b.elemBits(), 0);
        r.push_back(fold_ite(tm, sel, src_v, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m8_t __riscv_vmerge_vvm_f32m8(const vfloat32m8_t& a, const vfloat32m8_t& b, const vbool4_t& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term src_v = (i < b.getVL()) ? b.getElement(i) : mk_bv_val(tm, b.elemBits(), 0);
        r.push_back(fold_ite(tm, sel, src_v, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// Additional VFMERGE variants
// ---------------------------------------------------------------------------
inline vfloat32m2_t __riscv_vfmerge_vfm_f32m2(const vfloat32m2_t& a, float b, const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm, b));
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, bv, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m8_t __riscv_vfmerge_vfm_f32m8(const vfloat32m8_t& a, float b, const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = rvv_store_fp32_as_bv(tm, mk_fp32_from_float(tm, b));
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, bv, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// Additional VID variants
// ---------------------------------------------------------------------------
inline RVVVector __riscv_vid_v_u8m1(size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 8, i));
    return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vid_v_u32m4(size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 32, i));
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// Additional VSLIDEDOWN int variants
// ---------------------------------------------------------------------------
inline vint16m1_t  __riscv_vslidedown_vx_i16m1(const vint16m1_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,16); }
inline vint32m4_t  __riscv_vslidedown_vx_i32m4(const vint32m4_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,32); }
inline vuint32m4_t __riscv_vslidedown_vx_u32m4(const vuint32m4_t& a, size_t off, size_t vl) { return rvv_vslidedown_impl(a,off,vl,32); }

// Additional VSLIDEUP int variants
inline vint32m1_t  __riscv_vslideup_vx_i32m1(const vint32m1_t& dst, const vint32m1_t& src, size_t off, size_t vl) { return rvv_vslideup_impl(dst,src,off,vl,32); }
inline vint8m1_t   __riscv_vslideup_vx_i8m1(const vint8m1_t& dst, const vint8m1_t& src, size_t off, size_t vl) { return rvv_vslideup_impl(dst,src,off,vl,8); }
inline vint16m1_t  __riscv_vslideup_vx_i16m1(const vint16m1_t& dst, const vint16m1_t& src, size_t off, size_t vl) { return rvv_vslideup_impl(dst,src,off,vl,16); }

// ---------------------------------------------------------------------------
// Additional VSLIDE1DOWN variants
// ---------------------------------------------------------------------------
inline vint16m1_t __riscv_vslide1down_vx_i16m1(const vint16m1_t& a, int16_t b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl - 1; i++) r.push_back(a.getElement(i + 1));
    r.push_back(mk_bv_val(tm, 16, b));
    return RVVVector(tm, 16, r);
}
inline vuint16m1_t __riscv_vslide1down_vx_u16m1(const vuint16m1_t& a, uint16_t b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl - 1; i++) r.push_back(a.getElement(i + 1));
    r.push_back(mk_bv_val(tm, 16, b));
    return RVVVector(tm, 16, r);
}

// ---------------------------------------------------------------------------
// Additional VRGATHER variants
// ---------------------------------------------------------------------------
inline vint32m1_t __riscv_vrgather_vv_i32m1(const vint32m1_t& s, const vuint32m1_t& i, size_t vl) { return rvv_vrgather_vv_impl(s,i,vl,32); }
inline vint16m1_t __riscv_vrgather_vv_i16m1(const vint16m1_t& s, const vuint16m1_t& i, size_t vl) { return rvv_vrgather_vv_impl(s,i,vl,16); }
inline vint8m1_t  __riscv_vrgather_vv_i8m1(const vint8m1_t& s, const vuint8m1_t& i, size_t vl) { return rvv_vrgather_vv_impl(s,i,vl,8); }

// ---------------------------------------------------------------------------
// Additional VREINTERPRET variants
// ---------------------------------------------------------------------------
inline RVVVector __riscv_vreinterpret_v_i16m1_u16m1(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_i8m2_u8m2(const RVVVector& a)   { return a; }
inline RVVVector __riscv_vreinterpret_v_u8m2_i8m2(const RVVVector& a)   { return a; }
inline RVVVector __riscv_vreinterpret_v_i32m1_u32m1(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_u32m1_i32m1(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_i32m2_u32m2(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_u32m2_i32m2(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_f32m1_u32m1(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_u32m1_f32m1(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_f32m4_u32m4(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_u32m4_f32m4(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_i16m2_u16m2(const RVVVector& a) { return a; }

// ---------------------------------------------------------------------------
// Additional VSETVLMAX variants
// ---------------------------------------------------------------------------
inline size_t __riscv_vsetvlmax_e8m1()  { return g_ctx->vlen / 8; }
inline size_t __riscv_vsetvlmax_e16m1() { return g_ctx->vlen / 16; }
inline size_t __riscv_vsetvlmax_e32m2() { return g_ctx->vlen / 32 * 2; }
inline size_t __riscv_vsetvlmax_e32m4() { return g_ctx->vlen / 32 * 4; }

// ---------------------------------------------------------------------------
// Additional FP compare variants (mask producing)
// ---------------------------------------------------------------------------
inline MaskVector __riscv_vmflt_vf_f32m4_b8(const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LT, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfgt_vf_f32m4_b8(const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_GT, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmflt_vv_f32m1_b32(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LT, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfgt_vv_f32m4_b8(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_GT, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfle_vf_f32m1_b32(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LEQ, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfge_vf_f32m1_b32(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term b_fp = mk_fp32_from_float(tm, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_GEQ, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// ---------------------------------------------------------------------------
// Additional integer compare variants (mask producing)
// ---------------------------------------------------------------------------
inline MaskVector __riscv_vmslt_vx_i32m4_b8(const vint32m4_t& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmslt_vx_i32m1_b32(const vint32m1_t& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmsltu_vx_u8m1_b8(const vuint8m1_t& a, uint8_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 8, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_ULT, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmslt_vx_i16m4_b4(const vint16m4_t& a, int16_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), bv});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// ---------------------------------------------------------------------------
// Additional VREDSUM / VWREDSUM variants
// ---------------------------------------------------------------------------
inline vint32m1_t __riscv_vredsum_vs_i32m1_i32m1(const vint32m1_t& src, const vint32m1_t& init, size_t vl) {
    auto& tm = g_ctx->tm;
    Term acc = init.getElement(0);
    for (size_t i = 0; i < vl; i++) acc = fold_bvadd(tm, acc, src.getElement(i));
    return RVVVector(tm, 32, std::vector<Term>{acc});
}
inline vint32m1_t __riscv_vredsum_vs_i32m8_i32m1(const vint32m8_t& src, const vint32m1_t& init, size_t vl) {
    auto& tm = g_ctx->tm;
    Term acc = init.getElement(0);
    for (size_t i = 0; i < vl; i++) acc = fold_bvadd(tm, acc, src.getElement(i));
    return RVVVector(tm, 32, std::vector<Term>{acc});
}
inline vint32m1_t __riscv_vwredsum_vs_i16m4_i32m1(const vint16m4_t& src, const vint32m1_t& init, size_t vl) {
    auto& tm = g_ctx->tm;
    Term acc = init.getElement(0);
    for (size_t i = 0; i < vl; i++) {
        Term ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {src.getElement(i)}, {16});
        acc = fold_bvadd(tm, acc, ext);
    }
    return RVVVector(tm, 32, std::vector<Term>{acc});
}

#undef RVV_BIN_VV
#undef RVV_BIN_VX
#undef RVV_SLL_VX
#undef RVV_SRA_VX
#undef RVV_SRL_VX
#undef RVV_MINMAX_VX
#undef RVV_MINMAX_VV

// ===========================================================================
// SymbolicScalar<T> overloads for _vx_ intrinsics — enables symbolic params
// ===========================================================================

// --- rounded_shift_right_symbolic: ITE cascade for symbolic shift amount ---
// Constraint: 0 <= shift <= 31 must be asserted via PARAM_CONSTRAINTS.
// Builds a 31-deep ITE tree reusing the concrete rounded_shift_right per branch.
inline Term rounded_shift_right_symbolic(TermManager& tm, Term val, Term shift_term,
                                          size_t bits, unsigned vxrm, bool is_signed) {
    // shift==0 case: identity
    Term result = val;
    // Build ITE chain from s=31 down to s=1
    for (size_t s = 31; s >= 1; s--) {
        Term concrete_shifted = rounded_shift_right(tm, val, s, bits, vxrm, is_signed);
        Term eq = fold_eq(tm, shift_term, mk_bv_val(tm, bits, static_cast<int64_t>(s)));
        result = fold_ite(tm, eq, concrete_shifted, result);
    }
    return result;
}

// --- vrsub_vx (symbolic) ---
inline vint16m4_t __riscv_vrsub_vx_i16m4(const vint16m4_t& a,
                                           SymbolicScalar<int16_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(fold_bvsub(tm, op2.term(), a.getElement(i)));
    return RVVVector(tm, 16, r);
}

// --- vmerge_vxm (symbolic) ---
inline vint16m4_t __riscv_vmerge_vxm_i16m4(const vint16m4_t& a,
                                             SymbolicScalar<int16_t> b,
                                             const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, b.term(), a.getElement(i)));
    }
    return RVVVector(tm, 16, r);
}

// --- vmv_v_x (symbolic i16m4) ---
inline vint16m4_t __riscv_vmv_v_x_i16m4(SymbolicScalar<int16_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 16, std::vector<Term>(vl, v.term()));
}
// --- vwsub_vx ---
inline vint16m4_t __riscv_vwsub_vx_i16m4(const vint8m2_t& op1,
                                           SymbolicScalar<int8_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op2.term()}, {8}); // 8→16
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {8});
        result.push_back(fold_bvsub(tm, a_ext, op2_ext));
    }
    return RVVVector(tm, 16, result);
}

// --- vmv_v_x ---
inline vint32m8_t __riscv_vmv_v_x_i32m8(SymbolicScalar<int32_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 32, std::vector<Term>(vl, v.term()));
}
inline vint32m4_t __riscv_vmv_v_x_i32m4(SymbolicScalar<int32_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 32, std::vector<Term>(vl, v.term()));
}
inline vint32m1_t __riscv_vmv_v_x_i32m1(SymbolicScalar<int32_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 32, std::vector<Term>(vl, v.term()));
}
inline vint16m1_t __riscv_vmv_v_x_i16m1(SymbolicScalar<int16_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 16, std::vector<Term>(vl, v.term()));
}
inline vint16m2_t __riscv_vmv_v_x_i16m2(SymbolicScalar<int16_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 16, std::vector<Term>(vl, v.term()));
}
inline vint8m1_t __riscv_vmv_v_x_i8m1(SymbolicScalar<int8_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 8, std::vector<Term>(vl, v.term()));
}

// --- vmacc_vx ---
inline vint32m8_t __riscv_vmacc_vx_i32m8(const vint32m8_t& vd,
                                           SymbolicScalar<int32_t> rs1,
                                           const vint32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term prod = fold_bvmul(tm, rs1.term(), vs2.getElement(i));
        result.push_back(fold_bvadd(tm, vd.getElement(i), prod));
    }
    return RVVVector(tm, 32, result);
}
inline vint32m4_t __riscv_vmacc_vx_i32m4(const vint32m4_t& vd,
                                           SymbolicScalar<int32_t> rs1,
                                           const vint32m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term prod = fold_bvmul(tm, rs1.term(), vs2.getElement(i));
        result.push_back(fold_bvadd(tm, vd.getElement(i), prod));
    }
    return RVVVector(tm, 32, result);
}

// --- vssra_vx (symbolic shift via ITE cascade) ---
// Helper: extracts low 32 bits from a symbolic shift term of any width
inline Term _shift_to_32(TermManager& tm, Term t, size_t src_bits) {
    if (src_bits > 32)
        return tm.mk_term(Kind::BV_EXTRACT, {t}, {31UL, 0UL});
    if (src_bits < 32)
        return tm.mk_term(Kind::BV_ZERO_EXTEND, {t}, {32 - src_bits});
    return t;
}
inline vint32m8_t __riscv_vssra_vx_i32m8(const vint32m8_t& op1,
                                           SymbolicScalar<int32_t> shift,
                                           unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        result.push_back(rounded_shift_right_symbolic(
            tm, op1.getElement(i), shift.term(), 32, vxrm, /*is_signed=*/true));
    }
    return RVVVector(tm, 32, result);
}
inline vint32m4_t __riscv_vssra_vx_i32m4(const vint32m4_t& op1,
                                           SymbolicScalar<int32_t> shift,
                                           unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        result.push_back(rounded_shift_right_symbolic(
            tm, op1.getElement(i), shift.term(), 32, vxrm, /*is_signed=*/true));
    }
    return RVVVector(tm, 32, result);
}
// size_t (uint64) overloads — truncate shift to 32 bits, delegate
inline vint32m8_t __riscv_vssra_vx_i32m8(const vint32m8_t& op1,
                                           SymbolicScalar<size_t> shift,
                                           unsigned vxrm, size_t vl) {
    Term s32 = _shift_to_32(g_ctx->tm, shift.term(), 64);
    return __riscv_vssra_vx_i32m8(op1, SymbolicScalar<int32_t>(s32), vxrm, vl);
}
inline vint32m4_t __riscv_vssra_vx_i32m4(const vint32m4_t& op1,
                                           SymbolicScalar<size_t> shift,
                                           unsigned vxrm, size_t vl) {
    Term s32 = _shift_to_32(g_ctx->tm, shift.term(), 64);
    return __riscv_vssra_vx_i32m4(op1, SymbolicScalar<int32_t>(s32), vxrm, vl);
}

// --- vsadd_vx ---
inline vint16m4_t __riscv_vsadd_vx_i16m4(const vint16m4_t& op1,
                                           SymbolicScalar<int16_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {16});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op2.term()}, {16});
        Term sum = fold_bvadd(tm, a_ext, b_ext);
        result.push_back(signed_clip(tm, sum, 32, 16));
    }
    return RVVVector(tm, 16, result);
}
inline vint16m2_t __riscv_vsadd_vx_i16m2(const vint16m2_t& op1,
                                           SymbolicScalar<int16_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {16});
        Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op2.term()}, {16});
        Term sum = fold_bvadd(tm, a_ext, b_ext);
        result.push_back(signed_clip(tm, sum, 32, 16));
    }
    return RVVVector(tm, 16, result);
}

// --- vmax_vx / vmin_vx ---
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t& op1,
                                        SymbolicScalar<int8_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = tm.mk_term(Kind::BV_SGE, {op1.getElement(i), op2.term()});
        result.push_back(fold_ite(tm, cond, op1.getElement(i), op2.term()));
    }
    return RVVVector(tm, 8, result);
}
inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t& op1,
                                        SymbolicScalar<int8_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = tm.mk_term(Kind::BV_SLE, {op1.getElement(i), op2.term()});
        result.push_back(fold_ite(tm, cond, op1.getElement(i), op2.term()));
    }
    return RVVVector(tm, 8, result);
}

// ===========================================================================
// SymbolicScalar — BV binary _vx_ generic helpers
// ===========================================================================
inline RVVVector rvv_sym_bv_binop_vx(const RVVVector& a, Term b, Kind op, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mk_term(op, {a.getElement(i), b}));
    return RVVVector(tm, bits, r);
}
inline RVVVector rvv_sym_bv_rsub_vx(const RVVVector& a, Term b, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(fold_bvsub(tm, b, a.getElement(i)));
    return RVVVector(tm, bits, r);
}

// --- vadd_vx ---
inline vint32m1_t __riscv_vadd_vx_i32m1(const vint32m1_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_ADD, vl, 32); }
inline vint32m2_t __riscv_vadd_vx_i32m2(const vint32m2_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_ADD, vl, 32); }
inline vint32m4_t __riscv_vadd_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_ADD, vl, 32); }
inline vint32m8_t __riscv_vadd_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_ADD, vl, 32); }
inline vint16m4_t __riscv_vadd_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_ADD, vl, 16); }

// --- vsub_vx ---
inline vint32m4_t __riscv_vsub_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_SUB, vl, 32); }
inline vint32m8_t __riscv_vsub_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_SUB, vl, 32); }
inline vuint32m4_t __riscv_vsub_vx_u32m4(const vuint32m4_t& a, SymbolicScalar<uint32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_SUB, vl, 32); }
inline vuint32m8_t __riscv_vsub_vx_u32m8(const vuint32m8_t& a, SymbolicScalar<uint32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_SUB, vl, 32); }

// --- vrsub_vx (additional LMUL) ---
inline vint8m1_t  __riscv_vrsub_vx_i8m1(const vint8m1_t& a, SymbolicScalar<int8_t> b, size_t vl)   { return rvv_sym_bv_rsub_vx(a, b.term(), vl, 8); }
inline vint8m2_t  __riscv_vrsub_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int8_t> b, size_t vl)   { return rvv_sym_bv_rsub_vx(a, b.term(), vl, 8); }
inline vint16m2_t __riscv_vrsub_vx_i16m2(const vint16m2_t& a, SymbolicScalar<int16_t> b, size_t vl) { return rvv_sym_bv_rsub_vx(a, b.term(), vl, 16); }
inline vint32m4_t __riscv_vrsub_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_rsub_vx(a, b.term(), vl, 32); }

// --- vmul_vx ---
inline vint32m1_t __riscv_vmul_vx_i32m1(const vint32m1_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_MUL, vl, 32); }
inline vint32m4_t __riscv_vmul_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_MUL, vl, 32); }
inline vint32m8_t __riscv_vmul_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_MUL, vl, 32); }

// --- vand_vx ---
inline vint32m4_t __riscv_vand_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_AND, vl, 32); }
inline vint32m8_t __riscv_vand_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_AND, vl, 32); }

// --- vxor_vx ---
inline vint32m4_t __riscv_vxor_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_XOR, vl, 32); }
inline vint32m8_t __riscv_vxor_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_XOR, vl, 32); }

// --- vmax_vx / vmin_vx (i32) ---
inline vint32m4_t __riscv_vmax_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term c = tm.mk_term(Kind::BV_SGE, {a.getElement(i), b.term()});
        r.push_back(fold_ite(tm, c, a.getElement(i), b.term()));
    }
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vmax_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term c = tm.mk_term(Kind::BV_SGE, {a.getElement(i), b.term()});
        r.push_back(fold_ite(tm, c, a.getElement(i), b.term()));
    }
    return RVVVector(tm, 32, r);
}
inline vint32m4_t __riscv_vmin_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term c = tm.mk_term(Kind::BV_SLE, {a.getElement(i), b.term()});
        r.push_back(fold_ite(tm, c, a.getElement(i), b.term()));
    }
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vmin_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term c = tm.mk_term(Kind::BV_SLE, {a.getElement(i), b.term()});
        r.push_back(fold_ite(tm, c, a.getElement(i), b.term()));
    }
    return RVVVector(tm, 32, r);
}

// --- vsra_vx (symbolic shift) ---
inline vint32m4_t __riscv_vsra_vx_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_ASHR, vl, 32);
}
inline vint32m8_t __riscv_vsra_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_ASHR, vl, 32);
}

// --- vsll_vx (symbolic shift) ---
inline vint16m4_t __riscv_vsll_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    return rvv_sym_bv_binop_vx(a, b.term(), Kind::BV_SHL, vl, 16);
}

// --- vwmul_vx (widening multiply, symbolic) ---
inline vint32m4_t __riscv_vwmul_vx_i32m4(const vint16m2_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.term()}, {16});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {16});
        r.push_back(fold_bvmul(tm, a_ext, b_ext));
    }
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vwmul_vx_i32m8(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term b_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.term()}, {16});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {16});
        r.push_back(fold_bvmul(tm, a_ext, b_ext));
    }
    return RVVVector(tm, 32, r);
}

// --- vwsub_vx (additional LMUL) ---
inline vint16m2_t __riscv_vwsub_vx_i16m2(const vint8m1_t& op1, SymbolicScalar<int8_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op2.term()}, {8});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {op1.getElement(i)}, {8});
        r.push_back(fold_bvsub(tm, a_ext, op2_ext));
    }
    return RVVVector(tm, 16, r);
}

// --- vwsubu_vx (unsigned widening subtract) ---
inline vuint16m2_t __riscv_vwsubu_vx_u16m2(const vuint8m1_t& op1, SymbolicScalar<uint8_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {op2.term()}, {8});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {op1.getElement(i)}, {8});
        r.push_back(fold_bvsub(tm, a_ext, op2_ext));
    }
    return RVVVector(tm, 16, r);
}
inline vuint16m4_t __riscv_vwsubu_vx_u16m4(const vuint8m2_t& op1, SymbolicScalar<uint8_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term op2_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {op2.term()}, {8});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mk_term(Kind::BV_ZERO_EXTEND, {op1.getElement(i)}, {8});
        r.push_back(fold_bvsub(tm, a_ext, op2_ext));
    }
    return RVVVector(tm, 16, r);
}

// --- vmslt_vx (symbolic compare, mask-producing) ---
inline MaskVector __riscv_vmslt_vx_i16m4_b4(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), b.term()});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmslt_vx_i32m4_b8(const vint32m4_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), b.term()});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// --- vmerge_vxm (additional symbolic LMUL) ---
inline vint32m4_t __riscv_vmerge_vxm_i32m4(const vint32m4_t& a, SymbolicScalar<int32_t> b, const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, b.term(), a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vmerge_vxm_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, b.term(), a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// ===========================================================================
// SymbolicScalar — FP _vf_ generic helper
// ===========================================================================
inline RVVVector rvv_sym_fp32_binop_vf(const RVVVector& a, Term b_fp, Kind op, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    bool needs_rm = (op != Kind::FP_MAX && op != Kind::FP_MIN);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res = needs_rm ? tm.mk_term(op, {rm, a_fp, b_fp}) : tm.mk_term(op, {a_fp, b_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, res));
    }
    return RVVVector(tm, 32, r);
}

// --- vfadd_vf ---
inline vfloat32m1_t __riscv_vfadd_vf_f32m1(const vfloat32m1_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_ADD, vl); }
inline vfloat32m2_t __riscv_vfadd_vf_f32m2(const vfloat32m2_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_ADD, vl); }
inline vfloat32m4_t __riscv_vfadd_vf_f32m4(const vfloat32m4_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_ADD, vl); }
inline vfloat32m8_t __riscv_vfadd_vf_f32m8(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_ADD, vl); }

// --- vfmul_vf ---
inline vfloat32m1_t __riscv_vfmul_vf_f32m1(const vfloat32m1_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MUL, vl); }
inline vfloat32m2_t __riscv_vfmul_vf_f32m2(const vfloat32m2_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MUL, vl); }
inline vfloat32m4_t __riscv_vfmul_vf_f32m4(const vfloat32m4_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MUL, vl); }
inline vfloat32m8_t __riscv_vfmul_vf_f32m8(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MUL, vl); }

// --- vfmul_vf _mu (masked, undisturbed) ---
inline vfloat32m1_t __riscv_vfmul_vf_f32m1_mu(const vbool32_t& mask, const vfloat32m1_t& merge,
                                                 const vfloat32m1_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_MUL, {rm, a_fp, b.term()});
        Term res_bv = rvv_store_fp32_as_bv(tm, res_fp);
        r.push_back(fold_ite(tm, sel, res_bv, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m2_t __riscv_vfmul_vf_f32m2_mu(const vbool16_t& mask, const vfloat32m2_t& merge,
                                                 const vfloat32m2_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_MUL, {rm, a_fp, b.term()});
        Term res_bv = rvv_store_fp32_as_bv(tm, res_fp);
        r.push_back(fold_ite(tm, sel, res_bv, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmul_vf_f32m4_mu(const vbool8_t& mask, const vfloat32m4_t& merge,
                                                 const vfloat32m4_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_MUL, {rm, a_fp, b.term()});
        Term res_bv = rvv_store_fp32_as_bv(tm, res_fp);
        r.push_back(fold_ite(tm, sel, res_bv, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m8_t __riscv_vfmul_vf_f32m8_mu(const vbool4_t& mask, const vfloat32m8_t& merge,
                                                 const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_MUL, {rm, a_fp, b.term()});
        Term res_bv = rvv_store_fp32_as_bv(tm, res_fp);
        r.push_back(fold_ite(tm, sel, res_bv, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// --- vfmin_vf / vfmax_vf ---
inline vfloat32m1_t __riscv_vfmin_vf_f32m1(const vfloat32m1_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MIN, vl); }
inline vfloat32m2_t __riscv_vfmin_vf_f32m2(const vfloat32m2_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MIN, vl); }
inline vfloat32m4_t __riscv_vfmin_vf_f32m4(const vfloat32m4_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MIN, vl); }
inline vfloat32m8_t __riscv_vfmin_vf_f32m8(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MIN, vl); }
inline vfloat32m1_t __riscv_vfmax_vf_f32m1(const vfloat32m1_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MAX, vl); }
inline vfloat32m2_t __riscv_vfmax_vf_f32m2(const vfloat32m2_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MAX, vl); }
inline vfloat32m4_t __riscv_vfmax_vf_f32m4(const vfloat32m4_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MAX, vl); }
inline vfloat32m8_t __riscv_vfmax_vf_f32m8(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FP_MAX, vl); }

// --- vmflt_vf (symbolic FP compare, mask-producing) ---
inline MaskVector __riscv_vmflt_vf_f32m1_b32(const vfloat32m1_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LT, {a_fp, b.term()});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmflt_vf_f32m2_b16(const vfloat32m2_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LT, {a_fp, b.term()});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmflt_vf_f32m4_b8(const vfloat32m4_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LT, {a_fp, b.term()});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmflt_vf_f32m8_b4(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LT, {a_fp, b.term()});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// --- vfmerge_vfm (symbolic FP merge) ---
inline vfloat32m4_t __riscv_vfmerge_vfm_f32m4(const vfloat32m4_t& a, SymbolicScalar<float> b, const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    Term b_bv = rvv_store_fp32_as_bv(tm, b.term());
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        r.push_back(fold_ite(tm, sel, b_bv, a.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// ===========================================================================
// Widening cast overloads — accept wider SymbolicScalar types and truncate.
// Must be AFTER base SymbolicScalar overloads so the targets are visible.
// ===========================================================================

// vmv_v_x: int32 → int16/int8
inline vint16m4_t __riscv_vmv_v_x_i16m4(SymbolicScalar<int32_t> v, size_t vl) { return __riscv_vmv_v_x_i16m4(v.cast<int16_t>(), vl); }
inline vint16m2_t __riscv_vmv_v_x_i16m2(SymbolicScalar<int32_t> v, size_t vl) { return __riscv_vmv_v_x_i16m2(v.cast<int16_t>(), vl); }
inline vint16m1_t __riscv_vmv_v_x_i16m1(SymbolicScalar<int32_t> v, size_t vl) { return __riscv_vmv_v_x_i16m1(v.cast<int16_t>(), vl); }
inline vint8m1_t  __riscv_vmv_v_x_i8m1(SymbolicScalar<int32_t> v, size_t vl)  { return __riscv_vmv_v_x_i8m1(v.cast<int8_t>(), vl); }
inline vint8m1_t  __riscv_vmv_v_x_i8m1(SymbolicScalar<int16_t> v, size_t vl)  { return __riscv_vmv_v_x_i8m1(v.cast<int8_t>(), vl); }

// vrsub_vx
inline vint16m4_t __riscv_vrsub_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vrsub_vx_i16m4(a, b.cast<int16_t>(), vl); }
inline vint16m2_t __riscv_vrsub_vx_i16m2(const vint16m2_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vrsub_vx_i16m2(a, b.cast<int16_t>(), vl); }

// vmerge_vxm
inline vint16m4_t __riscv_vmerge_vxm_i16m4(const vint16m4_t& a, SymbolicScalar<int32_t> b, const MaskVector& mask, size_t vl) { return __riscv_vmerge_vxm_i16m4(a, b.cast<int16_t>(), mask, vl); }

// vsadd_vx
inline vint16m4_t __riscv_vsadd_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vsadd_vx_i16m4(a, b.cast<int16_t>(), vl); }
inline vint16m2_t __riscv_vsadd_vx_i16m2(const vint16m2_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vsadd_vx_i16m2(a, b.cast<int16_t>(), vl); }

// vmax_vx / vmin_vx: int32/int16 → int8
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vmax_vx_i8m2(a, b.cast<int8_t>(), vl); }
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int16_t> b, size_t vl) { return __riscv_vmax_vx_i8m2(a, b.cast<int8_t>(), vl); }
inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vmin_vx_i8m2(a, b.cast<int8_t>(), vl); }
inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int16_t> b, size_t vl) { return __riscv_vmin_vx_i8m2(a, b.cast<int8_t>(), vl); }

// vmslt_vx
inline MaskVector __riscv_vmslt_vx_i16m4_b4(const vint16m4_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vmslt_vx_i16m4_b4(a, b.cast<int16_t>(), vl); }

// vwsub_vx: int32 → int8
inline vint16m4_t __riscv_vwsub_vx_i16m4(const vint8m2_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vwsub_vx_i16m4(a, b.cast<int8_t>(), vl); }
inline vint16m2_t __riscv_vwsub_vx_i16m2(const vint8m1_t& a, SymbolicScalar<int32_t> b, size_t vl) { return __riscv_vwsub_vx_i16m2(a, b.cast<int8_t>(), vl); }

// vwsubu_vx: uint32 → uint8
inline vuint16m2_t __riscv_vwsubu_vx_u16m2(const vuint8m1_t& a, SymbolicScalar<uint32_t> b, size_t vl) { return __riscv_vwsubu_vx_u16m2(a, b.cast<uint8_t>(), vl); }
inline vuint16m4_t __riscv_vwsubu_vx_u16m4(const vuint8m2_t& a, SymbolicScalar<uint32_t> b, size_t vl) { return __riscv_vwsubu_vx_u16m4(a, b.cast<uint8_t>(), vl); }

// ===========================================================================
// PHASE 4: Float16 (FP16) RVV intrinsics
// ===========================================================================

// FP16 helpers: BV16 ↔ FP16 (5-bit exponent, 11-bit significand)
inline Term rvv_load_as_fp16(TermManager& tm, Term bv) {
    return tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {5, 11});
}

inline size_t& rvv_fp16_bv_counter() {
    static size_t counter = 0;
    return counter;
}

inline Term rvv_store_fp16_as_bv(TermManager& tm, Term fp_val) {
    Sort bv16 = tm.mk_bv_sort(16);
    Term bv = tm.mk_const(bv16, "_rvv_fp16_2bv_" + std::to_string(rvv_fp16_bv_counter()++));
    Term fp_from_bv = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {5, 11});
    g_ctx->solver->assert_formula(fold_eq(tm, fp_from_bv, fp_val));
    return bv;
}

// Helper: apply binary FP16 op element-wise
inline RVVVector rvv_fp16_binop(const RVVVector& a, const RVVVector& b, Kind op, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    bool needs_rm = (op != Kind::FP_MAX && op != Kind::FP_MIN);
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp16(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp16(tm, b.getElement(i));
        Term res_fp = needs_rm ? tm.mk_term(op, {rm, a_fp, b_fp}) : tm.mk_term(op, {a_fp, b_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// VLE / VSE for float16
// ===========================================================================
inline vfloat16m1_t __riscv_vle16_v_f16m1(const _Float16* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 16);
}
inline vfloat16m2_t __riscv_vle16_v_f16m2(const _Float16* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 16);
}
inline vfloat16m4_t __riscv_vle16_v_f16m4(const _Float16* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 16);
}
inline vfloat16m8_t __riscv_vle16_v_f16m8(const _Float16* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 16);
}

inline void __riscv_vse16_v_f16m1(_Float16* ptr, const vfloat16m1_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}
inline void __riscv_vse16_v_f16m2(_Float16* ptr, const vfloat16m2_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}
inline void __riscv_vse16_v_f16m4(_Float16* ptr, const vfloat16m4_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}
inline void __riscv_vse16_v_f16m8(_Float16* ptr, const vfloat16m8_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}

// ---------------------------------------------------------------------------
// FP16 strided + tuple stores
// ---------------------------------------------------------------------------

// vfloatN mxK tuple types — a struct of K vectors, addressed by index via
// __riscv_vset_v_*/__riscv_vget_v_*.
struct vfloat16m1x2_t {
    vfloat16m1_t val[2];
    vfloat16m1x2_t() = default;
    vfloat16m1x2_t(const vfloat16m1_t& v0, const vfloat16m1_t& v1) : val{v0, v1} {}
};

// x3 variant — used by conv-hwc2chw segmented gather to hold the 3 input
// channels loaded per spatial pixel.
struct vfloat16m1x3_t {
    vfloat16m1_t val[3];
    vfloat16m1x3_t() = default;
    vfloat16m1x3_t(const vfloat16m1_t& v0, const vfloat16m1_t& v1, const vfloat16m1_t& v2)
        : val{v0, v1, v2} {}
};

// vget: return tuple.val[index].  Overload for x3.
inline vfloat16m1_t __riscv_vget_v_f16m1x3_f16m1(const vfloat16m1x3_t& src,
                                                   size_t index) {
    return src.val[index];
}

// vluxseg3ei32: indexed unordered segmented load, nseg=3, EEW=32 indices.
// For each lane i:  val[seg][i] = *(elem_t*)((char*)base + byte_off[i] + seg*2)
// The 3 segments are contiguous in memory (channel-major), so shifting `base`
// by `seg` (in _Float16 units = 2 bytes) reuses the scalar gather impl.
inline vfloat16m1x3_t __riscv_vluxseg3ei32_v_f16m1x3(const _Float16* base,
                                                      const vuint32m2_t& byte_off,
                                                      size_t vl) {
    RVVVector s0 = rvv_vluxei32_impl(base + 0, byte_off, vl, 16);
    RVVVector s1 = rvv_vluxei32_impl(base + 1, byte_off, vl, 16);
    RVVVector s2 = rvv_vluxei32_impl(base + 2, byte_off, vl, 16);
    return vfloat16m1x3_t(s0, s1, s2);
}

// vmerge_vvm f16m1: mask=1 picks b, mask=0 picks a.  Mirrors the f32 variant
// at ~:1647 but with 16-bit elements.
inline vfloat16m1_t __riscv_vmerge_vvm_f16m1(const vfloat16m1_t& a,
                                               const vfloat16m1_t& b,
                                               const vbool16_t& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term src_v = (i < b.getVL()) ? b.getElement(i) : mk_bv_val(tm, b.elemBits(), 0);
        r.push_back(fold_ite(tm, sel, src_v, a.getElement(i)));
    }
    return RVVVector(tm, 16, r);
}

// vset: dest[index] = val, return the new tuple.
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vset_v_f16m1_f16m1x2.
inline vfloat16m1x2_t __riscv_vset_v_f16m1_f16m1x2(vfloat16m1x2_t dest,
                                                    size_t index,
                                                    const vfloat16m1_t& val) {
    dest.val[index] = val;
    return dest;
}

// vsse16: strided store.  bstride is in BYTES.
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vsse16_v_f16m1
// (note: the op-semantics snippet omits the stride; RVV spec is
//  `*(elem_t*)((char*)base + i * bstride) = value[i]`).
inline void __riscv_vsse16_v_f16m1(_Float16* base, ptrdiff_t bstride,
                                     const vfloat16m1_t& value, size_t vl) {
    auto& buf = g_ctx->findBuffer(base);
    ptrdiff_t base_off = static_cast<ptrdiff_t>(buf.ptrToByteOffset(base));
    for (size_t i = 0; i < vl; i++) {
        ptrdiff_t off = base_off + static_cast<ptrdiff_t>(i) * bstride;
        buf.storeScalar(static_cast<size_t>(off), value.getElement(i), 16);
    }
}

// vsse16 m4 — identical shape to m1, wider vector.
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vsse16_v_f16m4.
inline void __riscv_vsse16_v_f16m4(_Float16* base, ptrdiff_t bstride,
                                     const vfloat16m4_t& value, size_t vl) {
    auto& buf = g_ctx->findBuffer(base);
    ptrdiff_t base_off = static_cast<ptrdiff_t>(buf.ptrToByteOffset(base));
    for (size_t i = 0; i < vl; i++) {
        ptrdiff_t off = base_off + static_cast<ptrdiff_t>(i) * bstride;
        buf.storeScalar(static_cast<size_t>(off), value.getElement(i), 16);
    }
}

// vssseg2e16: strided segment store, nseg=2.  For each i in [0, vl):
//   *(base + i*bstride + 0*elem_bytes) = v_tuple.val[0][i]
//   *(base + i*bstride + 1*elem_bytes) = v_tuple.val[1][i]
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vssseg2e16_v_f16m1x2
// (op-semantics is a stub; behavior follows the RVV 1.0 spec).
inline void __riscv_vssseg2e16_v_f16m1x2(_Float16* base, ptrdiff_t bstride,
                                           const vfloat16m1x2_t& v_tuple,
                                           size_t vl) {
    auto& buf = g_ctx->findBuffer(base);
    ptrdiff_t base_off = static_cast<ptrdiff_t>(buf.ptrToByteOffset(base));
    for (size_t i = 0; i < vl; i++) {
        ptrdiff_t off = base_off + static_cast<ptrdiff_t>(i) * bstride;
        buf.storeScalar(static_cast<size_t>(off),     v_tuple.val[0].getElement(i), 16);
        buf.storeScalar(static_cast<size_t>(off) + 2, v_tuple.val[1].getElement(i), 16);
    }
}

// ===========================================================================
// FP16 arithmetic: add, sub, mul, div (vector-vector)
// ===========================================================================
inline vfloat16m1_t __riscv_vfadd_vv_f16m1(const vfloat16m1_t& a, const vfloat16m1_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_ADD, vl); }
inline vfloat16m2_t __riscv_vfadd_vv_f16m2(const vfloat16m2_t& a, const vfloat16m2_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_ADD, vl); }
inline vfloat16m4_t __riscv_vfadd_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_ADD, vl); }
inline vfloat16m8_t __riscv_vfadd_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_ADD, vl); }

inline vfloat16m1_t __riscv_vfsub_vv_f16m1(const vfloat16m1_t& a, const vfloat16m1_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_SUB, vl); }
inline vfloat16m2_t __riscv_vfsub_vv_f16m2(const vfloat16m2_t& a, const vfloat16m2_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_SUB, vl); }
inline vfloat16m4_t __riscv_vfsub_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_SUB, vl); }
inline vfloat16m8_t __riscv_vfsub_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_SUB, vl); }

inline vfloat16m1_t __riscv_vfmul_vv_f16m1(const vfloat16m1_t& a, const vfloat16m1_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MUL, vl); }
inline vfloat16m2_t __riscv_vfmul_vv_f16m2(const vfloat16m2_t& a, const vfloat16m2_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MUL, vl); }
inline vfloat16m4_t __riscv_vfmul_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MUL, vl); }
inline vfloat16m8_t __riscv_vfmul_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MUL, vl); }

inline vfloat16m1_t __riscv_vfdiv_vv_f16m1(const vfloat16m1_t& a, const vfloat16m1_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_DIV, vl); }
inline vfloat16m2_t __riscv_vfdiv_vv_f16m2(const vfloat16m2_t& a, const vfloat16m2_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_DIV, vl); }
inline vfloat16m4_t __riscv_vfdiv_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_DIV, vl); }
inline vfloat16m8_t __riscv_vfdiv_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_DIV, vl); }

// ===========================================================================
// FP16 scalar variants (_vf): vector op scalar
// ===========================================================================
// Note: `_Float16` is a struct wrapper in context.hpp, not GCC's native type,
// so C++ won't convert a `float` literal to it.  Kernels passing `0.0f` etc.
// need a `float` overload (see `__riscv_vfmacc_vf_f16m1` for the pattern).
inline RVVVector rvv_fp16_binop_vf(const RVVVector& a, _Float16 b, Kind op, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Term b_fp = mk_fp16_from_f16(tm, b);
    bool needs_rm = (op != Kind::FP_MAX && op != Kind::FP_MIN);
    std::vector<Term> r;
    r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp16(tm, a.getElement(i));
        Term res_fp = needs_rm ? tm.mk_term(op, {rm, a_fp, b_fp}) : tm.mk_term(op, {a_fp, b_fp});
        r.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, r);
}

inline vfloat16m1_t __riscv_vfadd_vf_f16m1(const vfloat16m1_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_ADD, vl); }
inline vfloat16m2_t __riscv_vfadd_vf_f16m2(const vfloat16m2_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_ADD, vl); }
inline vfloat16m4_t __riscv_vfadd_vf_f16m4(const vfloat16m4_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_ADD, vl); }
inline vfloat16m8_t __riscv_vfadd_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_ADD, vl); }

inline vfloat16m1_t __riscv_vfsub_vf_f16m1(const vfloat16m1_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_SUB, vl); }
inline vfloat16m2_t __riscv_vfsub_vf_f16m2(const vfloat16m2_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_SUB, vl); }
inline vfloat16m4_t __riscv_vfsub_vf_f16m4(const vfloat16m4_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_SUB, vl); }
inline vfloat16m8_t __riscv_vfsub_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_SUB, vl); }

inline vfloat16m1_t __riscv_vfmul_vf_f16m1(const vfloat16m1_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MUL, vl); }
inline vfloat16m2_t __riscv_vfmul_vf_f16m2(const vfloat16m2_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MUL, vl); }
inline vfloat16m4_t __riscv_vfmul_vf_f16m4(const vfloat16m4_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MUL, vl); }
inline vfloat16m8_t __riscv_vfmul_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MUL, vl); }

inline vfloat16m1_t __riscv_vfdiv_vf_f16m1(const vfloat16m1_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_DIV, vl); }
inline vfloat16m2_t __riscv_vfdiv_vf_f16m2(const vfloat16m2_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_DIV, vl); }
inline vfloat16m4_t __riscv_vfdiv_vf_f16m4(const vfloat16m4_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_DIV, vl); }
inline vfloat16m8_t __riscv_vfdiv_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_DIV, vl); }

// ===========================================================================
// FP16 MIN / MAX (vector-vector)
// ===========================================================================
inline vfloat16m1_t __riscv_vfmin_vv_f16m1(const vfloat16m1_t& a, const vfloat16m1_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MIN, vl); }
inline vfloat16m2_t __riscv_vfmin_vv_f16m2(const vfloat16m2_t& a, const vfloat16m2_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MIN, vl); }
inline vfloat16m4_t __riscv_vfmin_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MIN, vl); }
inline vfloat16m8_t __riscv_vfmin_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MIN, vl); }

inline vfloat16m1_t __riscv_vfmax_vv_f16m1(const vfloat16m1_t& a, const vfloat16m1_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MAX, vl); }
inline vfloat16m2_t __riscv_vfmax_vv_f16m2(const vfloat16m2_t& a, const vfloat16m2_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MAX, vl); }
inline vfloat16m4_t __riscv_vfmax_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MAX, vl); }
inline vfloat16m8_t __riscv_vfmax_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) { return rvv_fp16_binop(a, b, Kind::FP_MAX, vl); }

// ===========================================================================
// FP16 MIN / MAX (vector-scalar)
// ===========================================================================
inline vfloat16m1_t __riscv_vfmin_vf_f16m1(const vfloat16m1_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MIN, vl); }
inline vfloat16m2_t __riscv_vfmin_vf_f16m2(const vfloat16m2_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MIN, vl); }
inline vfloat16m4_t __riscv_vfmin_vf_f16m4(const vfloat16m4_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MIN, vl); }
inline vfloat16m8_t __riscv_vfmin_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MIN, vl); }

inline vfloat16m1_t __riscv_vfmax_vf_f16m1(const vfloat16m1_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MAX, vl); }
inline vfloat16m2_t __riscv_vfmax_vf_f16m2(const vfloat16m2_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MAX, vl); }
inline vfloat16m4_t __riscv_vfmax_vf_f16m4(const vfloat16m4_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MAX, vl); }
inline vfloat16m8_t __riscv_vfmax_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) { return rvv_fp16_binop_vf(a, b, Kind::FP_MAX, vl); }

// ===========================================================================
// FP16 FMA: vfmadd — vd = vd * vs1 + vs2
// ===========================================================================
inline vfloat16m1_t __riscv_vfmadd_vv_f16m1(const vfloat16m1_t& vd, const vfloat16m1_t& vs1,
                                              const vfloat16m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        // vfmadd: vd = vd * vs1 + vs2 → FMA(vd, vs1, vs2)
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, vd_fp, vs1_fp, vs2_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}
inline vfloat16m2_t __riscv_vfmadd_vv_f16m2(const vfloat16m2_t& vd, const vfloat16m2_t& vs1,
                                              const vfloat16m2_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, vd_fp, vs1_fp, vs2_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}
inline vfloat16m4_t __riscv_vfmadd_vv_f16m4(const vfloat16m4_t& vd, const vfloat16m4_t& vs1,
                                              const vfloat16m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, vd_fp, vs1_fp, vs2_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// FP16 FMA: vfmacc — vd = vd + vs1 * vs2
// ===========================================================================
inline vfloat16m1_t __riscv_vfmacc_vv_f16m1(const vfloat16m1_t& vd, const vfloat16m1_t& vs1,
                                              const vfloat16m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        // vfmacc: vd = vd + vs1 * vs2 → FMA(vs1, vs2, vd)
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, vs1_fp, vs2_fp, vd_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}

// FP16 vfmacc_vf — vd = vd + rs1 * vs2  (scalar multiplier broadcast)
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vfmacc_vf_f16m1.
// `_Float16` has an implicit `float` constructor (see context.hpp), so
// callers passing `0.0f` or ternaries like `(cond ? _Float16 : 0.0f)`
// resolve without casts.
inline vfloat16m1_t __riscv_vfmacc_vf_f16m1(const vfloat16m1_t& vd, _Float16 rs1,
                                              const vfloat16m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Term rs1_fp = mk_fp16_from_f16(tm, rs1);
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, rs1_fp, vs2_fp, vd_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}

// vfmacc_vf m4 — identical shape to m1, wider vector.
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vfmacc_vf_f16m4.
inline vfloat16m4_t __riscv_vfmacc_vf_f16m4(const vfloat16m4_t& vd, _Float16 rs1,
                                              const vfloat16m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    Term rs1_fp = mk_fp16_from_f16(tm, rs1);
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, rs1_fp, vs2_fp, vd_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}

// FP16 vmfne_vv — mask of {i : op1[i] != op2[i]}.  Used for NaN detection
// (vmfne(x,x) is true iff x is NaN).  Mirrors the f32 equivalents above.
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vmfne_vv_f16m1_b16.
inline MaskVector __riscv_vmfne_vv_f16m1_b16(const vfloat16m1_t& a,
                                               const vfloat16m1_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp16(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp16(tm, b.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_EQUAL, {a_fp, b_fp});
        bits.push_back(fold_ite(tm, cmp, mk_bv_val(tm, 1, 0), mk_bv_val(tm, 1, 1)));
    }
    return MaskVector(tm, bits);
}

// FP16 ↔ u16 reinterpret — same bit-width, same storage, just a type change.
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vreinterpret_v_f16m1_u16m1
// (and its reverse).
inline RVVVector __riscv_vreinterpret_v_f16m1_u16m1(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_u16m1_f16m1(const RVVVector& a) { return a; }

// u16 merge-with-scalar: res[i] = mask[i] ? op2 : op1[i].
// Semantics per op-semantics/rvv-intrinsics.md §__riscv_vmerge_vxm_u16m1.
// Reuses the generic rvv_vmerge_vxm_impl at ~:1634.
inline vuint16m1_t __riscv_vmerge_vxm_u16m1(const vuint16m1_t& op1, uint16_t op2,
                                              const MaskVector& mask, size_t vl) {
    return rvv_vmerge_vxm_impl(op1, op2, mask, vl, 16);
}

// ===========================================================================
// FP16 FMA: vfnmsac — vd = vd - vs1 * vs2
// ===========================================================================
inline vfloat16m1_t __riscv_vfnmsac_vv_f16m1(const vfloat16m1_t& vd, const vfloat16m1_t& vs1,
                                               const vfloat16m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term neg_vs1 = tm.mk_term(Kind::FP_NEG, {vs1_fp});
        Term res_fp = tm.mk_term(Kind::FP_FMA, {rm, neg_vs1, vs2_fp, vd_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// FP16 ABS / NEG / SQRT
// ===========================================================================
inline vfloat16m1_t __riscv_vfabs_v_f16m1(const vfloat16m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp16(tm, a.getElement(i));
        result.push_back(rvv_store_fp16_as_bv(tm, tm.mk_term(Kind::FP_ABS, {a_fp})));
    }
    return RVVVector(tm, 16, result);
}

inline vfloat16m1_t __riscv_vfneg_v_f16m1(const vfloat16m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp16(tm, a.getElement(i));
        result.push_back(rvv_store_fp16_as_bv(tm, tm.mk_term(Kind::FP_NEG, {a_fp})));
    }
    return RVVVector(tm, 16, result);
}

inline vfloat16m1_t __riscv_vfsqrt_v_f16m1(const vfloat16m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp16(tm, a.getElement(i));
        result.push_back(rvv_store_fp16_as_bv(tm, tm.mk_term(Kind::FP_SQRT, {rm, a_fp})));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// FP16 broadcast scalar to vector
// ===========================================================================
inline vfloat16m1_t __riscv_vfmv_v_f_f16m1(_Float16 src, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = tm.mk_bv_value_uint64(tm.mk_bv_sort(16), src.value);
    std::vector<Term> elems(vl, bv);
    return RVVVector(tm, 16, elems);
}

// ===========================================================================
// FP64 + u32m1/u16mf2 mirror block
// Ported from src/verification_cvc5/rvv/intrinsics.hpp.  Bitwuzla Kind names
// (FP_TO_FP_FROM_FP, FP_ADD, FP_MUL, BV_ZERO_EXTEND, etc.).  Used by the
// fp64-intermediate bf16-gemm RVV target.
// ===========================================================================

// --- Type aliases (RVVVector under the hood) ------------------------------
using vfloat64m1_t = RVVVector;
using vfloat64m2_t = RVVVector;
using vfloat64m4_t = RVVVector;

// --- FRM encodings (RISC-V FP rounding-mode constants) --------------------
constexpr unsigned __RISCV_FRM_RNE = 0;
constexpr unsigned __RISCV_FRM_RTZ = 1;
constexpr unsigned __RISCV_FRM_RDN = 2;
constexpr unsigned __RISCV_FRM_RUP = 3;
constexpr unsigned __RISCV_FRM_RMM = 4;

inline Term rm_term_from_frm(TermManager& tm, unsigned frm) {
    switch (frm) {
        case __RISCV_FRM_RNE: return tm.mk_rm_value(RoundingMode::RNE);
        case __RISCV_FRM_RTZ: return tm.mk_rm_value(RoundingMode::RTZ);
        case __RISCV_FRM_RDN: return tm.mk_rm_value(RoundingMode::RTN);
        case __RISCV_FRM_RUP: return tm.mk_rm_value(RoundingMode::RTP);
        case __RISCV_FRM_RMM: return tm.mk_rm_value(RoundingMode::RNA);
    }
    throw std::runtime_error("rm_term_from_frm: unsupported frm");
}

// --- FP64 helpers (load/store via fresh-const round-trip) -----------------
inline Term rvv_load_as_fp64(TermManager& tm, Term bv) {
    return tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {11, 53});
}

inline Term rvv_store_fp64_as_bv(TermManager& tm, Term fp_val) {
    Sort bv64 = tm.mk_bv_sort(64);
    Term bv = tm.mk_const(bv64, "_rvv_fp64_2bv_" + std::to_string(rvv_fp_bv_counter()++));
    Term fp_from_bv = tm.mk_term(Kind::FP_TO_FP_FROM_BV, {bv}, {11, 53});
    g_ctx->solver->assert_formula(fold_eq(tm, fp_from_bv, fp_val));
    return bv;
}

// --- FP32 → FP64 widening convert -----------------------------------------
inline vfloat64m2_t __riscv_vfwcvt_f_f_v_f64m2(const vfloat32m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term f32 = rvv_load_as_fp32(tm, a.getElement(i));
        Term f64 = tm.mk_term(Kind::FP_TO_FP_FROM_FP, {rm, f32}, {11, 53});
        r.push_back(rvv_store_fp64_as_bv(tm, f64));
    }
    return RVVVector(tm, 64, r);
}

// --- FP64 add with explicit rounding mode ----------------------------------
inline vfloat64m2_t __riscv_vfadd_vv_f64m2_rm(const vfloat64m2_t& a, const vfloat64m2_t& b,
                                                unsigned frm, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = rm_term_from_frm(tm, frm);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af = rvv_load_as_fp64(tm, a.getElement(i));
        Term bf = rvv_load_as_fp64(tm, b.getElement(i));
        Term s  = tm.mk_term(Kind::FP_ADD, {rm, af, bf});
        r.push_back(rvv_store_fp64_as_bv(tm, s));
    }
    return RVVVector(tm, 64, r);
}

// --- FP64 → FP32 narrowing convert with rm --------------------------------
inline vfloat32m1_t __riscv_vfncvt_f_f_w_f32m1_rm(const vfloat64m2_t& a,
                                                    unsigned frm, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = rm_term_from_frm(tm, frm);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term f64 = rvv_load_as_fp64(tm, a.getElement(i));
        Term f32 = tm.mk_term(Kind::FP_TO_FP_FROM_FP, {rm, f64}, {8, 24});
        r.push_back(rvv_store_fp32_as_bv(tm, f32));
    }
    return RVVVector(tm, 32, r);
}

// --- FP NEQ comparison ----------------------------------------------------
inline MaskVector __riscv_vmfne_vv_f64m2_b32(const vfloat64m2_t& a, const vfloat64m2_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af = rvv_load_as_fp64(tm, a.getElement(i));
        Term bf = rvv_load_as_fp64(tm, b.getElement(i));
        Term eq = tm.mk_term(Kind::FP_EQUAL, {af, bf});
        Term ne = tm.mk_term(Kind::NOT, {eq});
        bits.push_back(fold_ite(tm, ne, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// --- vfwmacc.vv (f64m2): widening fused multiply-accumulate ---------------
inline vfloat64m2_t __riscv_vfwmacc_vv_f64m2(const vfloat64m2_t& vd,
                                              const vfloat32m1_t& vs1,
                                              const vfloat32m1_t& vs2,
                                              size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af32 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term bf32 = rvv_load_as_fp32(tm, vs2.getElement(i));
        Term af64 = tm.mk_term(Kind::FP_TO_FP_FROM_FP, {rm, af32}, {11, 53});
        Term bf64 = tm.mk_term(Kind::FP_TO_FP_FROM_FP, {rm, bf32}, {11, 53});
        Term mul  = tm.mk_term(Kind::FP_MUL, {rm, af64, bf64});
        Term acc  = rvv_load_as_fp64(tm, vd.getElement(i));
        Term sum  = tm.mk_term(Kind::FP_ADD, {rm, acc, mul});
        r.push_back(rvv_store_fp64_as_bv(tm, sum));
    }
    return RVVVector(tm, 64, r);
}

inline vfloat64m2_t __riscv_vslidedown_vx_f64m2(const vfloat64m2_t& a,
                                                  size_t off, size_t vl) {
    return rvv_vslidedown_impl(a, off, vl, 64);
}

// --- u32m1 BV ops --------------------------------------------------------
inline vuint32m1_t __riscv_vand_vx_u32m1(const vuint32m1_t& a, uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, (int64_t)b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(fold_bvand(tm, a.getElement(i), bv));
    return RVVVector(tm, 32, r);
}

inline vuint32m1_t __riscv_vor_vx_u32m1(const vuint32m1_t& a, uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, (int64_t)b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(fold_bvor(tm, a.getElement(i), bv));
    return RVVVector(tm, 32, r);
}

inline vuint32m1_t __riscv_vor_vx_u32m1_mu(const vbool32_t& mask,
                                             const vuint32m1_t& merge,
                                             const vuint32m1_t& a,
                                             uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv  = mk_bv_val(tm, 32, (int64_t)b);
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = fold_eq(tm, mask.getBit(i), one);
        Term ored = fold_bvor(tm, a.getElement(i), bv);
        r.push_back(fold_ite(tm, cond, ored, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// vsll_vx_u32m1, vsrl_vx_u32m1, vadd_vx_u32m1, vid_v_u32m1 are already
// defined earlier in this file via macros — do not redefine here.

// --- vzext_vf2_u32m2 (u16m1 → u32m2) ------------------------------------
inline vuint32m2_t __riscv_vzext_vf2_u32m2(const vuint16m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(fold_bvzext(tm, 16, a.getElement(i)));
    return RVVVector(tm, 32, r);
}

// --- vreinterpret_v_u32m2_f32m2 (no-op — same BV layout) ----------------
inline vfloat32m2_t __riscv_vreinterpret_v_u32m2_f32m2(const vuint32m2_t& a) { return a; }

// --- vlmul_trunc_v_f32m2_f32m1 (no-op — same RVVVector) -----------------
inline vfloat32m1_t __riscv_vlmul_trunc_v_f32m2_f32m1(const vfloat32m2_t& a) { return a; }

// --- u32m1 mask predicates -----------------------------------------------
inline MaskVector __riscv_vmseq_vx_u32m1_b32(const vuint32m1_t& a, uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, (int64_t)b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term eq = fold_eq(tm, a.getElement(i), bv);
        bits.push_back(fold_ite(tm, eq, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsne_vx_u32m1_b32(const vuint32m1_t& a, uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, (int64_t)b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term eq = fold_eq(tm, a.getElement(i), bv);
        Term ne = tm.mk_term(Kind::NOT, {eq});
        bits.push_back(fold_ite(tm, ne, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)));
    }
    return MaskVector(tm, bits);
}

// --- vmerge_vvm.u32m1 ----------------------------------------------------
inline vuint32m1_t __riscv_vmerge_vvm_u32m1(const vuint32m1_t& merge, const vuint32m1_t& src,
                                              const vbool32_t& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = fold_eq(tm, mask.getBit(i), one);
        Term src_v = (i < src.getVL()) ? src.getElement(i) : mk_bv_val(tm, src.elemBits(), 0);
        r.push_back(fold_ite(tm, sel, src_v, merge.getElement(i)));
    }
    return RVVVector(tm, 32, r);
}

// --- u16mf2 family (BF16 narrow / store path) ----------------------------
inline vuint32m1_t __riscv_vzext_vf2_u32m1(const vuint16mf2_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(fold_bvzext(tm, 16, a.getElement(i)));
    return RVVVector(tm, 32, r);
}

inline vuint16mf2_t __riscv_vncvt_x_x_w_u16mf2(const vuint32m1_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(fold_bvextract(tm, 15, 0, a.getElement(i)));
    return RVVVector(tm, 16, r);
}

inline vuint16mf2_t __riscv_vle16_v_u16mf2(const uint16_t* p, size_t vl) {
    auto& b = g_ctx->findBuffer(p);
    return b.loadRVV(b.ptrToByteOffset(p), vl, 16);
}

inline void __riscv_vse16_v_u16mf2(uint16_t* p, const vuint16mf2_t& v, size_t vl) {
    auto& b = g_ctx->findBuffer(p);
    b.storeRVV(b.ptrToByteOffset(p), v);
}

} // namespace salt
