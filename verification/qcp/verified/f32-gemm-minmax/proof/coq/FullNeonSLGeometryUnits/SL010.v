From FullGemmGeometry Require Import Geometry AddressGeometry PackedGeometry.
From FullDomainNeon Require Import FullNeonModel.
From FullNeonSL Require Import FrameSupport.
From FullDomainNeonVC Require Import neon_full_goal.
From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_10 : test_neon_partial_solve_wit_10.
Proof. unfold test_neon_partial_solve_wit_10,test_neon_partial_solve_wit_10_aux; intros;
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
match goal with H:fulln_outer_ptrs _ _ _ _ _ _ _ _ _ _ _ _ _ _ |- _ =>
   pose proof H as Houter;unfold fulln_outer_ptrs in H;destruct H as[Hbad|[Hrem Hrest]];[exfalso;lia|] end.
pose proof(bias_read_pointer w_pre (w+0) kc_pre nc_pre nc 0 4
   ltac:(lia) ltac:(lia) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
   ltac:(subst w;ring))as[Hb[Hn He]].
 subst a_stride_pre.
 try rewrite Z.add_0_r in Hb,Hn,He.
full_neon_frame. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_10.
End Checked.
