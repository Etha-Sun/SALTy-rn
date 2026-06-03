/-
  SALT.Kernel.QS8VAdd.RVV — RVV kernel model for qs8-vadd.

  Binary elementwise kernel: two input arrays, element-by-element addition.
  Uses List.zipWith instead of List.map (contrast with QS8VAddC which is
  scalar-broadcast).

  Reference: kernels/target/qs8-vadd.c

  Note: The C kernel has `if (shift < 0) vsll else vssra`. Under
  WellFormedParams (shift.toNat ≤ 31), the shift is non-negative,
  so only the vssra (right shift) path is modeled.
-/
import SALT.Intrinsics.RVV
import SALT.Kernel.QS8.Params

namespace SALT.Kernel.QS8VAdd.RVV

open SALT
open SALT.Intrinsics.RVV
open SALT.Kernel.QS8

-- ============================================================================
-- Per-element function
-- ============================================================================

/-- Complete RVV pipeline for one (a, b) input pair.
    Pipeline (from kernels/target/qs8-vadd.c):
      1. vwsub_vx:     xa = sext16(a) - sext16(a_zero_point)
      2. vwsub_vx:     xb = sext16(b) - sext16(b_zero_point)
      3. vsext_vf2:    xa32 = sext32(xa)
      4. vsext_vf2:    xb32 = sext32(xb)
      5. vmul_vx:      acc = xa32 * a_multiplier
      6. vmacc_vx:     acc = acc + b_multiplier * xb32
      7. vssra_vx_rnu: acc = rvvRoundingShiftRight(acc, shift)
      8. vnclip_wx:    acc16 = signedClamp(acc, 16)
      9. vsadd_vx:     acc16 = signedSatAdd(acc16, output_zero_point)
     10. vnclip_wx:    out8 = signedClamp(acc16, 8)
     11. vmax_vx:      out8 = signedMax(out8, output_min)
     12. vmin_vx:      out8 = signedMin(out8, output_max) -/
def rvvElemFn (p : QS8AddMinmaxParams) (a b : BitVec 8) : BitVec 8 :=
  let xa : BitVec 16 := (sext a 16) - (sext p.a_zero_point 16)
  let xb : BitVec 16 := (sext b 16) - (sext p.b_zero_point 16)
  let xa32 : BitVec 32 := sext xa 32
  let xb32 : BitVec 32 := sext xb 32
  let acc : BitVec 32 := xa32 * p.a_multiplier
  let acc := acc + xb32 * p.b_multiplier
  let acc := rvvRoundingShiftRight acc p.shift.toNat
  let acc16 : BitVec 16 := signedClamp acc 16
  let acc16 := signedSatAdd acc16 p.output_zero_point
  let out8 : BitVec 8 := signedClamp acc16 8
  clamp out8 p.output_min p.output_max

-- ============================================================================
-- Intrinsic-composed pipeline and bridge theorem
-- ============================================================================

/-- RVV iteration built from list-level intrinsic combinators.
    Mirrors kernels/target/qs8-vadd.c line-by-line. -/
def rvvPipelineFromIntrinsics (p : QS8AddMinmaxParams)
    (chunk_a chunk_b : List (BitVec 8)) : List (BitVec 8) :=
  let vxa := vwsub_vx chunk_a p.a_zero_point
  let vxb := vwsub_vx chunk_b p.b_zero_point
  let vxa32 := vsext_vf2 vxa
  let vxb32 := vsext_vf2 vxb
  let vacc := vmul_vx vxa32 p.a_multiplier
  let vacc := vmacc_vx vacc p.b_multiplier vxb32
  let vacc := vssra_vx_rnu vacc p.shift.toNat
  let vacc16 := vnclip_wx_i16 vacc
  let vacc16 := vsadd_vx vacc16 p.output_zero_point
  let vout := vnclip_wx_i8 vacc16
  let vout := vmax_vx vout p.output_min
  vmin_vx vout p.output_max

set_option maxHeartbeats 1600000 in
/-- Bridge theorem: intrinsic-composed pipeline equals List.zipWith rvvElemFn.
    Requires equal-length chunks. -/
