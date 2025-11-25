#ifndef RISCV_SYMBOLIC_INTRINSICS_HPP
#define RISCV_SYMBOLIC_INTRINSICS_HPP

#define __RISCV_VXRM_RNU 0
#define __RISCV_VXRM_RNE 1
#define __RISCV_VXRM_RDN 2
#define __RISCV_VXRM_ROD 3
#include "../symbolic_common.hpp"
#include "memory.hpp"
#include "types.hpp"
#include <cstdint>
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
 * Semantics: Returns the actual vector length that will be used
 */
inline size_t __riscv_vsetvl_e32m1(size_t avl) {
  g_current_vl = avl;
  return avl;
}

/**
 * __riscv_vsetvl_e8m1: Set vector length for 8-bit elements with LMUL=1
 */
inline size_t __riscv_vsetvl_e8m1(size_t avl) {
  g_current_vl = avl;
  return avl;
}

/**
 * __riscv_vsetvl_e8m2: Set vector length for 8-bit elements with LMUL=2
 */
inline size_t __riscv_vsetvl_e8m2(size_t avl) {
  g_current_vl = avl;
  return avl;
}

// ============================================================================
// Load Operations
// ============================================================================

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

#endif // RISCV_SYMBOLIC_INTRINSICS_HPP
