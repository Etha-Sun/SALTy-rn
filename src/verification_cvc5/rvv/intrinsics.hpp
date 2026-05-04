#pragma once
// RVV intrinsics — cvc5 port, scoped to operations used by all kernels in
// kernels/target/.  Mirrors src/verification/rvv/intrinsics.hpp.

#include "../core/context.hpp"
#include "../core/symbolic_buffer.hpp"
#include "../core/symbolic_scalar.hpp"
#include "../core/symbolic_vector.hpp"

#include <cmath>
#include <cstring>
#include <cvc5/cvc5.h>

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <stdexcept>
#include <string>
#include <vector>

namespace salt_cvc5 {

// ===========================================================================
// Type aliases NOT defined in symbolic_vector.hpp (cvc5 tree currently only
// aliases the f16-conv-hwc2chw subset).  All these are RVVVector under the
// hood — adding `using X = RVVVector` here is harmless (and would also be
// harmless if `X` were already aliased elsewhere — same target).
// ===========================================================================
using vint8m1_t    = RVVVector;
using vint8m2_t    = RVVVector;
using vint8m4_t    = RVVVector;
using vint16m1_t   = RVVVector;
using vint16m2_t   = RVVVector;
using vint16m4_t   = RVVVector;
using vint16m8_t   = RVVVector;
using vint16mf2_t  = RVVVector;
using vint32m1_t   = RVVVector;
using vint32m4_t   = RVVVector;
using vint32m8_t   = RVVVector;
using vuint8m1_t   = RVVVector;
using vuint8m2_t   = RVVVector;
using vuint8m4_t   = RVVVector;
using vuint8mf2_t  = RVVVector;
using vuint16m2_t  = RVVVector;
using vuint16m4_t  = RVVVector;
using vuint32m1_t  = RVVVector;
using vuint32m4_t  = RVVVector;
using vuint32m8_t  = RVVVector;
using vfloat16m2_t = RVVVector;
using vfloat16m4_t = RVVVector;
using vfloat16m8_t = RVVVector;
using vfloat32m1_t = RVVVector;
using vfloat32m2_t = RVVVector;
using vfloat32m4_t = RVVVector;
using vfloat32m8_t = RVVVector;

using vbool4_t  = MaskVector;
using vbool8_t  = MaskVector;
using vbool32_t = MaskVector;

// ===========================================================================
// VSETVL — returns min(avl, vlmax) where vlmax = VLEN/SEW * LMUL
// ===========================================================================
inline size_t __riscv_vsetvl_e16m1(size_t avl) {
    return std::min(avl, g_ctx->vlen / 16 * 1);
}

// ===========================================================================
// VID — element index sequence
// ===========================================================================
inline RVVVector __riscv_vid_v_u32m2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 32, static_cast<int64_t>(i)));
    return RVVVector(tm, 32, r);
}

// ===========================================================================
// VMV broadcast — scalar to all lanes
// ===========================================================================
inline vuint16m1_t __riscv_vmv_v_x_u16m1(uint16_t v, size_t vl) {
    auto& tm = g_ctx->tm;
    Term val = mk_bv_val(tm, 16, static_cast<int64_t>(v));
    return RVVVector(tm, 16, std::vector<Term>(vl, val));
}

// ===========================================================================
// REINTERPRET (no-ops on element storage)
// ===========================================================================
inline RVVVector __riscv_vreinterpret_v_i32m2_u32m2(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_u32m2_i32m2(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_u16m1_f16m1(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_f16m1_u16m1(const RVVVector& a) { return a; }

// ===========================================================================
// VADD / VSUB / VMUL / VSLL — concrete-scalar broadcast helpers
// ===========================================================================
inline RVVVector __riscv_vadd_vx_u32m2(const RVVVector& a, uint32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, static_cast<int64_t>(b));
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_ADD, {a.getElement(i), bv}));
    return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadd_vx_i32m2(const RVVVector& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_ADD, {a.getElement(i), bv}));
    return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsub_vx_i32m2(const RVVVector& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SUB, {a.getElement(i), bv}));
    return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vmul_vx_i32m2(const RVVVector& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_MULT, {a.getElement(i), bv}));
    return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsll_vx_i32m2(const RVVVector& a, size_t shift, size_t vl) {
    auto& tm = g_ctx->tm;
    Term sh = mk_bv_val(tm, 32, static_cast<int64_t>(shift));
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SHL, {a.getElement(i), sh}));
    return RVVVector(tm, 32, r);
}

// ===========================================================================
// MIN/MAX vx (signed integer)
// ===========================================================================
inline RVVVector __riscv_vmax_vx_i32m2(const RVVVector& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = tm.mkTerm(Kind::BITVECTOR_SGE, {a.getElement(i), bv});
        r.push_back(tm.mkTerm(Kind::ITE, {cond, a.getElement(i), bv}));
    }
    return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vmin_vx_i32m2(const RVVVector& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = tm.mkTerm(Kind::BITVECTOR_SLE, {a.getElement(i), bv});
        r.push_back(tm.mkTerm(Kind::ITE, {cond, a.getElement(i), bv}));
    }
    return RVVVector(tm, 32, r);
}

// ===========================================================================
// MASK ops: vmslt / vmsge against scalar, vmand
// (b16 = 1-bit-per-element; ratio EEW/SEW=2 so naming mirrors RVV spec)
// ===========================================================================
inline MaskVector __riscv_vmslt_vx_i32m2_b16(const RVVVector& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mkTerm(Kind::BITVECTOR_SLT, {a.getElement(i), bv});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmsge_vx_i32m2_b16(const RVVVector& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mkTerm(Kind::BITVECTOR_SGE, {a.getElement(i), bv});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}
inline MaskVector __riscv_vmand_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(tm.mkTerm(Kind::BITVECTOR_AND, {a.getBit(i), b.getBit(i)}));
    }
    return MaskVector(tm, bits);
}

// ===========================================================================
// FP16 helpers (BV16 ↔ FP16) and binary FP ops
// ===========================================================================
inline Term rvv_load_as_fp16(TermManager& tm, Term bv) {
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    return tm.mkTerm(op, {bv});
}

inline size_t& rvv_fp16_bv_counter() {
    static size_t counter = 0;
    return counter;
}

inline Term rvv_store_fp16_as_bv(TermManager& tm, Term fp_val) {
    Sort bv16 = tm.mkBitVectorSort(16);
    Term bv = tm.mkConst(bv16, "_rvv_fp16_2bv_" + std::to_string(rvv_fp16_bv_counter()++));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
    Term fp_from_bv = tm.mkTerm(op, {bv});
    g_ctx->solver->assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, fp_val}));
    return bv;
}

inline RVVVector rvv_fp16_binop(const RVVVector& a, const RVVVector& b, Kind op, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    bool needs_rm = (op != Kind::FLOATINGPOINT_MAX && op != Kind::FLOATINGPOINT_MIN);
    std::vector<Term> result; result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp16(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp16(tm, b.getElement(i));
        Term res_fp = needs_rm ? tm.mkTerm(op, {rm, a_fp, b_fp})
                               : tm.mkTerm(op, {a_fp, b_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}

inline vfloat16m1_t __riscv_vfmin_vv_f16m1(const vfloat16m1_t& a, const vfloat16m1_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_MIN, vl);
}
inline vfloat16m1_t __riscv_vfmax_vv_f16m1(const vfloat16m1_t& a, const vfloat16m1_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_MAX, vl);
}

// vfmacc: vd = vd + vs1 * vs2 → FMA(vs1, vs2, vd)
inline vfloat16m1_t __riscv_vfmacc_vv_f16m1(const vfloat16m1_t& vd, const vfloat16m1_t& vs1,
                                              const vfloat16m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> result; result.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp  = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res_fp = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, vs1_fp, vs2_fp, vd_fp});
        result.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, result);
}

