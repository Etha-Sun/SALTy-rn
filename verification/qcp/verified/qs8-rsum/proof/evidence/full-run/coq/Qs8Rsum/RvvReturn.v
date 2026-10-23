From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import Types MemoryModel RvvFacts FastFrame rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_return_wit_1 : Qs8Rsum.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold Qs8Rsum.rvv_unit_goal.test_rvv_return_wit_1;left;intros.
 assert(Hbatch:batch=0)by lia;subst.
 try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *.
 rewrite signed_unsigned_add_l,signed_unsigned_add_r by lia;fold rs_s32.
 rewrite rs_reduction_total by lia.
 match goal with H:context[rs_acc_total] |- _=>rewrite H end.
 unfold rs_s32;rewrite signed_signed_add_r by lia.
 replace(batch_pre-0)with batch_pre by lia.
 exact(derivable1_refl _).
Qed.
Print Assumptions proof_of_test_rvv_return_wit_1.
