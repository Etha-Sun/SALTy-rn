#ifndef RISCV_SYMBOLIC_TYPES_HPP
#define RISCV_SYMBOLIC_TYPES_HPP

#include <cvc5/cvc5.h>
#include <vector>
#include <string>

using namespace cvc5;

/**
 * Symbolic representation of RISC-V Vector vint32m1_t type
 * Represents a variable-length vector of 32-bit signed integers with LMUL=1
 */
class vint32m1_t {
private:
    std::vector<Term> elements;
    TermManager* tm;
    size_t vl;

public:
    inline vint32m1_t(TermManager* t, size_t vector_length) : tm(t), vl(vector_length) {
        Sort bv32 = tm->mkBitVectorSort(32);
        elements.reserve(vl);
        for (size_t i = 0; i < vl; i++) {
            elements.push_back(tm->mkConst(bv32, "vec_" + std::to_string(i)));
        }
    }

    inline vint32m1_t(TermManager* t, const std::vector<Term>& data)
        : elements(data), tm(t), vl(data.size()) {}


    inline Term getElement(size_t idx) const {
        return elements[idx];
    }

    inline const std::vector<Term>& getElements() const {
        return elements;
    }

    inline size_t getVL() const {
        return vl;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of RISC-V Vector vint8m1_t type
 * Represents a variable-length vector of 8-bit signed integers with LMUL=1
 */
class vint8m1_t {
private:
    std::vector<Term> elements;
    TermManager* tm;
    size_t vl;

public:
    inline vint8m1_t(TermManager* t, size_t vector_length) : tm(t), vl(vector_length) {
        Sort bv8 = tm->mkBitVectorSort(8);
        elements.reserve(vl);
        for (size_t i = 0; i < vl; i++) {
            elements.push_back(tm->mkConst(bv8, "vec_i8_" + std::to_string(i)));
        }
    }

    inline vint8m1_t(TermManager* t, const std::vector<Term>& data)
        : elements(data), tm(t), vl(data.size()) {}


    inline Term getElement(size_t idx) const {
        return elements[idx];
    }

    inline const std::vector<Term>& getElements() const {
        return elements;
    }

    inline size_t getVL() const {
        return vl;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of RISC-V Vector vint16m2_t type
 * Represents a variable-length vector of 16-bit signed integers with LMUL=2
 */
class vint16m2_t {
private:
    std::vector<Term> elements;
    TermManager* tm;
    size_t vl;

public:
    inline vint16m2_t(TermManager* t, size_t vector_length) : tm(t), vl(vector_length) {
        Sort bv16 = tm->mkBitVectorSort(16);
        elements.reserve(vl);
        for (size_t i = 0; i < vl; i++) {
            elements.push_back(tm->mkConst(bv16, "vec_i16_" + std::to_string(i)));
        }
    }

    inline vint16m2_t(TermManager* t, const std::vector<Term>& data)
        : elements(data), tm(t), vl(data.size()) {}


    inline Term getElement(size_t idx) const {
        return elements[idx];
    }

    inline const std::vector<Term>& getElements() const {
        return elements;
    }

    inline size_t getVL() const {
        return vl;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of RISC-V Vector vint32m4_t type
 * Represents a variable-length vector of 32-bit signed integers with LMUL=4
 */
class vint32m4_t {
private:
    std::vector<Term> elements;
    TermManager* tm;
    size_t vl;

public:
    inline vint32m4_t(TermManager* t, size_t vector_length) : tm(t), vl(vector_length) {
        Sort bv32 = tm->mkBitVectorSort(32);
        elements.reserve(vl);
        for (size_t i = 0; i < vl; i++) {
            elements.push_back(tm->mkConst(bv32, "vec_i32m4_" + std::to_string(i)));
        }
    }

    inline vint32m4_t(TermManager* t, const std::vector<Term>& data)
        : elements(data), tm(t), vl(data.size()) {}


    inline Term getElement(size_t idx) const {
        return elements[idx];
    }

    inline const std::vector<Term>& getElements() const {
        return elements;
    }

    inline size_t getVL() const {
        return vl;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

#endif // RISCV_SYMBOLIC_TYPES_HPP
