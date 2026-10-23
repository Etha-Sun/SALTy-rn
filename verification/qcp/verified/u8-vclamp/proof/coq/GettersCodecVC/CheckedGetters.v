From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Packed32Model CodecProof.
From GettersCodecVC Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: GettersCodecVC.unit_goal.VC_Correct.
Lemma proof_of_qcp_get_word_safety_wit_1 : qcp_get_word_safety_wit_1.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_1]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_2 : qcp_get_word_safety_wit_2.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_2]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_3 : qcp_get_word_safety_wit_3.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_3]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_4 : qcp_get_word_safety_wit_4.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_4]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_5 : qcp_get_word_safety_wit_5.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_5]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_6 : qcp_get_word_safety_wit_6.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_6]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_7 : qcp_get_word_safety_wit_7.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_7]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_8 : qcp_get_word_safety_wit_8.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_8]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_9 : qcp_get_word_safety_wit_9.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_9]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_10 : qcp_get_word_safety_wit_10.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_10]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_11 : qcp_get_word_safety_wit_11.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_11]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_12 : qcp_get_word_safety_wit_12.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_12]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_13 : qcp_get_word_safety_wit_13.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_13]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_14 : qcp_get_word_safety_wit_14.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_14]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_15 : qcp_get_word_safety_wit_15.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_15]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_16 : qcp_get_word_safety_wit_16.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_16]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_17 : qcp_get_word_safety_wit_17.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_17]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_18 : qcp_get_word_safety_wit_18.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_18]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_19 : qcp_get_word_safety_wit_19.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_19]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_20 : qcp_get_word_safety_wit_20.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_20]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_21 : qcp_get_word_safety_wit_21.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_21]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_22 : qcp_get_word_safety_wit_22.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_22]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_23 : qcp_get_word_safety_wit_23.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_23]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_24 : qcp_get_word_safety_wit_24.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_24]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_25 : qcp_get_word_safety_wit_25.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_25]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_26 : qcp_get_word_safety_wit_26.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_26]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_27 : qcp_get_word_safety_wit_27.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_27]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_28 : qcp_get_word_safety_wit_28.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_28]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_29 : qcp_get_word_safety_wit_29.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_29]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_30 : qcp_get_word_safety_wit_30.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_30]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_safety_wit_31 : qcp_get_word_safety_wit_31.
Proof. timeout 30 (cbv delta [qcp_get_word_safety_wit_31]; pre_process;entailer!;lia). Qed.
Lemma proof_of_qcp_get_word_return_wit_1 : qcp_get_word_return_wit_1.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_1 qcp_get_word_return_wit_1_split_goal_1]; first[left|idtac];pre_process;assert(Hi:i_pre=31)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_2 : qcp_get_word_return_wit_2.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_2]; first[left|idtac];pre_process;assert(Hi:i_pre=30)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_3 : qcp_get_word_return_wit_3.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_3]; first[left|idtac];pre_process;assert(Hi:i_pre=29)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_4 : qcp_get_word_return_wit_4.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_4]; first[left|idtac];pre_process;assert(Hi:i_pre=28)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_5 : qcp_get_word_return_wit_5.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_5]; first[left|idtac];pre_process;assert(Hi:i_pre=27)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_6 : qcp_get_word_return_wit_6.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_6]; first[left|idtac];pre_process;assert(Hi:i_pre=26)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_7 : qcp_get_word_return_wit_7.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_7]; first[left|idtac];pre_process;assert(Hi:i_pre=25)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_8 : qcp_get_word_return_wit_8.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_8]; first[left|idtac];pre_process;assert(Hi:i_pre=24)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_9 : qcp_get_word_return_wit_9.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_9]; first[left|idtac];pre_process;assert(Hi:i_pre=23)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_10 : qcp_get_word_return_wit_10.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_10]; first[left|idtac];pre_process;assert(Hi:i_pre=22)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_11 : qcp_get_word_return_wit_11.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_11]; first[left|idtac];pre_process;assert(Hi:i_pre=21)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_12 : qcp_get_word_return_wit_12.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_12]; first[left|idtac];pre_process;assert(Hi:i_pre=20)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_13 : qcp_get_word_return_wit_13.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_13]; first[left|idtac];pre_process;assert(Hi:i_pre=19)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_14 : qcp_get_word_return_wit_14.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_14]; first[left|idtac];pre_process;assert(Hi:i_pre=18)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_15 : qcp_get_word_return_wit_15.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_15]; first[left|idtac];pre_process;assert(Hi:i_pre=17)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_16 : qcp_get_word_return_wit_16.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_16]; first[left|idtac];pre_process;assert(Hi:i_pre=16)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_17 : qcp_get_word_return_wit_17.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_17]; first[left|idtac];pre_process;assert(Hi:i_pre=15)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_18 : qcp_get_word_return_wit_18.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_18]; first[left|idtac];pre_process;assert(Hi:i_pre=14)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_19 : qcp_get_word_return_wit_19.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_19]; first[left|idtac];pre_process;assert(Hi:i_pre=13)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_20 : qcp_get_word_return_wit_20.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_20]; first[left|idtac];pre_process;assert(Hi:i_pre=12)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_21 : qcp_get_word_return_wit_21.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_21]; first[left|idtac];pre_process;assert(Hi:i_pre=11)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_22 : qcp_get_word_return_wit_22.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_22]; first[left|idtac];pre_process;assert(Hi:i_pre=10)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_23 : qcp_get_word_return_wit_23.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_23]; first[left|idtac];pre_process;assert(Hi:i_pre=9)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_24 : qcp_get_word_return_wit_24.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_24]; first[left|idtac];pre_process;assert(Hi:i_pre=8)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_25 : qcp_get_word_return_wit_25.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_25]; first[left|idtac];pre_process;assert(Hi:i_pre=7)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_26 : qcp_get_word_return_wit_26.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_26]; first[left|idtac];pre_process;assert(Hi:i_pre=6)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_27 : qcp_get_word_return_wit_27.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_27]; first[left|idtac];pre_process;assert(Hi:i_pre=5)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_28 : qcp_get_word_return_wit_28.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_28]; first[left|idtac];pre_process;assert(Hi:i_pre=4)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_29 : qcp_get_word_return_wit_29.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_29]; first[left|idtac];pre_process;assert(Hi:i_pre=3)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_30 : qcp_get_word_return_wit_30.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_30]; first[left|idtac];pre_process;assert(Hi:i_pre=2)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_31 : qcp_get_word_return_wit_31.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_31]; first[left|idtac];pre_process;assert(Hi:i_pre=1)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_word_return_wit_32 : qcp_get_word_return_wit_32.
Proof. timeout 30 (cbv delta [qcp_get_word_return_wit_32]; first[left|idtac];pre_process;assert(Hi:i_pre=0)by lia;subst i_pre;cbn[Znth];entailer!). Qed.
Lemma proof_of_qcp_get_byte_safety_wit_1 : qcp_get_byte_safety_wit_1.
Proof. timeout 30 (cbv delta [qcp_get_byte_safety_wit_1]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
Lemma proof_of_qcp_get_byte_safety_wit_2 : qcp_get_byte_safety_wit_2.
Proof. timeout 30 (cbv delta [qcp_get_byte_safety_wit_2]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
Lemma proof_of_qcp_get_byte_safety_wit_3 : qcp_get_byte_safety_wit_3.
Proof. timeout 30 (cbv delta [qcp_get_byte_safety_wit_3]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
Lemma proof_of_qcp_get_byte_safety_wit_4 : qcp_get_byte_safety_wit_4.
Proof. timeout 30 (cbv delta [qcp_get_byte_safety_wit_4]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
Lemma proof_of_qcp_get_byte_return_wit_1 : qcp_get_byte_return_wit_1.
Proof. timeout 30 (cbv delta [qcp_get_byte_return_wit_1 qcp_get_byte_return_wit_1_split_goal_1]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
Lemma proof_of_qcp_get_byte_partial_solve_wit_1_pure : qcp_get_byte_partial_solve_wit_1_pure.
Proof. timeout 30 (cbv delta [qcp_get_byte_partial_solve_wit_1_pure qcp_get_byte_partial_solve_wit_1_pure_split_goal_1 qcp_get_byte_partial_solve_wit_1_pure_split_goal_2]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
Lemma proof_of_qcp_get_byte_partial_solve_wit_1 : qcp_get_byte_partial_solve_wit_1.
Proof. timeout 30 (cbv delta [qcp_get_byte_partial_solve_wit_1_pure qcp_get_byte_partial_solve_wit_1_pure_split_goal_1 qcp_get_byte_partial_solve_wit_1_pure_split_goal_2 qcp_get_byte_partial_solve_wit_1_aux qcp_get_byte_partial_solve_wit_1]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
Lemma proof_of_qcp_get_byte_partial_solve_wit_2_pure : qcp_get_byte_partial_solve_wit_2_pure.
Proof. timeout 30 (cbv delta [qcp_get_byte_partial_solve_wit_2_pure qcp_get_byte_partial_solve_wit_2_pure_split_goal_1 qcp_get_byte_partial_solve_wit_2_pure_split_goal_2]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
Lemma proof_of_qcp_get_byte_partial_solve_wit_2 : qcp_get_byte_partial_solve_wit_2.
Proof. timeout 30 (cbv delta [qcp_get_byte_partial_solve_wit_2_pure qcp_get_byte_partial_solve_wit_2_pure_split_goal_1 qcp_get_byte_partial_solve_wit_2_pure_split_goal_2 qcp_get_byte_partial_solve_wit_2_aux qcp_get_byte_partial_solve_wit_2]; first[left|idtac];pre_process;unfold vec_byte in *;rewrite ?Z.quot_div_nonneg,?Z.rem_mod_nonneg in * by lia;pose proof(Z.mod_pos_bound i_pre 4 ltac:(lia))as Hm;assert(Hq:0<=i_pre/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]);assert(Hcast:unsigned_last_nbits(i_pre mod 4)32=i_pre mod 4)by(apply unsigned_last_nbits_eq;change(0<=i_pre mod 4<4294967296);lia);rewrite ?Hcast in *;entailer!;try lia;try congruence). Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_4.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_5.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_6.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_7.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_8.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_9.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_10.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_11.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_12.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_13.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_14.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_15.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_16.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_17.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_18.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_19.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_20.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_21.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_22.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_23.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_24.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_25.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_26.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_27.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_28.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_29.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_30.
Print Assumptions Checked.proof_of_qcp_get_word_safety_wit_31.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_1.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_2.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_3.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_4.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_5.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_6.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_7.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_8.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_9.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_10.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_11.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_12.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_13.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_14.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_15.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_16.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_17.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_18.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_19.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_20.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_21.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_22.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_23.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_24.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_25.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_26.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_27.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_28.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_29.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_30.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_31.
Print Assumptions Checked.proof_of_qcp_get_word_return_wit_32.
Print Assumptions Checked.proof_of_qcp_get_byte_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_get_byte_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_get_byte_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_get_byte_safety_wit_4.
Print Assumptions Checked.proof_of_qcp_get_byte_return_wit_1.
Print Assumptions Checked.proof_of_qcp_get_byte_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_qcp_get_byte_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_get_byte_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_qcp_get_byte_partial_solve_wit_2.
