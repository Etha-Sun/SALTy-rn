/-
  SALT.Intrinsics.Neon — NEON intrinsic models as pure functions on Lists.

  Each intrinsic mirrors the real ARM NEON operation faithfully.
  The rounding shift uses the NEON-specific 64-bit widen path.

  Reference: `op-semantics/neon-intrinsics.md`, `src/verification/neon/intrinsics.hpp`
-/
import SALT.Basic
import SALT.Params

namespace SALT.Intrinsics.Neon

open SALT

-- ============================================================================
-- vsubl_s8: Signed subtract long (8→16 bit)
-- result[i] = sext16(a[i]) - sext16(b[i])
-- ============================================================================
def vsubl_s8 (a b : List (BitVec 8)) : List (BitVec 16) :=
  List.zipWith (fun x y => (sext x 16) - (sext y 16)) a b

-- ============================================================================
-- vmovl_s16: Signed move long (16→32 bit)
-- result[i] = sext32(a[i])
-- ============================================================================
def vmovl_s16 (a : List (BitVec 16)) : List (BitVec 32) :=
  a.map (fun x => sext x 32)

-- ============================================================================
-- vmlaq_s32: Multiply-accumulate (32-bit)
-- result[i] = acc[i] + b[i] * c[i]
-- ============================================================================
def vmlaq_s32 (acc b : List (BitVec 32)) (c : BitVec 32) : List (BitVec 32) :=
  List.zipWith (fun a x => a + x * c) acc b

-- ============================================================================
-- vrshlq_s32: Rounding shift (NEON-specific)
--
-- For right shift (shift < 0, i.e., the kernel passes -params.shift):
--   Work in 64-bit to avoid overflow:
--     wide = sext64(x)
--     round_const = 1 << (neg_shift - 1)
--     result = truncate32((wide + round_const) >>> neg_shift)
--
-- This is the NEON-specific path. It widens to 64-bit before adding the
-- rounding constant, which avoids the overflow that would occur if we
-- added 1<<(shift-1) to a 32-bit value near INT32_MAX.
--
-- Reference: src/verification/neon/intrinsics.hpp:228-266
-- ============================================================================

/-- NEON rounding arithmetic shift right.
    `shift` is the positive shift amount (the kernel passes `-params.shift`).
    Widens to 64-bit, adds rounding constant, shifts, truncates back. -/
def neonRoundingShiftRight (x : BitVec 32) (shift : Nat) : BitVec 32 :=
  if shift = 0 then x
  else
    let wide : BitVec 64 := x.signExtend 64
    let round_const : BitVec 64 := BitVec.ofNat 64 (1 <<< (shift - 1))
    let rounded : BitVec 64 := wide + round_const
    (rounded.sshiftRight shift).truncate 32

/-- Apply NEON rounding shift to a list of 32-bit values. -/
def vrshlq_s32 (a : List (BitVec 32)) (shift : Nat) : List (BitVec 32) :=
  a.map (fun x => neonRoundingShiftRight x shift)

-- ============================================================================
-- vqmovn_s32: Signed saturating extract narrow (32→16 bit)
-- result[i] = signedClamp(a[i], 16)
-- ============================================================================
def vqmovn_s32 (a : List (BitVec 32)) : List (BitVec 16) :=
  a.map (fun x => signedClamp x 16)

-- ============================================================================
-- vqmovn_s16: Signed saturating extract narrow (16→8 bit)
-- result[i] = signedClamp(a[i], 8)
-- ============================================================================
def vqmovn_s16 (a : List (BitVec 16)) : List (BitVec 8) :=
  a.map (fun x => signedClamp x 8)

-- ============================================================================
-- vqaddq_s16: Signed saturating add (16-bit)
-- result[i] = signedSatAdd(a[i], b[i])
-- ============================================================================
def vqaddq_s16 (a : List (BitVec 16)) (scalar : BitVec 16) : List (BitVec 16) :=
  a.map (fun x => signedSatAdd x scalar)

-- ============================================================================
-- vmax_s8 / vmin_s8: Signed element-wise max/min (8-bit)
-- ============================================================================
def vmax_s8 (a : List (BitVec 8)) (scalar : BitVec 8) : List (BitVec 8) :=
  a.map (fun x => bvSignedMax x scalar)

def vmin_s8 (a : List (BitVec 8)) (scalar : BitVec 8) : List (BitVec 8) :=
  a.map (fun x => bvSignedMin x scalar)

-- ============================================================================
-- Per-element function: the complete NEON pipeline for one input byte.
-- This is what neonIteration reduces to when we unfold all intrinsics.
--
-- Pipeline (from kernels/source/qs8-vaddc.c:43-62):
--   1. vsubl_s8:    xa = sext16(input) - sext16(a_zero_point)
--   2. vmovl_s16:   xa32 = sext32(xa)
--   3. vmlaq_s32:   acc = bias + xa32 * a_multiplier
--   4. vrshlq_s32:  acc = neonRoundingShiftRight(acc, shift)
--   5. vqmovn_s32:  acc16 = signedClamp(acc, 16)
--   6. vqaddq_s16:  acc16 = signedSatAdd(acc16, output_zero_point)
--   7. vqmovn_s16:  out8 = signedClamp(acc16, 8)
--   8. vmax_s8:     out8 = signedMax(out8, output_min)
--   9. vmin_s8:     out8 = signedMin(out8, output_max)
-- ============================================================================
def neonElemFn (p : QS8AddMinmaxParams) (bias : BitVec 32) (x : BitVec 8) : BitVec 8 :=
  -- Step 1: subtract zero point, widen to 16-bit
  let xa : BitVec 16 := (sext x 16) - (sext p.a_zero_point 16)
  -- Step 2: widen to 32-bit
  let xa32 : BitVec 32 := sext xa 32
  -- Step 3: multiply-accumulate with bias
  let acc : BitVec 32 := bias + xa32 * p.a_multiplier
  -- Step 4: NEON rounding shift right (64-bit widen path)
  let acc := neonRoundingShiftRight acc p.shift.toNat
  -- Step 5: saturating narrow 32→16
  let acc16 : BitVec 16 := signedClamp acc 16
  -- Step 6: saturating add output zero point
  let acc16 := signedSatAdd acc16 p.output_zero_point
  -- Step 7: saturating narrow 16→8
  let out8 : BitVec 8 := signedClamp acc16 8
  -- Step 8-9: clamp to [output_min, output_max]
  clamp out8 p.output_min p.output_max

-- ============================================================================
-- Intrinsic-composed pipeline: build the full iteration from the list-level
-- intrinsic models above, mirroring the C kernel's vectorized loop body.
--
-- This bridges the intrinsic models into the proof chain: if any intrinsic
-- model (vsubl_s8, vmlaq_s32, etc.) is wrong, the bridge theorem below fails.
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

end SALT.Intrinsics.Neon
