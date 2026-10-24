From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import neon_unit_goal NeonMemoryPartSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart05.
Lemma proof_of_test_neon_entail_wit_28 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_28.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_28.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M num_batches ip6 ip5 ip4 ip3 ip2 ip1 ip0 r output input input_increment channels PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33.
rd_neon_memory_prepare.
assert(Hnb:num_batches=0)by lia;subst num_batches.
assert(Hr:r=0)by(apply (proj1(rd_ceil252_zero_iff r ltac:(lia)));lia);subst r;rewrite !Z.sub_0_r in *.
rewrite !rd_neon_final_lane_at by (try assumption;lia).
rewrite rd_neon_four_store by lia.
repeat rewrite rd_partial_suffix by lia.
try rewrite !rd_neon_final_initial_lane by(try assumption;lia).
rewrite !Z.add_0_r.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart05.