// ===========================================================================
// VLE16 / VSE16 — full vector load/store (FP16 vector)
// ===========================================================================
inline vfloat16m1_t __riscv_vle16_v_f16m1(const _Float16* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 16);
}
inline void __riscv_vse16_v_f16m1(_Float16* ptr, const vfloat16m1_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}
// xnn_float16 thin overloads — kernels that don't pre-cast (e.g. f16-vmulcaddc)
// pass xnn_float16* directly. Layout-compatible with _Float16 (asserted in salt.hpp).
inline vfloat16m1_t __riscv_vle16_v_f16m1(const xnn_float16* ptr, size_t vl) {
    return __riscv_vle16_v_f16m1(reinterpret_cast<const _Float16*>(ptr), vl);
}
inline void __riscv_vse16_v_f16m1(xnn_float16* ptr, const vfloat16m1_t& val, size_t vl) {
    __riscv_vse16_v_f16m1(reinterpret_cast<_Float16*>(ptr), val, vl);
}

// ===========================================================================
// vfloat16m1x3_t tuple type and segmented gather
// ===========================================================================
struct vfloat16m1x3_t {
    vfloat16m1_t val[3];
    vfloat16m1x3_t() = default;
    vfloat16m1x3_t(const vfloat16m1_t& v0, const vfloat16m1_t& v1, const vfloat16m1_t& v2)
        : val{v0, v1, v2} {}
};

inline vfloat16m1_t __riscv_vget_v_f16m1x3_f16m1(const vfloat16m1x3_t& src, size_t index) {
    return src.val[index];
}

// vluxei32 internal — gather elem_bits-wide values from `base + byte_off[i]`,
// returning an OOB-safe symbolic ITE chain over every valid offset (matches
// the bitwuzla tree's rvv_vluxei32_impl).
inline RVVVector rvv_vluxei32_impl(const void* base, const RVVVector& byte_offsets,
                                    size_t vl, size_t elem_bits) {
    auto& tm = g_ctx->tm;
    auto& buf = g_ctx->findBuffer(base);
    size_t base_off = buf.ptrToByteOffset(base);
    size_t elem_bytes = elem_bits / 8;

    if (base_off + elem_bytes > buf.numBytes()) {
        throw std::runtime_error(
            "vluxei32: base pointer leaves no room for a single element");
    }
    size_t max_valid_start = buf.numBytes() - base_off - elem_bytes;

    std::vector<Term> cached(max_valid_start + 1);
    for (size_t k = 0; k <= max_valid_start; k++) {
        cached[k] = buf.loadScalar(base_off + k, elem_bits);
    }

    static thread_local size_t oob_seq = 0;
    size_t call_id = oob_seq++;

    std::vector<Term> result; result.reserve(vl);
    Sort elem_sort = tm.mkBitVectorSort(static_cast<uint32_t>(elem_bits));

    for (size_t i = 0; i < vl; i++) {
        Term sym_off = byte_offsets.getElement(i);
        Term val = tm.mkConst(elem_sort,
            "vlux_oob_" + std::to_string(call_id) + "_" + std::to_string(i));
        for (size_t k = 0; k <= max_valid_start; k++) {
            val = tm.mkTerm(Kind::ITE,
                {tm.mkTerm(Kind::EQUAL,
                    {sym_off, mk_bv_val(tm, 32, static_cast<int64_t>(k))}),
                 cached[k], val});
        }
        result.push_back(val);
    }
    return RVVVector(tm, elem_bits, result);
}

// vluxseg3ei32: indexed unordered segmented load, nseg=3, EEW=32 indices.
// 3 channels are contiguous in memory, so shifting `base` by `seg` (in
// _Float16 units = 2 bytes) reuses the scalar gather.
inline vfloat16m1x3_t __riscv_vluxseg3ei32_v_f16m1x3(const _Float16* base,
                                                      const vuint32m2_t& byte_off,
                                                      size_t vl) {
    RVVVector s0 = rvv_vluxei32_impl(base + 0, byte_off, vl, 16);
    RVVVector s1 = rvv_vluxei32_impl(base + 1, byte_off, vl, 16);
    RVVVector s2 = rvv_vluxei32_impl(base + 2, byte_off, vl, 16);
    return vfloat16m1x3_t(s0, s1, s2);
}

// vmerge_vvm f16m1: mask=1 → b, mask=0 → a.
inline vfloat16m1_t __riscv_vmerge_vvm_f16m1(const vfloat16m1_t& a,
                                               const vfloat16m1_t& b,
                                               const vbool16_t& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mkTerm(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mkTerm(Kind::ITE, {sel, b.getElement(i), a.getElement(i)}));
    }
    return RVVVector(tm, 16, r);
}

// ===========================================================================
// PHASE 2 ADDITIONS — full kernels/target/ surface
// ===========================================================================

// ---------------------------------------------------------------------------
// FP32 helpers (BV32 ↔ FP32) — analogous to the FP16 helpers above
// ---------------------------------------------------------------------------
inline Term rvv_load_as_fp32(TermManager& tm, Term bv) {
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    return tm.mkTerm(op, {bv});
}

inline size_t& rvv_fp32_bv_counter() {
    static size_t counter = 0;
    return counter;
}

inline Term rvv_store_fp32_as_bv(TermManager& tm, Term fp_val) {
    Sort bv32 = tm.mkBitVectorSort(32);
    Term bv = tm.mkConst(bv32, "_rvv_fp32_2bv_" + std::to_string(rvv_fp32_bv_counter()++));
    Op op = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    Term fp_from_bv = tm.mkTerm(op, {bv});
    g_ctx->solver->assertFormula(tm.mkTerm(Kind::EQUAL, {fp_from_bv, fp_val}));
    return bv;
}

// mk_fp32_from_float_concrete is defined in neon/intrinsics.hpp; both files
// share salt_cvc5 namespace and salt.hpp includes neon before rvv.

// ---------------------------------------------------------------------------
// Saturation / rounding helpers (translated from bitwuzla tree ~lines 26-117).
// ---------------------------------------------------------------------------
constexpr unsigned __RISCV_VXRM_RNU = 0;
constexpr unsigned __RISCV_VXRM_RNE = 1;
constexpr unsigned __RISCV_VXRM_RDN = 2;
constexpr unsigned __RISCV_VXRM_ROD = 3;

inline Term rounded_shift_right(TermManager& tm, Term val, size_t shift,
                                 size_t bits, unsigned vxrm, bool is_signed) {
    if (shift == 0) return val;

    Term shift_amt = mk_bv_val(tm, bits, static_cast<int64_t>(shift));
    Term shifted = is_signed
        ? tm.mkTerm(Kind::BITVECTOR_ASHR, {val, shift_amt})
        : tm.mkTerm(Kind::BITVECTOR_LSHR, {val, shift_amt});

    if (vxrm == __RISCV_VXRM_RDN) return shifted;

    Op extract_round = tm.mkOp(Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(shift - 1), static_cast<uint32_t>(shift - 1)});
    Term round_bit = tm.mkTerm(extract_round, {val});
    Op zext_op = tm.mkOp(Kind::BITVECTOR_ZERO_EXTEND, {static_cast<uint32_t>(bits - 1)});
    Term round_ext = tm.mkTerm(zext_op, {round_bit});

    if (vxrm == __RISCV_VXRM_RNU) {
        return tm.mkTerm(Kind::BITVECTOR_ADD, {shifted, round_ext});
    }
    if (vxrm == __RISCV_VXRM_RNE) {
        // RNE: round up iff round_bit=1 AND (lower bits nonzero OR result odd).
        // For shift==1 there are no lower bits, so the OR collapses to result_odd.
        Op extract_bit0 = tm.mkOp(Kind::BITVECTOR_EXTRACT, {0u, 0u});
        Term result_bit0 = tm.mkTerm(extract_bit0, {shifted});
        Term result_odd = tm.mkTerm(Kind::EQUAL,
            {result_bit0, mk_bv_val(tm, 1, 1)});
        Term tie_breaker;
        if (shift >= 2) {
            Op extract_lower = tm.mkOp(Kind::BITVECTOR_EXTRACT,
                {static_cast<uint32_t>(shift - 2), 0u});
            Term lower = tm.mkTerm(extract_lower, {val});
            Term lower_zero = tm.mkTerm(Kind::EQUAL,
                {lower, mk_bv_val(tm, shift - 1, 0)});
            tie_breaker = tm.mkTerm(Kind::OR,
                {tm.mkTerm(Kind::NOT, {lower_zero}), result_odd});
        } else {
            tie_breaker = result_odd;
        }
        Term should_round = tm.mkTerm(Kind::AND, {
            tm.mkTerm(Kind::EQUAL, {round_bit, mk_bv_val(tm, 1, 1)}),
            tie_breaker
        });
        Term one = mk_bv_val(tm, bits, 1);
        Term zero = mk_bv_val(tm, bits, 0);
        Term adj = tm.mkTerm(Kind::ITE, {should_round, one, zero});
        return tm.mkTerm(Kind::BITVECTOR_ADD, {shifted, adj});
    }
    if (vxrm == __RISCV_VXRM_ROD) {
        Op extract_trunc = tm.mkOp(Kind::BITVECTOR_EXTRACT,
            {static_cast<uint32_t>(shift - 1), 0u});
        Term truncated = tm.mkTerm(extract_trunc, {val});
        Term trunc_zero = tm.mkTerm(Kind::EQUAL,
            {truncated, mk_bv_val(tm, shift, 0)});
        Term one = mk_bv_val(tm, bits, 1);
        Term bit0_set = tm.mkTerm(Kind::BITVECTOR_OR, {shifted, one});
        return tm.mkTerm(Kind::ITE, {trunc_zero, shifted, bit0_set});
    }
    return shifted;
}

