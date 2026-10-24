From Coq Require Import ZArith Lia.
From Dwconv Require Import RvvKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_return_wit_1:Dwconv.rvv_unit_goal.test_rvv_return_wit_1.
Proof. unfold Dwconv.rvv_unit_goal.test_rvv_return_wit_1;left;dw_prepare;unfold dw_rvv_progress,dw_rvv_result;rewrite Z.sub_0_r;reflexivity. Qed.
Print Assumptions proof_of_test_rvv_return_wit_1.
