/-
  SALT.Kernel.QS8VAddC.RVV — RVV kernel model for qs8-vaddc.

  Contains the per-element pipeline, intrinsic-composed pipeline with
  bridge theorem, loop model, and loop=map proof.

  Reference: kernels/target/qs8-vaddc.c
-/
import SALT.Intrinsics.RVV
import SALT.Kernel.QS8.Params

namespace SALT.Kernel.QS8VAddC.RVV

open SALT
open SALT.Intrinsics.RVV
open SALT.Kernel.QS8

-- ============================================================================
-- Pre-loop bias computation
-- ============================================================================

/-- Pre-loop bias computation, mirrors C kernel:
    `const int32_t vxb = (int32_t)*input_b - (int32_t)params->scalar.b_zero_point;`
    `const int32_t vbias_val = vxb * vb;`
    Reference: kernels/target/qs8-vaddc.c:19-21 -/
def computeBias (p : QS8AddMinmaxParams) (input_b : BitVec 8) : BitVec 32 :=
  let vxb : BitVec 32 := (sext input_b 32) - (sext p.b_zero_point 32)
  vxb * p.b_multiplier

-- ============================================================================
-- Per-element function
-- ============================================================================

/-- Complete RVV pipeline for one input byte.
    Pipeline (from kernels/target/qs8-vaddc.c:26-48):
      1. vwsub_vx:     xa = sext16(input) - sext16(a_zero_point)
      2. vsext_vf2:    xa32 = sext32(xa)
      3. vmacc_vx:     acc = bias + a_multiplier * xa32
      4. vssra_vx_rnu: acc = rvvRoundingShiftRight(acc, shift)
      5. vnclip_wx:    acc16 = signedClamp(acc, 16)
      6. vsadd_vx:     acc16 = signedSatAdd(acc16, output_zero_point)
      7. vnclip_wx:    out8 = signedClamp(acc16, 8)
      8. vmax_vx:      out8 = signedMax(out8, output_min)
      9. vmin_vx:      out8 = signedMin(out8, output_max) -/
def rvvElemFn (p : QS8AddMinmaxParams) (bias : BitVec 32) (x : BitVec 8) : BitVec 8 :=
  let xa : BitVec 16 := (sext x 16) - (sext p.a_zero_point 16)
  let xa32 : BitVec 32 := sext xa 32
  let acc : BitVec 32 := bias + xa32 * p.a_multiplier
  let acc := rvvRoundingShiftRight acc p.shift.toNat
  let acc16 : BitVec 16 := signedClamp acc 16
  let acc16 := signedSatAdd acc16 p.output_zero_point
  let out8 : BitVec 8 := signedClamp acc16 8
  clamp out8 p.output_min p.output_max

-- ============================================================================
-- Intrinsic-composed pipeline and bridge theorem
-- ============================================================================

/-- RVV iteration built from list-level intrinsic combinators.
    Mirrors kernels/target/qs8-vaddc.c:26-48. -/
def rvvPipelineFromIntrinsics (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) : List (BitVec 8) :=
  let vxa := vwsub_vx chunk p.a_zero_point
  let vxa32 := vsext_vf2 vxa
  let vbias := List.replicate chunk.length bias
  let vacc := vmacc_vx vbias p.a_multiplier vxa32
  let vacc := vssra_vx_rnu vacc p.shift.toNat
  let vacc16 := vnclip_wx_i16 vacc
  let vacc16 := vsadd_vx vacc16 p.output_zero_point
  let vout := vnclip_wx_i8 vacc16
  let vout := vmax_vx vout p.output_min
  vmin_vx vout p.output_max

set_option maxHeartbeats 800000 in
/-- Bridge theorem: intrinsic-composed pipeline equals List.map rvvElemFn. -/
theorem rvvPipeline_eq_map (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) :
    rvvPipelineFromIntrinsics p bias chunk = chunk.map (rvvElemFn p bias) := by
  unfold rvvPipelineFromIntrinsics
  simp only [vwsub_vx, vsext_vf2, vmacc_vx, vssra_vx_rnu,
    vnclip_wx_i16, vnclip_wx_i8, vsadd_vx, vmax_vx, vmin_vx,
    zipWith_replicate_left, List.map_map, List.length_map]
  try congr 1; try { ext; rfl }

-- ============================================================================
-- Loop model
-- ============================================================================

/-- Process one chunk of inputs through the RVV pipeline.
    This is just `List.map (rvvElemFn p bias)`. -/
def rvvIteration (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) : List (BitVec 8) :=
  chunk.map (rvvElemFn p bias)

/-- rvvIteration is definitionally List.map (rvvElemFn p bias). -/
theorem rvvIteration_eq_map (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (chunk : List (BitVec 8)) :
    rvvIteration p bias chunk = chunk.map (rvvElemFn p bias) := by
  rfl

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

-- ============================================================================
-- Loop = flat map
-- ============================================================================

theorem rvvLoop_eq_map (p : QS8AddMinmaxParams) (bias : BitVec 32)
    (input : List (BitVec 8)) (vlmax : Nat) (h_vlmax : vlmax > 0) :
    rvvLoop p bias input vlmax = input.map (rvvElemFn p bias) := by
  suffices ∀ (n : Nat) (xs : List (BitVec 8)), xs.length ≤ n →
      rvvLoop p bias xs vlmax = xs.map (rvvElemFn p bias) from
    this input.length input (Nat.le_refl _)
  intro n
  induction n with
  | zero =>
    intro xs h_len
    have : xs = [] := by cases xs <;> simp_all
    subst this; simp [rvvLoop]
  | succ m ih =>
    intro xs h_len
    cases xs with
    | nil => simp [rvvLoop]
    | cons hd tl =>
      unfold rvvLoop
      simp only [rvvIteration]
      have h_len_eq : (hd :: tl).length = tl.length + 1 := by simp
      rw [ih _ (by simp [List.length_drop, List.length_cons]; omega)]
      rw [← List.map_append, List.take_append_drop]

end SALT.Kernel.QS8VAddC.RVV
