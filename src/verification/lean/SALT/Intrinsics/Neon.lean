import SALT.Basic

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
-- vmulq_s32: Multiply by scalar (32-bit)
-- result[i] = a[i] * scalar
-- ============================================================================
def vmulq_s32 (a : List (BitVec 32)) (scalar : BitVec 32) : List (BitVec 32) :=
  a.map (fun x => x * scalar)

-- ============================================================================
-- vmlaq_s32: Multiply-accumulate (32-bit)
-- result[i] = acc[i] + b[i] * c
-- ============================================================================
def vmlaq_s32 (acc b : List (BitVec 32)) (c : BitVec 32) : List (BitVec 32) :=
  List.zipWith (fun a x => a + x * c) acc b

-- ============================================================================
-- vrshlq_s32: Rounding shift right (NEON-specific)
-- ============================================================================

def neonRoundingShiftRight (x : BitVec 32) (shift : Nat) : BitVec 32 :=
  if shift = 0 then x
  else
    let wide : BitVec 64 := x.signExtend 64
    let round_const : BitVec 64 := BitVec.ofNat 64 (1 <<< (shift - 1))
    let rounded : BitVec 64 := wide + round_const
    (rounded.sshiftRight shift).truncate 32

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
-- result[i] = signedSatAdd(a[i], scalar)
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

end SALT.Intrinsics.Neon
