#pragma once
// RVV mask family: mask logic, set/clr/mv/not, msbf/sif/sof, vid, viota, vcpop, vfirst
#include "../intrinsics.hpp"
namespace salt {

inline unsigned long __riscv_vcpop_m_b1(const MaskVector& op1, size_t vl) { (void)op1; (void)vl; return 0; }

inline unsigned long __riscv_vcpop_m_b16(const MaskVector& op1, size_t vl) { (void)op1; (void)vl; return 0; }

inline unsigned long __riscv_vcpop_m_b2(const MaskVector& op1, size_t vl) { (void)op1; (void)vl; return 0; }

inline unsigned long __riscv_vcpop_m_b32(const MaskVector& op1, size_t vl) { (void)op1; (void)vl; return 0; }

inline unsigned long __riscv_vcpop_m_b4(const MaskVector& op1, size_t vl) { (void)op1; (void)vl; return 0; }

inline unsigned long __riscv_vcpop_m_b64(const MaskVector& op1, size_t vl) { (void)op1; (void)vl; return 0; }

inline unsigned long __riscv_vcpop_m_b8(const MaskVector& op1, size_t vl) { (void)op1; (void)vl; return 0; }

inline RVVVector __riscv_vcpop_v_u16m1(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 16, 0);
        for (uint32_t b = 0; b < 16; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 15, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vcpop_v_u16m2(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 16, 0);
        for (uint32_t b = 0; b < 16; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 15, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vcpop_v_u16m4(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 16, 0);
        for (uint32_t b = 0; b < 16; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 15, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vcpop_v_u16m8(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 16, 0);
        for (uint32_t b = 0; b < 16; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 15, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vcpop_v_u16mf2(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 16, 0);
        for (uint32_t b = 0; b < 16; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 15, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vcpop_v_u16mf4(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 16, 0);
        for (uint32_t b = 0; b < 16; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 15, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vcpop_v_u32m1(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 32, 0);
        for (uint32_t b = 0; b < 32; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 31, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_vcpop_v_u32m2(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 32, 0);
        for (uint32_t b = 0; b < 32; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 31, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_vcpop_v_u32m4(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 32, 0);
        for (uint32_t b = 0; b < 32; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 31, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_vcpop_v_u32m8(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 32, 0);
        for (uint32_t b = 0; b < 32; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 31, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_vcpop_v_u32mf2(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 32, 0);
        for (uint32_t b = 0; b < 32; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 31, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_vcpop_v_u64m1(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 64, 0);
        for (uint32_t b = 0; b < 64; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 63, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_vcpop_v_u64m2(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 64, 0);
        for (uint32_t b = 0; b < 64; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 63, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_vcpop_v_u64m4(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 64, 0);
        for (uint32_t b = 0; b < 64; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 63, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_vcpop_v_u64m8(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 64, 0);
        for (uint32_t b = 0; b < 64; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 63, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_vcpop_v_u8m1(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 8, 0);
        for (uint32_t b = 0; b < 8; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 7, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vcpop_v_u8m2(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 8, 0);
        for (uint32_t b = 0; b < 8; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 7, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vcpop_v_u8m4(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 8, 0);
        for (uint32_t b = 0; b < 8; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 7, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vcpop_v_u8m8(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 8, 0);
        for (uint32_t b = 0; b < 8; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 7, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vcpop_v_u8mf2(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 8, 0);
        for (uint32_t b = 0; b < 8; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 7, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vcpop_v_u8mf4(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 8, 0);
        for (uint32_t b = 0; b < 8; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 7, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vcpop_v_u8mf8(const RVVVector& vs2, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
        Term e = vs2.getElement(i);
        Term cnt = mk_bv_val(tm, 8, 0);
        for (uint32_t b = 0; b < 8; b++)
            cnt = fold_bvadd(tm, cnt, fold_bvzext(tm, 7, fold_bvextract(tm, b, b, e)));
        r.push_back(cnt);
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vid_v_u16m2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 16, static_cast<int64_t>(i)));
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vid_v_u16m4(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 16, static_cast<int64_t>(i)));
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vid_v_u16m8(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 16, static_cast<int64_t>(i)));
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vid_v_u16mf2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 16, static_cast<int64_t>(i)));
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vid_v_u16mf4(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 16, static_cast<int64_t>(i)));
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_vid_v_u32m8(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 32, static_cast<int64_t>(i)));
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_vid_v_u32mf2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 32, static_cast<int64_t>(i)));
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_vid_v_u64m1(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 64, static_cast<int64_t>(i)));
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_vid_v_u64m2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 64, static_cast<int64_t>(i)));
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_vid_v_u64m4(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 64, static_cast<int64_t>(i)));
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_vid_v_u64m8(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 64, static_cast<int64_t>(i)));
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_vid_v_u8m2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 8, static_cast<int64_t>(i)));
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vid_v_u8m4(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 8, static_cast<int64_t>(i)));
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vid_v_u8m8(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 8, static_cast<int64_t>(i)));
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vid_v_u8mf2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 8, static_cast<int64_t>(i)));
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vid_v_u8mf4(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 8, static_cast<int64_t>(i)));
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_vid_v_u8mf8(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    for (size_t i = 0; i < vl; i++) r.push_back(mk_bv_val(tm, 8, static_cast<int64_t>(i)));
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_viota_m_u16m1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 16, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 15, a.getBit(i)));
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_viota_m_u16m2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 16, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 15, a.getBit(i)));
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_viota_m_u16m4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 16, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 15, a.getBit(i)));
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_viota_m_u16m8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 16, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 15, a.getBit(i)));
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_viota_m_u16mf2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 16, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 15, a.getBit(i)));
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_viota_m_u16mf4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 16, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 15, a.getBit(i)));
    }
    return RVVVector(tm, 16, r);
}

