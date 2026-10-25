(* Migration of the checked QC8W NEON K8 and K-tail recurrence. *)
From Coq Require Import ZArith Lia.
From Qs8Gemm Require Import Model MemoryFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma qs8_mac_acc_step : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_acc d tile lane A Ps)
  (qs8_char 1 tile (8*d) lane A Ps) (qs8_char 0 tile d 0 A Ps) =
 qs8_acc (d+1) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd;rewrite qs8_acc_step by exact Hd.
 unfold qs8_char,qs8_zget;cbn [Z.eqb];rewrite Z.add_0_r.
 unfold qs8_mac;rewrite Z.mul_comm;reflexivity.
Qed.
Lemma qs8_char_a_offset : forall tile d offset A Ps,
 qs8_char 0 tile d offset A Ps = qs8_char 0 tile (d+offset) 0 A Ps.
Proof. intros;unfold qs8_char;rewrite Z.add_0_r;reflexivity. Qed.
Lemma qs8_lane4_0 : forall a b c d,qs8_lane4 0 a b c d=a.
Proof. reflexivity. Qed.
Lemma qs8_lane4_1 : forall a b c d,qs8_lane4 1 a b c d=b.
Proof. reflexivity. Qed.
Lemma qs8_lane4_2 : forall a b c d,qs8_lane4 2 a b c d=c.
Proof. reflexivity. Qed.
Lemma qs8_lane4_3 : forall a b c d,qs8_lane4 3 a b c d=d.
Proof. reflexivity. Qed.
Lemma qs8_mac8 : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_acc d tile lane A Ps) (qs8_char 1 tile (8*(d+0)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+1)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+2)) lane A Ps) (qs8_lane4 2 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+3)) lane A Ps) (qs8_lane4 3 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+4)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps))) (qs8_char 1 tile (8*(d+5)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps))) (qs8_char 1 tile (8*(d+6)) lane A Ps) (qs8_lane4 2 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps))) (qs8_char 1 tile (8*(d+7)) lane A Ps) (qs8_lane4 3 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps)) = qs8_acc (d+8) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd.
 rewrite ?qs8_lane4_0,?qs8_lane4_1,?qs8_lane4_2,?qs8_lane4_3.
 rewrite (qs8_char_a_offset tile d 1 A Ps).
 rewrite (qs8_char_a_offset tile d 2 A Ps).
 rewrite (qs8_char_a_offset tile d 3 A Ps).
 rewrite (qs8_char_a_offset tile d 4 A Ps).
 rewrite (qs8_char_a_offset tile d 5 A Ps).
 rewrite (qs8_char_a_offset tile d 6 A Ps).
 rewrite (qs8_char_a_offset tile d 7 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qs8_mac_acc_step by lia.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+4)+1) with (d+5) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+5)+1) with (d+6) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+6)+1) with (d+7) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+7)+1) with (d+8) by ring.
 reflexivity. Qed.
Print Assumptions qs8_mac8.

Lemma qs8_mac_tail1 : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_acc d tile lane A Ps) (qs8_char 1 tile (8*(d+0)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps)) = qs8_acc (d+1) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd.
 rewrite ?qs8_lane4_0,?qs8_lane4_1,?qs8_lane4_2,?qs8_lane4_3.
 rewrite ?Z.add_0_r.
 rewrite qs8_mac_acc_step by lia.
 reflexivity. Qed.
