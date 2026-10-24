From Coq Require Import ZArith Lia.
From Qd8API Require Import ApiModel.
From Qd8Resume_mac02 Require Import KernelMac.
Local Open Scope Z_scope.
Lemma qd8_mac_tail1 : forall K d tile lane zp A Ps, 0<=d ->
 qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps) (qd8_char_field 1 tile (8*(d+0)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps)) = qd8_acc_signed K (d+1) tile lane zp A Ps.
Proof.
 intros K d tile lane zp A Ps Hd.
 rewrite ?qd8_i16_lane_0,?qd8_i16_lane_1,?qd8_i16_lane_2,?qd8_i16_lane_3.
 rewrite ?Z.add_0_r.
 rewrite qd8_mac_acc_step by lia.
 reflexivity. Qed.
Print Assumptions qd8_mac_tail1.
Lemma qd8_mac_tail2 : forall K d tile lane zp A Ps, 0<=d ->
 qd8_mac_signed (qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps) (qd8_char_field 1 tile (8*(d+0)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+1)) lane A Ps) (qd8_i16_lane 1 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps)) = qd8_acc_signed K (d+2) tile lane zp A Ps.
Proof.
 intros K d tile lane zp A Ps Hd.
 rewrite ?qd8_i16_lane_0,?qd8_i16_lane_1,?qd8_i16_lane_2,?qd8_i16_lane_3.
 rewrite (qd8_char_a_offset tile d 1 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qd8_mac_acc_step by lia.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 reflexivity. Qed.
Print Assumptions qd8_mac_tail2.
Lemma qd8_mac_tail3 : forall K d tile lane zp A Ps, 0<=d ->
 qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps) (qd8_char_field 1 tile (8*(d+0)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+1)) lane A Ps) (qd8_i16_lane 1 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+2)) lane A Ps) (qd8_i16_lane 2 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps)) = qd8_acc_signed K (d+3) tile lane zp A Ps.
Proof.
 intros K d tile lane zp A Ps Hd.
 rewrite ?qd8_i16_lane_0,?qd8_i16_lane_1,?qd8_i16_lane_2,?qd8_i16_lane_3.
 rewrite (qd8_char_a_offset tile d 1 A Ps).
 rewrite (qd8_char_a_offset tile d 2 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qd8_mac_acc_step by lia.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 reflexivity. Qed.
Print Assumptions qd8_mac_tail3.
Lemma qd8_mac_tail4 : forall K d tile lane zp A Ps, 0<=d ->
 qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps) (qd8_char_field 1 tile (8*(d+0)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+1)) lane A Ps) (qd8_i16_lane 1 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+2)) lane A Ps) (qd8_i16_lane 2 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+3)) lane A Ps) (qd8_i16_lane 3 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps)) = qd8_acc_signed K (d+4) tile lane zp A Ps.
Proof.
 intros K d tile lane zp A Ps Hd.
 rewrite ?qd8_i16_lane_0,?qd8_i16_lane_1,?qd8_i16_lane_2,?qd8_i16_lane_3.
 rewrite (qd8_char_a_offset tile d 1 A Ps).
 rewrite (qd8_char_a_offset tile d 2 A Ps).
 rewrite (qd8_char_a_offset tile d 3 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qd8_mac_acc_step by lia.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 reflexivity. Qed.
Print Assumptions qd8_mac_tail4.
Lemma qd8_mac_tail5 : forall K d tile lane zp A Ps, 0<=d ->
 qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps) (qd8_char_field 1 tile (8*(d+0)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+1)) lane A Ps) (qd8_i16_lane 1 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+2)) lane A Ps) (qd8_i16_lane 2 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+3)) lane A Ps) (qd8_i16_lane 3 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+4)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 4 A Ps) (qd8_char_field 0 tile d 5 A Ps) (qd8_char_field 0 tile d 6 A Ps) (qd8_char_field 0 tile d 7 A Ps)) = qd8_acc_signed K (d+5) tile lane zp A Ps.
Proof.
 intros K d tile lane zp A Ps Hd.
 rewrite ?qd8_i16_lane_0,?qd8_i16_lane_1,?qd8_i16_lane_2,?qd8_i16_lane_3.
 rewrite (qd8_char_a_offset tile d 1 A Ps).
 rewrite (qd8_char_a_offset tile d 2 A Ps).
 rewrite (qd8_char_a_offset tile d 3 A Ps).
 rewrite (qd8_char_a_offset tile d 4 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qd8_mac_acc_step by lia.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+4)+1) with (d+5) by ring.
 reflexivity. Qed.
