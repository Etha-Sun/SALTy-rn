#ifndef RISCV_SYMBOLIC_INTRINSICS_HPP
#define RISCV_SYMBOLIC_INTRINSICS_HPP

#define __RISCV_VXRM_RNU 0
#define __RISCV_VXRM_RNE 1
#define __RISCV_VXRM_RDN 2
#define __RISCV_VXRM_ROD 3
#include "../symbolic_common.hpp"
#include "../symbolic_scalar_types.hpp"
#include "memory.hpp"
#include "types.hpp"
#include <cstdint>
#include <cstring>
#include <string>

/**
 * RISC-V Vector Extension Intrinsic Symbolic Implementations
 */

// ============================================================================
// Vector Length Setting Instructions
// ============================================================================

// Helper for rounded shift right (must be defined before usage)
inline Term roundedShiftRight(Term value, size_t shift, unsigned int vxrm) {
  if (shift == 0) {
    return value;
  }

  Term shift_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));

  // Arithmetic shift right
  Term shifted =
      g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, {value, shift_term});

  // Calculate rounding increment based on vxrm mode
  Term round_increment;

  switch (vxrm) {
  case 0: { // __RISCV_VXRM_RNU - Round to Nearest, ties Up
    // Round bit = bit[shift-1]
    // Increment if round_bit == 1
    Term shift_minus_one = g_symbolic_tm->mkBitVector(32, shift - 1);
    Term round_bit_pos =
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_LSHR, {value, shift_minus_one});
    Term round_bit = g_symbolic_tm->mkTerm(
        g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {0, 0}), {round_bit_pos});

    // Zero-extend to 32 bits
    round_increment = g_symbolic_tm->mkTerm(
        g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {31}), {round_bit});
    break;
  }

  case 1: { // __RISCV_VXRM_RNE - Round to Nearest, ties to Even
    // Round up if:
    // - bit[shift-1] == 1 AND (bit[shift-2:0] != 0 OR result is odd)
    Term shift_minus_one = g_symbolic_tm->mkBitVector(32, shift - 1);
    Term round_bit_pos =
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_LSHR, {value, shift_minus_one});
    Term round_bit = g_symbolic_tm->mkTerm(
        g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {0, 0}), {round_bit_pos});

    // Check if result (after shift) is odd
    Term lsb_of_shifted = g_symbolic_tm->mkTerm(
        g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {0, 0}), {shifted});

    // Check if any bits below round bit are set
    Term zero_bv = g_symbolic_tm->mkBitVector(32, 0);
    Term mask = g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB,
        {g_symbolic_tm->mkTerm(
             Kind::BITVECTOR_SHL,
             {g_symbolic_tm->mkBitVector(32, 1), shift_minus_one}),
         g_symbolic_tm->mkBitVector(32, 1)});
    Term lower_bits = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {value, mask});
    Term has_lower_bits =
        g_symbolic_tm->mkTerm(Kind::DISTINCT, {lower_bits, zero_bv});

    // Round up if round_bit AND (has_lower_bits OR lsb_of_shifted)
    Term one_bit = g_symbolic_tm->mkBitVector(1, 1);
    Term round_bit_set =
        g_symbolic_tm->mkTerm(Kind::EQUAL, {round_bit, one_bit});
    Term lsb_set =
        g_symbolic_tm->mkTerm(Kind::EQUAL, {lsb_of_shifted, one_bit});

    Term should_round = g_symbolic_tm->mkTerm(
        Kind::AND, {round_bit_set, g_symbolic_tm->mkTerm(
                                       Kind::OR, {has_lower_bits, lsb_set})});

    round_increment = g_symbolic_tm->mkTerm(
        Kind::ITE, {should_round, g_symbolic_tm->mkBitVector(32, 1), zero_bv});
    break;
  }

  case 2: { // __RISCV_VXRM_RDN - Round Down (truncate, towards -infinity)
    // Never round up
    round_increment = g_symbolic_tm->mkBitVector(32, 0);
    break;
  }

  case 3: { // __RISCV_VXRM_ROD - Round to Odd
    // If any discarded bits are non-zero, set LSB of result to 1
    Term zero_bv = g_symbolic_tm->mkBitVector(32, 0);
    Term mask = g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB,
        {g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL,
                               {g_symbolic_tm->mkBitVector(32, 1), shift_term}),
         g_symbolic_tm->mkBitVector(32, 1)});
    Term discarded_bits =
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {value, mask});
    Term has_discarded =
        g_symbolic_tm->mkTerm(Kind::DISTINCT, {discarded_bits, zero_bv});

    // Check if result is currently even
    Term lsb = g_symbolic_tm->mkTerm(
        g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {0, 0}), {shifted});
    Term is_even = g_symbolic_tm->mkTerm(
        Kind::EQUAL, {lsb, g_symbolic_tm->mkBitVector(1, 0)});

    // Round up (make odd) if has_discarded AND is_even
    Term should_round =
        g_symbolic_tm->mkTerm(Kind::AND, {has_discarded, is_even});
    round_increment = g_symbolic_tm->mkTerm(
        Kind::ITE, {should_round, g_symbolic_tm->mkBitVector(32, 1), zero_bv});
    break;
  }

  default:
    round_increment = g_symbolic_tm->mkBitVector(32, 0);
    break;
  }

  // Add rounding increment
  return g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {shifted, round_increment});
}

/**
 * __riscv_vsetvl_e32m1: Set vector length for 32-bit elements with LMUL=1
 * For symbolic execution, we limit vl to 8 to match XNNPACK's weight packing
 * which uses 8-channel blocks (e.g., 9p8c kernels)
 */
inline size_t __riscv_vsetvl_e32m1(size_t avl) {
  // Limit to 8 to match NEON block size for weight packing compatibility
  g_current_vl = std::min(avl, static_cast<size_t>(8));
  return g_current_vl;
}

/**
 * __riscv_vsetvl_e8m1: Set vector length for 8-bit elements with LMUL=1
 * For symbolic execution, we return avl unchanged to avoid artificial splitting
 */
inline size_t __riscv_vsetvl_e8m1(size_t avl) {
  g_current_vl = avl;
  return avl;
}

/**
 * __riscv_vsetvl_e8m2: Set vector length for 8-bit elements with LMUL=2
 * For symbolic execution, we return avl unchanged to avoid artificial splitting
 */
inline size_t __riscv_vsetvl_e8m2(size_t avl) {
  g_current_vl = avl;
  return avl;
}

/**
 * __riscv_vsetvl_e8m8: Set vector length for 8-bit elements with LMUL=8
 * For symbolic execution, we return avl unchanged to avoid artificial splitting
 */
inline size_t __riscv_vsetvl_e8m8(size_t avl) {
  g_current_vl = avl;
  return avl;
}

/**
 * __riscv_vsetvl_e16m1: Set vector length for 16-bit elements with LMUL=1
 * For symbolic execution, we return avl unchanged to avoid artificial splitting
 */
inline size_t __riscv_vsetvl_e16m1(size_t avl) {
  g_current_vl = avl;
  return avl;
}

// ============================================================================
// Load Operations
// ============================================================================
// Note: __riscv_vle8_v_i8m1 and __riscv_vse8_v_i8m1 are defined in memory.hpp

/**
 * __riscv_vle8_v_i8m2: Load 8-bit vector with LMUL=2
 */
inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t *base, size_t vl) {
  std::vector<Term> elements;
  elements.reserve(vl);

  uintptr_t base_addr = reinterpret_cast<uintptr_t>(base);

  // Check if we have pre-populated symbolic values for this address
  if (g_riscv_memory_i8.count(base_addr)) {
    const std::vector<vint8m1_t> &stored_history = g_riscv_memory_i8[base_addr];
    if (!stored_history.empty()) {
      const vint8m1_t &stored_val = stored_history.back();
      const std::vector<Term> &stored_terms = stored_val.getElements();
      for (size_t i = 0; i < vl; i++) {
        if (i < stored_terms.size()) {
          elements.push_back(stored_terms[i]);
        } else {
          // Fallback if we read past stored values
          elements.push_back(g_symbolic_tm->mkConst(
              g_symbolic_tm->mkBitVectorSort(8),
              "load_oob_" + std::to_string(base_addr + i)));
        }
      }
    } else {
      // History empty, treat as fresh
      for (size_t i = 0; i < vl; i++) {
        elements.push_back(
            g_symbolic_tm->mkConst(g_symbolic_tm->mkBitVectorSort(8),
                                   "load_" + std::to_string(base_addr + i)));
      }
    }
  } else {
    // Create fresh symbolic variables if memory not populated
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(
          g_symbolic_tm->mkConst(g_symbolic_tm->mkBitVectorSort(8),
                                 "load_" + std::to_string(base_addr + i)));
    }
  }

  return vint8m2_t(g_symbolic_tm, elements);
}

/**
 * __riscv_vse8_v_i8m2: Store 8-bit vector with LMUL=2
 */
inline void __riscv_vse8_v_i8m2(int8_t *base, vint8m2_t value, size_t vl) {
  uintptr_t base_addr = reinterpret_cast<uintptr_t>(base);
  std::vector<Term> stored_vals;
  stored_vals.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    stored_vals.push_back(value.getElement(i));
  }

  // Store in global memory map by wrapping in vint8m1_t (which holds
  // vector<Term>) This allows us to reuse the existing memory map structure
  vint8m1_t wrapper(g_symbolic_tm, stored_vals);
  g_riscv_memory_i8[base_addr].push_back(wrapper);
}

// ============================================================================
// Arithmetic Operations (int32m1)
// ============================================================================

inline vint32m1_t __riscv_vadd_vv_i32m1(const vint32m1_t &a,
                                        const vint32m1_t &b, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {a.getElement(i), b.getElement(i)}));
  }

  return vint32m1_t(g_symbolic_tm, result_elements);
}

inline vint32m1_t __riscv_vmul_vx_i32m1(const vint32m1_t &vec, int32_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_MULT, {vec.getElement(i), scalar_term}));
  }

  return vint32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Arithmetic Operations (int32m4)
// ============================================================================

/**
 * __riscv_vadd_vv_i32m4: Add two vectors element-wise (int32m4)
 */
inline vint32m4_t __riscv_vadd_vv_i32m4(const vint32m4_t &a,
                                        const vint32m4_t &b, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {a.getElement(i), b.getElement(i)}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vadd_vx_i32m4: Add scalar to vector (int32m4)
 */
inline vint32m4_t __riscv_vadd_vx_i32m4(const vint32m4_t &vec, int32_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {vec.getElement(i), scalar_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmul_vx_i32m4: Multiply vector by scalar (int32m4)
 */
inline vint32m4_t __riscv_vmul_vx_i32m4(const vint32m4_t &vec, int32_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_MULT, {vec.getElement(i), scalar_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Shift Operations
// ============================================================================

/**
 * __riscv_vsra_vx_i32m4: Arithmetic right shift by scalar
 */
inline vint32m4_t __riscv_vsra_vx_i32m4(const vint32m4_t &vec, uint32_t shift,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, // Arithmetic shift right
                              {vec.getElement(i), shift_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vssra_vx_i32m4: Saturating arithmetic right shift by scalar
 * Performs arithmetic shift right with saturation (clamps to min/max values)
 */
inline vint32m4_t __riscv_vssra_vx_i32m4(const vint32m4_t &vec, uint32_t shift,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // For saturating shift right, we need to check if the value would overflow
  // For signed integers, overflow only happens with negative values
  Term shift_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));
  Term zero = g_symbolic_tm->mkBitVector(32, 0);
  Term min_int32 = g_symbolic_tm->mkBitVector(32, 0x80000000); // INT32_MIN

  for (size_t i = 0; i < vl; i++) {
    Term elem = vec.getElement(i);
    
    // Check if negative
    Term is_negative = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {elem, zero});
    
    // Perform arithmetic shift right
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, {elem, shift_term});
    
    // For saturation: if the value is INT32_MIN and we shift, it stays INT32_MIN
    // This is the main saturation case for signed right shift
    Term is_min = g_symbolic_tm->mkTerm(Kind::EQUAL, {elem, min_int32});
    Term saturated = g_symbolic_tm->mkTerm(
        Kind::ITE, {is_min, min_int32, shifted});
    
    result_elements.push_back(saturated);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Comparison Operations
// ============================================================================

/**
 * __riscv_vmax_vx_i32m4: Maximum of vector and scalar
 */
inline vint32m4_t __riscv_vmax_vx_i32m4(const vint32m4_t &vec, int32_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    // max(a, b) = (a > b) ? a : b
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, // Signed greater than
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, // If-then-else
                              {cmp, vec.getElement(i), scalar_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmin_vx_i32m4: Minimum of vector and scalar
 */
inline vint32m4_t __riscv_vmin_vx_i32m4(const vint32m4_t &vec, int32_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    // min(a, b) = (a < b) ? a : b
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, // Signed less than
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Conversion Operations
// ============================================================================

/**
 * __riscv_vsext_vf4_i32m4: Sign-extend int8 to int32 (widening by 4x)
 */
inline vint32m4_t __riscv_vsext_vf4_i32m4(const vint8m1_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {24});
  for (size_t i = 0; i < vl; i++) {
    Term extended = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    result_elements.push_back(extended);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vncvt_x_x_w_i16m2: Narrow int32m4 to int16m2 (truncate upper bits)
 */
inline vint16m2_t __riscv_vncvt_x_x_w_i16m2(const vint32m4_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extract_op_16 = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});
  for (size_t i = 0; i < vl; i++) {
    // Extract lower 16 bits
    Term narrowed = g_symbolic_tm->mkTerm(extract_op_16, {vec.getElement(i)});
    result_elements.push_back(narrowed);
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vncvt_x_x_w_i8m1: Narrow int16m2 to int8m1 (truncate upper bits)
 */
inline vint8m1_t __riscv_vncvt_x_x_w_i8m1(const vint16m2_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extract_op_8 = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});
  for (size_t i = 0; i < vl; i++) {
    // Extract lower 8 bits
    Term narrowed = g_symbolic_tm->mkTerm(extract_op_8, {vec.getElement(i)});
    result_elements.push_back(narrowed);
  }

  return vint8m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Arithmetic Operations (int8m1)
// ============================================================================

/**
 * __riscv_vsub_vx_i8m1: Subtract scalar from vector (int8m1)
 */
inline vint8m1_t __riscv_vsub_vx_i8m1(const vint8m1_t &vec, int8_t scalar,
                                      size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint8_t scalar_u8 = static_cast<uint8_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar_u8));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {vec.getElement(i), scalar_term}));
  }

  return vint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsext_vf2_i32m4: Sign-extend int16m2 to int32m4 (widening by 2x)
 */
inline vint32m4_t __riscv_vsext_vf2_i32m4(const vint16m2_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
  for (size_t i = 0; i < vl; i++) {
    Term extended = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    result_elements.push_back(extended);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmacc_vx_i32m4: Multiply-accumulate (acc += vec * scalar) for int32m4
 */
inline vint32m4_t __riscv_vmacc_vx_i32m4(const vint32m4_t &acc, int32_t scalar,
                                         const vint32m4_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    Term product = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT,
                                         {vec.getElement(i), scalar_term});
    Term result = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD,
                                        {acc.getElement(i), product});
    result_elements.push_back(result);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsext_vf2_i16m2: Sign-extend int8m1 to int16m2 (widening by 2x)
 */
inline vint16m2_t __riscv_vsext_vf2_i16m2(const vint8m1_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
  for (size_t i = 0; i < vl; i++) {
    Term extended = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    result_elements.push_back(extended);
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsext_vf2_i16mf2: Sign-extend int8mf4 to int16mf2 (widening by 2x)
 */
inline vint16mf2_t __riscv_vsext_vf2_i16mf2(const vint8mf4_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
  for (size_t i = 0; i < vl; i++) {
    Term extended = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    result_elements.push_back(extended);
  }

  return vint16mf2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Arithmetic Operations (int16m2)
// ============================================================================

/**
 * __riscv_vadd_vx_i16m2: Add scalar to vector (int16m2)
 */
inline vint16m2_t __riscv_vadd_vx_i16m2(const vint16m2_t &vec, int16_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint16_t scalar_u16 = static_cast<uint16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_u16));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {vec.getElement(i), scalar_term}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsadd_vx_i16m2: Saturating add scalar to vector (int16m2)
 */
inline vint16m2_t __riscv_vsadd_vx_i16m2(const vint16m2_t &vec, int16_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int16_t scalar_ext = static_cast<int16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_ext));

  // Saturation constants
  Term max_val = g_symbolic_tm->mkBitVector(17, 32767);
  Term min_val = g_symbolic_tm->mkBitVector(17, static_cast<uint64_t>(-32768));

  Op sext_op =
      g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {1}); // Extend 16 to 17
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    // Sign extend to 17 bits to detect overflow
    Term a_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    Term b_ext = g_symbolic_tm->mkTerm(sext_op, {scalar_term});

    Term sum_ext = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {a_ext, b_ext});

    // Saturate
    Term gt_max =
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {sum_ext, max_val});
    Term lt_min =
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {sum_ext, min_val});

    Term saturated = g_symbolic_tm->mkTerm(
        Kind::ITE,
        {gt_max, max_val,
         g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, sum_ext})});

    // Extract lower 16 bits
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {saturated}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsadd_vx_i16m4: Saturating add scalar to vector (int16m4)
 */
