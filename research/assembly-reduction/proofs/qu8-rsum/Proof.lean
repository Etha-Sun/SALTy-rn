import Spec
import ProofSupport

set_option maxRecDepth 4096
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

namespace Kernel
open Assembly

@[simp] theorem rv0 : (0 : Reg).val = 0 := rfl
@[simp] theorem rv1 : (1 : Reg).val = 1 := rfl
@[simp] theorem rv2 : (2 : Reg).val = 2 := rfl
@[simp] theorem rv3 : (3 : Reg).val = 3 := rfl
@[simp] theorem rv4 : (4 : Reg).val = 4 := rfl
@[simp] theorem rv5 : (5 : Reg).val = 5 := rfl
@[simp] theorem rv6 : (6 : Reg).val = 6 := rfl
@[simp] theorem rv7 : (7 : Reg).val = 7 := rfl
@[simp] theorem rv8 : (8 : Reg).val = 8 := rfl
@[simp] theorem rv9 : (9 : Reg).val = 9 := rfl
@[simp] theorem rv10 : (10 : Reg).val = 10 := rfl
@[simp] theorem rv11 : (11 : Reg).val = 11 := rfl
@[simp] theorem rv12 : (12 : Reg).val = 12 := rfl
@[simp] theorem rv13 : (13 : Reg).val = 13 := rfl
@[simp] theorem rv14 : (14 : Reg).val = 14 := rfl
@[simp] theorem rv15 : (15 : Reg).val = 15 := rfl
@[simp] theorem rv16 : (16 : Reg).val = 16 := rfl
@[simp] theorem rv17 : (17 : Reg).val = 17 := rfl
@[simp] theorem rv18 : (18 : Reg).val = 18 := rfl
@[simp] theorem rv19 : (19 : Reg).val = 19 := rfl
@[simp] theorem rv20 : (20 : Reg).val = 20 := rfl
@[simp] theorem rv21 : (21 : Reg).val = 21 := rfl
@[simp] theorem rv22 : (22 : Reg).val = 22 := rfl
@[simp] theorem rv23 : (23 : Reg).val = 23 := rfl
@[simp] theorem rv24 : (24 : Reg).val = 24 := rfl
@[simp] theorem rv25 : (25 : Reg).val = 25 := rfl
@[simp] theorem rv26 : (26 : Reg).val = 26 := rfl
@[simp] theorem rv27 : (27 : Reg).val = 27 := rfl
@[simp] theorem rv28 : (28 : Reg).val = 28 := rfl
@[simp] theorem rv29 : (29 : Reg).val = 29 := rfl
@[simp] theorem rv30 : (30 : Reg).val = 30 := rfl
@[simp] theorem rv31 : (31 : Reg).val = 31 := rfl

theorem get_set {α : Type} [Inhabited α] (a : Array α) (i j : Nat) (v : α) (hj : j < a.size) :
    (a.set! i v)[j]! = if i = j then v else a[j]! := by
  simp only [Array.set!_eq_setIfInBounds]
  simp [Array.getElem!_eq_getD, Array.getD_eq_getD_getElem?,
    Array.getElem?_setIfInBounds, hj]
  split <;> simp_all

@[simp] theorem writeLE_size (a : Array Byte) (b n v : Nat) :
    (writeLE a b n v).size = a.size := by
  induction n with
  | zero => simp [writeLE]
  | succ n ih => simpa [writeLE, List.range_succ, List.foldl_append] using ih

