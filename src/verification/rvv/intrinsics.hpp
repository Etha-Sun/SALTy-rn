#pragma once
// RVV intrinsics → bitwuzla BV/FP terms.
// Each intrinsic matches the real riscv_vector.h signature.
// Implementations follow RVV spec pseudocode from op-semantics/rvv-intrinsics.md.

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
        : tm.mk_term(Kind::BV_SHR,  {val, shift_amt});

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
        return tm.mk_term(Kind::BV_ADD, {shifted, round_ext});
    }

    if (vxrm == __RISCV_VXRM_RNE) {
        // RNE: add rounding bit only if result would be odd or lower bits nonzero
        // r = v[shift-1] & (v[shift-2:0] != 0 || result[0] == 1)
        if (shift >= 2) {
            Term lower = tm.mk_term(Kind::BV_EXTRACT, {val},
                                      {static_cast<uint64_t>(shift - 2), 0UL});
            Term lower_zero = tm.mk_term(Kind::EQUAL,
                {lower, tm.mk_bv_value_uint64(tm.mk_bv_sort(shift - 1), 0)});
            Term result_bit0 = tm.mk_term(Kind::BV_EXTRACT, {shifted}, {0UL, 0UL});
            Term result_odd = tm.mk_term(Kind::EQUAL,
                {result_bit0, tm.mk_bv_value_uint64(tm.mk_bv_sort(1), 1)});
            Term should_round = tm.mk_term(Kind::AND, {
                tm.mk_term(Kind::EQUAL, {round_bit, tm.mk_bv_value_uint64(tm.mk_bv_sort(1), 1)}),
                tm.mk_term(Kind::OR, {
                    tm.mk_term(Kind::NOT, {lower_zero}),
                    result_odd
                })
            });
            Term one = tm.mk_bv_value_uint64(sort, 1);
            Term zero = tm.mk_bv_value_uint64(sort, 0);
            Term adj = tm.mk_term(Kind::ITE, {should_round, one, zero});
            return tm.mk_term(Kind::BV_ADD, {shifted, adj});
        }
        // shift==1: RNE same as RNU
        return tm.mk_term(Kind::BV_ADD, {shifted, round_ext});
    }

    // ROD: if any truncated bits are nonzero, set bit 0 of result to 1
    if (vxrm == __RISCV_VXRM_ROD) {
        Term truncated = tm.mk_term(Kind::BV_EXTRACT, {val},
                                      {static_cast<uint64_t>(shift - 1), 0UL});
        Term trunc_zero = tm.mk_term(Kind::EQUAL,
            {truncated, tm.mk_bv_value_uint64(tm.mk_bv_sort(shift), 0)});
        Term one = tm.mk_bv_value_uint64(sort, 1);
        Term bit0_set = tm.mk_term(Kind::BV_OR, {shifted, one});
        return tm.mk_term(Kind::ITE, {trunc_zero, shifted, bit0_set});
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
                    tm.mk_term(Kind::ITE, {lt_min, t_min, wide_val})});

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
        result.push_back(tm.mk_term(Kind::BV_SUB, {a_ext, op2_ext}));
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
        Term prod = tm.mk_term(Kind::BV_MUL, {rs1_bv, vs2.getElement(i)});
        result.push_back(tm.mk_term(Kind::BV_ADD, {vd.getElement(i), prod}));
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
        Term sum = tm.mk_term(Kind::BV_ADD, {a_ext, b_ext});
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
        result.push_back(tm.mk_term(Kind::ITE, {cond, op1.getElement(i), op2_bv}));
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
        result.push_back(tm.mk_term(Kind::ITE, {cond, op1.getElement(i), op2_bv}));
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
inline vuint8m2_t __riscv_vssrl_vx_u8m2(const vuint8m2_t& op1, size_t shift,
                                          unsigned vxrm, size_t vl) {
    return rvv_vssrl_impl(op1, shift, vxrm, vl, 8);
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
        Term sum = tm.mk_term(Kind::BV_ADD, {a_ext, b_ext});
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
        Term sum = tm.mk_term(Kind::BV_ADD, {a_ext, op2_ext});
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
                    tm.mk_term(Kind::ITE, {lt_zero, t_zero, wide_val})});
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
        Term diff = tm.mk_term(Kind::BV_SUB, {a_ext, b_ext});
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

