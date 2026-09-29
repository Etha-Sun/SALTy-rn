import Std

/- Standalone semantic prototype; not part of SALT's compiler or trusted closure.
   Commands are deeply embedded; primitive state operations and guards are Lean
   functions (a shallow expression layer). No C parser or ISA semantics claimed. -/
namespace GeneralLoops

inductive Fault where
  | invalidBlock | outOfBounds
  deriving Repr, DecidableEq

inductive Cmd (σ : Type) where
  | skip
  | atom (action : σ → Except Fault σ)
  | seq (first second : Cmd σ)
  | branch (guard : σ → Bool) (yes no : Cmd σ)
  | loop (guard : σ → Bool) (body : Cmd σ)

def modify (f : σ → σ) : Cmd σ := .atom (fun s => .ok (f s))

/-- C-style for lowering for the subset WITHOUT break/continue/return and with
    pure guards. The guard is re-evaluated on the current state every time. -/
def forC (init : Cmd σ) (guard : σ → Bool) (step body : Cmd σ) : Cmd σ :=
  .seq init (.loop guard (.seq body step))

def doWhile (body : Cmd σ) (guard : σ → Bool) : Cmd σ :=
  .seq body (.loop guard body)

inductive Outcome (σ : Type) where
  | done (state : σ)
  | timeout
  | fault (reason : Fault)

/-- Fuel bounds recursive evaluation depth, NOT a count of machine instructions.
    It is only an execution/debugging mechanism, not the program semantics. -/
def eval : Nat → Cmd σ → σ → Outcome σ
  | 0, _, _ => .timeout
  | _ + 1, .skip, s => .done s
  | _ + 1, .atom f, s =>
      match f s with
      | .ok t => .done t
      | .error e => .fault e
  | fuel + 1, .seq a b, s =>
      match eval fuel a s with
      | .done t => eval fuel b t
      | .timeout => .timeout
      | .fault e => .fault e
  | fuel + 1, .branch g a b, s =>
      if g s then eval fuel a s else eval fuel b s
  | fuel + 1, .loop g body, s =>
      if g s then
        match eval fuel body s with
        | .done t => eval fuel (.loop g body) t
        | .timeout => .timeout
        | .fault e => .fault e
      else .done s

/-- Unbounded big-step semantics of successful executions. Nontermination and
    faults do not have a derivation here; partial correctness alone excludes neither. -/
inductive Exec : Cmd σ → σ → σ → Prop where
  | skip : Exec .skip s s
  | atom : f s = .ok t → Exec (.atom f) s t
  | seq : Exec a s u → Exec b u t → Exec (.seq a b) s t
  | yes : g s = true → Exec a s t → Exec (.branch g a b) s t
  | no : g s = false → Exec b s t → Exec (.branch g a b) s t
  | stop : g s = false → Exec (.loop g body) s s
  | again : g s = true → Exec body s u → Exec (.loop g body) u t →
      Exec (.loop g body) s t

theorem eval_sound (fuel : Nat) (c : Cmd σ) (s t : σ)
    (h : eval fuel c s = .done t) : Exec c s t := by
  induction fuel generalizing c s t with
  | zero => simp [eval] at h
  | succ fuel ih =>
    cases c with
    | skip => simp [eval] at h; subst t; exact .skip
    | atom f =>
      cases hf : f s with
      | error e => simp [eval, hf] at h
      | ok u => simp [eval, hf] at h; subst t; exact .atom hf
    | seq a b =>
      cases ha : eval fuel a s with
      | timeout => simp [eval, ha] at h
      | fault e => simp [eval, ha] at h
      | done u =>
        simp [eval, ha] at h
        exact .seq (ih a s u ha) (ih b u t h)
    | branch g a b =>
      cases hg : g s with
      | false => exact .no hg (ih b s t (by simpa [eval, hg] using h))
      | true => exact .yes hg (ih a s t (by simpa [eval, hg] using h))
    | loop g body =>
      cases hg : g s with
      | false => simp [eval, hg] at h; subst t; exact .stop hg
      | true =>
        cases hb : eval fuel body s with
        | timeout => simp [eval, hg, hb] at h
        | fault e => simp [eval, hg, hb] at h
        | done u =>
          exact .again hg (ih body s u hb)
            (ih (.loop g body) u t (by simpa [eval, hg, hb] using h))

