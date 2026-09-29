import Impl
import ReductionContract
import ProofSupport
import ControlPrograms

open Assembly

def balancedVL (avl cap : Nat) : Nat :=
  if avl ≤ cap then avl else if avl < 2 * cap then (avl + 1) / 2 else cap

def initial (c : Config) (n old mode : Nat) : State := Id.run do
  let input := 16
  let output := if mode == 0 then 4096 else 16
  let mut bytes := Array.replicate 4112 (165 : Byte)
  for i in List.range n do
    bytes := bytes.set! (input + i) (BitVec.ofNat 8 ((i * 73 + 19) % 256))
  bytes := writeLE bytes output 4 old
  let s : State := {
    x := ((List.range 32).map (fun r => BitVec.ofNat 64 (987654321 + r * 12345))).toArray
    v := Array.replicate (32 * regBytes c) 173
    mem := bytes
    ticks := 17 }
  return ((s.writeX 10 (BitVec.ofNat 64 n)).writeX 11 (BitVec.ofNat 64 input)).writeX
    12 (BitVec.ofNat 64 output)

def postCheck (s t : State) : Bool :=
  let out := ReductionContract.outputPtr s
  BitVec.ofNat 32 (readLE t.mem out 4) == ReductionContract.expected s &&
  t.mem.size == s.mem.size &&
  (List.range s.mem.size).all (fun i =>
    if i < out || out + 4 ≤ i then t.mem[i]! == s.mem[i]! else true) &&
  ReductionContract.preservedRegisters.all (fun r => t.readX r == s.readX r)

def checkedRun (c : Config) (p : Program) (s : State) (fuel := 100000) : IO State := do
  match run c p fuel s with
  | .returned t => return t
  | .fault e t => throw (IO.userError s!"fault at pc={t.pc}: {repr e}")
  | .timeout t => throw (IO.userError s!"timeout at pc={t.pc}")

def assertIO (condition : Bool) (message : String) : IO Unit :=
  unless condition do throw (IO.userError message)

def main : IO Unit := do
  let lengths := [1, 2, 3, 15, 16, 17, 31, 32, 33, 47, 63, 64, 65, 127, 128, 129, 255, 256, 257, 272, 2049]
  let mut count := 0
  for vlen in [128, 256, 512] do
    for balanced in [false, true] do
      for tailMode in [0, 1, 2] do
        let c : Config := {
          vlen := vlen
          chooseVL := (if balanced then balancedVL else min)
          tailOnes := fun tick lane => if tailMode == 0 then false
            else if tailMode == 1 then true else (tick + lane) % 2 == 0 }
        for n in lengths do
          for old in [0, 4294967280] do
            for aliasMode in [0, 1] do
              let s := initial c n old aliasMode
              let t ← checkedRun c Kernel.program s
              assertIO (postCheck s t) s!"postcondition failed: {vlen}/{balanced}/{tailMode}/{n}/{old}/{aliasMode}"
              count := count + 1
              -- Same inputs/results are also consumed by the real assembly harness.
              if !balanced && tailMode == 1 then
                IO.println s!"CASE {vlen} {n} {old} {aliasMode} {readLE t.mem (ReductionContract.outputPtr s) 4}"
  IO.println s!"PASS Lean reduction: {count} cases, including frame/ABI checks"

  let c : Config := { vlen := 128 }
  let empty : State := { v := Array.replicate 512 0, mem := #[] }
  let nested ← checkedRun c Controls.nested empty
  assertIO (nested.readX 10 == 12) "nested-loop execution failed"
  for entry in [0, 1] do
    let t ← checkedRun c Controls.multipleEntry (empty.writeX 10 (BitVec.ofNat 64 entry))
    assertIO (t.readX 11 == if entry == 0 then 8 else 7) "multiple-entry SCC execution failed"
  let s := initial c 47 0 0
  let renamed ← checkedRun c Controls.renamed s
  assertIO (postCheck s renamed) "renamed registers/labels changed result"

  -- Losing tail-undisturbed is a real reduction bug, not a parser-only mutation.
  let bad := Kernel.program.map fun i => match i with
    | .vsetvli rd rs sew lmul .undisturbed => .vsetvli rd rs sew lmul .agnostic
    | other => other
  let wrong ← checkedRun c bad s
  assertIO (!postCheck s wrong) "negative control failed: tail policy bug was missed"
  let t0 ← checkedRun c Kernel.program (initial c 0 7 0)
  assertIO (readLE t0.mem 4096 4 == 7) "zero-batch assembly branch failed"
  match run c #[.jump 0] 30 empty with
  | .timeout _ => pure ()
  | _ => throw (IO.userError "infinite loop was silently treated as return")
  match run c #[.loadWord 10 0 0, .ret] 10 empty with
  | .fault .memory _ => pure ()
  | _ => throw (IO.userError "invalid memory access was not rejected")
  IO.println "PASS control flow, renaming, tail negative control, zero batch, timeout and memory fault"

-- A concrete execution checked by the Lean kernel, not just #eval/native code.
example : (match run { vlen := 128 } Controls.nested 100
    { v := #[], mem := #[] } with
    | .returned s => (s.readX 10).toNat == 12
    | _ => false) = true := by decide

#print axioms Assembly.run_sound
#print axioms Assembly.total_of_rank
