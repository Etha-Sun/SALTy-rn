import SALT.Basic

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
-- vmul_vx: Multiply by scalar (32-bit)
-- result[i] = a[i] * scalar
-- ============================================================================
def vmul_vx (a : List (BitVec 32)) (scalar : BitVec 32) : List (BitVec 32) :=
  a.map (fun x => x * scalar)

-- ============================================================================
-- vmacc_vx: Multiply-accumulate (32-bit)
-- result[i] = dest[i] + scalar * src[i]
-- ============================================================================
def vmacc_vx (dest : List (BitVec 32)) (scalar : BitVec 32) (src : List (BitVec 32)) : List (BitVec 32) :=
  List.zipWith (fun d s => d + s * scalar) dest src

-- ============================================================================
-- vssra_vx (vxrm=RNU): Rounding arithmetic shift right (RVV-specific)
-- ============================================================================

def rvvRoundingShiftRight (x : BitVec 32) (shift : Nat) : BitVec 32 :=
  if shift = 0 then x
  else
    let shifted : BitVec 32 := x.sshiftRight shift
    let round_bit : Bool := x.getLsbD (shift - 1)
    if round_bit then shifted + 1 else shifted

def vssra_vx_rnu (a : List (BitVec 32)) (shift : Nat) : List (BitVec 32) :=
  a.map (fun x => rvvRoundingShiftRight x shift)

-- ============================================================================
-- vnclip_wx (vxrm=RNU): Signed narrowing clip (32→16 or 16→8)
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

end SALT.Intrinsics.RVV
