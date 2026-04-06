/-
  SALT.Proof.RoundingEquiv — The load-bearing proof.

  Proves that NEON's 64-bit-widen rounding shift and RVV's bit-extract
  rounding shift produce identical results for all 32-bit inputs and
  valid shift amounts (0..31).

  NEON: truncate32((sext64(x) + (1 << (shift-1))) >>> shift)
  RVV:  (x >>> shift) + zext32(x[shift-1])

  Strategy: case-split on the 32 possible shift values, then use bv_decide
  (SAT-based BitVec decision procedure) for each concrete case.

  Reference:
    src/verification/neon/intrinsics.hpp:228-266
    src/verification/rvv/intrinsics.hpp:33-57
-/
import SALT.Intrinsics.Neon
import SALT.Intrinsics.RVV
import Std.Tactic.BVDecide

namespace SALT.Proof.RoundingEquiv

open SALT.Intrinsics.Neon
open SALT.Intrinsics.RVV

/-- Main theorem: NEON and RVV rounding shift produce identical results
    for all 32-bit inputs and all shift amounts in [0, 31].

    This is the soundness linchpin — without it, we'd only be proving
    equivalence of normalized models, not equivalence of the real kernels.

    Proof: case-split on shift (0..31), each case discharged by bv_decide
    (SAT-based BitVec decision procedure over 32+64 bit formulas). -/
theorem rounding_shift_equiv (x : BitVec 32) (shift : Nat)
    (h_bound : shift ≤ 31) :
    neonRoundingShiftRight x shift = rvvRoundingShiftRight x shift := by
  have h_cases : shift = 0 ∨ shift = 1 ∨ shift = 2 ∨ shift = 3 ∨ shift = 4 ∨
    shift = 5 ∨ shift = 6 ∨ shift = 7 ∨ shift = 8 ∨ shift = 9 ∨ shift = 10 ∨
    shift = 11 ∨ shift = 12 ∨ shift = 13 ∨ shift = 14 ∨ shift = 15 ∨ shift = 16 ∨
    shift = 17 ∨ shift = 18 ∨ shift = 19 ∨ shift = 20 ∨ shift = 21 ∨ shift = 22 ∨
    shift = 23 ∨ shift = 24 ∨ shift = 25 ∨ shift = 26 ∨ shift = 27 ∨ shift = 28 ∨
    shift = 29 ∨ shift = 30 ∨ shift = 31 := by omega
  rcases h_cases with h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h|h
  all_goals (subst h; simp only [neonRoundingShiftRight, rvvRoundingShiftRight]; bv_decide)

end SALT.Proof.RoundingEquiv
