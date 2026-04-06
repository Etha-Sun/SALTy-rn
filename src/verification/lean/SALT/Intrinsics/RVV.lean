/-
  SALT.Intrinsics.RVV — RVV intrinsic models as pure functions on Lists.

  Each intrinsic mirrors the real RISC-V Vector operation faithfully.
  The rounding shift uses the RVV-specific bit-extract path (vxrm=RNU).

  Reference: `op-semantics/rvv-intrinsics.md`, `src/verification/rvv/intrinsics.hpp`
-/
import SALT.Basic
import SALT.Params

namespace SALT.Intrinsics.RVV

open SALT

-- ============================================================================
-- vwsub_vx: Widening subtract (8→16 bit)
-- result[i] = sext16(a[i]) - sext16(scalar)
-- ============================================================================
def vwsub_vx (a : List (BitVec 8)) (scalar : BitVec 8) : List (BitVec 16) :=
  a.map (fun x => (sext x 16) - (sext scalar 16))

-- ============================================================================
-- vsext_vf2: Sign extension (16→32 bit)
-- result[i] = sext32(a[i])
-- ============================================================================
def vsext_vf2 (a : List (BitVec 16)) : List (BitVec 32) :=
  a.map (fun x => sext x 32)

-- ============================================================================
-- vmv_v_x: Broadcast scalar to vector
-- result[i] = scalar  (for i in 0..vl-1)
-- ============================================================================
def vmv_v_x (scalar : BitVec 32) (vl : Nat) : List (BitVec 32) :=
  List.replicate vl scalar

-- ============================================================================
-- vmacc_vx: Multiply-accumulate (32-bit)
-- result[i] = dest[i] + scalar * src[i]
-- ============================================================================
def vmacc_vx (dest : List (BitVec 32)) (scalar : BitVec 32) (src : List (BitVec 32)) : List (BitVec 32) :=
  List.zipWith (fun d s => d + s * scalar) dest src

-- ============================================================================
-- vssra_vx (vxrm=RNU): Rounding arithmetic shift right (RVV-specific)
--
-- RNU (Round to Nearest, ties to Up):
--   shifted = x >>> shift        (arithmetic shift right)
--   round_bit = x[shift-1]      (extract bit just below the shift boundary)
--   result = shifted + zext(round_bit)
--
-- This is the RVV-specific path. It shifts first, then adds the rounding bit.
-- Unlike NEON, it does NOT widen to 64-bit — it works entirely in 32-bit.
--
-- Reference: src/verification/rvv/intrinsics.hpp:33-57
-- ============================================================================

/-- RVV rounding arithmetic shift right (vxrm=RNU).
    `shift` is the positive shift amount.
    Shifts first, then adds the rounding bit extracted from position shift-1. -/
def rvvRoundingShiftRight (x : BitVec 32) (shift : Nat) : BitVec 32 :=
  if shift = 0 then x
  else
    let shifted : BitVec 32 := x.sshiftRight shift
    let round_bit : Bool := x.getLsbD (shift - 1)
    if round_bit then shifted + 1 else shifted

/-- Apply RVV rounding shift to a list of 32-bit values. -/
def vssra_vx_rnu (a : List (BitVec 32)) (shift : Nat) : List (BitVec 32) :=
  a.map (fun x => rvvRoundingShiftRight x shift)

-- ============================================================================
-- vnclip_wx (vxrm=RNU): Signed narrowing clip (32→16 or 16→8)
-- With shift=0: result[i] = signedClamp(a[i], narrow)
-- ============================================================================
def vnclip_wx_i16 (a : List (BitVec 32)) : List (BitVec 16) :=
  a.map (fun x => signedClamp x 16)

def vnclip_wx_i8 (a : List (BitVec 16)) : List (BitVec 8) :=
  a.map (fun x => signedClamp x 8)

-- ============================================================================
-- vsadd_vx: Signed saturating add with scalar (16-bit)
-- result[i] = signedSatAdd(a[i], scalar)
-- ============================================================================
def vsadd_vx (a : List (BitVec 16)) (scalar : BitVec 16) : List (BitVec 16) :=
  a.map (fun x => signedSatAdd x scalar)

-- ============================================================================
-- vmax_vx / vmin_vx: Signed element-wise max/min with scalar
-- ============================================================================
def vmax_vx (a : List (BitVec 8)) (scalar : BitVec 8) : List (BitVec 8) :=
  a.map (fun x => bvSignedMax x scalar)

def vmin_vx (a : List (BitVec 8)) (scalar : BitVec 8) : List (BitVec 8) :=
  a.map (fun x => bvSignedMin x scalar)

-- ============================================================================
-- Per-element function: the complete RVV pipeline for one input byte.
-- This is what rvvIteration reduces to when we unfold all intrinsics.
--
-- Pipeline (from kernels/target/qs8-vaddc.c:26-48):
--   1. vwsub_vx:     xa = sext16(input) - sext16(a_zero_point)
--   2. vsext_vf2:    xa32 = sext32(xa)
--   3. vmacc_vx:     acc = bias + a_multiplier * xa32
--   4. vssra_vx_rnu: acc = rvvRoundingShiftRight(acc, shift)
--   5. vnclip_wx:    acc16 = signedClamp(acc, 16)
--   6. vsadd_vx:     acc16 = signedSatAdd(acc16, output_zero_point)
--   7. vnclip_wx:    out8 = signedClamp(acc16, 8)
--   8. vmax_vx:      out8 = signedMax(out8, output_min)
--   9. vmin_vx:      out8 = signedMin(out8, output_max)
-- ============================================================================
def rvvElemFn (p : QS8AddMinmaxParams) (bias : BitVec 32) (x : BitVec 8) : BitVec 8 :=
  -- Step 1: subtract zero point, widen to 16-bit
  let xa : BitVec 16 := (sext x 16) - (sext p.a_zero_point 16)
  -- Step 2: widen to 32-bit
  let xa32 : BitVec 32 := sext xa 32
  -- Step 3: multiply-accumulate with bias
  let acc : BitVec 32 := bias + xa32 * p.a_multiplier
  -- Step 4: RVV rounding shift right (bit-extract path)
  let acc := rvvRoundingShiftRight acc p.shift.toNat
  -- Step 5: saturating narrow 32→16
  let acc16 : BitVec 16 := signedClamp acc 16
  -- Step 6: saturating add output zero point
  let acc16 := signedSatAdd acc16 p.output_zero_point
  -- Step 7: saturating narrow 16→8
  let out8 : BitVec 8 := signedClamp acc16 8
  -- Step 8-9: clamp to [output_min, output_max]
  clamp out8 p.output_min p.output_max

-- ============================================================================
-- Intrinsic-composed pipeline: mirrors kernels/target/qs8-vaddc.c:26-48.
-- ============================================================================

/-- RVV iteration built from list-level intrinsic combinators. -/
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

end SALT.Intrinsics.RVV
