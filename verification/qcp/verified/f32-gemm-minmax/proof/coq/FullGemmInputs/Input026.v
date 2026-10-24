From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullGemmGeometry Require Import AddressGeometry.
Require Import FullDomainNeonVC.neon_full_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_26_pure : test_neon_partial_solve_wit_26_pure.
Proof. unfold test_neon_partial_solve_wit_26_pure;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof(input_read_pointer a_pre a3 kc_pre k mr_pre 3 2
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(lia) ltac:(assumption))as[Hb[Hn He]].
 subst a_stride_pre.
 repeat apply _derivable1_andp_intros;apply derivable1s_coq_prop_r;assumption.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_26_pure.
