import Std

-- A function from all natural numbers into a fixed finite interval cannot be injective.
theorem no_bounded_injection (m : Nat) :
    ∀ (f : Nat → Nat), (∀ n, f n < m) →
      (∀ a b, f a = f b → a = b) → False := by
  induction m with
  | zero =>
    intro f bounded _
    have := bounded 0
    omega
  | succ m ih =>
    intro f bounded injective
    let cut (x : Nat) := if x < f 0 then x else x - 1
    have cut_injective (x y : Nat) (hx : x ≠ f 0) (hy : y ≠ f 0)
        (heq : cut x = cut y) : x = y := by
      dsimp [cut] at heq
      split at heq <;> split at heq <;> omega
    have next_ne (n : Nat) : f (n + 1) ≠ f 0 := by
      intro heq
      have := injective (n + 1) 0 heq
      omega
    let g (n : Nat) := cut (f (n + 1))
    have g_bounded (n : Nat) : g n < m := by
      have hbound := bounded (n + 1)
      have hne := next_ne n
      have hzero := bounded 0
      dsimp [g, cut]
      split <;> omega
    have g_injective (a b : Nat) (heq : g a = g b) : a = b := by
      have h := cut_injective (f (a + 1)) (f (b + 1)) (next_ne a) (next_ne b) heq
      have := injective (a + 1) (b + 1) h
      omega
    exact ih g g_bounded g_injective

-- The hypotheses here are explicit theorem arguments, not new global axioms.
-- They are the base=0 instances of the old range law and inverse law.
theorem range_inverse_conflict (m : Nat)
    (encode : Int × Int → Int) (decode : Int → Int × Int)
    (bounded : ∀ z : Int, 0 ≤ encode (0, z) ∧ encode (0, z) < Int.ofNat m)
    (inverse : ∀ z : Int, decode (encode (0, z)) = (0, z)) : False := by
  let f (n : Nat) := (encode (0, Int.ofNat n)).toNat
  have f_bounded (n : Nat) : f n < m := by
    have h := bounded (Int.ofNat n)
    dsimp [f]
    exact (Int.toNat_lt h.1).mpr h.2
  have f_injective (a b : Nat) (heq : f a = f b) : a = b := by
    have ha := bounded (Int.ofNat a)
    have hb := bounded (Int.ofNat b)
    have henc : encode (0, Int.ofNat a) = encode (0, Int.ofNat b) := by
      calc
        encode (0, Int.ofNat a) = Int.ofNat (f a) := (Int.toNat_of_nonneg ha.1).symm
        _ = Int.ofNat (f b) := congrArg Int.ofNat heq
        _ = encode (0, Int.ofNat b) := Int.toNat_of_nonneg hb.1
    have hpair : ((0 : Int), Int.ofNat a) = (0, Int.ofNat b) := by
      calc
        (0, Int.ofNat a) = decode (encode (0, Int.ofNat a)) := (inverse _).symm
        _ = decode (encode (0, Int.ofNat b)) := congrArg decode henc
        _ = (0, Int.ofNat b) := inverse _
    have hoff := congrArg Prod.snd hpair
    exact Int.ofNat.inj hoff
  exact no_bounded_injection m f f_bounded f_injective

#print axioms no_bounded_injection
#print axioms range_inverse_conflict