inline vint16m4_t __riscv_vsadd_vx_i16m4(const vint16m4_t &vec, int16_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int16_t scalar_ext = static_cast<int16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_ext));

  // Saturation constants
  Term max_val = g_symbolic_tm->mkBitVector(17, 32767);
  Term min_val = g_symbolic_tm->mkBitVector(17, static_cast<uint64_t>(-32768));

  Op sext_op =
      g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {1}); // Extend 16 to 17
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    // Sign extend to 17 bits to detect overflow
    Term a_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    Term b_ext = g_symbolic_tm->mkTerm(sext_op, {scalar_term});

    Term sum_ext = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {a_ext, b_ext});

    // Saturate
    Term gt_max =
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {sum_ext, max_val});
    Term lt_min =
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {sum_ext, min_val});

    Term saturated = g_symbolic_tm->mkTerm(
        Kind::ITE,
        {gt_max, max_val,
         g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, sum_ext})});

    // Extract lower 16 bits
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {saturated}));
  }

  return vint16m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Comparison Operations (int8m1)
// ============================================================================

/**
 * __riscv_vmax_vx_i8m1: Maximum of vector and scalar (int8m1)
 */
inline vint8m1_t __riscv_vmax_vx_i8m1(const vint8m1_t &vec, int8_t scalar,
                                      size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint8_t scalar_u8 = static_cast<uint8_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar_u8));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT,
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint8m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Widening Arithmetic Operations
// ============================================================================

/**
 * __riscv_vwsub_vx_i16m2: Widening subtraction (int8 vector - int8 scalar ->
 * int16 vector)
 */
inline vint16m2_t __riscv_vwsub_vx_i16m2(const vint8m1_t &vec, int8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int16_t scalar_ext = static_cast<int16_t>(scalar);
  // Cast to uint16_t for bitvector creation to avoid sign extension issues in
  // mkBitVector if it expects unsigned
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint16_t>(scalar_ext));

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});

  for (size_t i = 0; i < vl; i++) {
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});

    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {vec_elem_ext, scalar_term}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwsub_vx_i16m4: Widening subtraction (int8m2 vector - int8 scalar ->
 * int16m4 vector)
 */
inline vint16m4_t __riscv_vwsub_vx_i16m4(const vint8m2_t &vec, int8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int16_t scalar_ext = static_cast<int16_t>(scalar);
  // Cast to uint16_t for bitvector creation to avoid sign extension issues in
  // mkBitVector if it expects unsigned
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint16_t>(scalar_ext));

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});

  for (size_t i = 0; i < vl; i++) {
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});

    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {vec_elem_ext, scalar_term}));
  }

  return vint16m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwadd_vx_i32m4: Widening addition (int16 vector + int16 scalar
 * -> int32 vector)
 */
inline vint32m4_t __riscv_vwadd_vx_i32m4(const vint16m2_t &vec, int16_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int32_t scalar_ext = static_cast<int32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint32_t>(scalar_ext));

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});

    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {vec_elem_ext, scalar_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwmul_vx_i32m4: Widening multiplication (int16 vector * int16 scalar
 * -> int32 vector)
 */
inline vint32m4_t __riscv_vwmul_vx_i32m4(const vint16m2_t &vec, int16_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int32_t scalar_ext = static_cast<int32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint32_t>(scalar_ext));

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});

    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_MULT, {vec_elem_ext, scalar_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwmul_vx_i32m8: Widening multiplication (int16 vector * int16 scalar
 * -> int32 vector) with LMUL=8
 */
inline vint32m8_t __riscv_vwmul_vx_i32m8(const vint16m4_t &vec, int16_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int32_t scalar_ext = static_cast<int32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint32_t>(scalar_ext));

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});

    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_MULT, {vec_elem_ext, scalar_term}));
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Narrowing Clip Operations
// ============================================================================

/**
 * __riscv_vnclip_wx_i16m2: Narrowing clip (int32 vector -> int16 vector)
 */
inline vint16m2_t __riscv_vnclip_wx_i16m2(const vint32m4_t &vec, size_t shift,
                                          unsigned int vxrm, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Only use lower 5 bits of shift (shift & 31)
  shift = shift & 31;

  // Saturation constants for int16
  Term max_val = g_symbolic_tm->mkBitVector(32, 32767);
  Term min_val = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(-32768));

  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    // 1. Rounded shift right
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);

    // 2. Clip/Saturate to int16
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});

    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});

    // 3. Extract lower 16 bits (already saturated, so this is just type
    // conversion)
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnclip_wx_i8m1: Narrowing clip (int16 vector -> int8 vector)
 */
inline vint8m1_t __riscv_vnclip_wx_i8m1(const vint16m2_t &vec, size_t shift,
                                        unsigned int vxrm, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Only use lower 4 bits of shift (shift & 15)
  shift = shift & 15;

  // Saturation constants for int8
  Term max_val = g_symbolic_tm->mkBitVector(16, 127);
  Term min_val = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(-128));

  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    // 1. Rounded shift right
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);

    // 2. Clip/Saturate to int8
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});

    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});

    // 3. Extract lower 8 bits (already saturated, so this is just type
    // conversion)
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmin_vx_i8m1: Minimum of vector and scalar (int8m1)
 */
inline vint8m1_t __riscv_vmin_vx_i8m1(const vint8m1_t &vec, int8_t scalar,
                                      size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint8_t scalar_u8 = static_cast<uint8_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar_u8));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT,
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint8m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Helper Functions
// ============================================================================

// Helper to convert a term to the expected bit-width
inline Term convertToWidthRV(Term term, size_t target_width) {
  size_t current_width = term.getSort().getBitVectorSize();
  if (current_width == target_width) {
    return term;
  } else if (current_width < target_width) {
    // Sign-extend to target width
    size_t extend_bits = target_width - current_width;
    Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND,
                                     {static_cast<uint32_t>(extend_bits)});
    return g_symbolic_tm->mkTerm(sext_op, {term});
  } else {
    // Extract lower bits to target width
    Op extract_op = g_symbolic_tm->mkOp(
        Kind::BITVECTOR_EXTRACT, {static_cast<uint32_t>(target_width - 1), 0});
    return g_symbolic_tm->mkTerm(extract_op, {term});
  }
}

// ============================================================================
// Store Operations
// ============================================================================

// ============================================================================

/**
 * __riscv_vadd_vx_i32m8: Add scalar to vector (int32m8)
 */
inline vint32m8_t __riscv_vadd_vx_i32m8(const vint32m8_t &vec, int32_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {vec.getElement(i), scalar_term}));
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Shift Operations (int32m8)
// ============================================================================

/**
 * __riscv_vsra_vx_i32m8: Arithmetic right shift by scalar (int32m8)
 */
inline vint32m8_t __riscv_vsra_vx_i32m8(const vint32m8_t &vec, uint32_t shift,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, // Arithmetic shift right
                              {vec.getElement(i), shift_term}));
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Narrowing Clip Operations
// ============================================================================

/**
 * __riscv_vnclip_wx_i16m4: Narrowing clip (int32m8 vector -> int16m4 vector)
 * Note: The generated code passes 0 for shift, but we implement full signature
 */
inline vint16m4_t __riscv_vnclip_wx_i16m4(const vint32m8_t &vec, size_t shift,
                                          size_t vl) {

  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  shift = shift & 31;
  unsigned int vxrm = __RISCV_VXRM_RNU; // Default assumption

  Term max_val = g_symbolic_tm->mkBitVector(32, 32767);
  Term min_val = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(-32768));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});
    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint16m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnclip_wx_i8m2: Narrowing clip (int16m4 vector -> int8m2 vector)
 */
inline vint8m2_t __riscv_vnclip_wx_i8m2(const vint16m4_t &vec, size_t shift,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  shift = shift & 15;
  unsigned int vxrm = __RISCV_VXRM_RNU;

  Term max_val = g_symbolic_tm->mkBitVector(16, 127);
  Term min_val = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(-128));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});
    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint8m2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Comparison Operations (int8m2)
// ============================================================================

/**
 * __riscv_vmax_vx_i8m2: Maximum of vector and scalar (int8m2)
 */
inline vint8m2_t __riscv_vmax_vx_i8m2(const vint8m2_t &vec, int8_t scalar,
                                      size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint8_t scalar_u8 = static_cast<uint8_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar_u8));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT,
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint8m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmin_vx_i8m2: Minimum of vector and scalar (int8m2)
 */
inline vint8m2_t __riscv_vmin_vx_i8m2(const vint8m2_t &vec, int8_t scalar,
                                      size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint8_t scalar_u8 = static_cast<uint8_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar_u8));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT,
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint8m2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Conversion Operations (int8m2 -> int16m4)
// ============================================================================

/**
 * __riscv_vsext_vf2_i16m4: Sign-extend int8 (LMUL=2) to int16 (LMUL=4)
 */
inline vint16m4_t __riscv_vsext_vf2_i16m4(const vint8m2_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});
  for (size_t i = 0; i < vl; i++) {
    Term extended = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    result_elements.push_back(extended);
  }

  return vint16m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Widening Arithmetic Operations (int16m4 -> int32m8)
// ============================================================================

/**
 * __riscv_vwmacc_vx_i32m8: Widening multiply-accumulate (acc + vec * scalar)
 * acc is int32m8, vec is int16m4, scalar is int16
 */
inline vint32m8_t __riscv_vwmacc_vx_i32m8(const vint32m8_t &acc, int16_t scalar,
                                          const vint16m4_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int32_t scalar_ext = static_cast<int32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint32_t>(scalar_ext));

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    // Extend vector element to 32 bits
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});

    // Multiply
    Term product = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT,
                                         {vec_elem_ext, scalar_term});

    // Accumulate
    Term result = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD,
                                        {acc.getElement(i), product});
    result_elements.push_back(result);
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vand_vx_i32m4: Bitwise AND scalar with vector (int32m4)
 */
inline vint32m4_t __riscv_vand_vx_i32m4(const vint32m4_t &vec, int32_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_AND, {vec.getElement(i), scalar_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsub_vv_i32m4: Subtract vector from vector (int32m4)
 */
inline vint32m4_t __riscv_vsub_vv_i32m4(const vint32m4_t &op1,
                                        const vint32m4_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {op1.getElement(i), op2.getElement(i)}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsub_vx_i32m4: Subtract scalar from vector (int32m4)
 */
inline vint32m4_t __riscv_vsub_vx_i32m4(const vint32m4_t &vec, int32_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {vec.getElement(i), scalar_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Missing Intrinsics for qu8vaddc_rvv.cpp
// ============================================================================

/**
 * __riscv_vsext_vf2_i32m8: Sign-extend int16m4 to int32m8 (widening by 2x)
 */
inline vint32m8_t __riscv_vsext_vf2_i32m8(const vint16m4_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
  for (size_t i = 0; i < vl; i++) {
    Term extended = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    result_elements.push_back(extended);
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_i32m1: Move scalar to all elements of vector (int32m1)
 */
inline vint32m1_t __riscv_vmv_v_x_i32m1(int32_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_i16m2: Move scalar to all elements of vector (int16m2)
 */
inline vint16m2_t __riscv_vmv_v_x_i16m2(int16_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint16_t scalar_u16 = static_cast<uint16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_u16));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_i8m1: Move scalar to all elements of vector (int8m1)
 */
inline vint8m1_t __riscv_vmv_v_x_i8m1(int8_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint8_t scalar_u8 = static_cast<uint8_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar_u8));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsub_vv_i16m2: Subtract vector from vector (int16m2)
 */
inline vint16m2_t __riscv_vsub_vv_i16m2(const vint16m2_t &op1,
                                        const vint16m2_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {op1.getElement(i), op2.getElement(i)}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmslt_vx_i16m2_b8: Compare vector less than scalar, return mask (int16m2)
 * Returns vbool8_t where each element is 1 if vec[i] < scalar, else 0
 */
inline vbool8_t __riscv_vmslt_vx_i16m2_b8(const vint16m2_t &vec, int16_t scalar,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint16_t scalar_u16 = static_cast<uint16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_u16));

  Term one_bit = g_symbolic_tm->mkBitVector(1, 1);
  Term zero_bit = g_symbolic_tm->mkBitVector(1, 0);

  for (size_t i = 0; i < vl; i++) {
    // Signed less than comparison
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT,
                                     {vec.getElement(i), scalar_term});
    // Convert boolean to 1-bit bitvector
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, one_bit, zero_bit}));
  }

  return vbool8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsll_vx_i16m2: Shift left logical by scalar (int16m2)
 */
inline vint16m2_t __riscv_vsll_vx_i16m2(const vint16m2_t &vec, uint16_t shift,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(shift));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {vec.getElement(i), shift_term}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwmul_vv_i32m4: Widening multiply vector by vector (int16m2 * int16m2 -> int32m4)
 */
inline vint32m4_t __riscv_vwmul_vv_i32m4(const vint16m2_t &op1,
                                         const vint16m2_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    // Sign-extend both operands to 32 bits
    Term op1_ext = g_symbolic_tm->mkTerm(sext_op, {op1.getElement(i)});
    Term op2_ext = g_symbolic_tm->mkTerm(sext_op, {op2.getElement(i)});

    // Multiply
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {op1_ext, op2_ext}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmerge_vxm_i16m2: Merge vector with scalar based on mask (int16m2)
 * result[i] = mask[i] ? scalar : vec[i]
 */
inline vint16m2_t __riscv_vmerge_vxm_i16m2(const vint16m2_t &vec, int16_t scalar,
                                           const vbool8_t &mask, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint16_t scalar_u16 = static_cast<uint16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_u16));

  Term one_bit = g_symbolic_tm->mkBitVector(1, 1);

  for (size_t i = 0; i < vl; i++) {
    // Check if mask bit is set (mask[i] == 1)
    Term mask_set = g_symbolic_tm->mkTerm(Kind::EQUAL, {mask.getElement(i), one_bit});
    // Select scalar if mask is set, otherwise vector element
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {mask_set, scalar_term, vec.getElement(i)}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_i32m8: Move scalar to all elements of vector (int32m8)
 */
inline vint32m8_t __riscv_vmv_v_x_i32m8(int32_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmacc_vx_i32m8: Multiply-accumulate (acc += vec * scalar) for int32m8
 */
inline vint32m8_t __riscv_vmacc_vx_i32m8(const vint32m8_t &acc, int32_t scalar,
                                         const vint32m8_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    Term product = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT,
                                         {vec.getElement(i), scalar_term});
    Term result = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD,
                                        {acc.getElement(i), product});
    result_elements.push_back(result);
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vssra_vx_i32m8: Saturating arithmetic right shift by scalar (int32m8)
 */
inline vint32m8_t __riscv_vssra_vx_i32m8(const vint32m8_t &vec, uint32_t shift,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));
  Term zero = g_symbolic_tm->mkBitVector(32, 0);
  Term min_int32 = g_symbolic_tm->mkBitVector(32, 0x80000000); // INT32_MIN

  for (size_t i = 0; i < vl; i++) {
    Term elem = vec.getElement(i);
    
    // Perform arithmetic shift right
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR, {elem, shift_term});
    
    // For saturation: if the value is INT32_MIN and we shift, it stays INT32_MIN
    Term is_min = g_symbolic_tm->mkTerm(Kind::EQUAL, {elem, min_int32});
    Term saturated = g_symbolic_tm->mkTerm(
        Kind::ITE, {is_min, min_int32, shifted});
    
    result_elements.push_back(saturated);
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnclip_wi_i16m4: Narrowing clip with immediate shift (int32m8 -> int16m4)
 * Note: "wi" means "with immediate" shift value
 */
inline vint16m4_t __riscv_vnclip_wi_i16m4(const vint32m8_t &vec, size_t shift,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  shift = shift & 31;
  unsigned int vxrm = __RISCV_VXRM_RNU; // Default assumption

  Term max_val = g_symbolic_tm->mkBitVector(32, 32767);
  Term min_val = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(-32768));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});
    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint16m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnclip_wi_i8m2: Narrowing clip with immediate shift (int16m4 -> int8m2)
 */