inline Term signed_clip(TermManager& tm, Term wide_val, size_t wide_bits, size_t narrow_bits) {
    int64_t max_val = (1LL << (narrow_bits - 1)) - 1;
    int64_t min_val = -(1LL << (narrow_bits - 1));
    Term t_max = mk_bv_val(tm, wide_bits, max_val);
    Term t_min = mk_bv_val(tm, wide_bits, min_val);
    Term gt_max = tm.mkTerm(Kind::BITVECTOR_SGT, {wide_val, t_max});
    Term lt_min = tm.mkTerm(Kind::BITVECTOR_SLT, {wide_val, t_min});
    Term clamped = tm.mkTerm(Kind::ITE, {gt_max, t_max,
        tm.mkTerm(Kind::ITE, {lt_min, t_min, wide_val})});
    Op extract_op = tm.mkOp(Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(narrow_bits - 1), 0u});
    return tm.mkTerm(extract_op, {clamped});
}

inline Term unsigned_clip(TermManager& tm, Term wide_val, size_t wide_bits, size_t narrow_bits) {
    uint64_t max_val = (narrow_bits >= 64) ? ~0ULL : ((1ULL << narrow_bits) - 1);
    Term t_max = mk_bv_val(tm, wide_bits, static_cast<int64_t>(max_val));
    Term t_zero = mk_bv_val(tm, wide_bits, 0);
    Term gt_max = tm.mkTerm(Kind::BITVECTOR_UGT, {wide_val, t_max});
    Term lt_zero = tm.mkTerm(Kind::BITVECTOR_SLT, {wide_val, t_zero});
    Term clamped = tm.mkTerm(Kind::ITE, {gt_max, t_max,
        tm.mkTerm(Kind::ITE, {lt_zero, t_zero, wide_val})});
    Op extract_op = tm.mkOp(Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(narrow_bits - 1), 0u});
    return tm.mkTerm(extract_op, {clamped});
}

// ---------------------------------------------------------------------------
// VSETVL — additional LMUL variants
// ---------------------------------------------------------------------------
inline size_t __riscv_vsetvl_e8m2(size_t avl)  { return std::min(avl, g_ctx->vlen / 8 * 2); }
inline size_t __riscv_vsetvl_e32m4(size_t avl) { return std::min(avl, g_ctx->vlen / 32 * 4); }
inline size_t __riscv_vsetvl_e32m8(size_t avl) { return std::min(avl, g_ctx->vlen / 32 * 8); }

// ---------------------------------------------------------------------------
// Loads / stores — additional widths/LMUL
// ---------------------------------------------------------------------------
inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t* p, size_t vl) {
    auto& b = g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p), vl, 8);
}
inline vfloat32m4_t __riscv_vle32_v_f32m4(const float* p, size_t vl) {
    auto& b = g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p), vl, 32);
}
inline vfloat32m8_t __riscv_vle32_v_f32m8(const float* p, size_t vl) {
    auto& b = g_ctx->findBuffer(p); return b.loadRVV(b.ptrToByteOffset(p), vl, 32);
}
inline void __riscv_vse8_v_i8m2(int8_t* p, const vint8m2_t& v, size_t vl) {
    auto& b = g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p), v);
}
inline void __riscv_vse32_v_f32m4(float* p, const vfloat32m4_t& v, size_t vl) {
    auto& b = g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p), v);
}
inline void __riscv_vse32_v_f32m8(float* p, const vfloat32m8_t& v, size_t vl) {
    auto& b = g_ctx->findBuffer(p); b.storeRVV(b.ptrToByteOffset(p), v);
}

// ---------------------------------------------------------------------------
// Reinterpret no-ops (additional variants used by target/ kernels)
// ---------------------------------------------------------------------------
inline RVVVector __riscv_vreinterpret_v_f32m8_i32m8(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_i32m8_f32m8(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_i32m8_u32m8(const RVVVector& a) { return a; }

// ---------------------------------------------------------------------------
// Integer arithmetic — concrete scalar variants (additional widths/LMUL)
// ---------------------------------------------------------------------------
inline vint32m8_t __riscv_vadd_vv_i32m8(const vint32m8_t& a, const vint32m8_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_ADD, {a.getElement(i), b.getElement(i)}));
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vwmul_vv_i32m8(const vint16m4_t& a, const vint16m4_t& b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mkTerm(sext, {a.getElement(i)});
        Term be = tm.mkTerm(sext, {b.getElement(i)});
        r.push_back(tm.mkTerm(Kind::BITVECTOR_MULT, {ae, be}));
    }
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// VSEXT / VWSUB — sign-extension and widening subtract
// ---------------------------------------------------------------------------
inline vint16m4_t __riscv_vsext_vf2_i16m4(const vint8m2_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mkTerm(sext, {a.getElement(i)}));
    return RVVVector(tm, 16, r);
}
inline vint32m8_t __riscv_vsext_vf2_i32m8(const vint16m4_t& a, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    for (size_t i = 0; i < vl; i++) r.push_back(tm.mkTerm(sext, {a.getElement(i)}));
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// VNCLIP — narrowing clip with rounding (signed)
// ---------------------------------------------------------------------------
inline vint16m4_t __riscv_vnclip_wx_i16m4(const vint32m8_t& op1, size_t shift,
                                            unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 32, vxrm, true);
        r.push_back(signed_clip(tm, shifted, 32, 16));
    }
    return RVVVector(tm, 16, r);
}
inline vint8m2_t __riscv_vnclip_wx_i8m2(const vint16m4_t& op1, size_t shift,
                                          unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term shifted = rounded_shift_right(tm, op1.getElement(i), shift, 16, vxrm, true);
        r.push_back(signed_clip(tm, shifted, 16, 8));
    }
    return RVVVector(tm, 8, r);
}

