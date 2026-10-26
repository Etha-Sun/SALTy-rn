From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_3 : ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_entail_wit_3;right;intros S Q M P N W F output input G A retval PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10.
 assert(HR:em_rvv_readable F(P+16*G)4)by(right;eapply em_valid_bulk_read;eauto;lia).
 assert(HW:em_rvv_writable W(Q+16*G)4)by(right;eapply em_valid_bulk_write;eauto;lia).
 entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_3.