theorem writeLE_get (a : Array Byte) (b n v j : Nat) (hj : j < a.size) :
    (writeLE a b n v)[j]! =
      if b ≤ j ∧ j < b + n then BitVec.ofNat 8 (v / 256 ^ (j - b)) else a[j]! := by
  induction n with
  | zero => simp [writeLE]; omega
  | succ n ih =>
    simp only [writeLE, List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    change ((writeLE a b n v).set! (b + n) (BitVec.ofNat 8 (v / 256 ^ n)))[j]! = _
    rw [get_set _ _ _ _ (by simpa using hj), ih]
    by_cases he : b + n = j
    · subst j
      simp [show b ≤ b + n by omega, show b + n < b + (n + 1) by omega]
    · simp only [he, ↓reduceIte]
      by_cases h : b ≤ j ∧ j < b + n
      · simp [h, show b ≤ j ∧ j < b + (n + 1) by omega]
      · simp [h, show ¬(b ≤ j ∧ j < b + (n + 1)) by omega]

theorem readLE_congr (a b : Array Byte) (p n : Nat)
    (h : ∀ j, j < n → a[p + j]! = b[p + j]!) : readLE a p n = readLE b p n := by
  induction n generalizing p with
  | zero => rfl
  | succ n ih =>
    simp only [readLE]
    rw [show a[p]! = b[p]! by simpa using h 0 (by omega)]
    rw [ih (p + 1) (by
      intro j hj
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h (j + 1) (by omega))]

theorem readLE_writeLE4 (a : Array Byte) (p v : Nat) (hp : p + 4 ≤ a.size) :
    BitVec.ofNat 32 (readLE (writeLE a p 4 v) p 4) = BitVec.ofNat 32 v := by
  have h0 := writeLE_get a p 4 v p (by omega)
  have h1 := writeLE_get a p 4 v (p + 1) (by omega)
  have h2 := writeLE_get a p 4 v (p + 2) (by omega)
  have h3 := writeLE_get a p 4 v (p + 3) (by omega)
  simp only [readLE, Nat.add_assoc]
  rw [h0, h1, h2, h3]
  simp only [show p ≤ p by omega, show p < p + 4 by omega,
    show p ≤ p + 1 by omega, show p + 1 < p + 4 by omega,
    show p ≤ p + 2 by omega, show p + 2 < p + 4 by omega,
    show p ≤ p + 3 by omega, show p + 3 < p + 4 by omega,
    and_self, ↓reduceIte, Nat.add_sub_cancel_left, Nat.sub_self]
  apply BitVec.eq_of_toNat_eq
  simp only [BitVec.toNat_ofNat]
  simp only [Nat.reducePow, Nat.div_one, Nat.mul_zero, Nat.add_zero]
  omega


def blocks (a : Array Byte) (b w active n : Nat) (f : Nat → Nat) (ta : Nat → Bool) : Array Byte :=
  (List.range n).foldl (fun bytes i =>
    if i < active then writeLE bytes (b + i * w) w (f i)
    else if ta i then writeLE bytes (b + i * w) w (256 ^ w - 1)
    else bytes) a

@[simp] theorem blocks_size (a : Array Byte) (b w active n : Nat)
    (f : Nat → Nat) (ta : Nat → Bool) : (blocks a b w active n f ta).size = a.size := by
  induction n with
  | zero => simp [blocks]
  | succ n ih =>
    simp only [blocks, List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    split
    · simpa only [writeLE_size] using ih
    · split
      · simpa only [writeLE_size] using ih
      · exact ih

theorem blocks_outside (a : Array Byte) (b w active n : Nat)
    (f : Nat → Nat) (ta : Nat → Bool) (q : Nat) (hq : q < a.size)
    (hout : q < b ∨ b + n * w ≤ q) : (blocks a b w active n f ta)[q]! = a[q]! := by
  induction n with
  | zero => simp [blocks]
  | succ n ih =>
    have hn : q < b ∨ b + n * w ≤ q := by simp only [Nat.succ_mul] at hout; omega
    have hh : ¬(b + n * w ≤ q ∧ q < b + n * w + w) := by
      simp only [Nat.succ_mul] at hout
      omega
    have ih := ih hn
    simp only [blocks, List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    change (if n < active then writeLE (blocks a b w active n f ta) (b + n * w) w (f n)
      else if ta n then writeLE (blocks a b w active n f ta) (b + n * w) w (256 ^ w - 1)
      else blocks a b w active n f ta)[q]! = _
    split
    · rw [writeLE_get _ _ _ _ _ (by simpa using hq), if_neg hh, ih]
    · split
      · rw [writeLE_get _ _ _ _ _ (by simpa using hq), if_neg hh, ih]
      · exact ih

theorem blocks_lane (a : Array Byte) (b w active n : Nat)
    (f : Nat → Nat) (ta : Nat → Bool) (k j : Nat)
    (hk : k < n) (hj : j < w) (hb : b + n * w ≤ a.size) :
    (blocks a b w active n f ta)[b + k * w + j]! =
      if k < active then BitVec.ofNat 8 (f k / 256 ^ j)
      else if ta k then BitVec.ofNat 8 ((256 ^ w - 1) / 256 ^ j)
      else a[b + k * w + j]! := by
  have hkn := Nat.mul_le_mul_right w (show k + 1 ≤ n by omega)
  simp only [Nat.succ_mul] at hkn
  have hq : b + k * w + j < a.size := by omega
  induction n with
  | zero => omega
  | succ n ih =>
    have hb' : b + n * w ≤ a.size := by simp only [Nat.succ_mul] at hb; omega
    simp only [blocks, List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    change (if n < active then writeLE (blocks a b w active n f ta) (b + n * w) w (f n)
      else if ta n then writeLE (blocks a b w active n f ta) (b + n * w) w (256 ^ w - 1)
      else blocks a b w active n f ta)[b + k * w + j]! = _
    by_cases hkn' : k = n
    · subst k
      have hwithin : b + n * w ≤ b + n * w + j ∧ b + n * w + j < b + n * w + w := by omega
      have hprev := blocks_outside a b w active n f ta (b + n * w + j) hq (Or.inr (by omega))
      by_cases ha : n < active
      · simp only [ha, ↓reduceIte]
        rw [writeLE_get _ _ _ _ _ (by simpa using hq), if_pos hwithin]
        simp
      · simp only [ha, ↓reduceIte]
        split
        · rw [writeLE_get _ _ _ _ _ (by simpa using hq), if_pos hwithin]
          simp
        · exact hprev
    · have hkn' : k < n := by omega
      have hmul := Nat.mul_le_mul_right w (show k + 1 ≤ n by omega)
      simp only [Nat.succ_mul] at hmul
      have hout : ¬(b + n * w ≤ b + k * w + j ∧ b + k * w + j < b + n * w + w) := by omega
      have hp := ih hkn' hb' hmul
      split
      · rw [writeLE_get _ _ _ _ _ (by simpa using hq), if_neg hout]
        exact hp
      · split
        · rw [writeLE_get _ _ _ _ _ (by simpa using hq), if_neg hout]
          exact hp
        · exact hp


@[simp] theorem writeVector_bytes (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) :
    (writeVector c s vd w a n f).v = blocks s.v (vd.val * regBytes c) w a n f
      (fun i => s.tail == .agnostic && c.tailOnes s.ticks i) := rfl

@[simp] theorem writeVector_size (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) : (writeVector c s vd w a n f).v.size = s.v.size := by simp

@[simp] theorem writeVector_x (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) : (writeVector c s vd w a n f).x = s.x := rfl
@[simp] theorem writeVector_mem (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) : (writeVector c s vd w a n f).mem = s.mem := rfl
@[simp] theorem writeVector_pc (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) : (writeVector c s vd w a n f).pc = s.pc := rfl
@[simp] theorem writeVector_vl (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) : (writeVector c s vd w a n f).vl = s.vl := rfl
@[simp] theorem writeVector_sew (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) : (writeVector c s vd w a n f).sew = s.sew := rfl
@[simp] theorem writeVector_lmul (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) : (writeVector c s vd w a n f).lmul = s.lmul := rfl
@[simp] theorem writeVector_tail (c : Config) (s : State) (vd : Reg) (w a n : Nat)
    (f : Nat → Nat) : (writeVector c s vd w a n f).tail = s.tail := rfl

 theorem writeVector_active32 (c : Config) (s : State) (vd : Reg) (a n : Nat)
    (f : Nat → Nat) (k : Nat) (hk : k < a) (ha : a ≤ n)
    (hb : vd.val * regBytes c + n * 4 ≤ s.v.size) :
    readLane32 c (writeVector c s vd 4 a n f) vd k = BitVec.ofNat 32 (f k) := by
  let p := vectorAddress c vd 4 k
  have hmul : (k + 1) * 4 ≤ n * 4 := by omega
  have hp : p + 4 ≤ s.v.size := by dsimp [p, vectorAddress]; omega
  rw [readLane32]
  have hh : readLE (writeVector c s vd 4 a n f).v p 4 = readLE (writeLE s.v p 4 (f k)) p 4 := by
    apply readLE_congr
    intro j hj
    rw [writeVector_bytes]
    have h := blocks_lane s.v (vd.val * regBytes c) 4 a n f
      (fun i => s.tail == .agnostic && c.tailOnes s.ticks i) k j (by omega) hj hb
    change (blocks _ _ _ _ _ _ _)[vd.val * regBytes c + k * 4 + j]! = _
    rw [h, if_pos hk, writeLE_get _ _ _ _ _ (by omega)]
    simp [show p ≤ p + j ∧ p + j < p + 4 by omega]
  change BitVec.ofNat 32 (readLE _ p 4) = _
  rw [hh, readLE_writeLE4 _ _ _ hp]

 theorem writeVector_tail32 (c : Config) (s : State) (vd : Reg) (a n : Nat)
    (f : Nat → Nat) (k : Nat) (hk : k < n) (ha : a ≤ k)
    (ht : s.tail = .undisturbed) (hb : vd.val * regBytes c + n * 4 ≤ s.v.size) :
    readLane32 c (writeVector c s vd 4 a n f) vd k = readLane32 c s vd k := by
  unfold readLane32
  congr 1
  apply readLE_congr
  intro j hj
  rw [writeVector_bytes]
  have h := blocks_lane s.v (vd.val * regBytes c) 4 a n f
    (fun i => s.tail == .agnostic && c.tailOnes s.ticks i) k j hk hj hb
  simpa [vectorAddress, show ¬ k < a by omega, ht] using h

 theorem writeVector_active8 (c : Config) (s : State) (vd : Reg) (a n : Nat)
    (f : Nat → Nat) (k : Nat) (hk : k < a) (ha : a ≤ n)
    (hb : vd.val * regBytes c + n ≤ s.v.size) :
    (writeVector c s vd 1 a n f).v[vectorAddress c vd 1 k]! = BitVec.ofNat 8 (f k) := by
  rw [writeVector_bytes]
  have h := blocks_lane s.v (vd.val * regBytes c) 1 a n f
    (fun i => s.tail == .agnostic && c.tailOnes s.ticks i) k 0 (by omega) (by omega) (by simpa using hb)
  simpa [vectorAddress, hk] using h

 theorem writeVector_outside32 (c : Config) (s : State) (vd vr : Reg) (w a n : Nat)
    (f : Nat → Nat) (k : Nat)
    (hb : vectorAddress c vr 4 k + 4 ≤ s.v.size)
    (hout : vectorAddress c vr 4 k + 4 ≤ vd.val * regBytes c ∨
      vd.val * regBytes c + n * w ≤ vectorAddress c vr 4 k) :
    readLane32 c (writeVector c s vd w a n f) vr k = readLane32 c s vr k := by
  unfold readLane32
  congr 1
  apply readLE_congr
  intro j hj
  rw [writeVector_bytes]
  apply blocks_outside
  · omega
  · omega

 theorem geometry (c : Config) (hc : c.Valid) :
    16 ≤ regBytes c ∧ regBytes c ≤ 8192 ∧
    capacity c 32 8 = 2 * regBytes c ∧
    0 < capacity c 32 1 ∧ capacity c 32 1 * 4 = regBytes c := by
  obtain ⟨⟨k, hlo, hhi, he⟩, _⟩ := hc
  have hk : k = 7 ∨ k = 8 ∨ k = 9 ∨ k = 10 ∨ k = 11 ∨ k = 12 ∨ k = 13 ∨ k = 14 ∨ k = 15 ∨ k = 16 := by omega
  rcases hk with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp [regBytes, capacity, he]

 theorem choice_bounds (c : Config) (hc : c.Valid) (n : Nat) (hn : 0 < n) :
    0 < c.chooseVL n (capacity c 32 8) ∧
    c.chooseVL n (capacity c 32 8) ≤ n ∧
    c.chooseVL n (capacity c 32 8) ≤ capacity c 32 8 := by
  have hg := geometry c hc
  have h := hc.2 n (capacity c 32 8) (by omega)
  unfold legalVL at h
  split at h
  · omega
  · split at h <;> omega


def sumW (f : Nat → Word) : Nat → Word
  | 0 => 0
  | n + 1 => sumW f n + f n

@[simp] theorem sumW_zero (f : Nat → Word) : sumW f 0 = 0 := rfl
@[simp] theorem sumW_succ (f : Nat → Word) (n : Nat) : sumW f (n + 1) = sumW f n + f n := rfl

theorem sumW_congr (f g : Nat → Word) (n : Nat) (h : ∀ i, i < n → f i = g i) :
    sumW f n = sumW g n := by
  induction n with
  | zero => rfl
  | succ n ih => rw [sumW_succ, sumW_succ, ih (by intro i hi; exact h i (by omega)), h n (by omega)]

theorem sumW_fold (f : Nat → Word) (n : Nat) (seed : Word) :
    (List.range n).foldl (fun a i => a + f i) seed = seed + sumW f n := by
  induction n with
  | zero => simp [sumW]
  | succ n ih => simp [List.range_succ, List.foldl_append, ih, sumW, BitVec.add_assoc]

theorem wadd_left_comm (a b c : Word) : a + (b + c) = b + (a + c) := by
  rw [← BitVec.add_assoc, BitVec.add_comm a b, BitVec.add_assoc]

theorem sumW_add (f g : Nat → Word) (n : Nat) :
    sumW (fun i => f i + g i) n = sumW f n + sumW g n := by
  induction n with
  | zero => simp [sumW]
  | succ n ih => simp [sumW, ih, BitVec.add_assoc, BitVec.add_comm, wadd_left_comm]

theorem sumW_split (f : Nat → Word) (n m : Nat) :
    sumW f (n + m) = sumW f n + sumW (fun i => f (n + i)) m := by
  induction m with
  | zero => simp [sumW]
  | succ m ih => simp [sumW, ih, Nat.add_assoc, BitVec.add_assoc]

theorem sumW_prefix (f : Nat → Word) (n k : Nat) (hk : k ≤ n) :
    sumW (fun i => if i < k then f i else 0) n = sumW f k := by
  induction n with
  | zero =>
    have : k = 0 := by omega
    subst k
    rfl
  | succ n ih =>
    by_cases he : k = n + 1
    · subst k
      apply sumW_congr
      intro i hi
      simp [hi]
    · rw [sumW_succ, ih (by omega)]
      simp [show ¬ n < k by omega]

@[simp] theorem sumW_all_zero (n : Nat) : sumW (fun _ => 0) n = 0 := by
  induction n <;> simp_all [sumW]

@[simp] theorem writeX_size (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).x.size = s.x.size := by simp [State.writeX]; split <;> simp

@[simp] theorem readX_writeX (s : State) (rd r : Reg) (v : XWord) (hs : s.x.size = 32) :
    (s.writeX rd v).readX r =
      if r.val = 0 then 0 else if rd.val = r.val then v else s.readX r := by
  have hr : r.val < s.x.size := by rw [hs]; exact r.isLt
  by_cases hd : rd.val = 0
  · by_cases hz : r.val = 0
    · simp [State.writeX, State.readX, hd, hz]
    · simp [State.writeX, State.readX, hd, hz, Ne.symm hz]
  · simp only [State.writeX, hd, ↓reduceIte, State.readX]
    by_cases hz : r.val = 0
    · simp [hz]
    · simp only [hz, ↓reduceIte]
      rw [get_set _ _ _ _ hr]

@[simp] theorem next_read (s : State) (r : Reg) : s.next.readX r = s.readX r := rfl
@[simp] theorem wv_read (c : Config) (s : State) (vd r : Reg) (w a n : Nat) (f : Nat → Nat) :
    (writeVector c s vd w a n f).readX r = s.readX r := rfl
@[simp] theorem writeX_lane (c : Config) (s : State) (r vr : Reg) (v : XWord) (k : Nat) :
    readLane32 c (s.writeX r v) vr k = readLane32 c s vr k := by simp [State.writeX]; split <;> rfl
@[simp] theorem next_lane (c : Config) (s : State) (vr : Reg) (k : Nat) :
    readLane32 c s.next vr k = readLane32 c s vr k := rfl

/-- Registers not allocated to this leaf function retain their initial values. -/
def Keep (s t : State) : Prop := ∀ r : Reg,
  r.val ≠ 10 → r.val ≠ 11 → r.val ≠ 13 → r.val ≠ 14 → r.val ≠ 15 → t.readX r = s.readX r

theorem Keep.refl (s : State) : Keep s s := by intro r _ _ _ _ _; rfl

theorem Keep.trans {s t u : State} (h : Keep s t) (h' : Keep t u) : Keep s u := by
  intro r h1 h2 h3 h4 h5
  rw [h' r h1 h2 h3 h4 h5, h r h1 h2 h3 h4 h5]

theorem Keep.write (s : State) (rd : Reg) (v : XWord) (hs : s.x.size = 32)
    (hr : rd.val = 10 ∨ rd.val = 11 ∨ rd.val = 13 ∨ rd.val = 14 ∨ rd.val = 15) :
    Keep s (s.writeX rd v) := by
  intro r h1 h2 h3 h4 h5
  rw [readX_writeX s rd r v hs]
  have hn : rd.val ≠ r.val := by omega
  simp only [hn, ↓reduceIte]
  split
  · simp_all [State.readX]
  · rfl

/-- Finite paths without return, used to compose instruction/block proofs. -/
inductive Reach (c : Config) : State → State → Prop where
  | refl : Reach c s s
  | next : step c program s = .ok (.next u) → Reach c u t → Reach c s t

theorem Reach.trans {c : Config} {s u t : State} (h : Reach c s u) (h' : Reach c u t) : Reach c s t := by
  induction h with
  | refl => exact h'
  | next hs _ ih => exact .next hs (ih h')

theorem Reach.exec {c : Config} {s u t : State} (h : Reach c s u) (h' : Exec c program u t) : Exec c program s t := by
  induction h with
  | refl => exact h'
  | next hs _ ih => exact .next hs (ih h')

@[simp] theorem writeX_v (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).v = s.v := by unfold State.writeX; split <;> rfl

@[simp] theorem writeX_mem (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).mem = s.mem := by unfold State.writeX; split <;> rfl

@[simp] theorem writeX_pc (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).pc = s.pc := by unfold State.writeX; split <;> rfl

@[simp] theorem writeX_ticks (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).ticks = s.ticks := by unfold State.writeX; split <;> rfl

@[simp] theorem writeX_vl (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).vl = s.vl := by unfold State.writeX; split <;> rfl

@[simp] theorem writeX_sew (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).sew = s.sew := by unfold State.writeX; split <;> rfl

@[simp] theorem writeX_lmul (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).lmul = s.lmul := by unfold State.writeX; split <;> rfl

@[simp] theorem writeX_tail (s : State) (r : Reg) (v : XWord) :
    (s.writeX r v).tail = s.tail := by unfold State.writeX; split <;> rfl


def configure (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) : State :=
  (({ s with vl := vl, sew := 32, lmul := lm, tail := tail }).writeX rd (BitVec.ofNat 64 vl)).next

def loadBytes (c : Config) (s : State) : State :=
  (writeVector c s 2 1 s.vl (capacity c 32 s.lmul)
    (fun j => s.mem[(s.readX 11).toNat + j]!.toNat)).next

def widenBytes (c : Config) (s : State) : State :=
  (writeVector c s 16 4 s.vl (capacity c 32 s.lmul)
    (fun j => s.v[vectorAddress c 2 1 j]!.toNat)).next

def addLanes (c : Config) (s : State) : State :=
  (writeVector c s 8 4 s.vl (capacity c 32 s.lmul)
    (fun j => (readLane32 c s 8 j + readLane32 c s 16 j).toNat)).next

def decrement (s : State) : State := (s.writeX 10 (s.readX 10 - s.readX 15)).next
def advancePtr (s : State) : State := (s.writeX 11 (s.readX 11 + s.readX 15)).next

def body0 (c : Config) (s : State) : State :=
  configure c s 15 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) 8 .undisturbed
def body1 (c : Config) (s : State) : State := loadBytes c (body0 c s)
def body2 (c : Config) (s : State) : State := decrement (body1 c s)
def body3 (c : Config) (s : State) : State := advancePtr (body2 c s)
def body4 (c : Config) (s : State) : State := widenBytes c (body3 c s)
def body5 (c : Config) (s : State) : State := addLanes c (body4 c s)
def body (c : Config) (s : State) : State :=
  let t := body5 c s
  { t.next with pc := if t.readX 10 != 0 then 3 else 10 }

theorem configure_keep (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail)
    (hs : s.x.size = 32)
    (hr : rd.val = 10 ∨ rd.val = 11 ∨ rd.val = 13 ∨ rd.val = 14 ∨ rd.val = 15) :
    Keep s (configure c s rd vl lm tail) := by
  exact Keep.write { s with vl := vl, sew := 32, lmul := lm, tail := tail } rd
    (BitVec.ofNat 64 vl) hs hr

theorem body0_step (c : Config) (s : State) (hc : c.Valid) (hpc : s.pc = 3)
    (hn : 0 < (s.readX 10).toNat) : step c program s = .ok (.next (body0 c s)) := by
  have hv := choice_bounds c hc (s.readX 10).toNat hn
  simp [Except.pure, Fin.val_ofNat, step, program, hpc, execInstr, body0, configure, show ¬(c.chooseVL (s.readX 10).toNat
    (capacity c 32 8) > capacity c 32 8) by omega] <;> rfl

theorem load_step (c : Config) (s : State) (hpc : s.pc = 4) (hsew : s.sew = 32)
    (hlm : s.lmul = 8) (hv : 0 < s.vl) (hcap : s.vl ≤ capacity c 32 8)
    (hmem : (s.readX 11).toNat + s.vl ≤ s.mem.size) :
    step c program s = .ok (.next (loadBytes c s)) := by
  simp [Except.pure, Fin.val_ofNat, step, program, hpc, execInstr, requireVector32, hsew, hlm, groupOK,
    show ¬s.vl > capacity c 32 8 by omega, show ¬s.vl = 0 by omega,
    show ¬(s.readX 11).toNat + s.vl > s.mem.size by omega, loadBytes] <;> rfl

theorem decrement_step (c : Config) (s : State) (hpc : s.pc = 5) :
    step c program s = .ok (.next (decrement s)) := by
  simp [Except.pure, Fin.val_ofNat, step, program, hpc, execInstr, decrement] <;> rfl
theorem advancePtr_step (c : Config) (s : State) (hpc : s.pc = 6) :
    step c program s = .ok (.next (advancePtr s)) := by
  simp [Except.pure, Fin.val_ofNat, step, program, hpc, execInstr, advancePtr] <;> rfl

theorem widen_step (c : Config) (s : State) (hpc : s.pc = 7) (hsew : s.sew = 32)
    (hlm : s.lmul = 8) (hv : 0 < s.vl) (hcap : s.vl ≤ capacity c 32 8) :
    step c program s = .ok (.next (widenBytes c s)) := by
  simp [Except.pure, Fin.val_ofNat, step, program, hpc, execInstr, requireVector32, hsew, hlm, groupOK,
    show ¬s.vl > capacity c 32 8 by omega, show ¬s.vl = 0 by omega, widenBytes] <;> rfl

theorem add_step (c : Config) (s : State) (hpc : s.pc = 8) (hsew : s.sew = 32)
    (hlm : s.lmul = 8) (hv : 0 < s.vl) (hcap : s.vl ≤ capacity c 32 8) :
    step c program s = .ok (.next (addLanes c s)) := by
  simp [Except.pure, Fin.val_ofNat, step, program, hpc, execInstr, requireVector32, hsew, hlm, groupOK,
    show ¬s.vl > capacity c 32 8 by omega, show ¬s.vl = 0 by omega, addLanes] <;> rfl

theorem body_branch_step (c : Config) (s : State) (hpc : (body5 c s).pc = 9) :
    step c program (body5 c s) = .ok (.next (body c s)) := by
  simp [Except.pure, Fin.val_ofNat, step, program, hpc, execInstr, condHolds, body, State.readX] <;> rfl

@[simp] theorem configure_read (c : Config) (s : State) (rd r : Reg) (vl lm : Nat) (tail : Tail)
    (hs : s.x.size = 32) : (configure c s rd vl lm tail).readX r =
    if r.val = 0 then 0 else if rd.val = r.val then BitVec.ofNat 64 vl else s.readX r := by
  exact readX_writeX { s with vl := vl, sew := 32, lmul := lm, tail := tail }
    rd r (BitVec.ofNat 64 vl) hs

@[simp] theorem configure_pc (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) :
    (configure c s rd vl lm tail).pc = s.pc + 1 := by simp [configure, State.next]

@[simp] theorem configure_x_size (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) :
    (configure c s rd vl lm tail).x.size = s.x.size := by simp [configure, State.next]

@[simp] theorem configure_mem (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) :
    (configure c s rd vl lm tail).mem = s.mem := by simp [configure, State.next]

@[simp] theorem configure_v (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) :
    (configure c s rd vl lm tail).v = s.v := by simp [configure, State.next]

@[simp] theorem configure_vl (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) :
    (configure c s rd vl lm tail).vl = vl := by simp [configure, State.next]

@[simp] theorem configure_sew (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) :
    (configure c s rd vl lm tail).sew = 32 := by simp [configure, State.next]

@[simp] theorem configure_lmul (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) :
    (configure c s rd vl lm tail).lmul = lm := by simp [configure, State.next]

@[simp] theorem configure_tail (c : Config) (s : State) (rd : Reg) (vl lm : Nat) (tail : Tail) :
    (configure c s rd vl lm tail).tail = tail := by simp [configure, State.next]

@[simp] theorem body0_pc (c : Config) (s : State) :
    (body0 c s).pc = s.pc + 1 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body0_x_size (c : Config) (s : State) :
    (body0 c s).x.size = s.x.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body0_mem (c : Config) (s : State) :
    (body0 c s).mem = s.mem := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body0_v_size (c : Config) (s : State) :
    (body0 c s).v.size = s.v.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body0_vl (c : Config) (s : State) :
    (body0 c s).vl = c.chooseVL (s.readX 10).toNat (capacity c 32 8) := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body0_sew (c : Config) (s : State) :
    (body0 c s).sew = 32 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body0_lmul (c : Config) (s : State) :
    (body0 c s).lmul = 8 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body0_tail (c : Config) (s : State) :
    (body0 c s).tail = .undisturbed := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body1_pc (c : Config) (s : State) :
    (body1 c s).pc = s.pc + 2 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body1_x_size (c : Config) (s : State) :
    (body1 c s).x.size = s.x.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body1_mem (c : Config) (s : State) :
    (body1 c s).mem = s.mem := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body1_v_size (c : Config) (s : State) :
    (body1 c s).v.size = s.v.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body1_vl (c : Config) (s : State) :
    (body1 c s).vl = c.chooseVL (s.readX 10).toNat (capacity c 32 8) := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body1_sew (c : Config) (s : State) :
    (body1 c s).sew = 32 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body1_lmul (c : Config) (s : State) :
    (body1 c s).lmul = 8 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body1_tail (c : Config) (s : State) :
    (body1 c s).tail = .undisturbed := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body2_pc (c : Config) (s : State) :
    (body2 c s).pc = s.pc + 3 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body2_x_size (c : Config) (s : State) :
    (body2 c s).x.size = s.x.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body2_mem (c : Config) (s : State) :
    (body2 c s).mem = s.mem := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body2_v_size (c : Config) (s : State) :
    (body2 c s).v.size = s.v.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body2_vl (c : Config) (s : State) :
    (body2 c s).vl = c.chooseVL (s.readX 10).toNat (capacity c 32 8) := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body2_sew (c : Config) (s : State) :
    (body2 c s).sew = 32 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body2_lmul (c : Config) (s : State) :
    (body2 c s).lmul = 8 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body2_tail (c : Config) (s : State) :
    (body2 c s).tail = .undisturbed := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body3_pc (c : Config) (s : State) :
    (body3 c s).pc = s.pc + 4 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body3_x_size (c : Config) (s : State) :
    (body3 c s).x.size = s.x.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body3_mem (c : Config) (s : State) :
    (body3 c s).mem = s.mem := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body3_v_size (c : Config) (s : State) :
    (body3 c s).v.size = s.v.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body3_vl (c : Config) (s : State) :
    (body3 c s).vl = c.chooseVL (s.readX 10).toNat (capacity c 32 8) := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body3_sew (c : Config) (s : State) :
    (body3 c s).sew = 32 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body3_lmul (c : Config) (s : State) :
    (body3 c s).lmul = 8 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body3_tail (c : Config) (s : State) :
    (body3 c s).tail = .undisturbed := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body4_pc (c : Config) (s : State) :
    (body4 c s).pc = s.pc + 5 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body4_x_size (c : Config) (s : State) :
    (body4 c s).x.size = s.x.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body4_mem (c : Config) (s : State) :
    (body4 c s).mem = s.mem := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body4_v_size (c : Config) (s : State) :
    (body4 c s).v.size = s.v.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body4_vl (c : Config) (s : State) :
    (body4 c s).vl = c.chooseVL (s.readX 10).toNat (capacity c 32 8) := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body4_sew (c : Config) (s : State) :
    (body4 c s).sew = 32 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body4_lmul (c : Config) (s : State) :
    (body4 c s).lmul = 8 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body4_tail (c : Config) (s : State) :
    (body4 c s).tail = .undisturbed := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body5_pc (c : Config) (s : State) :
    (body5 c s).pc = s.pc + 6 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body5_x_size (c : Config) (s : State) :
    (body5 c s).x.size = s.x.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body5_mem (c : Config) (s : State) :
    (body5 c s).mem = s.mem := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body5_v_size (c : Config) (s : State) :
    (body5 c s).v.size = s.v.size := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body5_vl (c : Config) (s : State) :
    (body5 c s).vl = c.chooseVL (s.readX 10).toNat (capacity c 32 8) := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body5_sew (c : Config) (s : State) :
    (body5 c s).sew = 32 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body5_lmul (c : Config) (s : State) :
    (body5 c s).lmul = 8 := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body5_tail (c : Config) (s : State) :
    (body5 c s).tail = .undisturbed := by simp [body0, body1, body2, body3, body4, body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, State.next, Nat.add_assoc]

@[simp] theorem body0_r10 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body0 c s).readX 10 = s.readX 10 := by simp [body0, hs]
@[simp] theorem body0_r11 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body0 c s).readX 11 = s.readX 11 := by simp [body0, hs]
@[simp] theorem body0_r15 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body0 c s).readX 15 = BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by simp [body0, hs]

@[simp] theorem body1_r10 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body1 c s).readX 10 = s.readX 10 := by
  simp [body1, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body1_r11 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body1 c s).readX 11 = s.readX 11 := by
  simp [body1, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body1_r15 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body1 c s).readX 15 = BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body1, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body2_r10 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body2 c s).readX 10 = s.readX 10 - BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body2, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body2_r11 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body2 c s).readX 11 = s.readX 11 := by
  simp [body2, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body2_r15 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body2 c s).readX 15 = BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body2, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body3_r10 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body3 c s).readX 10 = s.readX 10 - BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body3, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body3_r11 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body3 c s).readX 11 = s.readX 11 + BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body3, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body3_r15 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body3 c s).readX 15 = BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body3, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body4_r10 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body4 c s).readX 10 = s.readX 10 - BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body4, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body4_r11 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body4 c s).readX 11 = s.readX 11 + BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body4, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body4_r15 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body4 c s).readX 15 = BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body4, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body5_r10 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body5 c s).readX 10 = s.readX 10 - BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body5_r11 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body5 c s).readX 11 = s.readX 11 + BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