// ---------------------------------------------------------------------------
// VSSRA — scaling shift-right arithmetic (signed; concrete-shift variant)
// ---------------------------------------------------------------------------
inline vint32m8_t __riscv_vssra_vx_i32m8(const vint32m8_t& op1, size_t shift,
                                           unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(rounded_shift_right(tm, op1.getElement(i), shift, 32, vxrm, true));
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// VMV broadcast — concrete-scalar (additional types/LMUL)
// (Symbolic-scalar overloads with the same names live below.)
// ---------------------------------------------------------------------------
inline vint32m8_t __riscv_vmv_v_x_i32m8(int32_t v, size_t vl) {
    auto& tm = g_ctx->tm; Term val = mk_bv_val(tm, 32, v);
    return RVVVector(tm, 32, std::vector<Term>(vl, val));
}
inline vint16m4_t __riscv_vmv_v_x_i16m4(int16_t v, size_t vl) {
    auto& tm = g_ctx->tm; Term val = mk_bv_val(tm, 16, v);
    return RVVVector(tm, 16, std::vector<Term>(vl, val));
}

// ---------------------------------------------------------------------------
// VMACC — concrete-scalar multiply-accumulate
// ---------------------------------------------------------------------------
inline vint32m8_t __riscv_vmacc_vx_i32m8(const vint32m8_t& vd, int32_t rs1,
                                          const vint32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rs1_bv = mk_bv_val(tm, 32, rs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term prod = tm.mkTerm(Kind::BITVECTOR_MULT, {rs1_bv, vs2.getElement(i)});
        r.push_back(tm.mkTerm(Kind::BITVECTOR_ADD, {vd.getElement(i), prod}));
    }
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// VSADD / VRSUB / VSUB — saturating, reverse-subtract, plain (concrete forms)
// (Symbolic-scalar overloads with the same names live below.)
// ---------------------------------------------------------------------------
inline vint16m4_t __riscv_vsadd_vx_i16m4(const vint16m4_t& a, int16_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, b);
    std::vector<Term> r; r.reserve(vl);
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mkTerm(sext, {a.getElement(i)});
        Term be = tm.mkTerm(sext, {bv});
        Term sum = tm.mkTerm(Kind::BITVECTOR_ADD, {ae, be});
        r.push_back(signed_clip(tm, sum, 32, 16));
    }
    return RVVVector(tm, 16, r);
}
inline vint16m4_t __riscv_vrsub_vx_i16m4(const vint16m4_t& a, int16_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SUB, {bv, a.getElement(i)}));
    return RVVVector(tm, 16, r);
}
inline vint16m4_t __riscv_vsub_vx_i16m4(const vint16m4_t& a, int16_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SUB, {a.getElement(i), bv}));
    return RVVVector(tm, 16, r);
}
inline vint16m4_t __riscv_vwsub_vx_i16m4(const vint8m2_t& a, int8_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 8, b);
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    Term be = tm.mkTerm(sext, {bv});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mkTerm(sext, {a.getElement(i)});
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SUB, {ae, be}));
    }
    return RVVVector(tm, 16, r);
}

// ---------------------------------------------------------------------------
// VAND / VSLL / VMUL / VSUB / VADD — additional concrete-scalar variants
// (Symbolic overloads with the same names live below.)
// ---------------------------------------------------------------------------
inline vint32m8_t __riscv_vmul_vx_i32m8(const vint32m8_t& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_MULT, {a.getElement(i), bv}));
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vand_vx_i32m8(const vint32m8_t& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_AND, {a.getElement(i), bv}));
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vadd_vx_i32m8(const vint32m8_t& a, int32_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 32, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_ADD, {a.getElement(i), bv}));
    return RVVVector(tm, 32, r);
}
// Shift helpers (concrete shift amounts) — vsll_vx_i16m4 is overloaded by
// SymbolicScalar variant below.
inline vint16m4_t __riscv_vsll_vx_i16m4(const vint16m4_t& a, size_t shift, size_t vl) {
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, 16, static_cast<int64_t>(shift));
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SHL, {a.getElement(i), sh}));
    return RVVVector(tm, 16, r);
}
inline vint32m8_t __riscv_vsll_vx_i32m8(const vint32m8_t& a, size_t shift, size_t vl) {
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, 32, static_cast<int64_t>(shift));
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SHL, {a.getElement(i), sh}));
    return RVVVector(tm, 32, r);
}
inline vuint32m8_t __riscv_vsll_vx_u32m8(const vuint32m8_t& a, size_t shift, size_t vl) {
    auto& tm = g_ctx->tm; Term sh = mk_bv_val(tm, 32, static_cast<int64_t>(shift));
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SHL, {a.getElement(i), sh}));
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// MAX/MIN signed (additional widths) — concrete-scalar forms
// (Symbolic overloads live below.)
// ---------------------------------------------------------------------------
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t& a, int8_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 8, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = tm.mkTerm(Kind::BITVECTOR_SGE, {a.getElement(i), bv});
        r.push_back(tm.mkTerm(Kind::ITE, {cond, a.getElement(i), bv}));
    }
    return RVVVector(tm, 8, r);
}
inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t& a, int8_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 8, b);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cond = tm.mkTerm(Kind::BITVECTOR_SLE, {a.getElement(i), bv});
        r.push_back(tm.mkTerm(Kind::ITE, {cond, a.getElement(i), bv}));
    }
    return RVVVector(tm, 8, r);
}

// ---------------------------------------------------------------------------
// vmerge_vxm — merge concrete-scalar with mask
// ---------------------------------------------------------------------------
inline RVVVector rvv_vmerge_vxm_impl(const RVVVector& a, int64_t b,
                                      const MaskVector& mask, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, bits, b);
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mkTerm(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mkTerm(Kind::ITE, {sel, bv, a.getElement(i)}));
    }
    return RVVVector(tm, bits, r);
}
inline vint16m4_t __riscv_vmerge_vxm_i16m4(const vint16m4_t& a, int16_t b,
                                             const MaskVector& mask, size_t vl) {
    return rvv_vmerge_vxm_impl(a, b, mask, vl, 16);
}

// vmerge_vvm f32m8: mask=1 → b, mask=0 → a
inline vfloat32m8_t __riscv_vmerge_vvm_f32m8(const vfloat32m8_t& a,
                                               const vfloat32m8_t& b,
                                               const vbool4_t& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mkTerm(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mkTerm(Kind::ITE, {sel, b.getElement(i), a.getElement(i)}));
    }
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// VLUXEI — indexed (gather) load — additional EEW=32 / SEW=32 variant
// ---------------------------------------------------------------------------
inline vint32m8_t __riscv_vluxei32_v_i32m8(const int32_t* base,
                                             const vuint32m8_t& off, size_t vl) {
    return rvv_vluxei32_impl(base, off, vl, 32);
}

// ---------------------------------------------------------------------------
// FP32 vector arithmetic (vv, vf)
// ---------------------------------------------------------------------------
inline RVVVector rvv_fp32_binop(const RVVVector& a, const RVVVector& b, Kind op, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    bool needs_rm = (op != Kind::FLOATINGPOINT_MAX && op != Kind::FLOATINGPOINT_MIN);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term b_fp = rvv_load_as_fp32(tm, b.getElement(i));
        Term res_fp = needs_rm ? tm.mkTerm(op, {rm, a_fp, b_fp})
                               : tm.mkTerm(op, {a_fp, b_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 32, r);
}
inline RVVVector rvv_fp32_binop_vf(const RVVVector& a, Term b_fp, Kind op, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    bool needs_rm = (op != Kind::FLOATINGPOINT_MAX && op != Kind::FLOATINGPOINT_MIN);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res_fp = needs_rm ? tm.mkTerm(op, {rm, a_fp, b_fp})
                               : tm.mkTerm(op, {a_fp, b_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 32, r);
}

inline vfloat32m4_t __riscv_vfadd_vv_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FLOATINGPOINT_ADD,vl); }
inline vfloat32m8_t __riscv_vfadd_vv_f32m8(const vfloat32m8_t& a, const vfloat32m8_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FLOATINGPOINT_ADD,vl); }
inline vfloat32m4_t __riscv_vfmul_vv_f32m4(const vfloat32m4_t& a, const vfloat32m4_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FLOATINGPOINT_MULT,vl); }
inline vfloat32m8_t __riscv_vfmul_vv_f32m8(const vfloat32m8_t& a, const vfloat32m8_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FLOATINGPOINT_MULT,vl); }
inline vfloat32m8_t __riscv_vfdiv_vv_f32m8(const vfloat32m8_t& a, const vfloat32m8_t& b, size_t vl) { return rvv_fp32_binop(a,b,Kind::FLOATINGPOINT_DIV,vl); }

