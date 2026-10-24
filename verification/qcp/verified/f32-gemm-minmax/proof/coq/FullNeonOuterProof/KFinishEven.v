From Coq Require Import ZArith Lia.
From FullDomainNeonVC Require Import neon_full_goal.
From FullNeonOuterProof Require Import FinishCell.
From FullNeonLoopProof Require Import Tail61Assoc.
From GemmNeon Require Import CopyFacts LayoutModel.
From LeaderAutomation Require Import FastFrame.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac forget_uint64_direct p v :=
 match goal with |- ?P |-- ?Q =>
 eapply(derivable1_trans P (undef_store_uint64 p ** _) Q);
 [eapply(derivable1_trans P (store_uint64 p v ** _)(undef_store_uint64 p ** _));
  [LeaderAutomation.FastFrame.pull_cell(store_uint64 p v)
  |apply derivable1_sepcon_mono;[apply store_uint64_undef_store_uint64|apply derivable1_refl]]
 |idtac] end.
Lemma proof_of_test_neon_entail_wit_5_2 : test_neon_entail_wit_5_2.
Proof.
 unfold test_neon_entail_wit_5_2;left;intros.
 subst k;rewrite !Z.sub_0_r in *.
 rewrite !clamped_acc_cell.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 subst a0 a1 a2 a3 c0 c1 c2 c3 w.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];try lia;try ring.
 - unfold UndefStructPredfloat32x4_t.
   rewrite ?neon_local_field_address.
   sepcon_assoc_change.
   forget_fields_direct.
   match goal with |- ?P |-- ?Q =>multimatch Q with context[undef_store_uint64 ?p]=>
   multimatch P with context[store_uint64 p ?v]=>forget_uint64_direct p v end end end.
   LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_5_2.
