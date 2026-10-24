From Coq Require Import ZArith Lia List.
From Dwconv Require Import NeonKernelMemoryWeights.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac dwm_guard_frame := repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|dwm_window_known|split|reflexivity];lia|dwm_spatial].
Lemma proof_of_test_neon_entail_wit_7:Dwconv.neon_unit_goal.test_neon_entail_wit_7.
Proof.
 unfold test_neon_entail_wit_7;dwm_prepare.
 assert(Hp:0<=dw_width D-output_width<dw_width D)by lia.
 assert(Hk:0<=dw_channels D-c<dw_channels D)by lia.
 pose proof(dwm_input_window4 F P W D (dw_width D-output_width)(dw_channels D-c)ltac:(assumption)Hp Hk 0 ltac:(lia))as Hi0.
 pose proof(dwm_input_window4 F P W D (dw_width D-output_width)(dw_channels D-c)ltac:(assumption)Hp Hk 1 ltac:(lia))as Hi1.
 pose proof(dwm_input_window4 F P W D (dw_width D-output_width)(dw_channels D-c)ltac:(assumption)Hp Hk 2 ltac:(lia))as Hi2.
 pose proof(dwm_weight_window4 F P W D (dw_width D-output_width)(dw_channels D-c)0 ltac:(assumption)Hk ltac:(assumption)ltac:(lia))as Hw0.
 pose proof(dwm_weight_window4 F P W D (dw_width D-output_width)(dw_channels D-c)1 ltac:(assumption)Hk ltac:(assumption)ltac:(lia))as Hw1.
 pose proof(dwm_weight_window4 F P W D (dw_width D-output_width)(dw_channels D-c)2 ltac:(assumption)Hk ltac:(assumption)ltac:(lia))as Hw2.
 pose proof(dwm_weight_window4 F P W D (dw_width D-output_width)(dw_channels D-c)3 ltac:(assumption)Hk ltac:(assumption)ltac:(lia))as Hw3.
 pose proof(dwm_output_window F P W D (dw_width D-output_width)(dw_channels D-c)1 ltac:(assumption)Hp ltac:(lia)ltac:(lia)ltac:(lia))as Ho1.
 assert(Hc:c=1\/c=2\/c=3)by lia;destruct Hc as[Hc|[Hc|Hc]];subst c.
 - first[solve[Left;dwm_guard_frame]|solve[Left;Left;dwm_guard_frame]].
 - pose proof(dwm_output_window F P W D (dw_width D-output_width)(dw_channels D-2)2 ltac:(assumption)Hp ltac:(lia)ltac:(lia)ltac:(lia))as Ho2.
   first[solve[Right;Left;dwm_guard_frame]|solve[Left;Right;dwm_guard_frame]].
 - pose proof(dwm_output_window F P W D (dw_width D-output_width)(dw_channels D-3)2 ltac:(assumption)Hp ltac:(lia)ltac:(lia)ltac:(lia))as Ho2.
   pose proof(dwm_output_window F P W D (dw_width D-output_width)(dw_channels D-3+2)1 ltac:(assumption)Hp ltac:(lia)ltac:(lia)ltac:(lia))as Ho3.
   first[solve[Right;Right;dwm_guard_frame]|solve[Right;dwm_guard_frame]].
Qed.
Print Assumptions proof_of_test_neon_entail_wit_7.