// concrete-float vf forms (used by harnesses passing literal floats).
// __riscv_vfadd_vf_f32m8 / __riscv_vfsub_vf_f32m8 / __riscv_vfmul_vf_f32m8
// also have SymbolicScalar<float> overloads below for symbolic params.
inline vfloat32m8_t __riscv_vfadd_vf_f32m8(const vfloat32m8_t& a, float b, size_t vl) {
    return rvv_fp32_binop_vf(a, mk_fp32_from_float_concrete(g_ctx->tm, b), Kind::FLOATINGPOINT_ADD, vl);
}
inline vfloat32m8_t __riscv_vfsub_vf_f32m8(const vfloat32m8_t& a, float b, size_t vl) {
    return rvv_fp32_binop_vf(a, mk_fp32_from_float_concrete(g_ctx->tm, b), Kind::FLOATINGPOINT_SUB, vl);
}
inline vfloat32m8_t __riscv_vfmul_vf_f32m8(const vfloat32m8_t& a, float b, size_t vl) {
    return rvv_fp32_binop_vf(a, mk_fp32_from_float_concrete(g_ctx->tm, b), Kind::FLOATINGPOINT_MULT, vl);
}
inline vfloat32m4_t __riscv_vfmin_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) {
    return rvv_fp32_binop_vf(a, mk_fp32_from_float_concrete(g_ctx->tm, b), Kind::FLOATINGPOINT_MIN, vl);
}
inline vfloat32m4_t __riscv_vfmax_vf_f32m4(const vfloat32m4_t& a, float b, size_t vl) {
    return rvv_fp32_binop_vf(a, mk_fp32_from_float_concrete(g_ctx->tm, b), Kind::FLOATINGPOINT_MAX, vl);
}
inline vfloat32m8_t __riscv_vfmin_vf_f32m8(const vfloat32m8_t& a, float b, size_t vl) {
    return rvv_fp32_binop_vf(a, mk_fp32_from_float_concrete(g_ctx->tm, b), Kind::FLOATINGPOINT_MIN, vl);
}
inline vfloat32m8_t __riscv_vfmax_vf_f32m8(const vfloat32m8_t& a, float b, size_t vl) {
    return rvv_fp32_binop_vf(a, mk_fp32_from_float_concrete(g_ctx->tm, b), Kind::FLOATINGPOINT_MAX, vl);
}

// FP16 scalar min/max (vf forms used by f16-vmulcaddc)
inline RVVVector rvv_fp16_binop_vf_term(const RVVVector& a, Term b_fp, Kind op, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    bool needs_rm = (op != Kind::FLOATINGPOINT_MAX && op != Kind::FLOATINGPOINT_MIN);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp16(tm, a.getElement(i));
        Term res_fp = needs_rm ? tm.mkTerm(op, {rm, a_fp, b_fp})
                               : tm.mkTerm(op, {a_fp, b_fp});
        r.push_back(rvv_store_fp16_as_bv(tm, res_fp));
    }
    return RVVVector(tm, 16, r);
}
inline vfloat16m1_t __riscv_vfmin_vf_f16m1(const vfloat16m1_t& a, _Float16 b, size_t vl) {
    auto& tm = g_ctx->tm;
    return rvv_fp16_binop_vf_term(a, mk_fp16_from_f16(tm, b), Kind::FLOATINGPOINT_MIN, vl);
}
inline vfloat16m1_t __riscv_vfmax_vf_f16m1(const vfloat16m1_t& a, _Float16 b, size_t vl) {
    auto& tm = g_ctx->tm;
    return rvv_fp16_binop_vf_term(a, mk_fp16_from_f16(tm, b), Kind::FLOATINGPOINT_MAX, vl);
}

// ---------------------------------------------------------------------------
// FP FMA: vfmacc (vd = vd + vs1 * vs2), vfmadd (vd = vd * vs1 + vs2)
// ---------------------------------------------------------------------------
inline vfloat32m8_t __riscv_vfmacc_vv_f32m8(const vfloat32m8_t& vd,
                                              const vfloat32m8_t& vs1,
                                              const vfloat32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, v1, v2, vd_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, res));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m8_t __riscv_vfmacc_vf_f32m8(const vfloat32m8_t& vd, float rs1,
                                              const vfloat32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Term rs1_fp = mk_fp32_from_float_concrete(tm, rs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, rs1_fp, v2, vd_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, res));
    }
    return RVVVector(tm, 32, r);
}
inline vfloat32m4_t __riscv_vfmadd_vv_f32m4(const vfloat32m4_t& vd,
                                              const vfloat32m4_t& vs1,
                                              const vfloat32m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp32(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, vd_fp, v1, v2});
        r.push_back(rvv_store_fp32_as_bv(tm, res));
    }
    return RVVVector(tm, 32, r);
}

// FP16 vfmadd (vd = vd * vs1 + vs2) — used by f16-vmulcaddc
inline vfloat16m1_t __riscv_vfmadd_vv_f16m1(const vfloat16m1_t& vd,
                                              const vfloat16m1_t& vs1,
                                              const vfloat16m1_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp16(tm, vd.getElement(i));
        Term v1 = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term v2 = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, vd_fp, v1, v2});
        r.push_back(rvv_store_fp16_as_bv(tm, res));
    }
    return RVVVector(tm, 16, r);
}

// ---------------------------------------------------------------------------
// FP broadcast scalar → vector (concrete-float; symbolic overload below)
// ---------------------------------------------------------------------------
inline vfloat32m8_t __riscv_vfmv_v_f_f32m8(float src, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = rvv_store_fp32_as_bv(tm, mk_fp32_from_float_concrete(tm, src));
    return RVVVector(tm, 32, std::vector<Term>(vl, bv));
}

// ---------------------------------------------------------------------------
// FP conversions: int32 → float32 and vice versa
// ---------------------------------------------------------------------------
inline vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(const vint32m8_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Op cvt = tm.mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {8, 24});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(rvv_store_fp32_as_bv(tm, tm.mkTerm(cvt, {rm, a.getElement(i)})));
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vfcvt_x_f_v_i32m8(const vfloat32m8_t& a, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Op cvt = tm.mkOp(Kind::FLOATINGPOINT_TO_SBV, {32});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(cvt, {rm, rvv_load_as_fp32(tm, a.getElement(i))}));
    return RVVVector(tm, 32, r);
}

// ---------------------------------------------------------------------------
// FP compare (mask producing) — concrete-scalar form (symbolic overload below)
// ---------------------------------------------------------------------------
inline MaskVector __riscv_vmflt_vf_f32m8_b4(const vfloat32m8_t& a, float b, size_t vl) {
    auto& tm = g_ctx->tm; Term b_fp = mk_fp32_from_float_concrete(tm, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_LT, {a_fp, b_fp});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}

// ---------------------------------------------------------------------------
// Integer compare (vmslt against int16, b4 mask) — concrete form (symbolic below)
// ---------------------------------------------------------------------------
inline MaskVector __riscv_vmslt_vx_i16m4_b4(const vint16m4_t& a, int16_t b, size_t vl) {
    auto& tm = g_ctx->tm; Term bv = mk_bv_val(tm, 16, b);
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mkTerm(Kind::BITVECTOR_SLT, {a.getElement(i), bv});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}

// ===========================================================================
// SymbolicScalar overloads — for kernels that have symbolic scalar parameters
// (qs8-vaddc, f32-velu, f32-vapproxgelu, etc.).  These mirror the bitwuzla
// tree's symbolic-scalar overloads ~lines 2697-3260.
// ===========================================================================

// --- helpers for symbolic shift over integer types ---
inline Term rounded_shift_right_symbolic(TermManager& tm, Term val, Term shift_term,
                                          size_t bits, unsigned vxrm, bool is_signed) {
    Term result = val;
    for (size_t s = 31; s >= 1; s--) {
        Term concrete_shifted = rounded_shift_right(tm, val, s, bits, vxrm, is_signed);
        Term eq = tm.mkTerm(Kind::EQUAL,
            {shift_term, mk_bv_val(tm, bits, static_cast<int64_t>(s))});
        result = tm.mkTerm(Kind::ITE, {eq, concrete_shifted, result});
    }
    return result;
}

// --- generic BV vx helper ---
inline RVVVector rvv_sym_bv_binop_vx(const RVVVector& a, Term b, Kind op, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(op, {a.getElement(i), b}));
    return RVVVector(tm, bits, r);
}
inline RVVVector rvv_sym_bv_rsub_vx(const RVVVector& a, Term b, size_t vl, size_t bits) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SUB, {b, a.getElement(i)}));
    return RVVVector(tm, bits, r);
}

