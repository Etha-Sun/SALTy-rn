From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Import rvv_unit_goal RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_return_wit_1 : ExpMinusMax.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_return_wit_1;left;intros S Q M P N O W F Y PreH1 PreH2 PreH3.
 unfold em_same in PreH3;subst Y.
 pose proof PreH1 as HV;unfold em_valid in HV.
 assert(Hnd:List.NoDup W)by tauto.
 assert(Hs:List.In S W)by tauto.
 unfold em_rvv_result;change(em_output_put (em_rvv_output_prefix F P M Q N O) S (em_rvv_sum N (em_input F P) (em_get F M)))with(em_rvv_result F P M Q S N O).
 unfold em_removed.
 sepcon_assoc_change.
 sep_apply(em_output_writeback W (em_rvv_output_prefix F P M Q N O) S (em_rvv_sum N (em_input F P) (em_get F M)) Hnd Hs).
 unfold em_rvv_result,em_rvv_output_prefix,em_input in *;entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_return_wit_1.