@[simp] theorem body5_r15 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body5 c s).readX 15 = BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  simp [body5, loadBytes, widenBytes, addLanes, decrement, advancePtr, hs]

theorem body_path (c : Config) (s : State) (hc : c.Valid) (hpc : s.pc = 3)
    (hs : s.x.size = 32) (hn : 0 < (s.readX 10).toNat)
    (hm : (s.readX 11).toNat + (s.readX 10).toNat ≤ s.mem.size) : Reach c s (body c s) := by
  have hv := choice_bounds c hc (s.readX 10).toNat hn
  apply Reach.next (body0_step c s hc hpc hn)
  apply Reach.next (load_step c (body0 c s) (by simp [hpc]) (by simp) (by simp)
    (by simpa using hv.1) (by simpa using hv.2.2) (by simp [hs]; omega))
  apply Reach.next (decrement_step c (body1 c s) (by simp [hpc]))
  apply Reach.next (advancePtr_step c (body2 c s) (by simp [hpc]))
  apply Reach.next (widen_step c (body3 c s) (by simp [hpc]) (by simp) (by simp)
    (by simpa using hv.1) (by simpa using hv.2.2))
  apply Reach.next (add_step c (body4 c s) (by simp [hpc]) (by simp) (by simp)
    (by simpa using hv.1) (by simpa using hv.2.2))
  exact Reach.next (body_branch_step c s (by simp [hpc])) .refl


