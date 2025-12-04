#ifndef NEON_SYMBOLIC_TYPES_HPP
#define NEON_SYMBOLIC_TYPES_HPP

#include <cvc5/cvc5.h>
#include <array>
#include <string>
#include <cstdint>
#include "../symbolic_scalar_types.hpp"

using namespace cvc5;

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
    // Default constructor (uses global term manager)
    inline int8x8_t() : tm(g_symbolic_tm) {
        Sort bv8 = tm->mkBitVectorSort(8);
        for (int i = 0; i < 8; i++) {
            lanes[i] = tm->mkConst(bv8, "int8x8_" + std::to_string(i));
        }
    }

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
 * Symbolic representation of ARM NEON int32x2_t vector type
 * Represents 2 lanes of 32-bit signed integers
 */
class int32x2_t {
private:
    std::array<Term, 2> lanes;
    TermManager* tm;

public:
    // Default constructor (uses global term manager)
    inline int32x2_t() : tm(g_symbolic_tm) {
        Sort bv32 = tm->mkBitVectorSort(32);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(bv32, "int32x2_" + std::to_string(i));
        }
    }

    inline int32x2_t(TermManager* t) : tm(t) {
        Sort bv32 = tm->mkBitVectorSort(32);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(bv32, "int32x2_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline int32x2_t(TermManager* t, const std::array<Term, 2>& data)
        : lanes(data), tm(t) {}

    // Constructor with specific name prefix
    inline int32x2_t(TermManager* t, const std::string& name) : tm(t) {
        Sort bv32 = tm->mkBitVectorSort(32);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(bv32, name + "_" + std::to_string(i));
        }
    }

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
 * Symbolic representation of ARM NEON uint32x4_t vector type
 * Represents 4 lanes of 32-bit unsigned integers
 */
class uint32x4_t {
private:
    std::array<Term, 4> lanes;
    TermManager* tm;

public:
    inline uint32x4_t(TermManager* t) : tm(t) {
        Sort bv32 = tm->mkBitVectorSort(32);
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(bv32, "uint32x4_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline uint32x4_t(TermManager* t, const std::array<Term, 4>& data)
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
    // Default constructor for uninitialized declarations
    inline uint8x16_t() : tm(nullptr) {}

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

/**
 * Symbolic representation of ARM NEON float32x4_t vector type
 * Represents 4 lanes of 32-bit floating-point values
 */
class float32x4_t {
private:
    std::array<Term, 4> lanes;
    TermManager* tm;

public:
    // Default constructor (uses global term manager)
    inline float32x4_t() : tm(g_symbolic_tm) {
        Sort fp32 = tm->mkFloatingPointSort(8, 24);  
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(fp32, "float32x4_" + std::to_string(i));
        }
    }

    inline float32x4_t(TermManager* t) : tm(t) {
        Sort fp32 = tm->mkFloatingPointSort(8, 24);  
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(fp32, "float32x4_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline float32x4_t(TermManager* t, const std::array<Term, 4>& data)
        : lanes(data), tm(t) {}

    // Constructor with specific name prefix
    inline float32x4_t(TermManager* t, const std::string& name) : tm(t) {
        Sort fp32 = tm->mkFloatingPointSort(8, 24); 
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(fp32, name + "_" + std::to_string(i));
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
 * Symbolic representation of ARM NEON float32x2_t vector type
 * Represents 2 lanes of 32-bit floating-point values
 */
class float32x2_t {
private:
    std::array<Term, 2> lanes;
    TermManager* tm;

public:
    // Default constructor (uses global term manager)
    inline float32x2_t() : tm(g_symbolic_tm) {
        Sort fp32 = tm->mkFloatingPointSort(8, 24);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(fp32, "float32x2_" + std::to_string(i));
        }
    }

    inline float32x2_t(TermManager* t) : tm(t) {
        Sort fp32 = tm->mkFloatingPointSort(8, 24);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(fp32, "float32x2_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline float32x2_t(TermManager* t, const std::array<Term, 2>& data)
        : lanes(data), tm(t) {}

    // Constructor with specific name prefix
    inline float32x2_t(TermManager* t, const std::string& name) : tm(t) {
        Sort fp32 = tm->mkFloatingPointSort(8, 24);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(fp32, name + "_" + std::to_string(i));
        }
    }

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
 * Symbolic representation of ARM NEON float16x4_t vector type
 * Represents 4 lanes of 16-bit floating-point values (half-precision)
 */
class float16x4_t {
private:
    std::array<Term, 4> lanes;
    TermManager* tm;

public:
    // Default constructor (uses global term manager)
    inline float16x4_t() : tm(g_symbolic_tm) {
        Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(fp16, "float16x4_" + std::to_string(i));
        }
    }

    inline float16x4_t(TermManager* t) : tm(t) {
        Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(fp16, "float16x4_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline float16x4_t(TermManager* t, const std::array<Term, 4>& data)
        : lanes(data), tm(t) {}

    // Constructor with specific name prefix
    inline float16x4_t(TermManager* t, const std::string& name) : tm(t) {
        Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(fp16, name + "_" + std::to_string(i));
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
 * Symbolic representation of ARM NEON float16x8_t vector type
 * Represents 8 lanes of 16-bit floating-point values (half-precision)
 */
class float16x8_t {
private:
    std::array<Term, 8> lanes;
    TermManager* tm;

public:
    // Default constructor (uses global term manager)
    inline float16x8_t() : tm(g_symbolic_tm) {
        Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
        for (int i = 0; i < 8; i++) {
            lanes[i] = tm->mkConst(fp16, "float16x8_" + std::to_string(i));
        }
    }

    inline float16x8_t(TermManager* t) : tm(t) {
        Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
        for (int i = 0; i < 8; i++) {
            lanes[i] = tm->mkConst(fp16, "float16x8_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline float16x8_t(TermManager* t, const std::array<Term, 8>& data)
        : lanes(data), tm(t) {}

    // Constructor with specific name prefix
    inline float16x8_t(TermManager* t, const std::string& name) : tm(t) {
        Sort fp16 = tm->mkFloatingPointSort(5, 11);  // IEEE 754 half precision
        for (int i = 0; i < 8; i++) {
            lanes[i] = tm->mkConst(fp16, name + "_" + std::to_string(i));
        }
    }

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

#endif // NEON_SYMBOLIC_TYPES_HPP
