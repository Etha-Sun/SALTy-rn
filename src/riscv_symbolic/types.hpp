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
 * Symbolic representation of RISC-V Vector vfloat32m1_t type
 * Represents a variable-length vector of 32-bit floating-point values with LMUL=1
 */
class vfloat32m1_t {
private:
  std::vector<Term> elements;
  TermManager *tm;
  size_t vl;

public:
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

#endif // RISCV_SYMBOLIC_TYPES_HPP
