From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import Types MemoryModel RvvFacts FastFrame rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_return_wit_1 : Qu8Rsum.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold Qu8Rsum.rvv_unit_goal.test_rvv_return_wit_1;left;intros.
 assert(Hbatch:batch=0)by lia;subst.
 try change Int.max_unsigned with 4294967295 in *.
 fold rs_u32.
 rewrite rs_reduction_total by lia.
 match goal with H:context[rs_acc_total] |- _=>rewrite H end.
 unfold rs_u32;rewrite unsigned_unsigned_add_r by lia.
 replace(batch_pre-0)with batch_pre by lia.
 exact(derivable1_refl _).
Qed.
Print Assumptions proof_of_test_rvv_return_wit_1.
