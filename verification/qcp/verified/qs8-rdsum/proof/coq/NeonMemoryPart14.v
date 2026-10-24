From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import neon_unit_goal NeonMemoryPartSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart14.
Lemma proof_of_test_neon_entail_wit_33_3 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_33_3.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_33_3.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M channels input_increment input output r num_batches PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30.
rd_neon_memory_prepare.
assert(Hindex:channels_pre-channels+rd_bit4 channels+rd_bit2 channels=channels_pre)by lia.
rewrite Hindex,Z.sub_0_r.
unfold rd_ptr_gate.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart14.
