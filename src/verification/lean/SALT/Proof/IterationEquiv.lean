/-
  SALT.Proof.IterationEquiv — Per-element and iteration equivalence.

  Proves that neonElemFn and rvvElemFn compute the same function,
  and therefore neonIteration = rvvIteration (since both are List.map).

  After aligning multiplication order, the only difference between the
  two pipelines is the rounding shift, handled by RoundingEquiv.
-/
import SALT.Proof.RoundingEquiv
import SALT.Kernel.Neon
import SALT.Kernel.RVV

namespace SALT.Proof.IterationEquiv

open SALT
open SALT.Intrinsics.Neon
open SALT.Intrinsics.RVV
open SALT.Kernel.Neon
open SALT.Kernel.RVV
open SALT.Proof.RoundingEquiv

-- Inline forms: expand let-chains so rw can find patterns.
-- Both are rfl because let-substitution is definitional equality.

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

/-- Per-element equivalence: the core theorem.
    Both ISA pipelines compute the same function on each input byte.

    Proof: inline both definitions (eliminating let-chains), then rewrite
    neonRoundingShiftRight → rvvRoundingShiftRight using RoundingEquiv. -/
theorem elem_equiv
    (p : QS8AddMinmaxParams) (hwf : WellFormedParams p)
    (bias : BitVec 32) (x : BitVec 8) :
    neonElemFn p bias x = rvvElemFn p bias x := by
  have h_shift_bound : p.shift.toNat ≤ 31 := hwf.2.1
  rw [neonElemFn_inline, rvvElemFn_inline, rounding_shift_equiv _ _ h_shift_bound]

/-- Iteration equivalence: both iterations are List.map of the same function.
    Follows directly from elem_equiv. -/
theorem iteration_equiv
    (p : QS8AddMinmaxParams) (hwf : WellFormedParams p)
    (bias : BitVec 32) (chunk : List (BitVec 8)) :
    neonIteration p bias chunk = rvvIteration p bias chunk := by
  simp only [neonIteration, rvvIteration]
  exact List.map_congr_left (fun x _ => elem_equiv p hwf bias x)

end SALT.Proof.IterationEquiv
