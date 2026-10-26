From HwcConv Require Import Main401CallTactics Main401WindowFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Type PRESENT16.
Parameter proof_of_test_rvv_partial_solve_wit_22_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_22_pure.
Parameter proof_of_test_rvv_partial_solve_wit_25_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_25_pure.
Parameter proof_of_test_rvv_partial_solve_wit_28_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_28_pure.
Parameter proof_of_test_rvv_partial_solve_wit_31_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_31_pure.
Parameter proof_of_test_rvv_partial_solve_wit_34_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_34_pure.
Parameter proof_of_test_rvv_partial_solve_wit_37_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_37_pure.
Parameter proof_of_test_rvv_partial_solve_wit_40_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_40_pure.
Parameter proof_of_test_rvv_partial_solve_wit_43_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_43_pure.
Parameter proof_of_test_rvv_partial_solve_wit_46_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_46_pure.
Parameter proof_of_test_rvv_partial_solve_wit_49_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_49_pure.
Parameter proof_of_test_rvv_partial_solve_wit_52_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_52_pure.
Parameter proof_of_test_rvv_partial_solve_wit_55_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_55_pure.
Parameter proof_of_test_rvv_partial_solve_wit_58_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_58_pure.
Parameter proof_of_test_rvv_partial_solve_wit_61_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_61_pure.
Parameter proof_of_test_rvv_partial_solve_wit_64_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_64_pure.
Parameter proof_of_test_rvv_partial_solve_wit_67_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_67_pure.
End PRESENT16.
Module Checked <: PRESENT16.
Lemma proof_of_test_rvv_partial_solve_wit_22_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_22_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_22_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_25_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_25_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_25_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_28_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_28_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_28_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_31_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_31_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_31_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_34_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_34_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_34_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_37_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_37_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_37_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_40_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_40_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_40_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_43_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_43_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_43_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_46_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_46_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_46_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_49_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_49_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_49_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_52_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_52_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_52_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_55_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_55_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_55_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_58_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_58_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_58_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_61_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_61_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_61_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_64_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_64_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_64_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
Lemma proof_of_test_rvv_partial_solve_wit_67_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_67_pure.
Proof. unfold HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_67_pure;intros;subst.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 entailer!;try assumption;try lia;try(eapply hm401_clipped_write_window;eauto;lia). Qed.
End Checked.
Module Independent <: PRESENT16.
Definition proof_of_test_rvv_partial_solve_wit_22_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_22_pure := Checked.proof_of_test_rvv_partial_solve_wit_22_pure.
Definition proof_of_test_rvv_partial_solve_wit_25_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_25_pure := Checked.proof_of_test_rvv_partial_solve_wit_25_pure.
Definition proof_of_test_rvv_partial_solve_wit_28_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_28_pure := Checked.proof_of_test_rvv_partial_solve_wit_28_pure.
Definition proof_of_test_rvv_partial_solve_wit_31_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_31_pure := Checked.proof_of_test_rvv_partial_solve_wit_31_pure.
Definition proof_of_test_rvv_partial_solve_wit_34_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_34_pure := Checked.proof_of_test_rvv_partial_solve_wit_34_pure.
Definition proof_of_test_rvv_partial_solve_wit_37_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_37_pure := Checked.proof_of_test_rvv_partial_solve_wit_37_pure.
Definition proof_of_test_rvv_partial_solve_wit_40_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_40_pure := Checked.proof_of_test_rvv_partial_solve_wit_40_pure.
Definition proof_of_test_rvv_partial_solve_wit_43_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_43_pure := Checked.proof_of_test_rvv_partial_solve_wit_43_pure.
Definition proof_of_test_rvv_partial_solve_wit_46_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_46_pure := Checked.proof_of_test_rvv_partial_solve_wit_46_pure.
Definition proof_of_test_rvv_partial_solve_wit_49_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_49_pure := Checked.proof_of_test_rvv_partial_solve_wit_49_pure.
Definition proof_of_test_rvv_partial_solve_wit_52_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_52_pure := Checked.proof_of_test_rvv_partial_solve_wit_52_pure.
Definition proof_of_test_rvv_partial_solve_wit_55_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_55_pure := Checked.proof_of_test_rvv_partial_solve_wit_55_pure.
Definition proof_of_test_rvv_partial_solve_wit_58_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_58_pure := Checked.proof_of_test_rvv_partial_solve_wit_58_pure.
Definition proof_of_test_rvv_partial_solve_wit_61_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_61_pure := Checked.proof_of_test_rvv_partial_solve_wit_61_pure.
Definition proof_of_test_rvv_partial_solve_wit_64_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_64_pure := Checked.proof_of_test_rvv_partial_solve_wit_64_pure.
Definition proof_of_test_rvv_partial_solve_wit_67_pure : HwcConv.rvv_unit_goal.test_rvv_partial_solve_wit_67_pure := Checked.proof_of_test_rvv_partial_solve_wit_67_pure.
End Independent.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_22_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_22_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_25_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_25_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_28_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_28_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_31_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_31_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_34_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_34_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_37_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_37_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_40_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_40_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_43_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_43_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_46_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_46_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_49_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_49_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_52_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_52_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_55_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_55_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_58_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_58_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_61_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_61_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_64_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_64_pure.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_67_pure.
Print Assumptions Independent.proof_of_test_rvv_partial_solve_wit_67_pure.
