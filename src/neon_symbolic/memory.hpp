#ifndef NEON_SYMBOLIC_MEMORY_HPP
#define NEON_SYMBOLIC_MEMORY_HPP

#include "../symbolic_common.hpp"
#include "../symbolic_scalar_types.hpp"
#include "types.hpp"
#include <cstdint>
#include <map>
#include <vector>

// Global storage indexed by memory address for load/store tracking
inline std::map<uintptr_t, std::vector<int32x4_t>> g_neon_memory;
inline std::map<uintptr_t, std::vector<int32x2_t>> g_neon_memory_i32x2;
inline std::map<uintptr_t, std::vector<int8x16_t>> g_neon_memory_i8x16;
inline std::map<uintptr_t, std::vector<int8x8_t>> g_neon_memory_i8x8;
inline std::map<uintptr_t, std::vector<uint8x16_t>> g_neon_memory_u8x16;
inline std::map<uintptr_t, std::vector<uint8x8_t>> g_neon_memory_u8x8;
inline std::map<uintptr_t, std::vector<uint16x8_t>> g_neon_memory_u16x8;
inline std::map<uintptr_t, std::vector<uint16x4_t>> g_neon_memory_u16x4;
inline std::map<uintptr_t, std::vector<uint32x4_t>> g_neon_memory_u32x4;
inline std::map<uintptr_t, std::vector<uint32x2_t>> g_neon_memory_u32x2;
inline std::map<uintptr_t, std::vector<float32x4_t>> g_neon_memory_f32x4;
inline std::map<uintptr_t, std::vector<float32x2_t>> g_neon_memory_f32x2;

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
 * vld1q_s32: Overload for const void* (common in XNNPACK code)
 */
inline int32x4_t vld1q_s32(const void *ptr) {
  return vld1q_s32(reinterpret_cast<const int32_t*>(ptr));
}

/**
 * vld1q_u32: Load vector of 32-bit unsigned integers
 * Returns previously stored value if available, otherwise creates fresh
 * symbolic constants
 */
inline uint32x4_t vld1q_u32(const uint32_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  // Check if this address was previously stored to (exact match)
  auto it = g_neon_memory_u32x4.find(addr);
  if (it != g_neon_memory_u32x4.end() && !it->second.empty()) {
    return it->second.back();
  }

  return uint32x4_t(g_symbolic_tm);
}

/**
 * vld1q_u32: Overload for const void* (common in XNNPACK code)
 */
inline uint32x4_t vld1q_u32(const void *ptr) {
  return vld1q_u32(reinterpret_cast<const uint32_t*>(ptr));
}

/**
 * vld1_u32: Load vector of 32-bit unsigned integers (64-bit, 2 elements)
 */
inline uint32x2_t vld1_u32(const uint32_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  // Check if this address was previously stored to
  auto it = g_neon_memory_u32x2.find(addr);
  if (it != g_neon_memory_u32x2.end() && !it->second.empty()) {
    return it->second.back();
  }

  // Check if addr falls within a stored uint32x4
  auto it4 = g_neon_memory_u32x4.find(addr);
  if (it4 != g_neon_memory_u32x4.end() && !it4->second.empty()) {
    const uint32x4_t &vec4 = it4->second.back();
    std::array<Term, 2> lanes;
    lanes[0] = vec4.getLane(0);
    lanes[1] = vec4.getLane(1);
    return uint32x2_t(g_symbolic_tm, lanes);
  }

  // Check if addr is offset by 2 elements (8 bytes) from start of uint32x4
  uintptr_t base = addr - 8;
  it4 = g_neon_memory_u32x4.find(base);
  if (it4 != g_neon_memory_u32x4.end() && !it4->second.empty()) {
    const uint32x4_t &vec4 = it4->second.back();
    std::array<Term, 2> lanes;
    lanes[0] = vec4.getLane(2);
    lanes[1] = vec4.getLane(3);
    return uint32x2_t(g_symbolic_tm, lanes);
  }

  return uint32x2_t(g_symbolic_tm);
}

/**
 * vld1_u32: Overload for const void* (common in XNNPACK code)
 */
