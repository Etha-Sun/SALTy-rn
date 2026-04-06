/-
  SALT.Basic — BitVec helpers for SIMD kernel verification.

  All operations use BitVec (hardware) semantics: fixed-width, wrapping arithmetic.
  "Unbounded" refers to input *length*, not element bit-widths.
-/

namespace SALT

-- ============================================================================
-- Signed clamp (saturating narrow)
-- ============================================================================

/-- Signed saturating clamp: clamp `x` (interpreted as signed `wide`-bit) to
    the signed range of `narrow` bits, returning a `narrow`-bit result.
    Models SQXTN (NEON) / vnclip (RVV) with shift=0. -/
def signedClamp {wide : Nat} (x : BitVec wide) (narrow : Nat) : BitVec narrow :=
  let xi := x.toInt
  let lo := -(2 ^ (narrow - 1) : Int)
  let hi := (2 ^ (narrow - 1) - 1 : Int)
  let clamped := max lo (min xi hi)
  BitVec.ofInt narrow clamped

-- ============================================================================
-- Signed saturating add
-- ============================================================================

/-- Signed saturating add: widen both operands, add, clamp back.
    Models SQADD (NEON) / vsadd (RVV). -/
def signedSatAdd {n : Nat} (a b : BitVec n) : BitVec n :=
  let sum := a.toInt + b.toInt
  let lo := -(2 ^ (n - 1) : Int)
  let hi := (2 ^ (n - 1) - 1 : Int)
  let clamped := max lo (min sum hi)
  BitVec.ofInt n clamped

-- ============================================================================
-- Signed min / max (element-wise)
-- ============================================================================

/-- Signed maximum of two BitVec values. -/
def bvSignedMax {n : Nat} (a b : BitVec n) : BitVec n :=
  if a.toInt ≥ b.toInt then a else b

/-- Signed minimum of two BitVec values. -/
def bvSignedMin {n : Nat} (a b : BitVec n) : BitVec n :=
  if a.toInt ≤ b.toInt then a else b

-- ============================================================================
-- Clamp (signed min/max composition)
-- ============================================================================

/-- Clamp `x` between `lo` and `hi` using signed comparison.
    Matches C code order: vmax(x, lo) then vmin(result, hi).
    Equivalent to `signedMax(lo, signedMin(x, hi))` when `lo ≤ hi`. -/
def clamp {n : Nat} (x lo hi : BitVec n) : BitVec n :=
  bvSignedMin (bvSignedMax x lo) hi

-- ============================================================================
-- Sign extension
-- ============================================================================

/-- Sign-extend from n bits to m bits.
    Wraps BitVec.signExtend. -/
def sext {n : Nat} (x : BitVec n) (m : Nat) : BitVec m :=
  x.signExtend m

-- ============================================================================
-- List helpers for intrinsic bridge proofs
-- ============================================================================

/-- zipWith f (replicate n a) l = l.map (f a) when n = l.length. -/
theorem zipWith_replicate_left {α β γ : Type} (f : α → β → γ) (a : α)
    (l : List β) (n : Nat) (h : n = l.length := by simp) :
    List.zipWith f (List.replicate n a) l = l.map (f a) := by
  subst h
  induction l with
  | nil => rfl
  | cons hd tl ih => simp [List.replicate, ih]

/-- zipWith f l (replicate n a) = l.map (fun x => f x a) when n = l.length. -/
theorem zipWith_replicate_right {α β γ : Type} (f : α → β → γ) (b : β)
    (l : List α) (n : Nat) (h : n = l.length := by simp) :
    List.zipWith f l (List.replicate n b) = l.map (fun x => f x b) := by
  subst h
  induction l with
  | nil => rfl
  | cons hd tl ih => simp [List.replicate, ih]

end SALT