@[simp] theorem body0_lane (c : Config) (s : State) (r : Reg) (k : Nat) :
    readLane32 c (body0 c s) r k = readLane32 c s r k := rfl

 theorem body1_byte (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hv : s.v.size = 32 * regBytes c) (hn : 0 < (s.readX 10).toNat) (k : Nat)
    (hk : k < c.chooseVL (s.readX 10).toNat (capacity c 32 8)) :
    (body1 c s).v[vectorAddress c 2 1 k]! = s.mem[(s.readX 11).toNat + k]! := by
  have hg := geometry c hc
  have hq := choice_bounds c hc (s.readX 10).toNat hn
  have h := writeVector_active8 c (body0 c s) 2 (body0 c s).vl (capacity c 32 (body0 c s).lmul)
    (fun j => (body0 c s).mem[((body0 c s).readX 11).toNat + j]!.toNat) k
    (by simpa using hk) (by simpa using hq.2.2) (by simp only [rv2, body0_lmul, body0_v_size]; omega)
  simpa [body1, loadBytes, State.next, hs] using h

 theorem body3_byte (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hv : s.v.size = 32 * regBytes c) (hn : 0 < (s.readX 10).toNat) (k : Nat)
    (hk : k < c.chooseVL (s.readX 10).toNat (capacity c 32 8)) :
    (body3 c s).v[vectorAddress c 2 1 k]! = s.mem[(s.readX 11).toNat + k]! := by
  simpa [body3, body2, advancePtr, decrement, State.next] using body1_byte c s hc hs hv hn k hk

 theorem body1_acc (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) (k : Nat) (hk : k < capacity c 32 8) :
    readLane32 c (body1 c s) 8 k = readLane32 c s 8 k := by
  have hg := geometry c hc
  have h := writeVector_outside32 c (body0 c s) 2 8 1 (body0 c s).vl
    (capacity c 32 (body0 c s).lmul)
    (fun j => (body0 c s).mem[((body0 c s).readX 11).toNat + j]!.toNat) k
    (by simp only [vectorAddress, rv8, body0_v_size]; omega)
    (Or.inr (by simp only [vectorAddress, rv8, rv2, body0_lmul, Nat.mul_one]; omega))
  simpa [body1, loadBytes] using h

 theorem body3_acc (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) (k : Nat) (hk : k < capacity c 32 8) :
    readLane32 c (body3 c s) 8 k = readLane32 c s 8 k := by
  simpa [body3, body2, advancePtr, decrement] using body1_acc c s hc hv k hk

 theorem body4_widen (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hv : s.v.size = 32 * regBytes c) (hn : 0 < (s.readX 10).toNat) (k : Nat)
    (hk : k < c.chooseVL (s.readX 10).toNat (capacity c 32 8)) :
    readLane32 c (body4 c s) 16 k = (s.mem[(s.readX 11).toNat + k]!).zeroExtend 32 := by
  have hg := geometry c hc
  have hq := choice_bounds c hc (s.readX 10).toNat hn
  have h := writeVector_active32 c (body3 c s) 16 (body3 c s).vl (capacity c 32 (body3 c s).lmul)
    (fun j => (body3 c s).v[vectorAddress c 2 1 j]!.toNat) k
    (by simpa using hk) (by simpa using hq.2.2)
    (by simp only [rv16, body3_lmul, body3_v_size]; omega)
  change readLane32 c (writeVector c (body3 c s) 16 4 (body3 c s).vl
    (capacity c 32 (body3 c s).lmul) _) 16 k = _
  rw [h]
  simpa only [BitVec.ofNat_toNat, BitVec.zeroExtend_eq_setWidth] using
    congrArg (fun (b : Byte) => BitVec.ofNat 32 b.toNat) (body3_byte c s hc hs hv hn k hk)

 theorem body4_acc (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) (k : Nat) (hk : k < capacity c 32 8) :
    readLane32 c (body4 c s) 8 k = readLane32 c s 8 k := by
  have hg := geometry c hc
  have h := writeVector_outside32 c (body3 c s) 16 8 4 (body3 c s).vl
    (capacity c 32 (body3 c s).lmul) (fun j => (body3 c s).v[vectorAddress c 2 1 j]!.toNat) k
    (by simp only [vectorAddress, rv8, body3_v_size]; omega)
    (Or.inl (by simp only [vectorAddress, rv8, rv16]; omega))
  simpa [body4, widenBytes, body3_acc c s hc hv k hk] using h

 theorem body5_acc (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hv : s.v.size = 32 * regBytes c) (hn : 0 < (s.readX 10).toNat) (k : Nat)
    (hk : k < capacity c 32 8) :
    readLane32 c (body5 c s) 8 k = readLane32 c s 8 k +
      if k < c.chooseVL (s.readX 10).toNat (capacity c 32 8)
      then (s.mem[(s.readX 11).toNat + k]!).zeroExtend 32 else 0 := by
  have hg := geometry c hc
  have hq := choice_bounds c hc (s.readX 10).toNat hn
  by_cases ha : k < c.chooseVL (s.readX 10).toNat (capacity c 32 8)
  · have h := writeVector_active32 c (body4 c s) 8 (body4 c s).vl
      (capacity c 32 (body4 c s).lmul)
      (fun j => (readLane32 c (body4 c s) 8 j + readLane32 c (body4 c s) 16 j).toNat) k
      (by simpa using ha) (by simpa using hq.2.2)
      (by simp only [rv8, body4_lmul, body4_v_size]; omega)
    simp only [BitVec.ofNat_toNat, BitVec.setWidth_eq] at h
    simpa [body5, addLanes, ha, body4_acc c s hc hv k hk, body4_widen c s hc hs hv hn k ha] using h
  · have h := writeVector_tail32 c (body4 c s) 8 (body4 c s).vl
      (capacity c 32 (body4 c s).lmul)
      (fun j => (readLane32 c (body4 c s) 8 j + readLane32 c (body4 c s) 16 j).toNat) k
      (by simpa using hk) (by simp; omega) (by simp)
      (by simp only [rv8, body4_lmul, body4_v_size]; omega)
    simpa [body5, addLanes, ha, body4_acc c s hc hv k hk] using h

