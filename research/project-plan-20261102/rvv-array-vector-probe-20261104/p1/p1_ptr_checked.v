(* Hand-written proofs for every VC of probe 1 (array-field vector, pointer form, VLMAX=128).
   No Admitted / Axiom: the generated proof_auto file (all Admitted) is NOT used. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Lists.List.
Require Import Coq.micromega.Psatz.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From Probe1 Require Import p1_ptr_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Local Open Scope sac.

Lemma sublist_snoc_Znth : forall (l : list Z) i,
  0 <= i < Zlength l ->
  sublist 0 i l ++ (Znth i l 0 :: nil) = sublist 0 (i + 1) l.
Proof.
  intros.
  rewrite (sublist_split 0 (i + 1) i l) by lia.
  f_equal.
  rewrite (sublist_single 0 i l) by lia.
  reflexivity.
Qed.

Lemma sublist_full_len : forall (l : list Z) n,
  Zlength l = n -> sublist 0 n l = l.
Proof.
  intros. subst. apply sublist_self. reflexivity.
Qed.

(* ---------- vload ---------- *)

Lemma proof_of_vload_safety_wit_1 : vload_safety_wit_1.
Proof. pre_process; try entailer!. Qed.

Lemma proof_of_vload_safety_wit_2 : vload_safety_wit_2.
Proof. pre_process; try entailer!. Qed.

Lemma proof_of_vload_entail_wit_1 : vload_entail_wit_1.
Proof.
  right. pre_process; try entailer!.
  all: try (apply sublist_nil; lia).
Qed.

Lemma proof_of_vload_entail_wit_2 : vload_entail_wit_2.
Proof.
  left. pre_process.
  prop_apply (IntArray.full_Zlength p_pre). Intros.
  rewrite sublist_snoc_Znth by lia.
  entailer!.
Qed.

Lemma proof_of_vload_return_wit_1 : vload_return_wit_1.
Proof.
  left. pre_process.
  prop_apply (IntArray.full_Zlength p_pre). Intros.
  assert (i = vl_pre) by lia. subst i.
  rewrite sublist_full_len by lia.
  entailer!.
Qed.

Lemma proof_of_vload_partial_solve_wit_1 : vload_partial_solve_wit_1.
Proof.
  pre_process.
  sep_apply (IntArray.full_split_to_missing_i p_pre i vl_pre L0 0); [ | lia].
  entailer!.
Qed.

Lemma proof_of_vload_partial_solve_wit_2 : vload_partial_solve_wit_2.
Proof.
  pre_process.
  rewrite IntArray.undef_seg_unfold; try lia.
  entailer!.
Qed.

(* ---------- vstore ---------- *)

Lemma proof_of_vstore_safety_wit_1 : vstore_safety_wit_1.
Proof. pre_process; try entailer!. Qed.

Lemma proof_of_vstore_safety_wit_2 : vstore_safety_wit_2.
Proof. pre_process; try entailer!. Qed.

Lemma proof_of_vstore_entail_wit_1 : vstore_entail_wit_1.
Proof.
  right. pre_process; try entailer!.
  all: try (apply sublist_nil; lia).
Qed.

Lemma proof_of_vstore_entail_wit_2 : vstore_entail_wit_2.
Proof.
  left. pre_process.
  prop_apply (IntArray.seg_Zlength (&( (a_pre) # "vint32m8_t" ->ₛ "s"))). Intros.
  replace (i - 0) with i by lia.
  rewrite sublist_snoc_Znth by lia.
  entailer!.
Qed.

Lemma proof_of_vstore_return_wit_1 : vstore_return_wit_1.
Proof.
  left. pre_process.
  prop_apply (IntArray.seg_Zlength (&( (a_pre) # "vint32m8_t" ->ₛ "s"))). Intros.
  assert (i = vl_pre) by lia. subst i.
  rewrite sublist_full_len by lia.
  rewrite IntArray.undef_seg_empty.
  sep_apply (IntArray.seg_to_full p_pre 0 vl_pre L0).
  rewrite ?Z.mul_0_l, ?Z.add_0_r, ?Z.sub_0_r.
  entailer!.
Qed.

Lemma proof_of_vstore_partial_solve_wit_1 : vstore_partial_solve_wit_1.
Proof.
  pre_process.
  sep_apply (IntArray.seg_split_to_missing_i (&( (a_pre) # "vint32m8_t" ->ₛ "s")) 0 i vl_pre L0 0); [ | lia].
  entailer!.
Qed.

Lemma proof_of_vstore_partial_solve_wit_2 : vstore_partial_solve_wit_2.
Proof.
  pre_process.
  rewrite IntArray.undef_seg_unfold; try lia.
  entailer!.
Qed.
