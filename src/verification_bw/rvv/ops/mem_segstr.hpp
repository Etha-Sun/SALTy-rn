#pragma once
// RVV strided segment load/store (vlsseg/vssseg).
#include "../intrinsics.hpp"
namespace salt {

inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_i16m1x2(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_i16m2x2(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_i16m4x2(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_i16mf2x2(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_i16mf4x2(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_u16m1x2(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_u16m2x2(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_u16m4x2(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_u16mf2x2(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e16_v_u16mf4x2(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e32_v_i32m1x2(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e32_v_i32m2x2(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e32_v_i32m4x2(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e32_v_i32mf2x2(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e32_v_u32m1x2(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e32_v_u32m2x2(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e32_v_u32m4x2(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e32_v_u32mf2x2(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e64_v_i64m1x2(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e64_v_i64m2x2(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e64_v_i64m4x2(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e64_v_u64m1x2(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e64_v_u64m2x2(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e64_v_u64m4x2(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_i8m1x2(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_i8m2x2(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_i8m4x2(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_i8mf2x2(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_i8mf4x2(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_i8mf8x2(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_u8m1x2(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_u8m2x2(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_u8m4x2(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_u8mf2x2(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_u8mf4x2(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,2> __riscv_vlsseg2e8_v_u8mf8x2(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,2> r;
  for (size_t f = 0; f < 2; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e16_v_i16m1x3(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e16_v_i16m2x3(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e16_v_i16mf2x3(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e16_v_i16mf4x3(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e16_v_u16m1x3(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e16_v_u16m2x3(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e16_v_u16mf2x3(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e16_v_u16mf4x3(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e32_v_i32m1x3(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e32_v_i32m2x3(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e32_v_i32mf2x3(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e32_v_u32m1x3(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e32_v_u32m2x3(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e32_v_u32mf2x3(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e64_v_i64m1x3(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e64_v_i64m2x3(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e64_v_u64m1x3(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e64_v_u64m2x3(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_i8m1x3(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_i8m2x3(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_i8mf2x3(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_i8mf4x3(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_i8mf8x3(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_u8m1x3(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_u8m2x3(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_u8mf2x3(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_u8mf4x3(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,3> __riscv_vlsseg3e8_v_u8mf8x3(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,3> r;
  for (size_t f = 0; f < 3; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e16_v_i16m1x4(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e16_v_i16m2x4(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e16_v_i16mf2x4(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e16_v_i16mf4x4(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e16_v_u16m1x4(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e16_v_u16m2x4(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e16_v_u16mf2x4(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e16_v_u16mf4x4(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e32_v_i32m1x4(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e32_v_i32m2x4(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e32_v_i32mf2x4(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e32_v_u32m1x4(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e32_v_u32m2x4(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e32_v_u32mf2x4(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e64_v_i64m1x4(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e64_v_i64m2x4(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e64_v_u64m1x4(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e64_v_u64m2x4(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_i8m1x4(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_i8m2x4(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_i8mf2x4(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_i8mf4x4(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_i8mf8x4(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_u8m1x4(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_u8m2x4(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_u8mf2x4(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_u8mf4x4(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,4> __riscv_vlsseg4e8_v_u8mf8x4(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,4> r;
  for (size_t f = 0; f < 4; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e16_v_i16m1x5(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e16_v_i16mf2x5(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e16_v_i16mf4x5(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e16_v_u16m1x5(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e16_v_u16mf2x5(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e16_v_u16mf4x5(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e32_v_i32m1x5(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e32_v_i32mf2x5(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e32_v_u32m1x5(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e32_v_u32mf2x5(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e64_v_i64m1x5(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e64_v_u64m1x5(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e8_v_i8m1x5(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e8_v_i8mf2x5(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e8_v_i8mf4x5(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e8_v_i8mf8x5(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e8_v_u8m1x5(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e8_v_u8mf2x5(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e8_v_u8mf4x5(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,5> __riscv_vlsseg5e8_v_u8mf8x5(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,5> r;
  for (size_t f = 0; f < 5; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e16_v_i16m1x6(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e16_v_i16mf2x6(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e16_v_i16mf4x6(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e16_v_u16m1x6(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e16_v_u16mf2x6(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e16_v_u16mf4x6(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e32_v_i32m1x6(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e32_v_i32mf2x6(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e32_v_u32m1x6(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e32_v_u32mf2x6(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e64_v_i64m1x6(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e64_v_u64m1x6(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e8_v_i8m1x6(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e8_v_i8mf2x6(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e8_v_i8mf4x6(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e8_v_i8mf8x6(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e8_v_u8m1x6(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e8_v_u8mf2x6(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e8_v_u8mf4x6(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,6> __riscv_vlsseg6e8_v_u8mf8x6(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,6> r;
  for (size_t f = 0; f < 6; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e16_v_i16m1x7(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e16_v_i16mf2x7(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e16_v_i16mf4x7(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e16_v_u16m1x7(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e16_v_u16mf2x7(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e16_v_u16mf4x7(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e32_v_i32m1x7(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e32_v_i32mf2x7(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e32_v_u32m1x7(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e32_v_u32mf2x7(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e64_v_i64m1x7(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e64_v_u64m1x7(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e8_v_i8m1x7(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e8_v_i8mf2x7(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e8_v_i8mf4x7(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e8_v_i8mf8x7(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e8_v_u8m1x7(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e8_v_u8mf2x7(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e8_v_u8mf4x7(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,7> __riscv_vlsseg7e8_v_u8mf8x7(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,7> r;
  for (size_t f = 0; f < 7; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e16_v_i16m1x8(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e16_v_i16mf2x8(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e16_v_i16mf4x8(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e16_v_u16m1x8(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e16_v_u16mf2x8(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e16_v_u16mf4x8(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*2, 16));
    r.val[f] = RVVVector(tm, 16, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e32_v_i32m1x8(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e32_v_i32mf2x8(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e32_v_u32m1x8(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e32_v_u32mf2x8(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*4, 32));
    r.val[f] = RVVVector(tm, 32, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e64_v_i64m1x8(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e64_v_u64m1x8(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*8, 64));
    r.val[f] = RVVVector(tm, 64, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e8_v_i8m1x8(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e8_v_i8mf2x8(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e8_v_i8mf4x8(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e8_v_i8mf8x8(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e8_v_u8m1x8(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e8_v_u8mf2x8(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e8_v_u8mf4x8(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline VectorTuple<RVVVector,8> __riscv_vlsseg8e8_v_u8mf8x8(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm; auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  VectorTuple<RVVVector,8> r;
  for (size_t f = 0; f < 8; f++) {
    std::vector<Term> lanes; lanes.reserve(vl);
    for (size_t i = 0; i < vl; i++) lanes.push_back(b.loadScalar(o + i*(size_t)bstride + f*1, 8));
    r.val[f] = RVVVector(tm, 8, lanes);
  }
  return r;
}
inline void __riscv_vssseg2e16_v_i16m1x2(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_i16m2x2(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_i16m4x2(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_i16mf2x2(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_i16mf4x2(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_u16m1x2(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_u16m2x2(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_u16m4x2(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_u16mf2x2(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e16_v_u16mf4x2(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg2e32_v_i32m1x2(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg2e32_v_i32m2x2(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg2e32_v_i32m4x2(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg2e32_v_i32mf2x2(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg2e32_v_u32m1x2(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg2e32_v_u32m2x2(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg2e32_v_u32m4x2(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg2e32_v_u32mf2x2(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg2e64_v_i64m1x2(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg2e64_v_i64m2x2(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg2e64_v_i64m4x2(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg2e64_v_u64m1x2(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg2e64_v_u64m2x2(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg2e64_v_u64m4x2(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg2e8_v_i8m1x2(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_i8m2x2(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_i8m4x2(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_i8mf2x2(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_i8mf4x2(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_i8mf8x2(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_u8m1x2(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_u8m2x2(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_u8m4x2(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_u8mf2x2(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_u8mf4x2(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg2e8_v_u8mf8x2(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,2>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 2; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e16_v_i16m1x3(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg3e16_v_i16m2x3(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg3e16_v_i16mf2x3(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg3e16_v_i16mf4x3(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg3e16_v_u16m1x3(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg3e16_v_u16m2x3(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg3e16_v_u16mf2x3(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg3e16_v_u16mf4x3(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg3e32_v_i32m1x3(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg3e32_v_i32m2x3(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg3e32_v_i32mf2x3(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg3e32_v_u32m1x3(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg3e32_v_u32m2x3(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg3e32_v_u32mf2x3(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg3e64_v_i64m1x3(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg3e64_v_i64m2x3(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg3e64_v_u64m1x3(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg3e64_v_u64m2x3(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg3e8_v_i8m1x3(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_i8m2x3(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_i8mf2x3(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_i8mf4x3(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_i8mf8x3(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_u8m1x3(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_u8m2x3(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_u8mf2x3(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_u8mf4x3(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg3e8_v_u8mf8x3(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,3>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 3; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e16_v_i16m1x4(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg4e16_v_i16m2x4(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg4e16_v_i16mf2x4(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg4e16_v_i16mf4x4(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg4e16_v_u16m1x4(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg4e16_v_u16m2x4(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg4e16_v_u16mf2x4(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg4e16_v_u16mf4x4(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg4e32_v_i32m1x4(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg4e32_v_i32m2x4(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg4e32_v_i32mf2x4(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg4e32_v_u32m1x4(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg4e32_v_u32m2x4(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg4e32_v_u32mf2x4(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg4e64_v_i64m1x4(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg4e64_v_i64m2x4(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg4e64_v_u64m1x4(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg4e64_v_u64m2x4(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg4e8_v_i8m1x4(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_i8m2x4(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_i8mf2x4(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_i8mf4x4(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_i8mf8x4(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_u8m1x4(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_u8m2x4(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_u8mf2x4(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_u8mf4x4(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg4e8_v_u8mf8x4(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,4>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 4; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg5e16_v_i16m1x5(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg5e16_v_i16mf2x5(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg5e16_v_i16mf4x5(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg5e16_v_u16m1x5(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg5e16_v_u16mf2x5(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg5e16_v_u16mf4x5(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg5e32_v_i32m1x5(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg5e32_v_i32mf2x5(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg5e32_v_u32m1x5(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg5e32_v_u32mf2x5(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg5e64_v_i64m1x5(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg5e64_v_u64m1x5(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg5e8_v_i8m1x5(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg5e8_v_i8mf2x5(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg5e8_v_i8mf4x5(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg5e8_v_i8mf8x5(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg5e8_v_u8m1x5(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg5e8_v_u8mf2x5(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg5e8_v_u8mf4x5(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg5e8_v_u8mf8x5(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,5>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 5; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg6e16_v_i16m1x6(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg6e16_v_i16mf2x6(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg6e16_v_i16mf4x6(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg6e16_v_u16m1x6(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg6e16_v_u16mf2x6(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg6e16_v_u16mf4x6(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg6e32_v_i32m1x6(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg6e32_v_i32mf2x6(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg6e32_v_u32m1x6(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg6e32_v_u32mf2x6(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg6e64_v_i64m1x6(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg6e64_v_u64m1x6(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg6e8_v_i8m1x6(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg6e8_v_i8mf2x6(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg6e8_v_i8mf4x6(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg6e8_v_i8mf8x6(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg6e8_v_u8m1x6(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg6e8_v_u8mf2x6(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg6e8_v_u8mf4x6(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg6e8_v_u8mf8x6(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,6>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 6; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg7e16_v_i16m1x7(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg7e16_v_i16mf2x7(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg7e16_v_i16mf4x7(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg7e16_v_u16m1x7(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg7e16_v_u16mf2x7(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg7e16_v_u16mf4x7(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg7e32_v_i32m1x7(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg7e32_v_i32mf2x7(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg7e32_v_u32m1x7(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg7e32_v_u32mf2x7(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg7e64_v_i64m1x7(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg7e64_v_u64m1x7(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg7e8_v_i8m1x7(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg7e8_v_i8mf2x7(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg7e8_v_i8mf4x7(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg7e8_v_i8mf8x7(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg7e8_v_u8m1x7(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg7e8_v_u8mf2x7(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg7e8_v_u8mf4x7(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg7e8_v_u8mf8x7(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,7>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 7; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg8e16_v_i16m1x8(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg8e16_v_i16mf2x8(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg8e16_v_i16mf4x8(int16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg8e16_v_u16m1x8(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg8e16_v_u16mf2x8(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg8e16_v_u16mf4x8(uint16_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*2, v.val[f].getElement(i), 16);
}
inline void __riscv_vssseg8e32_v_i32m1x8(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg8e32_v_i32mf2x8(int32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg8e32_v_u32m1x8(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg8e32_v_u32mf2x8(uint32_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*4, v.val[f].getElement(i), 32);
}
inline void __riscv_vssseg8e64_v_i64m1x8(int64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg8e64_v_u64m1x8(uint64_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*8, v.val[f].getElement(i), 64);
}
inline void __riscv_vssseg8e8_v_i8m1x8(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg8e8_v_i8mf2x8(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg8e8_v_i8mf4x8(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg8e8_v_i8mf8x8(int8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg8e8_v_u8m1x8(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg8e8_v_u8mf2x8(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg8e8_v_u8mf4x8(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}
inline void __riscv_vssseg8e8_v_u8mf8x8(uint8_t* base, ptrdiff_t bstride, const VectorTuple<RVVVector,8>& v, size_t vl) {
  auto& b = g_ctx->findBuffer(base); size_t o = b.ptrToByteOffset(base);
  for (size_t f = 0; f < 8; f++)
    for (size_t i = 0; i < vl; i++) b.storeScalar(o + i*(size_t)bstride + f*1, v.val[f].getElement(i), 8);
}

} // namespace salt
