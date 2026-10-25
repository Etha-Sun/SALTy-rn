From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_return_wit_1:DwChw.rvv_unit_goal.test_rvv_return_wit_1.
Proof. unfold DwChw.rvv_unit_goal.test_rvv_return_wit_1;right;intros;subst;rewrite Z.sub_0_r;entailer!. Qed.
Print Assumptions proof_of_test_rvv_return_wit_1.
