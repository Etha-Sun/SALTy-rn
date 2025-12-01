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

#endif // SYMBOLIC_SCALAR_TYPES_HPP

