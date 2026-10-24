From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import neon_unit_goal NeonMemoryPartSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart09.
Lemma proof_of_test_neon_entail_wit_31_1 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_31_1.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_31_1.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M channels input_increment input output r num_batches PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30.
rd_neon_memory_prepare.
assert(Htwo:rd_bit2 channels=2)by(apply rd_neon_bit2_nonzero;lia).
unfold rd_tail_lane;rewrite Htwo in *;repeat match goal with |-context[Z.modulo ?a 4]=>let v:=eval vm_compute in(Z.modulo a 4)in progress change(Z.modulo a 4)with v end.
rewrite !rd_neon_final_lane_at by(try assumption;lia).
rewrite rd_neon_two_store by lia.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart09.