inline uint32x2_t vld1_u32(const void *ptr) {
  return vld1_u32(reinterpret_cast<const uint32_t*>(ptr));
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

  std::array<Term, 16> lanes;
  bool has_concrete = false;
  try {
    for (int i = 0; i < 16; i++) {
      int8_t val = ptr[i];  
      lanes[i] = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(static_cast<uint8_t>(val)));
    }
    has_concrete = true;
  } catch (...) {
    has_concrete = false;
  }
  
  if (has_concrete) {
    return int8x16_t(g_symbolic_tm, lanes);
  }

  // Otherwise, create fresh symbolic values
  return int8x16_t(g_symbolic_tm);
}

/**
 * vld1_s8: Load vector of 8-bit integers (64-bit)
 */
inline int8x8_t vld1_s8(const int8_t *ptr) {
  uintptr_t start_addr = reinterpret_cast<uintptr_t>(ptr);
  std::array<Term, 8> lanes;
  Term zero = g_symbolic_tm->mkBitVector(8, 0);

  for (int i = 0; i < 8; i++) {
    uintptr_t curr = start_addr + i;
    bool found = false;
    
    // Check exact match in i8x8
    if (g_neon_memory_i8x8.count(curr) && !g_neon_memory_i8x8[curr].empty()) {
        lanes[i] = g_neon_memory_i8x8[curr].back().getLane(0); 
        found = true;
    }

    if (!found) {
        // Scan i8x16 map using upper_bound to find the most specific overlapping vector
        auto it = g_neon_memory_i8x16.upper_bound(curr);
        if (it != g_neon_memory_i8x16.begin()) {
            --it;
            uintptr_t base = it->first;
            if (curr >= base && curr < base + 16 && !it->second.empty()) {
                lanes[i] = it->second.back().getLane(curr - base);
                found = true;
            }
        }
    }
    
    if (!found) {
        // Scan i8x8 map
        for (auto it = g_neon_memory_i8x8.begin(); it != g_neon_memory_i8x8.end(); ++it) {
            uintptr_t base = it->first;
            if (curr >= base && curr < base + 8 && !it->second.empty()) {
                lanes[i] = it->second.back().getLane(curr - base);
                found = true;
                break;
            }
        }
    }
    
    if (!found) {
        lanes[i] = zero;
    }
  }
  return int8x8_t(g_symbolic_tm, lanes);
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

  // Overlap search - check if addr falls within a stored vector
  // This spans multiple vectors if needed for 16-element load
  for (const auto& entry : g_neon_memory_u8x16) {
    uintptr_t base_addr = entry.first;
    if (!entry.second.empty()) {
      const size_t vec_size = 16;
      if (addr >= base_addr && addr < base_addr + vec_size) {
        // Found overlap - extract 16 elements starting at offset
        // May need to span into the next vector
        size_t offset = addr - base_addr;
        const uint8x16_t &vec128 = entry.second.back();
        std::array<Term, 16> lanes;
        for (int i = 0; i < 16; i++) {
          if (offset + i < 16) {
            lanes[i] = vec128.getLane(offset + i);
          } else {
            // Need to get from the next vector
            uintptr_t next_addr = base_addr + 16;
            auto next_it = g_neon_memory_u8x16.find(next_addr);
            if (next_it != g_neon_memory_u8x16.end() && !next_it->second.empty()) {
              const uint8x16_t &next_vec = next_it->second.back();
              size_t next_offset = (offset + i) - 16;
              lanes[i] = next_vec.getLane(next_offset);
            } else {
              lanes[i] = g_symbolic_tm->mkBitVector(8, 0);
            }
          }
        }
        return uint8x16_t(g_symbolic_tm, lanes);
      }
    }
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

  // Check 128-bit memory map - exact match at addr
  auto it128 = g_neon_memory_u8x16.find(addr);
  if (it128 != g_neon_memory_u8x16.end() && !it128->second.empty()) {
    const uint8x16_t &vec128 = it128->second.back();
    std::array<Term, 8> lanes;
    for (int i = 0; i < 8; i++) {
      lanes[i] = vec128.getLane(i);
    }
    return uint8x8_t(g_symbolic_tm, lanes);
  }

  // Overlap search in 128-bit memory map - check if addr falls within a stored vector
  // This now spans multiple vectors if needed
  for (const auto& entry : g_neon_memory_u8x16) {
    uintptr_t base_addr = entry.first;
    if (!entry.second.empty()) {
      // 16 elements per uint8x16_t, 1 byte each = 16 bytes
      const size_t vec_size = 16;
      if (addr >= base_addr && addr < base_addr + vec_size) {
        // Found overlap - extract 8 elements starting at offset
        // May need to span into the next vector
        size_t offset = addr - base_addr;
        const uint8x16_t &vec128 = entry.second.back();
        std::array<Term, 8> lanes;
        for (int i = 0; i < 8; i++) {
          if (offset + i < 16) {
            lanes[i] = vec128.getLane(offset + i);
          } else {
            // Need to get from the next vector
            uintptr_t next_addr = base_addr + 16;
            auto next_it = g_neon_memory_u8x16.find(next_addr);
            if (next_it != g_neon_memory_u8x16.end() && !next_it->second.empty()) {
              const uint8x16_t &next_vec = next_it->second.back();
              size_t next_offset = (offset + i) - 16;
              lanes[i] = next_vec.getLane(next_offset);
            } else {
              lanes[i] = g_symbolic_tm->mkBitVector(8, 0);
            }
          }
        }
        return uint8x8_t(g_symbolic_tm, lanes);
      }
    }
  }

  // If not found in symbolic memory, read concrete values from the actual memory
  // This handles cases like loading from static const arrays (e.g., permutation tables)
  std::array<Term, 8> lanes;
  for (int i = 0; i < 8; i++) {
    lanes[i] = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(ptr[i]));
  }
  return uint8x8_t(g_symbolic_tm, lanes);
}