inline vint8m2_t __riscv_vnclip_wi_i8m2(const vint16m4_t &vec, size_t shift,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  shift = shift & 15;
  unsigned int vxrm = __RISCV_VXRM_RNU;

  Term max_val = g_symbolic_tm->mkBitVector(16, 127);
  Term min_val = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(-128));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});
    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint8m2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Additional Vector Configuration and Operations
// ============================================================================

/**
 * __riscv_vsetvl_e32m4: Set vector length for 32-bit elements with LMUL=4
 * Returns the actual VL set based on AVL
 */
inline size_t __riscv_vsetvl_e32m4(size_t avl) {
  g_current_vl = avl;
  return avl;
}

/**
 * __riscv_vsetvl_e32m8: Set vector length for 32-bit elements with LMUL=8
 * Returns the actual VL set based on AVL
 * For VLEN=256, LMUL=8, SEW=32: VLMAX = (256/32) * 8 = 64
 */
inline size_t __riscv_vsetvl_e32m8(size_t avl) {
  // VLMAX for e32m8 with VLEN=256 is 64
  const size_t vlmax = 64;
  size_t vl = (avl < vlmax) ? avl : vlmax;
  g_current_vl = vl;
  return vl;
}

/**
 * __riscv_vsetvlmax_e32m1: Set vector length to maximum for 32-bit elements with LMUL=1
 * Returns VLMAX (maximum vector length for this configuration)
 * For symbolic execution, we use a reasonable default
 */
inline size_t __riscv_vsetvlmax_e32m1() {
  // VLEN=256 bits, element width=32 bits, LMUL=1
  // VLMAX = (VLEN/SEW) * LMUL = (256/32) * 1 = 8
  size_t vlmax = 8;
  g_current_vl = vlmax;
  return vlmax;
}

/**
 * __riscv_vmv_v_x_i32m4: Move scalar to all elements of vector (int32m4)
 * Broadcasts scalar value to all vector elements
 */
inline vint32m4_t __riscv_vmv_v_x_i32m4(int32_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t scalar_u32 = static_cast<uint32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar_u32));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwadd_wv_i16m2: Widening add (wide int16m2 + narrow int8m1)
 * Wide operand is 16-bit, narrow operand is 8-bit (sign-extended to 16-bit)
 */
inline vint16m2_t __riscv_vwadd_wv_i16m2(const vint16m2_t &acc, const vint8m1_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});

  for (size_t i = 0; i < vl; i++) {
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {acc.getElement(i), vec_elem_ext}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwadd_wv_i32m4: Widening add (wide + vector)
 * Adds int32m4 vector with int16m2 vector (widened to int32)
 * Result: wide[i] + sign_extend(vec[i])
 */
inline vint32m4_t __riscv_vwadd_wv_i32m4(const vint32m4_t &wide, 
                                          const vint16m2_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    // Sign-extend int16 element to int32
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});
    
    // Add to wide element
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {wide.getElement(i), vec_elem_ext}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vredsum_vs_i32m4_i32m1: Vector reduction sum
 * Sums all elements in vector and adds to scalar accumulator
 * Result: scalar[0] + sum(vec[0..vl-1])
 */
inline vint32m1_t __riscv_vredsum_vs_i32m4_i32m1(const vint32m4_t &vec,
                                                  const vint32m1_t &scalar,
                                                  size_t vl) {
  // Start with the scalar accumulator value (element 0)
  Term sum = scalar.getElement(0);
  
  // Add all vector elements
  for (size_t i = 0; i < vl; i++) {
    sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {sum, vec.getElement(i)});
  }
  
  // Return as a vector with one element
  std::vector<Term> result_elements;
  result_elements.push_back(sum);
  
  return vint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vredsum: Generic vector reduction sum (simplified interface)
 * Alias for __riscv_vredsum_vs_i32m4_i32m1
 */
inline vint32m1_t __riscv_vredsum(const vint32m4_t &vec,
                                   const vint32m1_t &scalar,
                                   size_t vl) {
  return __riscv_vredsum_vs_i32m4_i32m1(vec, scalar, vl);
}

/**
 * __riscv_vmv_x_s_i32m1_i32: Move element 0 of vector to scalar GPR
 * Returns the first element of the vector as a symbolic_int32_t
 * This allows symbolic tracking through subsequent scalar operations
 */
inline symbolic_int32_t __riscv_vmv_x_s_i32m1_i32(const vint32m1_t &vec) {
  // Extract the symbolic term from element 0
  Term scalar_term = vec.getElement(0);
  
  return symbolic_int32_t(g_symbolic_tm, scalar_term, 0, false);
}

// ============================================================================
// Arithmetic Operations (int16m4)
// ============================================================================

/**
 * __riscv_vsub_vx_i16m4: Subtract scalar from vector (int16m4)
 */
inline vint16m4_t __riscv_vsub_vx_i16m4(const vint16m4_t &vec, int16_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint16_t scalar_u16 = static_cast<uint16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_u16));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {vec.getElement(i), scalar_term}));
  }

  return vint16m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Widening Multiply Operations (int16m4 -> int32m8)
// ============================================================================

/**
 * __riscv_vwmul_vv_i32m8: Widening multiply vector by vector (int16m4 * int16m4 -> int32m8)
 */
inline vint32m8_t __riscv_vwmul_vv_i32m8(const vint16m4_t &op1,
                                         const vint16m4_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    // Sign-extend both operands to 32 bits
    Term op1_ext = g_symbolic_tm->mkTerm(sext_op, {op1.getElement(i)});
    Term op2_ext = g_symbolic_tm->mkTerm(sext_op, {op2.getElement(i)});

    // Multiply
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {op1_ext, op2_ext}));
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Floating-Point Conversion Operations
// ============================================================================

/**
 * __riscv_vfcvt_f_x_v_f32m8: Convert signed int32m8 to float32m8
 */
inline vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(const vint32m8_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {8, 24});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(to_fp_op, {rm, vec.getElement(i)}));
  }

  return vfloat32m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfcvt_x_f_v_i32m8: Convert float32m8 to signed int32m8
 * Uses round-to-nearest-ties-to-even by default
 */
inline vint32m8_t __riscv_vfcvt_x_f_v_i32m8(const vfloat32m8_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
  Op to_sbv_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_SBV, {32});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(to_sbv_op, {rm, vec.getElement(i)}));
  }

  return vint32m8_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Floating-Point Arithmetic Operations
// ============================================================================

/**
 * __riscv_vfmul_vf_f32m8: Multiply float32m8 vector by scalar float
 */
inline vfloat32m8_t __riscv_vfmul_vf_f32m8(const vfloat32m8_t &vec, float scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert float scalar to its IEEE 754 bit representation
  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat32m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfcvt_f_x_v_f32m4: Convert signed int32m4 to float32m4
 */
inline vfloat32m4_t __riscv_vfcvt_f_x_v_f32m4(const vint32m4_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {8, 24});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(to_fp_op, {rm, vec.getElement(i)}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmul_vf_f32m4: Multiply float32m4 vector by scalar float
 */
inline vfloat32m4_t __riscv_vfmul_vf_f32m4(const vfloat32m4_t &vec, float scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert float scalar to its IEEE 754 bit representation
  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Narrowing Clip Operations (with vxrm parameter)
// ============================================================================

/**
 * __riscv_vnclip_wx_i16m4: Narrowing clip (int32m8 -> int16m4) with vxrm
 */
inline vint16m4_t __riscv_vnclip_wx_i16m4(const vint32m8_t &vec, size_t shift,
                                          unsigned int vxrm, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  shift = shift & 31;

  Term max_val = g_symbolic_tm->mkBitVector(32, 32767);
  Term min_val = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(-32768));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});
    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint16m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnclip_wx_i8m2: Narrowing clip (int16m4 -> int8m2) with vxrm
 */
inline vint8m2_t __riscv_vnclip_wx_i8m2(const vint16m4_t &vec, size_t shift,
                                        unsigned int vxrm, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  shift = shift & 15;

  Term max_val = g_symbolic_tm->mkBitVector(16, 127);
  Term min_val = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(-128));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});
    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint8m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwadd_vx_i16m2: Widening addition (int8 vector + int8 scalar ->
 * int16 vector)
 */
inline vint16m2_t __riscv_vwadd_vx_i16m2(const vint8m1_t &vec, int8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int16_t scalar_ext = static_cast<int16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint16_t>(scalar_ext));

  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});

  for (size_t i = 0; i < vl; i++) {
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});

    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {vec_elem_ext, scalar_term}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vrsub_vx_i16m2: Reverse subtraction (scalar - vector, int16m2)
 * Computes scalar - vec[i] for each element
 */
inline vint16m2_t __riscv_vrsub_vx_i16m2(const vint16m2_t &vec, int16_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint16_t scalar_u16 = static_cast<uint16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_u16));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {scalar_term, vec.getElement(i)}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsmul_vx_i16m2: Signed saturating fixed-point multiply (int16m2)
 * Multiplies each element by scalar, shifts right by 15 bits (Q15 format),
 * rounds according to vxrm, and saturates to int16 range.
 */
inline vint16m2_t __riscv_vsmul_vx_i16m2(const vint16m2_t &vec, int16_t scalar,
                                         unsigned int vxrm, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  int32_t scalar_ext = static_cast<int32_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint32_t>(scalar_ext));

  // Sign extend 16-bit to 32-bit
  Op sext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  // Saturation constants for 16-bit signed
  Term max_val = g_symbolic_tm->mkBitVector(32, 32767);
  Term min_val = g_symbolic_tm->mkBitVector(32, static_cast<uint32_t>(-32768));

  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    // Sign extend vector element to 32 bits
    Term vec_elem_ext = g_symbolic_tm->mkTerm(sext_op, {vec.getElement(i)});

    // Multiply (32-bit result)
    Term product =
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {vec_elem_ext, scalar_term});

    // Shift right by 15 with rounding (Q15 fixed-point format)
    Term shifted = roundedShiftRight(product, 15, vxrm);

    // Saturate to int16 range
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {shifted, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {shifted, min_val});

    Term saturated = g_symbolic_tm->mkTerm(
        Kind::ITE,
        {gt_max, max_val,
         g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, shifted})});

    // Extract lower 16 bits
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {saturated}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Float16 (Half-Precision) Operations
// ============================================================================

/**
 * __riscv_vsub_vx_i16m2: Vector-scalar subtraction (int16m2)
 * result[i] = vec[i] - scalar
 */
inline vint16m2_t __riscv_vsub_vx_i16m2(const vint16m2_t &vec, int16_t scalar,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint16_t scalar_u16 = static_cast<uint16_t>(scalar);
  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar_u16));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {vec.getElement(i), scalar_term}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfcvt_f_x_v_f16m2: Convert signed int16 vector to float16 vector
 * result[i] = (float16)vec[i]
 */
inline vfloat16m2_t __riscv_vfcvt_f_x_v_f16m2(const vint16m2_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {5, 11});  // IEEE 754 half precision

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(to_fp_op, {rm, vec.getElement(i)}));
  }

  return vfloat16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmul_vf_f16m2: Vector-scalar floating-point multiply (float16m2)
 * result[i] = vec[i] * scalar
 */
inline vfloat16m2_t __riscv_vfmul_vf_f16m2(const vfloat16m2_t &vec, _Float16 scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert _Float16 scalar to its IEEE 754 bit representation
  uint16_t bits;
  std::memcpy(&bits, &scalar, sizeof(_Float16));
  Term bv = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat16m2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Widening Conversion Operations (Unsigned)
// ============================================================================

/**
 * __riscv_vwcvtu_x_x_v_u16m2: Widening convert unsigned uint8 to uint16 (LMUL 1->2)
 * Zero-extends each 8-bit element to 16-bit
 */
inline vuint16m2_t __riscv_vwcvtu_x_x_v_u16m2(const vuint8m1_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(extend_op, {vec.getElement(i)}));
  }

  return vuint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwcvtu_x_x_v_u16m1: Widening convert unsigned uint8 to uint16 (LMUL 1/2->1)
 */
inline vuint16m1_t __riscv_vwcvtu_x_x_v_u16m1(const vuint8mf2_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(extend_op, {vec.getElement(i)}));
  }

  return vuint16m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Reinterpret Operations
// ============================================================================

/**
 * __riscv_vreinterpret_v_u16m2_i16m2: Reinterpret unsigned as signed (16-bit, LMUL=2)
 */
inline vint16m2_t __riscv_vreinterpret_v_u16m2_i16m2(const vuint16m2_t &vec) {
  // Just copy the terms - bitvector representation is the same
  return vint16m2_t(g_symbolic_tm, vec.getElements());
}

/**
 * __riscv_vreinterpret_v_i16m2_u16m2: Reinterpret signed as unsigned (16-bit, LMUL=2)
 */
inline vuint16m2_t __riscv_vreinterpret_v_i16m2_u16m2(const vint16m2_t &vec) {
  return vuint16m2_t(g_symbolic_tm, vec.getElements());
}

/**
 * __riscv_vreinterpret_v_u16m1_i16m1: Reinterpret unsigned as signed (16-bit, LMUL=1)
 */
inline vint16m1_t __riscv_vreinterpret_v_u16m1_i16m1(const vuint16m1_t &vec) {
  return vint16m1_t(g_symbolic_tm, vec.getElements());
}

/**
 * __riscv_vreinterpret_v_i16mf2_u16mf2: Reinterpret signed as unsigned (16-bit, LMUL=1/2)
 */
inline vuint16mf2_t __riscv_vreinterpret_v_i16mf2_u16mf2(const vint16mf2_t &vec) {
  return vuint16mf2_t(g_symbolic_tm, vec.getElements());
}

/**
 * __riscv_vreinterpret_v_f32m4_i32m4: Reinterpret float32 as int32 (LMUL=4)
 */
inline vint32m4_t __riscv_vreinterpret_v_f32m4_i32m4(const vfloat32m4_t &vec) {
  std::vector<Term> result_elements;
  size_t vl = vec.getVL();
  result_elements.reserve(vl);

  Sort bv32 = g_symbolic_tm->mkBitVectorSort(32);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});

  static int reinterpret_counter = 0;

  for (size_t i = 0; i < vl; i++) {
    Term bv_lane = g_symbolic_tm->mkConst(bv32, "f32m4_to_bv_" +
        std::to_string(reinterpret_counter++) + "_" + std::to_string(i));
    Term fp_from_bv = g_symbolic_tm->mkTerm(to_fp_op, {bv_lane});
    Term eq = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getElement(i)});
    g_symbolic_solver->assertFormula(eq);
    result_elements.push_back(bv_lane);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vreinterpret_v_f32m1_i32m1: Reinterpret float32 as int32 (LMUL=1)
 */
