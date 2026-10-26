From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma apmk_zero_output:forall F P D O I,app_neon_partial_output F P D 0 0 0 O I=O.
Proof. intros;unfold app_neon_partial_output,app_partial_output;rewrite app_pass_partial_zero;reflexivity. Qed.
Lemma apmk_zero_index:forall F P D O I,app_neon_partial_index F P D 0 0 0 O I=I.
Proof. intros;unfold app_neon_partial_index,app_partial_index;rewrite app_pass_partial_zero;reflexivity. Qed.
Lemma apmk_initial_nonzero:forall F P W WI D,app_valid F P W WI D->
 0<app_output_base D /\ 0<app_index_base D.
Proof. intros F P W WI D [[HP[HK[HC HG]]]HN].
 destruct(HG 0 ltac:(lia))as[HT[HR[HW HI]]].
 destruct HW as[HW _];destruct HI as[HI _].
 change(0<app_output_base D)in HW;change(0<app_index_base D)in HI;auto. Qed.
Module CheckedNeonMemoryInitial.
Lemma proof_of_test_neon_entail_wit_2:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_2;left;apb_intro.
 assert(Hpixel:app_pixels D-output_pixels=0)by lia.
 assert(Hgroup:app_group_cursor D pooling_elements=0).
 { rewrite PreH4;apply app_group_cursor_initial;lia. }
 pose proof(apmk_initial_nonzero F P W WI D PreH13)as[Hout Hidx].
 rewrite Hpixel,Hgroup,apmk_zero_output,apmk_zero_index.
 unfold app_table,app_offset_at,app_output_at,app_index_at.
 rewrite !app_advance_zero.
 change(app_index_base_at 0)with 0.
 rewrite app_remaining_initial by lia.
 cbn[app_previous_cursor].
 unfold app_table_cursor,app_consumed.
 replace(Z.min pooling_elements(9*0))with 0 by(symmetry;apply Z.min_r;lia).
 replace(input+8*0)with input by ring.
 apkp_call_frame.
Qed.
End CheckedNeonMemoryInitial.
Print Assumptions apmk_zero_output.
Print Assumptions apmk_zero_index.
Print Assumptions apmk_initial_nonzero.
Print Assumptions CheckedNeonMemoryInitial.proof_of_test_neon_entail_wit_2.
