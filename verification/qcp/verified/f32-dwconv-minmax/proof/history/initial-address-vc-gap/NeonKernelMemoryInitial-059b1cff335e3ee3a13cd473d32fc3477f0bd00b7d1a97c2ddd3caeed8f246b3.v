From Coq Require Import ZArith Lia List.
From Dwconv Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_2:Dwconv.neon_unit_goal.test_neon_entail_wit_2.
Proof. unfold test_neon_entail_wit_2;left;dwm_prepare.
 unfold dw_neon_progress,dw_progress;rewrite Z.sub_diag;cbn[dw_channel_state dw_full_state];
 unfold dw_table,dw_offset_at,dw_output_at;
 rewrite ?Z.mul_0_l,?Z.add_0_r.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];try lia.
   Show.
 - dwm_spatial.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
