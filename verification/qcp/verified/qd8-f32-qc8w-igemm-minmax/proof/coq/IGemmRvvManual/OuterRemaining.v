From Coq Require Import ZArith List Lia.
From Qd8RvvArith Require Export RvvArithmetic.
From IGemmRvv Require Import rvv_goal.
From IGemmSupport Require Import IGemmFacts.
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
Ltac output_lane :=
 first[lia|assumption|
 unfold qd8_active_f;let Hj:=fresh "Hlane" in intro Hj;
 unfold qd8_selected_f,qd8_selected_z;
 repeat match goal with |- context[Z.ltb ?j ?vl] =>
  let E:=fresh "Eactive" in assert(E:(j <? vl)=true)by(apply Z.ltb_lt;lia);rewrite E
 end;
 first[apply rvv_final_nan;lia|
 match goal with H:qd8_active_z ?vl ?j ?z ?e |- context[fp32_of_Z ?z] =>
 rewrite (H Hj);apply rvv_final_formula;lia end]].
Ltac outer_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];first[lia|nia|congruence].
Ltac outer_frame := rvv_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;[outer_pure|qd8_cancel].
Module Checked.
Lemma proof_of_test_rvv_entail_wit_6_2:rvv_goal.test_rvv_entail_wit_6_2.
Proof. unfold rvv_goal.test_rvv_entail_wit_6_2;intros quantization_params_pre params_pre zero_data_pre zero_pre a_offset_pre c_pre w_pre a_pre ks_pre kc_pre nc_pre mr_pre hi lo inv zp Ps Blocks Refs Entries z7 z6 z5 z4 z3 z2 z1 z0 w a p vl c0 bounds_nan nc cn_stride retval PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43.
subst p cn_stride mr_pre bounds_nan.
rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *.
(rvv_normalize;try lia).
try (match goal with H:qd8_bit_same ?r canonical_qnan |- _ => unfold qd8_bit_same in H;subst r end).
replace ((ks_pre÷8)*kc_pre) with (total_depth kc_pre Refs) in * by (unfold total_depth;rewrite PreH9;ring).
rewrite rvv_write_lanes by output_lane.
assert (Hks:ks_pre=8*Zlength Refs) by (unfold igemm_shape in PreH11;tauto).
pose proof PreH12 as Hcap;unfold igemm_capacity in Hcap;
destruct Hcap as (Ht & Htcap & Hw & Hwa & Hwcap & Hc & Hccap & Hblocks).
assert (Ha:a=a_pre+ks_pre) by (rewrite PreH33,<-PreH9,Hks;ring).
unfold unsigned_last_nbits;change (2^64) with 18446744073709551616.
rewrite (Z.mod_small a 18446744073709551616) by lia.
rewrite (Z.mod_small (a-ks_pre) 18446744073709551616) by lia.
rewrite (Z.mod_small (nc-vl) 18446744073709551616) by lia.
replace (a-ks_pre) with a_pre by lia.
replace (nc_pre-(nc-vl)) with (nc_pre-nc+vl) by lia.
destruct (Z.eq_dec nc vl) as [Hend|Hmore].
- Left;outer_frame.
- exfalso;lia.
Qed.
Lemma proof_of_test_rvv_entail_wit_6_3:rvv_goal.test_rvv_entail_wit_6_3.
Proof. unfold rvv_goal.test_rvv_entail_wit_6_3;intros quantization_params_pre params_pre zero_data_pre zero_pre a_offset_pre c_pre w_pre a_pre ks_pre kc_pre nc_pre mr_pre hi lo inv zp Ps Blocks Refs Entries z7 z6 z5 z4 z3 z2 z1 z0 w a p vl c0 bounds_nan nc cn_stride PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42.
subst p cn_stride mr_pre bounds_nan.
rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *.
(rvv_normalize;try lia).
try (match goal with H:qd8_bit_same ?r canonical_qnan |- _ => unfold qd8_bit_same in H;subst r end).
replace ((ks_pre÷8)*kc_pre) with (total_depth kc_pre Refs) in * by (unfold total_depth;rewrite PreH8;ring).
rewrite rvv_write_lanes by output_lane.
assert (Hks:ks_pre=8*Zlength Refs) by (unfold igemm_shape in PreH10;tauto).
pose proof PreH11 as Hcap;unfold igemm_capacity in Hcap;
destruct Hcap as (Ht & Htcap & Hw & Hwa & Hwcap & Hc & Hccap & Hblocks).
assert (Ha:a=a_pre+ks_pre) by (rewrite PreH32,<-PreH8,Hks;ring).
unfold unsigned_last_nbits;change (2^64) with 18446744073709551616.
rewrite (Z.mod_small a 18446744073709551616) by lia.
rewrite (Z.mod_small (a-ks_pre) 18446744073709551616) by lia.
rewrite (Z.mod_small (nc-vl) 18446744073709551616) by lia.
replace (a-ks_pre) with a_pre by lia.
replace (nc_pre-(nc-vl)) with (nc_pre-nc+vl) by lia.
destruct (Z.eq_dec nc vl) as [Hend|Hmore].
- Left;outer_frame.
- exfalso;lia.
Qed.
Lemma proof_of_test_rvv_entail_wit_6_4:rvv_goal.test_rvv_entail_wit_6_4.
Proof. unfold rvv_goal.test_rvv_entail_wit_6_4;intros quantization_params_pre params_pre zero_data_pre zero_pre a_offset_pre c_pre w_pre a_pre ks_pre kc_pre nc_pre mr_pre hi lo inv zp Ps Blocks Refs Entries z7 z6 z5 z4 z3 z2 z1 z0 w a p vl c0 bounds_nan nc cn_stride PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42.
subst p cn_stride mr_pre bounds_nan.
rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *.
(rvv_normalize;try lia).
try (match goal with H:qd8_bit_same ?r canonical_qnan |- _ => unfold qd8_bit_same in H;subst r end).
replace ((ks_pre÷8)*kc_pre) with (total_depth kc_pre Refs) in * by (unfold total_depth;rewrite PreH8;ring).
rewrite rvv_write_lanes by output_lane.
assert (Hks:ks_pre=8*Zlength Refs) by (unfold igemm_shape in PreH10;tauto).
pose proof PreH11 as Hcap;unfold igemm_capacity in Hcap;
destruct Hcap as (Ht & Htcap & Hw & Hwa & Hwcap & Hc & Hccap & Hblocks).
assert (Ha:a=a_pre+ks_pre) by (rewrite PreH32,<-PreH8,Hks;ring).
unfold unsigned_last_nbits;change (2^64) with 18446744073709551616.
rewrite (Z.mod_small a 18446744073709551616) by lia.
rewrite (Z.mod_small (a-ks_pre) 18446744073709551616) by lia.
rewrite (Z.mod_small (nc-vl) 18446744073709551616) by lia.
replace (a-ks_pre) with a_pre by lia.
replace (nc_pre-(nc-vl)) with (nc_pre-nc+vl) by lia.
destruct (Z.eq_dec nc vl) as [Hend|Hmore].
- Left;outer_frame.
- Right.
  assert (Hvl:vl=8) by lia;subst vl.
  assert (Hq:Z.quot (nc_pre-nc+8) 8=Z.quot (nc_pre-nc) 8+1).
  { rewrite !Z.quot_div_nonneg by lia.
    replace (nc_pre-nc+8) with (nc_pre-nc+1*8) by ring.
    rewrite Z.div_add by lia;reflexivity. }
  assert (Hr:Z.rem (nc_pre-nc+8) 8=0).
  { rewrite Z.rem_mod_nonneg by lia;
    match goal with H:Z.rem (nc_pre-nc) 8=0 |- _ =>
     rewrite Z.rem_mod_nonneg in H by lia;
     rewrite Z.add_mod by lia;rewrite H;reflexivity end. }
  assert (Hlen:Z.quot (nc_pre-nc+8) 8 < Zlength Ps).
  { assert (HP:Zlength Ps=panels nc_pre) by (unfold igemm_shape in PreH10;tauto).
    rewrite HP;unfold panels;rewrite Z.quot_div_nonneg by lia.
    match goal with H:Z.rem (nc_pre-nc) 8=0 |- _ =>
     rewrite Z.rem_mod_nonneg in H by lia end.
    pose proof(Z.div_mod(nc_pre-nc)8 ltac:(lia)).
    pose proof(Z.div_mod(nc_pre+7)8 ltac:(lia)).
    pose proof(Z.mod_pos_bound(nc_pre+7)8 ltac:(lia)).
    replace(nc_pre-nc+8)with(nc_pre-nc+1*8)by ring.
    rewrite Z.div_add by lia;lia. }
  rewrite (Z.mod_small c0 18446744073709551616) by lia.
  rewrite (Z.mod_small (c0+32) 18446744073709551616) by lia.
  rewrite Hq.
  assert (Hwstep:w+(8+8)*4=w_pre+(Z.quot(nc_pre-nc)8+1)*(96+8*total_depth kc_pre Refs)).
  { rewrite PreH33;ring. }
  outer_frame.
Qed.
End Checked.
