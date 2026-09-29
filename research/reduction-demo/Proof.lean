import Spec

set_option maxRecDepth 4096

namespace SALT.Corpus.qu8rsum

theorem word_zero_add (x : Word) : (0 : Word) + x = x := BitVec.zero_add x
theorem word_add_zero (x : Word) : x + (0 : Word) = x := BitVec.add_zero x

/- Proof-only ghost projection. Concrete lane state remains in Models. -/
def wordSum : List Word → Word
  | [] => 0
  | x :: xs => x + wordSum xs

def byteSum (xs : List Byte) : Word := wordSum (vzext_vf4 xs)

theorem wordSum_append (xs ys : List Word) :
    wordSum (xs ++ ys) = wordSum xs + wordSum ys := by
  induction xs with
  | nil => simp [wordSum]
  | cons x xs ih => simp [wordSum, ih, BitVec.add_assoc]

theorem wordSum_replicate_zero (n : Nat) :
    wordSum (List.replicate n (0 : Word)) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [List.replicate_succ, wordSum, ih]
    exact BitVec.zero_add _

theorem wordSum_foldl (xs : List Word) (seed : Word) :
    xs.foldl (· + ·) seed = seed + wordSum xs := by
  induction xs generalizing seed with
  | nil => simp [wordSum]
  | cons x xs ih => simp [wordSum, ih, BitVec.add_assoc]

theorem byteSum_append (xs ys : List Byte) :
    byteSum (xs ++ ys) = byteSum xs + byteSum ys := by
  simp [byteSum, vzext_vf4, wordSum_append]

theorem byteSum_take_drop (n : Nat) (xs : List Byte) :
    byteSum (xs.take n) + byteSum (xs.drop n) = byteSum xs := by
  rw [← byteSum_append, List.take_append_drop]

theorem vadd_tu_length (acc xs : List Word) :
    (vadd_tu acc xs).length = acc.length := by
  induction acc generalizing xs with
  | nil => cases xs <;> rfl
  | cons a acc ih => cases xs <;> simp [vadd_tu, ih]