// vssra additional variants
inline vint32m4_t __riscv_vssra_vx_i32m4(const vint32m4_t& op1, size_t shift,
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
    g_ctx->solver->assert_formula(tm.mk_term(Kind::EQUAL, {fp_from_bv, fp_val}));
    return bv;
}

// Helper: apply binary FP op element-wise
inline RVVVector rvv_fp32_binop(const RVVVector& a, const RVVVector& b, Kind op, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result;
    result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term res_fp = tm.mk_term(op, {rm, a_fp, b_fp});
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
    char buf[32];
    snprintf(buf, sizeof(buf), "%.9e", static_cast<double>(b));
    Term b_fp = tm.mk_fp_value(fp32, rm, buf);

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
inline vfloat32m1_t __riscv_vfmax_vv_f32m1(const vfloat32m1_t& a, const vfloat32m1_t& b, size_t vl) {
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
    char buf[32];
    snprintf(buf, sizeof(buf), "%.9e", static_cast<double>(src));
    Term fp = tm.mk_fp_value(fp32, rm, buf);
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
RVV_BIN_VV(vadd_vv_i32m1, BV_ADD, 32)
RVV_BIN_VV(vadd_vv_i32m4, BV_ADD, 32)
RVV_BIN_VV(vadd_vv_u32m4, BV_ADD, 32)
// VADD vx
RVV_BIN_VX(vadd_vx_i16m2, BV_ADD, 16, int16_t)
RVV_BIN_VX(vadd_vx_i32m2, BV_ADD, 32, int32_t)
RVV_BIN_VX(vadd_vx_i32m4, BV_ADD, 32, int32_t)
RVV_BIN_VX(vadd_vx_i32m8, BV_ADD, 32, int32_t)
RVV_BIN_VX(vadd_vx_u32m1, BV_ADD, 32, uint32_t)
// VSUB vv
RVV_BIN_VV(vsub_vv_i16m2, BV_SUB, 16)
RVV_BIN_VV(vsub_vv_i32m4, BV_SUB, 32)
// VSUB vx
RVV_BIN_VX(vsub_vx_i8m1,   BV_SUB, 8,  int8_t)
RVV_BIN_VX(vsub_vx_i16m1,  BV_SUB, 16, int16_t)
RVV_BIN_VX(vsub_vx_i16m2,  BV_SUB, 16, int16_t)
RVV_BIN_VX(vsub_vx_i16m4,  BV_SUB, 16, int16_t)
RVV_BIN_VX(vsub_vx_i16mf2, BV_SUB, 16, int16_t)
RVV_BIN_VX(vsub_vx_i32m4,  BV_SUB, 32, int32_t)
// VMUL vv
RVV_BIN_VV(vmul_vv_i32m4, BV_MUL, 32)
RVV_BIN_VV(vmul_vv_i32m8, BV_MUL, 32)
// VAND
RVV_BIN_VV(vand_vv_i8m1,   BV_AND, 8)
RVV_BIN_VX(vand_vx_i8m1,   BV_AND, 8,  int8_t)
RVV_BIN_VX(vand_vx_i32m4,  BV_AND, 32, int32_t)
RVV_BIN_VX(vand_vx_u16m4,  BV_AND, 16, uint16_t)
RVV_BIN_VX(vand_vx_u16m8,  BV_AND, 16, uint16_t)
// VOR
RVV_BIN_VV(vor_vv_u8m1, BV_OR, 8)
// VXOR
RVV_BIN_VV(vxor_vv_i8m1, BV_XOR, 8)
// VRSUB (reverse subtract: op2 - a[i])
inline RVVVector __riscv_vrsub_vx_i16m2(const RVVVector& a, int16_t op2, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, op2);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SUB, {bv, a.getElement(i)}));
    return RVVVector(tm, 16, r);
}
// VSLL (shift left)
#define RVV_SLL_VX(name, bits, stype)                                         \
inline RVVVector __riscv_##name(const RVVVector& a, stype op2, size_t vl) {  \
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, bits, op2);               \
    std::vector<Term> r; r.reserve(vl);                                       \
    for (size_t i = 0; i < vl; i++)                                           \
        r.push_back(tm.mk_term(Kind::BV_SHL, {a.getElement(i), sh}));       \
    return RVVVector(tm, bits, r);                                            \
}
RVV_SLL_VX(vsll_vx_i8m1,  8,  size_t)
RVV_SLL_VX(vsll_vx_i16m1, 16, size_t)
RVV_SLL_VX(vsll_vx_i16m2, 16, size_t)
RVV_SLL_VX(vsll_vx_i16m4, 16, size_t)
RVV_SLL_VX(vsll_vx_i32m1, 32, size_t)
RVV_SLL_VX(vsll_vx_i32m4, 32, size_t)
RVV_SLL_VX(vsll_vx_u32m4, 32, size_t)
// VSRA (arithmetic shift right)
#define RVV_SRA_VX(name, bits)                                                \
inline RVVVector __riscv_##name(const RVVVector& a, size_t shift, size_t vl) { \
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, bits, shift);             \
    std::vector<Term> r; r.reserve(vl);                                       \
    for (size_t i = 0; i < vl; i++)                                           \
        r.push_back(tm.mk_term(Kind::BV_ASHR, {a.getElement(i), sh}));      \
    return RVVVector(tm, bits, r);                                            \
}
RVV_SRA_VX(vsra_vx_i32m4, 32)
RVV_SRA_VX(vsra_vx_i32m8, 32)
// VSRL (logical shift right)
inline RVVVector __riscv_vsrl_vx_u8m1(const RVVVector& a, size_t shift, size_t vl) {
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, 8, shift);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_SHR, {a.getElement(i), sh}));
    return RVVVector(tm, 8, r);
}