def Hoare (P : σ → Prop) (c : Cmd σ) (Q : σ → Prop) : Prop :=
  ∀ s t, P s → Exec c s t → Q t

theorem hoare_modify (P Q : σ → Prop) (f : σ → σ)
    (h : ∀ s, P s → Q (f s)) : Hoare P (modify f) Q := by
  intro s t hp he
  cases he with
  | atom hf => simp at hf; subst t; exact h s hp

theorem hoare_seq {P I Q : σ → Prop} {a b : Cmd σ}
    (h₁ : Hoare P a I) (h₂ : Hoare I b Q) :
    Hoare P (.seq a b) Q := by
  intro s t hp he
  cases he with
  | seq ha hb => exact h₂ _ _ (h₁ _ _ hp ha) hb

theorem hoare_branch (P Q : σ → Prop) (g : σ → Bool) (a b : Cmd σ)
    (yes : Hoare (fun s => P s ∧ g s = true) a Q)
    (no : Hoare (fun s => P s ∧ g s = false) b Q) :
    Hoare P (.branch g a b) Q := by
  intro s t hp he
  cases he with
  | yes hg ha => exact yes s t ⟨hp, hg⟩ ha
  | no hg hb => exact no s t ⟨hp, hg⟩ hb

theorem hoare_loop (I : σ → Prop) (g : σ → Bool) (body : Cmd σ)
    (preserve : Hoare (fun s => I s ∧ g s = true) body I) :
    Hoare I (.loop g body) (fun s => I s ∧ g s = false) := by
  intro s t hi he
  generalize hc : Cmd.loop g body = c at he
  induction he with
  | stop hg => cases hc; exact ⟨hi, hg⟩
  | again hg hb hl ihb ihl =>
    cases hc
    exact ihl (preserve _ _ ⟨hi, hg⟩ hb) rfl
  | _ => cases hc

/-- The same rule handles for bodies of ANY finite syntax nesting depth. -/
theorem hoare_for (P I Q : σ → Prop) (init step body : Cmd σ) (g : σ → Bool)
    (initProof : Hoare P init I)
    (preserve : Hoare (fun s => I s ∧ g s = true) (.seq body step) I)
    (finish : ∀ s, I s → g s = false → Q s) :
    Hoare P (forC init g step body) Q := by
  intro s t hp he
  have h := hoare_seq initProof (hoare_loop I g (.seq body step) preserve)
  exact finish t (h s t hp he).1 (h s t hp he).2

/- A symbolic nested-for proof: for ANY rows and cols, any successful execution
   increments total exactly rows*cols times. This is not bounded testing. -/
structure Counter where
  i : Nat := 0
  j : Nat := 0
  total : Nat := 0
  deriving Repr, DecidableEq

def innerCount (cols : Nat) : Cmd Counter :=
  forC (modify fun s => {s with j := 0}) (fun s => s.j < cols)
    (modify fun s => {s with j := s.j + 1})
    (modify fun s => {s with total := s.total + 1})

def gridCount (rows cols : Nat) : Cmd Counter :=
  forC (modify fun s => {s with i := 0, total := 0}) (fun s => s.i < rows)
    (modify fun s => {s with i := s.i + 1}) (innerCount cols)

theorem innerCount_correct (cols a : Nat) :
    Hoare (fun s : Counter => s.i = a ∧ s.total = a * cols)
      (innerCount cols)
      (fun s => s.i = a ∧ s.total = (a + 1) * cols) := by
  unfold innerCount
  refine hoare_for _ (fun s => s.i = a ∧ s.j ≤ cols ∧ s.total = a * cols + s.j)
    _ _ _ _ _ ?_ ?_ ?_
  · apply hoare_modify; intro s h; simpa using h
  · refine hoare_seq (I := fun s => s.i = a ∧ s.j < cols ∧
      s.total = a * cols + s.j + 1) ?_ ?_
    · apply hoare_modify; intro s h; simp_all <;> omega
    · apply hoare_modify; intro s h; simp_all; omega
  · intro s hi hg
    have hge : cols ≤ s.j := by simpa using hg
    rcases hi with ⟨hi, hj, ht⟩
    have heq : s.j = cols := by omega
    exact ⟨hi, by simpa [heq, Nat.add_mul] using ht⟩