inline vint32m1_t __riscv_vreinterpret_v_f32m1_i32m1(const vfloat32m1_t &vec) {
  std::vector<Term> result_elements;
  size_t vl = vec.getVL();
  result_elements.reserve(vl);

  Sort bv32 = g_symbolic_tm->mkBitVectorSort(32);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});

  static int reinterpret_m1_counter = 0;

  for (size_t i = 0; i < vl; i++) {
    Term bv_lane = g_symbolic_tm->mkConst(bv32, "f32m1_to_bv_" +
        std::to_string(reinterpret_m1_counter++) + "_" + std::to_string(i));
    Term fp_from_bv = g_symbolic_tm->mkTerm(to_fp_op, {bv_lane});
    Term eq = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getElement(i)});
    g_symbolic_solver->assertFormula(eq);
    result_elements.push_back(bv_lane);
  }

  return vint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vreinterpret_v_u32m1_u8m1: Reinterpret u32 vector as u8 vector (LMUL=1)
 * Each 32-bit element is split into 4 bytes (little-endian)
 */
inline vuint8m1_t __riscv_vreinterpret_v_u32m1_u8m1(const vuint32m1_t &vec) {
  std::vector<Term> result_elements;
  size_t vl_u32 = vec.getVL();
  result_elements.reserve(vl_u32 * 4);

  for (size_t i = 0; i < vl_u32; i++) {
    Term u32_elem = vec.getElement(i);
    // Extract 4 bytes from each 32-bit element (little-endian: byte 0 is LSB)
    for (int byte_idx = 0; byte_idx < 4; byte_idx++) {
      Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT,
          {static_cast<uint32_t>(byte_idx * 8 + 7), static_cast<uint32_t>(byte_idx * 8)});
      Term byte_term = g_symbolic_tm->mkTerm(extract_op, {u32_elem});
      result_elements.push_back(byte_term);
    }
  }

  return vuint8m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Widening Multiply-Accumulate Operations
// ============================================================================

/**
 * __riscv_vwmacc_vv_i32m4: Widening multiply-accumulate vector-vector (i16m2 * i16m2 + i32m4)
 * result[i] = acc[i] + sign_extend(op1[i]) * sign_extend(op2[i])
 */
inline vint32m4_t __riscv_vwmacc_vv_i32m4(const vint32m4_t &acc,
                                          const vint16m2_t &op1,
                                          const vint16m2_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    Term op1_ext = g_symbolic_tm->mkTerm(extend_op, {op1.getElement(i)});
    Term op2_ext = g_symbolic_tm->mkTerm(extend_op, {op2.getElement(i)});
    Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {op1_ext, op2_ext});
    Term sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getElement(i), prod});
    result_elements.push_back(sum);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwmacc_vv_i32m1: Widening multiply-accumulate vector-vector (i16mf2 * i16mf2 + i32m1)
 */
inline vint32m1_t __riscv_vwmacc_vv_i32m1(const vint32m1_t &acc,
                                          const vint16mf2_t &op1,
                                          const vint16mf2_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    Term op1_ext = g_symbolic_tm->mkTerm(extend_op, {op1.getElement(i)});
    Term op2_ext = g_symbolic_tm->mkTerm(extend_op, {op2.getElement(i)});
    Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {op1_ext, op2_ext});
    Term sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getElement(i), prod});
    result_elements.push_back(sum);
  }

  return vint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwmacc_vv_i32m1: Widening multiply-accumulate vector-vector (i16m1 * i16m1 + i32m1)
 * Overload for vint16m1_t operands
 * result[i] = acc[i] + sign_extend(op1[i]) * sign_extend(op2[i])
 */
inline vint32m1_t __riscv_vwmacc_vv_i32m1(const vint32m1_t &acc,
                                          const vint16m1_t &op1,
                                          const vint16m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    Term op1_ext = g_symbolic_tm->mkTerm(extend_op, {op1.getElement(i)});
    Term op2_ext = g_symbolic_tm->mkTerm(extend_op, {op2.getElement(i)});
    Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {op1_ext, op2_ext});
    Term sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getElement(i), prod});
    result_elements.push_back(sum);
  }

  return vint32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Floating-Point Operations (LMUL=4 and LMUL=1)
// ============================================================================

/**
 * __riscv_vfadd_vf_f32m4: Vector-scalar floating-point add (LMUL=4)
 */
inline vfloat32m4_t __riscv_vfadd_vf_f32m4(const vfloat32m4_t &vec, float scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_ADD, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfcvt_f_x_v_f32m1: Convert signed int32 to float32 (LMUL=1)
 */
inline vfloat32m1_t __riscv_vfcvt_f_x_v_f32m1(const vint32m1_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_SBV, {8, 24});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(to_fp_op, {rm, vec.getElement(i)}));
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmul_vf_f32m1: Vector-scalar floating-point multiply (LMUL=1)
 */
inline vfloat32m1_t __riscv_vfmul_vf_f32m1(const vfloat32m1_t &vec, float scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfadd_vf_f32m1: Vector-scalar floating-point add (LMUL=1)
 */
inline vfloat32m1_t __riscv_vfadd_vf_f32m1(const vfloat32m1_t &vec, float scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_ADD, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Float32m4 Load/Store Operations
// ============================================================================

/**
 * __riscv_vle32_v_f32m4: Load vector of 32-bit floats (LMUL=4)
 * Returns previously stored value if available, otherwise creates fresh symbolic constants
 */
inline vfloat32m4_t __riscv_vle32_v_f32m4(const float *ptr, size_t vl) {
  uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

  // Check for exact address match in f32m4 memory
  auto it = g_riscv_memory_f32m4.find(addr);
  if (it != g_riscv_memory_f32m4.end() && !it->second.empty()) {
    const vfloat32m4_t &stored = it->second.back();
    if (stored.getVL() >= vl) {
      std::vector<Term> elements;
      elements.reserve(vl);
      for (size_t i = 0; i < vl; i++) {
        elements.push_back(stored.getElement(i));
      }
      return vfloat32m4_t(g_symbolic_tm, elements);
    }
    return stored;
  }

  // Overlap search in f32m4 memory
  for (const auto &entry : g_riscv_memory_f32m4) {
    uintptr_t base_addr = entry.first;
    if (!entry.second.empty()) {
      const vfloat32m4_t &base_vec = entry.second.back();
      size_t base_vl = base_vec.getVL();
      size_t base_size = base_vl * sizeof(float);

      if (addr >= base_addr && addr < base_addr + base_size) {
        size_t offset_elems = (addr - base_addr) / sizeof(float);

        std::vector<Term> elements;
        elements.reserve(vl);
        for (size_t i = 0; i < vl; i++) {
          if (offset_elems + i < base_vl) {
            elements.push_back(base_vec.getElement(offset_elems + i));
          } else {
            elements.push_back(g_symbolic_tm->mkFloatingPointPosZero(8, 24));
          }
        }
        return vfloat32m4_t(g_symbolic_tm, elements);
      }
    }
  }

  // If not found in memory, create fresh symbolic variables (for input data)
  return vfloat32m4_t(g_symbolic_tm, vl);
}

// Note: __riscv_vse32_v_f32m4 is defined in memory.hpp

// ============================================================================
// Float32m4 Vector Move Operations
// ============================================================================

/**
 * __riscv_vfmv_v_f_f32m4: Move scalar float to all vector elements (LMUL=4)
 * result[i] = scalar for all i
 */
inline vfloat32m4_t __riscv_vfmv_v_f_f32m4(float scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op =
      g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Float32m4 Arithmetic Operations
// ============================================================================

/**
 * __riscv_vfadd_vv_f32m4: Vector-vector floating-point add (LMUL=4)
 * result[i] = a[i] + b[i]
 */
inline vfloat32m4_t __riscv_vfadd_vv_f32m4(const vfloat32m4_t &a,
                                            const vfloat32m4_t &b, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_ADD, {rm, a.getElement(i), b.getElement(i)}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmul_vv_f32m4: Vector-vector floating-point multiply (LMUL=4)
 * result[i] = a[i] * b[i]
 */
inline vfloat32m4_t __riscv_vfmul_vv_f32m4(const vfloat32m4_t &a,
                                            const vfloat32m4_t &b, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, a.getElement(i), b.getElement(i)}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfsub_vf_f32m4: Vector-scalar floating-point subtract (LMUL=4)
 * result[i] = vec[i] - scalar
 */
inline vfloat32m4_t __riscv_vfsub_vf_f32m4(const vfloat32m4_t &vec, float scalar,
                                            size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op =
      g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_SUB, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmax_vf_f32m4: Vector-scalar floating-point maximum (LMUL=4)
 * result[i] = max(vec[i], scalar)
 */
inline vfloat32m4_t __riscv_vfmax_vf_f32m4(const vfloat32m4_t &vec, float scalar,
                                            size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op =
      g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  for (size_t i = 0; i < vl; i++) {
    // max(a, b) = (a > b) ? a : b
    Term gt = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT,
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {gt, vec.getElement(i), scalar_term}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmacc_vf_f32m4: Fused multiply-accumulate with scalar (LMUL=4)
 * result[i] = acc[i] + scalar * vec[i]
 */
inline vfloat32m4_t __riscv_vfmacc_vf_f32m4(const vfloat32m4_t &acc,
                                             float scalar,
                                             const vfloat32m4_t &vec,
                                             size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op =
      g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    // FMA: acc + scalar * vec
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_FMA,
        {rm, scalar_term, vec.getElement(i), acc.getElement(i)}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmacc_vv_f32m4: Fused multiply-accumulate vector-vector (LMUL=4)
 * result[i] = acc[i] + a[i] * b[i]
 */
inline vfloat32m4_t __riscv_vfmacc_vv_f32m4(const vfloat32m4_t &acc,
                                             const vfloat32m4_t &a,
                                             const vfloat32m4_t &b,
                                             size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    // FMA: acc + a * b
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_FMA,
        {rm, a.getElement(i), b.getElement(i), acc.getElement(i)}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Float32m4 Comparison and Merge Operations
// ============================================================================

/**
 * __riscv_vmflt_vf_f32m4_b8: Compare less than with scalar (LMUL=4)
 * Returns vbool8_t mask where each element is 1 if vec[i] < scalar, else 0
 */
inline vbool8_t __riscv_vmflt_vf_f32m4_b8(const vfloat32m4_t &vec, float scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op =
      g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term one_bit = g_symbolic_tm->mkBitVector(1, 1);
  Term zero_bit = g_symbolic_tm->mkBitVector(1, 0);

  for (size_t i = 0; i < vl; i++) {
    Term lt = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT,
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {lt, one_bit, zero_bit}));
  }

  return vbool8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmerge_vvm_f32m4: Merge two vectors based on mask (LMUL=4)
 * result[i] = mask[i] ? b[i] : a[i]
 *
 * This implementation uses bitwise select (like NEON vbslq_f32) for exact equivalence.
 * The mask is expanded to 32 bits (all 1s or all 0s) and used for bitwise selection.
 */
inline vfloat32m4_t __riscv_vmerge_vvm_f32m4(const vfloat32m4_t &a,
                                              const vfloat32m4_t &b,
                                              const vbool8_t &mask,
                                              size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Sort bv32 = g_symbolic_tm->mkBitVectorSort(32);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term one_bit = g_symbolic_tm->mkBitVector(1, 1);
  Term all_ones = g_symbolic_tm->mkBitVector(32, 0xFFFFFFFF);
  Term all_zeros = g_symbolic_tm->mkBitVector(32, 0);

  static int merge_counter = 0;

  for (size_t i = 0; i < vl; i++) {
    Term mask_bit = mask.getElement(i);
    Term mask_is_one = g_symbolic_tm->mkTerm(Kind::EQUAL, {mask_bit, one_bit});

    // Expand mask bit to 32-bit mask (all 1s or all 0s)
    Term mask32 = g_symbolic_tm->mkTerm(Kind::ITE, {mask_is_one, all_ones, all_zeros});

    // Convert floats to bitvectors for bitwise operations
    Term bv_a = g_symbolic_tm->mkConst(bv32, "merge_a_bv_" + std::to_string(merge_counter) + "_" + std::to_string(i));
    Term fp_from_bv_a = g_symbolic_tm->mkTerm(to_fp_op, {bv_a});
    Term eq_a = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv_a, a.getElement(i)});
    g_symbolic_solver->assertFormula(eq_a);

    Term bv_b = g_symbolic_tm->mkConst(bv32, "merge_b_bv_" + std::to_string(merge_counter) + "_" + std::to_string(i));
    Term fp_from_bv_b = g_symbolic_tm->mkTerm(to_fp_op, {bv_b});
    Term eq_b = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv_b, b.getElement(i)});
    g_symbolic_solver->assertFormula(eq_b);

    // Bitwise select: result = (mask & b) | (~mask & a)
    // When mask=1: select b, when mask=0: select a
    Term and_b = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {mask32, bv_b});
    Term not_mask = g_symbolic_tm->mkTerm(Kind::BITVECTOR_NOT, {mask32});
    Term and_a = g_symbolic_tm->mkTerm(Kind::BITVECTOR_AND, {not_mask, bv_a});
    Term result_bv = g_symbolic_tm->mkTerm(Kind::BITVECTOR_OR, {and_b, and_a});

    // Convert result back to floating-point
    result_elements.push_back(g_symbolic_tm->mkTerm(to_fp_op, {result_bv}));
  }
  merge_counter++;

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Float32m4/Int32m4/Uint32m4 Reinterpret Operations
// ============================================================================

/**
 * __riscv_vreinterpret_v_i32m4_f32m4: Reinterpret int32m4 as float32m4
 */
inline vfloat32m4_t __riscv_vreinterpret_v_i32m4_f32m4(const vint32m4_t &vec) {
  std::vector<Term> result_elements;
  size_t vl = vec.getVL();
  result_elements.reserve(vl);

  Op to_fp_op =
      g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(to_fp_op, {vec.getElement(i)}));
  }

  return vfloat32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vreinterpret_v_i32m4_u32m4: Reinterpret int32m4 as uint32m4
 * Bit-level reinterpret (no value change, just type change)
 */
inline vuint32m4_t __riscv_vreinterpret_v_i32m4_u32m4(const vint32m4_t &vec) {
  std::vector<Term> result_elements;
  size_t vl = vec.getVL();
  result_elements.reserve(vl);

  // Bitvectors are the same for signed/unsigned - just copy
  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(vec.getElement(i));
  }

  return vuint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vreinterpret_v_u32m4_i32m4: Reinterpret uint32m4 as int32m4
 * Bit-level reinterpret (no value change, just type change)
 */
inline vint32m4_t __riscv_vreinterpret_v_u32m4_i32m4(const vuint32m4_t &vec) {
  std::vector<Term> result_elements;
  size_t vl = vec.getVL();
  result_elements.reserve(vl);

  // Bitvectors are the same for signed/unsigned - just copy
  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(vec.getElement(i));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Uint32m4 Shift Operations
// ============================================================================

/**
 * __riscv_vsll_vx_u32m4: Logical shift left unsigned (LMUL=4)
 * result[i] = vec[i] << shift
 */
inline vuint32m4_t __riscv_vsll_vx_u32m4(const vuint32m4_t &vec, uint32_t shift,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL,
                                                     {vec.getElement(i), shift_term}));
  }

  return vuint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Indexed Load Operations (Uint32m4)
// ============================================================================

/**
 * __riscv_vluxei32_v_u32m4: Indexed load uint32 (LMUL=4)
 * Loads elements from base + indices[i] for each i
 * This is a gather operation
 */
inline vuint32m4_t __riscv_vluxei32_v_u32m4(const uint32_t *base,
                                             const vuint32m4_t &indices,
                                             size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // For symbolic execution, we create fresh symbolic variables
  // indexed by the base address and index position
  uintptr_t base_addr = reinterpret_cast<uintptr_t>(base);

  for (size_t i = 0; i < vl; i++) {
    // Create a symbolic variable for this indexed load
    // The index is symbolic, so we can't compute the exact address
    result_elements.push_back(g_symbolic_tm->mkConst(
        g_symbolic_tm->mkBitVectorSort(32),
        "vluxei32_" + std::to_string(base_addr) + "_" + std::to_string(i)));
  }

  return vuint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Saturating Subtract Operations
// ============================================================================

/**
 * __riscv_vssub_vx_i32m4: Saturating subtract vector-scalar (signed, LMUL=4)
 */
inline vint32m4_t __riscv_vssub_vx_i32m4(const vint32m4_t &vec, int32_t scalar,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(scalar)));
  Term min_i32 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(INT32_MIN)));
  Term max_i32 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(INT32_MAX)));

  // Use 64-bit for overflow detection
  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {32});
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {31, 0});
  Term min_i32_64 = g_symbolic_tm->mkBitVector(64, static_cast<uint64_t>(static_cast<int64_t>(INT32_MIN)));
  Term max_i32_64 = g_symbolic_tm->mkBitVector(64, static_cast<uint64_t>(static_cast<int64_t>(INT32_MAX)));
  Term scalar_ext = g_symbolic_tm->mkTerm(extend_op, {scalar_term});

  for (size_t i = 0; i < vl; i++) {
    Term vec_ext = g_symbolic_tm->mkTerm(extend_op, {vec.getElement(i)});
    Term diff = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {vec_ext, scalar_ext});

    Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {diff, min_i32_64});
    Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {diff, max_i32_64});
    Term result_normal = g_symbolic_tm->mkTerm(extract_op, {diff});
    Term result = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i32, result_normal});
    result = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i32, result});

    result_elements.push_back(result);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vssub_vx_i32m1: Saturating subtract vector-scalar (signed, LMUL=1)
 */
