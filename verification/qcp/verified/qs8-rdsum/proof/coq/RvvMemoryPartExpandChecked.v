From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import Model ProgramModel RvvModel RvvFacts StoreModel StoreFacts InitialRange RvvBounds OutputModel IntegerFacts RvvMemoryPartPure.
Local Open Scope Z_scope.
Local Opaque rd_store_lane rd_partial rd_active_wadd32 rd_out_lane rd_acc32.

Lemma rd_rvv_store_expanded : forall M base rows channels stride k vl Init,
 0<=k -> 0<=vl<=32 -> k+vl<=channels -> Zlength Init=channels -> rd_init_range Init ->
 let L:=rd_partial M base rows channels stride k Init in
 (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane (rd_store_lane L k 0 (rd_active_wadd32 (rd_out_lane L k 0 vl) (rd_acc32 M base stride k rows 0 vl) 0 vl) vl) k 1 (rd_active_wadd32 (rd_out_lane L k 1 vl) (rd_acc32 M base stride k rows 1 vl) 1 vl) vl) k 2 (rd_active_wadd32 (rd_out_lane L k 2 vl) (rd_acc32 M base stride k rows 2 vl) 2 vl) vl) k 3 (rd_active_wadd32 (rd_out_lane L k 3 vl) (rd_acc32 M base stride k rows 3 vl) 3 vl) vl) k 4 (rd_active_wadd32 (rd_out_lane L k 4 vl) (rd_acc32 M base stride k rows 4 vl) 4 vl) vl) k 5 (rd_active_wadd32 (rd_out_lane L k 5 vl) (rd_acc32 M base stride k rows 5 vl) 5 vl) vl) k 6 (rd_active_wadd32 (rd_out_lane L k 6 vl) (rd_acc32 M base stride k rows 6 vl) 6 vl) vl) k 7 (rd_active_wadd32 (rd_out_lane L k 7 vl) (rd_acc32 M base stride k rows 7 vl) 7 vl) vl) k 8 (rd_active_wadd32 (rd_out_lane L k 8 vl) (rd_acc32 M base stride k rows 8 vl) 8 vl) vl) k 9 (rd_active_wadd32 (rd_out_lane L k 9 vl) (rd_acc32 M base stride k rows 9 vl) 9 vl) vl) k 10 (rd_active_wadd32 (rd_out_lane L k 10 vl) (rd_acc32 M base stride k rows 10 vl) 10 vl) vl) k 11 (rd_active_wadd32 (rd_out_lane L k 11 vl) (rd_acc32 M base stride k rows 11 vl) 11 vl) vl) k 12 (rd_active_wadd32 (rd_out_lane L k 12 vl) (rd_acc32 M base stride k rows 12 vl) 12 vl) vl) k 13 (rd_active_wadd32 (rd_out_lane L k 13 vl) (rd_acc32 M base stride k rows 13 vl) 13 vl) vl) k 14 (rd_active_wadd32 (rd_out_lane L k 14 vl) (rd_acc32 M base stride k rows 14 vl) 14 vl) vl) k 15 (rd_active_wadd32 (rd_out_lane L k 15 vl) (rd_acc32 M base stride k rows 15 vl) 15 vl) vl) k 16 (rd_active_wadd32 (rd_out_lane L k 16 vl) (rd_acc32 M base stride k rows 16 vl) 16 vl) vl) k 17 (rd_active_wadd32 (rd_out_lane L k 17 vl) (rd_acc32 M base stride k rows 17 vl) 17 vl) vl) k 18 (rd_active_wadd32 (rd_out_lane L k 18 vl) (rd_acc32 M base stride k rows 18 vl) 18 vl) vl) k 19 (rd_active_wadd32 (rd_out_lane L k 19 vl) (rd_acc32 M base stride k rows 19 vl) 19 vl) vl) k 20 (rd_active_wadd32 (rd_out_lane L k 20 vl) (rd_acc32 M base stride k rows 20 vl) 20 vl) vl) k 21 (rd_active_wadd32 (rd_out_lane L k 21 vl) (rd_acc32 M base stride k rows 21 vl) 21 vl) vl) k 22 (rd_active_wadd32 (rd_out_lane L k 22 vl) (rd_acc32 M base stride k rows 22 vl) 22 vl) vl) k 23 (rd_active_wadd32 (rd_out_lane L k 23 vl) (rd_acc32 M base stride k rows 23 vl) 23 vl) vl) k 24 (rd_active_wadd32 (rd_out_lane L k 24 vl) (rd_acc32 M base stride k rows 24 vl) 24 vl) vl) k 25 (rd_active_wadd32 (rd_out_lane L k 25 vl) (rd_acc32 M base stride k rows 25 vl) 25 vl) vl) k 26 (rd_active_wadd32 (rd_out_lane L k 26 vl) (rd_acc32 M base stride k rows 26 vl) 26 vl) vl) k 27 (rd_active_wadd32 (rd_out_lane L k 27 vl) (rd_acc32 M base stride k rows 27 vl) 27 vl) vl) k 28 (rd_active_wadd32 (rd_out_lane L k 28 vl) (rd_acc32 M base stride k rows 28 vl) 28 vl) vl) k 29 (rd_active_wadd32 (rd_out_lane L k 29 vl) (rd_acc32 M base stride k rows 29 vl) 29 vl) vl) k 30 (rd_active_wadd32 (rd_out_lane L k 30 vl) (rd_acc32 M base stride k rows 30 vl) 30 vl) vl) k 31 (rd_active_wadd32 (rd_out_lane L k 31 vl) (rd_acc32 M base stride k rows 31 vl) 31 vl) vl) = rd_partial M base rows channels stride (k+vl) Init.
Proof.
 intros M base rows channels stride k vl Init Hk Hvl Hb Hlen Hrange; cbn zeta.
 pose proof(rd_rvv_store_finish M base rows channels stride k vl Init Hk Hvl Hb Hlen Hrange)as H.
 cbv beta iota zeta delta [rd_rvv_store_sequence rd_rvv_write_i rd_rvv_final_lane] in H.
 change (0+1) with 1 in H.
 change (1+1) with 2 in H.
 change (2+1) with 3 in H.
 change (3+1) with 4 in H.
 change (4+1) with 5 in H.
 change (5+1) with 6 in H.
 change (6+1) with 7 in H.
 change (7+1) with 8 in H.
 change (8+1) with 9 in H.
 change (9+1) with 10 in H.
 change (10+1) with 11 in H.
 change (11+1) with 12 in H.
 change (12+1) with 13 in H.
 change (13+1) with 14 in H.
 change (14+1) with 15 in H.
 change (15+1) with 16 in H.
 change (16+1) with 17 in H.
 change (17+1) with 18 in H.
 change (18+1) with 19 in H.
 change (19+1) with 20 in H.
 change (20+1) with 21 in H.
 change (21+1) with 22 in H.
 change (22+1) with 23 in H.
 change (23+1) with 24 in H.
 change (24+1) with 25 in H.
 change (25+1) with 26 in H.
 change (26+1) with 27 in H.
 change (27+1) with 28 in H.
 change (28+1) with 29 in H.
 change (29+1) with 30 in H.
 change (30+1) with 31 in H.
 exact H.
Qed.
Print Assumptions rd_rvv_store_expanded.
