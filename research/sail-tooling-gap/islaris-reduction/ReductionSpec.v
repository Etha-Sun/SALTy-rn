(* Agent-written contract for kernels/{source,target}/qu8-rsum.c.
   This file defines the desired observation, NOT an ISA implementation.
   No theorem below claims that the machine code implements this contract. *)
From Coq Require Import ZArith List Lia Bool String.
Import ListNotations.
Open Scope Z_scope.

Definition modulus : Z := 4294967296.
Definition byte_ok (b : Z) : Prop := 0 <= b < 256.
Definition memory := Z -> option Z.

Fixpoint byte_sum (xs : list Z) : Z :=
  match xs with [] => 0 | b :: rest => b + byte_sum rest end.

Definition reduction_result (old : Z) (xs : list Z) : Z :=
  (old + byte_sum xs) mod modulus.

Definition read32 (m : memory) (p old : Z) : Prop :=
  exists b0 b1 b2 b3,
    m p = Some b0 /\ m (p+1) = Some b1 /\
    m (p+2) = Some b2 /\ m (p+3) = Some b3 /\
    Forall byte_ok [b0;b1;b2;b3] /\
    old = b0 + 256*b1 + 65536*b2 + 16777216*b3.

Definition write32 (m : memory) (p value : Z) : memory :=
  fun a => if (p <=? a) && (a <? p+4)
           then Some ((value / (256 ^ (a-p))) mod 256)
           else m a.

Definition input_bytes (m : memory) (p : Z) (xs : list Z) : Prop :=
  Forall byte_ok xs /\
  forall i b, nth_error xs i = Some b -> m (p + Z.of_nat i) = Some b.

(* Permissions and code layout must additionally be supplied by the concrete
   ISA proof. Input/output overlap is permitted: all inputs and old output
   are observed in the initial memory, before the sole final store. *)
Definition legal_call (m : memory) (input output n old : Z)
    (xs : list Z) : Prop :=
  0 < n /\ n = Z.of_nat (List.length xs) /\
  0 < input /\ input+n < 2^64 /\
  0 < output /\ output+4 < 2^64 /\ output mod 4 = 0 /\
  input_bytes m input xs /\ read32 m output old.

(* Exact final memory: includes ALL addresses, not just the output word. *)
Definition reduction_post (before after : memory) (output old : Z)
    (xs : list Z) : Prop :=
  forall a, after a = write32 before output (reduction_result old xs) a.

(* The ISA adapter chooses its ABI's preserved-register identifiers. This
   intentionally does not equate caller-saved NEON and RVV scratch registers.
   Timing, instruction count, and microarchitectural state are not observations
   in this functional-equivalence contract. *)
Record call_observation := {
  observed_memory : memory;
  observed_pc : Z;
  observed_register : string -> option Z;
  observed_exception : option Z
}.

Definition function_post (preserved : list string) (return_address : Z)
    (before after : call_observation) (output old : Z) (xs : list Z) : Prop :=
  observed_pc after = return_address /\
  observed_exception after = None /\
  (forall r, In r preserved -> observed_register after r = observed_register before r) /\
  reduction_post (observed_memory before) (observed_memory after) output old xs.

(* Termination is an additional obligation, not a partial-correctness premise.
   This predicate requires a uniform finite return bound from each initial
   state. step/returned are to be instantiated with the actual ISA semantics;
   doing so, and proving it, is outstanding. *)
Inductive steps {S : Type} (step : S -> S -> Prop) : nat -> S -> S -> Prop :=
| steps_zero s : steps step O s s
| steps_succ k s t u : step s t -> steps step k t u -> steps step (Datatypes.S k) s u.

Definition total_contract {S : Type} (step : S -> S -> Prop)
    (returned : S -> Prop) (observe : S -> call_observation)
    (preserved : list string) (return_address : Z)
    (initial : S) (output old : Z) (xs : list Z) : Prop :=
  (exists fuel, forall k final, steps step k initial final ->
     (k >= fuel)%nat -> returned final) /\
  (forall k state, steps step k initial state ->
     returned state \/ exists next, step state next) /\
  (forall k final, steps step k initial final -> returned final ->
     function_post preserved return_address (observe initial) (observe final) output old xs).

Lemma byte_sum_app xs ys : byte_sum (xs ++ ys) = byte_sum xs + byte_sum ys.
Proof. induction xs; simpl; lia. Qed.

Lemma reduction_chunking old xs ys :
  reduction_result (reduction_result old xs) ys = reduction_result old (xs ++ ys).
Proof.
  unfold reduction_result. rewrite byte_sum_app.
  rewrite Z.add_mod_idemp_l by (unfold modulus; lia).
  f_equal. lia.
Qed.

Lemma reduction_range old xs : 0 <= reduction_result old xs < modulus.
Proof. apply Z.mod_pos_bound. unfold modulus; lia. Qed.

Lemma frame_unchanged before after output old xs a :
  reduction_post before after output old xs ->
  (a < output \/ output+4 <= a) -> after a = before a.
Proof.
  intros Hpost Houtside. rewrite Hpost. unfold write32.
  destruct (output <=? a) eqn:Hl; simpl; [|reflexivity].
  apply Z.leb_le in Hl.
  destruct (a <? output+4) eqn:Hr; [|reflexivity].
  apply Z.ltb_lt in Hr. lia.
Qed.

(* This is why an EXACT common spec suffices; no weak output relation. *)
Lemma common_spec_pointwise_equivalence before neon rvv output old xs :
  reduction_post before neon output old xs ->
  reduction_post before rvv output old xs ->
  forall a, neon a = rvv a.
Proof. intros Hn Hr a. rewrite Hn, Hr. reflexivity. Qed.

Example overflow_is_defined : reduction_result 4294967280 [255] = 239.
Proof. reflexivity. Qed.

Print Assumptions reduction_chunking.
Print Assumptions common_spec_pointwise_equivalence.