// ---------------------------------------------------------------------------
// Integer max/min (signed/unsigned, vv and vx)
// ---------------------------------------------------------------------------
#define RVV_MINMAX_VX(name, cmp_kind, bits, stype)                            \
inline RVVVector __riscv_##name(const RVVVector& a, stype op2, size_t vl) {  \
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, bits, op2);               \
    std::vector<Term> r; r.reserve(vl);                                       \
    for (size_t i = 0; i < vl; i++) {                                         \
        Term cond = tm.mk_term(Kind::cmp_kind, {a.getElement(i), bv});       \
        r.push_back(tm.mk_term(Kind::ITE, {cond, a.getElement(i), bv}));    \
    }                                                                          \
    return RVVVector(tm, bits, r);                                            \
}
#define RVV_MINMAX_VV(name, cmp_kind, bits)                                   \
inline RVVVector __riscv_##name(const RVVVector& a, const RVVVector& b, size_t vl) { \
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);               \
    for (size_t i = 0; i < vl; i++) {                                         \
        Term cond = tm.mk_term(Kind::cmp_kind, {a.getElement(i), b.getElement(i)}); \
        r.push_back(tm.mk_term(Kind::ITE, {cond, a.getElement(i), b.getElement(i)})); \
    }                                                                          \
    return RVVVector(tm, bits, r);                                            \
}
RVV_MINMAX_VX(vmax_vx_i32m1,  BV_SGE, 32, int32_t)
RVV_MINMAX_VX(vmax_vx_i32m4,  BV_SGE, 32, int32_t)
RVV_MINMAX_VX(vmin_vx_i32m1,  BV_SLE, 32, int32_t)
RVV_MINMAX_VX(vmin_vx_i32m4,  BV_SLE, 32, int32_t)
RVV_MINMAX_VX(vminu_vx_u32m1, BV_ULE, 32, uint32_t)
RVV_MINMAX_VX(vmaxu_vx_u32m1, BV_UGE, 32, uint32_t)
RVV_MINMAX_VV(vmax_vv_i32m4,  BV_SGE, 32)
RVV_MINMAX_VV(vmin_vv_i32m4,  BV_SLE, 32)

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
        r.push_back(tm.mk_term(Kind::BV_MUL, {ae, be}));
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
        r.push_back(tm.mk_term(Kind::BV_MUL, {ae, be}));
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
        Term prod = tm.mk_term(Kind::BV_MUL, {ae, be});
        r.push_back(tm.mk_term(Kind::BV_ADD, {acc.getElement(i), prod}));
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
        Term prod = tm.mk_term(Kind::BV_MUL, {rs1_ext, be});
        r.push_back(tm.mk_term(Kind::BV_ADD, {acc.getElement(i), prod}));
    }
    return RVVVector(tm, wide, r);
}
inline vint32m1_t __riscv_vwmacc_vv_i32m1(const vint32m1_t& acc, const vint16mf2_t& a, const vint16mf2_t& b, size_t vl) { return rvv_vwmacc_vv_impl(acc,a,b,vl,16); }
inline vint32m4_t __riscv_vwmacc_vv_i32m4(const vint32m4_t& acc, const vint16m2_t& a, const vint16m2_t& b, size_t vl) { return rvv_vwmacc_vv_impl(acc,a,b,vl,16); }
inline vint32m4_t __riscv_vwmacc_vx_i32m4(const vint32m4_t& acc, int16_t rs1, const vint16m2_t& b, size_t vl) { return rvv_vwmacc_vx_impl(acc,rs1,b,vl,16); }
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
        r.push_back(tm.mk_term(Kind::BV_ADD, {ae, be}));
    }
    return RVVVector(tm, wide, r);
}
inline vint16m2_t __riscv_vwadd_vx_i16m2(const vint8m1_t& a, int8_t b, size_t vl) { return rvv_vwadd_vx_impl(a,b,vl,8,true); }
inline vint32m4_t __riscv_vwadd_vx_i32m4(const vint16m2_t& a, int16_t b, size_t vl) { return rvv_vwadd_vx_impl(a,b,vl,16,true); }

