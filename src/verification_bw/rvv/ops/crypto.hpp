#pragma once
// RVV crypto (Zvkg vghsh) — bitwuzla.
#include "../intrinsics.hpp"
namespace salt {
// vghsh_vv (GHASH) placeholder: returns vd unchanged. See report.
inline RVVVector __riscv_vghsh_vv_u32m1(const RVVVector& vd, const RVVVector& vs2, const RVVVector& vs1, size_t vl){ (void)vs2;(void)vs1;(void)vl; return RVVVector(g_ctx->tm,32,vd.elements()); }
inline RVVVector __riscv_vghsh_vv_u32m2(const RVVVector& vd, const RVVVector& vs2, const RVVVector& vs1, size_t vl){ (void)vs2;(void)vs1;(void)vl; return RVVVector(g_ctx->tm,32,vd.elements()); }
inline RVVVector __riscv_vghsh_vv_u32m4(const RVVVector& vd, const RVVVector& vs2, const RVVVector& vs1, size_t vl){ (void)vs2;(void)vs1;(void)vl; return RVVVector(g_ctx->tm,32,vd.elements()); }
inline RVVVector __riscv_vghsh_vv_u32m8(const RVVVector& vd, const RVVVector& vs2, const RVVVector& vs1, size_t vl){ (void)vs2;(void)vs1;(void)vl; return RVVVector(g_ctx->tm,32,vd.elements()); }
inline RVVVector __riscv_vghsh_vv_u32mf2(const RVVVector& vd, const RVVVector& vs2, const RVVVector& vs1, size_t vl){ (void)vs2;(void)vs1;(void)vl; return RVVVector(g_ctx->tm,32,vd.elements()); }
} // namespace salt
