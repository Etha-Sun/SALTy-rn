From Coq Require Import ZArith Lia.
From FullDomainNeonVC Require Import neon_full_goal.
From GemmNeon Require Import CopyFacts.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module BaseChecked.
Lemma proof_of_test_neon_return_wit_1 : test_neon_return_wit_1.
Proof. unfold test_neon_return_wit_1; left; intros; subst nc; rewrite Z.sub_0_r; apply derivable1_refl. Qed.
Lemma proof_of_test_neon_entail_wit_2 : test_neon_entail_wit_2.
Proof.
 unfold test_neon_entail_wit_2; intros.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop; intros; repeat split; assumption.
 - apply derivable1_refl.
Qed.
End BaseChecked.
Print Assumptions BaseChecked.proof_of_test_neon_return_wit_1.
Print Assumptions BaseChecked.proof_of_test_neon_entail_wit_2.