// --- vadd_vx / vsub_vx / vmul_vx / vand_vx (symbolic) ---
inline vint32m8_t __riscv_vadd_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BITVECTOR_ADD, vl, 32); }
inline vint32m8_t __riscv_vsub_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BITVECTOR_SUB, vl, 32); }
inline vint32m8_t __riscv_vmul_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BITVECTOR_MULT, vl, 32); }
inline vint32m8_t __riscv_vand_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) { return rvv_sym_bv_binop_vx(a, b.term(), Kind::BITVECTOR_AND, vl, 32); }

// --- vrsub_vx (symbolic) ---
inline vint16m4_t __riscv_vrsub_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) { return rvv_sym_bv_rsub_vx(a, b.term(), vl, 16); }

// --- vsadd_vx (symbolic) ---
inline vint16m4_t __riscv_vsadd_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    Term be = tm.mkTerm(sext, {b.term()});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mkTerm(sext, {a.getElement(i)});
        Term sum = tm.mkTerm(Kind::BITVECTOR_ADD, {ae, be});
        r.push_back(signed_clip(tm, sum, 32, 16));
    }
    return RVVVector(tm, 16, r);
}

// --- vmv_v_x (symbolic) ---
inline vint32m8_t __riscv_vmv_v_x_i32m8(SymbolicScalar<int32_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 32, std::vector<Term>(vl, v.term()));
}
inline vint16m4_t __riscv_vmv_v_x_i16m4(SymbolicScalar<int16_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 16, std::vector<Term>(vl, v.term()));
}
inline vuint16m1_t __riscv_vmv_v_x_u16m1(SymbolicScalar<uint16_t> v, size_t vl) {
    return RVVVector(g_ctx->tm, 16, std::vector<Term>(vl, v.term()));
}

// --- vmacc_vx (symbolic) ---
inline vint32m8_t __riscv_vmacc_vx_i32m8(const vint32m8_t& vd, SymbolicScalar<int32_t> rs1,
                                           const vint32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term prod = tm.mkTerm(Kind::BITVECTOR_MULT, {rs1.term(), vs2.getElement(i)});
        r.push_back(tm.mkTerm(Kind::BITVECTOR_ADD, {vd.getElement(i), prod}));
    }
    return RVVVector(tm, 32, r);
}

// --- vssra_vx (symbolic shift via ITE cascade) ---
// Truncate/zero-extend any-width shift Term to a 32-bit BV (matches bitwuzla's _shift_to_32).
inline Term _shift_to_32(TermManager& tm, Term t, size_t src_bits) {
    if (src_bits > 32)
        return tm.mkTerm(tm.mkOp(Kind::BITVECTOR_EXTRACT, {31, 0}), {t});
    if (src_bits < 32)
        return tm.mkTerm(tm.mkOp(Kind::BITVECTOR_ZERO_EXTEND, {(uint32_t)(32 - src_bits)}), {t});
    return t;
}
inline vint32m8_t __riscv_vssra_vx_i32m8(const vint32m8_t& op1,
                                           SymbolicScalar<int32_t> shift,
                                           unsigned vxrm, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++)
        r.push_back(rounded_shift_right_symbolic(tm, op1.getElement(i), shift.term(), 32, vxrm, true));
    return RVVVector(tm, 32, r);
}
// size_t (uint64) overloads — truncate shift to 32 bits, delegate.
inline vint32m8_t __riscv_vssra_vx_i32m8(const vint32m8_t& op1,
                                           SymbolicScalar<size_t> shift,
                                           unsigned vxrm, size_t vl) {
    Term s32 = _shift_to_32(g_ctx->tm, shift.term(), 64);
    return __riscv_vssra_vx_i32m8(op1, SymbolicScalar<int32_t>(s32), vxrm, vl);
}

// --- vmax_vx / vmin_vx (symbolic int32) ---
inline vint32m8_t __riscv_vmax_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term c = tm.mkTerm(Kind::BITVECTOR_SGE, {a.getElement(i), b.term()});
        r.push_back(tm.mkTerm(Kind::ITE, {c, a.getElement(i), b.term()}));
    }
    return RVVVector(tm, 32, r);
}
inline vint32m8_t __riscv_vmin_vx_i32m8(const vint32m8_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term c = tm.mkTerm(Kind::BITVECTOR_SLE, {a.getElement(i), b.term()});
        r.push_back(tm.mkTerm(Kind::ITE, {c, a.getElement(i), b.term()}));
    }
    return RVVVector(tm, 32, r);
}

// --- vmax_vx / vmin_vx (symbolic int8) ---
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int8_t> b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term c = tm.mkTerm(Kind::BITVECTOR_SGE, {a.getElement(i), b.term()});
        r.push_back(tm.mkTerm(Kind::ITE, {c, a.getElement(i), b.term()}));
    }
    return RVVVector(tm, 8, r);
}
inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int8_t> b, size_t vl) {
    auto& tm = g_ctx->tm; std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term c = tm.mkTerm(Kind::BITVECTOR_SLE, {a.getElement(i), b.term()});
        r.push_back(tm.mkTerm(Kind::ITE, {c, a.getElement(i), b.term()}));
    }
    return RVVVector(tm, 8, r);
}

// --- vsll_vx (symbolic) ---
inline vint16m4_t __riscv_vsll_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    return rvv_sym_bv_binop_vx(a, b.term(), Kind::BITVECTOR_SHL, vl, 16);
}
// Note: __riscv_vsll_vx_i32m2 with size_t shift already exists at the top of
// this file; SymbolicScalar overload available via the template below if needed.

// --- vwsub_vx (symbolic, int8 → int16) ---
inline vint16m4_t __riscv_vwsub_vx_i16m4(const vint8m2_t& op1, SymbolicScalar<int8_t> op2, size_t vl) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
    Term op2_ext = tm.mkTerm(sext, {op2.term()});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_ext = tm.mkTerm(sext, {op1.getElement(i)});
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SUB, {a_ext, op2_ext}));
    }
    return RVVVector(tm, 16, r);
}

// --- vwmul_vx (symbolic, int16 → int32) ---
inline vint32m8_t __riscv_vwmul_vx_i32m8(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    auto& tm = g_ctx->tm;
    Op sext = tm.mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
    Term be = tm.mkTerm(sext, {b.term()});
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term ae = tm.mkTerm(sext, {a.getElement(i)});
        r.push_back(tm.mkTerm(Kind::BITVECTOR_MULT, {ae, be}));
    }
    return RVVVector(tm, 32, r);
}

// --- vmslt_vx i16m4 b4 (symbolic) ---
inline MaskVector __riscv_vmslt_vx_i16m4_b4(const vint16m4_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term cmp = tm.mkTerm(Kind::BITVECTOR_SLT, {a.getElement(i), b.term()});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}

// --- vmerge_vxm i16m4 (symbolic) ---
inline vint16m4_t __riscv_vmerge_vxm_i16m4(const vint16m4_t& a, SymbolicScalar<int16_t> b,
                                             const MaskVector& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mkTerm(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mkTerm(Kind::ITE, {sel, b.term(), a.getElement(i)}));
    }
    return RVVVector(tm, 16, r);
}

// --- FP32 vf (symbolic float) helpers ---
inline RVVVector rvv_sym_fp32_binop_vf(const RVVVector& a, Term b_fp, Kind op, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    bool needs_rm = (op != Kind::FLOATINGPOINT_MAX && op != Kind::FLOATINGPOINT_MIN);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term res = needs_rm ? tm.mkTerm(op, {rm, a_fp, b_fp})
                            : tm.mkTerm(op, {a_fp, b_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, res));
    }
    return RVVVector(tm, 32, r);
}

inline vfloat32m8_t __riscv_vfadd_vf_f32m8(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FLOATINGPOINT_ADD, vl); }
inline vfloat32m8_t __riscv_vfsub_vf_f32m8(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FLOATINGPOINT_SUB, vl); }
inline vfloat32m8_t __riscv_vfmul_vf_f32m8(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FLOATINGPOINT_MULT, vl); }

