import Machine

/- Independently authored API contract, not inferred from the implementation.
   input and output MAY overlap: this kernel stores only after all input reads. -/
namespace ReductionContract
open Assembly

def batch (s : State) : Nat := (s.readX 10).toNat
def inputPtr (s : State) : Nat := (s.readX 11).toNat
def outputPtr (s : State) : Nat := (s.readX 12).toNat

def Pre (c : Config) (s : State) : Prop :=
  s.pc = 0 ∧ s.x.size = 32 ∧ s.v.size = 32 * regBytes c ∧
  s.mem.size ≤ 2 ^ 64 ∧ 0 < batch s ∧
  0 < inputPtr s ∧ inputPtr s + batch s ≤ s.mem.size ∧
  0 < outputPtr s ∧ outputPtr s % 4 = 0 ∧ outputPtr s + 4 ≤ s.mem.size

def expected (s : State) : Word :=
  (List.range (batch s)).foldl
    (fun acc i => acc + (s.mem[inputPtr s + i]!).zeroExtend 32)
    (BitVec.ofNat 32 (readLE s.mem (outputPtr s) 4))

def preservedRegisters : List Reg := [1, 2, 3, 4, 8, 9, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]

def Post (initial final : State) : Prop :=
  BitVec.ofNat 32 (readLE final.mem (outputPtr initial) 4) = expected initial ∧
  final.mem.size = initial.mem.size ∧
  (∀ i, i < initial.mem.size →
    (i < outputPtr initial ∨ outputPtr initial + 4 ≤ i) → final.mem[i]! = initial.mem[i]!) ∧
  (∀ r ∈ preservedRegisters, final.readX r = initial.readX r)

/-- Existence includes normal termination. Universality over Config includes
    all legal deterministic VL selectors and all per-step/lane tail oracles. -/
def Correct (p : Program) : Prop :=
  ∀ (c : Config) (initial : State), c.Valid → Pre c initial →
    ∃ final, Exec c p initial final ∧ Post initial final

end ReductionContract
