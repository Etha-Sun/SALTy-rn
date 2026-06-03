/-
  SALT.Kernel.QS8VAdd.Neon — NEON kernel model for qs8-vadd.

  Binary elementwise kernel: two input arrays, element-by-element addition.
  Uses List.zipWith instead of List.map (contrast with QS8VAddC which is
  scalar-broadcast).

  Reference: kernels/source/qs8-vadd.c
-/
import SALT.Intrinsics.Neon
import SALT.Kernel.QS8.Params

namespace SALT.Kernel.QS8VAdd.Neon

open SALT
open SALT.Intrinsics.Neon
open SALT.Kernel.QS8

-- ============================================================================
-- Per-element function
-- ============================================================================

/-- Complete NEON pipeline for one (a, b) input pair.
    Pipeline (from kernels/source/qs8-vadd.c):
      1. vsubl_s8:    xa = sext16(a) - sext16(a_zero_point)
      2. vsubl_s8:    xb = sext16(b) - sext16(b_zero_point)
      3. vmovl_s16:   xa32 = sext32(xa)
      4. vmovl_s16:   xb32 = sext32(xb)
      5. vmulq_s32:   acc = xa32 * a_multiplier
      6. vmlaq_s32:   acc = acc + xb32 * b_multiplier
      7. vrshlq_s32:  acc = neonRoundingShiftRight(acc, shift)
      8. vqmovn_s32:  acc16 = signedClamp(acc, 16)
      9. vqaddq_s16:  acc16 = signedSatAdd(acc16, output_zero_point)
     10. vqmovn_s16:  out8 = signedClamp(acc16, 8)
     11. vmax_s8:     out8 = signedMax(out8, output_min)
     12. vmin_s8:     out8 = signedMin(out8, output_max) -/
def neonElemFn (p : QS8AddMinmaxParams) (a b : BitVec 8) : BitVec 8 :=
  let xa : BitVec 16 := (sext a 16) - (sext p.a_zero_point 16)
  let xb : BitVec 16 := (sext b 16) - (sext p.b_zero_point 16)
  let xa32 : BitVec 32 := sext xa 32
  let xb32 : BitVec 32 := sext xb 32
  let acc : BitVec 32 := xa32 * p.a_multiplier
  let acc := acc + xb32 * p.b_multiplier
  let acc := neonRoundingShiftRight acc p.shift.toNat
  let acc16 : BitVec 16 := signedClamp acc 16
  let acc16 := signedSatAdd acc16 p.output_zero_point
  let out8 : BitVec 8 := signedClamp acc16 8
  clamp out8 p.output_min p.output_max

-- ============================================================================
-- Intrinsic-composed pipeline and bridge theorem
-- ============================================================================

/-- NEON iteration built from list-level intrinsic combinators.
    Mirrors kernels/source/qs8-vadd.c line-by-line. -/
def neonPipelineFromIntrinsics (p : QS8AddMinmaxParams)
    (chunk_a chunk_b : List (BitVec 8)) : List (BitVec 8) :=
  let va_zp := List.replicate chunk_a.length p.a_zero_point
  let vb_zp := List.replicate chunk_b.length p.b_zero_point
  let vxa := vsubl_s8 chunk_a va_zp
  let vxb := vsubl_s8 chunk_b vb_zp
  let vxa32 := vmovl_s16 vxa
  let vxb32 := vmovl_s16 vxb
  let vacc := vmulq_s32 vxa32 p.a_multiplier
  let vacc := vmlaq_s32 vacc vxb32 p.b_multiplier
  let vacc := vrshlq_s32 vacc p.shift.toNat
  let vacc16 := vqmovn_s32 vacc
  let vacc16 := vqaddq_s16 vacc16 p.output_zero_point
  let vout := vqmovn_s16 vacc16
  let vout := vmax_s8 vout p.output_min
  vmin_s8 vout p.output_max

