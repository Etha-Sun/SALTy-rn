#pragma once
// Aggregated NEON intrinsics. Included by salt.hpp after neon/intrinsics.hpp
// (the shared infra base). core.hpp holds the hand-written foundational set
// (incl. pre-declared tuple structs other families reference), so it goes first.
#include "core.hpp"
#include "aliases.hpp"
#include "nhelp.hpp"
#include "arith_help.hpp"
#include "int_elem.hpp"
#include "cmp.hpp"
#include "shift.hpp"
#include "sat.hpp"
#include "widen.hpp"
#include "narrow.hpp"
#include "misc.hpp"
#include "reinterpret.hpp"
#include "structural.hpp"
#include "permute.hpp"
#include "fp.hpp"
#include "fpcvt.hpp"
#include "loadstore.hpp"
#include "tuple_permute.hpp"
#include "exotic.hpp"
#if __has_include("crypto.hpp")
#include "crypto.hpp"
#endif
