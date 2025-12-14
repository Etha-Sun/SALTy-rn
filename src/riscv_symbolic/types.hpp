#ifndef RISCV_SYMBOLIC_TYPES_HPP
#define RISCV_SYMBOLIC_TYPES_HPP

#include <cvc5/cvc5.h>
#include <string>
#include <vector>
#include <cstdint>
#include "../symbolic_scalar_types.hpp"

using namespace cvc5;

/**
 * Symbolic representation of RISC-V Vector vint32m1_t type
 * Represents a variable-length vector of 32-bit signed integers with LMUL=1
 */
class vint32m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  // Default constructor (uses global term manager, creates uninitialized vector)
  // The vector length will be set when assigned from an operation
  inline vint32m1_t() : tm(g_symbolic_tm), vl(0) {}

  inline vint32m1_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv32 = tm->mkBitVectorSort(32);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv32, "vec_" + std::to_string(i)));
    }
  }

  inline vint32m1_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint8m1_t type
 * Represents a variable-length vector of 8-bit signed integers with LMUL=1
 */
class vint8m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  // Default constructor (uses global term manager, creates uninitialized vector)
  // The vector length will be set when assigned from an operation
  inline vint8m1_t() : tm(g_symbolic_tm), vl(0) {}

  inline vint8m1_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_i8_" + std::to_string(i)));
    }
  }

  inline vint8m1_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint16m2_t type
 * Represents a variable-length vector of 16-bit signed integers with LMUL=2
 */
class vint16m2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint16m2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_i16_" + std::to_string(i)));
    }
  }

  inline vint16m2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint32m4_t type
 * Represents a variable-length vector of 32-bit signed integers with LMUL=4
 */
class vint32m4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint32m4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv32 = tm->mkBitVectorSort(32);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv32, "vec_i32m4_" + std::to_string(i)));
    }
  }

  inline vint32m4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint8m2_t type
 * Represents a variable-length vector of 8-bit signed integers with LMUL=2
 */
class vint8m2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint8m2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_i8m2_" + std::to_string(i)));
    }
  }

  inline vint8m2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint32m8_t type
 * Represents a variable-length vector of 32-bit signed integers with LMUL=8
 */
class vint32m8_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint32m8_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv32 = tm->mkBitVectorSort(32);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv32, "vec_i32m8_" + std::to_string(i)));
    }
  }

  inline vint32m8_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint16m4_t type
 * Represents a variable-length vector of 16-bit signed integers with LMUL=4
 */
class vint16m4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint16m4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_i16m4_" + std::to_string(i)));
    }
  }

  inline vint16m4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint8m1_t type
 * Represents a variable-length vector of 8-bit unsigned integers with LMUL=1
 */
class vuint8m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint8m1_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_u8m1_" + std::to_string(i)));
    }
  }

  inline vuint8m1_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint8m2_t type
 * Represents a variable-length vector of 8-bit unsigned integers with LMUL=2
 */
class vuint8m2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint8m2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_u8m2_" + std::to_string(i)));
    }
  }

  inline vuint8m2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint16m2_t type
 * Represents a variable-length vector of 16-bit unsigned integers with LMUL=2
 */
class vuint16m2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint16m2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_u16m2_" + std::to_string(i)));
    }
  }

  inline vuint16m2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat16m2_t type
 * Represents a variable-length vector of 16-bit floating-point values with LMUL=2
 */
class vfloat16m2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vfloat16m2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(fp16, "vec_f16m2_" + std::to_string(i)));
    }
  }

  inline vfloat16m2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat32m4_t type
 * Represents a variable-length vector of 32-bit floating-point values with LMUL=4
 */
class vfloat32m4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vfloat32m4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort fp32 = tm->mkFloatingPointSort(8, 24);  // IEEE 754 single precision
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(fp32, "vec_f32m4_" + std::to_string(i)));
    }
  }

  inline vfloat32m4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat32m8_t type
 * Represents a variable-length vector of 32-bit floating-point values with LMUL=8
 */
class vfloat32m8_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vfloat32m8_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort fp32 = tm->mkFloatingPointSort(8, 24);  // IEEE 754 single precision
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(fp32, "vec_f32m8_" + std::to_string(i)));
    }
  }

  inline vfloat32m8_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vbool8_t type
 * Represents a mask vector (1 bit per 8-bit element group)
 * Each element is a 1-bit boolean term
 */
class vbool8_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vbool8_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv1 = tm->mkBitVectorSort(1);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv1, "mask_" + std::to_string(i)));
    }
  }

  inline vbool8_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vbool16_t type
 * Represents a mask type with one bit per 16-bit element (LMUL=1)
 * Used for masking operations on 16-bit vector types
 */
