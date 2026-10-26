From Coq Require Import ZArith Lia.
From Coq Require Import ZArith.Zbitwise.
From HwcConv Require Import support_unit_goal SupportModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma hc_round_model_exact:forall n, Z.land n(Z.lnot 3)=hc_round_model n.
Proof. intro n;unfold hc_round_model;rewrite<-Z.sub_land_same_l.
 change 3 with(Z.ones 2);rewrite Z.land_ones by lia;reflexivity. Qed.
Module CheckedSupport:HwcConv.support_unit_goal.VC_Correct.
Lemma proof_of_hc_round_down4_safety_wit_1:HwcConv.support_unit_goal.hc_round_down4_safety_wit_1.
Proof. unfold HwcConv.support_unit_goal.hc_round_down4_safety_wit_1;intros;entailer!;unfold INT_MAX,INT_MIN;lia. Qed.
Lemma proof_of_hc_round_down4_return_wit_1:HwcConv.support_unit_goal.hc_round_down4_return_wit_1.
Proof. unfold HwcConv.support_unit_goal.hc_round_down4_return_wit_1;left;intros;rewrite hc_round_model_exact;entailer!. Qed.
Lemma proof_of_hc_doz_safety_wit_1:HwcConv.support_unit_goal.hc_doz_safety_wit_1.
Proof. unfold HwcConv.support_unit_goal.hc_doz_safety_wit_1;intros;entailer!;unfold INT_MAX,INT_MIN;lia. Qed.
Lemma proof_of_hc_doz_return_wit_1:HwcConv.support_unit_goal.hc_doz_return_wit_1.
Proof. unfold HwcConv.support_unit_goal.hc_doz_return_wit_1;left;intros;unfold hc_doz_model;rewrite Z.max_r by lia;entailer!. Qed.
Lemma proof_of_hc_doz_return_wit_2:HwcConv.support_unit_goal.hc_doz_return_wit_2.
Proof. unfold HwcConv.support_unit_goal.hc_doz_return_wit_2;left;intros;unfold hc_doz_model;rewrite Z.max_l by lia;entailer!. Qed.
End CheckedSupport.
Module ExactSecond:HwcConv.support_unit_goal.VC_Correct:=CheckedSupport.
Print Assumptions hc_round_model_exact.
Print Assumptions CheckedSupport.proof_of_hc_round_down4_safety_wit_1.
Print Assumptions CheckedSupport.proof_of_hc_round_down4_return_wit_1.
Print Assumptions CheckedSupport.proof_of_hc_doz_safety_wit_1.
Print Assumptions CheckedSupport.proof_of_hc_doz_return_wit_1.
Print Assumptions CheckedSupport.proof_of_hc_doz_return_wit_2.
