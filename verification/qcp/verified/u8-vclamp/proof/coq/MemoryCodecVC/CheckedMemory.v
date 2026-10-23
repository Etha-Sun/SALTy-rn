From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import U8Logic Packed32Model MemoryFacts arrays_strategy_proof.
From MemoryCodecVC Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: MemoryCodecVC.unit_goal.VC_Correct.
Include FullU8.arrays_strategy_proof.Checked.
Lemma proof_of_qcp_load_lane_safety_wit_1 : qcp_load_lane_safety_wit_1.
Proof. timeout 30 (cbv delta [qcp_load_lane_safety_wit_1]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_lane_return_wit_1 : qcp_load_lane_return_wit_1.
Proof. timeout 30 (cbv delta [qcp_load_lane_return_wit_1 qcp_load_lane_return_wit_1_split_goal_1]; left;pre_process;unfold lane_load;assert(Hlt:Z.ltb i_pre vl_pre=false)by(apply Z.ltb_ge;lia);rewrite Hlt;entailer!). Qed.
Lemma proof_of_qcp_load_lane_return_wit_2 : qcp_load_lane_return_wit_2.
Proof. timeout 30 (cbv delta [qcp_load_lane_return_wit_2 qcp_load_lane_return_wit_2_split_goal_1 qcp_load_lane_return_wit_2_split_goal_2 qcp_load_lane_return_wit_2_split_goal_3]; left;pre_process;eapply derivable1_trans;[apply(uchar_full_value_bound_preserve p_pre n A i_pre);lia|];pre_process;unfold lane_load;assert(Hlt:Z.ltb i_pre vl_pre=true)by(apply Z.ltb_lt;lia);rewrite Hlt;entailer!). Qed.
Lemma proof_of_qcp_load_lane_partial_solve_wit_1 : qcp_load_lane_partial_solve_wit_1.
Proof. timeout 30 (cbv delta [qcp_load_lane_partial_solve_wit_1]; pre_process;eapply derivable1_trans;[apply(UCharArray.full_split_to_missing_i p_pre i_pre n A 0);lia|];unfold StoreUCharAsElement.storeA;entailer!). Qed.
Lemma proof_of_qcp_load_word_safety_wit_1 : qcp_load_word_safety_wit_1.
Proof. timeout 30 (cbv delta [qcp_load_word_safety_wit_1]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_safety_wit_2 : qcp_load_word_safety_wit_2.
Proof. timeout 30 (cbv delta [qcp_load_word_safety_wit_2]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_safety_wit_3 : qcp_load_word_safety_wit_3.
Proof. timeout 30 (cbv delta [qcp_load_word_safety_wit_3]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_safety_wit_4 : qcp_load_word_safety_wit_4.
Proof. timeout 30 (cbv delta [qcp_load_word_safety_wit_4]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_safety_wit_5 : qcp_load_word_safety_wit_5.
Proof. timeout 30 (cbv delta [qcp_load_word_safety_wit_5]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_safety_wit_6 : qcp_load_word_safety_wit_6.
Proof. timeout 30 (cbv delta [qcp_load_word_safety_wit_6]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_safety_wit_7 : qcp_load_word_safety_wit_7.
Proof. timeout 30 (cbv delta [qcp_load_word_safety_wit_7]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_return_wit_1 : qcp_load_word_return_wit_1.
Proof. timeout 30 (cbv delta [qcp_load_word_return_wit_1 qcp_load_word_return_wit_1_split_goal_1]; left;pre_process;unfold word_load;entailer!;congruence). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_1_pure : qcp_load_word_partial_solve_wit_1_pure.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_1_pure]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_1 : qcp_load_word_partial_solve_wit_1.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_1_pure qcp_load_word_partial_solve_wit_1_aux qcp_load_word_partial_solve_wit_1]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_2_pure : qcp_load_word_partial_solve_wit_2_pure.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_2_pure]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_2 : qcp_load_word_partial_solve_wit_2.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_2_pure qcp_load_word_partial_solve_wit_2_aux qcp_load_word_partial_solve_wit_2]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_3_pure : qcp_load_word_partial_solve_wit_3_pure.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_3_pure]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_3 : qcp_load_word_partial_solve_wit_3.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_3_pure qcp_load_word_partial_solve_wit_3_aux qcp_load_word_partial_solve_wit_3]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_4_pure : qcp_load_word_partial_solve_wit_4_pure.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_4_pure]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_4 : qcp_load_word_partial_solve_wit_4.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_4_pure qcp_load_word_partial_solve_wit_4_aux qcp_load_word_partial_solve_wit_4]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_5_pure : qcp_load_word_partial_solve_wit_5_pure.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_5_pure]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
Lemma proof_of_qcp_load_word_partial_solve_wit_5 : qcp_load_word_partial_solve_wit_5.
Proof. timeout 30 (cbv delta [qcp_load_word_partial_solve_wit_5_pure qcp_load_word_partial_solve_wit_5_aux qcp_load_word_partial_solve_wit_5]; pre_process;unfold INT_MAX,INT_MIN,UINT_MAX,UINT64_MAX in *;entailer!;lia). Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_load_lane_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_load_lane_return_wit_1.
Print Assumptions Checked.proof_of_qcp_load_lane_return_wit_2.
Print Assumptions Checked.proof_of_qcp_load_lane_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_load_word_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_load_word_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_load_word_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_load_word_safety_wit_4.
Print Assumptions Checked.proof_of_qcp_load_word_safety_wit_5.
Print Assumptions Checked.proof_of_qcp_load_word_safety_wit_6.
Print Assumptions Checked.proof_of_qcp_load_word_safety_wit_7.
Print Assumptions Checked.proof_of_qcp_load_word_return_wit_1.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_2.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_3_pure.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_3.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_4_pure.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_4.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_5_pure.
Print Assumptions Checked.proof_of_qcp_load_word_partial_solve_wit_5.