inline vfloat32m4_t __riscv_vfmin_vf_f32m4(const vfloat32m4_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FLOATINGPOINT_MIN, vl); }
inline vfloat32m4_t __riscv_vfmax_vf_f32m4(const vfloat32m4_t& a, SymbolicScalar<float> b, size_t vl) { return rvv_sym_fp32_binop_vf(a, b.term(), Kind::FLOATINGPOINT_MAX, vl); }

// --- vfmacc_vf (symbolic) ---
inline vfloat32m8_t __riscv_vfmacc_vf_f32m8(const vfloat32m8_t& vd, SymbolicScalar<float> rs1,
                                              const vfloat32m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp = rvv_load_as_fp32(tm, vd.getElement(i));
        Term v2 = rvv_load_as_fp32(tm, vs2.getElement(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, rs1.term(), v2, vd_fp});
        r.push_back(rvv_store_fp32_as_bv(tm, res));
    }
    return RVVVector(tm, 32, r);
}

// --- vfmv_v_f (symbolic) ---
inline vfloat32m8_t __riscv_vfmv_v_f_f32m8(SymbolicScalar<float> src, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = rvv_store_fp32_as_bv(tm, src.term());
    return RVVVector(tm, 32, std::vector<Term>(vl, bv));
}

// --- vmflt_vf (symbolic FP compare) ---
inline MaskVector __riscv_vmflt_vf_f32m8_b4(const vfloat32m8_t& a, SymbolicScalar<float> b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term a_fp = rvv_load_as_fp32(tm, a.getElement(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_LT, {a_fp, b.term()});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}

// ---------------------------------------------------------------------------
// Widening cast overloads — accept wider symbolic types and truncate.
// (Mirrors the bitwuzla tree's widening-cast section ~lines 3225-3260.)
// ---------------------------------------------------------------------------
inline vint16m4_t __riscv_vmv_v_x_i16m4(SymbolicScalar<int32_t> v, size_t vl) {
    return __riscv_vmv_v_x_i16m4(v.cast<int16_t>(), vl);
}
inline vint16m4_t __riscv_vrsub_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    return __riscv_vrsub_vx_i16m4(a, b.cast<int16_t>(), vl);
}
inline vint16m4_t __riscv_vmerge_vxm_i16m4(const vint16m4_t& a, SymbolicScalar<int32_t> b,
                                             const MaskVector& mask, size_t vl) {
    return __riscv_vmerge_vxm_i16m4(a, b.cast<int16_t>(), mask, vl);
}
inline vint16m4_t __riscv_vsadd_vx_i16m4(const vint16m4_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    return __riscv_vsadd_vx_i16m4(a, b.cast<int16_t>(), vl);
}
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    return __riscv_vmax_vx_i8m2(a, b.cast<int8_t>(), vl);
}
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    return __riscv_vmax_vx_i8m2(a, b.cast<int8_t>(), vl);
}
inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    return __riscv_vmin_vx_i8m2(a, b.cast<int8_t>(), vl);
}
inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t& a, SymbolicScalar<int16_t> b, size_t vl) {
    return __riscv_vmin_vx_i8m2(a, b.cast<int8_t>(), vl);
}
inline MaskVector __riscv_vmslt_vx_i16m4_b4(const vint16m4_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    return __riscv_vmslt_vx_i16m4_b4(a, b.cast<int16_t>(), vl);
}
inline vint16m4_t __riscv_vwsub_vx_i16m4(const vint8m2_t& a, SymbolicScalar<int32_t> b, size_t vl) {
    return __riscv_vwsub_vx_i16m4(a, b.cast<int8_t>(), vl);
}

// ===========================================================================
// f16m8 (LMUL=8) ops needed by f16-vexp and similar wide-FP16 kernels.
// All vfloat16m*/vuint16m* aliases are the same RVVVector — these wrappers
// just delegate to the existing element-wise helpers with the caller's vl.
// ===========================================================================
using vuint16m8_t = RVVVector;
using vuint16m1_t = RVVVector;
using vuint16m2_t = RVVVector;
using vuint16m4_t = RVVVector;

inline size_t __riscv_vsetvl_e16m8(size_t avl) {
    return std::min(avl, g_ctx->vlen / 16 * 8);
}

inline vfloat16m8_t __riscv_vfmv_v_f_f16m8(_Float16 src, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = rvv_store_fp16_as_bv(tm, mk_fp16_from_f16(tm, src));
    return RVVVector(tm, 16, std::vector<Term>(vl, bv));
}

inline vfloat16m8_t __riscv_vfadd_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_ADD, vl);
}
inline vfloat16m8_t __riscv_vfsub_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_SUB, vl);
}
inline vfloat16m8_t __riscv_vfmul_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_MULT, vl);
}
inline vfloat16m8_t __riscv_vfmul_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) {
    auto& tm = g_ctx->tm;
    return rvv_fp16_binop_vf_term(a, mk_fp16_from_f16(tm, b), Kind::FLOATINGPOINT_MULT, vl);
}
inline vfloat16m8_t __riscv_vfmin_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) {
    auto& tm = g_ctx->tm;
    return rvv_fp16_binop_vf_term(a, mk_fp16_from_f16(tm, b), Kind::FLOATINGPOINT_MIN, vl);
}
inline vfloat16m8_t __riscv_vfmax_vf_f16m8(const vfloat16m8_t& a, _Float16 b, size_t vl) {
    auto& tm = g_ctx->tm;
    return rvv_fp16_binop_vf_term(a, mk_fp16_from_f16(tm, b), Kind::FLOATINGPOINT_MAX, vl);
}

// vfmacc: vd = vd + vs1 * vs2 → FMA(vs1, vs2, vd)
inline vfloat16m8_t __riscv_vfmacc_vv_f16m8(const vfloat16m8_t& vd, const vfloat16m8_t& vs1,
                                              const vfloat16m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp  = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res    = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, vs1_fp, vs2_fp, vd_fp});
        r.push_back(rvv_store_fp16_as_bv(tm, res));
    }
    return RVVVector(tm, 16, r);
}
inline vfloat16m8_t __riscv_vfmacc_vf_f16m8(const vfloat16m8_t& vd, _Float16 vs1,
                                              const vfloat16m8_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    Term vs1_fp = mk_fp16_from_f16(tm, vs1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp  = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res    = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, vs1_fp, vs2_fp, vd_fp});
        r.push_back(rvv_store_fp16_as_bv(tm, res));
    }
    return RVVVector(tm, 16, r);
}

// Memory ops — m8 mirrors of the m1 versions.
inline vfloat16m8_t __riscv_vle16_v_f16m8(const _Float16* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 16);
}
inline void __riscv_vse16_v_f16m8(_Float16* ptr, const vfloat16m8_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}
inline vfloat16m8_t __riscv_vle16_v_f16m8(const xnn_float16* ptr, size_t vl) {
    return __riscv_vle16_v_f16m8(reinterpret_cast<const _Float16*>(ptr), vl);
}
inline void __riscv_vse16_v_f16m8(xnn_float16* ptr, const vfloat16m8_t& val, size_t vl) {
    __riscv_vse16_v_f16m8(reinterpret_cast<_Float16*>(ptr), val, vl);
}

// Reinterpret f16 ↔ u16 — RVVVector is type-erased, so these are no-ops.
inline RVVVector __riscv_vreinterpret_v_u16m8_f16m8(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_f16m8_u16m8(const RVVVector& a) { return a; }

// uint16 immediate left shift, lane-wise.
inline vuint16m8_t __riscv_vsll_vx_u16m8(const vuint16m8_t& a, size_t shift, size_t vl) {
    auto& tm = g_ctx->tm;
    Term sh = mk_bv_val(tm, 16, (uint64_t)shift);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SHL, {a.getElement(i), sh}));
    }
    return RVVVector(tm, 16, r);
}

// ===========================================================================
// f16m4 (LMUL=4) ops needed by f16-vsigmoid and similar mid-LMUL kernels.
// ===========================================================================
inline size_t __riscv_vsetvl_e16m4(size_t avl) {
    return std::min(avl, g_ctx->vlen / 16 * 4);
}
inline size_t __riscv_vsetvlmax_e16m4() {
    return g_ctx->vlen / 16 * 4;
}