// VWADD_WV: wide + narrow (result stays wide)
inline RVVVector rvv_vwadd_wv_impl(const RVVVector& a, const RVVVector& b, size_t vl, size_t narrow_bits, bool is_signed) {
    auto& tm = g_ctx->tm; size_t wide = narrow_bits * 2;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term be = is_signed ? tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {narrow_bits})
                            : tm.mk_term(Kind::BV_ZERO_EXTEND, {b.getElement(i)}, {narrow_bits});
        r.push_back(tm.mk_term(Kind::BV_ADD, {a.getElement(i), be}));
    }
    return RVVVector(tm, wide, r);
}
inline vint16m2_t __riscv_vwadd_wv_i16m2(const vint16m2_t& a, const vint8m1_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,8,true); }
inline vint32m4_t __riscv_vwadd_wv_i32m4(const vint32m4_t& a, const vint16m2_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,16,true); }
inline vuint16m2_t __riscv_vwaddu_wv_u16m2(const vuint16m2_t& a, const vuint8m1_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,8,false); }
inline vuint32m4_t __riscv_vwaddu_wv_u32m4(const vuint32m4_t& a, const vuint16m2_t& b, size_t vl) { return rvv_vwadd_wv_impl(a,b,vl,16,false); }

// VWSUB vv (already have vwsub_vx)
inline vint16m2_t __riscv_vwsub_vv_i16m2(const vint8m1_t& a, const vint8m1_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {b.getElement(i)}, {8});
        r.push_back(tm.mk_term(Kind::BV_SUB, {ae, be}));
    }
    return RVVVector(tm, 16, r);
}
inline vint16m2_t __riscv_vwsub_vx_i16m2(const vint8m1_t& a, int8_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 8, b);
    Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {bv}, {8});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {8});
        r.push_back(tm.mk_term(Kind::BV_SUB, {ae, be}));
    }
    return RVVVector(tm, 16, r);
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
inline vint8m1_t  __riscv_vncvt_x_x_w_i8m1(const vint16m2_t& a, size_t vl)  { return rvv_vncvt_impl(a, vl, 8); }

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

