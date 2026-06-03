#pragma once
// RVV unit-stride & mask load/store — generated coverage (bw).
#include "../intrinsics.hpp"
namespace salt {
inline RVVVector __riscv_vle16_v_i16m8(const int16_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16_v_i16mf2(const int16_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16_v_i16mf4(const int16_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16_v_u16m8(const uint16_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16_v_u16mf4(const uint16_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_i16m1(const int16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_i16m2(const int16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_i16m4(const int16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_i16m8(const int16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_i16mf2(const int16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_i16mf4(const int16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_u16m1(const uint16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_u16m2(const uint16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_u16m4(const uint16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_u16m8(const uint16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_u16mf2(const uint16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle16ff_v_u16mf4(const uint16_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 16);
}
inline RVVVector __riscv_vle32_v_i32mf2(const int32_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32_v_u32m8(const uint32_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32_v_u32mf2(const uint32_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_i32m1(const int32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_i32m2(const int32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_i32m4(const int32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_i32m8(const int32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_i32mf2(const int32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_u32m1(const uint32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_u32m2(const uint32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_u32m4(const uint32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_u32m8(const uint32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle32ff_v_u32mf2(const uint32_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 32);
}
inline RVVVector __riscv_vle64_v_i64m1(const int64_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64_v_i64m2(const int64_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64_v_i64m4(const int64_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64_v_i64m8(const int64_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64_v_u64m1(const uint64_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64_v_u64m2(const uint64_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64_v_u64m4(const uint64_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64_v_u64m8(const uint64_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64ff_v_i64m1(const int64_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64ff_v_i64m2(const int64_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64ff_v_i64m4(const int64_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64ff_v_i64m8(const int64_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64ff_v_u64m1(const uint64_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64ff_v_u64m2(const uint64_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64ff_v_u64m4(const uint64_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle64ff_v_u64m8(const uint64_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 64);
}
inline RVVVector __riscv_vle8_v_i8m8(const int8_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8_v_i8mf2(const int8_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8_v_i8mf4(const int8_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8_v_i8mf8(const int8_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8_v_u8m8(const uint8_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8_v_u8mf2(const uint8_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8_v_u8mf4(const uint8_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8_v_u8mf8(const uint8_t* base, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_i8m1(const int8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_i8m2(const int8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_i8m4(const int8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_i8m8(const int8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_i8mf2(const int8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_i8mf4(const int8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_i8mf8(const int8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_u8m1(const uint8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_u8m2(const uint8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_u8m4(const uint8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_u8m8(const uint8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_u8mf2(const uint8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_u8mf4(const uint8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline RVVVector __riscv_vle8ff_v_u8mf8(const uint8_t* base, size_t* new_vl, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  *new_vl = vl;
  return b.loadRVV(b.ptrToByteOffset(base), vl, 8);
}
inline vbool1_t __riscv_vlm_v_b1(const uint8_t* base, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  std::vector<Term> bits; bits.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term byte = b.loadScalar(off + (i / 8), 8);
    unsigned lo = (unsigned)(i % 8);
    bits.push_back(tm.mk_term(Kind::BV_EXTRACT, {byte}, {(uint64_t)lo, (uint64_t)lo}));
  }
  return MaskVector(tm, bits);
}
inline vbool16_t __riscv_vlm_v_b16(const uint8_t* base, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  std::vector<Term> bits; bits.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term byte = b.loadScalar(off + (i / 8), 8);
    unsigned lo = (unsigned)(i % 8);
    bits.push_back(tm.mk_term(Kind::BV_EXTRACT, {byte}, {(uint64_t)lo, (uint64_t)lo}));
  }
  return MaskVector(tm, bits);
}
inline vbool2_t __riscv_vlm_v_b2(const uint8_t* base, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  std::vector<Term> bits; bits.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term byte = b.loadScalar(off + (i / 8), 8);
    unsigned lo = (unsigned)(i % 8);
    bits.push_back(tm.mk_term(Kind::BV_EXTRACT, {byte}, {(uint64_t)lo, (uint64_t)lo}));
  }
  return MaskVector(tm, bits);
}
inline vbool32_t __riscv_vlm_v_b32(const uint8_t* base, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  std::vector<Term> bits; bits.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term byte = b.loadScalar(off + (i / 8), 8);
    unsigned lo = (unsigned)(i % 8);
    bits.push_back(tm.mk_term(Kind::BV_EXTRACT, {byte}, {(uint64_t)lo, (uint64_t)lo}));
  }
  return MaskVector(tm, bits);
}
inline vbool4_t __riscv_vlm_v_b4(const uint8_t* base, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  std::vector<Term> bits; bits.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term byte = b.loadScalar(off + (i / 8), 8);
    unsigned lo = (unsigned)(i % 8);
    bits.push_back(tm.mk_term(Kind::BV_EXTRACT, {byte}, {(uint64_t)lo, (uint64_t)lo}));
  }
  return MaskVector(tm, bits);
}
inline vbool64_t __riscv_vlm_v_b64(const uint8_t* base, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  std::vector<Term> bits; bits.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term byte = b.loadScalar(off + (i / 8), 8);
    unsigned lo = (unsigned)(i % 8);
    bits.push_back(tm.mk_term(Kind::BV_EXTRACT, {byte}, {(uint64_t)lo, (uint64_t)lo}));
  }
  return MaskVector(tm, bits);
}
inline vbool8_t __riscv_vlm_v_b8(const uint8_t* base, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  std::vector<Term> bits; bits.reserve(vl);
  for (size_t i = 0; i < vl; i++) {
    Term byte = b.loadScalar(off + (i / 8), 8);
    unsigned lo = (unsigned)(i % 8);
    bits.push_back(tm.mk_term(Kind::BV_EXTRACT, {byte}, {(uint64_t)lo, (uint64_t)lo}));
  }
  return MaskVector(tm, bits);
}
inline void __riscv_vse16_v_i16m8(int16_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 16, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse16_v_i16mf2(int16_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 16, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse16_v_i16mf4(int16_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 16, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse16_v_u16m8(uint16_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 16, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse16_v_u16mf4(uint16_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 16, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse32_v_i32mf2(int32_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 32, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse32_v_u32m8(uint32_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 32, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse32_v_u32mf2(uint32_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 32, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse64_v_i64m1(int64_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 64, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse64_v_i64m2(int64_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 64, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse64_v_i64m4(int64_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 64, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse64_v_i64m8(int64_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 64, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse64_v_u64m1(uint64_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 64, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse64_v_u64m2(uint64_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 64, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse64_v_u64m4(uint64_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 64, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse64_v_u64m8(uint64_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 64, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse8_v_i8m8(int8_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 8, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse8_v_i8mf2(int8_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 8, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse8_v_i8mf4(int8_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 8, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse8_v_i8mf8(int8_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 8, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse8_v_u8m8(uint8_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 8, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse8_v_u8mf2(uint8_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 8, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse8_v_u8mf4(uint8_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 8, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vse8_v_u8mf8(uint8_t* base, const RVVVector& value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++) lanes.push_back(value.getElement(i));
  RVVVector trimmed(tm, 8, lanes);
  b.storeRVV(b.ptrToByteOffset(base), trimmed);
}
inline void __riscv_vsm_v_b1(uint8_t* base, vbool1_t value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  size_t nbytes = (vl + 7) / 8;
  for (size_t k = 0; k < nbytes; k++) {
    Term byte = mk_bv_val(tm, 8, (int64_t)0);
    for (unsigned j = 0; j < 8; j++) {
      size_t idx = k * 8 + j;
      if (idx >= vl) break;
      Term bit = value.getBit(idx);
      Term placed = fold_bvshl(tm, fold_bvzext(tm, 7, bit), mk_bv_val(tm, 8, (int64_t)j));
      byte = fold_bvor(tm, byte, placed);
    }
    b.storeScalar(off + k, byte, 8);
  }
}
inline void __riscv_vsm_v_b16(uint8_t* base, vbool16_t value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  size_t nbytes = (vl + 7) / 8;
  for (size_t k = 0; k < nbytes; k++) {
    Term byte = mk_bv_val(tm, 8, (int64_t)0);
    for (unsigned j = 0; j < 8; j++) {
      size_t idx = k * 8 + j;
      if (idx >= vl) break;
      Term bit = value.getBit(idx);
      Term placed = fold_bvshl(tm, fold_bvzext(tm, 7, bit), mk_bv_val(tm, 8, (int64_t)j));
      byte = fold_bvor(tm, byte, placed);
    }
    b.storeScalar(off + k, byte, 8);
  }
}
inline void __riscv_vsm_v_b2(uint8_t* base, vbool2_t value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  size_t nbytes = (vl + 7) / 8;
  for (size_t k = 0; k < nbytes; k++) {
    Term byte = mk_bv_val(tm, 8, (int64_t)0);
    for (unsigned j = 0; j < 8; j++) {
      size_t idx = k * 8 + j;
      if (idx >= vl) break;
      Term bit = value.getBit(idx);
      Term placed = fold_bvshl(tm, fold_bvzext(tm, 7, bit), mk_bv_val(tm, 8, (int64_t)j));
      byte = fold_bvor(tm, byte, placed);
    }
    b.storeScalar(off + k, byte, 8);
  }
}
inline void __riscv_vsm_v_b32(uint8_t* base, vbool32_t value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  size_t nbytes = (vl + 7) / 8;
  for (size_t k = 0; k < nbytes; k++) {
    Term byte = mk_bv_val(tm, 8, (int64_t)0);
    for (unsigned j = 0; j < 8; j++) {
      size_t idx = k * 8 + j;
      if (idx >= vl) break;
      Term bit = value.getBit(idx);
      Term placed = fold_bvshl(tm, fold_bvzext(tm, 7, bit), mk_bv_val(tm, 8, (int64_t)j));
      byte = fold_bvor(tm, byte, placed);
    }
    b.storeScalar(off + k, byte, 8);
  }
}
inline void __riscv_vsm_v_b4(uint8_t* base, vbool4_t value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  size_t nbytes = (vl + 7) / 8;
  for (size_t k = 0; k < nbytes; k++) {
    Term byte = mk_bv_val(tm, 8, (int64_t)0);
    for (unsigned j = 0; j < 8; j++) {
      size_t idx = k * 8 + j;
      if (idx >= vl) break;
      Term bit = value.getBit(idx);
      Term placed = fold_bvshl(tm, fold_bvzext(tm, 7, bit), mk_bv_val(tm, 8, (int64_t)j));
      byte = fold_bvor(tm, byte, placed);
    }
    b.storeScalar(off + k, byte, 8);
  }
}
inline void __riscv_vsm_v_b64(uint8_t* base, vbool64_t value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  size_t nbytes = (vl + 7) / 8;
  for (size_t k = 0; k < nbytes; k++) {
    Term byte = mk_bv_val(tm, 8, (int64_t)0);
    for (unsigned j = 0; j < 8; j++) {
      size_t idx = k * 8 + j;
      if (idx >= vl) break;
      Term bit = value.getBit(idx);
      Term placed = fold_bvshl(tm, fold_bvzext(tm, 7, bit), mk_bv_val(tm, 8, (int64_t)j));
      byte = fold_bvor(tm, byte, placed);
    }
    b.storeScalar(off + k, byte, 8);
  }
}
inline void __riscv_vsm_v_b8(uint8_t* base, vbool8_t value, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  size_t off = b.ptrToByteOffset(base);
  size_t nbytes = (vl + 7) / 8;
  for (size_t k = 0; k < nbytes; k++) {
    Term byte = mk_bv_val(tm, 8, (int64_t)0);
    for (unsigned j = 0; j < 8; j++) {
      size_t idx = k * 8 + j;
      if (idx >= vl) break;
      Term bit = value.getBit(idx);
      Term placed = fold_bvshl(tm, fold_bvzext(tm, 7, bit), mk_bv_val(tm, 8, (int64_t)j));
      byte = fold_bvor(tm, byte, placed);
    }
    b.storeScalar(off + k, byte, 8);
  }
}
}