Print Assumptions qd8_mac_tail5.
Lemma qd8_mac_tail6 : forall K d tile lane zp A Ps, 0<=d ->
 qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps) (qd8_char_field 1 tile (8*(d+0)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+1)) lane A Ps) (qd8_i16_lane 1 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+2)) lane A Ps) (qd8_i16_lane 2 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+3)) lane A Ps) (qd8_i16_lane 3 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+4)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 4 A Ps) (qd8_char_field 0 tile d 5 A Ps) (qd8_char_field 0 tile d 6 A Ps) (qd8_char_field 0 tile d 7 A Ps))) (qd8_char_field 1 tile (8*(d+5)) lane A Ps) (qd8_i16_lane 1 (qd8_char_field 0 tile d 4 A Ps) (qd8_char_field 0 tile d 5 A Ps) (qd8_char_field 0 tile d 6 A Ps) (qd8_char_field 0 tile d 7 A Ps)) = qd8_acc_signed K (d+6) tile lane zp A Ps.
Proof.
 intros K d tile lane zp A Ps Hd.
 rewrite ?qd8_i16_lane_0,?qd8_i16_lane_1,?qd8_i16_lane_2,?qd8_i16_lane_3.
 rewrite (qd8_char_a_offset tile d 1 A Ps).
 rewrite (qd8_char_a_offset tile d 2 A Ps).
 rewrite (qd8_char_a_offset tile d 3 A Ps).
 rewrite (qd8_char_a_offset tile d 4 A Ps).
 rewrite (qd8_char_a_offset tile d 5 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qd8_mac_acc_step by lia.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+4)+1) with (d+5) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+5)+1) with (d+6) by ring.
 reflexivity. Qed.
Print Assumptions qd8_mac_tail6.
Lemma qd8_mac_tail7 : forall K d tile lane zp A Ps, 0<=d ->
 qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps) (qd8_char_field 1 tile (8*(d+0)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+1)) lane A Ps) (qd8_i16_lane 1 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+2)) lane A Ps) (qd8_i16_lane 2 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+3)) lane A Ps) (qd8_i16_lane 3 (qd8_char_field 0 tile d 0 A Ps) (qd8_char_field 0 tile d 1 A Ps) (qd8_char_field 0 tile d 2 A Ps) (qd8_char_field 0 tile d 3 A Ps))) (qd8_char_field 1 tile (8*(d+4)) lane A Ps) (qd8_i16_lane 0 (qd8_char_field 0 tile d 4 A Ps) (qd8_char_field 0 tile d 5 A Ps) (qd8_char_field 0 tile d 6 A Ps) (qd8_char_field 0 tile d 7 A Ps))) (qd8_char_field 1 tile (8*(d+5)) lane A Ps) (qd8_i16_lane 1 (qd8_char_field 0 tile d 4 A Ps) (qd8_char_field 0 tile d 5 A Ps) (qd8_char_field 0 tile d 6 A Ps) (qd8_char_field 0 tile d 7 A Ps))) (qd8_char_field 1 tile (8*(d+6)) lane A Ps) (qd8_i16_lane 2 (qd8_char_field 0 tile d 4 A Ps) (qd8_char_field 0 tile d 5 A Ps) (qd8_char_field 0 tile d 6 A Ps) (qd8_char_field 0 tile d 7 A Ps)) = qd8_acc_signed K (d+7) tile lane zp A Ps.
Proof.
 intros K d tile lane zp A Ps Hd.
 rewrite ?qd8_i16_lane_0,?qd8_i16_lane_1,?qd8_i16_lane_2,?qd8_i16_lane_3.
 rewrite (qd8_char_a_offset tile d 1 A Ps).
 rewrite (qd8_char_a_offset tile d 2 A Ps).
 rewrite (qd8_char_a_offset tile d 3 A Ps).
 rewrite (qd8_char_a_offset tile d 4 A Ps).
 rewrite (qd8_char_a_offset tile d 5 A Ps).
 rewrite (qd8_char_a_offset tile d 6 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qd8_mac_acc_step by lia.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+4)+1) with (d+5) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+5)+1) with (d+6) by ring.
 rewrite qd8_mac_acc_step by lia.
 replace ((d+6)+1) with (d+7) by ring.
 reflexivity. Qed.
Print Assumptions qd8_mac_tail7.
Lemma qd8_f32_lane0 : forall a b,qd8_f32_lane 0 a b=a.
Proof. reflexivity. Qed.
Lemma qd8_f32_lane1 : forall a b,qd8_f32_lane 1 a b=b.
Proof. reflexivity. Qed.
