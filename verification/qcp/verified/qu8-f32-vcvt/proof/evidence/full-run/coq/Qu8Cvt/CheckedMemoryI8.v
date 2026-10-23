From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import MemoryModel CharWindow CharFrame UCharArraysStrategy memory_i8_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac load_pure := intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Module CheckedMemoryI8 : Qu8Cvt.memory_i8_goal.VC_Correct.
Include Qu8Cvt.UCharArraysStrategy.CheckedUCharArrays.
Lemma proof_of_qcp_cvt_read_lane_safety_wit_1 : Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_safety_wit_1.
Proof. unfold Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_safety_wit_1;
 load_pure.
Qed.
Lemma proof_of_qcp_cvt_read_lane_entail_wit_1 : Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_entail_wit_1.
Proof. unfold Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_entail_wit_1;
 left;intros vl i pp xs idx count base H1 H2 H3 H4 H5 H6 H7 H8;subst pp;rewrite ?sizeof_uchar;replace (base+idx+i*1) with (base+(idx+i)) by lia;
 sep_apply_l_atomic (cvt_window_extract base (idx+i) count xs 0);[dump_pre_spatial;lia|neon_frame].
Qed.
Lemma proof_of_qcp_cvt_read_lane_entail_wit_2 : Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_entail_wit_2.
Proof. unfold Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_entail_wit_2;
 left;intros vl i pp xs idx count base H1 H2 H3 H4 H5 H6 H7 H8;subst pp;rewrite ?sizeof_uchar;replace (base+idx+i*1) with (base+(idx+i)) by lia;
 sep_apply_l_atomic (cvt_window_restore base (idx+i) count xs 0);[dump_pre_spatial;lia|neon_frame].
Qed.
Lemma proof_of_qcp_cvt_read_lane_return_wit_1 : Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_return_wit_1.
Proof. unfold Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_return_wit_1;
 left;intros;unfold cvt_read_lane;destruct (Z.ltb_spec i_pre vl_pre);try lia;entailer!.
Qed.
Lemma proof_of_qcp_cvt_read_lane_return_wit_2 : Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_return_wit_2.
Proof. unfold Qu8Cvt.memory_i8_goal.qcp_cvt_read_lane_return_wit_2;
 left;intros;unfold cvt_read_lane;destruct (Z.ltb_spec i_pre vl_pre);try lia;entailer!.
Qed.
Lemma proof_of_vld1_u8_safety_wit_1 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_1.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_1;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_2 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_2.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_2;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_3 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_3.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_3;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_4 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_4.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_4;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_5 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_5.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_5;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_6 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_6.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_6;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_7 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_7.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_7;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_8 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_8.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_8;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_9 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_9.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_9;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_10 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_10.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_10;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_11 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_11.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_11;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_12 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_12.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_12;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_13 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_13.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_13;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_14 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_14.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_14;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_15 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_15.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_15;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_safety_wit_16 : Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_16.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_safety_wit_16;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_return_wit_1 : Qu8Cvt.memory_i8_goal.vld1_u8_return_wit_1.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_return_wit_1;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_1_pure : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_1_pure.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_1_pure;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_1 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_1.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_1;
 unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_1_aux;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_2_pure : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_2_pure.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_2_pure;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_2 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_2.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_2;
 unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_2_aux;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_3_pure : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_3_pure.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_3_pure;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_3 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_3.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_3;
 unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_3_aux;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_4_pure : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_4_pure.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_4_pure;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_4 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_4.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_4;
 unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_4_aux;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_5_pure : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_5_pure.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_5_pure;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_5 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_5.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_5;
 unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_5_aux;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_6_pure : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_6_pure.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_6_pure;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_6 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_6.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_6;
 unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_6_aux;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_7_pure : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_7_pure.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_7_pure;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_7 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_7.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_7;
 unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_7_aux;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_8_pure : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_8_pure.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_8_pure;
 load_pure.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_8 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_8.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_8;
 unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_8_aux;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_9 : Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_9.
Proof. unfold Qu8Cvt.memory_i8_goal.vld1_u8_partial_solve_wit_9;
 try left;intros;unfold cvt_read_lane in *;
 repeat match goal with H : _ = (if Z.ltb ?a ?b then _ else _) |- _ =>
  let E := fresh "Eread" in assert (E:Z.ltb a b=true) by reflexivity;rewrite E in H;clear E
 end;subst;neon_frame.
Qed.
End CheckedMemoryI8.