def accSum (c : Config) (s : State) : Word := sumW (readLane32 c s 8) (capacity c 32 8)
def inputSum (s : State) (base n : Nat) : Word := sumW (fun j => (s.mem[base + j]!).zeroExtend 32) n

 theorem body_sum (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hv : s.v.size = 32 * regBytes c) (hn : 0 < (s.readX 10).toNat) :
    accSum c (body c s) = accSum c s +
      inputSum s (s.readX 11).toNat (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := by
  have hq := choice_bounds c hc (s.readX 10).toNat hn
  unfold accSum inputSum
  have h := sumW_congr _ _ (capacity c 32 8) (body5_acc c s hc hs hv hn)
  change sumW (readLane32 c (body5 c s) 8) _ = _
  rw [h, sumW_add, sumW_prefix _ _ _ hq.2.2]


@[simp] theorem body_mem (c : Config) (s : State) : (body c s).mem = s.mem := body5_mem c s
@[simp] theorem body_x_size (c : Config) (s : State) : (body c s).x.size = s.x.size := body5_x_size c s
@[simp] theorem body_v_size (c : Config) (s : State) : (body c s).v.size = s.v.size := body5_v_size c s
@[simp] theorem body_read10 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body c s).readX 10 = s.readX 10 - BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := body5_r10 c s hs
@[simp] theorem body_read11 (c : Config) (s : State) (hs : s.x.size = 32) :
    (body c s).readX 11 = s.readX 11 + BitVec.ofNat 64 (c.chooseVL (s.readX 10).toNat (capacity c 32 8)) := body5_r11 c s hs

theorem readX_write_other (s : State) (rd r : Reg) (v : XWord) (hs : s.x.size = 32)
    (hne : rd.val ≠ r.val) : (s.writeX rd v).readX r = s.readX r := by
  rw [readX_writeX s rd r v hs]
  by_cases hz : r.val = 0
  · simp [hz, State.readX]
  · simp [hz, hne]

theorem body_keep (c : Config) (s : State) (hs : s.x.size = 32) : Keep s (body c s) := by
  intro r h10 h11 h13 h14 h15
  change (body5 c s).readX r = s.readX r
  simp only [body5, addLanes, next_read, wv_read, body4, widenBytes, body3, advancePtr]
  rw [readX_write_other _ _ _ _ (by simpa using hs) (by simpa using Ne.symm h11)]
  simp only [body2, decrement, next_read]
  rw [readX_write_other _ _ _ _ (by simpa using hs) (by simpa using Ne.symm h10)]
  simp only [body1, loadBytes, next_read, wv_read, body0, configure_read c s 15 r _ _ _ hs]
  by_cases hz : r.val = 0
  · simp [hz, State.readX]
  · simp [hz, Ne.symm h15]

theorem sub_nat (x : XWord) (n : Nat) (hn : n ≤ x.toNat) :
    (x - BitVec.ofNat 64 n).toNat = x.toNat - n := by
  have hx := x.isLt
  have hmod : n % 2 ^ 64 = n := Nat.mod_eq_of_lt (by omega)
  rw [BitVec.toNat_sub, BitVec.toNat_ofNat, hmod]
  omega

theorem add_nat (x : XWord) (n : Nat) (hn : x.toNat + n < 2 ^ 64) :
    (x + BitVec.ofNat 64 n).toNat = x.toNat + n := by
  have hmod : n % 2 ^ 64 = n := Nat.mod_eq_of_lt (by omega)
  rw [BitVec.toNat_add, BitVec.toNat_ofNat, hmod, Nat.mod_eq_of_lt hn]