/**
 * vld1_u8: Overload for const void* (common in XNNPACK code)
 */
inline uint8x8_t vld1_u8(const void *ptr) {
  return vld1_u8(reinterpret_cast<const uint8_t*>(ptr));
}

/**
 * vld1q_u16: Load vector of 16-bit unsigned integers (128-bit, 8 elements)
 */
inline uint16x8_t vld1q_u16(const uint16_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  auto it = g_neon_memory_u16x8.find(addr);
  if (it != g_neon_memory_u16x8.end() && !it->second.empty()) {
    return it->second.back();
  }

  // Try to read concrete values from memory
  std::array<Term, 8> lanes;
  bool has_concrete = false;
  try {
    for (int i = 0; i < 8; i++) {
      uint16_t val = ptr[i];
      lanes[i] = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(val));
    }
    has_concrete = true;
  } catch (...) {
    has_concrete = false;
  }

  if (has_concrete) {
    return uint16x8_t(g_symbolic_tm, lanes);
  }

  // Otherwise, create fresh symbolic values
  return uint16x8_t(g_symbolic_tm);
}

/**
 * vld1q_u16: Overload for const void* (common in XNNPACK code)
 */
inline uint16x8_t vld1q_u16(const void *ptr) {
  return vld1q_u16(reinterpret_cast<const uint16_t*>(ptr));
}

/**
 * vld1_u16: Load vector of 16-bit unsigned integers (64-bit, 4 elements)
 */
inline uint16x4_t vld1_u16(const uint16_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  auto it = g_neon_memory_u16x4.find(addr);
  if (it != g_neon_memory_u16x4.end() && !it->second.empty()) {
    return it->second.back();
  }

  // Check if addr falls within a stored uint16x8
  auto it8 = g_neon_memory_u16x8.find(addr);
  if (it8 != g_neon_memory_u16x8.end() && !it8->second.empty()) {
    const uint16x8_t &vec8 = it8->second.back();
    std::array<Term, 4> lanes;
    lanes[0] = vec8.getLane(0);
    lanes[1] = vec8.getLane(1);
    lanes[2] = vec8.getLane(2);
    lanes[3] = vec8.getLane(3);
    return uint16x4_t(g_symbolic_tm, lanes);
  }

  // Check if addr is offset by 4 elements (8 bytes) from start of uint16x8
  uintptr_t base = addr - 8;
  it8 = g_neon_memory_u16x8.find(base);
  if (it8 != g_neon_memory_u16x8.end() && !it8->second.empty()) {
    const uint16x8_t &vec8 = it8->second.back();
    std::array<Term, 4> lanes;
    lanes[0] = vec8.getLane(4);
    lanes[1] = vec8.getLane(5);
    lanes[2] = vec8.getLane(6);
    lanes[3] = vec8.getLane(7);
    return uint16x4_t(g_symbolic_tm, lanes);
  }

  return uint16x4_t(g_symbolic_tm);
}

