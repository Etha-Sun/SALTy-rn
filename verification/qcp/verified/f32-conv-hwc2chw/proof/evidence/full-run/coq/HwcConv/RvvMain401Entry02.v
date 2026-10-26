From HwcConv Require Import RvvMain401ModFacts.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_rvv_raw hc_rvv_source_fold dw_rvv_fma.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_1_2:HwcConv.rvv_unit_goal.test_rvv_entail_wit_1_2.
Proof.
 unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_1_2;left;intros;hmi_constants;subst.
 rewrite hc_progress_initial.
 unfold hc_same_bits in *;subst.
 hmb_entry_context2;hmb_frame.
 all:try solve[hmb_entry_dispatch2].
 Show.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_1_2.