theorem body_remaining (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hn : 0 < (s.readX 10).toNat) :
    ((body c s).readX 10).toNat = (s.readX 10).toNat - c.chooseVL (s.readX 10).toNat (capacity c 32 8) := by
  rw [body_read10 c s hs, sub_nat _ _ (choice_bounds c hc _ hn).2.1]

theorem body_pc (c : Config) (s : State) :
    (body c s).pc = if ((body c s).readX 10).toNat = 0 then 10 else 3 := by
  change (if (body5 c s).readX 10 != 0 then 3 else 10) =
    if ((body5 c s).readX 10).toNat = 0 then 10 else 3
  have h : ((body5 c s).readX 10).toNat = 0 ↔ (body5 c s).readX 10 = 0 := by
    constructor
    · intro h; apply BitVec.eq_of_toNat_eq; exact h
    · intro h; simp [h]
  simp [h]

/-- Complete loop summary, proved by induction on the remaining byte count.
    The initial vector accumulator may contain arbitrary lane values. -/
theorem loop_exit (c : Config) (hc : c.Valid) (n : Nat) :
    ∀ s : State, s.pc = 3 → s.x.size = 32 → s.v.size = 32 * regBytes c →
    s.mem.size ≤ 2 ^ 64 → (s.readX 10).toNat = n → 0 < n →
    (s.readX 11).toNat + n ≤ s.mem.size →
    ∃ t, Reach c s t ∧ t.pc = 10 ∧ t.x.size = 32 ∧ t.v.size = 32 * regBytes c ∧
      t.mem = s.mem ∧ Keep s t ∧
      accSum c t = accSum c s + inputSum s (s.readX 11).toNat n := by
  induction n using Nat.strongRecOn with
  | ind n ih =>
    intro s hpc hs hv hmem hn hnpos hbound
    have hpos : 0 < (s.readX 10).toNat := by omega
    have hq := choice_bounds c hc (s.readX 10).toNat hpos
    let q := c.chooseVL (s.readX 10).toNat (capacity c 32 8)
    let u := body c s
    have hu := body_remaining c s hc hs hpos
    have hsum := body_sum c s hc hs hv hpos
    have hreach := body_path c s hc hpc hs hpos (by omega)
    have hkeep := body_keep c s hs
    by_cases hzero : n - q = 0
    · refine ⟨u, hreach, ?_, by simpa [u] using hs, by simpa [u] using hv,
        body_mem c s, hkeep, ?_⟩
      · rw [body_pc, body_remaining c s hc hs hpos, hn]
        simp [q, hn] at hzero
        simp [hzero]
      · have he : q = n := by dsimp [q] at *; omega
        simpa only [← show q = c.chooseVL (s.readX 10).toNat (capacity c 32 8) from rfl, he] using hsum
    · have hsmall : n - q < n := by dsimp [q] at *; omega
      have hun : (u.readX 10).toNat = n - q := by simpa only [u, q, hn] using hu
      have hupc : u.pc = 3 := by rw [body_pc, hun]; simp [hzero]
      have hp : (u.readX 11).toNat = (s.readX 11).toNat + q := by
        rw [body_read11 c s hs]
        apply add_nat
        dsimp [q] at *
        omega
      obtain ⟨t, ht, htpc, htx, htv, htm, htk, hts⟩ := ih (n - q) hsmall u hupc
        (by simpa [u] using hs) (by simpa [u] using hv) (by simpa [u] using hmem)
        hun (by omega) (by rw [hp]; simpa [u] using (show (s.readX 11).toNat + q + (n - q) ≤ s.mem.size by dsimp [q] at *; omega))
      refine ⟨t, hreach.trans ht, htpc, htx, htv, htm.trans (body_mem c s), hkeep.trans htk, ?_⟩
      rw [hts, hsum, hp]
      have hsplit := sumW_split (fun j => (s.mem[(s.readX 11).toNat + j]!).zeroExtend 32) q (n - q)
      have he : q + (n - q) = n := by dsimp [q] at *; omega
      rw [he] at hsplit
      simpa [inputSum, u, Nat.add_assoc, BitVec.add_assoc] using congrArg (accSum c s + ·) hsplit.symm

def start0 (c : Config) (s : State) : State := configure c s 14 (capacity c 32 8) 8 .agnostic
def start1 (c : Config) (s : State) : State :=
  (writeVector c (start0 c s) 8 4 (capacity c 32 8) (capacity c 32 8) (fun _ => 0)).next
def start (c : Config) (s : State) : State := (start1 c s).next

@[simp] theorem start_pc (c : Config) (s : State) : (start c s).pc = s.pc + 3 := by
  simp [start, start1, start0, State.next, Nat.add_assoc]
@[simp] theorem start_mem (c : Config) (s : State) : (start c s).mem = s.mem := by
  simp [start, start1, start0, State.next]
@[simp] theorem start_x_size (c : Config) (s : State) : (start c s).x.size = s.x.size := by
  simp [start, start1, start0, State.next]
@[simp] theorem start_v_size (c : Config) (s : State) : (start c s).v.size = s.v.size := by
  simp [start, start1, start0, State.next]
@[simp] theorem start_read10 (c : Config) (s : State) (hs : s.x.size = 32) :
    (start c s).readX 10 = s.readX 10 := by simp [start, start1, start0, hs]
@[simp] theorem start_read11 (c : Config) (s : State) (hs : s.x.size = 32) :
    (start c s).readX 11 = s.readX 11 := by simp [start, start1, start0, hs]

theorem start_keep (c : Config) (s : State) (hs : s.x.size = 32) : Keep s (start c s) := by
  exact configure_keep c s 14 (capacity c 32 8) 8 .agnostic hs (by decide)

theorem start_sum (c : Config) (s : State) (hc : c.Valid) (hv : s.v.size = 32 * regBytes c) :
    accSum c (start c s) = 0 := by
  have hg := geometry c hc
  unfold accSum
  rw [sumW_congr _ (fun _ => 0) _ ?_, sumW_all_zero]
  intro k hk
  have h := writeVector_active32 c (start0 c s) 8 (capacity c 32 8) (capacity c 32 8)
    (fun _ => 0) k hk (by omega)
    (by simp only [rv8, start0, configure_v]; omega)
  simpa [start, start1] using h

theorem start_path (c : Config) (s : State) (hc : c.Valid) (hpc : s.pc = 0)
    (hs : s.x.size = 32) (hn : 0 < (s.readX 10).toNat) : Reach c s (start c s) := by
  have hg := geometry c hc
  have hmax : ¬capacity c 32 8 = 0 := by omega
  have h0 : step c program s = .ok (.next (start0 c s)) := by
    simp [step, program, hpc, execInstr, start0, configure] <;> rfl
  have h1 : step c program (start0 c s) = .ok (.next (start1 c s)) := by
    simp [step, program, start0, configure_pc, hpc, execInstr, requireVector32,
      groupOK, configure_vl, configure_sew, configure_lmul, hmax, start1] <;> rfl
  have hnonzero : s.readX 10 ≠ 0 := by intro h; simp [h] at hn
  have h2 : step c program (start1 c s) = .ok (.next (start c s)) := by
    have hp : (start1 c s).pc = 2 := by simp [start1, start0, State.next, hpc]
    have hx : (start1 c s).readX 10 = s.readX 10 := by simp [start1, start0, hs]
    have hcond : condHolds .eq ((start1 c s).readX 10) ((start1 c s).readX 0) = false := by
      change ((start1 c s).readX 10 == 0) = false
      simp only [hx, beq_eq_false_iff_ne]
      exact hnonzero
    simp only [step, hp, program]
    change (Except.ok (Transition.next { (start1 c s).next with pc :=
      if (condHolds .eq ((start1 c s).readX 10) ((start1 c s).readX 0)) then 10 else (start1 c s).pc + 1 }) : Except Fault Transition) =
      .ok (.next (start c s))
    rw [hcond]
    rfl
  exact .next h0 (.next h1 (.next h2 .refl))


def oldWord (s : State) : Word := BitVec.ofNat 32 (readLE s.mem (s.readX 12).toNat 4)
def redValue (c : Config) (s : State) : Word :=
  (List.range s.vl).foldl (fun acc j => acc + readLane32 c s 8 j) (readLane32 c s 1 0)

def finish0 (c : Config) (s : State) : State := configure c s 15 (capacity c 32 1) 1 .agnostic
def finish1 (c : Config) (s : State) : State :=
  (writeVector c (finish0 c s) 1 4 (capacity c 32 1) (capacity c 32 1) (fun _ => 0)).next
def finish2 (c : Config) (s : State) : State := configure c (finish1 c s) 14 (capacity c 32 8) 8 .agnostic
def finish3 (c : Config) (s : State) : State :=
  ((finish2 c s).writeX 13 ((oldWord (finish2 c s)).signExtend 64)).next
def finish4 (c : Config) (s : State) : State :=
  (writeVector c (finish3 c s) 8 4 1 (capacity c 32 1) (fun _ => (redValue c (finish3 c s)).toNat)).next
def finish5 (c : Config) (s : State) : State :=
  ((finish4 c s).writeX 15 ((readLane32 c (finish4 c s) 8 0).signExtend 64)).next
def addOutput (t : State) : State :=
  (t.writeX 15 (((t.readX 15).truncate 32 + (t.readX 13).truncate 32).signExtend 64)).next

