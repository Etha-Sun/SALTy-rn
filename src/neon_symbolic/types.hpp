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
    // Default constructor (uses global term manager)
    inline uint32x4_t() : tm(g_symbolic_tm) {
        Sort bv32 = tm->mkBitVectorSort(32);
        for (int i = 0; i < 4; i++) {
            lanes[i] = tm->mkConst(bv32, "uint32x4_" + std::to_string(i));
        }
    }

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
 * Symbolic representation of ARM NEON int64x2_t vector type
 * Represents 2 lanes of 64-bit signed integers
 */
class int64x2_t {
private:
    std::array<Term, 2> lanes;
    TermManager* tm;

public:
    inline int64x2_t(TermManager* t) : tm(t) {
        Sort bv64 = tm->mkBitVectorSort(64);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(bv64, "int64x2_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline int64x2_t(TermManager* t, const std::array<Term, 2>& data)
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
 * Symbolic representation of ARM NEON uint64x1_t vector type
 * Represents 1 lane of 64-bit unsigned integer
 */
class uint64x1_t {
private:
    std::array<Term, 1> lanes;
    TermManager* tm;

public:
    inline uint64x1_t(TermManager* t) : tm(t) {
        Sort bv64 = tm->mkBitVectorSort(64);
        lanes[0] = tm->mkConst(bv64, "uint64x1_0");
    }

    // Constructor with existing terms
    inline uint64x1_t(TermManager* t, const std::array<Term, 1>& data)
        : lanes(data), tm(t) {}

    inline Term getLane(int idx) const {
        return lanes[idx];
    }

    inline const std::array<Term, 1>& getLanes() const {
        return lanes;
    }

    inline TermManager* getTermManager() const {
        return tm;
    }
};

/**
 * Symbolic representation of ARM NEON uint64x2_t vector type
 * Represents 2 lanes of 64-bit unsigned integers
 */
class uint64x2_t {
private:
    std::array<Term, 2> lanes;
    TermManager* tm;

public:
    inline uint64x2_t(TermManager* t) : tm(t) {
        Sort bv64 = tm->mkBitVectorSort(64);
        for (int i = 0; i < 2; i++) {
            lanes[i] = tm->mkConst(bv64, "uint64x2_" + std::to_string(i));
        }
    }

    // Constructor with existing terms
    inline uint64x2_t(TermManager* t, const std::array<Term, 2>& data)
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

// ============================================================================
// Tuple Types for zip/unzip operations
// ============================================================================

/**
 * uint32x4x2_t: Tuple of two uint32x4_t vectors
 * Used by vzipq_u32 and similar operations
 */
struct uint32x4x2_t {
    uint32x4_t val[2];

    uint32x4x2_t() : val{uint32x4_t(g_symbolic_tm), uint32x4_t(g_symbolic_tm)} {}
    uint32x4x2_t(const uint32x4_t& v0, const uint32x4_t& v1) : val{v0, v1} {}
};

/**
 * uint32x4x3_t: Tuple of three uint32x4_t vectors
 * Used by vld3q_u32, vld3q_lane_u32 and similar operations
 */
struct uint32x4x3_t {
    uint32x4_t val[3];

    uint32x4x3_t() : val{uint32x4_t(g_symbolic_tm), uint32x4_t(g_symbolic_tm), uint32x4_t(g_symbolic_tm)} {}
    uint32x4x3_t(const uint32x4_t& v0, const uint32x4_t& v1, const uint32x4_t& v2) : val{v0, v1, v2} {}
};

/**
 * uint32x4x4_t: Tuple of four uint32x4_t vectors
 * Used by vld4q_u32 and similar operations
 */
struct uint32x4x4_t {
    uint32x4_t val[4];

    uint32x4x4_t() : val{uint32x4_t(g_symbolic_tm), uint32x4_t(g_symbolic_tm), uint32x4_t(g_symbolic_tm), uint32x4_t(g_symbolic_tm)} {}
    uint32x4x4_t(const uint32x4_t& v0, const uint32x4_t& v1, const uint32x4_t& v2, const uint32x4_t& v3) : val{v0, v1, v2, v3} {}
};

/**
 * uint32x2x2_t: Tuple of two uint32x2_t vectors
 * Used by vzip_u32 and similar operations
 */
struct uint32x2x2_t {
    uint32x2_t val[2];

    uint32x2x2_t() : val{uint32x2_t(g_symbolic_tm), uint32x2_t(g_symbolic_tm)} {}
    uint32x2x2_t(const uint32x2_t& v0, const uint32x2_t& v1) : val{v0, v1} {}
};

/**
 * int32x4x2_t: Tuple of two int32x4_t vectors
 * Used by vzipq_s32 and similar operations
 */
struct int32x4x2_t {
    int32x4_t val[2];

    int32x4x2_t() : val{int32x4_t(g_symbolic_tm), int32x4_t(g_symbolic_tm)} {}
    int32x4x2_t(const int32x4_t& v0, const int32x4_t& v1) : val{v0, v1} {}
};

/**
 * int32x2x2_t: Tuple of two int32x2_t vectors
 * Used by vzip_s32 and similar operations
 */
struct int32x2x2_t {
    int32x2_t val[2];

    int32x2x2_t() : val{int32x2_t(g_symbolic_tm), int32x2_t(g_symbolic_tm)} {}
    int32x2x2_t(const int32x2_t& v0, const int32x2_t& v1) : val{v0, v1} {}
};

/**
 * uint8x8x2_t: Tuple of two uint8x8_t vectors
 * Used by vtbl2_u8 and similar operations
 */
struct uint8x8x2_t {
    uint8x8_t val[2];

    uint8x8x2_t() : val{uint8x8_t(g_symbolic_tm), uint8x8_t(g_symbolic_tm)} {}
    uint8x8x2_t(const uint8x8_t& v0, const uint8x8_t& v1) : val{v0, v1} {}
};

/**
 * uint16x8x2_t: Tuple of two uint16x8_t vectors
 * Used by vld2q_lane_u16 and similar operations
 */
struct uint16x8x2_t {
    uint16x8_t val[2];

    uint16x8x2_t() : val{uint16x8_t(g_symbolic_tm), uint16x8_t(g_symbolic_tm)} {}
    uint16x8x2_t(const uint16x8_t& v0, const uint16x8_t& v1) : val{v0, v1} {}
};

/**
 * uint16x8x3_t: Tuple of three uint16x8_t vectors
 * Used by vld3q_lane_u16 and similar operations
 */
struct uint16x8x3_t {
    uint16x8_t val[3];

    uint16x8x3_t() : val{uint16x8_t(g_symbolic_tm), uint16x8_t(g_symbolic_tm), uint16x8_t(g_symbolic_tm)} {}
    uint16x8x3_t(const uint16x8_t& v0, const uint16x8_t& v1, const uint16x8_t& v2) : val{v0, v1, v2} {}
};

/**
 * uint16x8x4_t: Tuple of four uint16x8_t vectors
 * Used by vld4q_lane_u16 and similar operations
 */
struct uint16x8x4_t {
    uint16x8_t val[4];

    uint16x8x4_t() : val{uint16x8_t(g_symbolic_tm), uint16x8_t(g_symbolic_tm), uint16x8_t(g_symbolic_tm), uint16x8_t(g_symbolic_tm)} {}
    uint16x8x4_t(const uint16x8_t& v0, const uint16x8_t& v1, const uint16x8_t& v2, const uint16x8_t& v3) : val{v0, v1, v2, v3} {}
};

/**
 * uint8x16x4_t: Tuple of four uint8x16_t vectors
 * Used by vld1q_u8_x4 and similar operations
 */
struct uint8x16x4_t {
    uint8x16_t val[4];

    uint8x16x4_t() : val{uint8x16_t(g_symbolic_tm), uint8x16_t(g_symbolic_tm), uint8x16_t(g_symbolic_tm), uint8x16_t(g_symbolic_tm)} {}
    uint8x16x4_t(const uint8x16_t& v0, const uint8x16_t& v1, const uint8x16_t& v2, const uint8x16_t& v3) : val{v0, v1, v2, v3} {}
};

/**
 * float32x4x2_t: Tuple of two float32x4_t vectors
 * Used by vzipq_f32 and similar operations that produce two result vectors
 */
struct float32x4x2_t {
    float32x4_t val[2];

    float32x4x2_t() : val{float32x4_t(g_symbolic_tm), float32x4_t(g_symbolic_tm)} {}
    float32x4x2_t(const float32x4_t& v0, const float32x4_t& v1) : val{v0, v1} {}
};

/**
 * float32x2x2_t: Tuple of two float32x2_t vectors
 * Used by vuzp_f32, vld2_f32 and similar operations that produce two result vectors
 */
struct float32x2x2_t {
    float32x2_t val[2];

    float32x2x2_t() : val{float32x2_t(g_symbolic_tm), float32x2_t(g_symbolic_tm)} {}
    float32x2x2_t(const float32x2_t& v0, const float32x2_t& v1) : val{v0, v1} {}
};

#endif // NEON_SYMBOLIC_TYPES_HPP
