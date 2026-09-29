import Std

/- A deliberately small RV64/RVV user-mode instruction model. Instructions are
   decoded assembly, NOT binary encodings. PC is an instruction index; ret is the
   observable return from a leaf function. No loop recognizer or kernel names.
   vstart=0, little endian, ordinary bounded byte memory, no interrupts/MMIO.
   This handwritten semantics is a trust boundary, not a Sail refinement proof. -/
namespace Assembly

abbrev Byte := BitVec 8
abbrev Word := BitVec 32
abbrev XWord := BitVec 64
abbrev Reg := Fin 32

inductive Cond where
  | eq | ne | lt | ge | ltu | geu
  deriving Repr, DecidableEq

inductive Alu where
  | add | sub | addw
  deriving Repr, DecidableEq

inductive Tail where
  | undisturbed | agnostic
  deriving Repr, DecidableEq

/-- Constructors are the extension interface. Unsupported instructions fail
    during parsing; unsupported execution modes produce an explicit fault. -/
inductive Instr where
  | alu (op : Alu) (rd rs1 rs2 : Reg)
  | addi (rd rs : Reg) (imm : Int)
  | li (rd : Reg) (imm : Int)
  | branch (cond : Cond) (rs1 rs2 : Reg) (target : Nat)
  | jump (target : Nat)
  | loadWord (rd base : Reg) (offset : Int)
  | storeWord (src base : Reg) (offset : Int)
  | vsetvli (rd rs : Reg) (sew lmul : Nat) (tail : Tail)
  | vmvVI (vd : Reg) (imm : Int)
  | vle8 (vd base : Reg)
  | vzextVF4 (vd vs : Reg)
  | vaddVV (vd vs1 vs2 : Reg)
  | vredsumVS (vd vs seed : Reg)
  | vmvXS (rd vs : Reg)
  | ret
  deriving Repr, DecidableEq

abbrev Program := Array Instr

structure Config where
  vlen : Nat
  /-- Implementation-deterministic AVL/VLMAX choice. -/
  chooseVL : Nat → Nat → Nat := min
  /-- At each instruction/lane, agnostic tails may retain bits or become ones.
      An arbitrary oracle covers independently chosen permitted tail outcomes. -/
  tailOnes : Nat → Nat → Bool := fun _ _ => true

def legalVL (avl cap vl : Nat) : Prop :=
  if avl ≤ cap then vl = avl
  else if avl < 2 * cap then (avl + 1) / 2 ≤ vl ∧ vl ≤ cap
  else vl = cap

def Config.Valid (c : Config) : Prop :=
  (∃ k, 7 ≤ k ∧ k ≤ 16 ∧ c.vlen = 2 ^ k) ∧
  ∀ avl cap, 0 < cap → legalVL avl cap (c.chooseVL avl cap)

structure State where
  pc : Nat := 0
  ticks : Nat := 0
  x : Array XWord := Array.replicate 32 0
  /-- Physical vector registers, flattened as 32 * (VLEN/8) bytes. This preserves
      aliasing when a later instruction uses a different SEW/EMUL. -/
  v : Array Byte
  mem : Array Byte
  vl : Nat := 0
  sew : Nat := 32
  lmul : Nat := 1
  tail : Tail := .agnostic
  deriving Repr

def regBytes (c : Config) : Nat := c.vlen / 8
def capacity (c : Config) (sew lmul : Nat) : Nat := c.vlen * lmul / sew
def State.readX (s : State) (r : Reg) : XWord :=
  if r.val = 0 then 0 else s.x[r.val]!
def State.writeX (s : State) (r : Reg) (v : XWord) : State :=
  if r.val = 0 then s else { s with x := s.x.set! r.val v }
def State.next (s : State) : State := { s with pc := s.pc + 1, ticks := s.ticks + 1 }

def readLE (bytes : Array Byte) (address : Nat) : Nat → Nat
  | 0 => 0
  | n + 1 => bytes[address]!.toNat + 256 * readLE bytes (address + 1) n

def writeLE (bytes : Array Byte) (address count value : Nat) : Array Byte :=
  (List.range count).foldl
    (fun b i => b.set! (address + i) (BitVec.ofNat 8 (value / 256 ^ i))) bytes

