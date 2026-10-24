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
Lemma proof_of_test_neon_partial_solve_wit_84 : test_neon_partial_solve_wit_84.
Proof. unfold test_neon_partial_solve_wit_84,test_neon_partial_solve_wit_84_aux; intros;
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 assert(Hkmin:4<=k).
 {pose proof(Z.quot_rem k 4 ltac:(lia))as Ek;
 match goal with H:Z.rem k 4=0 |- _ =>rewrite H in Ek end;lia. }
 pose proof(input_read_pointer a_pre a0 kc_pre k mr_pre 0 1
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(lia) ltac:(assumption))as[Hb[Hn He]].
 subst a_stride_pre.
full_neon_frame. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_84.
End Checked.