inline vint32m1_t __riscv_vssub_vx_i32m1(const vint32m1_t &vec, int32_t scalar,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(scalar)));
  Term min_i32 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(INT32_MIN)));
  Term max_i32 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(INT32_MAX)));

  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {32});
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {31, 0});
  Term min_i32_64 = g_symbolic_tm->mkBitVector(64, static_cast<uint64_t>(static_cast<int64_t>(INT32_MIN)));
  Term max_i32_64 = g_symbolic_tm->mkBitVector(64, static_cast<uint64_t>(static_cast<int64_t>(INT32_MAX)));
  Term scalar_ext = g_symbolic_tm->mkTerm(extend_op, {scalar_term});

  for (size_t i = 0; i < vl; i++) {
    Term vec_ext = g_symbolic_tm->mkTerm(extend_op, {vec.getElement(i)});
    Term diff = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {vec_ext, scalar_ext});

    Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {diff, min_i32_64});
    Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {diff, max_i32_64});
    Term result_normal = g_symbolic_tm->mkTerm(extract_op, {diff});
    Term result = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i32, result_normal});
    result = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i32, result});

    result_elements.push_back(result);
  }

  return vint32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Narrowing Clip Operations (Unsigned)
// ============================================================================

/**
 * __riscv_vnclipu_wx_u8m1: Narrowing clip unsigned (i16m2 -> u8m1)
 */
inline vuint8m1_t __riscv_vnclipu_wx_u8m1(const vuint16m2_t &vec, size_t shift,
                                           unsigned int vxrm, size_t vl) {
  (void)vxrm;
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(shift));
  Term max_u8 = g_symbolic_tm->mkBitVector(16, 255);
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_LSHR,
        {vec.getElement(i), shift_term});
    Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT, {shifted, max_u8});
    Term clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_u8, shifted});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clamped}));
  }

  return vuint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnclipu_wx_u8mf4: Narrowing clip unsigned (u16mf2 -> u8mf4)
 */
inline vuint8mf4_t __riscv_vnclipu_wx_u8mf4(const vuint16mf2_t &vec, size_t shift,
                                             unsigned int vxrm, size_t vl) {
  (void)vxrm;
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(shift));
  Term max_u8 = g_symbolic_tm->mkBitVector(16, 255);
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_LSHR,
        {vec.getElement(i), shift_term});
    Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT, {shifted, max_u8});
    Term clamped = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_u8, shifted});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clamped}));
  }

  return vuint8mf4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Narrowing Clip Operations (LMUL=2 -> LMUL=1/2)
// ============================================================================

/**
 * __riscv_vnclip_wx_i16mf2: Narrowing clip signed (i32m1 -> i16mf2)
 */
inline vint16mf2_t __riscv_vnclip_wx_i16mf2(const vint32m1_t &vec, size_t shift,
                                             unsigned int vxrm, size_t vl) {
  (void)vxrm;
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));
  Term min_i16 = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(-32768)));
  Term max_i16 = g_symbolic_tm->mkBitVector(32, 32767);
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR,
        {vec.getElement(i), shift_term});
    Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {shifted, min_i16});
    shifted = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i16, shifted});
    Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {shifted, max_i16});
    shifted = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i16, shifted});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {shifted}));
  }

  return vint16mf2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Min/Max Operations (Signed int16)
// ============================================================================

/**
 * __riscv_vmax_vx_i16m2: Maximum with scalar (signed, LMUL=2)
 */
inline vint16m2_t __riscv_vmax_vx_i16m2(const vint16m2_t &vec, int16_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(16,
      static_cast<uint64_t>(static_cast<uint16_t>(scalar)));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmax_vx_i16mf2: Maximum with scalar (signed, LMUL=1/2)
 */
inline vint16mf2_t __riscv_vmax_vx_i16mf2(const vint16mf2_t &vec, int16_t scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(16,
      static_cast<uint64_t>(static_cast<uint16_t>(scalar)));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint16mf2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Min/Max Operations (Unsigned uint8)
// ============================================================================

/**
 * __riscv_vmaxu_vx_u8m1: Maximum with scalar (unsigned, LMUL=1)
 */
inline vuint8m1_t __riscv_vmaxu_vx_u8m1(const vuint8m1_t &vec, uint8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vuint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vminu_vx_u8m1: Minimum with scalar (unsigned, LMUL=1)
 */
inline vuint8m1_t __riscv_vminu_vx_u8m1(const vuint8m1_t &vec, uint8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ULT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vuint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmaxu_vx_u8mf4: Maximum with scalar (unsigned, LMUL=1/4)
 */
inline vuint8mf4_t __riscv_vmaxu_vx_u8mf4(const vuint8mf4_t &vec, uint8_t scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vuint8mf4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vminu_vx_u8mf4: Minimum with scalar (unsigned, LMUL=1/4)
 */
inline vuint8mf4_t __riscv_vminu_vx_u8mf4(const vuint8mf4_t &vec, uint8_t scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ULT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vuint8mf4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmaxu_vx_u8m8: Maximum with scalar (unsigned, LMUL=8)
 */
inline vuint8m8_t __riscv_vmaxu_vx_u8m8(const vuint8m8_t &vec, uint8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_UGT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vuint8m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vminu_vx_u8m8: Minimum with scalar (unsigned, LMUL=8)
 */
inline vuint8m8_t __riscv_vminu_vx_u8m8(const vuint8m8_t &vec, uint8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ULT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vuint8m8_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Subtract Operations (i16m1)
// ============================================================================

/**
 * __riscv_vsub_vx_i16m1: Subtract scalar from vector (LMUL=1)
 */
inline vint16m1_t __riscv_vsub_vx_i16m1(const vint16m1_t &vec, int16_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(16,
      static_cast<uint64_t>(static_cast<uint16_t>(scalar)));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {vec.getElement(i), scalar_term}));
  }

  return vint16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsub_vx_i16mf2: Subtract scalar from vector (LMUL=1/2)
 */
inline vint16mf2_t __riscv_vsub_vx_i16mf2(const vint16mf2_t &vec, int16_t scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(16,
      static_cast<uint64_t>(static_cast<uint16_t>(scalar)));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SUB, {vec.getElement(i), scalar_term}));
  }

  return vint16mf2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Unsigned Move/Duplicate Operations
// ============================================================================

/**
 * __riscv_vmv_v_x_u32m1: Move scalar to all elements of vector (uint32m1)
 * Creates a vector where all elements are copies of the scalar value
 */
inline vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_u32m4: Move scalar to all elements of vector (uint32m4)
 * Creates a vector where all elements are copies of the scalar value
 */
inline vuint32m4_t __riscv_vmv_v_x_u32m4(uint32_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vuint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_u32m8: Move scalar to all elements of vector (uint32m8)
 * Creates a vector where all elements are copies of the scalar value
 */
inline vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vuint32m8_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_u8m1: Move scalar to all elements of vector (uint8m1)
 * Creates a vector where all elements are copies of the scalar value
 */
inline vuint8m1_t __riscv_vmv_v_x_u8m1(uint8_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term =
      g_symbolic_tm->mkBitVector(8, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vuint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_u16m1: Move scalar to all elements of vector (uint16m1)
 * Creates a vector where all elements are copies of the scalar value
 */
inline vuint16m1_t __riscv_vmv_v_x_u16m1(uint16_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vuint16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmv_v_x_u16m2: Move scalar to all elements of vector (uint16m2)
 * Creates a vector where all elements are copies of the scalar value
 */
inline vuint16m2_t __riscv_vmv_v_x_u16m2(uint16_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vuint16m2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Unsigned Widening Add Operations
// ============================================================================

/**
 * __riscv_vwaddu_wv_u16m2: Widening unsigned add (uint16 + uint8 -> uint16)
 * Adds uint16m2 vector with uint8m1 vector (zero-extended to uint16)
 * result[i] = wide[i] + zero_extend(narrow[i])
 */
inline vuint16m2_t __riscv_vwaddu_wv_u16m2(const vuint16m2_t &wide,
                                            const vuint8m1_t &narrow,
                                            size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op zext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {8});

  for (size_t i = 0; i < vl; i++) {
    // Zero-extend uint8 to uint16
    Term narrow_ext = g_symbolic_tm->mkTerm(zext_op, {narrow.getElement(i)});
    // Add to wide element
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {wide.getElement(i), narrow_ext}));
  }

  return vuint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwaddu_wv_u32m4: Widening unsigned add (uint32 + uint16 -> uint32)
 * Adds uint32m4 vector with uint16m2 vector (zero-extended to uint32)
 * result[i] = wide[i] + zero_extend(narrow[i])
 */
inline vuint32m4_t __riscv_vwaddu_wv_u32m4(const vuint32m4_t &wide,
                                            const vuint16m2_t &narrow,
                                            size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op zext_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_ZERO_EXTEND, {16});

  for (size_t i = 0; i < vl; i++) {
    // Zero-extend uint16 to uint32
    Term narrow_ext = g_symbolic_tm->mkTerm(zext_op, {narrow.getElement(i)});
    // Add to wide element
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {wide.getElement(i), narrow_ext}));
  }

  return vuint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vadd_vv_u32m4: Add two unsigned 32-bit vectors (LMUL=4)
 * result[i] = op1[i] + op2[i]
 */
inline vuint32m4_t __riscv_vadd_vv_u32m4(const vuint32m4_t &op1,
                                          const vuint32m4_t &op2,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_ADD, {op1.getElement(i), op2.getElement(i)}));
  }

  return vuint32m4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Signed 8-bit Bilinear Interpolation Intrinsics
// ============================================================================

/**
 * __riscv_vwsub_vv_i16m2: Widening subtract vector-vector (int8m1 - int8m1 -> int16m2)
 * Sign-extends both operands to 16-bit, then subtracts
 * result[i] = sign_extend(op1[i]) - sign_extend(op2[i])
 */
inline vint16m2_t __riscv_vwsub_vv_i16m2(const vint8m1_t &op1,
                                          const vint8m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {8});

  for (size_t i = 0; i < vl; i++) {
    Term op1_ext = g_symbolic_tm->mkTerm(extend_op, {op1.getElement(i)});
    Term op2_ext = g_symbolic_tm->mkTerm(extend_op, {op2.getElement(i)});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_SUB, {op1_ext, op2_ext}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsll_vx_i32m4: Shift left logical by scalar (int32m4)
 * result[i] = vec[i] << shift
 */
inline vint32m4_t __riscv_vsll_vx_i32m4(const vint32m4_t &vec, uint32_t shift,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::BITVECTOR_SHL, {vec.getElement(i), shift_term}));
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vwmacc_vx_i32m4: Widening multiply-accumulate vector-scalar (int16m2 * int16 + int32m4)
 * result[i] = acc[i] + sign_extend(vec[i]) * sign_extend(scalar)
 */
inline vint32m4_t __riscv_vwmacc_vx_i32m4(const vint32m4_t &acc, int16_t scalar,
                                           const vint16m2_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Op extend_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_SIGN_EXTEND, {16});
  Term scalar_16 = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(static_cast<uint16_t>(scalar)));
  Term scalar_ext = g_symbolic_tm->mkTerm(extend_op, {scalar_16});

  for (size_t i = 0; i < vl; i++) {
    Term vec_ext = g_symbolic_tm->mkTerm(extend_op, {vec.getElement(i)});
    Term prod = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT, {vec_ext, scalar_ext});
    Term sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD, {acc.getElement(i), prod});
    result_elements.push_back(sum);
  }

  return vint32m4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnsra_wx_i16m2: Narrowing shift right arithmetic (int32m4 -> int16m2)
 * Shifts right arithmetically by scalar, then narrows to 16-bit
 * result[i] = (int16_t)(vec[i] >> shift)
 */
inline vint16m2_t __riscv_vnsra_wx_i16m2(const vint32m4_t &vec, uint32_t shift,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term =
      g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(shift));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR,
                                          {vec.getElement(i), shift_term});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {shifted}));
  }

  return vint16m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnsra_wx_i8m1: Narrowing shift right arithmetic (int16m2 -> int8m1)
 * Shifts right arithmetically by scalar, then narrows to 8-bit
 * result[i] = (int8_t)(vec[i] >> shift)
 */
inline vint8m1_t __riscv_vnsra_wx_i8m1(const vint16m2_t &vec, uint32_t shift,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term =
      g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(shift));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR,
                                          {vec.getElement(i), shift_term});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {shifted}));
  }

  return vint8m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Vector Slide Operations
// ============================================================================

/**
 * __riscv_vslideup_vx_u8m1: Slide elements up by offset positions
 * Elements [0, offset-1] in dest are unchanged (from dest/merge)
 * Elements [offset, vl-1] get values from src[0, vl-offset-1]
 * 
 * If offset >= vl, no elements from src are written
 */
inline vuint8m1_t __riscv_vslideup_vx_u8m1(const vuint8m1_t &dest, 
                                            const vuint8m1_t &src, 
                                            size_t offset, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Elements before offset come from dest
  for (size_t i = 0; i < offset && i < vl; i++) {
    if (i < dest.getVL()) {
      result_elements.push_back(dest.getElement(i));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
    }
  }

  // Elements from offset onwards come from src
  for (size_t i = offset; i < vl; i++) {
    size_t src_idx = i - offset;
    if (src_idx < src.getVL()) {
      result_elements.push_back(src.getElement(src_idx));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
    }
  }

  return vuint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslidedown_vx_u8m1: Slide elements down by offset positions
 * result[i] = src[i + offset] for valid indices
 * Elements that slide out are lost, elements that slide in are zeros
 */
inline vuint8m1_t __riscv_vslidedown_vx_u8m1(const vuint8m1_t &src, 
                                              size_t offset, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    size_t src_idx = i + offset;
    if (src_idx < src.getVL()) {
      result_elements.push_back(src.getElement(src_idx));
    } else {
      // Elements that slide in from beyond the vector are zero
      result_elements.push_back(g_symbolic_tm->mkBitVector(8, 0));
    }
  }

  return vuint8m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Vector Gather Operations
// ============================================================================

/**
 * __riscv_vrgather_vv_u8m1: Gather elements using index vector
 * result[i] = src[index[i]] for each element
 * If index[i] >= VLMAX, result[i] is 0
 */
inline vuint8m1_t __riscv_vrgather_vv_u8m1(const vuint8m1_t &src, 
                                            const vuint8m1_t &index, 
                                            size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term zero = g_symbolic_tm->mkBitVector(8, 0);
  size_t src_vl = src.getVL();

  for (size_t i = 0; i < vl; i++) {
    // Get the index value - for symbolic execution, we need to handle this
    // If index is concrete, we can directly use it
    // For symbolic execution, we'll create an ITE chain
    
    Term result_elem = zero;  // Default value
    
    // Build ITE chain: if index[i] == 0 then src[0] else if index[i] == 1 then src[1] ...
    for (size_t j = 0; j < src_vl; j++) {
      Term idx_val = g_symbolic_tm->mkBitVector(8, j);
      Term cond = g_symbolic_tm->mkTerm(Kind::EQUAL, {index.getElement(i), idx_val});
      result_elem = g_symbolic_tm->mkTerm(Kind::ITE, {cond, src.getElement(j), result_elem});
    }
    
    result_elements.push_back(result_elem);
  }

  return vuint8m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslideup_vx_u16m1: Slide elements up by offset positions (uint16)
 * Elements [0, offset-1] in dest are unchanged
 * Elements [offset, vl-1] get values from src[0, vl-offset-1]
 */
inline vuint16m1_t __riscv_vslideup_vx_u16m1(const vuint16m1_t &dest, 
                                              const vuint16m1_t &src, 
                                              size_t offset, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < offset && i < vl; i++) {
    if (i < dest.getVL()) {
      result_elements.push_back(dest.getElement(i));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(16, 0));
    }
  }

  for (size_t i = offset; i < vl; i++) {
    size_t src_idx = i - offset;
    if (src_idx < src.getVL()) {
      result_elements.push_back(src.getElement(src_idx));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(16, 0));
    }
  }

  return vuint16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslidedown_vx_u16m1: Slide elements down by offset positions (uint16)
 * result[i] = src[i + offset] for valid indices
 */
