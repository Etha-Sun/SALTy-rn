From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullGemmGeometry Require Import PackedGeometry.
From FullDomainNeon Require Import FullNeonModel.
Require Import FullDomainNeonVC.neon_full_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_30_pure : test_neon_partial_solve_wit_30_pure.
Proof. unfold test_neon_partial_solve_wit_30_pure;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
pose proof(packed_read_pointer w_pre (w+16) kc_pre k nc_pre nc 4 4
   ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(assumption)
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(subst w;ring))as[Hb[Hn He]].
 subst a_stride_pre.
 try rewrite Z.add_0_r in Hb,Hn,He.
 repeat apply _derivable1_andp_intros;apply derivable1s_coq_prop_r;assumption.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_30_pure.