// ---------------------------------------------------------------------------
// VMACC additional variants
// ---------------------------------------------------------------------------
inline vint32m4_t __riscv_vmacc_vx_i32m4(const vint32m4_t& vd, int32_t rs1, const vint32m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rs = mk_bv_val(tm, 32, rs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::BV_ADD, {vd.getElement(i), tm.mk_term(Kind::BV_MUL, {rs, vs2.getElement(i)})}));
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// VMV broadcast (remaining LMUL)
// ---------------------------------------------------------------------------
inline vint32m1_t __riscv_vmv_v_x_i32m1(int32_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,v); return RVVVector(tm,32,std::vector<Term>(vl,val)); }
inline vint32m4_t __riscv_vmv_v_x_i32m4(int32_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,32,v); return RVVVector(tm,32,std::vector<Term>(vl,val)); }
inline vint16m1_t __riscv_vmv_v_x_i16m1(int16_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,v); return RVVVector(tm,16,std::vector<Term>(vl,val)); }
inline vint16m2_t __riscv_vmv_v_x_i16m2(int16_t v, size_t vl) { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,16,v); return RVVVector(tm,16,std::vector<Term>(vl,val)); }
inline vint8m1_t  __riscv_vmv_v_x_i8m1(int8_t v, size_t vl)   { auto& tm=g_ctx->tm; Term val=mk_bv_val(tm,8,v); return RVVVector(tm,8,std::vector<Term>(vl,val)); }

// VSADD additional variants
inline vint16m1_t __riscv_vsadd_vx_i16m1(const vint16m1_t& a, int16_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,16,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{16});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{16});r.push_back(signed_clip(tm,tm.mk_term(Kind::BV_ADD,{ae,be}),32,16));}
    return RVVVector(tm,16,r);
}
inline vint16m2_t __riscv_vsadd_vx_i16m2(const vint16m2_t& a, int16_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,16,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{16});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{16});r.push_back(signed_clip(tm,tm.mk_term(Kind::BV_ADD,{ae,be}),32,16));}
    return RVVVector(tm,16,r);
}
// VSSUB
inline vint32m1_t __riscv_vssub_vx_i32m1(const vint32m1_t& a, int32_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,32,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{32});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{32});r.push_back(signed_clip(tm,tm.mk_term(Kind::BV_SUB,{ae,be}),64,32));}
    return RVVVector(tm,32,r);
}
inline vint32m4_t __riscv_vssub_vx_i32m4(const vint32m4_t& a, int32_t b, size_t vl) {
    auto& tm=g_ctx->tm; Term bv=mk_bv_val(tm,32,b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i=0;i<vl;i++){Term ae=tm.mk_term(Kind::BV_SIGN_EXTEND,{a.getElement(i)},{32});Term be=tm.mk_term(Kind::BV_SIGN_EXTEND,{bv},{32});r.push_back(signed_clip(tm,tm.mk_term(Kind::BV_SUB,{ae,be}),64,32));}
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
        Term sel = tm.mk_term(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mk_term(Kind::ITE, {sel, bv, a.getElement(i)}));
    }
    return RVVVector(tm, bits, r);
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
            Term cmp = tm.mk_term(Kind::EQUAL, {idx.getElement(i), mk_bv_val(tm, idx_bits, j-1)});
            result = tm.mk_term(Kind::ITE, {cmp, src.getElement(j-1), result});
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
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, rm, buf);
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
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, rm, buf);
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
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, rm, buf);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MUL, {rm, a_fp, b_fp})));
    }
    return RVVVector(tm, 32, r);
}

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
inline vfloat32m1_t __riscv_vfmacc_vf_f32m1(const vfloat32m1_t& vd, float rs1, const vfloat32m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)rs1);
    Term rs1_fp = tm.mk_fp_value(fp32, rm, buf);
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
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)rs1);
    Term rs1_fp = tm.mk_fp_value(fp32, rm, buf);
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
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, g_ctx->fp.rounding_mode, buf);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MIN, {a_fp, b_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m1_t __riscv_vfmax_vf_f32m1(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, g_ctx->fp.rounding_mode, buf);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MAX, {a_fp, b_fp})));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmin_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, g_ctx->fp.rounding_mode, buf);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MIN, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp})));
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmax_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, g_ctx->fp.rounding_mode, buf);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(rvv_store_fp32_as_bv(tm, tm.mk_term(Kind::FP_MAX, {rvv_load_as_fp32(tm, a.getElement(i)), b_fp})));
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
inline vint32m2_t __riscv_vfcvt_x_f_v_i32m2(const vfloat32m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mk_term(Kind::FP_TO_SBV, {rm, rvv_load_as_fp32(tm, a.getElement(i))}, {32}));
    return RVVVector(tm, 32, r);
}

