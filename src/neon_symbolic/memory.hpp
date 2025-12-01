#ifndef NEON_SYMBOLIC_MEMORY_HPP
#define NEON_SYMBOLIC_MEMORY_HPP

#include "../symbolic_common.hpp"
#include "types.hpp"
#include <cstdint>
#include <map>
#include <vector>

// Global storage indexed by memory address for load/store tracking
inline std::map<uintptr_t, std::vector<int32x4_t>> g_neon_memory;
inline std::map<uintptr_t, std::vector<int8x16_t>> g_neon_memory_i8x16;
inline std::map<uintptr_t, std::vector<int8x8_t>> g_neon_memory_i8x8;
inline std::map<uintptr_t, std::vector<uint8x16_t>> g_neon_memory_u8x16;
inline std::map<uintptr_t, std::vector<uint8x8_t>> g_neon_memory_u8x8;

// Global storage for scalar reduction results
inline std::map<std::string, Term> g_neon_scalar_results;

// ============================================================================
// Load Operations
// ============================================================================

/**
 * vld1q_s32: Load vector of 32-bit integers
 * Returns previously stored value if available, otherwise creates fresh
 * symbolic constants
 */
inline int32x4_t vld1q_s32(const int32_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  // Check if this address was previously stored to
  auto it = g_neon_memory.find(addr);
  if (it != g_neon_memory.end() && !it->second.empty()) {
    return it->second.back();
  }

  return int32x4_t(g_symbolic_tm);
}

/**
 * vld1q_s8: Load vector of 8-bit integers (128-bit)
 */
inline int8x16_t vld1q_s8(const int8_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  auto it = g_neon_memory_i8x16.find(addr);
  if (it != g_neon_memory_i8x16.end() && !it->second.empty()) {
    return it->second.back();
  }

  // Otherwise, create fresh symbolic values
  return int8x16_t(g_symbolic_tm);
}

/**
 * vld1_s8: Load vector of 8-bit integers (64-bit)
 */
inline int8x8_t vld1_s8(const int8_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  auto it = g_neon_memory_i8x8.find(addr);
  if (it != g_neon_memory_i8x8.end() && !it->second.empty()) {
    return it->second.back();
  }

  // Fallback: Check 128-bit memory map and extract lower half
  auto it128 = g_neon_memory_i8x16.find(addr);
  if (it128 != g_neon_memory_i8x16.end() && !it128->second.empty()) {
    const int8x16_t &vec128 = it128->second.back();
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
      lanes[i] = vec128.getLane(i);
    }
    return int8x8_t(g_symbolic_tm, lanes);
  }

  // Additional fallback: Search for overlapping 128-bit vector
  // E.g., loading from addr=56 might overlap with vector at addr=48
  for (auto it = g_neon_memory_i8x16.begin(); it != g_neon_memory_i8x16.end(); ++it) {
    uintptr_t base_addr = it->first;
    // Check if addr falls within [base_addr, base_addr+16)
    if (addr >= base_addr && addr < base_addr + 16 && !it->second.empty()) {
      const int8x16_t &vec128 = it->second.back();
      size_t offset = addr - base_addr;
      std::array<Term, 8> lanes;
      for (int i = 0; i < 8 && (offset + i) < 16; i++) {
        lanes[i] = vec128.getLane(offset + i);
      }
      // Pad remaining lanes if we're at the edge
      for (size_t i = (16 - offset); i < 8; i++) {
        lanes[i] = vec128.getLane(15);  // Pad with last element
      }
      return int8x8_t(g_symbolic_tm, lanes);
    }
  }

  return int8x8_t(g_symbolic_tm);
}

/**
 * vld1q_u8: Load vector of 8-bit unsigned integers (128-bit)
 */
inline uint8x16_t vld1q_u8(const uint8_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  auto it = g_neon_memory_u8x16.find(addr);
  if (it != g_neon_memory_u8x16.end() && !it->second.empty()) {
    return it->second.back();
  }

  // Otherwise, create fresh symbolic values
  return uint8x16_t(g_symbolic_tm);
}

/**
 * vld1_u8: Load vector of 8-bit unsigned integers (64-bit)
 */
inline uint8x8_t vld1_u8(const uint8_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  auto it = g_neon_memory_u8x8.find(addr);
  if (it != g_neon_memory_u8x8.end() && !it->second.empty()) {
    return it->second.back();
  }

  // Fallback: Check 128-bit memory map and extract lower half
  auto it128 = g_neon_memory_u8x16.find(addr);
  if (it128 != g_neon_memory_u8x16.end() && !it128->second.empty()) {
    const uint8x16_t &vec128 = it128->second.back();
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
      lanes[i] = vec128.getLane(i);
    }
    return uint8x8_t(g_symbolic_tm, lanes);
  }

  return uint8x8_t(g_symbolic_tm);
}

// ============================================================================
// Store Operations
// ============================================================================

/**
 * vst1q_s32: Store vector of 32-bit integers
 */
