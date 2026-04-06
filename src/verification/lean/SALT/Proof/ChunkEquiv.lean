/-
  SALT.Proof.ChunkEquiv — Chunked processing = flat processing.

  Proves that both the NEON loop (fixed 8-element chunks + tail) and the
  RVV loop (variable-length chunks) produce the same result as a flat
  List.map, given that their iterations are List.map of the per-element fn.
-/
import SALT.Kernel.Neon
import SALT.Kernel.RVV

namespace SALT.Proof.ChunkEquiv

open SALT
open SALT.Kernel.Neon
open SALT.Kernel.RVV
open SALT.Intrinsics.Neon
open SALT.Intrinsics.RVV

/-- Helper: (xs ++ pad).map f |>.take xs.length = xs.map f -/
private theorem map_append_take {α β : Type} (f : α → β)
    (xs pad : List α) :
    ((xs ++ pad).map f).take xs.length = xs.map f := by
  rw [List.map_append]
  have h_len : (xs.map f).length = xs.length := by simp
  rw [← h_len]
  exact List.take_left ..

-- ============================================================================
-- RVV loop = flat map
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

-- ============================================================================
-- NEON loop = flat map
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

end SALT.Proof.ChunkEquiv
