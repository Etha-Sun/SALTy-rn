From Coq Require Import ZArith List Lia Strings.String.
From Qd8Caller Require Import caller_goal.
From Qd8CallerModel Require Import CallerModel.
From Qd8RvvArith Require Import RvvArithmetic.
From NanBridge Require Import BridgeLogic ListBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_qd8_same_lane_return_wit_1:caller_goal.qd8_same_lane_return_wit_1.
Proof. unfold caller_goal.qd8_same_lane_return_wit_1;left;intros.
 unfold qd8_bit_same in *;subst retval retval_2.
 exfalso;eapply same_ne_left_self_eq_false;eassumption.
Qed.
Lemma proof_of_qd8_same_lane_return_wit_2:caller_goal.qd8_same_lane_return_wit_2.
Proof. unfold caller_goal.qd8_same_lane_return_wit_2;left;intros.
 unfold qd8_bit_same in *;subst retval retval_2.
 exfalso;eapply same_ne_right_self_eq_false;eassumption.
Qed.
Lemma proof_of_qd8_compare_outputs_entail_wit_1:caller_goal.qd8_compare_outputs_entail_wit_1.
Proof. unfold caller_goal.qd8_compare_outputs_entail_wit_1;left;intros right_pre left_pre n_pre R L PreH1 PreH2 PreH3.
 prop_apply (FloatArray.full_Zlength left_pre n_pre L);Intros;entailer!.
Qed.
Lemma proof_of_qd8_compare_outputs_which_implies_wit_1:caller_goal.qd8_compare_outputs_which_implies_wit_1.
Proof. unfold caller_goal.qd8_compare_outputs_which_implies_wit_1;left;intros R L i n left right __default_fp32 PreH1 PreH2 PreH3.
 prop_apply (FloatArray.full_Zlength left n L);Intros.
 assert(Hrel:qd8_same_value (Znth i L __default_fp32)(Znth i R __default_fp32)).
 { eapply related_Znth;[exact PreH3|]. rewrite <- Zlength_correct;lia. }
 sep_apply (FloatArray.full_split_to_missing_i left i n L __default_fp32);[|lia].
 sep_apply (FloatArray.full_split_to_missing_i right i n R __default_fp32);[|lia].
 unfold StoreFloatAsElement.storeA;entailer!.
Qed.
Lemma proof_of_qd8_compare_outputs_which_implies_wit_2:caller_goal.qd8_compare_outputs_which_implies_wit_2.
Proof. unfold caller_goal.qd8_compare_outputs_which_implies_wit_2;left;intros R L i n left right __default_fp32 PreH1 PreH2.
 pose proof(FloatArray.missing_i_merge_to_full left i n (Znth i L __default_fp32) L ltac:(lia)) as HL.
 pose proof(FloatArray.missing_i_merge_to_full right i n (Znth i R __default_fp32) R ltac:(lia)) as HR.
 unfold StoreFloatAsElement.storeA in HL,HR;cbn beta in HL,HR.
 sep_apply HL;sep_apply HR;rewrite !replace_Znth_Znth;entailer!.
Qed.
Lemma proof_of_equivalent_which_implies_wit_1:caller_goal.equivalent_which_implies_wit_1.
Proof. unfold caller_goal.equivalent_which_implies_wit_1;left;intros.
 sep_apply (two_output_states_related left right kc nc zp A Ps inv lo hi).
 Intros L R;Exists L R;entailer!.
Qed.
Lemma proof_of_equivalent_return_wit_1:caller_goal.equivalent_return_wit_1.
Proof. unfold caller_goal.equivalent_return_wit_1;left;intros.
 unfold qd8_ret_one in *;Exists L_2 R_2;rvv_frame.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure:caller_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold caller_goal.equivalent_partial_solve_wit_3_pure;left;intros.
 unfold domain_shape in PreH1;destruct PreH1 as (Hm & HN & HK & Hrest);entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_4_pure:caller_goal.equivalent_partial_solve_wit_4_pure.
Proof. unfold caller_goal.equivalent_partial_solve_wit_4_pure;left;intros.
 unfold domain_shape in PreH3;destruct PreH3 as (Hm & HN & HK & Hrest).
 unfold data_capacity in PreH4;destruct PreH4 as (Ha & Hw & Hc & Hwa & Hacap & Hwcap & Hccap);entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_3:caller_goal.equivalent_partial_solve_wit_3.
Proof. unfold caller_goal.equivalent_partial_solve_wit_3,caller_goal.equivalent_partial_solve_wit_3_aux;intros.
 pose proof PreH1 as Hdom;unfold domain_shape in Hdom;destruct Hdom as (Hm & HN & HK & Hrest).
 (rvv_normalize;try lia);rvv_frame.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_4:caller_goal.equivalent_partial_solve_wit_4.
Proof. unfold caller_goal.equivalent_partial_solve_wit_4,caller_goal.equivalent_partial_solve_wit_4_aux;intros.
 pose proof PreH3 as Hdom;unfold domain_shape in Hdom;destruct Hdom as (Hm & HN & HK & Hrest).
 pose proof PreH4 as Hcap;unfold data_capacity in Hcap;destruct Hcap as (Ha & Hw & Hc & Hwa & Hacap & Hwcap & Hccap).
 (rvv_normalize;try lia);rvv_frame.
Qed.
End Checked.