inline vuint16m1_t __riscv_vslidedown_vx_u16m1(const vuint16m1_t &src, 
                                                size_t offset, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    size_t src_idx = i + offset;
    if (src_idx < src.getVL()) {
      result_elements.push_back(src.getElement(src_idx));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(16, 0));
    }
  }

  return vuint16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslideup_vx_u32m1: Slide elements up by offset positions (uint32)
 * Elements [0, offset-1] in dest are unchanged
 * Elements [offset, vl-1] get values from src[0, vl-offset-1]
 */
inline vuint32m1_t __riscv_vslideup_vx_u32m1(const vuint32m1_t &dest, 
                                              const vuint32m1_t &src, 
                                              size_t offset, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < offset && i < vl; i++) {
    if (i < dest.getVL()) {
      result_elements.push_back(dest.getElement(i));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(32, 0));
    }
  }

  for (size_t i = offset; i < vl; i++) {
    size_t src_idx = i - offset;
    if (src_idx < src.getVL()) {
      result_elements.push_back(src.getElement(src_idx));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(32, 0));
    }
  }

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslidedown_vx_u32m1: Slide elements down by offset positions (uint32)
 * result[i] = src[i + offset] for valid indices
 */
inline vuint32m1_t __riscv_vslidedown_vx_u32m1(const vuint32m1_t &src, 
                                                size_t offset, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    size_t src_idx = i + offset;
    if (src_idx < src.getVL()) {
      result_elements.push_back(src.getElement(src_idx));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(32, 0));
    }
  }

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslide1down_vx_u32m1: Slide elements down by 1 and insert scalar at top
 * result[i] = src[i + 1] for i < vl-1, result[vl-1] = scalar
 * Elements shift toward lower indices, scalar inserted at highest index
 */
inline vuint32m1_t __riscv_vslide1down_vx_u32m1(const vuint32m1_t &src,
                                                 uint32_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Shift elements down: result[i] = src[i + 1]
  for (size_t i = 0; i < vl - 1; i++) {
    if (i + 1 < src.getVL()) {
      result_elements.push_back(src.getElement(i + 1));
    } else {
      result_elements.push_back(g_symbolic_tm->mkBitVector(32, 0));
    }
  }

  // Insert scalar at the top (last position)
  result_elements.push_back(g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar)));

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vrgather_vv_u16m1: Gather elements using index vector (uint16)
 * result[i] = src[index[i]] for each element
 */
inline vuint16m1_t __riscv_vrgather_vv_u16m1(const vuint16m1_t &src,
                                              const vuint16m1_t &index,
                                              size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term zero = g_symbolic_tm->mkBitVector(16, 0);
  size_t src_vl = src.getVL();

  for (size_t i = 0; i < vl; i++) {
    Term result_elem = zero;
    
    for (size_t j = 0; j < src_vl; j++) {
      Term idx_val = g_symbolic_tm->mkBitVector(16, j);
      Term cond = g_symbolic_tm->mkTerm(Kind::EQUAL, {index.getElement(i), idx_val});
      result_elem = g_symbolic_tm->mkTerm(Kind::ITE, {cond, src.getElement(j), result_elem});
    }
    
    result_elements.push_back(result_elem);
  }

  return vuint16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vrgather_vv_u32m1: Gather elements using index vector (uint32)
 * result[i] = src[index[i]] for each element
 */
inline vuint32m1_t __riscv_vrgather_vv_u32m1(const vuint32m1_t &src, 
                                              const vuint32m1_t &index, 
                                              size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term zero = g_symbolic_tm->mkBitVector(32, 0);
  size_t src_vl = src.getVL();

  for (size_t i = 0; i < vl; i++) {
    Term result_elem = zero;
    
    for (size_t j = 0; j < src_vl; j++) {
      Term idx_val = g_symbolic_tm->mkBitVector(32, j);
      Term cond = g_symbolic_tm->mkTerm(Kind::EQUAL, {index.getElement(i), idx_val});
      result_elem = g_symbolic_tm->mkTerm(Kind::ITE, {cond, src.getElement(j), result_elem});
    }
    
    result_elements.push_back(result_elem);
  }

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Tuple Creation Intrinsics
// ============================================================================

/**
 * __riscv_vcreate_v_u32m1x4: Create a tuple of 4 vuint32m1_t vectors
 * Used for segment load/store operations
 */
inline vuint32m1x4_t __riscv_vcreate_v_u32m1x4(const vuint32m1_t& v0,
                                               const vuint32m1_t& v1,
                                               const vuint32m1_t& v2,
                                               const vuint32m1_t& v3) {
  return vuint32m1x4_t(v0, v1, v2, v3);
}

// ============================================================================
// Narrowing Clip Operations (i16mf2 -> i8mf4)
// ============================================================================

/**
 * __riscv_vnclip_wx_i8mf4: Narrowing clip signed (i16mf2 -> i8mf4)
 * Shifts right by 'shift', then clips to signed 8-bit range
 */
inline vint8mf4_t __riscv_vnclip_wx_i8mf4(const vint16mf2_t &vec, size_t shift,
                                           unsigned int vxrm, size_t vl) {
  (void)vxrm;
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(shift));
  Term min_i8 = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(static_cast<uint16_t>(static_cast<int16_t>(-128))));
  Term max_i8 = g_symbolic_tm->mkBitVector(16, 127);
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR,
        {vec.getElement(i), shift_term});
    Term cmp_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {shifted, min_i8});
    shifted = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_min, min_i8, shifted});
    Term cmp_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {shifted, max_i8});
    shifted = g_symbolic_tm->mkTerm(Kind::ITE, {cmp_max, max_i8, shifted});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {shifted}));
  }

  return vint8mf4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Min/Max Operations (Signed int8mf4)
// ============================================================================

/**
 * __riscv_vmax_vx_i8mf4: Maximum with scalar (signed, LMUL=1/4)
 */
inline vint8mf4_t __riscv_vmax_vx_i8mf4(const vint8mf4_t &vec, int8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(8,
      static_cast<uint64_t>(static_cast<uint8_t>(scalar)));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint8mf4_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmin_vx_i8mf4: Minimum with scalar (signed, LMUL=1/4)
 */
inline vint8mf4_t __riscv_vmin_vx_i8mf4(const vint8mf4_t &vec, int8_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(8,
      static_cast<uint64_t>(static_cast<uint8_t>(scalar)));

  for (size_t i = 0; i < vl; i++) {
    Term cmp = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT,
        {vec.getElement(i), scalar_term});
    result_elements.push_back(
        g_symbolic_tm->mkTerm(Kind::ITE, {cmp, vec.getElement(i), scalar_term}));
  }

  return vint8mf4_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Slide Operations (for lane extraction)
// ============================================================================

/**
 * __riscv_vslidedown_vx_i16mf2: Slide vector elements down by offset (i16mf2)
 * result[i] = src[i + offset] if (i + offset) < vl, else 0
 */
inline vint16mf2_t __riscv_vslidedown_vx_i16mf2(const vint16mf2_t &src, size_t offset,
                                                 size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  size_t src_vl = src.getVL();
  Term zero = g_symbolic_tm->mkBitVector(16, 0);

  for (size_t i = 0; i < vl; i++) {
    if (i + offset < src_vl) {
      result_elements.push_back(src.getElement(i + offset));
    } else {
      result_elements.push_back(zero);
    }
  }

  return vint16mf2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslidedown_vx_i8mf4: Slide vector elements down by offset (i8mf4)
 * result[i] = src[i + offset] if (i + offset) < vl, else 0
 */
inline vint8mf4_t __riscv_vslidedown_vx_i8mf4(const vint8mf4_t &src, size_t offset,
                                               size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  size_t src_vl = src.getVL();
  Term zero = g_symbolic_tm->mkBitVector(8, 0);

  for (size_t i = 0; i < vl; i++) {
    if (i + offset < src_vl) {
      result_elements.push_back(src.getElement(i + offset));
    } else {
      result_elements.push_back(zero);
    }
  }

  return vint8mf4_t(g_symbolic_tm, result_elements);
}


// ============================================================================
// Float32 Vector-Vector Operations (LMUL=1)
// ============================================================================

/**
 * __riscv_vfmul_vv_f32m1: Vector-vector floating-point multiply (LMUL=1)
 */
inline vfloat32m1_t __riscv_vfmul_vv_f32m1(const vfloat32m1_t &op1,
                                           const vfloat32m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, op1.getElement(i), op2.getElement(i)}));
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfsub_vv_f32m1: Vector-vector floating-point subtract (LMUL=1)
 * result[i] = op1[i] - op2[i]
 */
inline vfloat32m1_t __riscv_vfsub_vv_f32m1(const vfloat32m1_t &op1,
                                           const vfloat32m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_SUB, {rm, op1.getElement(i), op2.getElement(i)}));
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Gather Operations (for lane broadcast)
// ============================================================================

/**
 * __riscv_vrgather_vx_i16mf2: Gather elements using scalar index (broadcast)
 * All result elements contain the source element at index 'idx'
 */
inline vint16mf2_t __riscv_vrgather_vx_i16mf2(const vint16mf2_t &src, size_t idx,
                                              size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  size_t src_vl = src.getVL();
  Term zero = g_symbolic_tm->mkBitVector(16, 0);

  for (size_t i = 0; i < vl; i++) {
    if (idx < src_vl) {
      result_elements.push_back(src.getElement(idx));
    } else {
      result_elements.push_back(zero);
    }
  }

  return vint16mf2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Float32 Comparison Operations (LMUL=1)
// ============================================================================

/**
 * __riscv_vmfgt_vv_f32m1_b32: Vector-vector floating-point greater than comparison
 * Returns a mask where each element is true if op1[i] > op2[i]
 */
inline vbool32_t __riscv_vmfgt_vv_f32m1_b32(const vfloat32m1_t &op1,
                                            const vfloat32m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    // Floating-point greater than comparison returns boolean
    Term cmp = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT,
                                     {op1.getElement(i), op2.getElement(i)});
    result_elements.push_back(cmp);
  }

  return vbool32_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Merge Operations (with mask)
// ============================================================================

/**
 * __riscv_vmerge_vvm_f32m1: Vector-vector merge with mask for float32
 * For each element: result[i] = mask[i] ? op2[i] : op1[i]
 */
inline vfloat32m1_t __riscv_vmerge_vvm_f32m1(const vfloat32m1_t &op1,
                                              const vfloat32m1_t &op2,
                                              const vbool32_t &mask, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    // ITE: if mask[i] is true, select op2[i], else select op1[i]
    Term selected = g_symbolic_tm->mkTerm(Kind::ITE,
                                          {mask.getElement(i), op2.getElement(i), op1.getElement(i)});
    result_elements.push_back(selected);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmerge_vvm_u32m1: Vector-vector merge with mask for uint32
 * For each element: result[i] = mask[i] ? op2[i] : op1[i]
 */
inline vuint32m1_t __riscv_vmerge_vvm_u32m1(const vuint32m1_t &op1,
                                             const vuint32m1_t &op2,
                                             const vbool32_t &mask, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    // ITE: if mask[i] is true, select op2[i], else select op1[i]
    Term selected = g_symbolic_tm->mkTerm(Kind::ITE,
                                          {mask.getElement(i), op2.getElement(i), op1.getElement(i)});
    result_elements.push_back(selected);
  }

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Unsigned Integer Arithmetic (LMUL=1)
// ============================================================================

/**
 * __riscv_vadd_vx_u32m1: Vector-scalar unsigned integer add
 * result[i] = op1[i] + scalar
 */
inline vuint32m1_t __riscv_vadd_vx_u32m1(const vuint32m1_t &op1, uint32_t scalar,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    Term sum = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD,
                                     {op1.getElement(i), scalar_term});
    result_elements.push_back(sum);
  }

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmul_vx_u32m1: Vector-scalar unsigned integer multiply
 * result[i] = op1[i] * scalar
 *
 * @param op1 Source vector of unsigned 32-bit integers
 * @param scalar Scalar value to multiply with
 * @param vl Vector length
 * @return Vector with element-wise multiplication results
 */
inline vuint32m1_t __riscv_vmul_vx_u32m1(const vuint32m1_t &op1, uint32_t scalar,
                                          size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    Term product = g_symbolic_tm->mkTerm(Kind::BITVECTOR_MULT,
                                         {op1.getElement(i), scalar_term});
    result_elements.push_back(product);
  }

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Float32 Scalar Operations
// ============================================================================

/**
 * __riscv_vfmv_v_f_f32m1: Splat scalar float to all vector elements
 * Creates a vector where all elements equal the scalar value
 */
inline vfloat32m1_t __riscv_vfmv_v_f_f32m1(float scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert float to IEEE 754 floating-point term
  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(bits));
  Term scalar_term = g_symbolic_tm->mkFloatingPoint(8, 24,
                         g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmv_v_f_f32m1_sym: Splat symbolic scalar float to all vector elements
 * Creates a vector where all elements equal the symbolic scalar value
 */
inline vfloat32m1_t __riscv_vfmv_v_f_f32m1_sym(const symbolic_float32_t& scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = scalar.getTerm();

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslidedown_vx_f32m1: Slide float vector elements down by offset
 * result[i] = src[i + offset] for valid indices, 0 otherwise
 */
inline vfloat32m1_t __riscv_vslidedown_vx_f32m1(const vfloat32m1_t &src,
                                                  size_t offset, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term zero = g_symbolic_tm->mkFloatingPointPosZero(8, 24);

  for (size_t i = 0; i < vl; i++) {
    size_t src_idx = i + offset;
    if (src_idx < src.getVL()) {
      result_elements.push_back(src.getElement(src_idx));
    } else {
      result_elements.push_back(zero);
    }
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmv_f_s_f32m1_f32: Extract first element from float vector as scalar
 * Returns the first element of the vector as a symbolic float wrapper
 */
inline symbolic_float32_t __riscv_vfmv_f_s_f32m1_f32(const vfloat32m1_t &vec) {
  Term scalar_term = vec.getElement(0);
  return symbolic_float32_t(g_symbolic_tm, scalar_term, 0.0f, false);
}

/**
 * __riscv_vfmacc_vf_f32m1: Fused multiply-accumulate with scalar
 * result[i] = acc[i] + (scalar * op1[i])
 */
inline vfloat32m1_t __riscv_vfmacc_vf_f32m1(const vfloat32m1_t &acc, float scalar,
                                             const vfloat32m1_t &op1, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert scalar to floating-point term
  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(bits));
  Term scalar_term = g_symbolic_tm->mkFloatingPoint(8, 24,
                         g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));
  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    // product = scalar * op1[i]
    Term product = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT,
                                          {rm, scalar_term, op1.getElement(i)});
    // result = acc[i] + product
    Term sum = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD,
                                      {rm, acc.getElement(i), product});
    result_elements.push_back(sum);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmacc_vf_f32m1_sym: Fused multiply-accumulate with symbolic scalar
 * result[i] = acc[i] + (scalar_sym * op1[i])
 * This version takes a symbolic_float32_t to preserve symbolic terms
 */
inline vfloat32m1_t __riscv_vfmacc_vf_f32m1_sym(const vfloat32m1_t &acc,
                                                 const symbolic_float32_t &scalar_sym,
                                                 const vfloat32m1_t &op1, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = scalar_sym.getTerm();
  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    // product = scalar * op1[i]
    Term product = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT,
                                          {rm, scalar_term, op1.getElement(i)});
    // result = acc[i] + product
    Term sum = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD,
                                      {rm, acc.getElement(i), product});
    result_elements.push_back(sum);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmacc_vv_f32m1: Fused multiply-accumulate vector-vector
 * result[i] = acc[i] + (op1[i] * op2[i])
 */