/**
 * vld1_u16: Overload for const void* (common in XNNPACK code)
 */
inline uint16x4_t vld1_u16(const void *ptr) {
  return vld1_u16(reinterpret_cast<const uint16_t*>(ptr));
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
 * vld1_s32: Load vector of 32-bit integers (64-bit, 2 elements)
 */
inline int32x2_t vld1_s32(const int32_t *ptr) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  auto it = g_neon_memory_i32x2.find(addr);
  if (it != g_neon_memory_i32x2.end() && !it->second.empty()) {
    return it->second.back();
  }

  // Fallback: Check g_neon_memory (int32x4)
  // Case 1: addr matches start of int32x4
  auto it4 = g_neon_memory.find(addr);
  if (it4 != g_neon_memory.end() && !it4->second.empty()) {
      const int32x4_t &vec4 = it4->second.back();
      std::array<Term, 2> lanes;
      lanes[0] = vec4.getLane(0);
      lanes[1] = vec4.getLane(1);
      return int32x2_t(g_symbolic_tm, lanes);
  }
  
  // Case 2: addr is offset by 2 ints (8 bytes) from start of int32x4
  uintptr_t base = addr - 8;
  it4 = g_neon_memory.find(base);
  if (it4 != g_neon_memory.end() && !it4->second.empty()) {
      const int32x4_t &vec4 = it4->second.back();
      std::array<Term, 2> lanes;
      lanes[0] = vec4.getLane(2);
      lanes[1] = vec4.getLane(3);
      return int32x2_t(g_symbolic_tm, lanes);
  }

  return int32x2_t(g_symbolic_tm);
}

/**
 * vst1_s32: Store vector of 32-bit integers (64-bit, 2 elements)
 */
inline void vst1_s32(int32_t *ptr, const int32x2_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_i32x2[addr].push_back(vec);
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
 * vst1q_u8: Overload for void* (common in XNNPACK code)
 */
inline void vst1q_u8(void *ptr, const uint8x16_t &vec) {
  vst1q_u8(reinterpret_cast<uint8_t*>(ptr), vec);
}

/**
 * vst1q_u32: Store vector of 32-bit unsigned integers (128-bit)
 */
inline void vst1q_u32(uint32_t *ptr, const uint32x4_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_u32x4[addr].push_back(vec);
}

/**
 * vst1_u32: Store vector of 32-bit unsigned integers (64-bit, 2 elements)
 */
inline void vst1_u32(uint32_t *ptr, const uint32x2_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_u32x2[addr].push_back(vec);
}

/**
 * vst1q_f32: Store vector of 32-bit floating-point values (128-bit)
 */
inline void vst1q_f32(float *ptr, const float32x4_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_f32x4[addr].push_back(vec);
}

/**
 * vst1_f32: Store vector of 32-bit floating-point values (64-bit, 2 elements)
 */
inline void vst1_f32(float *ptr, const float32x2_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_f32x2[addr].push_back(vec);
}

/**
 * vst1_u8: Store vector of 8-bit unsigned integers (64-bit)
 */
inline void vst1_u8(uint8_t *ptr, const uint8x8_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_u8x8[addr].push_back(vec);
}

/**
 * vst1_u8: Overload for void* (common in XNNPACK code)
 */
inline void vst1_u8(void *ptr, const uint8x8_t &vec) {
  vst1_u8(reinterpret_cast<uint8_t*>(ptr), vec);
}

// ============================================================================
// Store Lane Operations
// ============================================================================

/**
 * vst1_lane_u32: Store 4 bytes from specified lane of uint32x2_t
 */
inline void vst1_lane_u32(void *ptr, const uint32x2_t &vec, int lane) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Extract 4 bytes from the specified lane of uint32x2_t
  std::array<Term, 8> lanes;
  Term lane_term = vec.getLane(lane);
  for (int i = 0; i < 4; i++) {
    Op extract_op = g_symbolic_tm->mkOp(
        Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(i * 8 + 7), static_cast<uint32_t>(i * 8)});
    lanes[i] = g_symbolic_tm->mkTerm(extract_op, {lane_term});
  }
  // Pad remaining lanes with last element
  for (int i = 4; i < 8; i++) {
    lanes[i] = lanes[3];
  }
  // Store as uint8x8_t for unsigned byte collection
  g_neon_memory_u8x8[addr].push_back(uint8x8_t(g_symbolic_tm, lanes));
}

