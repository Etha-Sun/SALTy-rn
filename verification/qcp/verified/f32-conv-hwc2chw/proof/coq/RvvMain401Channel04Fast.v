From HwcConv Require Import RvvMain401ChannelTactics.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_progress hc_visible.
Ltac hr401_fast_atom:=first[solve[assumption|reflexivity|lia]|solve[hr401_bare_output]|
 solve[unfold hc_channel_output;repeat split;unfold hc_output_address;hmi_output_solve]|hr401g_atom].
Ltac hr401_fast_dispatch:=first[solve[apply hmi_pure_intro;hr401_fast_atom]|
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hr401_fast_dispatch|hr401_fast_dispatch]
 | _=>first[solve[fast_cancel]|apply hmi_pure_intro]end].
Module Checked.
Lemma proof_of_test_rvv_entail_wit_5_4:HwcConv.rvv_unit_goal.test_rvv_entail_wit_5_4.
Proof.
 unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_5_4;left;hmi_prepare.
 hr401_channel_context.

 hr401_channel_preaddress;hr401_channel_prerows.
 Timeout 90 hr401_fast_dispatch.
 Show.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_5_4.