theorem vadd_tu_sum (acc xs : List Word) (h : xs.length ≤ acc.length) :
    wordSum (vadd_tu acc xs) = wordSum acc + wordSum xs := by
  induction acc generalizing xs with
  | nil => cases xs with
    | nil => simp [vadd_tu, wordSum]
    | cons x xs => simp at h
  | cons a acc ih => cases xs with
    | nil => simp [vadd_tu, wordSum]
    | cons x xs =>
      have h' : xs.length ≤ acc.length := by simpa using h
      simp only [vadd_tu, wordSum, ih xs h']
      rw [BitVec.add_assoc, ← BitVec.add_assoc x, BitVec.add_comm x (wordSum acc)]
      simp only [BitVec.add_assoc]

theorem rvvStep_length (vl : Nat) (s : RvvState) :
    (rvvStep vl s).vacc.length = s.vacc.length := by
  simp [rvvStep, vadd_tu_length]

/-- One chunk preserves the modular sum of lanes plus the unread suffix. -/
theorem rvvStep_conservation (vl : Nat) (s : RvvState)
    (h : vl ≤ s.vacc.length) :
    wordSum (rvvStep vl s).vacc + byteSum (rvvStep vl s).input =
      wordSum s.vacc + byteSum s.input := by
  have hlen : (vzext_vf4 (s.input.take vl)).length ≤ s.vacc.length := by
    simp only [vzext_vf4, List.length_map, List.length_take]
    omega
  simp only [rvvStep, vadd_tu_sum _ _ hlen]
  rw [← byteSum, BitVec.add_assoc, byteSum_take_drop]

theorem rvvLoop_length (chunks : List Nat) (s : RvvState) :
    (rvvLoop chunks s).vacc.length = s.vacc.length := by
  induction chunks generalizing s with
  | nil => rfl
  | cons vl chunks ih => simp [rvvLoop, ih, rvvStep_length]

theorem rvvLoop_output (chunks : List Nat) (s : RvvState) :
    (rvvLoop chunks s).output = s.output := by
  induction chunks generalizing s with
  | nil => rfl
  | cons vl chunks ih => simp [rvvLoop, ih, rvvStep]

theorem rvvLoop_input (chunks : List Nat) (s : RvvState) :
    (rvvLoop chunks s).input = s.input.drop chunks.sum := by
  induction chunks generalizing s with
  | nil => simp [rvvLoop]
  | cons vl chunks ih => simp [rvvLoop, ih, rvvStep, List.drop_drop, Nat.add_comm]

theorem rvvLoop_offset (chunks : List Nat) (s : RvvState) :
    (rvvLoop chunks s).inputOffset = s.inputOffset + chunks.sum := by
  induction chunks generalizing s with
  | nil => simp [rvvLoop]
  | cons vl chunks ih => simp [rvvLoop, ih, rvvStep, Nat.add_assoc]

theorem rvvLoop_batch (chunks : List Nat) (s : RvvState) :
    (rvvLoop chunks s).batch = s.batch - chunks.sum := by
  induction chunks generalizing s with
  | nil => simp [rvvLoop]
  | cons vl chunks ih => simp [rvvLoop, ih, rvvStep, Nat.sub_sub]

theorem rvvLoop_conservation (chunks : List Nat) (s : RvvState)
    (h : ∀ vl ∈ chunks, vl ≤ s.vacc.length) :
    wordSum (rvvLoop chunks s).vacc + byteSum (rvvLoop chunks s).input =
      wordSum s.vacc + byteSum s.input := by
  induction chunks generalizing s with
  | nil => rfl
  | cons vl chunks ih =>
    simp only [rvvLoop]
    rw [ih]
    · exact rvvStep_conservation vl s (h vl (by simp))
    · intro v hv
      rw [rvvStep_length]
      exact h v (by simp [hv])

/-- All bounded complete partitions have the same unsigned modular sum. -/
theorem rvv_value_eq_byteSum (input : List Byte) (oldOutput : Word)
    (vlmax : Nat) (chunks : List Nat)
    (h : ScheduleOK input.length vlmax chunks) :
    rvvValueLoopFromIntrinsics input oldOutput vlmax chunks =
      oldOutput + byteSum input := by
  let s : RvvState :=
    ⟨input, 0, input.length, vlmax, vlmax, List.replicate vlmax 0, oldOutput⟩
  have hbound : ∀ vl ∈ chunks, vl ≤ s.vacc.length := by
    intro vl hv
    simpa [s] using (h.2.2 vl hv).2
  have hc := rvvLoop_conservation chunks s hbound
  have he : (rvvLoop chunks s).input = [] := by
    simp [rvvLoop_input, s, h.2.1]
  have hl : (rvvLoop chunks s).vacc.length = vlmax := by
    simp [rvvLoop_length, s]
  have hs : wordSum (rvvLoop chunks s).vacc = byteSum input := by
    rw [he] at hc
    change wordSum (rvvLoop chunks s).vacc + 0 =
      wordSum (List.replicate vlmax 0) + byteSum input at hc
    simpa only [wordSum_replicate_zero, word_add_zero, word_zero_add] using hc
  change (rvvLoop chunks s).output + vredsum (rvvLoop chunks s).vacc 0 vlmax = _
  rw [rvvLoop_output, vredsum, ← hl, List.take_length, wordSum_foldl]
  rw [word_zero_add, hs]

def halfSum (xs : List Half) : Word := wordSum (xs.map (·.zeroExtend 32))

def HalfBound (bound : Nat) (xs : List Half) : Prop :=
  ∀ a ∈ xs, a.toNat ≤ bound

theorem byte_pair_nat (x y : Byte) :
    (x.zeroExtend 16 + y.zeroExtend 16).toNat = x.toNat + y.toNat := by
  have hx := x.isLt
  have hy := y.isLt
  simp only [BitVec.toNat_add, BitVec.toNat_setWidth_of_le (by decide : 8 ≤ 16)]
  apply Nat.mod_eq_of_lt
  omega

theorem half_update_nat (a : Half) (x y : Byte) (bound : Nat)
    (ha : a.toNat ≤ bound) (hb : bound + 510 < 65536) :
    (a + (x.zeroExtend 16 + y.zeroExtend 16)).toNat =
      a.toNat + x.toNat + y.toNat := by
  have hx := x.isLt
  have hy := y.isLt
  rw [BitVec.toNat_add, byte_pair_nat, Nat.mod_eq_of_lt]
  · omega
  · omega

theorem half_update_widen (a : Half) (x y : Byte) (bound : Nat)
    (ha : a.toNat ≤ bound) (hb : bound + 510 < 65536) :
    (a + (x.zeroExtend 16 + y.zeroExtend 16)).zeroExtend 32 =
      a.zeroExtend 32 + (x.zeroExtend 32 + y.zeroExtend 32) := by
  apply BitVec.eq_of_toNat_eq
  have hx := x.isLt
  have hy := y.isLt
  simp only [BitVec.toNat_setWidth_of_le (by decide : 16 ≤ 32),
    half_update_nat a x y bound ha hb, BitVec.toNat_add,
    BitVec.toNat_setWidth_of_le (by decide : 8 ≤ 32)]
  rw [Nat.mod_eq_of_lt (show x.toNat + y.toNat < 2 ^ 32 by omega)]
  rw [Nat.mod_eq_of_lt (show a.toNat + (x.toNat + y.toNat) < 2 ^ 32 by omega)]
  omega

theorem vpadalq_u8_invariant (acc : List Half) (xs : List Byte) (bound : Nat)
    (hshape : xs.length = 2 * acc.length)
    (ha : HalfBound bound acc) (hb : bound + 510 < 65536) :
    (vpadalq_u8 acc xs).length = acc.length ∧
    HalfBound (bound + 510) (vpadalq_u8 acc xs) ∧
    halfSum (vpadalq_u8 acc xs) = halfSum acc + byteSum xs := by
  induction acc generalizing xs with
  | nil =>
    have hx : xs = [] := by simpa using hshape
    subst xs
    simp [vpadalq_u8, pairwiseWiden, HalfBound, halfSum, byteSum, vzext_vf4, wordSum]
  | cons a acc ih =>
    cases xs with
    | nil => simp at hshape
    | cons x xs => cases xs with
      | nil => simp at hshape; omega
      | cons y xs =>
        have hshape' : xs.length = 2 * acc.length := by simp at hshape; omega
        have ha0 : a.toNat ≤ bound := ha a (by simp)
        have ha' : HalfBound bound acc := fun z hz => ha z (by simp [hz])
        obtain ⟨hl, hbound, hsum⟩ := ih xs hshape' ha'
        have hu : (a + (x.zeroExtend 16 + y.zeroExtend 16)).toNat ≤ bound + 510 := by
          rw [half_update_nat a x y bound ha0 hb]
          have hx := x.isLt
          have hy := y.isLt
          omega
        constructor
        · simpa [vpadalq_u8, pairwiseWiden] using hl
        constructor
        · intro z hz
          simp only [vpadalq_u8, pairwiseWiden, List.zipWith_cons_cons, List.mem_cons] at hz
          rcases hz with rfl | hz
          · exact hu
          · exact hbound z hz
        · change (a + (x.zeroExtend 16 + y.zeroExtend 16)).zeroExtend 32 +
              halfSum (vpadalq_u8 acc xs) =
            (a.zeroExtend 32 + halfSum acc) +
              (x.zeroExtend 32 + (y.zeroExtend 32 + byteSum xs))
          rw [half_update_widen a x y bound ha0 hb, hsum]
          simp only [BitVec.add_assoc]
          rw [← BitVec.add_assoc (x.zeroExtend 32),
            ← BitVec.add_assoc (x.zeroExtend 32 + y.zeroExtend 32),
            BitVec.add_comm (x.zeroExtend 32 + y.zeroExtend 32) (halfSum acc)]
          simp only [BitVec.add_assoc]

theorem pairwiseWiden_word_sum (w : Nat) (xs : List (BitVec w)) :
    wordSum (pairwiseWiden w 32 xs) = wordSum (xs.map (·.zeroExtend 32)) := by
  induction xs using pairwiseWiden.induct w with
  | case1 x y xs ih => simp [pairwiseWiden, wordSum, ih, BitVec.add_assoc]
  | case2 x => rfl
  | case3 => rfl

theorem zipWith_word_sum (acc xs : List Word) (h : acc.length = xs.length) :
    wordSum (List.zipWith (· + ·) acc xs) = wordSum acc + wordSum xs := by
  induction acc generalizing xs with
  | nil => cases xs <;> simp_all [wordSum]
  | cons a acc ih => cases xs with
    | nil => simp at h
    | cons x xs =>
      have h' : acc.length = xs.length := by simpa using h
      simp only [List.zipWith_cons_cons, wordSum, ih xs h']
      rw [BitVec.add_assoc, ← BitVec.add_assoc x, BitVec.add_comm x (wordSum acc)]
      simp only [BitVec.add_assoc]

theorem pairwiseWiden_length (w v : Nat) (xs : List (BitVec w)) :
    (pairwiseWiden w v xs).length = (xs.length + 1) / 2 := by
  induction xs using pairwiseWiden.induct w with
  | case1 x y xs ih => simp [pairwiseWiden, ih]; omega
  | case2 x => simp [pairwiseWiden]
  | case3 => simp [pairwiseWiden]

theorem vpadalq_u16_sum (acc : List Word) (xs : List Half)
    (h : xs.length = 2 * acc.length) :
    wordSum (vpadalq_u16 acc xs) = wordSum acc + halfSum xs := by
  unfold vpadalq_u16
  rw [zipWith_word_sum, pairwiseWiden_word_sum]
  · rfl
  · rw [pairwiseWiden_length, h]
    omega

theorem neonInner_fields (n : Nat) (s : NeonState) :
    (neonInner n s).input = s.input.drop (16 * n) ∧
    (neonInner n s).inputOffset = s.inputOffset + 16 * n ∧
    (neonInner n s).batch = s.batch ∧
    (neonInner n s).currentBatch = s.currentBatch - 16 * n ∧
    (neonInner n s).vacc0 = s.vacc0 ∧
    (neonInner n s).output = s.output := by
  induction n generalizing s with
  | zero => simp [neonInner]
  | succ n ih =>
    obtain ⟨hi, ho, hb, hc, hv, hy⟩ := ih
      { neonLoad16 s with currentBatch := s.currentBatch - 16 }
    simp only [neonInner, neonLoad16]
    simp only [neonLoad16] at hi ho hb hc hv hy
    refine ⟨?_, ?_, hb, ?_, hv, hy⟩
    · rw [hi, List.drop_drop]
      congr 1
      omega
    · rw [ho]
      omega
    · rw [hc]
      omega

theorem byteSum_take_split (n m : Nat) (xs : List Byte) :
    byteSum (xs.take (n + m)) =
      byteSum (xs.take n) + byteSum ((xs.drop n).take m) := by
  rw [List.take_add, byteSum_append]

/-- Inner-loop invariant: after t prior loads, every half lane is bounded
    by 510*t; any remaining n loads with t+n≤128 cannot overflow BV16. -/
theorem neonInner_invariant (n t : Nat) (s : NeonState)
    (hcount : t + n ≤ 128) (hinput : 16 * n ≤ s.input.length)
    (hshape : s.vacc16.length = 8) (hbound : HalfBound (510 * t) s.vacc16) :
    (neonInner n s).vacc16.length = 8 ∧
    HalfBound (510 * (t + n)) (neonInner n s).vacc16 ∧
    halfSum (neonInner n s).vacc16 =
      halfSum s.vacc16 + byteSum (s.input.take (16 * n)) := by
  induction n generalizing t s with
  | zero => simpa [neonInner, byteSum, vzext_vf4, wordSum] using And.intro hshape hbound
  | succ n ih =>
    have hlen : (s.input.take 16).length = 2 * s.vacc16.length := by
      simp only [List.length_take, hshape]
      omega
    obtain ⟨hl, hb, hs⟩ := vpadalq_u8_invariant s.vacc16 (s.input.take 16)
      (510 * t) hlen hbound (by omega)
    let s' := { neonLoad16 s with currentBatch := s.currentBatch - 16 }
    have hl' : s'.vacc16.length = 8 := by simpa [s', neonLoad16, hshape] using hl
    have hb' : HalfBound (510 * (t + 1)) s'.vacc16 := by
      simpa only [s', neonLoad16, Nat.mul_add, Nat.mul_one] using hb
    have hi' : 16 * n ≤ s'.input.length := by
      simp only [s', neonLoad16, List.length_drop]
      omega
    obtain ⟨hlf, hbf, hsf⟩ := ih (t + 1) s' (by omega) hi' hl' hb'
    change (neonInner n s').vacc16.length = 8 ∧ _
    refine ⟨hlf, ?_, ?_⟩
    · simpa only [Nat.add_assoc, Nat.add_comm 1 n] using hbf
    · change halfSum (neonInner n s').vacc16 = _
      rw [hsf]
      change halfSum (vpadalq_u8 s.vacc16 (s.input.take 16)) +
          byteSum ((s.input.drop 16).take (16 * n)) = _
      rw [hs, BitVec.add_assoc, ← byteSum_take_split]
      congr 3
      omega

theorem halfSum_zero (n : Nat) : halfSum (List.replicate n (0 : Half)) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change (0 : Half).zeroExtend 32 + halfSum (List.replicate n 0) = 0
    rw [ih]
    rfl

theorem halfBound_zero (n bound : Nat) : HalfBound bound (List.replicate n 0) := by
  intro a ha
  have he : a = 0 := List.eq_of_mem_replicate ha
  subst a
  exact Nat.zero_le _

/-- A complete 2048-byte NEON block, including all 128 lane updates. -/
theorem neonFullBlock_sum (s : NeonState)
    (hi : 2048 ≤ s.input.length) (hv : s.vacc0.length = 4) :
    wordSum (neonFullBlock s).vacc0 =
      wordSum s.vacc0 + byteSum (s.input.take 2048) := by
  let s0 := { s with vacc16 := List.replicate 8 0, currentBatch := 2048 }
  have hc := neonInner_invariant 128 0 s0 (by decide) hi
    (by simp [s0]) (halfBound_zero 8 0)
  have hf := neonInner_fields 128 s0
  change wordSum (vpadalq_u16 (neonInner 128 s0).vacc0 (neonInner 128 s0).vacc16) = _
  rw [vpadalq_u16_sum]
  · rw [hf.2.2.2.2.1, hc.2.2]
    change wordSum s.vacc0 + (halfSum (List.replicate 8 0) + _) = _
    rw [halfSum_zero, word_zero_add]
  · rw [hc.1, hf.2.2.2.2.1]
    change 8 = 2 * s.vacc0.length
    rw [hv]

theorem neonFullBlock_fields (s : NeonState) (hi : 2048 ≤ s.input.length)
    (hv : s.vacc0.length = 4) :
    (neonFullBlock s).input = s.input.drop 2048 ∧
    (neonFullBlock s).inputOffset = s.inputOffset + 2048 ∧
    (neonFullBlock s).batch = s.batch - 2048 ∧
    (neonFullBlock s).vacc0.length = 4 ∧
    (neonFullBlock s).output = s.output := by
  let s0 := { s with vacc16 := List.replicate 8 0, currentBatch := 2048 }
  have hc := neonInner_invariant 128 0 s0 (by decide) hi
    (by simp [s0]) (halfBound_zero 8 0)
  have hf := neonInner_fields 128 s0
  dsimp only [neonFullBlock]
  refine ⟨hf.1, hf.2.1, rfl, ?_, hf.2.2.2.2.2⟩
  change (vpadalq_u16 (neonInner 128 s0).vacc0 (neonInner 128 s0).vacc16).length = 4
  simp only [vpadalq_u16, List.length_zipWith, pairwiseWiden_length,
    hc.1, hf.2.2.2.2.1]
  change min s.vacc0.length ((8 + 1) / 2) = 4
  rw [hv]
  decide

theorem neonOuter_summary (n : Nat) (s : NeonState)
    (hi : 2048 * n ≤ s.input.length) (hv : s.vacc0.length = 4) :
    (neonOuter n s).input = s.input.drop (2048 * n) ∧
    (neonOuter n s).inputOffset = s.inputOffset + 2048 * n ∧
    (neonOuter n s).batch = s.batch - 2048 * n ∧
    (neonOuter n s).vacc0.length = 4 ∧
    (neonOuter n s).output = s.output ∧
    wordSum (neonOuter n s).vacc0 =
      wordSum s.vacc0 + byteSum (s.input.take (2048 * n)) := by
  induction n generalizing s with
  | zero => simp [neonOuter, hv, byteSum, vzext_vf4, wordSum]
  | succ n ih =>
    have hblock : 2048 ≤ s.input.length := by omega
    obtain ⟨hi0, ho0, hb0, hv0, hy0⟩ := neonFullBlock_fields s hblock hv
    have hs0 := neonFullBlock_sum s hblock hv
    have hinext : 2048 * n ≤ (neonFullBlock s).input.length := by
      rw [hi0, List.length_drop]
      omega
    obtain ⟨hi1, ho1, hb1, hv1, hy1, hs1⟩ := ih (neonFullBlock s) hinext hv0
    change (neonOuter n (neonFullBlock s)).input = _ ∧ _
    refine ⟨?_, ?_, ?_, hv1, ?_, ?_⟩
    · rw [hi1, hi0, List.drop_drop]
      rw [show 2048 + 2048 * n = 2048 * (n + 1) by omega]
    · change (neonOuter n (neonFullBlock s)).inputOffset = _
      rw [ho1, ho0]
      omega
    · change (neonOuter n (neonFullBlock s)).batch = _
      rw [hb1, hb0]
      omega
    · exact hy1.trans hy0
    · change wordSum (neonOuter n (neonFullBlock s)).vacc0 = _
      rw [hs1, hs0, hi0, BitVec.add_assoc, ← byteSum_take_split]
      rw [show 2048 + 2048 * n = 2048 * (n + 1) by omega]

/-- The two C loops differ in counter bookkeeping, not lane/input recurrence. -/
theorem neon_loop_lane_congr (n : Nat) (s t : NeonState)
    (hi : s.input = t.input) (hv : s.vacc16 = t.vacc16) :
    (neonRemainderLoop n s).vacc16 = (neonInner n t).vacc16 := by
  induction n generalizing s t with
  | zero => exact hv
  | succ n ih =>
    apply ih
    · simp only [neonLoad16, hi]
    · simp only [neonLoad16, hi, hv]

theorem neonRemainderLoop_fields (n : Nat) (s : NeonState) :
    (neonRemainderLoop n s).input = s.input.drop (16 * n) ∧
    (neonRemainderLoop n s).inputOffset = s.inputOffset + 16 * n ∧
    (neonRemainderLoop n s).batch = s.batch - 16 * n ∧
    (neonRemainderLoop n s).vacc0 = s.vacc0 ∧
    (neonRemainderLoop n s).output = s.output := by
  induction n generalizing s with
  | zero => simp [neonRemainderLoop]
  | succ n ih =>
    obtain ⟨hi, ho, hb, hv, hy⟩ := ih { neonLoad16 s with batch := s.batch - 16 }
    simp only [neonRemainderLoop, neonLoad16]
    simp only [neonLoad16] at hi ho hb hv hy
    refine ⟨?_, ?_, ?_, hv, hy⟩
    · rw [hi, List.drop_drop]
      congr 1
      omega
    · rw [ho]
      omega
    · rw [hb]
      omega

theorem byteSum_zero (n : Nat) : byteSum (List.replicate n (0 : Byte)) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change (0 : Byte).zeroExtend 32 + byteSum (List.replicate n 0) = 0
    rw [ih]
    rfl

theorem zip_mul_ones (xs : List Byte) :
    List.zipWith (· * ·) xs (List.replicate xs.length (1 : Byte)) = xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    simp only [List.length_cons, List.replicate_succ, List.zipWith_cons_cons, ih]
    rw [show x * (1 : Byte) = x from BitVec.mul_one x]

theorem zip_mul_zeros (xs : List Byte) :
    List.zipWith (· * ·) xs (List.replicate xs.length (0 : Byte)) =
      List.replicate xs.length (0 : Byte) := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    simp only [List.length_cons, List.replicate_succ, List.zipWith_cons_cons, ih]
    rw [show x * (0 : Byte) = 0 from BitVec.mul_zero]

/-- Every overread byte is multiplied by zero; padding values are arbitrary. -/
theorem maskedTail_split (batch : Nat) (loaded : List Byte)
    (hb : batch ≤ 16) (hl : loaded.length = 16) :
    maskedTail batch loaded = loaded.take batch ++ List.replicate (16 - batch) 0 := by
  have ht : (loaded.take batch).length = batch := by simp [hl, Nat.min_eq_left hb]
  have hd : (loaded.drop batch).length = 16 - batch := by simp [hl]
  have hone : List.zipWith (· * ·) (loaded.take batch) (List.replicate batch (1 : Byte)) =
      loaded.take batch := by simpa only [ht] using zip_mul_ones (loaded.take batch)
  have hzero : List.zipWith (· * ·) (loaded.drop batch) (List.replicate (16 - batch) (0 : Byte)) =
      List.replicate (16 - batch) 0 := by simpa only [hd] using zip_mul_zeros (loaded.drop batch)
  unfold maskedTail
  conv => lhs; arg 2; rw [← List.take_append_drop batch loaded]
  rw [List.zipWith_append (by simp [ht]), hone, hzero]

theorem maskedTail_summary (batch : Nat) (loaded : List Byte)
    (hb : batch ≤ 16) (hl : loaded.length = 16) :
    (maskedTail batch loaded).length = 16 ∧
    byteSum (maskedTail batch loaded) = byteSum (loaded.take batch) := by
  rw [maskedTail_split batch loaded hb hl]
  constructor
  · simp [hl, Nat.min_eq_left hb]
    omega
  · rw [byteSum_append, byteSum_zero, word_add_zero]

theorem neonTail_fields (s : NeonState) :
    (neonTail s).input = s.input ∧ (neonTail s).batch = s.batch ∧
    (neonTail s).vacc0 = s.vacc0 ∧ (neonTail s).output = s.output := by
  by_cases h : s.batch = 0 <;> simp [neonTail, h]

theorem neonTail_sum (s : NeonState) (t : Nat)
    (ht : t ≤ 127) (hb : s.batch ≤ 15)
    (hi : s.batch + 15 ≤ s.input.length)
    (hv : s.vacc16.length = 8) (hbound : HalfBound (510 * t) s.vacc16) :
    (neonTail s).vacc16.length = 8 ∧
    halfSum (neonTail s).vacc16 = halfSum s.vacc16 + byteSum (s.input.take s.batch) := by
  by_cases hz : s.batch = 0
  · simpa [neonTail, hz, byteSum, vzext_vf4, wordSum] using hv
  · have hload : (s.input.take 16).length = 16 := by
      simp only [List.length_take]
      omega
    obtain ⟨hml, hms⟩ := maskedTail_summary s.batch (s.input.take 16) (by omega) hload
    have hshape : (maskedTail s.batch (s.input.take 16)).length = 2 * s.vacc16.length := by
      rw [hml, hv]
    obtain ⟨hl, _, hs⟩ := vpadalq_u8_invariant s.vacc16
      (maskedTail s.batch (s.input.take 16)) (510 * t) hshape hbound (by omega)
    simp only [neonTail, hz, ↓reduceIte]
    constructor
    · exact hl.trans hv
    · rw [hs, hms, List.take_take, Nat.min_eq_left (show s.batch ≤ 16 by omega)]

theorem neonRemainder_summary (s : NeonState)
    (hb : s.batch < 2048) (hi : s.batch + 15 ≤ s.input.length)
    (hv : s.vacc0.length = 4) :
    (neonRemainder s).output = s.output ∧
    wordSum (neonRemainder s).vacc0 = wordSum s.vacc0 + byteSum (s.input.take s.batch) := by
  by_cases hz : s.batch = 0
  · simp [neonRemainder, hz, byteSum, vzext_vf4, wordSum]
  · let q := s.batch / 16
    let s0 := { s with vacc16 := List.replicate 8 0 }
    let s1 := neonRemainderLoop q s0
    let s2 := neonTail s1
    have hq : q ≤ 127 := by dsimp [q]; omega
    have hi0 : 16 * q ≤ s0.input.length := by dsimp [s0, q]; omega
    have hinner := neonInner_invariant q 0 s0 (by omega) hi0
      (by simp [s0]) (halfBound_zero 8 0)
    have hlanes : s1.vacc16 = (neonInner q s0).vacc16 := neon_loop_lane_congr q s0 s0 rfl rfl
    have hf := neonRemainderLoop_fields q s0
    have hi1 : s1.input = s.input.drop (16 * q) := hf.1
    have hb1 : s1.batch = s.batch - 16 * q := hf.2.2.1
    have hv1 : s1.vacc0 = s.vacc0 := hf.2.2.2.1
    have hy1 : s1.output = s.output := hf.2.2.2.2
    have hs1 : halfSum s1.vacc16 = byteSum (s.input.take (16 * q)) := by
      rw [hlanes, hinner.2.2]
      change halfSum (List.replicate 8 0) + _ = _
      rw [halfSum_zero, word_zero_add]
    have hl1 : s1.vacc16.length = 8 := by rw [hlanes]; exact hinner.1
    have hbound1 : HalfBound (510 * q) s1.vacc16 := by
      rw [hlanes]
      simpa only [Nat.zero_add] using hinner.2.1
    have hbatch1 : s1.batch ≤ 15 := by rw [hb1]; dsimp [q]; omega
    have hinput1 : s1.batch + 15 ≤ s1.input.length := by
      rw [hi1, hb1, List.length_drop]
      omega
    have htail := neonTail_sum s1 q hq hbatch1 hinput1 hl1 hbound1
    have htf := neonTail_fields s1
    have hsplit : 16 * q + s1.batch = s.batch := by rw [hb1]; dsimp [q]; omega
    simp only [neonRemainder, hz, ↓reduceIte]
    change s2.output = s.output ∧ wordSum (vpadalq_u16 s2.vacc0 s2.vacc16) = _
    constructor
    · exact htf.2.2.2.trans hy1
    · rw [vpadalq_u16_sum]
      · change wordSum (neonTail s1).vacc0 + halfSum (neonTail s1).vacc16 = _
        rw [htf.2.2.1, hv1, htail.2, hs1, hi1, ← byteSum_take_split, hsplit]
      · change (neonTail s1).vacc16.length = 2 * (neonTail s1).vacc0.length
        rw [htail.1, htf.2.2.1, hv1, hv]

/-- NEON's actual nested loops and masked overread compute the same ghost
    modular sum; no reassociation of floating-point arithmetic is involved. -/
theorem neon_value_eq_byteSum (input overread : List Byte) (oldOutput : Word)
    (hp : 15 ≤ overread.length) :
    neonValueLoopWithOverreadFromIntrinsics input overread oldOutput =
      oldOutput + byteSum input := by
  let q := input.length / 2048
  let s0 : NeonState :=
    ⟨input ++ overread, 0, input.length, 0, List.replicate 8 0,
      List.replicate 4 0, oldOutput⟩
  let s1 := neonOuter q s0
  have hinput : 2048 * q ≤ s0.input.length := by
    simp only [s0, List.length_append]
    dsimp only [q]
    omega
  obtain ⟨hi, _, hb, hv, hy, hs⟩ := neonOuter_summary q s0 hinput (by simp [s0])
  have hbatch : s1.batch < 2048 := by change (neonOuter q s0).batch < _; rw [hb]; dsimp [s0, q]; omega
  have hphysical : s1.batch + 15 ≤ s1.input.length := by
    change (neonOuter q s0).batch + 15 ≤ (neonOuter q s0).input.length
    rw [hb, hi, List.length_drop]
    simp only [s0, List.length_append]
    omega
  have hr := neonRemainder_summary s1 hbatch hphysical hv
  have hsplit : 2048 * q + s1.batch = input.length := by
    change 2048 * q + (neonOuter q s0).batch = _
    rw [hb]
    dsimp [s0, q]
    omega
  change (neonRemainder s1).output + vaddvq_u32 (neonRemainder s1).vacc0 = _
  rw [vaddvq_u32, wordSum_foldl, word_zero_add, hr.1, hr.2]
  change (neonOuter q s0).output +
      (wordSum (neonOuter q s0).vacc0 + byteSum (s1.input.take s1.batch)) = _
  rw [hy, hs]
  change oldOutput + ((wordSum (List.replicate 4 0) +
      byteSum ((input ++ overread).take (2048 * q))) + byteSum (s1.input.take s1.batch)) = _
  rw [wordSum_replicate_zero, word_zero_add]
  have hi' : s1.input = (input ++ overread).drop (2048 * q) := hi
  rw [hi', ← byteSum_take_split, hsplit, List.take_left]

theorem completeValueEquivalence : completeValueEquivalenceClaim := by
  intro input overread oldOutput vlmax chunks _ hpadding hschedule
  rw [neon_value_eq_byteSum input overread oldOutput hpadding,
    rvv_value_eq_byteSum input oldOutput vlmax chunks hschedule]

#print axioms completeValueEquivalence

end SALT.Corpus.qu8rsum
