#pragma once
// RVV vsetvl / vsetvlmax — complete coverage (fractional + e64 LMUL).
// vlmax = VLEN/SEW * LMUL, clamped >= 1; vsetvl returns min(avl, vlmax).
#include "../intrinsics.hpp"

namespace salt_cvc5 {

inline size_t _gen_vsetvl(size_t avl, size_t sew, size_t num, size_t den) {
    size_t vlmax = g_ctx->vlen / sew * num / den;
    if (vlmax < 1) vlmax = 1;
    return std::min(avl, vlmax);
}
inline size_t _gen_vsetvlmax(size_t sew, size_t num, size_t den) {
    size_t vlmax = g_ctx->vlen / sew * num / den;
    if (vlmax < 1) vlmax = 1;
    return vlmax;
}

inline size_t __riscv_vsetvl_e8mf8(size_t avl)  { return _gen_vsetvl(avl,  8, 1, 8); }
inline size_t __riscv_vsetvl_e8mf4(size_t avl)  { return _gen_vsetvl(avl,  8, 1, 4); }
inline size_t __riscv_vsetvl_e8mf2(size_t avl)  { return _gen_vsetvl(avl,  8, 1, 2); }
inline size_t __riscv_vsetvl_e16mf4(size_t avl) { return _gen_vsetvl(avl, 16, 1, 4); }
inline size_t __riscv_vsetvl_e16mf2(size_t avl) { return _gen_vsetvl(avl, 16, 1, 2); }
inline size_t __riscv_vsetvl_e32mf2(size_t avl) { return _gen_vsetvl(avl, 32, 1, 2); }
inline size_t __riscv_vsetvl_e64m1(size_t avl)  { return _gen_vsetvl(avl, 64, 1, 1); }
inline size_t __riscv_vsetvl_e64m2(size_t avl)  { return _gen_vsetvl(avl, 64, 2, 1); }
inline size_t __riscv_vsetvl_e64m4(size_t avl)  { return _gen_vsetvl(avl, 64, 4, 1); }
inline size_t __riscv_vsetvl_e64m8(size_t avl)  { return _gen_vsetvl(avl, 64, 8, 1); }
inline size_t __riscv_vsetvl_e8m4(size_t avl)   { return _gen_vsetvl(avl,  8, 4, 1); }
inline size_t __riscv_vsetvl_e16m2(size_t avl)  { return _gen_vsetvl(avl, 16, 2, 1); }

inline size_t __riscv_vsetvlmax_e8m1()   { return _gen_vsetvlmax( 8, 1, 1); }
inline size_t __riscv_vsetvlmax_e16m1()  { return _gen_vsetvlmax(16, 1, 1); }
inline size_t __riscv_vsetvlmax_e8m2()   { return _gen_vsetvlmax( 8, 2, 1); }
inline size_t __riscv_vsetvlmax_e8m4()   { return _gen_vsetvlmax( 8, 4, 1); }
inline size_t __riscv_vsetvlmax_e8m8()   { return _gen_vsetvlmax( 8, 8, 1); }
inline size_t __riscv_vsetvlmax_e8mf2()  { return _gen_vsetvlmax( 8, 1, 2); }
inline size_t __riscv_vsetvlmax_e8mf4()  { return _gen_vsetvlmax( 8, 1, 4); }
inline size_t __riscv_vsetvlmax_e8mf8()  { return _gen_vsetvlmax( 8, 1, 8); }
inline size_t __riscv_vsetvlmax_e16m2()  { return _gen_vsetvlmax(16, 2, 1); }
inline size_t __riscv_vsetvlmax_e16mf2() { return _gen_vsetvlmax(16, 1, 2); }
inline size_t __riscv_vsetvlmax_e16mf4() { return _gen_vsetvlmax(16, 1, 4); }
inline size_t __riscv_vsetvlmax_e32mf2() { return _gen_vsetvlmax(32, 1, 2); }
inline size_t __riscv_vsetvlmax_e64m1()  { return _gen_vsetvlmax(64, 1, 1); }
inline size_t __riscv_vsetvlmax_e64m2()  { return _gen_vsetvlmax(64, 2, 1); }
inline size_t __riscv_vsetvlmax_e64m4()  { return _gen_vsetvlmax(64, 4, 1); }
inline size_t __riscv_vsetvlmax_e64m8()  { return _gen_vsetvlmax(64, 8, 1); }

} // namespace salt_cvc5
