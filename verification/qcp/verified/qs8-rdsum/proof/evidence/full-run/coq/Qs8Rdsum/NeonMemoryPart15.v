From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import neon_unit_goal NeonMemoryPartSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart15.
Lemma proof_of_test_neon_return_wit_1 : Qs8Rdsum.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_return_wit_1.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M output input input_increment channels PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19.
rd_neon_memory_prepare.
assert (Hz:channels=0) by lia;subst channels.
rewrite Z.sub_0_r,rd_partial_full by lia.
apply derivable1_refl.
Qed.

End CheckedNeonMemoryPart15.