class vbool16_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vbool16_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bool_sort = tm->getBooleanSort();
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bool_sort, "mask16_" + std::to_string(i)));
    }
  }

  inline vbool16_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vbool32_t type
 * Represents a mask type with one bit per 32-bit element (LMUL=1)
 * Used for masking operations on 32-bit vector types
 */
class vbool32_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vbool32_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bool_sort = tm->getBooleanSort();
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bool_sort, "mask32_" + std::to_string(i)));
    }
  }

  inline vbool32_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vbool4_t type
 * Represents a mask type with one bit per 64-bit element (LMUL=1)
 * Used for masking operations on 64-bit vector types (e.g., vfloat64m1_t)
 */
class vbool4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vbool4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bool_sort = tm->getBooleanSort();
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bool_sort, "mask4_" + std::to_string(i)));
    }
  }

  inline vbool4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint8mf2_t type
 * Represents a variable-length vector of 8-bit unsigned integers with LMUL=1/2
 */
class vuint8mf2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint8mf2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_u8mf2_" + std::to_string(i)));
    }
  }

  inline vuint8mf2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint8mf4_t type
 * Represents a variable-length vector of 8-bit unsigned integers with LMUL=1/4
 */
class vuint8mf4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint8mf4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_u8mf4_" + std::to_string(i)));
    }
  }

  inline vuint8mf4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint8mf4_t type
 * Represents a variable-length vector of 8-bit signed integers with LMUL=1/4
 */
class vint8mf4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint8mf4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_i8mf4_" + std::to_string(i)));
    }
  }

  inline vint8mf4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint16m1_t type
 * Represents a variable-length vector of 16-bit unsigned integers with LMUL=1
 */
class vuint16m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint16m1_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_u16m1_" + std::to_string(i)));
    }
  }

  inline vuint16m1_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint16mf2_t type
 * Represents a variable-length vector of 16-bit unsigned integers with LMUL=1/2
 */
class vuint16mf2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint16mf2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_u16mf2_" + std::to_string(i)));
    }
  }

  inline vuint16mf2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint16m1_t type
 * Represents a variable-length vector of 16-bit signed integers with LMUL=1
 */
class vint16m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint16m1_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_i16m1_" + std::to_string(i)));
    }
  }

  inline vint16m1_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint16mf2_t type
 * Represents a variable-length vector of 16-bit signed integers with LMUL=1/2
 */
class vint16mf2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint16mf2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_i16mf2_" + std::to_string(i)));
    }
  }

  inline vint16mf2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint32m1_t type
 * Represents a variable-length vector of 32-bit unsigned integers with LMUL=1
 */
class vuint32m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  // Default constructor (uses global term manager, creates uninitialized vector)
  // The vector length will be set when assigned from an operation
  inline vuint32m1_t() : tm(g_symbolic_tm), vl(0) {}

  inline vuint32m1_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv32 = tm->mkBitVectorSort(32);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv32, "vec_u32m1_" + std::to_string(i)));
    }
  }

  inline vuint32m1_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint32m4_t type
 * Represents a variable-length vector of 32-bit unsigned integers with LMUL=4
 */
class vuint32m4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint32m4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv32 = tm->mkBitVectorSort(32);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv32, "vec_u32m4_" + std::to_string(i)));
    }
  }

  inline vuint32m4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint32m8_t type
 * Represents a variable-length vector of 32-bit unsigned integers with LMUL=8
 */
class vuint32m8_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint32m8_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv32 = tm->mkBitVectorSort(32);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv32, "vec_u32m8_" + std::to_string(i)));
    }
  }

  inline vuint32m8_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat32m1_t type
 * Represents a variable-length vector of 32-bit floating-point values with LMUL=1
 */
class vfloat32m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  // Default constructor (uses global term manager, creates uninitialized vector)
  // The vector length will be set when assigned from an operation
  inline vfloat32m1_t() : tm(g_symbolic_tm), vl(0) {}

  inline vfloat32m1_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort fp32 = tm->mkFloatingPointSort(8, 24);  // IEEE 754 single precision
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(fp32, "vec_f32m1_" + std::to_string(i)));
    }
  }

  inline vfloat32m1_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint8m8_t type
 * Represents a variable-length vector of 8-bit unsigned integers with LMUL=8
 */
class vuint8m8_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint8m8_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_u8m8_" + std::to_string(i)));
    }
  }

  inline vuint8m8_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint32m1x4_t tuple type
 * Represents a tuple of 4 vuint32m1_t vectors (used for segment load/store)
 */
