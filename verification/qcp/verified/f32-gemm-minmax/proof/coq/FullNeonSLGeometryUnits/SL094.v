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
Lemma proof_of_test_neon_partial_solve_wit_94 : test_neon_partial_solve_wit_94.
Proof. unfold test_neon_partial_solve_wit_94,test_neon_partial_solve_wit_94_aux; intros;
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
assert(Hkmin:4<=k).
   {pose proof(Z.quot_rem k 4 ltac:(lia))as Ek;
   match goal with H:Z.rem k 4=0 |- _ =>rewrite H in Ek end;lia. }
pose proof(packed_read_pointer w_pre (w+16) kc_pre k nc_pre nc 4 4
   ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(assumption)
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(subst w;ring))as[Hb[Hn He]].
 subst a_stride_pre.
 try rewrite Z.add_0_r in Hb,Hn,He.
full_neon_frame. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_94.
End Checked.
