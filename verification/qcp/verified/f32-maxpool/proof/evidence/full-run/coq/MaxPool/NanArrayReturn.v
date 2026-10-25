From Coq Require Import ZArith Lia List.
From MaxPool Require Import Bits NanArrayPrefixFacts propagate_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma root_return_lane_31 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_1.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_1;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 31 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 31 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_30 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_2.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_2;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 30 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 30 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_29 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_3.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_3;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 29 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 29 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_28 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_4.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_4;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 28 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 28 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_27 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_5.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_5;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 27 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 27 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_26 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_6.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_6;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 26 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 26 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_25 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_7.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_7;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 25 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 25 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_24 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_8.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_8;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 24 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 24 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_23 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_9.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_9;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 23 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 23 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_22 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_10.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_10;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 22 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 22 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_21 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_11.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_11;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 21 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 21 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_20 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_12.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_12;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 20 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 20 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_19 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_13.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_13;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 19 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 19 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_18 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_14.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_14;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 18 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 18 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_17 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_15.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_15;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 17 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 17 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_16 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_16.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_16;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 16 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 16 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_15 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_17.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_17;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 15 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 15 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_14 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_18.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_18;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 14 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 14 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_13 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_19.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_19;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 13 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 13 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_12 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_20.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_20;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 12 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 12 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_11 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_21.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_21;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 11 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 11 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_10 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_22.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_22;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 10 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 10 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_9 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_23.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_23;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 9 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 9 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_8 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_24.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_24;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 8 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 8 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_7 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_25.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_25;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 7 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 7 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_6 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_26.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_26;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 6 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 6 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_5 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_27.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_27;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 5 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 5 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_4 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_28.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_28;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 4 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 4 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_3 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_29.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_29;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 3 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 3 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_2 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_30.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_30;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 2 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 2 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_1 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_31.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_31;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 1 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 1 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma root_return_lane_0 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1_split_goal_32.
Proof. unfold mp_propagate_nan_return_wit_1_split_goal_32;intros;unfold mp_fmatch;intro Hactive.
match goal with H:mp_zmatch 0 _ _ _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end.
unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia.
destruct(Z.ltb_spec 0 i);[|lia].
rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]). reflexivity. Qed.
Lemma proof_of_mp_propagate_nan_return_wit_1 : MaxPool.propagate_goal.mp_propagate_nan_return_wit_1.
Proof. unfold mp_propagate_nan_return_wit_1;right;intros;entailer!;unfold andp,coq_prop in *;repeat split;try assumption;
lazymatch goal with |- mp_fmatch ?lane ?vl (fp32_of_bits ?actual) _=>
 unfold mp_fmatch;intro Hactive;
 match goal with H:mp_zmatch lane vl actual _|-_=>unfold mp_zmatch in H;specialize(H Hactive);rewrite H end;
 unfold mp_restore_float;f_equal;rewrite mp_restore_prefix_index by lia;
 destruct(Z.ltb_spec lane i);[|lia];
 rewrite !mp_u32_prefix_active by(first[lia|change(vl_pre<=32);lia]);reflexivity
end. Qed.
Print Assumptions root_return_lane_0.
Print Assumptions root_return_lane_1.
Print Assumptions root_return_lane_2.
Print Assumptions root_return_lane_3.
Print Assumptions root_return_lane_4.
Print Assumptions root_return_lane_5.
Print Assumptions root_return_lane_6.
Print Assumptions root_return_lane_7.
Print Assumptions root_return_lane_8.
Print Assumptions root_return_lane_9.
Print Assumptions root_return_lane_10.
Print Assumptions root_return_lane_11.
Print Assumptions root_return_lane_12.
Print Assumptions root_return_lane_13.
Print Assumptions root_return_lane_14.
Print Assumptions root_return_lane_15.
Print Assumptions root_return_lane_16.
Print Assumptions root_return_lane_17.
Print Assumptions root_return_lane_18.
Print Assumptions root_return_lane_19.
Print Assumptions root_return_lane_20.
Print Assumptions root_return_lane_21.
Print Assumptions root_return_lane_22.
Print Assumptions root_return_lane_23.
Print Assumptions root_return_lane_24.
Print Assumptions root_return_lane_25.
Print Assumptions root_return_lane_26.
Print Assumptions root_return_lane_27.
Print Assumptions root_return_lane_28.
Print Assumptions root_return_lane_29.
Print Assumptions root_return_lane_30.
Print Assumptions root_return_lane_31.
Print Assumptions proof_of_mp_propagate_nan_return_wit_1.