theorem rvvPipeline_eq_zipWith (p : QS8AddMinmaxParams)
    (chunk_a chunk_b : List (BitVec 8))
    (h_len : chunk_a.length = chunk_b.length) :
    rvvPipelineFromIntrinsics p chunk_a chunk_b =
    List.zipWith (rvvElemFn p) chunk_a chunk_b := by
  unfold rvvPipelineFromIntrinsics
  simp only [vwsub_vx, vsext_vf2, vmul_vx, vmacc_vx, vssra_vx_rnu,
    vnclip_wx_i16, vnclip_wx_i8, vsadd_vx, vmax_vx, vmin_vx,
    List.map_map]
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

/-- Process one chunk pair through the RVV pipeline. -/
def rvvIteration (p : QS8AddMinmaxParams)
    (chunk_a chunk_b : List (BitVec 8)) : List (BitVec 8) :=
  List.zipWith (rvvElemFn p) chunk_a chunk_b

/-- RVV loop: processes min(remaining, vlmax) elements per iteration from both arrays.
    No tail handling — vl naturally adjusts to remaining length.
    Models the C loop: `while (batch > 0) { vl = vsetvl(batch); ... }` -/
def rvvLoop (p : QS8AddMinmaxParams)
    (input_a input_b : List (BitVec 8))
    (vlmax : Nat) (h_vlmax : vlmax > 0 := by omega) : List (BitVec 8) :=
  match input_a, input_b with
  | [], _ | _, [] => []
  | ha :: ta, hb :: tb =>
    let xs := ha :: ta
    let ys := hb :: tb
    let vl := min xs.length vlmax
    rvvIteration p (xs.take vl) (ys.take vl) ++
    rvvLoop p (xs.drop vl) (ys.drop vl) vlmax
termination_by input_a.length
decreasing_by
  simp [List.length_drop]
  omega

-- ============================================================================
-- Loop = flat zipWith
-- ============================================================================

theorem rvvLoop_eq_zipWith (p : QS8AddMinmaxParams)
    (input_a input_b : List (BitVec 8))
    (h_len : input_a.length = input_b.length)
    (vlmax : Nat) (h_vlmax : vlmax > 0) :
    rvvLoop p input_a input_b vlmax = List.zipWith (rvvElemFn p) input_a input_b := by
  suffices ∀ (n : Nat) (xs ys : List (BitVec 8)),
      xs.length = ys.length → xs.length ≤ n →
      rvvLoop p xs ys vlmax = List.zipWith (rvvElemFn p) xs ys from
    this input_a.length input_a input_b h_len (Nat.le_refl _)
  intro n
  induction n with
  | zero =>
    intro xs ys h_eq h_len
    have : xs = [] := by cases xs <;> simp_all
    subst this
    have : ys = [] := by cases ys <;> simp_all
    subst this; simp [rvvLoop]
  | succ m ih =>
    intro xs ys h_eq h_len
    cases xs with
    | nil =>
      have : ys = [] := by cases ys <;> simp_all
      subst this; simp [rvvLoop]
    | cons hd tl =>
      cases ys with
      | nil => simp at h_eq
      | cons hd' tl' =>
        unfold rvvLoop
        simp only [rvvIteration]
        have h_drop_eq : ((hd :: tl).drop (min (hd :: tl).length vlmax)).length =
            ((hd' :: tl').drop (min (hd :: tl).length vlmax)).length := by
          simp only [List.length_drop, h_eq]
        have h_drop_le : ((hd :: tl).drop (min (hd :: tl).length vlmax)).length ≤ m := by
          simp only [List.length_drop, List.length_cons]
          have := h_len; simp only [List.length_cons] at this; omega
        rw [ih _ _ h_drop_eq h_drop_le]
        exact zipWith_take_append_drop (rvvElemFn p) (hd :: tl) (hd' :: tl')
          (min (hd :: tl).length vlmax) h_eq

end SALT.Kernel.QS8VAdd.RVV