// FP broadcast additional
inline vfloat32m2_t __riscv_vfmv_v_f_f32m2(float src, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)src);
    Term bv = rvv_store_fp32_as_bv(tm, tm.mk_fp_value(fp32, rm, buf));
    return RVVVector(tm, 32, std::vector<Term>(vl, bv));
}
inline vfloat32m4_t __riscv_vfmv_v_f_f32m4(float src, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode; Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)src);
    Term bv = rvv_store_fp32_as_bv(tm, tm.mk_fp_value(fp32, rm, buf));
    return RVVVector(tm, 32, std::vector<Term>(vl, bv));
}

// FP compare (mask producing)
inline MaskVector __riscv_vmflt_vf_f32m1_b32(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, g_ctx->fp.rounding_mode, buf);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_LT, {a_fp, b_fp});
        bits.push_back(tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmfgt_vf_f32m1_b32(const vfloat32m1_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term b_fp = tm.mk_fp_value(fp32, g_ctx->fp.rounding_mode, buf);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mk_term(Kind::FP_GT, {a_fp, b_fp});
        bits.push_back(tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
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
        bits.push_back(tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}

// Integer compare (mask producing)
inline MaskVector __riscv_vmslt_vx_i16m2_b8(const vint16m2_t& a, int16_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), bv});
        bits.push_back(tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmslt_vx_i8m1_b8(const vint8m1_t& a, int8_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 8, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_SLT, {a.getElement(i), bv});
        bits.push_back(tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmsltu_vx_u32m4_b8(const vuint32m4_t& a, uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mk_term(Kind::BV_ULT, {a.getElement(i), bv});
        bits.push_back(tm.mk_term(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}

// VFMERGE
inline vfloat32m1_t __riscv_vfmerge_vfm_f32m1(const vfloat32m1_t& a, float b, const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm; Sort fp32 = tm.mk_fp_sort(8, 24);
    char buf[32]; snprintf(buf, sizeof(buf), "%.9e", (double)b);
    Term bv = rvv_store_fp32_as_bv(tm, tm.mk_fp_value(fp32, g_ctx->fp.rounding_mode, buf));
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mk_term(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mk_term(Kind::ITE, {sel, bv, a.getElement(i)}));
    }
    return RVVVector(tm, 32, r);
}

// VWREDSUM (widening reduction sum)
inline vint32m1_t __riscv_vwredsum_vs_i16m2_i32m1(const vint16m2_t& src, const vint32m1_t& init, size_t vl) {
    auto& tm = g_ctx->tm;
    Term acc = init.getElement(0);
    for (size_t i = 0; i < vl; i++) {
        Term ext = tm.mk_term(Kind::BV_SIGN_EXTEND, {src.getElement(i)}, {16});
        acc = tm.mk_term(Kind::BV_ADD, {acc, ext});
    }
    return RVVVector(tm, 32, std::vector<Term>{acc});
}

// VREDSUM (same-width reduction)
inline vint32m1_t __riscv_vredsum_vs_i32m4_i32m1(const vint32m4_t& src, const vint32m1_t& init, size_t vl) {
    auto& tm = g_ctx->tm;
    Term acc = init.getElement(0);
    for (size_t i = 0; i < vl; i++) acc = tm.mk_term(Kind::BV_ADD, {acc, src.getElement(i)});
    return RVVVector(tm, 32, std::vector<Term>{acc});
}

// VSMUL (fractional multiply with saturation)
inline vint16m2_t __riscv_vsmul_vx_i16m2(const vint16m2_t& a, int16_t b, unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mk_term(Kind::BV_SIGN_EXTEND, {a.getElement(i)}, {16});
        Term be = tm.mk_term(Kind::BV_SIGN_EXTEND, {bv}, {16});
        Term prod = tm.mk_term(Kind::BV_MUL, {ae, be});
        // Shift right by SEW-1 = 15 with rounding
        Term shifted = rounded_shift_right(tm, prod, 15, 32, vxrm, true);
        r.push_back(signed_clip(tm, shifted, 32, 16));
    }
    return RVVVector(tm, 16, r);
}

#undef RVV_BIN_VV
#undef RVV_BIN_VX
#undef RVV_SLL_VX
#undef RVV_SRA_VX
#undef RVV_MINMAX_VX
#undef RVV_MINMAX_VV

} // namespace salt
