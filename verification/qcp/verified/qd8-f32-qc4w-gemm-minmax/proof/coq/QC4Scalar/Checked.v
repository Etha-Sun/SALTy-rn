From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QC4W Require Import ApiModel.
From QC4Scalar Require Import scalar_nan_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma ig_self_compare : forall x,
 fp32_compare x x = if Binary.is_nan 24 128 x then None else Some Eq.
Proof.
 intros x;unfold fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare.
 destruct x as[s|s|s p H|s m e H];
  cbn [Binary.B2BSN BinarySingleNaN.B2SF Binary.is_nan SpecFloat.SFcompare];
  try reflexivity.
 - destruct s;reflexivity.
 - destruct s;cbn [SpecFloat.SFcompare];rewrite Z.compare_refl;
   rewrite Pos.compare_refl;reflexivity.
Qed.
Lemma ig_self_eq_nan_false : forall x,
 fp32_eq x x -> Binary.is_nan 24 128 x=false.
Proof.
 intros x H;unfold fp32_eq in H;rewrite ig_self_compare in H.
 destruct (Binary.is_nan 24 128 x);congruence.
Qed.
Lemma ig_self_ne_nan_true : forall x,
 fp32_ne x x -> Binary.is_nan 24 128 x=true.
Proof.
 intros x H;unfold fp32_ne in H;rewrite ig_self_compare in H.
 destruct (Binary.is_nan 24 128 x);congruence.
Qed.

Module Checked <: VC_Correct.
Lemma proof_of_qcp_identity_return_wit_1:qcp_identity_return_wit_1.
Proof. left;intros;unfold qc4_bit_same;entailer!. Qed.
Lemma proof_of_qcp_isnan_safety_wit_1:qcp_isnan_safety_wit_1.
Proof. unfold qcp_isnan_safety_wit_1;intros;entailer!. Qed.
Lemma proof_of_qcp_isnan_safety_wit_2:qcp_isnan_safety_wit_2.
Proof. unfold qcp_isnan_safety_wit_2;intros;entailer!. Qed.
Lemma proof_of_qcp_isnan_return_wit_1:qcp_isnan_return_wit_1.
Proof.
 left;intros;unfold qc4_bit_same in *;subst.
 apply ig_self_eq_nan_false in PreH1.
 unfold qc4_nan_flag;rewrite PreH1;entailer!.
Qed.
Lemma proof_of_qcp_isnan_return_wit_2:qcp_isnan_return_wit_2.
Proof.
 left;intros;unfold qc4_bit_same in *;subst.
 apply ig_self_ne_nan_true in PreH1.
 unfold qc4_nan_flag;rewrite PreH1;entailer!.
Qed.
Lemma proof_of_qcp_isnan_partial_solve_wit_1:qcp_isnan_partial_solve_wit_1.
Proof. apply derivable1_refl. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_identity_return_wit_1.
Print Assumptions Checked.proof_of_qcp_isnan_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_isnan_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_isnan_return_wit_1.
Print Assumptions Checked.proof_of_qcp_isnan_return_wit_2.
Print Assumptions Checked.proof_of_qcp_isnan_partial_solve_wit_1.