theorem gridCount_correct (rows cols : Nat) :
    Hoare (fun _ => True) (gridCount rows cols)
      (fun s => s.total = rows * cols) := by
  unfold gridCount
  refine hoare_for _ (fun s => s.i ≤ rows ∧ s.total = s.i * cols)
    _ _ _ _ _ ?_ ?_ ?_
  · apply hoare_modify; intro s _; simp
  · refine hoare_seq (I := fun s => s.i < rows ∧ s.total = (s.i + 1) * cols) ?_ ?_
    · intro s t hi he
      have ht := innerCount_correct cols s.i s t ⟨rfl, hi.1.2⟩ he
      simp_all
    · apply hoare_modify; intro s h; simp_all; omega
  · intro s hi hg
    have heq : s.i = rows := by simp_all; omega
    simpa [heq] using hi.2

/-- Termination is proved separately with a decreasing natural-number rank.
    The body can itself contain loops; its termination is an explicit premise. -/
theorem loop_terminates (I : σ → Prop) (g : σ → Bool) (body : Cmd σ)
    (rank : σ → Nat)
    (progress : ∀ s, I s → g s = true →
      ∃ u, Exec body s u ∧ I u ∧ rank u < rank s)
    (s : σ) (hs : I s) : ∃ t, Exec (.loop g body) s t ∧ I t := by
  have aux : ∀ n s, rank s = n → I s → ∃ t, Exec (.loop g body) s t ∧ I t := by
    intro n
    induction n using Nat.strongRecOn with
    | ind n ih =>
      intro s hn hs
      cases hg : g s with
      | false => exact ⟨s, .stop hg, hs⟩
      | true =>
        obtain ⟨u, hb, hu, hlt⟩ := progress s hs hg
        obtain ⟨t, ht, hit⟩ := ih (rank u) (by omega) u rfl hu
        exact ⟨t, .again hg hb ht, hit⟩
  exact aux (rank s) s rfl hs

theorem innerCount_terminates (cols : Nat) (s : Counter) :
    ∃ t, Exec (innerCount cols) s t ∧ t.i = s.i := by
  let start : Counter := {s with j := 0}
  obtain ⟨t, ht, hi⟩ := loop_terminates (fun t : Counter => t.i = s.i)
    (fun t => t.j < cols)
    (.seq (modify fun t => {t with total := t.total + 1})
      (modify fun t => {t with j := t.j + 1}))
    (fun t => cols - t.j) (by
      intro t hi hg
      let u : Counter := {t with total := t.total + 1}
      let v : Counter := {u with j := t.j + 1}
      refine ⟨v, .seq (.atom rfl) (.atom rfl), hi, ?_⟩
      have hj : t.j < cols := of_decide_eq_true hg
      dsimp [v, u]
      omega) start rfl
  exact ⟨t, .seq (.atom rfl) ht, hi⟩

theorem gridCount_terminates (rows cols : Nat) (s : Counter) :
    ∃ t, Exec (gridCount rows cols) s t := by
  let start : Counter := {s with i := 0, total := 0}
  obtain ⟨t, ht, _⟩ := loop_terminates (fun _ : Counter => True)
    (fun t => t.i < rows)
    (.seq (innerCount cols) (modify fun t => {t with i := t.i + 1}))
    (fun t => rows - t.i) (by
      intro t _ hg
      obtain ⟨u, hb, hi⟩ := innerCount_terminates cols t
      let v : Counter := {u with i := u.i + 1}
      refine ⟨v, .seq hb (.atom rfl), trivial, ?_⟩
      have hlt : t.i < rows := of_decide_eq_true hg
      dsimp [v]
      omega) start trivial
  exact ⟨t, .seq (.atom rfl) ht⟩