class vuint32m1x4_t {
private:
  vuint32m1_t v0, v1, v2, v3;

public:
  inline vuint32m1x4_t(const vuint32m1_t& vec0, const vuint32m1_t& vec1,
                       const vuint32m1_t& vec2, const vuint32m1_t& vec3)
      : v0(vec0), v1(vec1), v2(vec2), v3(vec3) {}

  inline const vuint32m1_t& get0() const { return v0; }
  inline const vuint32m1_t& get1() const { return v1; }
  inline const vuint32m1_t& get2() const { return v2; }
  inline const vuint32m1_t& get3() const { return v3; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat32m1x2_t tuple type
 * Represents a tuple of 2 vfloat32m1_t vectors (used for segment load/store)
 */
class vfloat32m1x2_t {
private:
  vfloat32m1_t v0, v1;

public:
  inline vfloat32m1x2_t(const vfloat32m1_t& vec0, const vfloat32m1_t& vec1)
      : v0(vec0), v1(vec1) {}

  inline const vfloat32m1_t& get0() const { return v0; }
  inline const vfloat32m1_t& get1() const { return v1; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat32m2_t type
 * Represents a variable-length vector of 32-bit floating-point values with LMUL=2
 */
class vfloat32m2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vfloat32m2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort fp32 = tm->mkFloatingPointSort(8, 24);  // IEEE 754 single precision
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(fp32, "vec_f32m2_" + std::to_string(i)));
    }
  }

  inline vfloat32m2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat16m1_t type
 * Represents a variable-length vector of 16-bit floating-point values with LMUL=1
 */
class vfloat16m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vfloat16m1_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(fp16, "vec_f16m1_" + std::to_string(i)));
    }
  }

  inline vfloat16m1_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint32m2_t type
 * Represents a variable-length vector of 32-bit signed integers with LMUL=2
 */
class vint32m2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint32m2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv32 = tm->mkBitVectorSort(32);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv32, "vec_i32m2_" + std::to_string(i)));
    }
  }

  inline vint32m2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vint8mf2_t type
 * Represents a variable-length vector of 8-bit signed integers with LMUL=1/2
 */
class vint8mf2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vint8mf2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv8 = tm->mkBitVectorSort(8);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv8, "vec_i8mf2_" + std::to_string(i)));
    }
  }

  inline vint8mf2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint16m4_t type
 * Represents a variable-length vector of 16-bit unsigned integers with LMUL=4
 */
class vuint16m4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint16m4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_u16m4_" + std::to_string(i)));
    }
  }

  inline vuint16m4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat16m4_t type
 * Represents a variable-length vector of 16-bit floating-point values with LMUL=4
 */
class vfloat16m4_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vfloat16m4_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(fp16, "vec_f16m4_" + std::to_string(i)));
    }
  }

  inline vfloat16m4_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vuint16m8_t type
 * Represents a variable-length vector of 16-bit unsigned integers with LMUL=8
 */
class vuint16m8_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vuint16m8_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bv16 = tm->mkBitVectorSort(16);
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bv16, "vec_u16m8_" + std::to_string(i)));
    }
  }

  inline vuint16m8_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vfloat16m8_t type
 * Represents a variable-length vector of 16-bit floating-point values with LMUL=8
 */
class vfloat16m8_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vfloat16m8_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(fp16, "vec_f16m8_" + std::to_string(i)));
    }
  }

  inline vfloat16m8_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

/**
 * Symbolic representation of RISC-V Vector vbool2_t type
 * Represents a mask type with one bit per element for LMUL=8 with 16-bit elements
 * (or LMUL=4 with 8-bit elements, etc.)
 * Used for masking operations on high-LMUL vector types
 */
class vbool2_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
  inline vbool2_t(TermManager *t, size_t vector_length)
      : tm(t), vl(vector_length) {
    Sort bool_sort = tm->getBooleanSort();
    elements.reserve(vl);
    for (size_t i = 0; i < vl; i++) {
      elements.push_back(tm->mkConst(bool_sort, "mask2_" + std::to_string(i)));
    }
  }

  inline vbool2_t(TermManager *t, const std::vector<Term> &data)
      : elements(data), tm(t), vl(data.size()) {}

  inline Term getElement(size_t idx) const { return elements[idx]; }

  inline const std::vector<Term> &getElements() const { return elements; }

  inline size_t getVL() const { return vl; }

  inline TermManager *getTermManager() const { return tm; }
};

#endif // RISCV_SYMBOLIC_TYPES_HPP
