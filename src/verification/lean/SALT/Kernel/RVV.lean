/-
  SALT.Kernel.RVV — RVV kernel loop model for qs8-vaddc.

  The RVV kernel processes `vl` elements per iteration, where
  `vl = min(remaining, vlmax)` and `vlmax = (VLEN / SEW) * LMUL`.

  Unlike NEON's fixed 8-lane, RVV dynamically adjusts vl to the
  remaining input length — there is no separate tail path.

  Reference: kernels/target/qs8-vaddc.c:23-48
-/
import SALT.Intrinsics.RVV

namespace SALT.Kernel.RVV

open SALT
open SALT.Intrinsics.RVV

/-- Process one chunk of inputs through the RVV pipeline.
    This is just `List.map (rvvElemFn p bias)`. -/
def rvvIteration (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) : List (BitVec 8) :=
  chunk.map (rvvElemFn p bias)

/-- RVV loop: processes min(remaining, vlmax) elements per iteration.
    No tail handling needed — vl naturally adjusts to remaining length.
    This models the C loop: `for (; batch > 0; ) { vl = vsetvl(batch); ... }` -/
def rvvLoop (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (input_a : List (BitVec 8)) (vlmax : Nat) (h_vlmax : vlmax > 0 := by omega) : List (BitVec 8) :=
  match input_a with
  | [] => []
  | hd :: tl =>
    let xs := hd :: tl
    let vl := min xs.length vlmax
    rvvIteration p bias (xs.take vl) ++ rvvLoop p bias (xs.drop vl) vlmax
termination_by input_a.length
decreasing_by
  simp [List.length_drop]
  omega

/-- rvvIteration is definitionally List.map (rvvElemFn p bias). -/
theorem rvvIteration_eq_map (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) :
    rvvIteration p bias chunk = chunk.map (rvvElemFn p bias) := by
  rfl

end SALT.Kernel.RVV
