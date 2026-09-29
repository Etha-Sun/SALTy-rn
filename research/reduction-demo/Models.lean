-- Hand-translated value models, NOT emitted by the current elementwise compiler.
-- Frozen before proof search. Source: kernels/{source,target}/qu8-rsum.c.
import Std

namespace SALT.Corpus.qu8rsum

abbrev Byte := BitVec 8
abbrev Half := BitVec 16
abbrev Word := BitVec 32

/-- Adjacent-pair widening addition; odd input is a totalization only.
    Actual NEON calls have exactly 16 or 8 source lanes. -/
def pairwiseWiden (w v : Nat) : List (BitVec w) → List (BitVec v)
  | x :: y :: xs => (x.zeroExtend v + y.zeroExtend v) :: pairwiseWiden w v xs
  | [x] => [x.zeroExtend v]
  | [] => []

def vpadalq_u8 (acc : List Half) (xs : List Byte) : List Half :=
  List.zipWith (· + ·) acc (pairwiseWiden 8 16 xs)

def vpadalq_u16 (acc : List Word) (xs : List Half) : List Word :=
  List.zipWith (· + ·) acc (pairwiseWiden 16 32 xs)

def vaddvq_u32 (xs : List Word) : Word := xs.foldl (· + ·) 0

/-- The mask-table load at 16-batch yields `batch` ones followed by zeros.
    Multiplication remains BV8, as in vmulq_u8. -/
def maskedTail (batch : Nat) (loaded : List Byte) : List Byte :=
  List.zipWith (· * ·) loaded
    (List.replicate batch (1 : Byte) ++ List.replicate (16 - batch) 0)

/-- State crossing the nested-loop cutpoints. `input` is the unread physical
    stream, including padding; inputOffset is its original byte offset.
    params has no read effect. Pointer values/allocation metadata are not modeled. -/
structure NeonState where
  input : List Byte
  inputOffset : Nat
  batch : Nat
  currentBatch : Nat
  vacc16 : List Half
  vacc0 : List Word
  output : Word
  deriving Repr, DecidableEq

def neonLoad16 (s : NeonState) : NeonState :=
  let vt_0 := s.input.take 16
  let vacc16_1 := vpadalq_u8 s.vacc16 vt_0
  { s with
    input := s.input.drop 16
    inputOffset := s.inputOffset + 16
    vacc16 := vacc16_1 }

/-- 2048-byte inner loop: current_batch -= 16, NOT batch -= 16. -/
def neonInner : Nat → NeonState → NeonState
  | 0, s => s
  | n + 1, s =>
    let s_1 := neonLoad16 s
    neonInner n { s_1 with currentBatch := s.currentBatch - 16 }

def neonFullBlock (s : NeonState) : NeonState :=
  let s_0 := { s with vacc16 := List.replicate 8 0, currentBatch := 2048 }
  let s_1 := neonInner 128 s_0
  let vacc0_1 := vpadalq_u16 s_1.vacc0 s_1.vacc16
  { s_1 with vacc0 := vacc0_1, batch := s.batch - 2048 }

def neonOuter : Nat → NeonState → NeonState
  | 0, s => s
  | n + 1, s => neonOuter n (neonFullBlock s)

def neonRemainderLoop : Nat → NeonState → NeonState
  | 0, s => s
  | n + 1, s =>
    let s_1 := neonLoad16 s
    neonRemainderLoop n { s_1 with batch := s.batch - 16 }

def neonTail (s : NeonState) : NeonState :=
  if s.batch = 0 then s else
    let vt_0 := s.input.take 16
    let vtm_0 := maskedTail s.batch vt_0
    let vacc16_1 := vpadalq_u8 s.vacc16 vtm_0
    -- The C tail neither increments input nor decrements batch.
    { s with vacc16 := vacc16_1 }

def neonRemainder (s : NeonState) : NeonState :=
  if s.batch = 0 then s else
    let s_0 := { s with vacc16 := List.replicate 8 0 }
    let s_1 := neonRemainderLoop (s.batch / 16) s_0
    let s_2 := neonTail s_1
    { s_2 with vacc0 := vpadalq_u16 s_2.vacc0 s_2.vacc16 }

def neonRun (input overread : List Byte) (oldOutput : Word) : NeonState :=
  let s_0 : NeonState :=
    ⟨input ++ overread, 0, input.length, 0, List.replicate 8 0,
      List.replicate 4 0, oldOutput⟩
  let s_1 := neonOuter (input.length / 2048) s_0
  let s_2 := neonRemainder s_1
  let vacc_0 := vaddvq_u32 s_2.vacc0
  { s_2 with output := s_2.output + vacc_0 }

def neonValueLoopWithOverreadFromIntrinsics
    (input overread : List Byte) (oldOutput : Word) : Word :=
  (neonRun input overread oldOutput).output

/-- RVV active-lane prefix update. Unconsumed old lanes are preserved (_tu).
    Short accumulator case is a totalization, excluded by the schedule/shape invariants. -/
def vadd_tu : List Word → List Word → List Word
  | a :: acc, x :: xs => (a + x) :: vadd_tu acc xs
  | acc, [] => acc
  | [], _ :: _ => []

def vzext_vf4 (xs : List Byte) : List Word := xs.map (·.zeroExtend 32)

def vredsum (acc : List Word) (seed : Word) (vl : Nat) : Word :=
  (acc.take vl).foldl (· + ·) seed

structure RvvState where
  input : List Byte
  inputOffset : Nat
  batch : Nat
  vlmax : Nat
  vl : Nat
  vacc : List Word
  output : Word
  deriving Repr, DecidableEq

def rvvStep (vl : Nat) (s : RvvState) : RvvState :=
  let vt_0 := s.input.take vl
  let vt32_0 := vzext_vf4 vt_0
  let vacc_1 := vadd_tu s.vacc vt32_0
  { s with
    input := s.input.drop vl
    inputOffset := s.inputOffset + vl
    batch := s.batch - vl
    vl := vl
    vacc := vacc_1 }

def rvvLoop : List Nat → RvvState → RvvState
  | [], s => s
  | vl :: chunks, s => rvvLoop chunks (rvvStep vl s)

def rvvRun (input : List Byte) (oldOutput : Word)
    (vlmax : Nat) (chunks : List Nat) : RvvState :=
  let s_0 : RvvState :=
    ⟨input, 0, input.length, vlmax, vlmax, List.replicate vlmax 0, oldOutput⟩
  let s_1 := rvvLoop chunks s_0
  let red_0 := vredsum s_1.vacc 0 vlmax
  { s_1 with output := s_1.output + red_0 }

def rvvValueLoopFromIntrinsics (input : List Byte) (oldOutput : Word)
    (vlmax : Nat) (chunks : List Nat) : Word :=
  (rvvRun input oldOutput vlmax chunks).output

/-- A value-level overapproximation, NOT the exact vsetvl selection rule.
    It includes every legal complete strip-mining run, and additionally e.g.
    single-lane software requests. Bounding each chunk is essential for reduction. -/
def ScheduleOK (n vlmax : Nat) (chunks : List Nat) : Prop :=
  0 < vlmax ∧ chunks.sum = n ∧ ∀ vl ∈ chunks, 0 < vl ∧ vl ≤ vlmax

end SALT.Corpus.qu8rsum
