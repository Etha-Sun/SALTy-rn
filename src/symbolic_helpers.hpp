#ifndef SYMBOLIC_HELPERS_HPP
#define SYMBOLIC_HELPERS_HPP

#include "symbolic_common.hpp"
#include "neon_symbolic/neon_symbolic.hpp"
#include "riscv_symbolic/riscv_symbolic.hpp"
#include <vector>
#include <array>
#include <string>


namespace SymbolicHelpers {


inline std::vector<Term> createSymbolicArray(TermManager& tm, int len, const std::string& name_prefix) {
    std::vector<Term> symbolic_array;
    Sort bv32 = tm.mkBitVectorSort(32);
    symbolic_array.reserve(len);

    for (int i = 0; i < len; i++) {
        symbolic_array.push_back(tm.mkConst(bv32, name_prefix + "_" + std::to_string(i)));
    }

    return symbolic_array;
}


inline void populateNEONMemory(const int32_t* ptr, const std::vector<Term>& symbolic_values) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // NEON processes 4 elements at a time
    for (size_t i = 0; i < symbolic_values.size(); i += 4) {
        std::array<Term, 4> lanes = {
            symbolic_values[i],
            symbolic_values[i+1],
            symbolic_values[i+2],
            symbolic_values[i+3]
        };
        g_neon_memory[addr + i*4].push_back(int32x4_t(g_symbolic_tm, lanes));
    }
}


inline void populateRISCVMemory(const int32_t* ptr, const std::vector<Term>& symbolic_values) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

    // RISC-V can process all elements at once (variable length)
    g_riscv_memory[addr].push_back(vint32m1_t(g_symbolic_tm, symbolic_values));
}


inline std::pair<std::vector<Term>, std::vector<Term>>
setupSymbolicInputs(TermManager& tm, const int32_t* a, const int32_t* b, int len) {
    // Create symbolic arrays
    auto symbolic_a = createSymbolicArray(tm, len, "a");
    auto symbolic_b = createSymbolicArray(tm, len, "b");

    // Populate both NEON and RISC-V memory
    populateNEONMemory(a, symbolic_a);
    populateNEONMemory(b, symbolic_b);
    populateRISCVMemory(a, symbolic_a);
    populateRISCVMemory(b, symbolic_b);

    return {symbolic_a, symbolic_b};
}

} 

#endif // SYMBOLIC_HELPERS_HPP