inline RVVVector __riscv_viota_m_u32m1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 32, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 31, a.getBit(i)));
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_viota_m_u32m2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 32, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 31, a.getBit(i)));
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_viota_m_u32m4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 32, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 31, a.getBit(i)));
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_viota_m_u32m8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 32, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 31, a.getBit(i)));
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_viota_m_u32mf2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 32, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 31, a.getBit(i)));
    }
    return RVVVector(tm, 32, r);
}

inline RVVVector __riscv_viota_m_u64m1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 64, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 63, a.getBit(i)));
    }
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_viota_m_u64m2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 64, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 63, a.getBit(i)));
    }
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_viota_m_u64m4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 64, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 63, a.getBit(i)));
    }
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_viota_m_u64m8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 64, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 63, a.getBit(i)));
    }
    return RVVVector(tm, 64, r);
}

inline RVVVector __riscv_viota_m_u8m1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 8, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 7, a.getBit(i)));
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_viota_m_u8m2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 8, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 7, a.getBit(i)));
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_viota_m_u8m4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 8, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 7, a.getBit(i)));
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_viota_m_u8m8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 8, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 7, a.getBit(i)));
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_viota_m_u8mf2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 8, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 7, a.getBit(i)));
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_viota_m_u8mf4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 8, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 7, a.getBit(i)));
    }
    return RVVVector(tm, 8, r);
}

inline RVVVector __riscv_viota_m_u8mf8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> r; r.reserve(vl);
    Term acc = mk_bv_val(tm, 8, 0);
    for (size_t i = 0; i < vl; i++) {
        r.push_back(acc);                         // sum of mask[0..i-1]
        acc = fold_bvadd(tm, acc, fold_bvzext(tm, 7, a.getBit(i)));
    }
    return RVVVector(tm, 8, r);
}

