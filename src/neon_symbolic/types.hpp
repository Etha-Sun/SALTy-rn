#ifndef NEON_SYMBOLIC_TYPES_HPP
#define NEON_SYMBOLIC_TYPES_HPP

#include <cvc5/cvc5.h>
#include <array>
#include <string>
#include <cstdint>

using namespace cvc5;

/**
 * Symbolic wrapper for int32_t scalar values
 * Tracks both symbolic Term and concrete value for operations
 */
class symbolic_int32_t {
private:
    Term symbolic_term;
    std::int32_t concrete_value;
    TermManager* tm;

public:
    // Constructor from concrete value
    symbolic_int32_t(TermManager* t, std::int32_t val = 0) 
        : concrete_value(val), tm(t) {
        symbolic_term = tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(val)));
    }
    
    // Constructor from symbolic Term
    symbolic_int32_t(TermManager* t, Term term, std::int32_t placeholder = 0) 
        : symbolic_term(term), concrete_value(placeholder), tm(t) {}
    
    // Addition operator
    symbolic_int32_t operator+(const symbolic_int32_t& other) const {
        Term result = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, other.symbolic_term});
        return symbolic_int32_t(tm, result, concrete_value + other.concrete_value);
    }
    
    // Addition with concrete int32_t
    symbolic_int32_t operator+(std::int32_t val) const {
        Term val_term = tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(val)));
        Term result = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, val_term});
        return symbolic_int32_t(tm, result, concrete_value + val);
    }
    
    // Compound addition
    symbolic_int32_t& operator+=(const symbolic_int32_t& other) {
        symbolic_term = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, other.symbolic_term});
        concrete_value += other.concrete_value;
        return *this;
    }
    
    // Compound addition with concrete int32_t
    symbolic_int32_t& operator+=(std::int32_t val) {
        Term val_term = tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(val)));
        symbolic_term = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, val_term});
        concrete_value += val;
        return *this;
    }
    
    // Conversion to concrete int32_t (for compatibility)
    operator std::int32_t() const { return concrete_value; }
    
    // Access to symbolic term for verification
    Term getTerm() const { return symbolic_term; }
    
    TermManager* getTermManager() const { return tm; }
};

/**
 * Symbolic representation of ARM NEON int32x4_t vector type
 * Represents 4 lanes of 32-bit signed integers
 */
