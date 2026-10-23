From Coq Require Import ZArith Lia.
From S8Clamp Require Import MemoryModel SignedWindow NeonFrame neon_load_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac load_pure := intros;unfold derivable1,andp,coq_prop;intros;repeat first [assumption|split|reflexivity];lia.
Module CheckedNeonLoad : S8Clamp.neon_load_goal.VC_Correct.
Include S8Clamp.S8ArraysStrategy.CheckedS8Arrays.
Lemma proof_of_qcp_s8_read_lane_safety_wit_1 : S8Clamp.neon_load_goal.qcp_s8_read_lane_safety_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_read_lane_safety_wit_1;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_read_lane_entail_wit_1 : S8Clamp.neon_load_goal.qcp_s8_read_lane_entail_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_read_lane_entail_wit_1;
 left;intros vl i pp xs idx count base H1 H2 H3 H4 H5 H6 H7 H8;subst pp;rewrite ?sizeof_char;replace (base+idx+i*1) with (base+(idx+i)) by lia;
 sep_apply_l_atomic (s8_window_extract base (idx+i) count xs 0);[dump_pre_spatial;lia|neon_frame].
Qed.
Lemma proof_of_qcp_s8_read_lane_entail_wit_2 : S8Clamp.neon_load_goal.qcp_s8_read_lane_entail_wit_2.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_read_lane_entail_wit_2;
 left;intros vl i pp xs idx count base H1 H2 H3 H4 H5 H6 H7 H8;subst pp;rewrite ?sizeof_char;replace (base+idx+i*1) with (base+(idx+i)) by lia;
 sep_apply_l_atomic (s8_window_restore base (idx+i) count xs 0);[dump_pre_spatial;lia|neon_frame].
Qed.
Lemma proof_of_qcp_s8_read_lane_return_wit_1 : S8Clamp.neon_load_goal.qcp_s8_read_lane_return_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_read_lane_return_wit_1;
 left;intros;unfold s8_read_lane;destruct (Z.ltb_spec i_pre vl_pre);try lia;entailer!.
Qed.
Lemma proof_of_qcp_s8_read_lane_return_wit_2 : S8Clamp.neon_load_goal.qcp_s8_read_lane_return_wit_2.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_read_lane_return_wit_2;
 left;intros;unfold s8_read_lane;destruct (Z.ltb_spec i_pre vl_pre);try lia;entailer!.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_1 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_1;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_2 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_2.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_2;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_3 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_3.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_3;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_4 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_4.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_4;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_5 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_5.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_5;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_6 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_6.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_6;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_7 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_7.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_7;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_8 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_8.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_8;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_9 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_9.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_9;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_10 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_10.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_10;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_11 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_11.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_11;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_12 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_12.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_12;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_13 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_13.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_13;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_14 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_14.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_14;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_15 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_15.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_15;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_16 : S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_16.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_safety_wit_16;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_return_wit_1 : S8Clamp.neon_load_goal.qcp_s8_load8_return_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_return_wit_1;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_1_pure : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_1_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_1 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_1;
 unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_1_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_2_pure : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_2_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_2_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_2 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_2.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_2;
 unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_2_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_3_pure : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_3_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_3_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_3 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_3.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_3;
 unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_3_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_4_pure : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_4_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_4_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_4 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_4.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_4;
 unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_4_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_5_pure : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_5_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_5_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_5 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_5.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_5;
 unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_5_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_6_pure : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_6_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_6_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_6 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_6.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_6;
 unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_6_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_7_pure : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_7_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_7_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_7 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_7.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_7;
 unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_7_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_8_pure : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_8_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_8_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_8 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_8.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_8;
 unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_8_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_9 : S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_9.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load8_partial_solve_wit_9;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_1 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_1;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_2 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_2.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_2;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_3 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_3.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_3;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_4 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_4.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_4;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_5 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_5.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_5;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_6 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_6.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_6;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_7 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_7.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_7;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_8 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_8.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_8;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_9 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_9.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_9;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_10 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_10.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_10;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_11 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_11.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_11;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_12 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_12.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_12;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_13 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_13.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_13;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_14 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_14.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_14;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_15 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_15.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_15;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_16 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_16.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_16;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_17 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_17.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_17;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_18 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_18.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_18;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_19 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_19.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_19;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_20 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_20.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_20;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_21 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_21.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_21;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_22 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_22.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_22;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_23 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_23.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_23;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_24 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_24.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_24;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_25 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_25.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_25;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_26 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_26.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_26;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_27 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_27.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_27;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_28 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_28.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_28;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_29 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_29.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_29;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_30 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_30.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_30;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_31 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_31.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_31;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_32 : S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_32.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_safety_wit_32;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_return_wit_1 : S8Clamp.neon_load_goal.qcp_s8_load16_return_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_return_wit_1;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_1_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_1_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_1 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_1.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_1;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_1_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_2_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_2_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_2_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_2 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_2.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_2;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_2_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_3_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_3_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_3_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_3 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_3.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_3;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_3_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_4_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_4_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_4_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_4 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_4.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_4;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_4_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_5_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_5_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_5_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_5 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_5.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_5;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_5_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_6_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_6_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_6_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_6 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_6.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_6;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_6_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_7_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_7_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_7_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_7 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_7.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_7;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_7_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_8_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_8_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_8_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_8 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_8.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_8;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_8_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_9_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_9_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_9_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_9 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_9.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_9;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_9_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_10_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_10_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_10_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_10 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_10.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_10;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_10_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_11_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_11_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_11_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_11 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_11.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_11;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_11_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_12_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_12_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_12_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_12 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_12.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_12;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_12_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_13_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_13_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_13_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_13 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_13.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_13;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_13_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_14_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_14_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_14_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_14 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_14.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_14;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_14_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_15_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_15_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_15_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_15 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_15.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_15;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_15_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_16_pure : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_16_pure.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_16_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_16 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_16.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_16;
 unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_16_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_17 : S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_17.
Proof. unfold S8Clamp.neon_load_goal.qcp_s8_load16_partial_solve_wit_17;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
End CheckedNeonLoad.
