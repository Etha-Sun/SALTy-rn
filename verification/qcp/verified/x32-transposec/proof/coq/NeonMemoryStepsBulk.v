From X32Transpose Require Import NeonAutomation NeonMemoryStepsEntry NeonTileBridge CursorFacts.
From Coq Require Import ZArith Lia.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonMemoryStepsBulk.
Lemma proof_of_test_neon_entail_wit_4:X32Transpose.neon_unit_goal.test_neon_entail_wit_4.
Proof.
 unfold X32Transpose.neon_unit_goal.test_neon_entail_wit_4;right;intros;subst.
 set(row:=xt_height G-bh)in *.
 assert(Hk:0<=k_2<xt_cols G)by lia.
 pose proof(xt_neon_bulk_progress F W G old R_2 k_2 row(xt_doz(xt_cols G)k_2)PreH2 Hk eq_refl ltac:(unfold row;lia)ltac:(unfold row;lia)PreH32)as Hp.
 unfold xt_neon_bulk_state in Hp.
 assert(Hi0:unsigned_last_nbits(unsigned_last_nbits(xt_current_input G k_2 row)64+xt_neon_input_offset G)64=xt_current_input G k_2(row+2)).
 { rewrite !xt_u64_is_mod64,xt_mod_add_l;unfold xt_neon_input_offset;apply xt_current_input_row_step;unfold row;lia. }
 assert(Hi1:unsigned_last_nbits(unsigned_last_nbits(xt_current_input G k_2(row+1))64+xt_neon_input_offset G)64=xt_current_input G k_2((row+2)+1)).
 { replace((row+2)+1)with((row+1)+2)by ring.
   rewrite !xt_u64_is_mod64,xt_mod_add_l;unfold xt_neon_input_offset;apply xt_current_input_row_step;unfold row;lia. }
 assert(Ho0:unsigned_last_nbits(unsigned_last_nbits(xt_current_output G k_2 row)64+8)64=xt_current_output G k_2(row+2)).
 { rewrite !xt_u64_is_mod64,xt_mod_add_l;change(xt_mod64(xt_current_output G k_2 row+4*2)=xt_current_output G k_2(row+2));apply xt_current_output_row_step;unfold row;lia. }
 assert(Ho1:unsigned_last_nbits(unsigned_last_nbits(xt_current_output G(xt_neon_second k_2(xt_doz(xt_cols G)k_2))row)64+8)64=xt_current_output G(xt_neon_second k_2(xt_doz(xt_cols G)k_2))(row+2)).
 { rewrite !xt_u64_is_mod64,xt_mod_add_l;change(xt_mod64(xt_current_output G(xt_neon_second k_2(xt_doz(xt_cols G)k_2))row+4*2)=xt_current_output G(xt_neon_second k_2(xt_doz(xt_cols G)k_2))(row+2));apply xt_current_output_row_step;unfold row;lia. }
 Exists k_2.
 replace(xt_height G-(bh-2))with(row+2)by(unfold row;lia).
 assert(Heven:Z.rem(row+2)2=0).
 { rewrite Z.rem_mod_nonneg by(unfold row;lia).
   rewrite Z.rem_mod_nonneg in PreH27 by(unfold row;lia).
   rewrite Z.add_mod by lia;rewrite PreH27;reflexivity. }
 xt_steps_pure.
Qed.
Lemma proof_of_test_neon_entail_wit_5_1:X32Transpose.neon_unit_goal.test_neon_entail_wit_5_1.
Proof.
 unfold X32Transpose.neon_unit_goal.test_neon_entail_wit_5_1;right;intros;subst.
 assert(Ebh:bh=1)by lia;subst bh.
 assert(Hk:0<=k_2<xt_cols G)by lia.
 pose proof(xt_neon_tail_progress F W G old R_2 k_2(xt_height G-1)(xt_doz(xt_cols G)k_2)PreH3 Hk eq_refl ltac:(lia)PreH33)as Hp.
 unfold xt_neon_tail_state in Hp.
 replace(xt_height G-1+1)with(xt_height G)in Hp by ring.
 Exists k_2;xt_steps_pure.
Qed.
End CheckedNeonMemoryStepsBulk.
Print Assumptions CheckedNeonMemoryStepsBulk.proof_of_test_neon_entail_wit_4.
Print Assumptions CheckedNeonMemoryStepsBulk.proof_of_test_neon_entail_wit_5_1.
