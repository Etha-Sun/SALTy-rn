#ifndef SYMBOLIC_COMMON_HPP
#define SYMBOLIC_COMMON_HPP

#include <cvc5/cvc5.h>
#include <map>
#include <string>
#include <cstdint>

using namespace cvc5;


inline TermManager* g_symbolic_tm = nullptr;
inline Solver* g_symbolic_solver = nullptr;


inline std::map<const void*, std::map<std::string, Term>> g_symbolic_params;


inline std::map<const void*, std::map<int64_t, std::pair<std::string, Term>>> g_symbolic_params_by_value;


inline const void* g_current_params_ptr = nullptr;

#endif // SYMBOLIC_COMMON_HPP