/-- Unbounded total-correctness result for the nested-loop example. -/
theorem gridCount_total (rows cols : Nat) (s : Counter) :
    ∃ t, Exec (gridCount rows cols) s t ∧ t.total = rows * cols := by
  obtain ⟨t, ht⟩ := gridCount_terminates rows cols s
  exact ⟨t, ht, gridCount_correct rows cols s t trivial ht⟩

/-- A separate all-input termination witness for a data-dependent while loop.
    `Exec` existence shows successful termination, not just partial correctness. -/
def countdown : Cmd Nat := .loop (fun n => n > 0) (modify (fun n => n - 1))

theorem countdown_terminates (n : Nat) : Exec countdown n 0 := by
  induction n with
  | zero => exact .stop rfl
  | succ n ih =>
    apply Exec.again (u := n) (by simp)
    · apply Exec.atom; simp
    · exact ih

/- Minimal explicit memory: allocated blocks of initialized 32-bit words.
   Offsets count WORDS, not bytes. Same block+offset means aliasing. -/
abbrev Word := BitVec 32
abbrev Memory := Array (Array Word)
structure Ptr where
  block : Nat
  offset : Nat
  deriving Repr, DecidableEq

def load (mem : Memory) (p : Ptr) : Except Fault Word := do
  let some block := mem[p.block]? | throw .invalidBlock
  let some value := block[p.offset]? | throw .outOfBounds
  return value

def store (mem : Memory) (p : Ptr) (value : Word) : Except Fault Memory := do
  let some block := mem[p.block]? | throw .invalidBlock
  if p.offset < block.size then
    return mem.set! p.block (block.set! p.offset value)
  else throw .outOfBounds

structure State where
  vars : Nat → Nat := fun _ => 0
  mem : Memory := #[]

def assign (v : Nat) (e : State → Nat) : Cmd State :=
  modify fun s => {s with vars := fun x => if x = v then e s else s.vars x}

def forRange (v : Nat) (bound : State → Nat) (body : Cmd State) : Cmd State :=
  forC (assign v (fun _ => 0)) (fun s => s.vars v < bound s)
    (assign v (fun s => s.vars v + 1)) body

def writeAt (p : State → Ptr) (value : State → Word) : Cmd State :=
  .atom fun s => (store s.mem (p s) (value s)).map fun m => {s with mem := m}

def copyAt (src dst : State → Ptr) : Cmd State := .atom fun s => do
  let value ← load s.mem (src s)
  let mem ← store s.mem (dst s) value
  return {s with mem := mem}

/-- Three nested for loops; branches and memory operations inside the innermost.
    This is integer indexing/word storage, not an FP GEMM implementation. -/
def fill3D (a b c : Nat) : Cmd State :=
  forRange 0 (fun _ => a) <| forRange 1 (fun _ => b) <| forRange 2 (fun _ => c) <|
    .branch (fun s => (s.vars 0 + s.vars 1 + s.vars 2) % 2 == 0)
      (writeAt (fun s => ⟨0, (s.vars 0 * b + s.vars 1) * c + s.vars 2⟩)
        (fun _ => 10))
      (writeAt (fun s => ⟨0, (s.vars 0 * b + s.vars 1) * c + s.vars 2⟩)
        (fun _ => 20))

/-- A triangular iteration space: the inner bound depends on the outer index. -/
def triangle (n : Nat) : Cmd State :=
  .seq (assign 2 (fun _ => 0)) <|
    forRange 0 (fun _ => n) <| forRange 1 (fun s => s.vars 0 + 1) <|
      assign 2 (fun s => s.vars 2 + 1)

/-- A real C-style loop whose bound changes in its body and step is +2. -/
def changingBound : Cmd State :=
  .seq (assign 1 (fun _ => 7)) <|
    forC (assign 0 (fun _ => 0)) (fun s => s.vars 0 < s.vars 1)
      (assign 0 (fun s => s.vars 0 + 2)) (assign 1 (fun s => s.vars 1 - 1))

