From Coq Require Import ZArith Lia.
From Qs8Add Require Import MemoryModel SignedWindow NeonFrame neon_load_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac load_pure := intros;unfold derivable1,andp,coq_prop;intros;repeat first [assumption|split|reflexivity];lia.
Module CheckedNeonLoad : Qs8Add.neon_load_goal.VC_Correct.
Include Qs8Add.S8ArraysStrategy.CheckedS8Arrays.
Lemma proof_of_qcp_s8_read_lane_safety_wit_1 : Qs8Add.neon_load_goal.qcp_s8_read_lane_safety_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_read_lane_safety_wit_1;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_read_lane_entail_wit_1 : Qs8Add.neon_load_goal.qcp_s8_read_lane_entail_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_read_lane_entail_wit_1;
 left;intros vl i pp xs idx count base H1 H2 H3 H4 H5 H6 H7 H8;subst pp;rewrite ?sizeof_char;replace (base+idx+i*1) with (base+(idx+i)) by lia;
 sep_apply_l_atomic (s8_window_extract base (idx+i) count xs 0);[dump_pre_spatial;lia|neon_frame].
Qed.
Lemma proof_of_qcp_s8_read_lane_entail_wit_2 : Qs8Add.neon_load_goal.qcp_s8_read_lane_entail_wit_2.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_read_lane_entail_wit_2;
 left;intros vl i pp xs idx count base H1 H2 H3 H4 H5 H6 H7 H8;subst pp;rewrite ?sizeof_char;replace (base+idx+i*1) with (base+(idx+i)) by lia;
 sep_apply_l_atomic (s8_window_restore base (idx+i) count xs 0);[dump_pre_spatial;lia|neon_frame].
Qed.
Lemma proof_of_qcp_s8_read_lane_return_wit_1 : Qs8Add.neon_load_goal.qcp_s8_read_lane_return_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_read_lane_return_wit_1;
 left;intros;unfold s8_read_lane;destruct (Z.ltb_spec i_pre vl_pre);try lia;entailer!.
Qed.
Lemma proof_of_qcp_s8_read_lane_return_wit_2 : Qs8Add.neon_load_goal.qcp_s8_read_lane_return_wit_2.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_read_lane_return_wit_2;
 left;intros;unfold s8_read_lane;destruct (Z.ltb_spec i_pre vl_pre);try lia;entailer!.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_1 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_1;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_2 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_2.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_2;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_3 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_3.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_3;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_4 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_4.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_4;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_5 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_5.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_5;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_6 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_6.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_6;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_7 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_7.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_7;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_8 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_8.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_8;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_9 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_9.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_9;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_10 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_10.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_10;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_11 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_11.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_11;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_12 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_12.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_12;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_13 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_13.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_13;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_14 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_14.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_14;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_15 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_15.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_15;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_safety_wit_16 : Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_16.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_safety_wit_16;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_return_wit_1 : Qs8Add.neon_load_goal.qcp_s8_load8_return_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_return_wit_1;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_1_pure : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_1_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_1_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_1 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_1;
 unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_1_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_2_pure : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_2_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_2_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_2 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_2.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_2;
 unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_2_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_3_pure : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_3_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_3_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_3 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_3.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_3;
 unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_3_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_4_pure : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_4_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_4_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_4 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_4.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_4;
 unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_4_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_5_pure : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_5_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_5_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_5 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_5.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_5;
 unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_5_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_6_pure : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_6_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_6_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_6 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_6.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_6;
 unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_6_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_7_pure : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_7_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_7_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_7 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_7.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_7;
 unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_7_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_8_pure : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_8_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_8_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_8 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_8.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_8;
 unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_8_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load8_partial_solve_wit_9 : Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_9.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load8_partial_solve_wit_9;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_1 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_1;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_2 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_2.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_2;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_3 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_3.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_3;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_4 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_4.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_4;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_5 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_5.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_5;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_6 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_6.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_6;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_7 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_7.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_7;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_8 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_8.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_8;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_9 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_9.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_9;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_10 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_10.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_10;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_11 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_11.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_11;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_12 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_12.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_12;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_13 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_13.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_13;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_14 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_14.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_14;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_15 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_15.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_15;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_16 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_16.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_16;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_17 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_17.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_17;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_18 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_18.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_18;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_19 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_19.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_19;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_20 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_20.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_20;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_21 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_21.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_21;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_22 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_22.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_22;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_23 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_23.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_23;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_24 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_24.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_24;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_25 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_25.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_25;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_26 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_26.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_26;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_27 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_27.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_27;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_28 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_28.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_28;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_29 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_29.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_29;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_30 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_30.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_30;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_31 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_31.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_31;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_safety_wit_32 : Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_32.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_safety_wit_32;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_return_wit_1 : Qs8Add.neon_load_goal.qcp_s8_load16_return_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_return_wit_1;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_1_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_1_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_1_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_1 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_1.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_1;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_1_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_2_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_2_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_2_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_2 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_2.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_2;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_2_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_3_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_3_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_3_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_3 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_3.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_3;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_3_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_4_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_4_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_4_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_4 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_4.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_4;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_4_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_5_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_5_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_5_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_5 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_5.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_5;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_5_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_6_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_6_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_6_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_6 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_6.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_6;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_6_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_7_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_7_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_7_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_7 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_7.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_7;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_7_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_8_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_8_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_8_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_8 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_8.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_8;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_8_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_9_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_9_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_9_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_9 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_9.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_9;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_9_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_10_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_10_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_10_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_10 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_10.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_10;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_10_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_11_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_11_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_11_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_11 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_11.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_11;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_11_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_12_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_12_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_12_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_12 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_12.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_12;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_12_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_13_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_13_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_13_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_13 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_13.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_13;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_13_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_14_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_14_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_14_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_14 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_14.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_14;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_14_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_15_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_15_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_15_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_15 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_15.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_15;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_15_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_16_pure : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_16_pure.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_16_pure;
 load_pure.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_16 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_16.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_16;
 unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_16_aux;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_qcp_s8_load16_partial_solve_wit_17 : Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_17.
Proof. unfold Qs8Add.neon_load_goal.qcp_s8_load16_partial_solve_wit_17;
 try left;intros;unfold s8_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
End CheckedNeonLoad.