inline vfloat32m1_t __riscv_vfmacc_vv_f32m1(const vfloat32m1_t &acc,
                                             const vfloat32m1_t &op1,
                                             const vfloat32m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    // product = op1[i] * op2[i]
    Term product = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT,
                                          {rm, op1.getElement(i), op2.getElement(i)});
    // result = acc[i] + product
    Term sum = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD,
                                      {rm, acc.getElement(i), product});
    result_elements.push_back(sum);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfnmsac_vv_f32m1: Fused negated multiply-subtract-accumulate vector-vector
 * result[i] = acc[i] - (op1[i] * op2[i])
 */
inline vfloat32m1_t __riscv_vfnmsac_vv_f32m1(const vfloat32m1_t &acc,
                                              const vfloat32m1_t &op1,
                                              const vfloat32m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    // product = op1[i] * op2[i]
    Term product = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_MULT,
                                          {rm, op1.getElement(i), op2.getElement(i)});
    // result = acc[i] - product
    Term diff = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_SUB,
                                       {rm, acc.getElement(i), product});
    result_elements.push_back(diff);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmax_vf_f32m1: Element-wise maximum with scalar
 * result[i] = max(op1[i], scalar)
 */
inline vfloat32m1_t __riscv_vfmax_vf_f32m1(const vfloat32m1_t &op1, float scalar,
                                            size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert scalar to floating-point term
  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(bits));
  Term scalar_term = g_symbolic_tm->mkFloatingPoint(8, 24,
                         g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));

  for (size_t i = 0; i < vl; i++) {
    // result = op1[i] > scalar ? op1[i] : scalar
    Term gt = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT,
                                     {op1.getElement(i), scalar_term});
    Term max_val = g_symbolic_tm->mkTerm(Kind::ITE,
                                          {gt, op1.getElement(i), scalar_term});
    result_elements.push_back(max_val);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmin_vf_f32m1: Element-wise minimum with scalar
 * result[i] = min(op1[i], scalar)
 */
inline vfloat32m1_t __riscv_vfmin_vf_f32m1(const vfloat32m1_t &op1, float scalar,
                                            size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert scalar to floating-point term
  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(bits));
  Term scalar_term = g_symbolic_tm->mkFloatingPoint(8, 24,
                         g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits)));

  for (size_t i = 0; i < vl; i++) {
    // result = op1[i] < scalar ? op1[i] : scalar
    Term lt = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT,
                                     {op1.getElement(i), scalar_term});
    Term min_val = g_symbolic_tm->mkTerm(Kind::ITE,
                                          {lt, op1.getElement(i), scalar_term});
    result_elements.push_back(min_val);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmax_vf_f32m1_sym: Element-wise maximum with symbolic scalar
 * result[i] = max(op1[i], scalar)
 */
inline vfloat32m1_t __riscv_vfmax_vf_f32m1_sym(const vfloat32m1_t &op1,
                                                const symbolic_float32_t &scalar_sym,
                                                size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = scalar_sym.getTerm();

  for (size_t i = 0; i < vl; i++) {
    // result = op1[i] > scalar ? op1[i] : scalar
    Term gt = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GT,
                                     {op1.getElement(i), scalar_term});
    Term max_val = g_symbolic_tm->mkTerm(Kind::ITE,
                                          {gt, op1.getElement(i), scalar_term});
    result_elements.push_back(max_val);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmin_vf_f32m1_sym: Element-wise minimum with symbolic scalar
 * result[i] = min(op1[i], scalar)
 */
inline vfloat32m1_t __riscv_vfmin_vf_f32m1_sym(const vfloat32m1_t &op1,
                                                const symbolic_float32_t &scalar_sym,
                                                size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = scalar_sym.getTerm();

  for (size_t i = 0; i < vl; i++) {
    // result = op1[i] < scalar ? op1[i] : scalar
    Term lt = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LT,
                                     {op1.getElement(i), scalar_term});
    Term min_val = g_symbolic_tm->mkTerm(Kind::ITE,
                                          {lt, op1.getElement(i), scalar_term});
    result_elements.push_back(min_val);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vslideup_vx_f32m1: Slide float vector elements up by offset
 * Inserts elements from src into dest starting at position offset.
 * result[i] = (i < offset) ? dest[i] : src[i - offset]
 *
 * @param dest Destination vector (elements below offset are preserved)
 * @param src Source vector to slide up
 * @param offset Number of positions to slide up
 * @param vl Vector length
 */
inline vfloat32m1_t __riscv_vslideup_vx_f32m1(const vfloat32m1_t &dest,
                                               const vfloat32m1_t &src,
                                               size_t offset, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    if (i < offset) {
      // Preserve destination elements below offset
      result_elements.push_back(dest.getElement(i));
    } else {
      // Insert source elements shifted by offset
      size_t src_idx = i - offset;
      if (src_idx < src.getVL()) {
        result_elements.push_back(src.getElement(src_idx));
      } else {
        // Out of bounds - use zero
        result_elements.push_back(g_symbolic_tm->mkFloatingPointPosZero(8, 24));
      }
    }
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vrgather_vv_f32m1: Vector gather using indices from another vector
 * result[i] = src[idx[i]] (if idx[i] < VLMAX, else 0)
 *
 * Gathers elements from src using indices from idx vector.
 * If an index is out of bounds (>= VLMAX), the result element is 0.
 *
 * @param src Source vector to gather from
 * @param idx Index vector containing gather indices
 * @param vl Vector length
 * @return Vector with gathered elements
 */
inline vfloat32m1_t __riscv_vrgather_vv_f32m1(const vfloat32m1_t &src,
                                               const vuint32m1_t &idx,
                                               size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Get the source vector length for bounds checking
  size_t src_vl = src.getVL();

  for (size_t i = 0; i < vl; i++) {
    // Get the index value - need to extract concrete value from bitvector term
    // For symbolic execution, we'll use ITE (if-then-else) to handle each possible index
    Term idx_term = idx.getElement(i);

    // Build a chain of ITEs for each possible index value
    // Start with zero (out of bounds default)
    Term result = g_symbolic_tm->mkFloatingPointPosZero(8, 24);

    // Build ITEs from highest index down to 0
    // Iterate over all source indices, not limited by output vl
    for (size_t j = 0; j < src_vl; j++) {
      // Check if idx[i] == j
      Term j_bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(j));
      Term eq = g_symbolic_tm->mkTerm(Kind::EQUAL, {idx_term, j_bv});
      // If idx[i] == j, use src[j], else use previous result
      result = g_symbolic_tm->mkTerm(Kind::ITE, {eq, src.getElement(j), result});
    }

    result_elements.push_back(result);
  }

  return vfloat32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vid_v_u32m1: Vector Index sequence
 * Creates a vector where each element contains its index.
 * result[i] = i
 *
 * @param vl Vector length
 * @return Vector with elements [0, 1, 2, ..., vl-1]
 */
inline vuint32m1_t __riscv_vid_v_u32m1(size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(
        g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(i)));
  }

  return vuint32m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmsltu_vx_u32m1_b32: Compare vector less than unsigned scalar
 * Creates a mask where each bit is set if the corresponding vector element
 * is less than the scalar value.
 * result[i] = (vec[i] < scalar)
 *
 * @param vec Source vector of unsigned 32-bit integers
 * @param scalar Scalar value to compare against
 * @param vl Vector length
 * @return Mask vector (vbool32_t)
 */
inline vbool32_t __riscv_vmsltu_vx_u32m1_b32(const vuint32m1_t &vec,
                                              size_t scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(scalar));

  for (size_t i = 0; i < vl; i++) {
    // Unsigned less than comparison
    Term lt = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ULT,
                                     {vec.getElement(i), scalar_term});
    result_elements.push_back(lt);
  }

  return vbool32_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Vector Length Setting for LMUL=2 (32-bit elements)
// ============================================================================

/**
 * __riscv_vsetvl_e32m2: Set vector length for 32-bit elements with LMUL=2
 * For symbolic execution, we limit vl to 16 (8 elements * LMUL=2)
 */
inline size_t __riscv_vsetvl_e32m2(size_t avl) {
  // LMUL=2 means we can process 2x the base number of elements
  // Limit to 16 to match typical usage patterns
  g_current_vl = std::min(avl, static_cast<size_t>(16));
  return g_current_vl;
}

// ============================================================================
// Floating-Point Narrowing Conversion Operations
// ============================================================================

/**
 * __riscv_vfncvt_f_f_w_f16m1: Narrowing convert float32 to float16
 * Converts a vector of float32 (LMUL=2) to float16 (LMUL=1)
 * This halves the element width: 32-bit -> 16-bit
 */
inline vfloat16m1_t __riscv_vfncvt_f_f_w_f16m1(const vfloat32m2_t &src, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Create the rounding mode term (default to RNE - Round to Nearest Even)
  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
  Sort fp16 = g_symbolic_tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision

  for (size_t i = 0; i < vl; i++) {
    // Convert f32 to f16 using FLOATINGPOINT_TO_FP_FROM_FP
    Op to_fp16_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_FP, {5, 11});
    Term converted = g_symbolic_tm->mkTerm(to_fp16_op, {rm, src.getElement(i)});
    result_elements.push_back(converted);
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Short-name Aliases (without __riscv_ prefix)
// These provide compatibility with code that uses the shorter intrinsic names
// ============================================================================

// Load/Store aliases (from memory.hpp, but declared here for convenience)
inline vfloat32m1_t vle32_v_f32m1(const float *ptr, size_t vl) {
  return __riscv_vle32_v_f32m1(ptr, vl);
}

inline void vse32_v_f32m1(float *ptr, const vfloat32m1_t &vec, size_t vl) {
  __riscv_vse32_v_f32m1(ptr, vec, vl);
}

// Fused multiply-accumulate aliases
inline vfloat32m1_t vfmacc_vf_f32m1(const vfloat32m1_t &acc, float scalar,
                                     const vfloat32m1_t &vec, size_t vl) {
  return __riscv_vfmacc_vf_f32m1(acc, scalar, vec, vl);
}

// Min/Max aliases
inline vfloat32m1_t vfmin_vf_f32m1(const vfloat32m1_t &op1, float scalar,
                                    size_t vl) {
  return __riscv_vfmin_vf_f32m1(op1, scalar, vl);
}

inline vfloat32m1_t vfmax_vf_f32m1(const vfloat32m1_t &op1, float scalar,
                                    size_t vl) {
  return __riscv_vfmax_vf_f32m1(op1, scalar, vl);
}

// Slide aliases
inline vfloat32m1_t vslidedown_vx_f32m1(const vfloat32m1_t &src, size_t offset,
                                         size_t vl) {
  return __riscv_vslidedown_vx_f32m1(src, offset, vl);
}

// vsetvl aliases
inline size_t vsetvl_e32m1(size_t avl) {
  return __riscv_vsetvl_e32m1(avl);
}

// Splat aliases (vfmv)
inline vfloat32m1_t vfmv_v_f_f32m1(float scalar, size_t vl) {
  return __riscv_vfmv_v_f_f32m1(scalar, vl);
}

inline vfloat32m1_t vfmv_v_f_f32m1(const symbolic_float32_t& scalar, size_t vl) {
  return __riscv_vfmv_v_f_f32m1_sym(scalar, vl);
}

// Fused multiply-accumulate with symbolic scalar alias
inline vfloat32m1_t vfmacc_vf_f32m1(const vfloat32m1_t &acc,
                                     const symbolic_float32_t &scalar,
                                     const vfloat32m1_t &vec, size_t vl) {
  return __riscv_vfmacc_vf_f32m1_sym(acc, scalar, vec, vl);
}

// Min/Max with symbolic scalar aliases
inline vfloat32m1_t vfmin_vf_f32m1_sym(const vfloat32m1_t &op1,
                                        const symbolic_float32_t &scalar,
                                        size_t vl) {
  return __riscv_vfmin_vf_f32m1_sym(op1, scalar, vl);
}

inline vfloat32m1_t vfmax_vf_f32m1_sym(const vfloat32m1_t &op1,
                                        const symbolic_float32_t &scalar,
                                        size_t vl) {
  return __riscv_vfmax_vf_f32m1_sym(op1, scalar, vl);
}

// ============================================================================
// Float32m2 Operations
// ============================================================================

/**
 * __riscv_vfcvt_x_f_v_i32m2: Convert float32m2 to signed int32m2
 * Uses round-to-nearest-ties-to-even by default
 * Saturates to INT32_MIN/INT32_MAX for out-of-range values
 * NaN converts to INT32_MAX (per RISC-V spec)
 */
inline vint32m2_t __riscv_vfcvt_x_f_v_i32m2(const vfloat32m2_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
  Op to_sbv_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_SBV, {32});

  // Create FP constants for range checking
  // INT32_MAX = 2147483647, INT32_MIN = -2147483648
  Sort fp32 = g_symbolic_tm->mkFloatingPointSort(8, 24);

  // Create constants for INT32_MAX and INT32_MIN as floats
  // INT32_MAX as float: 2147483647 -> 2147483648.0 (rounded)
  uint32_t max_bits = 0x4F000000;  // 2147483648.0f
  Term max_bv = g_symbolic_tm->mkBitVector(32, max_bits);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term fp_max = g_symbolic_tm->mkTerm(to_fp_op, {max_bv});

  // INT32_MIN as float: -2147483648.0
  uint32_t min_bits = 0xCF000000;  // -2147483648.0f
  Term min_bv = g_symbolic_tm->mkBitVector(32, min_bits);
  Term fp_min = g_symbolic_tm->mkTerm(to_fp_op, {min_bv});

  // Bitvector constants for saturation
  Term int32_max = g_symbolic_tm->mkBitVector(32, 0x7FFFFFFF);  // 2147483647
  Term int32_min = g_symbolic_tm->mkBitVector(32, 0x80000000);  // -2147483648

  for (size_t i = 0; i < vl; i++) {
    Term elem = vec.getElement(i);

    // Check for NaN - NaN converts to INT32_MAX per RISC-V spec
    Term is_nan = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_IS_NAN, {elem});

    // Check if value >= INT32_MAX (saturate to INT32_MAX)
    Term ge_max = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_GEQ, {elem, fp_max});

    // Check if value <= INT32_MIN (saturate to INT32_MIN)
    Term le_min = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_LEQ, {elem, fp_min});

    // Normal conversion
    Term converted = g_symbolic_tm->mkTerm(to_sbv_op, {rm, elem});

    // Apply saturation: NaN -> INT32_MAX, >= max -> INT32_MAX, <= min -> INT32_MIN, else converted
    Term result = g_symbolic_tm->mkTerm(
        Kind::ITE, {is_nan, int32_max,
                    g_symbolic_tm->mkTerm(
                        Kind::ITE, {ge_max, int32_max,
                                    g_symbolic_tm->mkTerm(Kind::ITE, {le_min, int32_min, converted})})});

    result_elements.push_back(result);
  }

  return vint32m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnclip_wx_i16m1: Narrowing clip (int32m2 -> int16m1)
 * Shifts right by 'shift', then clips to signed 16-bit range
 */
inline vint16m1_t __riscv_vnclip_wx_i16m1(const vint32m2_t &vec, size_t shift,
                                           unsigned int vxrm, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  shift = shift & 31;

  Term max_val = g_symbolic_tm->mkBitVector(32, 32767);
  Term min_val = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(-32768));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {15, 0});

  for (size_t i = 0; i < vl; i++) {
    Term tmp = roundedShiftRight(vec.getElement(i), shift, vxrm);
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {tmp, max_val});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {tmp, min_val});
    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val, tmp})});
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vnclip_wx_i8mf2: Narrowing clip (int16m1 -> int8mf2)
 * Shifts right by 'shift', then clips to signed 8-bit range
 */