def vectorAddress (c : Config) (r : Reg) (width lane : Nat) : Nat :=
  r.val * regBytes c + lane * width
def readLane32 (c : Config) (s : State) (r : Reg) (lane : Nat) : Word :=
  BitVec.ofNat 32 (readLE s.v (vectorAddress c r 4 lane) 4)

/-- All source reads use the original state, including overlapping operands. -/
def writeVector (c : Config) (s : State) (vd : Reg) (width active total : Nat)
    (f : Nat → Nat) : State :=
  let bytes := (List.range total).foldl (fun bytes i =>
    let addr := vectorAddress c vd width i
    if i < active then writeLE bytes addr width (f i)
    else if s.tail == .agnostic && c.tailOnes s.ticks i then
      writeLE bytes addr width (256 ^ width - 1)
    else bytes) s.v
  { s with v := bytes }

def groupOK (r : Reg) (registers : Nat) : Bool :=
  registers > 0 && r.val % registers == 0 && r.val + registers ≤ 32

inductive Fault where
  | badPC | memory | unsupportedVectorMode | illegalVectorGroup | invalidVL
  deriving Repr, DecidableEq

inductive Transition where
  | next (state : State)
  | returned (state : State)
  deriving Repr

def condHolds (cond : Cond) (a b : XWord) : Bool :=
  match cond with
  | .eq => a == b
  | .ne => a != b
  | .lt => a.toInt < b.toInt
  | .ge => a.toInt ≥ b.toInt
  | .ltu => a.toNat < b.toNat
  | .geu => a.toNat ≥ b.toNat

def address (s : State) (base : Reg) (offset : Int) : Nat :=
  (s.readX base + BitVec.ofInt 64 offset).toNat

def requireVector32 (c : Config) (s : State) : Except Fault Unit := do
  if s.sew != 32 || !(s.lmul == 1 || s.lmul == 2 || s.lmul == 4 || s.lmul == 8)
    then throw .unsupportedVectorMode
  if s.vl > capacity c s.sew s.lmul then throw .invalidVL

