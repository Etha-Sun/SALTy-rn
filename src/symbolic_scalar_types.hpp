#ifndef SYMBOLIC_SCALAR_TYPES_HPP
#define SYMBOLIC_SCALAR_TYPES_HPP

#include "symbolic_common.hpp"
#include <cstdint>
#include <map>

// Memory tracking for int32_t scalar writes (address -> symbolic term)
// These are defined here to avoid circular dependencies
inline std::map<uintptr_t, Term> g_neon_scalar_memory;
inline std::map<uintptr_t, Term> g_riscv_scalar_memory;

/**
 * Symbolic wrapper for int32_t scalar values
 * Tracks both symbolic Term and concrete value for operations
 * Shared between NEON and RISC-V implementations
 */
class symbolic_int32_t {
private:
    Term symbolic_term;
    std::int32_t concrete_value;
    TermManager* tm;
    bool is_neon;  // Track which architecture this is for

public:
    // Constructor from concrete value
    symbolic_int32_t(TermManager* t, std::int32_t val = 0, bool neon = true) 
        : concrete_value(val), tm(t), is_neon(neon) {
        symbolic_term = tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(val)));
    }
    
    // Constructor from symbolic Term
    symbolic_int32_t(TermManager* t, Term term, std::int32_t placeholder = 0, bool neon = true) 
        : symbolic_term(term), concrete_value(placeholder), tm(t), is_neon(neon) {}
    
    // Addition operator
    symbolic_int32_t operator+(const symbolic_int32_t& other) const {
        Term result = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, other.symbolic_term});
        return symbolic_int32_t(tm, result, concrete_value + other.concrete_value, is_neon);
    }
    
    // Addition with concrete int32_t
    symbolic_int32_t operator+(std::int32_t val) const {
        Term val_term = tm->mkBitVector(32, static_cast<uint64_t>(static_cast<uint32_t>(val)));
        Term result = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, val_term});
        return symbolic_int32_t(tm, result, concrete_value + val, is_neon);
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
    
    bool isNeon() const { return is_neon; }
};

// Global operator+= for int32_t& and symbolic_int32_t
// This intercepts *output += result and tracks the symbolic term
inline void operator+=(int32_t& lhs, const symbolic_int32_t& rhs) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&lhs);

    // Choose correct memory map based on architecture
    auto& memory_map = rhs.isNeon() ? g_neon_scalar_memory : g_riscv_scalar_memory;

    // Read existing symbolic value if present
    Term existing_term;
    if (memory_map.count(addr) && !memory_map[addr].isNull()) {
        existing_term = memory_map[addr];
    } else {
        // Create term from current concrete value
        existing_term = rhs.getTermManager()->mkBitVector(
            32, static_cast<uint64_t>(static_cast<uint32_t>(lhs)));
    }

    // Add the symbolic terms
    Term result = rhs.getTermManager()->mkTerm(
        Kind::BITVECTOR_ADD, {existing_term, rhs.getTerm()});
    memory_map[addr] = result;

    // Do the concrete operation
    lhs += static_cast<std::int32_t>(rhs);
}

/**
 * Symbolic wrapper for uint32_t scalar values
 * Tracks both symbolic Term and concrete value for operations
 */
class symbolic_uint32_t {
private:
    Term symbolic_term;
    std::uint32_t concrete_value;
    TermManager* tm;
    bool is_neon;  // Track which architecture this is for

public:
    // Constructor from concrete value
    symbolic_uint32_t(TermManager* t, std::uint32_t val = 0, bool neon = true)
        : concrete_value(val), tm(t), is_neon(neon) {
        symbolic_term = tm->mkBitVector(32, static_cast<uint64_t>(val));
    }

    // Constructor from symbolic Term
    symbolic_uint32_t(TermManager* t, Term term, std::uint32_t placeholder = 0, bool neon = true)
        : symbolic_term(term), concrete_value(placeholder), tm(t), is_neon(neon) {}

    // Addition operator
    symbolic_uint32_t operator+(const symbolic_uint32_t& other) const {
        Term result = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, other.symbolic_term});
        return symbolic_uint32_t(tm, result, concrete_value + other.concrete_value, is_neon);
    }

    // Addition with concrete uint32_t
    symbolic_uint32_t operator+(std::uint32_t val) const {
        Term val_term = tm->mkBitVector(32, static_cast<uint64_t>(val));
        Term result = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, val_term});
        return symbolic_uint32_t(tm, result, concrete_value + val, is_neon);
    }

    // Compound addition
    symbolic_uint32_t& operator+=(const symbolic_uint32_t& other) {
        symbolic_term = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, other.symbolic_term});
        concrete_value += other.concrete_value;
        return *this;
    }

    // Compound addition with concrete uint32_t
    symbolic_uint32_t& operator+=(std::uint32_t val) {
        Term val_term = tm->mkBitVector(32, static_cast<uint64_t>(val));
        symbolic_term = tm->mkTerm(Kind::BITVECTOR_ADD, {symbolic_term, val_term});
        concrete_value += val;
        return *this;
    }

    // Conversion to concrete uint32_t (for compatibility)
    operator std::uint32_t() const { return concrete_value; }

    // Access to symbolic term for verification
    Term getTerm() const { return symbolic_term; }

    TermManager* getTermManager() const { return tm; }

    bool isNeon() const { return is_neon; }
};