class int32x4_t {
private:
    std::array<Term, 4> lanes;
    TermManager* tm;

public:
    inline int32x4_t(TermManager* t) : tm(t) {
        Sort bv32 = tm->mkBitVectorSort(32);
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(bv32, "int_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline int32x4_t(TermManager* t, const std::array<Term, 4>& data)
        : lanes(data), tm(t) {}

    // Constructor with specific name prefix
    inline int32x4_t(TermManager* t, const std::string& name) : tm(t) {
        Sort bv32 = tm->mkBitVectorSort(32);
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(bv32, name + "_" + std::to_string(i));
        }
    }

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 4>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON int8x16_t vector type
 * Represents 16 lanes of 8-bit signed integers
 */
class int8x16_t {
private:
    std::array<Term, 16> lanes;
    TermManager* tm;

public:
    inline int8x16_t(TermManager* t) : tm(t) {
        Sort bv8 = tm->mkBitVectorSort(8);
        for (int i = 0; i < 16; i++) {
            lanes[i] = tm->mkConst(bv8, "int8x16_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline int8x16_t(TermManager* t, const std::array<Term, 16>& data)
        : lanes(data), tm(t) {}


    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 16>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON int8x8_t vector type
 * Represents 8 lanes of 8-bit signed integers
 */
class int8x8_t {
private:
    std::array<Term, 8> lanes;
    TermManager* tm;

public:
    inline int8x8_t(TermManager* t) : tm(t) {
        Sort bv8 = tm->mkBitVectorSort(8);
        for (int i = 0; i < 8; i++) {
            lanes[i] = tm->mkConst(bv8, "int8x8_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline int8x8_t(TermManager* t, const std::array<Term, 8>& data)
        : lanes(data), tm(t) {}

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 8>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON int16x8_t vector type
 * Represents 8 lanes of 16-bit signed integers
 */
class int16x8_t {
private:
    std::array<Term, 8> lanes;
    TermManager* tm;

public:
    inline int16x8_t(TermManager* t) : tm(t) {
        Sort bv16 = tm->mkBitVectorSort(16);
        for (int i = 0; i < 8; i++) {
            lanes[i] = tm->mkConst(bv16, "int16x8_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline int16x8_t(TermManager* t, const std::array<Term, 8>& data)
        : lanes(data), tm(t) {}


    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 8>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON int16x4_t vector type
 * Represents 4 lanes of 16-bit signed integers
 */
class int16x4_t {
private:
    std::array<Term, 4> lanes;
    TermManager* tm;

public:
    inline int16x4_t(TermManager* t) : tm(t) {
        Sort bv16 = tm->mkBitVectorSort(16);
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(bv16, "int16x4_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline int16x4_t(TermManager* t, const std::array<Term, 4>& data)
        : lanes(data), tm(t) {}

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 4>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON uint32x2_t vector type
 * Represents 2 lanes of 32-bit unsigned integers
 */
class uint32x2_t {
private:
    std::array<Term, 2> lanes;
    TermManager* tm;

public:
    inline uint32x2_t(TermManager* t) : tm(t) {
        Sort bv32 = tm->mkBitVectorSort(32);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(bv32, "uint32x2_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline uint32x2_t(TermManager* t, const std::array<Term, 2>& data)
        : lanes(data), tm(t) {}

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 2>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON uint16x4_t vector type
 * Represents 4 lanes of 16-bit unsigned integers
 */
class uint16x4_t {
private:
    std::array<Term, 4> lanes;
    TermManager* tm;

public:
    inline uint16x4_t(TermManager* t) : tm(t) {
        Sort bv16 = tm->mkBitVectorSort(16);
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(bv16, "uint16x4_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline uint16x4_t(TermManager* t, const std::array<Term, 4>& data)
        : lanes(data), tm(t) {}

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 4>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON uint16x8_t vector type
 * Represents 8 lanes of 16-bit unsigned integers
 */
class uint16x8_t {
private:
    std::array<Term, 8> lanes;
    TermManager* tm;

public:
    inline uint16x8_t(TermManager* t) : tm(t) {
        Sort bv16 = tm->mkBitVectorSort(16);
        for (int i = 0; i < 8; i++) {
            lanes[i] = tm->mkConst(bv16, "uint16x8_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline uint16x8_t(TermManager* t, const std::array<Term, 8>& data)
        : lanes(data), tm(t) {}

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 8>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON uint8x8_t vector type
 * Represents 8 lanes of 8-bit unsigned integers
 */
class uint8x8_t {
private:
    std::array<Term, 8> lanes;
    TermManager* tm;

public:
    inline uint8x8_t(TermManager* t) : tm(t) {
        Sort bv8 = tm->mkBitVectorSort(8);
        for (int i = 0; i < 8; i++) {
            lanes[i] = tm->mkConst(bv8, "uint8x8_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline uint8x8_t(TermManager* t, const std::array<Term, 8>& data)
        : lanes(data), tm(t) {}

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 8>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON uint8x16_t vector type
 * Represents 16 lanes of 8-bit unsigned integers
 */
class uint8x16_t {
private:
    std::array<Term, 16> lanes;
    TermManager* tm;

public:
    inline uint8x16_t(TermManager* t) : tm(t) {
        Sort bv8 = tm->mkBitVectorSort(8);
        for (int i = 0; i < 16; i++) {
            lanes[i] = tm->mkConst(bv8, "uint8x16_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline uint8x16_t(TermManager* t, const std::array<Term, 16>& data)
        : lanes(data), tm(t) {}

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 16>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

#endif // NEON_SYMBOLIC_TYPES_HPP
