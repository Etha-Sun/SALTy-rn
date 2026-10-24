From Coq Require Import ZArith List Lia.
From Qd8RvvLoopMath3 Require Export RvvLoopMath.
From GemmSpec Require Import FmaModel IntrinsicModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qd8_rvv_completed_panel_block : forall K done zp A Ps inv lo hi n,
 0<=done -> Z.rem done 8=0 -> (n<=8)%nat ->
 qd8_rvv_completed K done zp A Ps inv lo hi ++
 map (fun j=>qd8_rvv_final_lane K (Z.quot done 8) (Z.of_nat j) zp A Ps inv lo hi)
     (seq 0 n) =
 qd8_rvv_completed K (done+Z.of_nat n) zp A Ps inv lo hi.
Proof.
 intros K done zp A Ps inv lo hi n Hd Hr;induction n;intro Hn.
 - cbn [seq map Z.of_nat];rewrite app_nil_r,Z.add_0_r;reflexivity.
 - rewrite seq_S,map_app,app_assoc.
   rewrite IHn by lia.
   cbn [map];rewrite Nat.add_0_l.
   rewrite <-(qd8_rvv_output_cell_panel K done (Z.of_nat n) zp A Ps inv lo hi) by lia.
   rewrite qd8_rvv_completed_snoc by lia.
   rewrite Nat2Z.inj_succ.
   replace (done+Z.succ (Z.of_nat n)) with (done+Z.of_nat n+1) by lia.
   reflexivity.
Qed.

Lemma rvv_write_lanes : forall c N done K zp A Ps inv lo hi vl x0 x1 x2 x3 x4 x5 x6 x7,
 0<=done -> Z.rem done 8=0 -> 1<=vl<=8 ->
 qd8_active_f vl 0 x0 (qd8_rvv_final_lane K (Z.quot done 8) 0 zp A Ps inv lo hi) ->
 qd8_active_f vl 1 x1 (qd8_rvv_final_lane K (Z.quot done 8) 1 zp A Ps inv lo hi) ->
 qd8_active_f vl 2 x2 (qd8_rvv_final_lane K (Z.quot done 8) 2 zp A Ps inv lo hi) ->
 qd8_active_f vl 3 x3 (qd8_rvv_final_lane K (Z.quot done 8) 3 zp A Ps inv lo hi) ->
 qd8_active_f vl 4 x4 (qd8_rvv_final_lane K (Z.quot done 8) 4 zp A Ps inv lo hi) ->
 qd8_active_f vl 5 x5 (qd8_rvv_final_lane K (Z.quot done 8) 5 zp A Ps inv lo hi) ->
 qd8_active_f vl 6 x6 (qd8_rvv_final_lane K (Z.quot done 8) 6 zp A Ps inv lo hi) ->
 qd8_active_f vl 7 x7 (qd8_rvv_final_lane K (Z.quot done 8) 7 zp A Ps inv lo hi) ->
 qd8_write_state c N (done+vl)
 (qd8_fappend (qd8_rvv_completed K done zp A Ps inv lo hi) (sublist 0 vl [x0;x1;x2;x3;x4;x5;x6;x7])) =
 qd8_rvv_prefix c N (done+vl) K zp A Ps inv lo hi.
Proof.
 intros c N done K zp A Ps inv lo hi vl x0 x1 x2 x3 x4 x5 x6 x7 Hd Hr Hv H0 H1 H2 H3 H4 H5 H6 H7.
 assert (Hlanes:sublist 0 vl [x0;x1;x2;x3;x4;x5;x6;x7] =
 map (fun j=>qd8_rvv_final_lane K (Z.quot done 8) (Z.of_nat j) zp A Ps inv lo hi)
 (seq 0 (Z.to_nat vl))).
 { assert (E:vl=1 \/ vl=2 \/ vl=3 \/ vl=4 \/ vl=5 \/ vl=6 \/ vl=7 \/ vl=8) by lia.
   destruct E as [E|[E|[E|[E|[E|[E|[E|E]]]]]]];subst vl;
   cbv [sublist Z.to_nat Pos.to_nat Pos.iter_op Nat.add firstn skipn seq map Z.of_nat Pos.of_succ_nat Pos.succ];
   repeat f_equal;first[apply H0|apply H1|apply H2|apply H3|apply H4|apply H5|apply H6|apply H7];lia. }
 unfold qd8_fappend,qd8_rvv_prefix;rewrite Hlanes.
 rewrite qd8_rvv_completed_panel_block by lia.
 rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma rvv_final_nan : forall K tile lane zp A Ps inv lo hi,
 qd8_bounds_flag lo hi<>0 ->
 canonical_qnan=qd8_rvv_final_lane K tile lane zp A Ps inv lo hi.
Proof.
 intros;unfold qd8_bounds_flag in H;unfold qd8_rvv_final_lane,qd8_rvv_clamp.
 destruct (orb (Binary.is_nan 24 128 lo) (Binary.is_nan 24 128 hi));[reflexivity|lia].
Qed.
Lemma rvv_final_formula : forall K tile lane zp A Ps inv lo hi,
 qd8_bounds_flag lo hi=0 ->
 qd8_merge_value
 (fp32_min_number (fp32_max_number
 (fma_rne (fp32_mul (fp32_of_Z (qd8_acc_signed K K tile lane zp A Ps)) inv)
 (qd8_float_field 0 tile lane Ps) (qd8_float_field 1 tile lane Ps)) lo) hi)
 (fma_rne (fp32_mul (fp32_of_Z (qd8_acc_signed K K tile lane zp A Ps)) inv)
 (qd8_float_field 0 tile lane Ps) (qd8_float_field 1 tile lane Ps))
 (qd8_nan_flag (fma_rne (fp32_mul (fp32_of_Z (qd8_acc_signed K K tile lane zp A Ps)) inv)
 (qd8_float_field 0 tile lane Ps) (qd8_float_field 1 tile lane Ps))) =
 qd8_rvv_final_lane K tile lane zp A Ps inv lo hi.
Proof.
 intros;unfold qd8_bounds_flag in H;unfold qd8_rvv_final_lane,qd8_rvv_clamp.
 destruct (orb (Binary.is_nan 24 128 lo) (Binary.is_nan 24 128 hi));[discriminate|].
 unfold qd8_merge_value,qd8_nan_flag.
 change ((if (if Binary.is_nan 24 128 (qd8_unclamped K tile lane zp A Ps inv) then 1 else 0)=?0
 then fp32_min_number (fp32_max_number (qd8_unclamped K tile lane zp A Ps inv) lo) hi
 else qd8_unclamped K tile lane zp A Ps inv)=
 (if Binary.is_nan 24 128 (qd8_unclamped K tile lane zp A Ps inv)
 then qd8_unclamped K tile lane zp A Ps inv
 else fp32_min_number (fp32_max_number (qd8_unclamped K tile lane zp A Ps inv) lo) hi)).
 destruct (Binary.is_nan 24 128 (qd8_unclamped K tile lane zp A Ps inv));reflexivity.
Qed.
Print Assumptions rvv_write_lanes.
Print Assumptions rvv_final_formula.
