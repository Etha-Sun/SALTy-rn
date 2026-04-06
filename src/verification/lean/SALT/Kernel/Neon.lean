/-
  SALT.Kernel.Neon — NEON kernel loop model for qs8-vaddc.

  The NEON kernel processes 8 elements per main-loop iteration.
  Tail handling: overreads to 8, computes full vector, stores first `n`.
  Abstracted as: pad to 8, run, take n.

  Since neonIteration is List.map neonElemFn, this tail abstraction is valid:
  output[i] depends only on input[i] — padding lanes don't affect first n outputs.

  Reference: kernels/source/qs8-vaddc.c:43-93
-/
import SALT.Intrinsics.Neon

namespace SALT.Kernel.Neon

open SALT
open SALT.Intrinsics.Neon

/-- Process one chunk of inputs through the NEON pipeline.
    Both the main loop body and the tail use identical computation.
    This is just `List.map (neonElemFn p bias)`. -/
def neonIteration (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) : List (BitVec 8) :=
  chunk.map (neonElemFn p bias)

/-- NEON loop: processes 8 elements per iteration, tail handles remainder.
    - Main loop: while input_a.length ≥ 8, take 8, process, recurse on rest
    - Tail: pad to 8, process all 8, take first input_a.length results

    The tail abstraction is sound because neonIteration is elementwise. -/
def neonLoop (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (input_a : List (BitVec 8)) : List (BitVec 8) :=
  if input_a.length ≥ 8 then
    neonIteration p bias (input_a.take 8) ++ neonLoop p bias (input_a.drop 8)
  else if input_a.length > 0 then
    -- Tail: pad to 8 with zeros, process, take first n
    let padded := input_a ++ List.replicate (8 - input_a.length) (BitVec.ofNat 8 0)
    (neonIteration p bias padded).take input_a.length
  else
    []
termination_by input_a.length
decreasing_by
  simp_all
  omega

/-- neonIteration is definitionally List.map (neonElemFn p bias). -/
theorem neonIteration_eq_map (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) :
    neonIteration p bias chunk = chunk.map (neonElemFn p bias) := by
  rfl

end SALT.Kernel.Neon
