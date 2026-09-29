import Std

/-!
An UNBOUNDED abstract-loop experiment, NOT a Sail machine-code proof.
The ISA-to-block refinement obligations are intentionally not assumed as axioms.
All functions below are handwritten abstractions. See the accompanying report.
-/
set_option autoImplicit false
set_option linter.unusedVariables false
namespace UnboundedVLA

def signedMax (x t : BitVec 8) : BitVec 8 :=
  if x.toInt < t.toInt then t else x

/-- An independently written mathematical lane abstraction, not Sail execute. -/
def rvvLane (x t : BitVec 8) : BitVec 8 :=
  BitVec.ofInt 8 (max x.toInt t.toInt)

theorem lane_equal (x t : BitVec 8) : signedMax x t = rvvLane x t := by
  unfold signedMax rvvLane
  split
  · rename_i h
    rw [Int.max_eq_right (by omega), BitVec.ofInt_toInt]
  · rename_i h
    rw [Int.max_eq_left (by omega), BitVec.ofInt_toInt]

/-- A scheduler can depend on the remaining length. No divisibility by 16 is required. -/
structure Policy where
  choose : Nat → Nat
  positive : ∀ n, 0 < n → 0 < choose n
  bounded : ∀ n, choose n ≤ n

def chunkLoop {α β : Type} (f : α → β) (p : Policy) (xs : List α) : List β :=
  if h : xs.length = 0 then []
  else
    (xs.take (p.choose xs.length)).map f ++ chunkLoop f p (xs.drop (p.choose xs.length))
termination_by xs.length
decreasing_by
  simp only [List.length_drop]
  have := p.positive xs.length (by omega)
  omega

theorem chunkLoop_exact {α β : Type} (f : α → β) (p : Policy) (xs : List α) :
    chunkLoop f p xs = xs.map f := by
  rw [chunkLoop]
  split
  · rename_i h
    have : xs = [] := List.eq_nil_of_length_eq_zero h
    simp [this]
  · rw [chunkLoop_exact f p (xs.drop (p.choose xs.length))]
    rw [← List.map_append, List.take_append_drop]
termination_by xs.length
decreasing_by
  simp only [List.length_drop]
  have := p.positive xs.length (by omega)
  omega

/-- The source loop really stops on a remainder smaller than 16. -/
def neonLoop {α β : Type} (f : α → β) (xs : List α) : List β :=
  if h : 16 ≤ xs.length then
    (xs.take 16).map f ++ neonLoop f (xs.drop 16)
  else []
termination_by xs.length
decreasing_by simp only [List.length_drop]; omega

theorem neonLoop_exact {α β : Type} (f : α → β) (xs : List α)
    (aligned : xs.length % 16 = 0) : neonLoop f xs = xs.map f := by
  rw [neonLoop]
  split
  · rename_i h
    have hd : (xs.drop 16).length % 16 = 0 := by
      simp only [List.length_drop]
      omega
    rw [neonLoop_exact f (xs.drop 16) hd]
    rw [← List.map_append, List.take_append_drop]
  · have : xs = [] := List.eq_nil_of_length_eq_zero (by omega)
    simp [this]
termination_by xs.length
decreasing_by simp only [List.length_drop]; omega

/-- Direct output equality; lane operations need not have the same definition. -/
theorem fixed_to_vla {α β : Type} (left right : α → β)
    (lane_eq : ∀ x, left x = right x) (p : Policy) (xs : List α)
    (aligned : xs.length % 16 = 0) :
    neonLoop left xs = chunkLoop right p xs := by
  rw [neonLoop_exact left xs aligned, chunkLoop_exact]
  exact List.map_congr_left (fun x _ => lane_eq x)

theorem s8max_fixed_to_vla (t : BitVec 8) (p : Policy) (xs : List (BitVec 8))
    (aligned : xs.length % 16 = 0) :
    neonLoop (fun x => signedMax x t) xs =
      chunkLoop (fun x => rvvLane x t) p xs :=
  fixed_to_vla _ _ (fun x => lane_equal x t) p xs aligned

/-- Every iteration may make a new choice, even beyond a deterministic policy. -/
inductive Execution {α β : Type} (f : α → β) : List α → List Nat → List β → Prop
  | done : Execution f [] [] []
  | step (xs : List α) (k : Nat) (ks : List Nat) (ys : List β)
      (positive : 0 < k) (bounded : k ≤ xs.length)
      (rest : Execution f (xs.drop k) ks ys) :
      Execution f xs (k :: ks) ((xs.take k).map f ++ ys)

theorem execution_exact {α β : Type} {f : α → β}
    {xs : List α} {ks : List Nat} {ys : List β} (h : Execution f xs ks ys) :
    ys = xs.map f := by
  induction h with
  | done => rfl
  | step xs k ks ys hp hb hr ih =>
    rw [ih, ← List.map_append, List.take_append_drop]

theorem execution_progress {α β : Type} {f : α → β}
    {xs : List α} {ks : List Nat} {ys : List β} (h : Execution f xs ks ys) :
    ks.sum = xs.length ∧ ks.length ≤ xs.length := by
  induction h with
  | done => simp
  | step xs k ks ys hp hb hr ih =>
    simp only [List.sum_cons, List.length_cons, List.length_drop] at *
    omega

/-- No infinite sequence of positive, strictly decreasing remaining lengths exists.
This is a termination argument for the abstract progress contract. -/
theorem no_infinite_progress (remaining : Nat → Nat)
    (positive : ∀ i, 0 < remaining i)
    (decreases : ∀ i, remaining (i + 1) < remaining i) : False := by
  have bound : ∀ i, remaining i + i ≤ remaining 0 := by
    intro i
    induction i with
    | zero => omega
    | succ i ih => have := decreases i; omega
  have := bound (remaining 0)
  have := positive (remaining 0)
  omega

def maximal (cap : Nat) (positive : 0 < cap) : Policy where
  choose n := min n cap
  positive n hn := by omega
  bounded n := by omega

def balanced (cap : Nat) (positive : 0 < cap) : Policy where
  choose n := if n ≤ cap then n else if n < 2 * cap then (n + 1) / 2 else cap
  positive n hn := by split <;> (try split) <;> omega
  bounded n := by split <;> (try split) <;> omega

/-- A legal architectural VL constraint, expressed over mathematical naturals.
This is not a theorem about Sail's vsetvli decoder or machine state. -/
def LegalVL (cap n k : Nat) : Prop :=
  (n ≤ cap → k = n) ∧
  (cap < n ∧ n < 2 * cap → (n + 1) / 2 ≤ k ∧ k ≤ cap) ∧
  (2 * cap ≤ n → k = cap)

theorem balanced_legal (cap : Nat) (hc : 0 < cap) (n : Nat) :
    LegalVL cap n ((balanced cap hc).choose n) := by
  simp only [LegalVL, balanced]
  split <;> (try split) <;> omega

/-- At input length 528, the choices are 256, 136, 136, not all multiples of 16. -/
example : (balanced 256 (by decide)).choose 272 = 136 := by decide
example : (balanced 256 (by decide)).choose 272 % 16 ≠ 0 := by decide

/-- Signed corner case; an unsigned-max replacement is observably wrong. -/
example : signedMax 255 1 = 1 := by decide
example : signedMax 128 127 = 127 := by decide

#print axioms chunkLoop_exact
#print axioms neonLoop_exact
#print axioms fixed_to_vla
#print axioms s8max_fixed_to_vla
#print axioms lane_equal
#print axioms execution_exact
#print axioms execution_progress
#print axioms no_infinite_progress
#print axioms balanced_legal
end UnboundedVLA
