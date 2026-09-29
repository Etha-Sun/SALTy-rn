import Models

open SALT.Corpus.qu8rsum

def lengths : List Nat := [1, 2, 15, 16, 17, 31, 32, 33, 63, 64, 65,
  127, 128, 129, 2047, 2048, 2049, 2063, 2064, 4095, 4096, 4097, 8193]
def widths : List Nat := [1, 3, 4, 7, 16, 64]

def selectVL (m mode remaining : Nat) : Nat :=
  if mode = 2 then 1 else
    if mode = 1 ∧ m < remaining ∧ remaining < 2*m then (remaining+1)/2
    else min remaining m

def makeChunks (m mode : Nat) : Nat → Nat → List Nat
  | 0, _ => []
  | fuel + 1, n =>
    if n = 0 then [] else
      let vl := selectVL m mode n
      vl :: makeChunks m mode fuel (n-vl)

def main : IO Unit := do
  let mut count := 0
  for n in lengths do
    for m in widths do
      for mode in [0, 1, 2] do
        for pattern in [0, 1, 2] do
          let input : List Byte := (List.range n).map fun i =>
            BitVec.ofNat 8 (if pattern = 0 then 0 else if pattern = 1 then 255 else i*73+19)
          let overread : List Byte := (List.range 15).map fun i =>
            BitVec.ofNat 8 ((n+i)*29+137)
          let oldOutput : Word := BitVec.ofNat 32 (2^32-18)
          let chunks := makeChunks m mode (n+1) n
          unless chunks.sum = n && chunks.all (fun vl => 0 < vl && vl ≤ m) do
            throw (IO.userError "bad test schedule")
          let neon := neonValueLoopWithOverreadFromIntrinsics input overread oldOutput
          let rvv := rvvValueLoopFromIntrinsics input oldOutput m chunks
          let expected := input.foldl (fun acc x => acc + x.zeroExtend 32) oldOutput
          unless neon == expected && rvv == expected do
            throw (IO.userError s!"FAIL n={n} M={m} mode={mode} pattern={pattern}")
          IO.println s!"case {n} {m} {mode} {pattern} {neon.toNat} {rvv.toNat}"
          count := count+1
  (← IO.getStderr).putStrLn s!"PASS {count} Lean model cases"

/-- Kernel-checked small example, not a universal proof. -/
example : neonValueLoopWithOverreadFromIntrinsics [1,2,3,4,5,6]
    (List.replicate 15 255) 10 = 31 := by decide
example : rvvValueLoopFromIntrinsics [1,2,3,4,5,6] 10 4 [4,2] = 31 := by decide
example : rvvValueLoopFromIntrinsics [1,2,3,4,5,6] 10 4 [3,3] = 31 := by decide
example : rvvValueLoopFromIntrinsics [1,2,3,4,5,6] 10 4 [1,1,1,1,1,1] = 31 := by decide

/-- The real register states differ, although their final sums agree. -/
example : (rvvRun [1,2,3,4,5,6] 0 4 [4,2]).vacc = [6,8,3,4] := by decide
example : (rvvRun [1,2,3,4,5,6] 0 4 [3,3]).vacc = [5,7,9,0] := by decide

/-- C's short-tail input pointer is deliberately not advanced. -/
example : (neonRun [1,2,3,4,5,6] (List.replicate 15 255) 10).inputOffset = 0 := by decide
example : (neonRun [1,2,3,4,5,6] (List.replicate 15 255) 10).batch = 6 := by decide
