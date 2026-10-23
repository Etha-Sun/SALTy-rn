From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import U8Logic Packed32Model CodecProof.
From ActiveCodecVC Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: ActiveCodecVC.unit_goal.VC_Correct.
Lemma proof_of_qcp_u8_min_return_wit_1 : qcp_u8_min_return_wit_1.
Proof. timeout 15 (cbv delta [qcp_u8_min_return_wit_1 qcp_u8_min_return_wit_1_split_goal_1]; pre_process; unfold u8_min,u8_max; first[rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];entailer!). Qed.
Lemma proof_of_qcp_u8_min_return_wit_2 : qcp_u8_min_return_wit_2.
Proof. timeout 15 (cbv delta [qcp_u8_min_return_wit_2 qcp_u8_min_return_wit_2_split_goal_1]; pre_process; unfold u8_min,u8_max; first[rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];entailer!). Qed.
Lemma proof_of_qcp_u8_max_return_wit_1 : qcp_u8_max_return_wit_1.
Proof. timeout 15 (cbv delta [qcp_u8_max_return_wit_1 qcp_u8_max_return_wit_1_split_goal_1]; pre_process; unfold u8_min,u8_max; first[rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];entailer!). Qed.
Lemma proof_of_qcp_u8_max_return_wit_2 : qcp_u8_max_return_wit_2.
Proof. timeout 15 (cbv delta [qcp_u8_max_return_wit_2 qcp_u8_max_return_wit_2_split_goal_1]; pre_process; unfold u8_min,u8_max; first[rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];entailer!). Qed.
Lemma proof_of_qcp_active_min_return_wit_1 : qcp_active_min_return_wit_1.
Proof. timeout 15 (cbv delta [qcp_active_min_return_wit_1 qcp_active_min_return_wit_1_split_goal_1]; left;pre_process;unfold active_min,active_max,u8_min,u8_max in *;destruct(Z.ltb i_pre vl_pre)eqn:Hlt;[apply Z.ltb_lt in Hlt|apply Z.ltb_ge in Hlt];try solve[entailer!;lia];destruct(Z_le_gt_dec x_pre y_pre);rewrite ?Z.min_l,?Z.max_r by lia;try rewrite Z.min_r by lia;try rewrite Z.max_l by lia;entailer!;lia). Qed.
Lemma proof_of_qcp_active_min_return_wit_2 : qcp_active_min_return_wit_2.
Proof. timeout 15 (cbv delta [qcp_active_min_return_wit_2 qcp_active_min_return_wit_2_split_goal_1 qcp_active_min_return_wit_2_split_goal_2 qcp_active_min_return_wit_2_split_goal_3]; left;pre_process;unfold active_min,active_max,u8_min,u8_max in *;destruct(Z.ltb i_pre vl_pre)eqn:Hlt;[apply Z.ltb_lt in Hlt|apply Z.ltb_ge in Hlt];try solve[entailer!;lia];destruct(Z_le_gt_dec x_pre y_pre);rewrite ?Z.min_l,?Z.max_r by lia;try rewrite Z.min_r by lia;try rewrite Z.max_l by lia;entailer!;lia). Qed.
Lemma proof_of_qcp_active_min_partial_solve_wit_1 : qcp_active_min_partial_solve_wit_1.
Proof. timeout 15 (cbv delta [qcp_active_min_partial_solve_wit_1]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_active_max_return_wit_1 : qcp_active_max_return_wit_1.
Proof. timeout 15 (cbv delta [qcp_active_max_return_wit_1 qcp_active_max_return_wit_1_split_goal_1]; left;pre_process;unfold active_min,active_max,u8_min,u8_max in *;destruct(Z.ltb i_pre vl_pre)eqn:Hlt;[apply Z.ltb_lt in Hlt|apply Z.ltb_ge in Hlt];try solve[entailer!;lia];destruct(Z_le_gt_dec x_pre y_pre);rewrite ?Z.min_l,?Z.max_r by lia;try rewrite Z.min_r by lia;try rewrite Z.max_l by lia;entailer!;lia). Qed.
Lemma proof_of_qcp_active_max_return_wit_2 : qcp_active_max_return_wit_2.
Proof. timeout 15 (cbv delta [qcp_active_max_return_wit_2 qcp_active_max_return_wit_2_split_goal_1 qcp_active_max_return_wit_2_split_goal_2 qcp_active_max_return_wit_2_split_goal_3]; left;pre_process;unfold active_min,active_max,u8_min,u8_max in *;destruct(Z.ltb i_pre vl_pre)eqn:Hlt;[apply Z.ltb_lt in Hlt|apply Z.ltb_ge in Hlt];try solve[entailer!;lia];destruct(Z_le_gt_dec x_pre y_pre);rewrite ?Z.min_l,?Z.max_r by lia;try rewrite Z.min_r by lia;try rewrite Z.max_l by lia;entailer!;lia). Qed.
Lemma proof_of_qcp_active_max_partial_solve_wit_1 : qcp_active_max_partial_solve_wit_1.
Proof. timeout 15 (cbv delta [qcp_active_max_partial_solve_wit_1]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_1 : qcp_word_min_safety_wit_1.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_1]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_2 : qcp_word_min_safety_wit_2.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_2]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_3 : qcp_word_min_safety_wit_3.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_3]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_4 : qcp_word_min_safety_wit_4.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_4]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_5 : qcp_word_min_safety_wit_5.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_5]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_6 : qcp_word_min_safety_wit_6.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_6]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_7 : qcp_word_min_safety_wit_7.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_7]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_8 : qcp_word_min_safety_wit_8.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_8]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_9 : qcp_word_min_safety_wit_9.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_9]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_10 : qcp_word_min_safety_wit_10.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_10]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_11 : qcp_word_min_safety_wit_11.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_11]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_safety_wit_12 : qcp_word_min_safety_wit_12.
Proof. timeout 15 (cbv delta [qcp_word_min_safety_wit_12]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_return_wit_1 : qcp_word_min_return_wit_1.
Proof. timeout 15 (cbv delta [qcp_word_min_return_wit_1 qcp_word_min_return_wit_1_split_goal_1]; left;pre_process;unfold word_min,word_max in *;rewrite ?Z.add_0_r in *;entailer!;congruence). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_1_pure : qcp_word_min_partial_solve_wit_1_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_1_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_1 : qcp_word_min_partial_solve_wit_1.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_1_pure qcp_word_min_partial_solve_wit_1_aux qcp_word_min_partial_solve_wit_1]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_2_pure : qcp_word_min_partial_solve_wit_2_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_2_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_2 : qcp_word_min_partial_solve_wit_2.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_2_pure qcp_word_min_partial_solve_wit_2_aux qcp_word_min_partial_solve_wit_2]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_3_pure : qcp_word_min_partial_solve_wit_3_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_3_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_3 : qcp_word_min_partial_solve_wit_3.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_3_pure qcp_word_min_partial_solve_wit_3_aux qcp_word_min_partial_solve_wit_3]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_4_pure : qcp_word_min_partial_solve_wit_4_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_4_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_4 : qcp_word_min_partial_solve_wit_4.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_4_pure qcp_word_min_partial_solve_wit_4_aux qcp_word_min_partial_solve_wit_4]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_5_pure : qcp_word_min_partial_solve_wit_5_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_5_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_5 : qcp_word_min_partial_solve_wit_5.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_5_pure qcp_word_min_partial_solve_wit_5_aux qcp_word_min_partial_solve_wit_5]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_6_pure : qcp_word_min_partial_solve_wit_6_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_6_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_6 : qcp_word_min_partial_solve_wit_6.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_6_pure qcp_word_min_partial_solve_wit_6_aux qcp_word_min_partial_solve_wit_6]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_7_pure : qcp_word_min_partial_solve_wit_7_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_7_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_7 : qcp_word_min_partial_solve_wit_7.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_7_pure qcp_word_min_partial_solve_wit_7_aux qcp_word_min_partial_solve_wit_7]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_8_pure : qcp_word_min_partial_solve_wit_8_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_8_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_8 : qcp_word_min_partial_solve_wit_8.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_8_pure qcp_word_min_partial_solve_wit_8_aux qcp_word_min_partial_solve_wit_8]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_9_pure : qcp_word_min_partial_solve_wit_9_pure.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_9_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_min_partial_solve_wit_9 : qcp_word_min_partial_solve_wit_9.
Proof. timeout 15 (cbv delta [qcp_word_min_partial_solve_wit_9_pure qcp_word_min_partial_solve_wit_9_aux qcp_word_min_partial_solve_wit_9]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_1 : qcp_word_max_safety_wit_1.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_1]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_2 : qcp_word_max_safety_wit_2.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_2]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_3 : qcp_word_max_safety_wit_3.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_3]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_4 : qcp_word_max_safety_wit_4.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_4]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_5 : qcp_word_max_safety_wit_5.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_5]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_6 : qcp_word_max_safety_wit_6.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_6]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_7 : qcp_word_max_safety_wit_7.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_7]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_8 : qcp_word_max_safety_wit_8.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_8]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_9 : qcp_word_max_safety_wit_9.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_9]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_10 : qcp_word_max_safety_wit_10.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_10]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_11 : qcp_word_max_safety_wit_11.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_11]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_safety_wit_12 : qcp_word_max_safety_wit_12.
Proof. timeout 15 (cbv delta [qcp_word_max_safety_wit_12]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_return_wit_1 : qcp_word_max_return_wit_1.
Proof. timeout 15 (cbv delta [qcp_word_max_return_wit_1 qcp_word_max_return_wit_1_split_goal_1]; left;pre_process;unfold word_min,word_max in *;rewrite ?Z.add_0_r in *;entailer!;congruence). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_1_pure : qcp_word_max_partial_solve_wit_1_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_1_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_1 : qcp_word_max_partial_solve_wit_1.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_1_pure qcp_word_max_partial_solve_wit_1_aux qcp_word_max_partial_solve_wit_1]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_2_pure : qcp_word_max_partial_solve_wit_2_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_2_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_2 : qcp_word_max_partial_solve_wit_2.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_2_pure qcp_word_max_partial_solve_wit_2_aux qcp_word_max_partial_solve_wit_2]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_3_pure : qcp_word_max_partial_solve_wit_3_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_3_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_3 : qcp_word_max_partial_solve_wit_3.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_3_pure qcp_word_max_partial_solve_wit_3_aux qcp_word_max_partial_solve_wit_3]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_4_pure : qcp_word_max_partial_solve_wit_4_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_4_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_4 : qcp_word_max_partial_solve_wit_4.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_4_pure qcp_word_max_partial_solve_wit_4_aux qcp_word_max_partial_solve_wit_4]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_5_pure : qcp_word_max_partial_solve_wit_5_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_5_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_5 : qcp_word_max_partial_solve_wit_5.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_5_pure qcp_word_max_partial_solve_wit_5_aux qcp_word_max_partial_solve_wit_5]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_6_pure : qcp_word_max_partial_solve_wit_6_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_6_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_6 : qcp_word_max_partial_solve_wit_6.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_6_pure qcp_word_max_partial_solve_wit_6_aux qcp_word_max_partial_solve_wit_6]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_7_pure : qcp_word_max_partial_solve_wit_7_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_7_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_7 : qcp_word_max_partial_solve_wit_7.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_7_pure qcp_word_max_partial_solve_wit_7_aux qcp_word_max_partial_solve_wit_7]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_8_pure : qcp_word_max_partial_solve_wit_8_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_8_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_8 : qcp_word_max_partial_solve_wit_8.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_8_pure qcp_word_max_partial_solve_wit_8_aux qcp_word_max_partial_solve_wit_8]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_9_pure : qcp_word_max_partial_solve_wit_9_pure.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_9_pure]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_word_max_partial_solve_wit_9 : qcp_word_max_partial_solve_wit_9.
Proof. timeout 15 (cbv delta [qcp_word_max_partial_solve_wit_9_pure qcp_word_max_partial_solve_wit_9_aux qcp_word_max_partial_solve_wit_9]; pre_process;entailer!;lia). Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_u8_min_return_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_min_return_wit_2.
Print Assumptions Checked.proof_of_qcp_u8_max_return_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_max_return_wit_2.
Print Assumptions Checked.proof_of_qcp_active_min_return_wit_1.
Print Assumptions Checked.proof_of_qcp_active_min_return_wit_2.
Print Assumptions Checked.proof_of_qcp_active_min_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_active_max_return_wit_1.
Print Assumptions Checked.proof_of_qcp_active_max_return_wit_2.
Print Assumptions Checked.proof_of_qcp_active_max_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_4.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_5.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_6.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_7.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_8.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_9.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_10.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_11.
Print Assumptions Checked.proof_of_qcp_word_min_safety_wit_12.
Print Assumptions Checked.proof_of_qcp_word_min_return_wit_1.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_2.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_3_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_3.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_4_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_4.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_5_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_5.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_6_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_6.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_7_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_7.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_8_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_8.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_9_pure.
Print Assumptions Checked.proof_of_qcp_word_min_partial_solve_wit_9.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_4.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_5.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_6.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_7.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_8.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_9.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_10.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_11.
Print Assumptions Checked.proof_of_qcp_word_max_safety_wit_12.
Print Assumptions Checked.proof_of_qcp_word_max_return_wit_1.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_2.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_3_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_3.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_4_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_4.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_5_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_5.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_6_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_6.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_7_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_7.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_8_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_8.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_9_pure.
Print Assumptions Checked.proof_of_qcp_word_max_partial_solve_wit_9.