theorem addOutput_other (t : State) (r : Reg) (hs : t.x.size = 32) (hr : (15 : Reg).val ≠ r.val) :
    (addOutput t).readX r = t.readX r := readX_write_other t 15 r _ hs hr

theorem addOutput_read (t : State) (hs : t.x.size = 32) :
    (addOutput t).readX 15 = ((t.readX 15).truncate 32 + (t.readX 13).truncate 32).signExtend 64 := by
  unfold addOutput
  rw [next_read, readX_writeX _ _ _ _ hs]
  simp only [rv15, show ¬(15 : Nat) = 0 by decide, ↓reduceIte]

def finish6 (c : Config) (s : State) : State := addOutput (finish5 c s)
def finish (c : Config) (s : State) : State :=
  let t := finish6 c s
  { t.next with mem := writeLE t.mem (t.readX 12).toNat 4 (t.readX 15).toNat }

@[simp] theorem finish0_pc (c : Config) (s : State) :
    (finish0 c s).pc = s.pc + 1 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish0_x_size (c : Config) (s : State) :
    (finish0 c s).x.size = s.x.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish0_mem (c : Config) (s : State) :
    (finish0 c s).mem = s.mem := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish0_v_size (c : Config) (s : State) :
    (finish0 c s).v.size = s.v.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish0_vl (c : Config) (s : State) :
    (finish0 c s).vl = capacity c 32 1 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish0_sew (c : Config) (s : State) :
    (finish0 c s).sew = 32 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish0_lmul (c : Config) (s : State) :
    (finish0 c s).lmul = 1 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish0_tail (c : Config) (s : State) :
    (finish0 c s).tail = .agnostic := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish1_pc (c : Config) (s : State) :
    (finish1 c s).pc = s.pc + 2 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish1_x_size (c : Config) (s : State) :
    (finish1 c s).x.size = s.x.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish1_mem (c : Config) (s : State) :
    (finish1 c s).mem = s.mem := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish1_v_size (c : Config) (s : State) :
    (finish1 c s).v.size = s.v.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish1_vl (c : Config) (s : State) :
    (finish1 c s).vl = capacity c 32 1 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish1_sew (c : Config) (s : State) :
    (finish1 c s).sew = 32 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish1_lmul (c : Config) (s : State) :
    (finish1 c s).lmul = 1 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish1_tail (c : Config) (s : State) :
    (finish1 c s).tail = .agnostic := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish2_pc (c : Config) (s : State) :
    (finish2 c s).pc = s.pc + 3 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish2_x_size (c : Config) (s : State) :
    (finish2 c s).x.size = s.x.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish2_mem (c : Config) (s : State) :
    (finish2 c s).mem = s.mem := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish2_v_size (c : Config) (s : State) :
    (finish2 c s).v.size = s.v.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish2_vl (c : Config) (s : State) :
    (finish2 c s).vl = capacity c 32 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish2_sew (c : Config) (s : State) :
    (finish2 c s).sew = 32 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish2_lmul (c : Config) (s : State) :
    (finish2 c s).lmul = 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish2_tail (c : Config) (s : State) :
    (finish2 c s).tail = .agnostic := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish3_pc (c : Config) (s : State) :
    (finish3 c s).pc = s.pc + 4 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish3_x_size (c : Config) (s : State) :
    (finish3 c s).x.size = s.x.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish3_mem (c : Config) (s : State) :
    (finish3 c s).mem = s.mem := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish3_v_size (c : Config) (s : State) :
    (finish3 c s).v.size = s.v.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish3_vl (c : Config) (s : State) :
    (finish3 c s).vl = capacity c 32 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish3_sew (c : Config) (s : State) :
    (finish3 c s).sew = 32 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish3_lmul (c : Config) (s : State) :
    (finish3 c s).lmul = 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish3_tail (c : Config) (s : State) :
    (finish3 c s).tail = .agnostic := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish4_pc (c : Config) (s : State) :
    (finish4 c s).pc = s.pc + 5 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish4_x_size (c : Config) (s : State) :
    (finish4 c s).x.size = s.x.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish4_mem (c : Config) (s : State) :
    (finish4 c s).mem = s.mem := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish4_v_size (c : Config) (s : State) :
    (finish4 c s).v.size = s.v.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish4_vl (c : Config) (s : State) :
    (finish4 c s).vl = capacity c 32 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish4_sew (c : Config) (s : State) :
    (finish4 c s).sew = 32 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish4_lmul (c : Config) (s : State) :
    (finish4 c s).lmul = 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish4_tail (c : Config) (s : State) :
    (finish4 c s).tail = .agnostic := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish5_pc (c : Config) (s : State) :
    (finish5 c s).pc = s.pc + 6 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish5_x_size (c : Config) (s : State) :
    (finish5 c s).x.size = s.x.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish5_mem (c : Config) (s : State) :
    (finish5 c s).mem = s.mem := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish5_v_size (c : Config) (s : State) :
    (finish5 c s).v.size = s.v.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish5_vl (c : Config) (s : State) :
    (finish5 c s).vl = capacity c 32 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish5_sew (c : Config) (s : State) :
    (finish5 c s).sew = 32 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish5_lmul (c : Config) (s : State) :
    (finish5 c s).lmul = 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish5_tail (c : Config) (s : State) :
    (finish5 c s).tail = .agnostic := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish6_pc (c : Config) (s : State) :
    (finish6 c s).pc = s.pc + 7 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish6_x_size (c : Config) (s : State) :
    (finish6 c s).x.size = s.x.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish6_mem (c : Config) (s : State) :
    (finish6 c s).mem = s.mem := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish6_v_size (c : Config) (s : State) :
    (finish6 c s).v.size = s.v.size := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish6_vl (c : Config) (s : State) :
    (finish6 c s).vl = capacity c 32 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish6_sew (c : Config) (s : State) :
    (finish6 c s).sew = 32 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish6_lmul (c : Config) (s : State) :
    (finish6 c s).lmul = 8 := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish6_tail (c : Config) (s : State) :
    (finish6 c s).tail = .agnostic := by simp [finish0, finish1, finish2, finish3, finish4, finish5, finish6, addOutput, State.next, Nat.add_assoc]

@[simp] theorem finish0_r12 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish0 c s).readX 12 = s.readX 12 := by simp [finish0, hs]

@[simp] theorem finish1_r12 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish1 c s).readX 12 = s.readX 12 := by simp [finish1, hs]

@[simp] theorem finish2_r12 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish2 c s).readX 12 = s.readX 12 := by simp [finish2, hs]

@[simp] theorem finish3_r12 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish3 c s).readX 12 = s.readX 12 := by simp [finish3, hs]

@[simp] theorem finish4_r12 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish4 c s).readX 12 = s.readX 12 := by simp [finish4, hs]

@[simp] theorem finish5_r12 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish5 c s).readX 12 = s.readX 12 := by simp [finish5, hs]

@[simp] theorem finish6_r12 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish6 c s).readX 12 = s.readX 12 := by
  exact (addOutput_other (finish5 c s) 12 (by simpa using hs) (by decide)).trans (finish5_r12 c s hs)

@[simp] theorem finish2_old (c : Config) (s : State) (hs : s.x.size = 32) :
    oldWord (finish2 c s) = oldWord s := by simp [oldWord, hs]

@[simp] theorem finish3_r13 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish3 c s).readX 13 = (oldWord s).signExtend 64 := by simp [finish3, hs]
@[simp] theorem finish4_r13 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish4 c s).readX 13 = (oldWord s).signExtend 64 := by simp [finish4, hs]
@[simp] theorem finish5_r13 (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish5 c s).readX 13 = (oldWord s).signExtend 64 := by simp [finish5, hs]

 theorem finish1_acc (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) (k : Nat) (hk : k < capacity c 32 8) :
    readLane32 c (finish1 c s) 8 k = readLane32 c s 8 k := by
  have hg := geometry c hc
  have h := writeVector_outside32 c (finish0 c s) 1 8 4 (capacity c 32 1) (capacity c 32 1)
    (fun _ => 0) k
    (by simp only [vectorAddress, rv8, finish0, configure_v]; omega)
    (Or.inr (by simp only [vectorAddress, rv1, rv8]; omega))
  simpa [finish1, finish0, configure] using h

 theorem finish1_seed (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) : readLane32 c (finish1 c s) 1 0 = 0 := by
  have hg := geometry c hc
  have h := writeVector_active32 c (finish0 c s) 1 (capacity c 32 1) (capacity c 32 1)
    (fun _ => 0) 0 hg.2.2.2.1 (by omega)
    (by simp only [rv1, finish0, configure_v]; omega)
  simpa [finish1] using h

 theorem finish3_acc (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) (k : Nat) (hk : k < capacity c 32 8) :
    readLane32 c (finish3 c s) 8 k = readLane32 c s 8 k := by
  simpa [finish3, finish2, configure] using finish1_acc c s hc hv k hk

 theorem finish3_seed (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) : readLane32 c (finish3 c s) 1 0 = 0 := by
  simpa [finish3, finish2, configure] using finish1_seed c s hc hv

 theorem finish3_red (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) : redValue c (finish3 c s) = accSum c s := by
  unfold redValue accSum
  rw [finish3_vl, sumW_fold, finish3_seed c s hc hv]
  exact (BitVec.zero_add _).trans (sumW_congr _ _ _ (finish3_acc c s hc hv))

 theorem finish4_lane0 (c : Config) (s : State) (hc : c.Valid)
    (hv : s.v.size = 32 * regBytes c) : readLane32 c (finish4 c s) 8 0 = accSum c s := by
  have hg := geometry c hc
  have h := writeVector_active32 c (finish3 c s) 8 1 (capacity c 32 1)
    (fun _ => (redValue c (finish3 c s)).toNat) 0 (by omega) (by omega)
    (by simp only [rv8, finish3_v_size]; omega)
  simp only [BitVec.ofNat_toNat, BitVec.setWidth_eq] at h
  simpa [finish4, finish3_red c s hc hv] using h

 theorem extend_back (a : Word) : (a.signExtend 64).setWidth 32 = a := by
  apply BitVec.eq_of_toNat_eq
  have ha := a.isLt
  simp only [BitVec.toNat_setWidth, BitVec.toNat_signExtend]
  split <;> omega

 theorem stored_add (a b : Word) :
    BitVec.ofNat 32 (((a.signExtend 64).truncate 32 + (b.signExtend 64).truncate 32).signExtend 64).toNat = a + b := by
  simp only [BitVec.ofNat_toNat, BitVec.truncate_eq_setWidth]
  rw [extend_back, extend_back, extend_back]

 theorem finish6_word (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hv : s.v.size = 32 * regBytes c) :
    BitVec.ofNat 32 ((finish6 c s).readX 15).toNat = accSum c s + oldWord s := by
  have h5 : (finish5 c s).readX 15 = (accSum c s).signExtend 64 := by
    simp [finish5, hs, finish4_lane0 c s hc hv]
  rw [show (finish6 c s).readX 15 =
    (((finish5 c s).readX 15).truncate 32 + ((finish5 c s).readX 13).truncate 32).signExtend 64 from
    addOutput_read (finish5 c s) (by simpa using hs)]
  rw [h5, finish5_r13 c s hs]
  exact stored_add _ _