/**
 * vst1q_lane_u32: Store a single 32-bit value from specified lane of uint32x4_t
 *
 * @param ptr Pointer to memory location to store to
 * @param vec Input vector containing the value to store
 * @param lane Lane index (0-3) to store
 */
inline void vst1q_lane_u32(uint32_t *ptr, const uint32x4_t &vec, const int lane) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Store as scalar in g_neon_scalar_memory for proper collection
  g_neon_scalar_memory[addr] = vec.getLane(lane);
}

/**
 * vst1q_lane_u32: Overload for void* (common in XNNPACK code)
 */
inline void vst1q_lane_u32(void *ptr, const uint32x4_t &vec, const int lane) {
  vst1q_lane_u32(reinterpret_cast<uint32_t*>(ptr), vec, lane);
}

/**
 * vst1_lane_u16: Store 2 bytes from specified lane of uint16x4_t
 */
inline void vst1_lane_u16(void *ptr, const uint16x4_t &vec, int lane) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Extract 2 bytes from the specified lane of uint16x4_t
  std::array<Term, 2> byte_lanes;
  Term lane_term = vec.getLane(lane);
  for (int i = 0; i < 2; i++) {
    Op extract_op = g_symbolic_tm->mkOp(
        Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(i * 8 + 7), static_cast<uint32_t>(i * 8)});
    byte_lanes[i] = g_symbolic_tm->mkTerm(extract_op, {lane_term});
  }
  // Store as uint8x8_t (we'll only use first 2 elements)
  std::array<Term, 8> full_lanes;
  for (int i = 0; i < 2; i++) {
    full_lanes[i] = byte_lanes[i];
  }
  for (int i = 2; i < 8; i++) {
    full_lanes[i] = byte_lanes[1]; // Pad with last element
  }
  g_neon_memory_u8x8[addr].push_back(uint8x8_t(g_symbolic_tm, full_lanes));
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

/**
 * vst1_lane_u8: Overload for void* (common in XNNPACK code)
 */
inline void vst1_lane_u8(void *ptr, const uint8x8_t &vec, int lane) {
  vst1_lane_u8(reinterpret_cast<uint8_t*>(ptr), vec, lane);
}

/**
 * vst1_lane_f32: Store a single lane from float32x2_t to memory
 */
inline void vst1_lane_f32(float *ptr, const float32x2_t &vec, int lane) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Extract the specified lane (single float)
  Term lane_term = vec.getLane(lane);
  // Store as float32x2_t with the lane value
  std::array<Term, 2> full_lanes;
  full_lanes[0] = lane_term;
  full_lanes[1] = lane_term; // Pad with same value
  g_neon_memory_f32x2[addr].push_back(float32x2_t(g_symbolic_tm, full_lanes));
}

// ============================================================================
// Multi-Vector Store Operations (uint32)
// ============================================================================

/**
 * vst4q_u32: Store 4 uint32x4_t vectors to memory (interleaved)
 *
 * Stores 4 vectors with interleaved element ordering.
 * Memory layout: [v0[0], v1[0], v2[0], v3[0], v0[1], v1[1], v2[1], v3[1], ...]
 *
 * @param ptr Pointer to memory location to store to (16 consecutive uint32 values)
 * @param vec Tuple of 4 vectors to store
 */