/-- Streaming overlapping copy, deliberately NOT a memmove specification. -/
def forwardCopy : Cmd State := forRange 0 (fun _ => 3) <|
  copyAt (fun s => ⟨0, s.vars 0⟩) (fun s => ⟨0, s.vars 0 + 1⟩)

/-- No fixed syntax nesting limit: n creates n nested loops. -/
def arbitraryNest : Nat → Cmd State
  | 0 => assign 0 (fun s => s.vars 0 + 1)
  | depth + 1 => forRange (depth + 1) (fun _ => 2) (arbitraryNest depth)

def resultWords (r : Outcome State) : Except String (List Nat) :=
  match r with
  | .done s => .ok ((s.mem[0]?.getD #[]).toList.map BitVec.toNat)
  | .timeout => .error "timeout"
  | .fault .invalidBlock => .error "fault: invalidBlock"
  | .fault .outOfBounds => .error "fault: outOfBounds"

def resultVar (v : Nat) (r : Outcome State) : Option Nat :=
  match r with | .done s => some (s.vars v) | _ => none

def initialized : State := {mem := #[Array.replicate 12 (0 : Word)]}
def aliasMemory : State := {mem := #[#[1, 2, 3, 4]]}

example : resultWords (eval 100 (fill3D 2 2 3) initialized) =
    .ok [10,20,10,20,10,20,20,10,20,10,20,10] := by rfl
example : resultVar 2 (eval 100 (triangle 4) {}) = some 10 := by decide
example : resultVar 0 (eval 100 changingBound {}) = some 6 := by decide
example : resultVar 1 (eval 100 changingBound {}) = some 4 := by decide
example : resultWords (eval 100 forwardCopy aliasMemory) = .ok [1,1,1,1] := by rfl
example : resultVar 0 (eval 100 (arbitraryNest 5) {}) = some 32 := by decide
-- Concrete reduction builds many functional environment updates. This local
-- elaborator limit is not a language nesting bound or a proof assumption.
set_option maxRecDepth 4096 in
example : resultVar 0 (eval 100 (arbitraryNest 6) {}) = some 64 := by decide
example : load aliasMemory.mem ⟨0, 4⟩ = .error .outOfBounds := by rfl
example : store aliasMemory.mem ⟨1, 0⟩ 7 = .error .invalidBlock := by rfl
example : resultWords (eval 100 (writeAt (fun _ => ⟨0,12⟩) (fun _ => 7)) initialized) =
    .error "fault: outOfBounds" := by rfl
example : resultVar 0 (eval 10 (.loop (fun _ => true) .skip) ({} : State)) = none := by decide
example : eval 10 (.loop (fun _ => true) .skip) ({} : State) = .timeout := by rfl
example : eval 0 (.skip : Cmd State) {} = .timeout := by rfl
example : resultVar 0 (eval 10 (doWhile (assign 0 (fun s => s.vars 0 + 1))
    (fun _ => false)) {}) = some 1 := by decide
example : resultWords (eval 100 (fill3D 2 2 3)
    {mem := #[Array.replicate 11 (0 : Word)]}) = .error "fault: outOfBounds" := by rfl
example : resultWords (eval 10 (forRange 0 (fun _ => 0)
    (writeAt (fun _ => ⟨0,100⟩) (fun _ => 7))) aliasMemory) =
    .ok [1,2,3,4] := by rfl
example : resultWords (eval 10 (.branch (fun _ => false)
    (writeAt (fun _ => ⟨0,100⟩) (fun _ => 7)) .skip) aliasMemory) =
    .ok [1,2,3,4] := by rfl

#eval resultWords (eval 100 (fill3D 2 2 3) initialized)
#eval resultVar 2 (eval 100 (triangle 4) {})
#eval resultWords (eval 100 forwardCopy aliasMemory)
#eval resultVar 0 (eval 100 (arbitraryNest 5) {})
#print axioms eval_sound
#print axioms hoare_loop
#print axioms gridCount_correct
#print axioms loop_terminates
#print axioms gridCount_total
#print axioms countdown_terminates

end GeneralLoops
