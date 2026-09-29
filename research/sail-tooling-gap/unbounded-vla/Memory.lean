import Chunked

/-!
Handwritten byte-memory/block abstraction. Addresses are naturals, not ISA words.
No decoder, register file, exceptions or Sail memory effects are modelled here.
Each block reads its source from the pre-block memory before writing any byte.
-/
set_option autoImplicit false
set_option linter.unusedVariables false
namespace UnboundedVLA

abbrev Memory := Nat → BitVec 8

def SafeBuffers (src dst n : Nat) : Prop :=
  src + n ≤ dst ∨ dst + n ≤ src ∨ src = dst

def prefixMemory (initial : Memory) (src dst count : Nat) (f : BitVec 8 → BitVec 8) : Memory :=
  fun a => if dst ≤ a ∧ a < dst + count then f (initial (src + (a - dst))) else initial a

def writeChunk (f : BitVec 8 → BitVec 8) (src dst count : Nat) (m : Memory) : Memory :=
  fun a => if dst ≤ a ∧ a < dst + count then f (m (src + (a - dst))) else m a

theorem prefix_unread (initial : Memory) (src dst n c i : Nat) (f : BitVec 8 → BitVec 8)
    (safe : SafeBuffers src dst n) (hc : c ≤ i) (hi : i < n) :
    prefixMemory initial src dst c f (src + i) = initial (src + i) := by
  have h : ¬ (dst ≤ src + i ∧ src + i < dst + c) := by
    unfold SafeBuffers at safe
    omega
  simp [prefixMemory, h]

theorem write_prefix (initial : Memory) (src dst n c k : Nat) (f : BitVec 8 → BitVec 8)
    (safe : SafeBuffers src dst n) (bound : c + k ≤ n) :
    writeChunk f (src + c) (dst + c) k (prefixMemory initial src dst c f) =
      prefixMemory initial src dst (c + k) f := by
  funext a
  by_cases hn : dst + c ≤ a ∧ a < dst + c + k
  · have hi : a - dst < n := by omega
    have hc : c ≤ a - dst := by omega
    have idx : src + c + (a - (dst + c)) = src + (a - dst) := by omega
    have hall : dst ≤ a ∧ a < dst + (c + k) := by omega
    simp only [writeChunk, if_pos hn]
    rw [idx, prefix_unread initial src dst n c (a - dst) f safe hc hi]
    simp [prefixMemory, hall]
  · simp only [writeChunk, if_neg hn]
    by_cases ho : dst ≤ a ∧ a < dst + c
    · have hall : dst ≤ a ∧ a < dst + (c + k) := by omega
      simp [prefixMemory, ho, hall]
    · have hall : ¬ (dst ≤ a ∧ a < dst + (c + k)) := by omega
      simp [prefixMemory, ho, hall]

def executeBlocks (f : BitVec 8 → BitVec 8) (src dst cursor : Nat)
    (blocks : List Nat) (m : Memory) : Memory :=
  match blocks with
  | [] => m
  | k :: ks => executeBlocks f src dst (cursor + k) ks
      (writeChunk f (src + cursor) (dst + cursor) k m)

theorem execute_prefix (initial : Memory) (src dst n : Nat) (f : BitVec 8 → BitVec 8)
    (safe : SafeBuffers src dst n) (blocks : List Nat) (c : Nat)
    (bound : c + blocks.sum ≤ n) :
    executeBlocks f src dst c blocks (prefixMemory initial src dst c f) =
      prefixMemory initial src dst (c + blocks.sum) f := by
  induction blocks generalizing c with
  | nil => simp [executeBlocks]
  | cons k ks ih =>
    simp only [executeBlocks]
    rw [write_prefix initial src dst n c k f safe (by simpa using Nat.le_trans (Nat.le_add_right (c + k) ks.sum) (by simpa [List.sum_cons, Nat.add_assoc] using bound))]
    rw [ih (c + k) (by simpa [List.sum_cons, Nat.add_assoc] using bound)]
    simp [List.sum_cons, Nat.add_assoc]

theorem execute_exact (initial : Memory) (src dst n : Nat) (f : BitVec 8 → BitVec 8)
    (safe : SafeBuffers src dst n) (blocks : List Nat) (total : blocks.sum = n) :
    executeBlocks f src dst 0 blocks initial = prefixMemory initial src dst n f := by
  have zero : prefixMemory initial src dst 0 f = initial := by
    funext a
    simp only [prefixMemory, Nat.add_zero]
    rw [if_neg (by omega)]
  have h := execute_prefix initial src dst n f safe blocks 0 (by omega)
  simpa [zero, total] using h

def schedule (p : Policy) (n : Nat) : List Nat :=
  if h : n = 0 then [] else p.choose n :: schedule p (n - p.choose n)
termination_by n
decreasing_by have := p.positive n (by omega); omega

theorem schedule_sum (p : Policy) (n : Nat) : (schedule p n).sum = n := by
  rw [schedule]
  split
  · rename_i h
    simp [h]
  · simp only [List.sum_cons]
    rw [schedule_sum p (n - p.choose n)]
    have := p.bounded n
    omega
termination_by n
decreasing_by have := p.positive n (by omega); omega

/-- This fixes the observable to the entire byte memory, including its frame. -/
theorem fixed_blocks_sum (k : Nat) : (List.replicate k 16).sum = 16 * k := by
  induction k with
  | zero => rfl
  | succ k ih => simp [List.replicate_succ, ih, Nat.mul_succ, Nat.add_comm]

theorem memory_fixed_to_vla (initial : Memory) (src dst n : Nat)
    (left right : BitVec 8 → BitVec 8) (lane_eq : ∀ x, left x = right x)
    (safe : SafeBuffers src dst n) (aligned : n % 16 = 0) (p : Policy) :
    executeBlocks left src dst 0 (List.replicate (n / 16) 16) initial =
      executeBlocks right src dst 0 (schedule p n) initial := by
  have hn : (List.replicate (n / 16) 16).sum = n := by
    rw [fixed_blocks_sum]
    omega
  rw [execute_exact initial src dst n left safe _ hn,
      execute_exact initial src dst n right safe _ (schedule_sum p n)]
  have hf : left = right := funext lane_eq
  rw [hf]

theorem s8max_memory_fixed_to_vla (initial : Memory) (src dst n : Nat) (t : BitVec 8)
    (safe : SafeBuffers src dst n) (aligned : n % 16 = 0) (p : Policy) :
    executeBlocks (fun x => signedMax x t) src dst 0 (List.replicate (n / 16) 16) initial =
      executeBlocks (fun x => rvvLane x t) src dst 0 (schedule p n) initial :=
  memory_fixed_to_vla initial src dst n _ _ (fun x => lane_equal x t) safe aligned p

/-- An actual non-aligned legal schedule for an aligned input length. -/
example : schedule (balanced 256 (by decide)) 528 = [256, 136, 136] := by
  simp [schedule, balanced]

/-- A formal witness for why the buffer condition cannot simply be omitted.
This reproduces the previously documented abstract overlap counterexample. -/
def ramp : Memory := fun a => BitVec.ofNat 8 a
example : executeBlocks (fun x => signedMax x 128) 0 1 0 [16, 16] ramp 17 = 15 := by decide
example : executeBlocks (fun x => rvvLane x 128) 0 1 0 [32] ramp 17 = 16 := by decide

#print axioms write_prefix
#print axioms execute_exact
#print axioms schedule_sum
#print axioms memory_fixed_to_vla
#print axioms s8max_memory_fixed_to_vla
end UnboundedVLA
