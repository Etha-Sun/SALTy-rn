/-
  SALT.Proof.Equivalence — The final theorem.

  Proves that `neonLoop` and `rvvLoop` produce identical outputs for all
  input lengths, all valid parameter values, and all valid VLEN settings.

  Proof chain:
  1. RoundingEquiv: neonRoundingShiftRight = rvvRoundingShiftRight (bv_decide × 32 shift values)
  2. IterationEquiv: neonElemFn = rvvElemFn (rounding equiv + algebraic)
  3. ChunkEquiv: neonLoop = List.map neonElemFn, rvvLoop = List.map rvvElemFn (structural induction)
  4. This file: neonLoop = rvvLoop (transitivity through List.map)
-/
import SALT.Proof.IterationEquiv
import SALT.Proof.ChunkEquiv
import SALT.Kernel.Neon
import SALT.Kernel.RVV

namespace SALT.Proof.Equivalence

open SALT
open SALT.Kernel.Neon
open SALT.Kernel.RVV
open SALT.Intrinsics.Neon
open SALT.Intrinsics.RVV
open SALT.Proof.IterationEquiv
open SALT.Proof.ChunkEquiv

/-- **Main theorem**: NEON and RVV implementations of the qs8-vaddc kernel
    produce identical outputs for:
    - All input arrays of any length (`input_a : List (BitVec 8)`)
    - All scalar inputs (`input_b : BitVec 8`)
    - All well-formed parameters (`hwf : WellFormedParams p`)
    - All valid VLEN settings (`vlmax > 0`)

    This is a machine-checked proof verified by Lean's kernel.
    No `sorry`, no axioms beyond Lean's foundations.

    **Semantic scope**: The theorem proves equivalence under bitvector
    (hardware) semantics, where `int32_t` arithmetic wraps modulo 2^32.
    This matches what the hardware executes and what the SMT-based
    bounded verifier checks. -/
theorem qs8_vaddc_equiv
    (p : QS8AddMinmaxParams) (hwf : WellFormedParams p)
    (input_b : BitVec 8) (input_a : List (BitVec 8))
    (vlmax : Nat) (h_vlmax : vlmax > 0) :
    neonLoop p (computeBias p input_b) input_a =
    rvvLoop p (computeBias p input_b) input_a vlmax := by
  -- Step 1: Both loops equal List.map of their respective per-element functions
  rw [neonLoop_eq_map, rvvLoop_eq_map]
  -- Step 2: The per-element functions are equal (from IterationEquiv)
  exact List.map_congr_left (fun x _ => elem_equiv p hwf (computeBias p input_b) x)

end SALT.Proof.Equivalence