inline void vst4q_u32(uint32_t *ptr, const uint32x4x4_t &vec) {
  // Store each vector's lanes interleaved as individual scalars
  // Memory layout: [v0[0], v1[0], v2[0], v3[0], v0[1], v1[1], v2[1], v3[1], ...]
  for (int lane = 0; lane < 4; lane++) {
    for (int v = 0; v < 4; v++) {
      uintptr_t addr = reinterpret_cast<uintptr_t>(ptr + lane * 4 + v);
      // Store as scalar in g_neon_scalar_memory for proper collection
      g_neon_scalar_memory[addr] = vec.val[v].getLane(lane);
    }
  }
}

// ============================================================================
// Load Lane Operations (uint32)
// ============================================================================

/**
 * vld1q_lane_u32: Load a single uint32 value into a specific lane of a vector
 *
 * Loads a single 32-bit value from memory and inserts it into the specified
 * lane of the input vector, returning a new vector with the updated lane.
 *
 * @param ptr Pointer to memory location to load from
 * @param vec Input vector (other lanes are preserved)
 * @param lane Lane index (0-3) to insert the loaded value
 * @return New vector with the specified lane updated
 */
inline uint32x4_t vld1q_lane_u32(const uint32_t* ptr, const uint32x4_t& vec, const int lane) {
    std::array<Term, 4> lanes;
    for (int i = 0; i < 4; i++) {
        lanes[i] = vec.getLane(i);
    }

    // Look up symbolic value from memory
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
    Term loaded_value;

    // Search for this address in symbolic memory
    bool found = false;
    for (const auto& entry : g_neon_memory_u32x4) {
        uintptr_t base_addr = entry.first;
        if (!entry.second.empty()) {
            const uint32x4_t& base_vec = entry.second.back();
            // Check if addr falls within this vector (4 elements * 4 bytes = 16 bytes)
            if (addr >= base_addr && addr < base_addr + 16) {
                size_t offset_elems = (addr - base_addr) / sizeof(uint32_t);
                if (offset_elems < 4) {
                    loaded_value = base_vec.getLane(offset_elems);
                    found = true;
                    break;
                }
            }
        }
    }

    if (!found) {
        // Fall back to concrete value if not in symbolic memory
        loaded_value = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(*ptr));
    }

    lanes[lane] = loaded_value;
    return uint32x4_t(g_symbolic_tm, lanes);
}

// ============================================================================
// uint16 Store Operations
// ============================================================================

/**
 * vst1q_u16: Store vector of 16-bit unsigned integers (128-bit)
 */
inline void vst1q_u16(uint16_t *ptr, const uint16x8_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_u16x8[addr].push_back(vec);
}

/**
 * vst1_u16: Store vector of 16-bit unsigned integers (64-bit)
 */
inline void vst1_u16(uint16_t *ptr, const uint16x4_t &vec) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  g_neon_memory_u16x4[addr].push_back(vec);
}

/**
 * vst1_lane_u16: Store a single lane from uint16x4_t to memory
 */
inline void vst1_lane_u16(uint16_t *ptr, const uint16x4_t &vec, int lane) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
  // Extract the specified lane (2 bytes)
  Term lane_term = vec.getLane(lane);
  // Extract individual bytes from the uint16
  std::array<Term, 8> full_lanes;
  for (int i = 0; i < 2; i++) {
    Op extract_op = g_symbolic_tm->mkOp(
        Kind::BITVECTOR_EXTRACT,
        {static_cast<uint32_t>(i * 8 + 7), static_cast<uint32_t>(i * 8)});
    full_lanes[i] = g_symbolic_tm->mkTerm(extract_op, {lane_term});
  }
  // Pad remaining lanes
  for (int i = 2; i < 8; i++) {
    full_lanes[i] = full_lanes[1];
  }
  g_neon_memory_i8x8[addr].push_back(int8x8_t(g_symbolic_tm, full_lanes));
}

#endif // NEON_SYMBOLIC_MEMORY_HPP
