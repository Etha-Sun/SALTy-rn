import BinaryImage

namespace ReductionBinary

/-- Logical input. The adapter must establish n > 0, readable NEON tail padding,
    valid output/stack/constants, and a compatible architecture initial state. -/
structure Input where
  bytes : List (BitVec 8)
  initialOutput : BitVec 32

def spec (i : Input) : BitVec 32 :=
  i.bytes.foldl (fun acc b => acc + b.zeroExtend 32) i.initialOutput

/-- Interface for NORMAL RETURN observations of actual machine-code execution.
    A Sail adapter has to instantiate this relation using its generated step
    semantics, ELF bytes and the entry/return ABI. This file supplies no adapter. -/
abbrev Runs := Input → BitVec 32 → Prop

/-- Termination plus correctness of every permitted normal return outcome. -/
def Correct (runs : Runs) : Prop :=
  ∀ i, i.bytes ≠ [] →
    (∃ out, runs i out) ∧ ∀ out, runs i out → out = spec i

def Equivalent (arm rvv : Runs) : Prop :=
  ∀ i, i.bytes ≠ [] → ∀ out, arm i out ↔ rvv i out

/-- A conditional composition lemma, NOT a proof about either supplied ELF.
    The two Correct hypotheses remain substantive, unproved obligations. -/
theorem equivalent_of_correct (arm rvv : Runs)
    (ha : Correct arm) (hr : Correct rvv) : Equivalent arm rvv := by
  intro i hi out
  obtain ⟨⟨a, harun⟩, hacorrect⟩ := ha i hi
  obtain ⟨⟨r, hrrun⟩, hrcorrect⟩ := hr i hi
  constructor
  · intro h
    have heq : r = out := (hrcorrect r hrrun).trans (hacorrect out h).symm
    exact heq ▸ hrrun
  · intro h
    have heq : a = out := (hacorrect a harun).trans (hrcorrect out h).symm
    exact heq ▸ harun

end ReductionBinary
