#pragma once
// RVV strided load/store — generated coverage (bw).
#include "../intrinsics.hpp"
namespace salt {
inline RVVVector __riscv_vlse16_v_i16m1(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_i16m2(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_i16m4(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_i16m8(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_i16mf2(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_i16mf4(const int16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_u16m1(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_u16m2(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_u16m4(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_u16m8(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_u16mf2(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse16_v_u16mf4(const uint16_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 16));
  return RVVVector(tm, 16, lanes);
}
inline RVVVector __riscv_vlse32_v_i32m1(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_i32m2(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_i32m4(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_i32m8(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_i32mf2(const int32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_u32m1(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_u32m2(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_u32m4(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_u32m8(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse32_v_u32mf2(const uint32_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 32));
  return RVVVector(tm, 32, lanes);
}
inline RVVVector __riscv_vlse64_v_i64m1(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 64));
  return RVVVector(tm, 64, lanes);
}
inline RVVVector __riscv_vlse64_v_i64m2(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 64));
  return RVVVector(tm, 64, lanes);
}
inline RVVVector __riscv_vlse64_v_i64m4(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 64));
  return RVVVector(tm, 64, lanes);
}
inline RVVVector __riscv_vlse64_v_i64m8(const int64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 64));
  return RVVVector(tm, 64, lanes);
}
inline RVVVector __riscv_vlse64_v_u64m1(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 64));
  return RVVVector(tm, 64, lanes);
}
inline RVVVector __riscv_vlse64_v_u64m2(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 64));
  return RVVVector(tm, 64, lanes);
}
inline RVVVector __riscv_vlse64_v_u64m4(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 64));
  return RVVVector(tm, 64, lanes);
}
inline RVVVector __riscv_vlse64_v_u64m8(const uint64_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 64));
  return RVVVector(tm, 64, lanes);
}
inline RVVVector __riscv_vlse8_v_i8m1(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_i8m2(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_i8m4(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_i8m8(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_i8mf2(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_i8mf4(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_i8mf8(const int8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_u8m1(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_u8m2(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_u8m4(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_u8m8(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_u8mf2(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_u8mf4(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline RVVVector __riscv_vlse8_v_u8mf8(const uint8_t* base, ptrdiff_t bstride, size_t vl) {
  auto& tm = g_ctx->tm;
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  std::vector<Term> lanes; lanes.reserve(vl);
  for (size_t i = 0; i < vl; i++)
    lanes.push_back(b.loadScalar((size_t)(off + (ptrdiff_t)i * bstride), 8));
  return RVVVector(tm, 8, lanes);
}
inline void __riscv_vsse16_v_i16m1(int16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_i16m2(int16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_i16m4(int16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_i16m8(int16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_i16mf2(int16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_i16mf4(int16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_u16m1(uint16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_u16m2(uint16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_u16m4(uint16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_u16m8(uint16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_u16mf2(uint16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse16_v_u16mf4(uint16_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 16);
}
inline void __riscv_vsse32_v_i32m1(int32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_i32m2(int32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_i32m4(int32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_i32m8(int32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_i32mf2(int32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_u32m1(uint32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_u32m2(uint32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_u32m4(uint32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_u32m8(uint32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse32_v_u32mf2(uint32_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 32);
}
inline void __riscv_vsse64_v_i64m1(int64_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 64);
}
inline void __riscv_vsse64_v_i64m2(int64_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 64);
}
inline void __riscv_vsse64_v_i64m4(int64_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 64);
}
inline void __riscv_vsse64_v_i64m8(int64_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 64);
}
inline void __riscv_vsse64_v_u64m1(uint64_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 64);
}
inline void __riscv_vsse64_v_u64m2(uint64_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 64);
}
inline void __riscv_vsse64_v_u64m4(uint64_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 64);
}
inline void __riscv_vsse64_v_u64m8(uint64_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 64);
}
inline void __riscv_vsse8_v_i8m1(int8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_i8m2(int8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_i8m4(int8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_i8m8(int8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_i8mf2(int8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_i8mf4(int8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_i8mf8(int8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_u8m1(uint8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_u8m2(uint8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_u8m4(uint8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_u8m8(uint8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_u8mf2(uint8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_u8mf4(uint8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
inline void __riscv_vsse8_v_u8mf8(uint8_t* base, ptrdiff_t bstride, const RVVVector& value, size_t vl) {
  auto& b = g_ctx->findBuffer(base);
  ptrdiff_t off = (ptrdiff_t)b.ptrToByteOffset(base);
  for (size_t i = 0; i < vl; i++)
    b.storeScalar((size_t)(off + (ptrdiff_t)i * bstride), value.getElement(i), 8);
}
}