set_option maxHeartbeats 1600000 in
/-- Bridge theorem: the intrinsic-composed pipeline equals List.zipWith neonElemFn.
    Requires equal-length chunks (guaranteed by the kernel's batch processing).
    Validates that intrinsic models and per-element function agree. -/
theorem neonPipeline_eq_zipWith (p : QS8AddMinmaxParams)
    (chunk_a chunk_b : List (BitVec 8))
    (h_len : chunk_a.length = chunk_b.length) :
    neonPipelineFromIntrinsics p chunk_a chunk_b =
    List.zipWith (neonElemFn p) chunk_a chunk_b := by
  unfold neonPipelineFromIntrinsics
  simp only [vsubl_s8, vmovl_s16, vmulq_s32, vmlaq_s32, vrshlq_s32,
    vqmovn_s32, vqmovn_s16, vqaddq_s16, vmax_s8, vmin_s8,
    zipWith_replicate_right,
    List.map_map]
  -- After simp, the a-path is chunk_a.map fa and b-path is chunk_b.map fb,
  -- merged by zipWith from vmlaq_s32. Need to fuse map+zipWith+map into zipWith.
  induction chunk_a generalizing chunk_b with
  | nil => simp [List.zipWith]
  | cons ha ta ih =>
    cases chunk_b with
    | nil => simp at h_len
    | cons hb tb =>
      simp only [List.zipWith, List.map, List.cons.injEq]
      exact ⟨rfl, ih tb (by simpa using h_len)⟩

-- ============================================================================
-- Loop model
-- ============================================================================

/-- Process one chunk pair through the NEON pipeline. -/
def neonIteration (p : QS8AddMinmaxParams)
    (chunk_a chunk_b : List (BitVec 8)) : List (BitVec 8) :=
  List.zipWith (neonElemFn p) chunk_a chunk_b

/-- NEON loop: processes 8 elements per iteration from both arrays.
    - Main loop: while both have ≥ 8 elements, take 8 from each, process, recurse
    - Tail: pad both to 8, process, take first min(remaining) results -/
def neonLoop (p : QS8AddMinmaxParams)
    (input_a input_b : List (BitVec 8)) : List (BitVec 8) :=
  if input_a.length ≥ 8 then
    neonIteration p (input_a.take 8) (input_b.take 8) ++
    neonLoop p (input_a.drop 8) (input_b.drop 8)
  else if input_a.length > 0 then
    let padded_a := input_a ++ List.replicate (8 - input_a.length) (BitVec.ofNat 8 0)
    let padded_b := input_b ++ List.replicate (8 - input_b.length) (BitVec.ofNat 8 0)
    (neonIteration p padded_a padded_b).take input_a.length
  else
    []
termination_by input_a.length
decreasing_by
  simp_all
  omega

-- ============================================================================
-- Loop = flat zipWith
-- ============================================================================

theorem neonLoop_eq_zipWith (p : QS8AddMinmaxParams)
    (input_a input_b : List (BitVec 8))
    (h_len : input_a.length = input_b.length) :
    neonLoop p input_a input_b = List.zipWith (neonElemFn p) input_a input_b := by
  suffices ∀ (n : Nat) (xs ys : List (BitVec 8)),
      xs.length = ys.length → xs.length ≤ n →
      neonLoop p xs ys = List.zipWith (neonElemFn p) xs ys from
    this input_a.length input_a input_b h_len (Nat.le_refl _)
  intro n
  induction n with
  | zero =>
    intro xs ys h_eq h_len
    have : xs = [] := by cases xs <;> simp_all
    subst this
    have : ys = [] := by cases ys <;> simp_all
    subst this; simp [neonLoop]
  | succ m ih =>
    intro xs ys h_eq h_len
    cases xs with
    | nil =>
      have : ys = [] := by cases ys <;> simp_all
      subst this; simp [neonLoop]
    | cons hd tl =>
      unfold neonLoop
      simp only [List.length_cons]
      split
      · -- Main loop: length ≥ 8
        simp only [neonIteration]
        have h_drop_eq : ((hd :: tl).drop 8).length = (ys.drop 8).length := by
          simp only [List.length_drop, h_eq]
        have h_drop_le : ((hd :: tl).drop 8).length ≤ m := by
          simp only [List.length_drop, List.length_cons]
          have := h_len; simp only [List.length_cons] at this; omega
        rw [ih _ _ h_drop_eq h_drop_le]
        exact zipWith_take_append_drop (neonElemFn p) (hd :: tl) ys 8 h_eq
      · split
        · -- Tail: 0 < length < 8
          simp only [neonIteration]
          have : (tl.length + 1) = (hd :: tl).length := by simp
          rw [this]
          exact zipWith_append_take (neonElemFn p) (hd :: tl) _ ys _ h_eq
        · -- Empty: impossible for cons
          omega

end SALT.Kernel.QS8VAdd.Neon
