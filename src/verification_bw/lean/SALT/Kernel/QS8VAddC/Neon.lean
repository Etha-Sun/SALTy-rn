/-
  SALT.Kernel.QS8VAddC.Neon — NEON kernel model for qs8-vaddc.

  Contains the per-element pipeline, intrinsic-composed pipeline with
  bridge theorem, loop model, and loop=map proof.

  Reference: kernels/source/qs8-vaddc.c
-/
import SALT.Intrinsics.Neon
import SALT.Kernel.QS8.Params

namespace SALT.Kernel.QS8VAddC.Neon

open SALT
open SALT.Intrinsics.Neon
open SALT.Kernel.QS8

-- ============================================================================
-- Pre-loop bias computation
-- ============================================================================

/-- Pre-loop bias computation, mirrors C kernel:
    `const int32_t vxb = (int32_t)*input_b - (int32_t)params->scalar.b_zero_point;`
    `const int32_t vbias_val = vxb * vb;`
    Reference: kernels/source/qs8-vaddc.c:39-41 -/
def computeBias (p : QS8AddMinmaxParams) (input_b : BitVec 8) : BitVec 32 :=
  let vxb : BitVec 32 := (sext input_b 32) - (sext p.b_zero_point 32)
  vxb * p.b_multiplier

-- ============================================================================
-- Per-element function
-- ============================================================================

/-- Complete NEON pipeline for one input byte.
    Pipeline (from kernels/source/qs8-vaddc.c:43-62):
      1. vsubl_s8:    xa = sext16(input) - sext16(a_zero_point)
      2. vmovl_s16:   xa32 = sext32(xa)
      3. vmlaq_s32:   acc = bias + xa32 * a_multiplier
      4. vrshlq_s32:  acc = neonRoundingShiftRight(acc, shift)
      5. vqmovn_s32:  acc16 = signedClamp(acc, 16)
      6. vqaddq_s16:  acc16 = signedSatAdd(acc16, output_zero_point)
      7. vqmovn_s16:  out8 = signedClamp(acc16, 8)
      8. vmax_s8:     out8 = signedMax(out8, output_min)
      9. vmin_s8:     out8 = signedMin(out8, output_max) -/
def neonElemFn (p : QS8AddMinmaxParams) (bias : BitVec 32) (x : BitVec 8) : BitVec 8 :=
  let xa : BitVec 16 := (sext x 16) - (sext p.a_zero_point 16)
  let xa32 : BitVec 32 := sext xa 32
  let acc : BitVec 32 := bias + xa32 * p.a_multiplier
  let acc := neonRoundingShiftRight acc p.shift.toNat
  let acc16 : BitVec 16 := signedClamp acc 16
  let acc16 := signedSatAdd acc16 p.output_zero_point
  let out8 : BitVec 8 := signedClamp acc16 8
  clamp out8 p.output_min p.output_max

-- ============================================================================
-- Intrinsic-composed pipeline and bridge theorem
-- ============================================================================

/-- NEON iteration built from list-level intrinsic combinators.
    Mirrors kernels/source/qs8-vaddc.c:43-62 line-by-line. -/
def neonPipelineFromIntrinsics (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) : List (BitVec 8) :=
  let va_zero_point := List.replicate chunk.length p.a_zero_point
  let vxa := vsubl_s8 chunk va_zero_point
  let vxa32 := vmovl_s16 vxa
  let vbias := List.replicate chunk.length bias
  let vacc := vmlaq_s32 vbias vxa32 p.a_multiplier
  let vacc := vrshlq_s32 vacc p.shift.toNat
  let vacc16 := vqmovn_s32 vacc
  let vacc16 := vqaddq_s16 vacc16 p.output_zero_point
  let vout := vqmovn_s16 vacc16
  let vout := vmax_s8 vout p.output_min
  vmin_s8 vout p.output_max

set_option maxHeartbeats 800000 in
/-- Bridge theorem: the intrinsic-composed pipeline equals List.map neonElemFn.
    This validates that the list-level intrinsic models and the per-element
    function agree — a mistake in either side would break this proof. -/
theorem neonPipeline_eq_map (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) :
    neonPipelineFromIntrinsics p bias chunk = chunk.map (neonElemFn p bias) := by
  unfold neonPipelineFromIntrinsics
  simp only [vsubl_s8, vmovl_s16, vmlaq_s32, vrshlq_s32,
    vqmovn_s32, vqmovn_s16, vqaddq_s16, vmax_s8, vmin_s8,
    zipWith_replicate_right, zipWith_replicate_left,
    List.map_map, List.length_map]
  try congr 1; try { ext; rfl }

-- ============================================================================
-- Loop model
-- ============================================================================

/-- Process one chunk of inputs through the NEON pipeline.
    This is just `List.map (neonElemFn p bias)`. -/
def neonIteration (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) : List (BitVec 8) :=
  chunk.map (neonElemFn p bias)

/-- neonIteration is definitionally List.map (neonElemFn p bias). -/
theorem neonIteration_eq_map (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) :
    neonIteration p bias chunk = chunk.map (neonElemFn p bias) := by
  rfl

/-- NEON loop: processes 8 elements per iteration, tail handles remainder.
    - Main loop: while input_a.length ≥ 8, take 8, process, recurse on rest
    - Tail: pad to 8, process all 8, take first input_a.length results

    The tail abstraction is sound because neonIteration is elementwise. -/
def neonLoop (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (input_a : List (BitVec 8)) : List (BitVec 8) :=
  if input_a.length ≥ 8 then
    neonIteration p bias (input_a.take 8) ++ neonLoop p bias (input_a.drop 8)
  else if input_a.length > 0 then
    let padded := input_a ++ List.replicate (8 - input_a.length) (BitVec.ofNat 8 0)
    (neonIteration p bias padded).take input_a.length
  else
    []
termination_by input_a.length
decreasing_by
  simp_all
  omega

-- ============================================================================
-- Loop = flat map
-- ============================================================================

theorem neonLoop_eq_map (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (input : List (BitVec 8)) :
    neonLoop p bias input = input.map (neonElemFn p bias) := by
  suffices ∀ (n : Nat) (xs : List (BitVec 8)), xs.length ≤ n →
      neonLoop p bias xs = xs.map (neonElemFn p bias) from
    this input.length input (Nat.le_refl _)
  intro n
  induction n with
  | zero =>
    intro xs h_len
    have : xs = [] := by cases xs <;> simp_all
    subst this; simp [neonLoop]
  | succ m ih =>
    intro xs h_len
    cases xs with
    | nil => simp [neonLoop]
    | cons hd tl =>
      have h_cons_len : (hd :: tl).length = tl.length + 1 := by simp
      unfold neonLoop
      simp only [List.length_cons]
      split
      · -- Main loop: length ≥ 8
        simp only [neonIteration]
        have h_drop_len : ((hd :: tl).drop 8).length ≤ m := by
          simp [List.length_drop]; omega
        rw [ih _ h_drop_len]
        rw [← List.map_append, List.take_append_drop]
      · split
        · -- Tail: 0 < length < 8
          simp only [neonIteration]
          exact map_append_take (neonElemFn p bias) (hd :: tl) _
        · -- Empty: impossible for cons
          omega

end SALT.Kernel.QS8VAddC.Neon
