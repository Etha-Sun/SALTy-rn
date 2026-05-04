/-
  SALT.Kernel.QS8VAdd.Equivalence — The final equivalence theorem for qs8-vadd.

  Proves that the NEON and RVV implementations of qs8-vadd produce
  identical outputs for all equal-length input pairs, all valid parameter
  values, and all valid VLEN settings.

  This is the second kernel proven in the SALT framework, validating that
  the proof architecture generalizes from scalar-broadcast (vaddc) to
  binary array-array elementwise (vadd).

  Proof chain:
  1. RoundingEquiv: neonRoundingShiftRight = rvvRoundingShiftRight
  2. elem_equiv: neonElemFn = rvvElemFn (rounding equiv + algebraic identity)
  3. Loop = List.zipWith (per-kernel structural induction)
  4. qs8_vadd_equiv: neonLoop = rvvLoop (transitivity through List.zipWith)
-/
import SALT.Kernel.QS8VAdd.Neon
import SALT.Kernel.QS8VAdd.RVV
import SALT.Proof.RoundingEquiv

namespace SALT.Kernel.QS8VAdd.Equivalence

open SALT
open SALT.Kernel.QS8
open SALT.Kernel.QS8VAdd.Neon
open SALT.Kernel.QS8VAdd.RVV
open SALT.Intrinsics.Neon
open SALT.Intrinsics.RVV
open SALT.Proof.RoundingEquiv

-- ============================================================================
-- Per-element equivalence
-- ============================================================================

private theorem neonElemFn_inline (p : QS8AddMinmaxParams) (a b : BitVec 8) :
    neonElemFn p a b =
    clamp
      (signedClamp
        (signedSatAdd
          (signedClamp
            (neonRoundingShiftRight
              ((sext (sext a 16 - sext p.a_zero_point 16) 32 * p.a_multiplier) +
               (sext (sext b 16 - sext p.b_zero_point 16) 32 * p.b_multiplier))
              p.shift.toNat)
            16)
          p.output_zero_point)
        8)
      p.output_min p.output_max := by
  rfl

private theorem rvvElemFn_inline (p : QS8AddMinmaxParams) (a b : BitVec 8) :
    rvvElemFn p a b =
    clamp
      (signedClamp
        (signedSatAdd
          (signedClamp
            (rvvRoundingShiftRight
              ((sext (sext a 16 - sext p.a_zero_point 16) 32 * p.a_multiplier) +
               (sext (sext b 16 - sext p.b_zero_point 16) 32 * p.b_multiplier))
              p.shift.toNat)
            16)
          p.output_zero_point)
        8)
      p.output_min p.output_max := by
  rfl

/-- Per-element equivalence: the core theorem.
    Both ISA pipelines compute the same function on each (a, b) input pair.

    Proof: inline both definitions, then rewrite
    neonRoundingShiftRight → rvvRoundingShiftRight using RoundingEquiv. -/
theorem elem_equiv
    (p : QS8AddMinmaxParams) (hwf : WellFormedParams p)
    (a b : BitVec 8) :
    neonElemFn p a b = rvvElemFn p a b := by
  have h_shift_bound : p.shift.toNat ≤ 31 := hwf.2.1
  rw [neonElemFn_inline, rvvElemFn_inline, rounding_shift_equiv _ _ h_shift_bound]

-- ============================================================================
-- Final theorem
-- ============================================================================

/-- **Main theorem**: NEON and RVV implementations of the qs8-vadd kernel
    produce identical outputs for:
    - All input array pairs of any equal length
    - All well-formed parameters (`hwf : WellFormedParams p`)
    - All valid VLEN settings (`vlmax > 0`)

    This is a machine-checked proof verified by Lean's kernel.
    No `sorry`, no axioms beyond Lean's foundations.

    **Semantic scope**: The theorem proves equivalence under bitvector
    (hardware) semantics, where `int32_t` arithmetic wraps modulo 2^32. -/
theorem qs8_vadd_equiv
    (p : QS8AddMinmaxParams) (hwf : WellFormedParams p)
    (input_a input_b : List (BitVec 8))
    (h_len : input_a.length = input_b.length)
    (vlmax : Nat) (h_vlmax : vlmax > 0) :
    neonLoop p input_a input_b =
    rvvLoop p input_a input_b vlmax := by
  rw [neonLoop_eq_zipWith p input_a input_b h_len]
  rw [rvvLoop_eq_zipWith p input_a input_b h_len vlmax h_vlmax]
  clear h_len h_vlmax vlmax
  induction input_a generalizing input_b with
  | nil => simp
  | cons ha ta ih =>
    cases input_b with
    | nil => simp
    | cons hb tb =>
      simp only [List.zipWith, List.cons.injEq]
      exact ⟨elem_equiv p hwf ha hb, ih tb⟩

end SALT.Kernel.QS8VAdd.Equivalence