theorem finish_exec (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hpc : s.pc = 10) (ha : (s.readX 12).toNat % 4 = 0)
    (hm : (s.readX 12).toNat + 4 ≤ s.mem.size) : Exec c program s (finish c s) := by
  have hg := geometry c hc
  have hmax : ¬capacity c 32 8 = 0 := by omega
  have hsmall : ¬capacity c 32 1 = 0 := by omega
  have h0 : step c program s = .ok (.next (finish0 c s)) := by
    simp [step, program, hpc, execInstr, finish0, configure] <;> rfl
  have h1 : step c program (finish0 c s) = .ok (.next (finish1 c s)) := by
    simp [step, program, finish0_pc, hpc, execInstr, requireVector32,
      finish0_sew, finish0_vl, finish0_lmul, groupOK, hsmall, finish1] <;> rfl
  have h2 : step c program (finish1 c s) = .ok (.next (finish2 c s)) := by
    simp [step, program, finish1_pc, hpc, execInstr, finish2, configure] <;> rfl
  have h3 : step c program (finish2 c s) = .ok (.next (finish3 c s)) := by
    simp [step, program, finish2_pc, hpc, execInstr, address, hs, ha,
      show ¬(s.readX 12).toNat + 4 > s.mem.size by omega, finish3, oldWord] <;> rfl
  have h4 : step c program (finish3 c s) = .ok (.next (finish4 c s)) := by
    simp [step, program, finish3_pc, hpc, execInstr, requireVector32,
      finish3_sew, finish3_vl, finish3_lmul, groupOK, hmax, finish4, redValue] <;> rfl
  have h5 : step c program (finish4 c s) = .ok (.next (finish5 c s)) := by
    simp [step, program, finish4_pc, hpc, execInstr, requireVector32,
      finish4_sew, finish4_vl, finish4_lmul, finish5] <;> rfl
  have h6 : step c program (finish5 c s) = .ok (.next (finish6 c s)) := by
    simp [step, program, finish5_pc, hpc, execInstr, finish6, addOutput] <;> rfl
  have h7 : step c program (finish6 c s) = .ok (.next (finish c s)) := by
    simp [step, program, finish6_pc, hpc, execInstr, address, hs, ha,
      show ¬(s.readX 12).toNat + 4 > s.mem.size by omega, finish, State.next] <;> rfl
  have h8 : step c program (finish c s) = .ok (.returned (finish c s)) := by
    have hp : (finish c s).pc = 18 := by simp [finish, State.next, hpc]
    simp [step, program, hp, execInstr] <;> rfl
  exact .next h0 (.next h1 (.next h2 (.next h3 (.next h4 (.next h5 (.next h6 (.next h7 (.returned h8))))))))

theorem configure_other (c : Config) (s : State) (rd r : Reg) (vl lm : Nat) (tail : Tail)
    (hs : s.x.size = 32) (hr : rd.val ≠ r.val) :
    (configure c s rd vl lm tail).readX r = s.readX r := by
  rw [configure_read c s rd r vl lm tail hs]
  by_cases hz : r.val = 0
  · simp [hz, State.readX]
  · simp [hz, hr]

theorem finish_keep (c : Config) (s : State) (hs : s.x.size = 32) : Keep s (finish c s) := by
  intro r h10 h11 h13 h14 h15
  change (finish6 c s).readX r = s.readX r
  simp only [finish6, addOutput, next_read]
  rw [readX_write_other _ _ _ _ (by simpa using hs) (by simpa using Ne.symm h15)]
  simp only [finish5, next_read]
  rw [readX_write_other _ _ _ _ (by simpa using hs) (by simpa using Ne.symm h15)]
  simp only [finish4, next_read, wv_read, finish3]
  rw [readX_write_other _ _ _ _ (by simpa using hs) (by simpa using Ne.symm h13)]
  simp only [finish2]
  rw [configure_other _ _ _ _ _ _ _ (by simpa using hs) (by simpa using Ne.symm h14)]
  simp only [finish1, next_read, wv_read, finish0]
  exact configure_other _ _ _ _ _ _ _ hs (by simpa using Ne.symm h15)

@[simp] theorem finish_mem (c : Config) (s : State) (hs : s.x.size = 32) :
    (finish c s).mem = writeLE s.mem (s.readX 12).toNat 4 ((finish6 c s).readX 15).toNat := by
  simp [finish, State.next, hs]

theorem finish_output (c : Config) (s : State) (hc : c.Valid) (hs : s.x.size = 32)
    (hv : s.v.size = 32 * regBytes c) (hm : (s.readX 12).toNat + 4 ≤ s.mem.size) :
    BitVec.ofNat 32 (readLE (finish c s).mem (s.readX 12).toNat 4) = accSum c s + oldWord s := by
  rw [finish_mem c s hs, readLE_writeLE4 _ _ _ hm, finish6_word c s hc hs hv]

theorem correctness : correctnessClaim := by
  intro c s hc hp
  rcases hp with ⟨hpc, hs, hv, hmem, hn, hipos, hibound, hopos, hoalign, hobound⟩
  simp only [ReductionContract.batch, ReductionContract.inputPtr, ReductionContract.outputPtr]
    at hn hipos hibound hopos hoalign hobound
  have hstart := start_path c s hc hpc hs hn
  obtain ⟨t, hpath, htpc, htx, htv, htm, htk, hts⟩ :=
    loop_exit c hc (s.readX 10).toNat (start c s)
      (by simp [hpc]) (by simpa using hs) (by simpa using hv)
      (by simpa using hmem) (by simp [hs]) hn (by simpa [hs] using hibound)
  have htm' : t.mem = s.mem := htm.trans (start_mem c s)
  have hkeep : Keep s t := (start_keep c s hs).trans htk
  have hr12 : t.readX 12 = s.readX 12 := hkeep 12 (by decide) (by decide) (by decide) (by decide) (by decide)
  have hacc : accSum c t = inputSum s (s.readX 11).toNat (s.readX 10).toNat := by
    simpa [start_sum c s hc hv, inputSum, hs] using hts
  have houtbound : (t.readX 12).toNat + 4 ≤ t.mem.size := by simpa [hr12, htm'] using hobound
  have hexec := (hstart.trans hpath).exec (finish_exec c t hc htx htpc (by simpa [hr12] using hoalign) houtbound)
  refine ⟨finish c t, hexec, ?_⟩
  have hresult := finish_output c t hc htx htv houtbound
  have hold : oldWord t = oldWord s := by simp [oldWord, hr12, htm']
  rw [hr12, hacc, hold] at hresult
  refine ⟨?_, ?_, ?_, ?_⟩
  · change BitVec.ofNat 32 (readLE (finish c t).mem (s.readX 12).toNat 4) = ReductionContract.expected s
    rw [hresult]
    unfold ReductionContract.expected ReductionContract.batch ReductionContract.inputPtr ReductionContract.outputPtr
    rw [sumW_fold]
    exact BitVec.add_comm _ _
  · rw [finish_mem c t htx, writeLE_size, htm']
  · intro i hi hout
    simp only [ReductionContract.outputPtr] at hout
    rw [finish_mem c t htx, hr12, htm', writeLE_get _ _ _ _ _ hi]
    rw [if_neg (by omega)]
  · have hfkeep := hkeep.trans (finish_keep c t htx)
    intro r hr
    simp only [ReductionContract.preservedRegisters, List.mem_cons, List.not_mem_nil, or_false] at hr
    rcases hr with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    all_goals exact hfkeep _ (by decide) (by decide) (by decide) (by decide) (by decide)

end Kernel
