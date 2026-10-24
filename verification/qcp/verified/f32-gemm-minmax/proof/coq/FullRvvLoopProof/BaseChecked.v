From Coq Require Import ZArith Lia.
From GemmFullRvvVC15 Require Import unit_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module RvvBaseChecked.
Lemma proof_of_test_rvv_return_wit_1 : test_rvv_return_wit_1.
Proof. unfold test_rvv_return_wit_1;left;intros;subst nc;rewrite Z.sub_0_r;apply derivable1_refl. Qed.
End RvvBaseChecked.
Print Assumptions RvvBaseChecked.proof_of_test_rvv_return_wit_1.
