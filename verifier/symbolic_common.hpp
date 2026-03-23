#ifndef SYMBOLIC_COMMON_HPP
#define SYMBOLIC_COMMON_HPP

#include <cvc5/cvc5.h>
#include <map>
#include <string>
#include <cstdint>
#include <vector>

using namespace cvc5;


inline TermManager* g_symbolic_tm = nullptr;
inline Solver* g_symbolic_solver = nullptr;


inline std::map<const void*, std::map<std::string, Term>> g_symbolic_params;


inline std::map<const void*, std::map<int64_t, std::pair<std::string, Term>>> g_symbolic_params_by_value;


inline const void* g_current_params_ptr = nullptr;

/**
 * Create symbolic array with specified bit width
 */
inline std::vector<Term> createSymbolicArray(TermManager& tm, size_t len, 
                                              const std::string& name_prefix,
                                              size_t bit_width = 32) {
    std::vector<Term> symbolic_array;
    Sort bv_sort = tm.mkBitVectorSort(bit_width);
    symbolic_array.reserve(len);

    for (size_t i = 0; i < len; i++) {
        symbolic_array.push_back(tm.mkConst(bv_sort, name_prefix + "_" + std::to_string(i)));
    }

    return symbolic_array;
}

#endif // SYMBOLIC_COMMON_HPP