// Global operator+= for uint32_t& and symbolic_uint32_t
// This intercepts *output += result and tracks the symbolic term
inline void operator+=(uint32_t& lhs, const symbolic_uint32_t& rhs) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&lhs);

    // Choose correct memory map based on architecture
    auto& memory_map = rhs.isNeon() ? g_neon_scalar_memory : g_riscv_scalar_memory;

    // Read existing symbolic value if present
    Term existing_term;
    if (memory_map.count(addr) && !memory_map[addr].isNull()) {
        existing_term = memory_map[addr];
    } else {
        // Create term from current concrete value
        existing_term = rhs.getTermManager()->mkBitVector(
            32, static_cast<uint64_t>(lhs));
    }

    // Add the symbolic terms
    Term result = rhs.getTermManager()->mkTerm(
        Kind::BITVECTOR_ADD, {existing_term, rhs.getTerm()});
    memory_map[addr] = result;

    // Do the concrete operation
    lhs += static_cast<std::uint32_t>(rhs);
}

// Memory tracking for float scalar writes
inline std::map<uintptr_t, Term> g_neon_float_scalar_memory;
inline std::map<uintptr_t, Term> g_riscv_float_scalar_memory;

/**
 * Symbolic wrapper for float scalar values
 * Tracks both symbolic Term and concrete value for operations
 */
class symbolic_float32_t {
private:
    Term symbolic_term;
    float concrete_value;
    TermManager* tm;
    bool is_neon;

public:
    // Default constructor - creates an uninitialized symbolic float
    // This allows array declarations like symbolic_float32_t arr[4];
    symbolic_float32_t() : concrete_value(0.0f), tm(nullptr), is_neon(false) {}

    // Constructor from concrete value
    symbolic_float32_t(TermManager* t, float val = 0.0f, bool neon = true)
        : concrete_value(val), tm(t), is_neon(neon) {
        uint32_t bits;
        std::memcpy(&bits, &val, sizeof(bits));
        symbolic_term = tm->mkFloatingPoint(8, 24, tm->mkBitVector(32, static_cast<uint64_t>(bits)));
    }

    // Constructor from symbolic Term
    symbolic_float32_t(TermManager* t, Term term, float placeholder = 0.0f, bool neon = true)
        : symbolic_term(term), concrete_value(placeholder), tm(t), is_neon(neon) {}

    // Conversion to concrete float (for compatibility)
    operator float() const { return concrete_value; }

    // Access to symbolic term for verification
    Term getTerm() const { return symbolic_term; }

    TermManager* getTermManager() const { return tm; }

    bool isNeon() const { return is_neon; }

    // Arithmetic operations for symbolic floats
    symbolic_float32_t operator+(const symbolic_float32_t& other) const {
        Term rm = tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
        Term result = tm->mkTerm(Kind::FLOATINGPOINT_ADD, {rm, symbolic_term, other.symbolic_term});
        return symbolic_float32_t(tm, result, concrete_value + other.concrete_value, is_neon);
    }

    symbolic_float32_t operator-(const symbolic_float32_t& other) const {
        Term rm = tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
        Term result = tm->mkTerm(Kind::FLOATINGPOINT_SUB, {rm, symbolic_term, other.symbolic_term});
        return symbolic_float32_t(tm, result, concrete_value - other.concrete_value, is_neon);
    }

    symbolic_float32_t operator*(const symbolic_float32_t& other) const {
        Term rm = tm->mkRoundingMode(RoundingMode::ROUND_NEAREST_TIES_TO_EVEN);
        Term result = tm->mkTerm(Kind::FLOATINGPOINT_MULT, {rm, symbolic_term, other.symbolic_term});
        return symbolic_float32_t(tm, result, concrete_value * other.concrete_value, is_neon);
    }
};

// Assignment operator for float& from symbolic_float32_t
// This intercepts *output = result and tracks the symbolic term
inline void operator_assign_float(float& lhs, const symbolic_float32_t& rhs) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(&lhs);
    auto& memory_map = rhs.isNeon() ? g_neon_float_scalar_memory : g_riscv_float_scalar_memory;
    memory_map[addr] = rhs.getTerm();
    lhs = static_cast<float>(rhs);
}

/**
 * symbolic_fmin: Element-wise minimum of two symbolic floats
 * result = a < b ? a : b
 */
inline symbolic_float32_t symbolic_fmin(const symbolic_float32_t& a, const symbolic_float32_t& b) {
    TermManager* tm = a.getTermManager();
    Term lt = tm->mkTerm(Kind::FLOATINGPOINT_LT, {a.getTerm(), b.getTerm()});
    Term min_val = tm->mkTerm(Kind::ITE, {lt, a.getTerm(), b.getTerm()});
    float concrete_min = (static_cast<float>(a) < static_cast<float>(b))
                         ? static_cast<float>(a) : static_cast<float>(b);
    return symbolic_float32_t(tm, min_val, concrete_min, a.isNeon());
}

/**
 * symbolic_fmax: Element-wise maximum of two symbolic floats
 * result = a > b ? a : b
 */
inline symbolic_float32_t symbolic_fmax(const symbolic_float32_t& a, const symbolic_float32_t& b) {
    TermManager* tm = a.getTermManager();
    Term gt = tm->mkTerm(Kind::FLOATINGPOINT_GT, {a.getTerm(), b.getTerm()});
    Term max_val = tm->mkTerm(Kind::ITE, {gt, a.getTerm(), b.getTerm()});
    float concrete_max = (static_cast<float>(a) > static_cast<float>(b))
                         ? static_cast<float>(a) : static_cast<float>(b);
    return symbolic_float32_t(tm, max_val, concrete_max, a.isNeon());
}

#endif // SYMBOLIC_SCALAR_TYPES_HPP

