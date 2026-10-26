From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlSupport NeonKernelMemoryFinishSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_12_1:ArgmaxPool.annotated_goal.test_rvv_entail_wit_12_1.
Proof.  unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_12_1;apb_intro;Left;apkm_int_prepare;rewrite ?Z.add_0_r,?Z.add_0_l,?Z.mul_0_r,?Z.mul_0_l in *;apkm_frame.  Qed.
Print Assumptions proof_of_test_rvv_entail_wit_12_1.
