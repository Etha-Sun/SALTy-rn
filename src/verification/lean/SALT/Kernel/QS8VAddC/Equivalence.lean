/-
  SALT.Kernel.QS8VAddC.Equivalence — The final equivalence theorem.

  Proves that the NEON and RVV implementations of qs8-vaddc produce
  identical outputs for all input lengths, all valid parameter values,
  and all valid VLEN settings.

  Proof chain:
  1. RoundingEquiv: neonRoundingShiftRight = rvvRoundingShiftRight
  2. elem_equiv: neonElemFn = rvvElemFn (rounding equiv + algebraic)
  3. Loop = List.map (per-kernel structural induction)
  4. qs8_vaddc_equiv: neonLoop = rvvLoop (transitivity through List.map)
-/
import SALT.Kernel.QS8VAddC.Neon
import SALT.Kernel.QS8VAddC.RVV
import SALT.Proof.RoundingEquiv

namespace SALT.Kernel.QS8VAddC.Equivalence

open SALT
open SALT.Kernel.QS8
open SALT.Kernel.QS8VAddC.Neon
open SALT.Kernel.QS8VAddC.RVV
open SALT.Intrinsics.Neon
open SALT.Intrinsics.RVV
open SALT.Proof.RoundingEquiv

-- ============================================================================
-- Per-element equivalence
-- ============================================================================

private theorem neonElemFn_inline (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (x : BitVec 8) :
    neonElemFn p bias x =
    clamp
      (signedClamp
        (signedSatAdd
          (signedClamp
            (neonRoundingShiftRight
              (bias + sext (sext x 16 - sext p.a_zero_point 16) 32 * p.a_multiplier)
              p.shift.toNat)
            16)
          p.output_zero_point)
        8)
      p.output_min p.output_max := by
  rfl

private theorem rvvElemFn_inline (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (x : BitVec 8) :
    rvvElemFn p bias x =
    clamp
      (signedClamp
        (signedSatAdd
          (signedClamp
            (rvvRoundingShiftRight
              (bias + sext (sext x 16 - sext p.a_zero_point 16) 32 * p.a_multiplier)
              p.shift.toNat)
            16)
          p.output_zero_point)
        8)
      p.output_min p.output_max := by
  rfl

theorem elem_equiv
    (p : QS8AddMinmaxParams) (hwf : WellFormedParams p)
    (bias : BitVec 32) (x : BitVec 8) :
    neonElemFn p bias x = rvvElemFn p bias x := by
  have h_shift_bound : p.shift.toNat ≤ 31 := hwf.2.1
  rw [neonElemFn_inline, rvvElemFn_inline, rounding_shift_equiv _ _ h_shift_bound]

-- ============================================================================
-- Bias equivalence
-- ============================================================================

theorem computeBias_eq (p : QS8AddMinmaxParams) (input_b : BitVec 8) :
    Neon.computeBias p input_b = RVV.computeBias p input_b := by
  rfl

-- ============================================================================
-- Final theorem
-- ============================================================================


theorem qs8_vaddc_equiv
    (p : QS8AddMinmaxParams) (hwf : WellFormedParams p)
    (input_b : BitVec 8) (input_a : List (BitVec 8))
    (vlmax : Nat) (h_vlmax : vlmax > 0) :
    neonLoop p (Neon.computeBias p input_b) input_a =
    rvvLoop p (RVV.computeBias p input_b) input_a vlmax := by
  rw [computeBias_eq]
  rw [neonLoop_eq_map, rvvLoop_eq_map]
  exact List.map_congr_left (fun x _ => elem_equiv p hwf (RVV.computeBias p input_b) x)

end SALT.Kernel.QS8VAddC.Equivalence
