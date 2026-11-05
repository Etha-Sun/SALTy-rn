#pragma once
// RVV carry/borrow (vadc/vsbc/vmadc/vmsbc) — generated coverage (cvc5).
#include "../intrinsics.hpp"
namespace salt_cvc5 {
inline RVVVector __riscv_vadc_vvm_i16m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_i16m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_i16m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_i16m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_i16mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_i16mf4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_i32m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_i32m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_i32m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_i32m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_i32mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_i64m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vvm_i64m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vvm_i64m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vvm_i64m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vvm_i8m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_i8m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_i8m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_i8m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_i8mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_i8mf4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_i8mf8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_u16m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_u16m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_u16m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_u16m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_u16mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_u16mf4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vvm_u32m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_u32m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_u32m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_u32m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_u32mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vvm_u64m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vvm_u64m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vvm_u64m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vvm_u64m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vvm_u8m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_u8m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_u8m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_u8m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_u8mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_u8mf4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vvm_u8mf8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_i16m1(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_i16m2(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_i16m4(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_i16m8(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_i16mf2(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_i16mf4(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_i32m1(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_i32m2(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_i32m4(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_i32m8(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_i32mf2(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_i64m1(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vxm_i64m2(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vxm_i64m4(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vxm_i64m8(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vxm_i8m1(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_i8m2(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_i8m4(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_i8m8(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_i8mf2(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_i8mf4(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_i8mf8(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_u16m1(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_u16m2(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_u16m4(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_u16m8(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_u16mf2(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_u16mf4(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vadc_vxm_u32m1(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_u32m2(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_u32m4(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_u32m8(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_u32mf2(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vadc_vxm_u64m1(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vxm_u64m2(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vxm_u64m4(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vxm_u64m8(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vadc_vxm_u8m1(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_u8m2(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_u8m4(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_u8m8(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_u8mf2(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_u8mf4(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vadc_vxm_u8mf8(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvadd(tm, fold_bvadd(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline MaskVector __riscv_vmadc_vv_i16m1_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i16m2_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i16m4_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i16m8_b2(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i16mf2_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i16mf4_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i32m1_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i32m2_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i32m4_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i32m8_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i32mf2_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i64m1_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i64m2_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i64m4_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i64m8_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i8m1_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i8m2_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i8m4_b2(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i8m8_b1(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i8mf2_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i8mf4_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_i8mf8_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u16m1_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u16m2_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u16m4_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u16m8_b2(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u16mf2_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u16mf4_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u32m1_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u32m2_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u32m4_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u32m8_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u32mf2_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u64m1_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u64m2_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u64m4_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u64m8_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u8m1_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u8m2_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u8m4_b2(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u8m8_b1(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u8mf2_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u8mf4_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vv_u8mf8_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i16m1_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i16m2_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i16m4_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i16m8_b2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i16mf2_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i16mf4_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i32m1_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i32m2_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i32m4_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i32m8_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i32mf2_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i64m1_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i64m2_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i64m4_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i64m8_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i8m1_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i8m2_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i8m4_b2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i8m8_b1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i8mf2_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i8mf4_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_i8mf8_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u16m1_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u16m2_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u16m4_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u16m8_b2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u16mf2_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u16mf4_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u32m1_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u32m2_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u32m4_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u32m8_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u32mf2_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u64m1_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u64m2_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u64m4_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u64m8_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u8m1_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u8m2_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u8m4_b2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u8m8_b1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u8mf2_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u8mf4_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vvm_u8mf8_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i16m1_b16(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i16m2_b8(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i16m4_b4(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i16m8_b2(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i16mf2_b32(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i16mf4_b64(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i32m1_b32(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i32m2_b16(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i32m4_b8(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i32m8_b4(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i32mf2_b64(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i64m1_b64(const RVVVector& op1, int64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i64m2_b32(const RVVVector& op1, int64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i64m4_b16(const RVVVector& op1, int64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i64m8_b8(const RVVVector& op1, int64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i8m1_b8(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i8m2_b4(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i8m4_b2(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i8m8_b1(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i8mf2_b16(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i8mf4_b32(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_i8mf8_b64(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u16m1_b16(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u16m2_b8(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u16m4_b4(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u16m8_b2(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u16mf2_b32(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u16mf4_b64(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u32m1_b32(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u32m2_b16(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u32m4_b8(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u32m8_b4(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u32mf2_b64(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u64m1_b64(const RVVVector& op1, uint64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u64m2_b32(const RVVVector& op1, uint64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u64m4_b16(const RVVVector& op1, uint64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u64m8_b8(const RVVVector& op1, uint64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u8m1_b8(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u8m2_b4(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u8m4_b2(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u8m8_b1(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u8mf2_b16(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u8mf4_b32(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vx_u8mf8_b64(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i16m1_b16(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i16m2_b8(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i16m4_b4(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i16m8_b2(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i16mf2_b32(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i16mf4_b64(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i32m1_b32(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i32m2_b16(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i32m4_b8(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i32m8_b4(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i32mf2_b64(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i64m1_b64(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i64m2_b32(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i64m4_b16(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i64m8_b8(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i8m1_b8(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i8m2_b4(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i8m4_b2(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i8m8_b1(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i8mf2_b16(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i8mf4_b32(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_i8mf8_b64(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u16m1_b16(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u16m2_b8(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u16m4_b4(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u16m8_b2(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u16mf2_b32(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u16mf4_b64(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u32m1_b32(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u32m2_b16(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u32m4_b8(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u32m8_b4(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u32mf2_b64(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u64m1_b64(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u64m2_b32(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u64m4_b16(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u64m8_b8(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u8m1_b8(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u8m2_b4(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u8m4_b2(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u8m8_b1(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u8mf2_b16(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u8mf4_b32(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmadc_vxm_u8mf8_b64(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvadd(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvadd(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i16m1_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i16m2_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i16m4_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i16m8_b2(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i16mf2_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i16mf4_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i32m1_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i32m2_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i32m4_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i32m8_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i32mf2_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i64m1_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i64m2_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i64m4_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i64m8_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i8m1_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i8m2_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i8m4_b2(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i8m8_b1(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i8mf2_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i8mf4_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_i8mf8_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u16m1_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u16m2_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u16m4_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u16m8_b2(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u16mf2_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u16mf4_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u32m1_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u32m2_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u32m4_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u32m8_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u32mf2_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u64m1_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u64m2_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u64m4_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u64m8_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u8m1_b8(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u8m2_b4(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u8m4_b2(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u8m8_b1(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u8mf2_b16(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u8mf4_b32(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vv_u8mf8_b64(const RVVVector& op1, const RVVVector& op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i16m1_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i16m2_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i16m4_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i16m8_b2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i16mf2_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i16mf4_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i32m1_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i32m2_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i32m4_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i32m8_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i32mf2_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i64m1_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i64m2_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i64m4_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i64m8_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i8m1_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i8m2_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i8m4_b2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i8m8_b1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i8mf2_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i8mf4_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_i8mf8_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u16m1_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u16m2_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u16m4_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u16m8_b2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u16mf2_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u16mf4_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u32m1_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u32m2_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u32m4_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u32m8_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u32mf2_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u64m1_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u64m2_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u64m4_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u64m8_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u8m1_b8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u8m2_b4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u8m4_b2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u8m8_b1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u8mf2_b16(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u8mf4_b32(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vvm_u8mf8_b64(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i16m1_b16(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i16m2_b8(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i16m4_b4(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i16m8_b2(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i16mf2_b32(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i16mf4_b64(const RVVVector& op1, int16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i32m1_b32(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i32m2_b16(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i32m4_b8(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i32m8_b4(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i32mf2_b64(const RVVVector& op1, int32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i64m1_b64(const RVVVector& op1, int64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i64m2_b32(const RVVVector& op1, int64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i64m4_b16(const RVVVector& op1, int64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i64m8_b8(const RVVVector& op1, int64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i8m1_b8(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i8m2_b4(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i8m4_b2(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i8m8_b1(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i8mf2_b16(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i8mf4_b32(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_i8mf8_b64(const RVVVector& op1, int8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u16m1_b16(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u16m2_b8(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u16m4_b4(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u16m8_b2(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u16mf2_b32(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u16mf4_b64(const RVVVector& op1, uint16_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u32m1_b32(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u32m2_b16(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u32m4_b8(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u32m8_b4(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u32mf2_b64(const RVVVector& op1, uint32_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u64m1_b64(const RVVVector& op1, uint64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u64m2_b32(const RVVVector& op1, uint64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u64m4_b16(const RVVVector& op1, uint64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u64m8_b8(const RVVVector& op1, uint64_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u8m1_b8(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u8m2_b4(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u8m4_b2(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u8m8_b1(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u8mf2_b16(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u8mf4_b32(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vx_u8mf8_b64(const RVVVector& op1, uint8_t op2, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i16m1_b16(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i16m2_b8(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i16m4_b4(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i16m8_b2(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i16mf2_b32(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i16mf4_b64(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i32m1_b32(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i32m2_b16(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i32m4_b8(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i32m8_b4(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i32mf2_b64(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i64m1_b64(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i64m2_b32(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i64m4_b16(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i64m8_b8(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i8m1_b8(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i8m2_b4(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i8m4_b2(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i8m8_b1(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i8mf2_b16(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i8mf4_b32(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_i8mf8_b64(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u16m1_b16(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u16m2_b8(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u16m4_b4(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u16m8_b2(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u16mf2_b32(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u16mf4_b64(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 16, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 16, 16, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u32m1_b32(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u32m2_b16(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u32m4_b8(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u32m8_b4(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u32mf2_b64(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 32, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 32, 32, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u64m1_b64(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u64m2_b32(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u64m4_b16(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u64m8_b8(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 64, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 64, 64, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u8m1_b8(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u8m2_b4(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u8m4_b2(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u8m8_b1(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u8mf2_b16(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u8mf4_b32(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline MaskVector __riscv_vmsbc_vxm_u8mf8_b64(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term aw = fold_bvzext(tm, 1, a);
    Term bw = fold_bvzext(tm, 1, b);
    Term s = fold_bvsub(tm, aw, bw);
    Term cinw = fold_bvzext(tm, 8, cin1);
    s = fold_bvsub(tm, s, cinw);
    r.push_back(fold_bvextract(tm, 8, 8, s));
  }
  return MaskVector(tm, r);
}
inline RVVVector __riscv_vsbc_vvm_i16m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_i16m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_i16m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_i16m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_i16mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_i16mf4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_i32m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_i32m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_i32m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_i32m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_i32mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_i64m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vvm_i64m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vvm_i64m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vvm_i64m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vvm_i8m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_i8m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_i8m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_i8m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_i8mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_i8mf4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_i8mf8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_u16m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_u16m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_u16m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_u16m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_u16mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_u16mf4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vvm_u32m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_u32m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_u32m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_u32m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_u32mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vvm_u64m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vvm_u64m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vvm_u64m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vvm_u64m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vvm_u8m1(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_u8m2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_u8m4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_u8m8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_u8mf2(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_u8mf4(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vvm_u8mf8(const RVVVector& op1, const RVVVector& op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = op2.getElement(i);
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_i16m1(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_i16m2(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_i16m4(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_i16m8(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_i16mf2(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_i16mf4(const RVVVector& op1, int16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_i32m1(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_i32m2(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_i32m4(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_i32m8(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_i32mf2(const RVVVector& op1, int32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_i64m1(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vxm_i64m2(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vxm_i64m4(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vxm_i64m8(const RVVVector& op1, int64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vxm_i8m1(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_i8m2(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_i8m4(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_i8m8(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_i8mf2(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_i8mf4(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_i8mf8(const RVVVector& op1, int8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_u16m1(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_u16m2(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_u16m4(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_u16m8(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_u16mf2(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_u16mf4(const RVVVector& op1, uint16_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 16, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 15, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 16, r);
}
inline RVVVector __riscv_vsbc_vxm_u32m1(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_u32m2(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_u32m4(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_u32m8(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_u32mf2(const RVVVector& op1, uint32_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 32, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 31, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 32, r);
}
inline RVVVector __riscv_vsbc_vxm_u64m1(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vxm_u64m2(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vxm_u64m4(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vxm_u64m8(const RVVVector& op1, uint64_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 64, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 63, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 64, r);
}
inline RVVVector __riscv_vsbc_vxm_u8m1(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_u8m2(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_u8m4(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_u8m8(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_u8mf2(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_u8mf4(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
inline RVVVector __riscv_vsbc_vxm_u8mf8(const RVVVector& op1, uint8_t op2, const MaskVector& carryin, size_t vl) {
  auto& tm = g_ctx->tm;
  std::vector<Term> r; r.reserve(vl);
  Term sb = mk_bv_val(tm, 8, (int64_t)op2);
  for (size_t i = 0; i < vl; i++) {
    Term a = op1.getElement(i);
    Term b = sb;
    Term cin1 = carryin.getBit(i);
    Term cin = fold_bvzext(tm, 7, cin1);
    r.push_back(fold_bvsub(tm, fold_bvsub(tm, a, b), cin));
  }
  return RVVVector(tm, 8, r);
}
}