inline vint8mf2_t __riscv_vnclip_wx_i8mf2(const vint16m1_t &vec, size_t shift,
                                           unsigned int vxrm, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  shift = shift & 15;

  // Create 16-bit constants for comparison before extraction
  Term max_val_16 = g_symbolic_tm->mkBitVector(16, 127);
  Term min_val_16 = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(static_cast<uint16_t>(static_cast<int16_t>(-128))));
  Term shift_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(shift));
  Op extract_op = g_symbolic_tm->mkOp(Kind::BITVECTOR_EXTRACT, {7, 0});

  for (size_t i = 0; i < vl; i++) {
    // Arithmetic shift right
    Term shifted = g_symbolic_tm->mkTerm(Kind::BITVECTOR_ASHR,
        {vec.getElement(i), shift_term});

    // Clip to int8 range
    Term gt_max = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SGT, {shifted, max_val_16});
    Term lt_min = g_symbolic_tm->mkTerm(Kind::BITVECTOR_SLT, {shifted, min_val_16});
    Term clipped = g_symbolic_tm->mkTerm(
        Kind::ITE, {gt_max, max_val_16,
                    g_symbolic_tm->mkTerm(Kind::ITE, {lt_min, min_val_16, shifted})});

    // Extract lower 8 bits
    result_elements.push_back(g_symbolic_tm->mkTerm(extract_op, {clipped}));
  }

  return vint8mf2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmul_vf_f32m2: Multiply float32m2 vector by scalar float
 */
inline vfloat32m2_t __riscv_vfmul_vf_f32m2(const vfloat32m2_t &vec, float scalar,
                                           size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert float scalar to its IEEE 754 bit representation
  uint32_t bits;
  std::memcpy(&bits, &scalar, sizeof(float));
  Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat32m2_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vadd_vx_i32m2: Add scalar to int32m2 vector
 */
inline vint32m2_t __riscv_vadd_vx_i32m2(const vint32m2_t &vec, int32_t scalar,
                                         size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term scalar_term = g_symbolic_tm->mkBitVector(32,
      static_cast<uint64_t>(static_cast<uint32_t>(scalar)));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(Kind::BITVECTOR_ADD,
        {vec.getElement(i), scalar_term}));
  }

  return vint32m2_t(g_symbolic_tm, result_elements);
}

// ============================================================================
// Float16 (Half-Precision) Vector Operations - LMUL=1
// ============================================================================

/**
 * __riscv_vfmv_v_f_f16m1: Splat scalar _Float16 to all vector elements
 * Creates a vector where all elements equal the scalar value
 */
inline vfloat16m1_t __riscv_vfmv_v_f_f16m1(_Float16 scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert _Float16 to IEEE 754 half-precision floating-point term
  uint16_t bits;
  std::memcpy(&bits, &scalar, sizeof(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(bits))});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(scalar_term);
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfsub_vf_f16m1: Subtract scalar from float16 vector
 * result[i] = vec[i] - scalar
 */
inline vfloat16m1_t __riscv_vfsub_vf_f16m1(const vfloat16m1_t &vec, _Float16 scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert _Float16 scalar to its IEEE 754 bit representation
  uint16_t bits;
  std::memcpy(&bits, &scalar, sizeof(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(bits))});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_SUB, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfsub_vv_f16m1: Vector-vector subtraction for float16
 * result[i] = op1[i] - op2[i]
 */
inline vfloat16m1_t __riscv_vfsub_vv_f16m1(const vfloat16m1_t &op1, const vfloat16m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_SUB, {rm, op1.getElement(i), op2.getElement(i)}));
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmacc_vf_f16m1: Fused multiply-accumulate (scalar multiplier)
 * result[i] = acc[i] + scalar * vec[i]
 */
inline vfloat16m1_t __riscv_vfmacc_vf_f16m1(const vfloat16m1_t &acc, _Float16 scalar,
                                             const vfloat16m1_t &vec, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert _Float16 scalar to its IEEE 754 bit representation
  uint16_t bits;
  std::memcpy(&bits, &scalar, sizeof(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(bits))});

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    // FMA: acc + scalar * vec
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_FMA, {rm, scalar_term, vec.getElement(i), acc.getElement(i)}));
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmacc_vv_f16m1: Fused multiply-accumulate (vector-vector)
 * result[i] = acc[i] + op1[i] * op2[i]
 */
inline vfloat16m1_t __riscv_vfmacc_vv_f16m1(const vfloat16m1_t &acc, const vfloat16m1_t &op1,
                                             const vfloat16m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    // FMA: acc + op1 * op2
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_FMA, {rm, op1.getElement(i), op2.getElement(i), acc.getElement(i)}));
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmul_vv_f16m1: Multiply two float16 vectors element-wise
 * result[i] = op1[i] * op2[i]
 */
inline vfloat16m1_t __riscv_vfmul_vv_f16m1(const vfloat16m1_t &op1, const vfloat16m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, op1.getElement(i), op2.getElement(i)}));
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfadd_vv_f16m1: Add two float16 vectors element-wise
 * result[i] = op1[i] + op2[i]
 */
inline vfloat16m1_t __riscv_vfadd_vv_f16m1(const vfloat16m1_t &op1, const vfloat16m1_t &op2, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_ADD, {rm, op1.getElement(i), op2.getElement(i)}));
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vreinterpret_v_f16m1_i16m1: Reinterpret float16 vector as int16 vector
 * Bit-level reinterpretation (no conversion)
 */
inline vint16m1_t __riscv_vreinterpret_v_f16m1_i16m1(const vfloat16m1_t &vec) {
  std::vector<Term> result_elements;
  size_t vl = vec.getVL();
  result_elements.reserve(vl);

  Sort bv16 = g_symbolic_tm->mkBitVectorSort(16);
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  static int reinterpret_f16_i16_counter = 0;

  for (size_t i = 0; i < vl; i++) {
    // Create a fresh bitvector that represents the IEEE bits
    Term bv_lane = g_symbolic_tm->mkConst(bv16, "rvv_fp16_to_i16_" + std::to_string(reinterpret_f16_i16_counter++) + "_" + std::to_string(i));

    // Convert this BV back to FP16
    Term fp_from_bv = g_symbolic_tm->mkTerm(to_fp_op, {bv_lane});

    // Assert equality: the FP from BV must equal original FP (bit-level equality)
    Term eq = g_symbolic_tm->mkTerm(Kind::EQUAL, {fp_from_bv, vec.getElement(i)});
    g_symbolic_solver->assertFormula(eq);

    result_elements.push_back(bv_lane);
  }

  return vint16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vreinterpret_v_i16m1_f16m1: Reinterpret int16 vector as float16 vector
 * Bit-level reinterpretation (no conversion)
 */
inline vfloat16m1_t __riscv_vreinterpret_v_i16m1_f16m1(const vint16m1_t &vec) {
  std::vector<Term> result_elements;
  size_t vl = vec.getVL();
  result_elements.reserve(vl);

  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});

  for (size_t i = 0; i < vl; i++) {
    // Convert bitvector to FP16 using IEEE bit interpretation
    result_elements.push_back(g_symbolic_tm->mkTerm(to_fp_op, {vec.getElement(i)}));
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vsll_vx_i16m1: Shift left logical by scalar (int16m1)
 * result[i] = vec[i] << shift
 */
inline vint16m1_t __riscv_vsll_vx_i16m1(const vint16m1_t &vec, uint16_t shift, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  Term shift_term = g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(shift & 0xF));

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::BITVECTOR_SHL, {vec.getElement(i), shift_term}));
  }

  return vint16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmflt_vf_f16m1_b16: Compare less than (vector vs scalar)
 * result[i] = vec[i] < scalar
 */
inline vbool16_t __riscv_vmflt_vf_f16m1_b16(const vfloat16m1_t &vec, _Float16 scalar, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Convert _Float16 scalar to its IEEE 754 bit representation
  uint16_t bits;
  std::memcpy(&bits, &scalar, sizeof(bits));
  Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
  Term scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {g_symbolic_tm->mkBitVector(16, static_cast<uint64_t>(bits))});

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_LT, {vec.getElement(i), scalar_term}));
  }

  return vbool16_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vmerge_vvm_f16m1: Merge with mask (vector-vector)
 * result[i] = mask[i] ? op2[i] : op1[i]
 */
inline vfloat16m1_t __riscv_vmerge_vvm_f16m1(const vfloat16m1_t &op1, const vfloat16m1_t &op2,
                                              const vbool16_t &mask, size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::ITE, {mask.getElement(i), op2.getElement(i), op1.getElement(i)}));
  }

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfredosum_vs_f16m1_f16m1: Ordered floating-point reduction sum
 * Returns a vector where element 0 contains the sum of all elements in vec plus scalar[0]
 */
inline vfloat16m1_t __riscv_vfredosum_vs_f16m1_f16m1(const vfloat16m1_t &vec,
                                                      const vfloat16m1_t &scalar, size_t vl) {
  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  // Start with the scalar value (element 0)
  Term sum = scalar.getElement(0);

  // Add all elements in vec (up to the actual vector length)
  size_t actual_vl = std::min(vl, vec.getVL());
  for (size_t i = 0; i < actual_vl; i++) {
    sum = g_symbolic_tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, sum, vec.getElement(i)});
  }

  // Return a vector with the sum in element 0
  std::vector<Term> result_elements;
  result_elements.push_back(sum);

  return vfloat16m1_t(g_symbolic_tm, result_elements);
}

/**
 * __riscv_vfmv_f_s_f16m1_f16: Extract first element from float16 vector as scalar
 * Returns the first element of the vector as a _Float16
 */
inline _Float16 __riscv_vfmv_f_s_f16m1_f16(const vfloat16m1_t &vec) {
  // Store the symbolic result for later verification
  g_riscv_scalar_results["vfmv_f_s_f16m1_f16"] = vec.getElement(0);

  // Return a placeholder value (actual value tracked symbolically)
  return static_cast<_Float16>(0.0);
}

// ============================================================================
// Float16 Alias Intrinsics (without __riscv_ prefix)
// ============================================================================

inline vfloat16m1_t vfmv_v_f_f16m1(_Float16 scalar, size_t vl) {
  return __riscv_vfmv_v_f_f16m1(scalar, vl);
}

inline vfloat16m1_t vle16_v_f16m1(const _Float16 *ptr, size_t vl) {
  return __riscv_vle16_v_f16m1(ptr, vl);
}

inline void vse16_v_f16m1(_Float16 *ptr, const vfloat16m1_t &vec, size_t vl) {
  __riscv_vse16_v_f16m1(ptr, vec, vl);
}

inline vfloat16m1_t vfsub_vf_f16m1(const vfloat16m1_t &vec, _Float16 scalar, size_t vl) {
  return __riscv_vfsub_vf_f16m1(vec, scalar, vl);
}

inline vfloat16m1_t vfsub_vv_f16m1(const vfloat16m1_t &op1, const vfloat16m1_t &op2, size_t vl) {
  return __riscv_vfsub_vv_f16m1(op1, op2, vl);
}

inline vfloat16m1_t vfmacc_vf_f16m1(const vfloat16m1_t &acc, _Float16 scalar,
                                     const vfloat16m1_t &vec, size_t vl) {
  return __riscv_vfmacc_vf_f16m1(acc, scalar, vec, vl);
}

inline vfloat16m1_t vfmacc_vv_f16m1(const vfloat16m1_t &acc, const vfloat16m1_t &op1,
                                     const vfloat16m1_t &op2, size_t vl) {
  return __riscv_vfmacc_vv_f16m1(acc, op1, op2, vl);
}

inline vfloat16m1_t vfmul_vv_f16m1(const vfloat16m1_t &op1, const vfloat16m1_t &op2, size_t vl) {
  return __riscv_vfmul_vv_f16m1(op1, op2, vl);
}

inline vfloat16m1_t vfadd_vv_f16m1(const vfloat16m1_t &op1, const vfloat16m1_t &op2, size_t vl) {
  return __riscv_vfadd_vv_f16m1(op1, op2, vl);
}

inline vint16m1_t vreinterpret_v_f16m1_i16m1(const vfloat16m1_t &vec) {
  return __riscv_vreinterpret_v_f16m1_i16m1(vec);
}

inline vfloat16m1_t vreinterpret_v_i16m1_f16m1(const vint16m1_t &vec) {
  return __riscv_vreinterpret_v_i16m1_f16m1(vec);
}

inline vint16m1_t vsll_vx_i16m1(const vint16m1_t &vec, uint16_t shift, size_t vl) {
  return __riscv_vsll_vx_i16m1(vec, shift, vl);
}

inline vbool16_t vmflt_vf_f16m1_b16(const vfloat16m1_t &vec, _Float16 scalar, size_t vl) {
  return __riscv_vmflt_vf_f16m1_b16(vec, scalar, vl);
}

inline vfloat16m1_t vmerge_vvm_f16m1(const vfloat16m1_t &op1, const vfloat16m1_t &op2,
                                      const vbool16_t &mask, size_t vl) {
  return __riscv_vmerge_vvm_f16m1(op1, op2, mask, vl);
}

inline vfloat16m1_t vfredosum_vs_f16m1_f16m1(const vfloat16m1_t &vec,
                                              const vfloat16m1_t &scalar, size_t vl) {
  return __riscv_vfredosum_vs_f16m1_f16m1(vec, scalar, vl);
}

inline _Float16 vfmv_f_s_f16m1_f16(const vfloat16m1_t &vec) {
  return __riscv_vfmv_f_s_f16m1_f16(vec);
}

inline size_t vsetvl_e16m1(size_t avl) {
  return __riscv_vsetvl_e16m1(avl);
}

// ============================================================================
// Float32m2 Short-name Aliases (LMUL=2)
// ============================================================================

inline size_t vsetvl_e32m2(size_t avl) {
  return __riscv_vsetvl_e32m2(avl);
}

inline vfloat32m2_t vle32_v_f32m2(const float *ptr, size_t vl) {
  return __riscv_vle32_v_f32m2(ptr, vl);
}

inline void vse32_v_f32m2(float *ptr, const vfloat32m2_t &vec, size_t vl) {
  __riscv_vse32_v_f32m2(ptr, vec, vl);
}

inline vfloat32m2_t vfmul_vf_f32m2(const vfloat32m2_t &vec, float scalar,
                                    size_t vl) {
  return __riscv_vfmul_vf_f32m2(vec, scalar, vl);
}

/**
 * vfmul_vf_f32m2_ptr: Vector-scalar multiply where scalar is loaded from pointer
 * This version checks symbolic memory for the scalar value
 */
inline vfloat32m2_t vfmul_vf_f32m2_ptr(const vfloat32m2_t &vec, const float *scalar_ptr,
                                        size_t vl) {
  std::vector<Term> result_elements;
  result_elements.reserve(vl);

  // Check if scalar has a symbolic value in memory
  uintptr_t scalar_addr = reinterpret_cast<uintptr_t>(scalar_ptr);
  Term scalar_term;

  auto it = g_riscv_float_scalar_memory.find(scalar_addr);
  if (it != g_riscv_float_scalar_memory.end()) {
    scalar_term = it->second;
  } else {
    // Fall back to concrete value
    float scalar = *scalar_ptr;
    uint32_t bits;
    std::memcpy(&bits, &scalar, sizeof(float));
    Term bv = g_symbolic_tm->mkBitVector(32, static_cast<uint64_t>(bits));
    Op to_fp_op = g_symbolic_tm->mkOp(Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {8, 24});
    scalar_term = g_symbolic_tm->mkTerm(to_fp_op, {bv});
  }

  Term rm = g_symbolic_tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);

  for (size_t i = 0; i < vl; i++) {
    result_elements.push_back(g_symbolic_tm->mkTerm(
        Kind::FLOATINGPOINT_MULT, {rm, vec.getElement(i), scalar_term}));
  }

  return vfloat32m2_t(g_symbolic_tm, result_elements);
}

#endif // RISCV_SYMBOLIC_INTRINSICS_HPP