inline void vst1q_s32(int32_t *ptr, const int32x4_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory[addr].push_back(vec);
}

/**
 * vst1q_s8: Store vector of 8-bit integers (128-bit)
 */
inline void vst1q_s8(int8_t *ptr, const int8x16_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_i8x16[addr].push_back(vec);
}

/**
 * vst1_s8: Store vector of 8-bit integers (64-bit)
 */
inline void vst1_s8(int8_t *ptr, const int8x8_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_i8x8[addr].push_back(vec);
}

/**
 * vst1q_u8: Store vector of 8-bit unsigned integers (128-bit)
 */
inline void vst1q_u8(uint8_t *ptr, const uint8x16_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_u8x16[addr].push_back(vec);
}

/**
 * vst1_u8: Store vector of 8-bit unsigned integers (64-bit)
 */
inline void vst1_u8(uint8_t *ptr, const uint8x8_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_u8x8[addr].push_back(vec);
}

// ============================================================================
// Store Lane Operations
// ============================================================================

/**
 * vst1_lane_u32: Store 4 bytes (lane 0 of uint32x2_t = first 4 bytes)
 */
inline void vst1_lane_u32(void *ptr, const uint32x2_t &vec, int lane) {
  (void)lane;
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Extract first 4 int8_t elements from the uint32x2_t
  // uint32x2_t represents 2 uint32_t = 8 bytes = 8 int8_t
  // Lane 0 is the first uint32_t = first 4 bytes
  std::array<Term, 8> lanes;        // int8x8_t needs 8 lanes
  Term lane0_term = vec.getLane(0); // First uint32_t
  for (int i = 0; i < 4; i++) {
    // Extract byte i from the uint32x2_t
    // The uint32x2_t lanes are stored as 2 uint32_t terms
    // We need to extract bytes 0-3 from lane 0
    Op extract_op = g_symbolic_tm->mkOp(
        Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(i * 8 + 7), static_cast<uint32_t>(i * 8)});
    lanes[i] = g_symbolic_tm->mkTerm(extract_op, {lane0_term});
  }
  // Pad remaining lanes with last element
  for (int i = 4; i < 8; i++) {
    lanes[i] = lanes[3];
  }
  // Store as int8x8_t
  g_neon_memory_i8x8[addr].push_back(int8x8_t(g_symbolic_tm, lanes));
}

/**
 * vst1_lane_u16: Store 2 bytes (lane 0 of uint16x4_t = first 2 bytes)
 */
inline void vst1_lane_u16(void *ptr, const uint16x4_t &vec, int lane) {
  (void)lane;
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Extract first 2 int8_t elements from the uint16x4_t
  std::array<Term, 2> lanes;
  Term lane0_term = vec.getLane(0); // First uint16_t
  for (int i = 0; i < 2; i++) {
    Op extract_op = g_symbolic_tm->mkOp(
        Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(i * 8 + 7), static_cast<uint32_t>(i * 8)});
    lanes[i] = g_symbolic_tm->mkTerm(extract_op, {lane0_term});
  }
  // Store as int8x8_t (we'll only use first 2 elements)
  // Pad with the same value for remaining lanes
  std::array<Term, 8> full_lanes;
  for (int i = 0; i < 2; i++) {
    full_lanes[i] = lanes[i];
  }
  for (int i = 2; i < 8; i++) {
    full_lanes[i] = lanes[1]; // Pad with last element
  }
  g_neon_memory_i8x8[addr].push_back(int8x8_t(g_symbolic_tm, full_lanes));
}

/**
 * vst1_lane_s8: Store 1 byte (lane 0 of int8x8_t)
 */
inline void vst1_lane_s8(int8_t *ptr, const int8x8_t &vec, int lane) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Extract single byte from lane 0
  Term lane0_term = vec.getLane(lane);
  std::array<Term, 1> lanes = {lane0_term};
  // Store as int8x8_t (we'll only use first element)
  std::array<Term, 8> full_lanes;
  full_lanes[0] = lane0_term;
  for (int i = 1; i < 8; i++) {
    full_lanes[i] = lane0_term; // Pad with same value
  }
  g_neon_memory_i8x8[addr].push_back(int8x8_t(g_symbolic_tm, full_lanes));
}

/**
 * vst1_lane_u8: Store 1 byte (specified lane of uint8x8_t)
 */
inline void vst1_lane_u8(uint8_t *ptr, const uint8x8_t &vec, int lane) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Extract single byte from specified lane
  Term lane_term = vec.getLane(lane);
  // Store as uint8x8_t (we'll only use first element)
  std::array<Term, 8> full_lanes;
  full_lanes[0] = lane_term;
  for (int i = 1; i < 8; i++) {
    full_lanes[i] = lane_term; // Pad with same value
  }
  g_neon_memory_u8x8[addr].push_back(uint8x8_t(g_symbolic_tm, full_lanes));
}

#endif // NEON_SYMBOLIC_MEMORY_HPP