inline vuint16m4_t __riscv_vmv_v_x_u16m4(uint16_t v, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 16, (uint64_t)v);
    return RVVVector(tm, 16, std::vector<Term>(vl, bv));
}
inline vfloat16m4_t __riscv_vmv_v_v_f16m4(const vfloat16m4_t& src, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(src.getElement(i));
    return RVVVector(tm, 16, r);
}

// uint16 load/store at m4.
inline vuint16m4_t __riscv_vle16_v_u16m4(const uint16_t* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 16);
}
inline void __riscv_vse16_v_u16m4(uint16_t* ptr, const vuint16m4_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}

// FP abs — clears sign bit.
inline vfloat16m4_t __riscv_vfabs_v_f16m4(const vfloat16m4_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af = rvv_load_as_fp16(tm, a.getElement(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_ABS, {af});
        r.push_back(rvv_store_fp16_as_bv(tm, res));
    }
    return RVVVector(tm, 16, r);
}

inline vfloat16m4_t __riscv_vfadd_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_ADD, vl);
}
inline vfloat16m4_t __riscv_vfsub_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_SUB, vl);
}
inline vfloat16m4_t __riscv_vfmul_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_MULT, vl);
}
inline vfloat16m4_t __riscv_vfdiv_vv_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_DIV, vl);
}
inline vfloat16m4_t __riscv_vfmacc_vv_f16m4(const vfloat16m4_t& vd, const vfloat16m4_t& vs1,
                                              const vfloat16m4_t& vs2, size_t vl) {
    auto& tm = g_ctx->tm; Term rm = g_ctx->fp.rounding_mode;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term vd_fp  = rvv_load_as_fp16(tm, vd.getElement(i));
        Term vs1_fp = rvv_load_as_fp16(tm, vs1.getElement(i));
        Term vs2_fp = rvv_load_as_fp16(tm, vs2.getElement(i));
        Term res    = tm.mkTerm(Kind::FLOATINGPOINT_FMA, {rm, vs1_fp, vs2_fp, vd_fp});
        r.push_back(rvv_store_fp16_as_bv(tm, res));
    }
    return RVVVector(tm, 16, r);
}

// FP compare → b4 mask.
inline vbool4_t __riscv_vmfgt_vv_f16m4_b4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af = rvv_load_as_fp16(tm, a.getElement(i));
        Term bf = rvv_load_as_fp16(tm, b.getElement(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_GT, {af, bf});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}
inline vbool4_t __riscv_vmflt_vv_f16m4_b4(const vfloat16m4_t& a, const vfloat16m4_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af = rvv_load_as_fp16(tm, a.getElement(i));
        Term bf = rvv_load_as_fp16(tm, b.getElement(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_LT, {af, bf});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}

// vmerge: mask=1 → b, mask=0 → a.  Vector-vector and vector-scalar forms.
inline vfloat16m4_t __riscv_vmerge_vvm_f16m4(const vfloat16m4_t& a, const vfloat16m4_t& b,
                                               const vbool4_t& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mkTerm(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mkTerm(Kind::ITE, {sel, b.getElement(i), a.getElement(i)}));
    }
    return RVVVector(tm, 16, r);
}
inline vuint16m4_t __riscv_vmerge_vxm_u16m4(const vuint16m4_t& a, uint16_t b,
                                              const vbool4_t& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 16, (uint64_t)b);
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mkTerm(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mkTerm(Kind::ITE, {sel, bv, a.getElement(i)}));
    }
    return RVVVector(tm, 16, r);
}

// Reinterprets — RVVVector is type-erased, all no-ops.
inline RVVVector __riscv_vreinterpret_v_f16m4_i16m4(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_i16m4_f16m4(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_f16m4_u16m4(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_u16m4_f16m4(const RVVVector& a) { return a; }

// ===========================================================================
// f16m8 (LMUL=8) ops — mirror of the m4 batch above.  Mask ratio for e16m8
// is SEW/LMUL = 16/8 = 2, so masks use vbool2_t.
// ===========================================================================
using vbool2_t = MaskVector;

inline size_t __riscv_vsetvlmax_e16m8() {
    return g_ctx->vlen / 16 * 8;
}

inline vuint16m8_t __riscv_vmv_v_x_u16m8(uint16_t v, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 16, (uint64_t)v);
    return RVVVector(tm, 16, std::vector<Term>(vl, bv));
}
inline vfloat16m8_t __riscv_vmv_v_v_f16m8(const vfloat16m8_t& src, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(src.getElement(i));
    return RVVVector(tm, 16, r);
}

inline vuint16m8_t __riscv_vle16_v_u16m8(const uint16_t* ptr, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    return buf.loadRVV(buf.ptrToByteOffset(ptr), vl, 16);
}
inline void __riscv_vse16_v_u16m8(uint16_t* ptr, const vuint16m8_t& val, size_t vl) {
    auto& buf = g_ctx->findBuffer(ptr);
    buf.storeRVV(buf.ptrToByteOffset(ptr), val);
}

inline vfloat16m8_t __riscv_vfabs_v_f16m8(const vfloat16m8_t& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af = rvv_load_as_fp16(tm, a.getElement(i));
        Term res = tm.mkTerm(Kind::FLOATINGPOINT_ABS, {af});
        r.push_back(rvv_store_fp16_as_bv(tm, res));
    }
    return RVVVector(tm, 16, r);
}
inline vfloat16m8_t __riscv_vfdiv_vv_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) {
    return rvv_fp16_binop(a, b, Kind::FLOATINGPOINT_DIV, vl);
}

inline vbool2_t __riscv_vmfgt_vv_f16m8_b2(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af = rvv_load_as_fp16(tm, a.getElement(i));
        Term bf = rvv_load_as_fp16(tm, b.getElement(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_GT, {af, bf});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}
inline vbool2_t __riscv_vmflt_vv_f16m8_b2(const vfloat16m8_t& a, const vfloat16m8_t& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term af = rvv_load_as_fp16(tm, a.getElement(i));
        Term bf = rvv_load_as_fp16(tm, b.getElement(i));
        Term cmp = tm.mkTerm(Kind::FLOATINGPOINT_LT, {af, bf});
        bits.push_back(tm.mkTerm(Kind::ITE, {cmp, mk_bv_val(tm, 1, 1), mk_bv_val(tm, 1, 0)}));
    }
    return MaskVector(tm, bits);
}

inline vfloat16m8_t __riscv_vmerge_vvm_f16m8(const vfloat16m8_t& a, const vfloat16m8_t& b,
                                               const vbool2_t& mask, size_t vl) {
    auto& tm = g_ctx->tm; Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mkTerm(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mkTerm(Kind::ITE, {sel, b.getElement(i), a.getElement(i)}));
    }
    return RVVVector(tm, 16, r);
}
inline vuint16m8_t __riscv_vmerge_vxm_u16m8(const vuint16m8_t& a, uint16_t b,
                                              const vbool2_t& mask, size_t vl) {
    auto& tm = g_ctx->tm;
    Term bv = mk_bv_val(tm, 16, (uint64_t)b);
    Term one = mk_bv_val(tm, 1, 1);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term sel = tm.mkTerm(Kind::EQUAL, {mask.getBit(i), one});
        r.push_back(tm.mkTerm(Kind::ITE, {sel, bv, a.getElement(i)}));
    }
    return RVVVector(tm, 16, r);
}

// int16 immediate left shift (arithmetic shift on signed view = logical on bits).
inline vint16m8_t __riscv_vsll_vx_i16m8(const vint16m8_t& a, size_t shift, size_t vl) {
    auto& tm = g_ctx->tm;
    Term sh = mk_bv_val(tm, 16, (uint64_t)shift);
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(tm.mkTerm(Kind::BITVECTOR_SHL, {a.getElement(i), sh}));
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vreinterpret_v_f16m8_i16m8(const RVVVector& a) { return a; }
inline RVVVector __riscv_vreinterpret_v_i16m8_f16m8(const RVVVector& a) { return a; }

} // namespace salt_cvc5