inline MaskVector __riscv_vmand_mm_b1(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmand_mm_b2(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmand_mm_b32(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmand_mm_b4(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmand_mm_b64(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmand_mm_b8(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmandn_mm_b1(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmandn_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmandn_mm_b2(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmandn_mm_b32(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmandn_mm_b4(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmandn_mm_b64(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmandn_mm_b8(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvand(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmclr_m_b1(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 0));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmclr_m_b16(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 0));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmclr_m_b2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 0));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmclr_m_b32(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 0));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmclr_m_b4(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 0));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmclr_m_b64(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 0));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmclr_m_b8(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 0));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmmv_m_b1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(a.getBit(i));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmmv_m_b16(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(a.getBit(i));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmmv_m_b2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(a.getBit(i));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmmv_m_b32(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(a.getBit(i));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmmv_m_b4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(a.getBit(i));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmmv_m_b64(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(a.getBit(i));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmmv_m_b8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(a.getBit(i));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnand_mm_b1(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvand(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnand_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvand(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnand_mm_b2(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvand(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnand_mm_b32(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvand(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnand_mm_b4(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvand(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnand_mm_b64(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvand(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnand_mm_b8(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvand(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnor_mm_b1(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnor_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnor_mm_b2(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnor_mm_b32(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnor_mm_b4(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnor_mm_b64(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnor_mm_b8(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnot_m_b1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, a.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnot_m_b16(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, a.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnot_m_b2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, a.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnot_m_b32(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, a.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnot_m_b4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, a.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnot_m_b64(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, a.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmnot_m_b8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, a.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmor_mm_b1(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmor_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmor_mm_b2(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmor_mm_b32(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmor_mm_b4(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmor_mm_b64(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmor_mm_b8(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmorn_mm_b1(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmorn_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmorn_mm_b2(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmorn_mm_b32(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmorn_mm_b4(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmorn_mm_b64(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmorn_mm_b8(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvor(tm, a.getBit(i), fold_bvnot(tm, b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsbf_m_b1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term incl = fold_bvor(tm, seen, a.getBit(i));   // set bit in [0,i]?
        bits.push_back(fold_bvnot(tm, incl));    // 1 iff no set bit in [0,i]
        seen = incl;
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsbf_m_b16(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term incl = fold_bvor(tm, seen, a.getBit(i));   // set bit in [0,i]?
        bits.push_back(fold_bvnot(tm, incl));    // 1 iff no set bit in [0,i]
        seen = incl;
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsbf_m_b2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term incl = fold_bvor(tm, seen, a.getBit(i));   // set bit in [0,i]?
        bits.push_back(fold_bvnot(tm, incl));    // 1 iff no set bit in [0,i]
        seen = incl;
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsbf_m_b32(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term incl = fold_bvor(tm, seen, a.getBit(i));   // set bit in [0,i]?
        bits.push_back(fold_bvnot(tm, incl));    // 1 iff no set bit in [0,i]
        seen = incl;
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsbf_m_b4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term incl = fold_bvor(tm, seen, a.getBit(i));   // set bit in [0,i]?
        bits.push_back(fold_bvnot(tm, incl));    // 1 iff no set bit in [0,i]
        seen = incl;
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsbf_m_b64(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term incl = fold_bvor(tm, seen, a.getBit(i));   // set bit in [0,i]?
        bits.push_back(fold_bvnot(tm, incl));    // 1 iff no set bit in [0,i]
        seen = incl;
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsbf_m_b8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term incl = fold_bvor(tm, seen, a.getBit(i));   // set bit in [0,i]?
        bits.push_back(fold_bvnot(tm, incl));    // 1 iff no set bit in [0,i]
        seen = incl;
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmset_m_b1(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 1));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmset_m_b16(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 1));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmset_m_b2(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 1));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmset_m_b32(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 1));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmset_m_b4(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 1));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmset_m_b64(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 1));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmset_m_b8(size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits(vl, mk_bv_val(tm, 1, 1));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsif_m_b1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(fold_bvnot(tm, seen));     // 1 iff first set bit is at >= i
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsif_m_b16(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(fold_bvnot(tm, seen));     // 1 iff first set bit is at >= i
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsif_m_b2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(fold_bvnot(tm, seen));     // 1 iff first set bit is at >= i
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsif_m_b32(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(fold_bvnot(tm, seen));     // 1 iff first set bit is at >= i
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsif_m_b4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(fold_bvnot(tm, seen));     // 1 iff first set bit is at >= i
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsif_m_b64(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(fold_bvnot(tm, seen));     // 1 iff first set bit is at >= i
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsif_m_b8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        bits.push_back(fold_bvnot(tm, seen));     // 1 iff first set bit is at >= i
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsof_m_b1(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term notseen = fold_bvnot(tm, seen);
        bits.push_back(fold_bvand(tm, a.getBit(i), notseen)); // first set bit only
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsof_m_b16(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term notseen = fold_bvnot(tm, seen);
        bits.push_back(fold_bvand(tm, a.getBit(i), notseen)); // first set bit only
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsof_m_b2(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term notseen = fold_bvnot(tm, seen);
        bits.push_back(fold_bvand(tm, a.getBit(i), notseen)); // first set bit only
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsof_m_b32(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term notseen = fold_bvnot(tm, seen);
        bits.push_back(fold_bvand(tm, a.getBit(i), notseen)); // first set bit only
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsof_m_b4(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term notseen = fold_bvnot(tm, seen);
        bits.push_back(fold_bvand(tm, a.getBit(i), notseen)); // first set bit only
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsof_m_b64(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term notseen = fold_bvnot(tm, seen);
        bits.push_back(fold_bvand(tm, a.getBit(i), notseen)); // first set bit only
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmsof_m_b8(const MaskVector& a, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    Term seen = mk_bv_val(tm, 1, 0);              // OR of all earlier mask bits
    for (size_t i = 0; i < vl; i++) {
        Term notseen = fold_bvnot(tm, seen);
        bits.push_back(fold_bvand(tm, a.getBit(i), notseen)); // first set bit only
        seen = fold_bvor(tm, seen, a.getBit(i));
    }
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxnor_mm_b1(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvxor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxnor_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvxor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxnor_mm_b2(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvxor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxnor_mm_b32(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvxor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxnor_mm_b4(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvxor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxnor_mm_b64(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvxor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxnor_mm_b8(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvnot(tm, fold_bvxor(tm, a.getBit(i), b.getBit(i))));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxor_mm_b1(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvxor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxor_mm_b16(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvxor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxor_mm_b2(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvxor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxor_mm_b32(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvxor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxor_mm_b4(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvxor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxor_mm_b64(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvxor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

inline MaskVector __riscv_vmxor_mm_b8(const MaskVector& a, const MaskVector& b, size_t vl) {
    auto& tm = g_ctx->tm;
    std::vector<Term> bits; bits.reserve(vl);
    for (size_t i = 0; i < vl; i++) bits.push_back(fold_bvxor(tm, a.getBit(i), b.getBit(i)));
    return MaskVector(tm, bits);
}

} // namespace salt