Print Assumptions qs8_mac_tail1.
Lemma qs8_mac_tail2 : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_mac (qs8_acc d tile lane A Ps) (qs8_char 1 tile (8*(d+0)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+1)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps)) = qs8_acc (d+2) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd.
 rewrite ?qs8_lane4_0,?qs8_lane4_1,?qs8_lane4_2,?qs8_lane4_3.
 rewrite (qs8_char_a_offset tile d 1 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qs8_mac_acc_step by lia.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 reflexivity. Qed.
Print Assumptions qs8_mac_tail2.
Lemma qs8_mac_tail3 : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_mac (qs8_mac (qs8_acc d tile lane A Ps) (qs8_char 1 tile (8*(d+0)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+1)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+2)) lane A Ps) (qs8_lane4 2 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps)) = qs8_acc (d+3) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd.
 rewrite ?qs8_lane4_0,?qs8_lane4_1,?qs8_lane4_2,?qs8_lane4_3.
 rewrite (qs8_char_a_offset tile d 1 A Ps).
 rewrite (qs8_char_a_offset tile d 2 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qs8_mac_acc_step by lia.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 reflexivity. Qed.
Print Assumptions qs8_mac_tail3.
Lemma qs8_mac_tail4 : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_acc d tile lane A Ps) (qs8_char 1 tile (8*(d+0)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+1)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+2)) lane A Ps) (qs8_lane4 2 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+3)) lane A Ps) (qs8_lane4 3 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps)) = qs8_acc (d+4) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd.
 rewrite ?qs8_lane4_0,?qs8_lane4_1,?qs8_lane4_2,?qs8_lane4_3.
 rewrite (qs8_char_a_offset tile d 1 A Ps).
 rewrite (qs8_char_a_offset tile d 2 A Ps).
 rewrite (qs8_char_a_offset tile d 3 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qs8_mac_acc_step by lia.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 reflexivity. Qed.
Print Assumptions qs8_mac_tail4.
Lemma qs8_mac_tail5 : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_acc d tile lane A Ps) (qs8_char 1 tile (8*(d+0)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+1)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+2)) lane A Ps) (qs8_lane4 2 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+3)) lane A Ps) (qs8_lane4 3 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+4)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps)) = qs8_acc (d+5) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd.
 rewrite ?qs8_lane4_0,?qs8_lane4_1,?qs8_lane4_2,?qs8_lane4_3.
 rewrite (qs8_char_a_offset tile d 1 A Ps).
 rewrite (qs8_char_a_offset tile d 2 A Ps).
 rewrite (qs8_char_a_offset tile d 3 A Ps).
 rewrite (qs8_char_a_offset tile d 4 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qs8_mac_acc_step by lia.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+4)+1) with (d+5) by ring.
 reflexivity. Qed.
Print Assumptions qs8_mac_tail5.
Lemma qs8_mac_tail6 : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_acc d tile lane A Ps) (qs8_char 1 tile (8*(d+0)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+1)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+2)) lane A Ps) (qs8_lane4 2 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+3)) lane A Ps) (qs8_lane4 3 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+4)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps))) (qs8_char 1 tile (8*(d+5)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps)) = qs8_acc (d+6) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd.
 rewrite ?qs8_lane4_0,?qs8_lane4_1,?qs8_lane4_2,?qs8_lane4_3.
 rewrite (qs8_char_a_offset tile d 1 A Ps).
 rewrite (qs8_char_a_offset tile d 2 A Ps).
 rewrite (qs8_char_a_offset tile d 3 A Ps).
 rewrite (qs8_char_a_offset tile d 4 A Ps).
 rewrite (qs8_char_a_offset tile d 5 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qs8_mac_acc_step by lia.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+4)+1) with (d+5) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+5)+1) with (d+6) by ring.
 reflexivity. Qed.
Print Assumptions qs8_mac_tail6.
Lemma qs8_mac_tail7 : forall d tile lane A Ps, 0<=d ->
 qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_mac (qs8_acc d tile lane A Ps) (qs8_char 1 tile (8*(d+0)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+1)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+2)) lane A Ps) (qs8_lane4 2 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+3)) lane A Ps) (qs8_lane4 3 (qs8_char 0 tile d 0 A Ps) (qs8_char 0 tile d 1 A Ps) (qs8_char 0 tile d 2 A Ps) (qs8_char 0 tile d 3 A Ps))) (qs8_char 1 tile (8*(d+4)) lane A Ps) (qs8_lane4 0 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps))) (qs8_char 1 tile (8*(d+5)) lane A Ps) (qs8_lane4 1 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps))) (qs8_char 1 tile (8*(d+6)) lane A Ps) (qs8_lane4 2 (qs8_char 0 tile d 4 A Ps) (qs8_char 0 tile d 5 A Ps) (qs8_char 0 tile d 6 A Ps) (qs8_char 0 tile d 7 A Ps)) = qs8_acc (d+7) tile lane A Ps.
Proof.
 intros d tile lane A Ps Hd.
 rewrite ?qs8_lane4_0,?qs8_lane4_1,?qs8_lane4_2,?qs8_lane4_3.
 rewrite (qs8_char_a_offset tile d 1 A Ps).
 rewrite (qs8_char_a_offset tile d 2 A Ps).
 rewrite (qs8_char_a_offset tile d 3 A Ps).
 rewrite (qs8_char_a_offset tile d 4 A Ps).
 rewrite (qs8_char_a_offset tile d 5 A Ps).
 rewrite (qs8_char_a_offset tile d 6 A Ps).
 rewrite ?Z.add_0_r.
 rewrite qs8_mac_acc_step by lia.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+1)+1) with (d+2) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+2)+1) with (d+3) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+3)+1) with (d+4) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+4)+1) with (d+5) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+5)+1) with (d+6) by ring.
 rewrite qs8_mac_acc_step by lia.
 replace ((d+6)+1) with (d+7) by ring.
 reflexivity. Qed.
Print Assumptions qs8_mac_tail7.