def execInstr (c : Config) (i : Instr) (s : State) : Except Fault Transition := do
  let advance (t : State) := Transition.next t.next
  match i with
  | .alu op rd r1 r2 =>
      let a := s.readX r1
      let b := s.readX r2
      let result := match op with
        | .add => a + b
        | .sub => a - b
        | .addw => ((a.truncate 32) + (b.truncate 32)).signExtend 64
      return advance (s.writeX rd result)
  | .addi rd rs imm => return advance (s.writeX rd (s.readX rs + BitVec.ofInt 64 imm))
  | .li rd imm => return advance (s.writeX rd (BitVec.ofInt 64 imm))
  | .branch cond r1 r2 target =>
      return .next { s.next with pc := if condHolds cond (s.readX r1) (s.readX r2)
        then target else s.pc + 1 }
  | .jump target => return .next { s.next with pc := target }
  | .loadWord rd base offset =>
      let addr := address s base offset
      if addr % 4 != 0 || addr + 4 > s.mem.size then throw .memory
      return advance (s.writeX rd ((BitVec.ofNat 32 (readLE s.mem addr 4)).signExtend 64))
  | .storeWord rs base offset =>
      let addr := address s base offset
      if addr % 4 != 0 || addr + 4 > s.mem.size then throw .memory
      return advance { s with mem := writeLE s.mem addr 4 (s.readX rs).toNat }
  | .vsetvli rd rs sew lmul tail =>
      if sew != 32 || !(lmul == 1 || lmul == 2 || lmul == 4 || lmul == 8)
        then throw .unsupportedVectorMode
      let cap := capacity c sew lmul
      let vl := if rs.val != 0 then c.chooseVL (s.readX rs).toNat cap
        else if rd.val != 0 then cap else s.vl
      if rs.val == 0 && rd.val == 0 && cap != capacity c s.sew s.lmul
        then throw .invalidVL
      if vl > cap then throw .invalidVL
      return advance (({ s with vl := vl, sew := sew, lmul := lmul, tail := tail }).writeX
        rd (BitVec.ofNat 64 vl))
  | .vmvVI vd imm =>
      requireVector32 c s
      if !groupOK vd s.lmul then throw .illegalVectorGroup
      if s.vl == 0 then return advance s
      return advance (writeVector c s vd 4 s.vl (capacity c 32 s.lmul)
        (fun _ => (BitVec.ofInt 32 imm).toNat))
  | .vle8 vd base =>
      requireVector32 c s
      -- EEW=8, EMUL=LMUL*(8/32), independently of current SEW=32.
      if !groupOK vd (max 1 (s.lmul / 4)) then throw .illegalVectorGroup
      let addr := (s.readX base).toNat
      if s.vl == 0 then return advance s
      if addr + s.vl > s.mem.size then throw .memory
      return advance (writeVector c s vd 1 s.vl (capacity c 32 s.lmul)
        (fun j => s.mem[addr + j]!.toNat))
  | .vzextVF4 vd vs =>
      requireVector32 c s
      if !groupOK vd s.lmul || !groupOK vs (max 1 (s.lmul / 4))
        then throw .illegalVectorGroup
      -- First supported subset requires disjoint widening source/destination.
      if !(vd.val + s.lmul ≤ vs.val || vs.val + max 1 (s.lmul / 4) ≤ vd.val)
        then throw .illegalVectorGroup
      if s.vl == 0 then return advance s
      return advance (writeVector c s vd 4 s.vl (capacity c 32 s.lmul)
        (fun j => s.v[vectorAddress c vs 1 j]!.toNat))
  | .vaddVV vd vs1 vs2 =>
      requireVector32 c s
      if !groupOK vd s.lmul || !groupOK vs1 s.lmul || !groupOK vs2 s.lmul
        then throw .illegalVectorGroup
      if s.vl == 0 then return advance s
      return advance (writeVector c s vd 4 s.vl (capacity c 32 s.lmul)
        (fun j => (readLane32 c s vs1 j + readLane32 c s vs2 j).toNat))
  | .vredsumVS vd vs seed =>
      requireVector32 c s
      if !groupOK vs s.lmul then throw .illegalVectorGroup
      if s.vl == 0 then return advance s
      let sum := (List.range s.vl).foldl
        (fun acc j => acc + readLane32 c s vs j) (readLane32 c s seed 0)
      -- Reduction destination/seed occupy a single register regardless of LMUL.
      return advance (writeVector c s vd 4 1 (capacity c 32 1) (fun _ => sum.toNat))
  | .vmvXS rd vs =>
      requireVector32 c s
      return advance (s.writeX rd ((readLane32 c s vs 0).signExtend 64))
  | .ret => return .returned s

def step (c : Config) (p : Program) (s : State) : Except Fault Transition :=
  match p[s.pc]? with
  | none => .error .badPC
  | some i => execInstr c i s

inductive Outcome where
  | timeout (state : State)
  | fault (reason : Fault) (state : State)
  | returned (state : State)
  deriving Repr

/-- Fuel is for execution/testing only. The public specification uses Exec. -/
def run (c : Config) (p : Program) : Nat → State → Outcome
  | 0, s => .timeout s
  | fuel + 1, s => match step c p s with
    | .error e => .fault e s
    | .ok (.returned t) => .returned t
    | .ok (.next t) => run c p fuel t

/-- Unbounded normal-return semantics, independent of loop shapes. -/
inductive Exec (c : Config) (p : Program) : State → State → Prop where
  | returned : step c p s = .ok (.returned t) → Exec c p s t
  | next : step c p s = .ok (.next u) → Exec c p u t → Exec c p s t

theorem run_sound (c : Config) (p : Program) (fuel : Nat) (s t : State)
    (h : run c p fuel s = .returned t) : Exec c p s t := by
  induction fuel generalizing s with
  | zero => simp [run] at h
  | succ fuel ih =>
    cases hs : step c p s with
    | error e => simp [run, hs] at h
    | ok result =>
      cases result with
      | returned u =>
        simp [run, hs] at h
        subst u
        exact .returned hs
      | next u => exact .next hs (ih u (by simpa [run, hs] using h))

end Assembly
