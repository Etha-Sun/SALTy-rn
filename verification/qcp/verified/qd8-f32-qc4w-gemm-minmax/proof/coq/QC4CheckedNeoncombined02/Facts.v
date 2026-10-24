From QC4Neon Require Export neon_goal.
From Coq Require Export ZArith List Lia Strings.String.
From QC4W Require Export Layouts ApiModel NeonModel.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac opaque_leaves_rec l :=
 lazymatch l with
 | nil => idtac
 | cons (norm_asrt ?v) ?tail =>
   try (let cell := fresh "cell" in let H := fresh "Ecell" in
        remember v as cell eqn:H; clear H);
   opaque_leaves_rec tail
 end.
Ltac opaque_leaves :=
 match goal with |- ?P |-- ?Q =>
 let leaves := All_listasrts P in opaque_leaves_rec leaves end.
Lemma rvv_pull_through : forall A P q R : Assertion,
 (P |-- q ** R) -> (A ** P |-- q ** (A ** R)).
Proof.
 intros A P q R H. eapply derivable1_trans.
 - apply derivable1_sepcon_mono; [apply derivable1_refl | exact H].
 - rewrite (logic_equiv_sepcon_swap A q R). apply derivable1_refl.
Qed.
Ltac pull_cell q :=
 lazymatch goal with
 | |- q ** ?tail |-- _ => apply derivable1_refl
 | |- ?a ** q |-- _ => apply derivable1_sepcon_comm
 | |- ?a ** ?tail |-- _ => eapply rvv_pull_through; pull_cell q
 end.
Ltac fast_cancel :=
 lazymatch goal with
 | |- ?P |-- ?P => apply derivable1_refl
 | |- ?P |-- ?q ** ?Q =>
   eapply (derivable1_trans P (q ** _) (q ** Q));
   [pull_cell q | apply derivable1_sepcon_mono; [apply derivable1_refl | fast_cancel]]
 end.

Print Assumptions rvv_pull_through.

Local Open Scope Z_scope.
Local Open Scope sac.

Ltac qc_subst := repeat match goal with H : ?x = ?y |- _=>is_var x;subst x end.
Ltac qc_normalize := rewrite ?sizeof_char,?sizeof_uchar,?sizeof_short,?sizeof_int,?sizeof_float,?sizeof_ptr in *;
 try change (Z.of_nat Arch64.ptr_size) with 8 in *;
 try change Arch64.ptr_size_Z with 8 in *;
 rewrite ?Z.add_0_l,?Z.add_0_r,?Z.mul_0_l,?Z.mul_0_r,?Z.mul_1_l,?Z.mul_1_r,?Z.sub_0_r,?Z.sub_diag in *;
 repeat rewrite Z.quot_div_nonneg in * by lia;
 repeat rewrite Z.rem_mod_nonneg in * by lia.
Ltac qc_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];qc_normalize;lia.
Ltac qc_frame :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].

Lemma ig_local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field
 (RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof.
 intros;apply eval_addr_expr_congr;apply RE_addr_of_congr.
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity].
Qed.
Ltac ig_layout :=
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?ig_local_field_address.
Ltac ig_forget_cells :=
 repeat first [
  multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_char ?p] =>
    multimatch P with context[store_char p ?v] =>sep_apply(store_char_undef_store_char p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_short ?p] =>
    multimatch P with context[store_short p ?v] =>sep_apply(store_short_undef_store_short p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_int ?p] =>
    multimatch P with context[store_int p ?v] =>sep_apply(store_int_undef_store_int p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_float ?p] =>
    multimatch P with context[store_float p ?v] =>sep_apply(store_float_undef_store_float p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_ptr ?p] =>
    multimatch P with context[store_ptr p ?v] =>sep_apply(store_ptr_undef_store_ptr p v)end end end].
Ltac ig_cancel := ig_forget_cells;opaque_leaves;sepcon_assoc_change;fast_cancel.

Lemma qc_extent_covers : forall K,
 rounded_depth K<=qc4_a_extent K<=rounded_depth K+7.
Proof.
 intro K;unfold qc4_a_extent.
 pose proof(Z.div_mod(rounded_depth K+7)8 ltac:(lia)).
 pose proof(Z.mod_pos_bound(rounded_depth K+7)8 ltac:(lia));lia.
Qed.
Ltac qc_bounds :=
 match goal with H:qc4_data_capacity ?N ?K ?a ?w ?c |- _ =>
  pose proof(qc_extent_covers K);
  try (let HK:=fresh in assert(HK:0<K)by lia;pose proof(rounded_depth_covers K HK));
  let Hc:=fresh in pose proof H as Hc;unfold qc4_data_capacity in Hc;
  decompose[and]Hc;clear Hc
 end.
Ltac qc_arith := try qc_bounds;qc_normalize;try change UINT64_MAX with 18446744073709551615 in *;lia.
Ltac qc_pure2 := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];qc_arith.
Ltac qc_frame2 := ig_layout;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_pure2|ig_cancel]|ig_cancel].
Print Assumptions qc_extent_covers.

Lemma qc_even_positive : forall k,0<k -> k mod 2=0 -> 2<=k.
Proof.
 intros k H E;pose proof(Z.div_mod k 2 ltac:(lia));rewrite E in H0;lia.
Qed.
Ltac qc_parity :=
 try match goal with H:?k mod 2=0 |- _ =>
  let B:=fresh in assert(B:2<=k)by(apply qc_even_positive;[lia|exact H]) end.
Ltac qc_arith3 := try qc_bounds;qc_normalize;qc_parity;
 try change UINT64_MAX with 18446744073709551615 in *;lia.
Ltac qc_pure3 := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];qc_arith3.
Ltac qc_frame3 := ig_layout;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_pure3|ig_cancel]|ig_cancel].
Print Assumptions qc_even_positive.

Lemma qc_char_restore : forall x i n xs,0<=i<n ->
 CharArray.missing_i x i 0 n xs ** store_char(x+i)(Znth i xs 0) |-- CharArray.full x n xs.
Proof.
 intros;eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof(CharArray.missing_i_merge_to_full x i n (Znth i xs 0) xs H)as HM.
 unfold StoreCharAsElement.storeA in HM.
 rewrite sizeof_char,Z.mul_1_r,replace_Znth_Znth in HM by lia;exact HM.
Qed.
Ltac qc_restore :=
 repeat multimatch goal with |-?P |-- ?Q =>
  multimatch Q with context[CharArray.full ?x ?n ?xs] =>
   multimatch P with context[CharArray.missing_i x ?i 0 n xs] =>
    sep_apply(qc_char_restore x i n xs ltac:(lia)) end end end.
Ltac qc_frame4 := ig_layout;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_pure3|qc_restore;ig_cancel]|qc_restore;ig_cancel].
Print Assumptions qc_char_restore.

Lemma qc_char_borrow : forall x i n xs,0<=i<n ->
 CharArray.full x n xs |-- CharArray.missing_i x i 0 n xs ** store_char(x+i)(Znth i xs 0).
Proof.
 intros;sep_apply(CharArray.full_split_to_missing_i x i n xs 0 H).
 unfold StoreCharAsElement.storeA;rewrite sizeof_char,Z.mul_1_r;entailer!.
Qed.
Ltac qc_borrow :=
 repeat multimatch goal with |-?P |-- ?Q =>
  multimatch Q with context[CharArray.missing_i ?x ?i 0 ?n ?xs] =>
   multimatch P with context[CharArray.full x n xs] =>
    sep_apply(qc_char_borrow x i n xs ltac:(qc_arith3)) end end end.
Ltac qc_frame5 := ig_layout;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_pure3|qc_borrow;qc_restore;ig_cancel]|qc_borrow;qc_restore;ig_cancel].
Print Assumptions qc_char_borrow.

Lemma qc_panels_positive : forall N,0<N -> 0<qc4_panels N.
Proof. intros;unfold qc4_panels;assert(1<=(N+15)/16)by(apply Z.div_le_lower_bound;lia);lia. Qed.
Lemma qc_empty_output : forall c N K zp A Ps inv lo hi,
 FloatArray.undef_full c N |-- qc4_output_prefix c N 0 K zp A Ps inv lo hi.
Proof.
 intros;unfold qc4_output_prefix,qc4_write_state,qc4_values.
 cbn[Z.to_nat seq map];rewrite FloatArray.full_empty.
 sep_apply FloatArray.undef_full_to_undef_seg;entailer!.
Qed.
Lemma qc_finished_output : forall c N K zp A Ps inv lo hi,
 qc4_output_prefix c N N K zp A Ps inv lo hi |-- qc4_output_ref c K N zp A Ps inv lo hi.
Proof.
 intros;unfold qc4_output_prefix,qc4_write_state,qc4_output_ref.
 rewrite FloatArray.undef_seg_empty.
 Exists(qc4_values K N zp A Ps inv lo hi).
 assert(Hrel:Forall2 matches_reference (qc4_values K N zp A Ps inv lo hi)(qc4_values K N zp A Ps inv lo hi)).
 { induction(qc4_values K N zp A Ps inv lo hi);constructor;auto;left;reflexivity. }
 entailer!.
Qed.
Lemma qc_acc_initial : forall tile lane zp A Ps,
 qc4_acc_signed 0 tile lane zp A Ps=qc4_wrap_signed(qc4_ks tile lane Ps*zp).
Proof. reflexivity. Qed.
Ltac qc_initial_context :=
 qc_subst;qc_normalize;
 rewrite ?Z.quot_0_l,?Z.rem_0_l,?Z.div_0_l,?Z.mod_0_l in * by lia;
 try qc_bounds;try match goal with |-context[qc4_panels ?N]=>let E:=fresh in assert(E:0<qc4_panels N)by(apply qc_panels_positive;lia)end;
 unfold qc4_active16_z in *;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 rewrite ?qc_acc_initial;
 try match goal with |- context[qc4_output_prefix ?c ?N 0 ?K ?zp ?A ?Ps ?inv ?lo ?hi] =>
 sep_apply(qc_empty_output c N K zp A Ps inv lo hi)end.
Ltac qc_linear := repeat match goal with H:_ -> _ |- _ =>clear H end;lia.
Ltac qc_active_initial :=
 unfold qc4_active_z in *;intros;
 repeat (once multimatch goal with H:?i < ?vl -> _ |- _ =>
 let Hi:=fresh in assert(Hi:i<vl)by qc_linear;specialize(H Hi) end);
 congruence.
Ltac qc_initial_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 first[match goal with |-qc4_active_z _ _ _ _=>qc_active_initial end|try qc_bounds;qc_normalize;qc_linear].
Ltac qc_initial_frame :=
 ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_initial_pure|ig_cancel]|ig_cancel].
Print Assumptions qc_empty_output.
Print Assumptions qc_finished_output.
Print Assumptions qc_acc_initial.

From GemmRepair Require Import ClampRepair.
Import ListNotations.
Lemma qc_max_not_nan : forall x lo,
 Binary.is_nan 24 128 x=false ->Binary.is_nan 24 128 lo=false ->
 Binary.is_nan 24 128(fp32_max_number x lo)=false.
Proof.
 intros x lo Hx Hl;unfold fp32_max_number;rewrite Hx,Hl.
 destruct(andb(fp32_zero_test x)(fp32_zero_test lo)).
 - destruct(andb(Binary.Bsign 24 128 x)(Binary.Bsign 24 128 lo));reflexivity.
 - destruct(fp32_compare x lo)as[[| |]|];assumption.
Qed.
Lemma qc_clamp_joint : forall x lo hi,
 qc4_clamp x lo hi=
 if orb(Binary.is_nan 24 128 hi)(Binary.is_nan 24 128 lo)then canonical_qnan
 else if Binary.is_nan 24 128 x then canonical_qnan
 else fp32_min_number(fp32_max_number x lo)hi.
Proof.
 intros;unfold qc4_clamp,fp32_neon_min,fp32_neon_max.
 destruct(Binary.is_nan 24 128 x)eqn:Hx;
 destruct(Binary.is_nan 24 128 lo)eqn:Hl;
 destruct(Binary.is_nan 24 128 hi)eqn:Hh;cbn;try reflexivity.
 all:rewrite(qc_max_not_nan x lo Hx Hl);reflexivity.
Qed.
Lemma qc_clamp_nan_lo : forall x lo hi,qc4_nan_flag lo<>0 ->qc4_clamp x lo hi=canonical_qnan.
Proof.
 intros;rewrite qc_clamp_joint;unfold qc4_nan_flag in H.
 destruct(Binary.is_nan 24 128 lo);[rewrite Bool.orb_true_r;reflexivity|contradiction].
Qed.
Lemma qc_clamp_nan_hi : forall x lo hi,qc4_nan_flag hi<>0 ->qc4_clamp x lo hi=canonical_qnan.
Proof.
 intros;rewrite qc_clamp_joint;unfold qc4_nan_flag in H.
 destruct(Binary.is_nan 24 128 hi);[reflexivity|contradiction].
Qed.
Lemma qc_merge_clamp : forall x lo hi,qc4_nan_flag lo=0 ->qc4_nan_flag hi=0 ->
 qc4_merge(fp32_min_number(fp32_max_number x lo)hi)canonical_qnan(qc4_nan_flag x)=qc4_clamp x lo hi.
Proof.
 intros;rewrite qc_clamp_joint;unfold qc4_nan_flag in *.
 destruct(Binary.is_nan 24 128 lo)eqn:Hl;[discriminate|].
 destruct(Binary.is_nan 24 128 hi)eqn:Hh;[discriminate|].
 unfold qc4_merge;destruct(Binary.is_nan 24 128 x);reflexivity.
Qed.
Lemma qc_output_tile : forall K done lane zp A Ps inv lo hi,
 0<=done ->done mod 16=0 ->0<=lane<16 ->
 qc4_output K(done+lane)zp A Ps inv lo hi=
 qc4_clamp(qc4_raw K lane zp A(qc4_panel_at Ps(done/16))inv)lo hi.
Proof.
 intros;pose proof(Z.div_mod done 16 ltac:(lia));rewrite H0 in H2.
 assert(Hm:(done+lane)mod 16=lane).
 { rewrite Z.add_mod by lia;rewrite H0,Z.add_0_l,Z.mod_mod by lia;apply Z.mod_small;lia. }
 assert(Hd:(done+lane)/16=done/16).
 { replace(done+lane)with(lane+(done/16)*16)by lia.
   rewrite Z.div_add by lia;rewrite Z.div_small by lia;lia. }
 unfold qc4_output;rewrite Hm,Hd;reflexivity.
Qed.
Lemma qc_shift_signed : forall x,
 shifted_accumulator(signed32(wrap32 x))=shifted_accumulator x.
Proof. intros;unfold shifted_accumulator;rewrite signed32_mod_identity;reflexivity. Qed.
Lemma qc_raw_api : forall K tile lane zp A Ps inv,
 qc4_raw K lane zp A(qc4_panel_at Ps tile)inv=
 fma_rne(qc4_fp32_mul(fp32_of_Z(shifted_accumulator(qc4_acc_signed(rounded_depth K)tile lane zp A Ps)))inv)
 (qc4_float_field 0 tile lane Ps)(qc4_float_field 1 tile lane Ps).
Proof.
 intros;unfold qc4_acc_signed,qc4_ks,qc4_zget.
 assert(Hw:wrap32(qc4_acc(rounded_depth K)(Znth lane(qc4_sums(qc4_panel_at Ps tile))0)zp lane A(qc4_weights(qc4_panel_at Ps tile)))=
 qc4_acc(rounded_depth K)(Znth lane(qc4_sums(qc4_panel_at Ps tile))0)zp lane A(qc4_weights(qc4_panel_at Ps tile))).
 { unfold wrap32;apply Z.mod_small;apply qc4_acc_range. }
 rewrite <-Hw at 1;rewrite qc_shift_signed.
 reflexivity.
Qed.
Lemma qc_output_snoc : forall done K zp A Ps inv lo hi,0<=done ->
 qc4_values K done zp A Ps inv lo hi++[qc4_output K done zp A Ps inv lo hi]=
 qc4_values K(done+1)zp A Ps inv lo hi.
Proof.
 intros;unfold qc4_values;rewrite Z2Nat.inj_add by lia;rewrite Nat.add_1_r.
 rewrite seq_S,map_app;cbn[map];rewrite Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.
Lemma qc_output_block : forall done K zp A Ps inv lo hi n,0<=done ->
 qc4_values K done zp A Ps inv lo hi++
 map(fun j=>qc4_output K(done+Z.of_nat j)zp A Ps inv lo hi)(seq 0 n)=
 qc4_values K(done+Z.of_nat n)zp A Ps inv lo hi.
Proof.
 intros done K zp A Ps inv lo hi n Hd;induction n.
 - cbn[seq map Z.of_nat];rewrite app_nil_r,Z.add_0_r;reflexivity.
 - rewrite seq_S,map_app,app_assoc,IHn;cbn[map];rewrite Nat.add_0_l.
   rewrite qc_output_snoc by lia;rewrite Nat2Z.inj_succ.
   replace(done+Z.succ(Z.of_nat n))with(done+Z.of_nat n+1)by lia;reflexivity.
Qed.
Lemma qc_firstn_map : forall (n:nat)(xs:list fp32)(f:nat->fp32),
 (n<=List.length xs)%nat ->(forall i,(i<n)%nat -> nth i xs fp32_zero=f i) ->
 firstn n xs=map f(seq 0 n).
Proof.
 induction n;intros xs f Hb Hnth;[reflexivity|].
 destruct xs as[|x xs];[cbn in Hb;lia|].
 cbn[firstn seq map];f_equal.
 - exact(Hnth O ltac:(lia)).
 - rewrite <-seq_shift,map_map.
   apply IHn;[cbn in Hb;lia|].
   intros i Hi;exact(Hnth(S i)ltac:(lia)).
Qed.
Print Assumptions qc_clamp_joint.
Print Assumptions qc_raw_api.
Print Assumptions qc_output_block.
Print Assumptions qc_firstn_map.

Lemma qc_prefix16 : forall vl (r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15:fp32)(f:Z->fp32),
 0<=vl<=16 ->qc4_active16_f vl r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 (f 0) (f 1) (f 2) (f 3) (f 4) (f 5) (f 6) (f 7) (f 8) (f 9) (f 10) (f 11) (f 12) (f 13) (f 14) (f 15) ->
 sublist 0 vl [r0;r1;r2;r3;r4;r5;r6;r7;r8;r9;r10;r11;r12;r13;r14;r15]=map(fun j=>f(Z.of_nat j))(seq 0(Z.to_nat vl)).
Proof.
 intros vl r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 f Hb Ha.
 unfold qc4_active16_f,qc4_active_f in Ha;destruct Ha as [H0 [H1 [H2 [H3 [H4 [H5 [H6 [H7 [H8 [H9 [H10 [H11 [H12 [H13 [H14 H15]]]]]]]]]]]]]]].
 unfold sublist;rewrite ?Z.sub_0_r;cbn[Z.to_nat skipn].
 apply qc_firstn_map;[cbn[List.length];lia|].
 intros i Hi;assert(Hr:(i<16)%nat)by lia.
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H0;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H1;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H2;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H3;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H4;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H5;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H6;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H7;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H8;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H9;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H10;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H11;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H12;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H13;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H14;lia|].
 destruct i as[|i];[cbn[nth Z.of_nat Pos.of_succ_nat Pos.succ];apply H15;lia|].
 lia.
Qed.

Lemma qc_write_lanes : forall c N done vl K zp A Ps inv lo hi (r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15:fp32),
 0<=done ->0<=vl<=16 ->qc4_active16_f vl r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 (qc4_output K(done+0)zp A Ps inv lo hi) (qc4_output K(done+1)zp A Ps inv lo hi) (qc4_output K(done+2)zp A Ps inv lo hi) (qc4_output K(done+3)zp A Ps inv lo hi) (qc4_output K(done+4)zp A Ps inv lo hi) (qc4_output K(done+5)zp A Ps inv lo hi) (qc4_output K(done+6)zp A Ps inv lo hi) (qc4_output K(done+7)zp A Ps inv lo hi) (qc4_output K(done+8)zp A Ps inv lo hi) (qc4_output K(done+9)zp A Ps inv lo hi) (qc4_output K(done+10)zp A Ps inv lo hi) (qc4_output K(done+11)zp A Ps inv lo hi) (qc4_output K(done+12)zp A Ps inv lo hi) (qc4_output K(done+13)zp A Ps inv lo hi) (qc4_output K(done+14)zp A Ps inv lo hi) (qc4_output K(done+15)zp A Ps inv lo hi) ->
 qc4_write_state c N(done+vl)(qc4_fappend(qc4_values K done zp A Ps inv lo hi)(sublist 0 vl [r0;r1;r2;r3;r4;r5;r6;r7;r8;r9;r10;r11;r12;r13;r14;r15]))=
 qc4_output_prefix c N(done+vl)K zp A Ps inv lo hi.
Proof.
 intros c N done vl K zp A Ps inv lo hi r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 Hd Hv Ha.
 pose proof(qc_prefix16 vl r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 (fun i=>qc4_output K(done+i)zp A Ps inv lo hi)Hv Ha)as E.
 unfold qc4_fappend,qc4_output_prefix;rewrite E,qc_output_block by lia.
 rewrite Z2Nat.id by lia;reflexivity.
Qed.
Ltac qc_activate_lane vl lane HL := repeat match goal with
 H:qc4_active_z vl lane _ _ |- _=>specialize(H HL)
 |H:qc4_active_f vl lane _ _ |- _=>specialize(H HL) end.
Print Assumptions qc_prefix16.
Print Assumptions qc_write_lanes.

Ltac qc_output_lane :=
 match goal with |-qc4_active_f ?vl ?lane _ _ =>
 unfold qc4_active_f at 1;let HL:=fresh in intro HL;qc_activate_lane vl lane HL end;
 rewrite qc_output_tile by qc_linear;
 first[rewrite qc_clamp_nan_hi by congruence;congruence
      |rewrite qc_clamp_nan_lo by congruence;congruence
      |rewrite <-qc_merge_clamp by congruence;rewrite qc_raw_api;congruence].
Ltac qc_unwrap := repeat match goal with
 |-context[unsigned_last_nbits ?x 64]=>
 let E:=fresh in assert(E:unsigned_last_nbits x 64=x)
 by(apply unsigned_last_nbits_eq;change(0<=x<18446744073709551616);qc_linear);rewrite E end.
Ltac qc_output_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];repeat match goal with H:_ ->_ |- _=>clear H end;unfold panel_bytes;nia.
Ltac qc_output_frame := ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;[qc_output_pure|ig_cancel].

Lemma qc_next_facts : forall N nc,0<nc<=N ->(N-nc)mod 16=0 ->16<nc ->
 (N-(nc-16))mod 16=0 /\
 0<=(N-(nc-16))/16 /\
 (N-(nc-16))/16<qc4_panels N /\
 (N-(nc-16))/16=(N-nc)/16+1.
Proof.
 intros N nc Hb Hm Hn.
 assert(Hd:(N-(nc-16))/16=(N-nc)/16+1).
 { replace(N-(nc-16))with((N-nc)+1*16)by lia;rewrite Z.div_add by lia;lia. }
 assert(Hm2:(N-(nc-16))mod 16=0).
 { replace(N-(nc-16))with(N-nc+16)by lia;rewrite Z.add_mod,Hm,Z.mod_same by lia;reflexivity. }
 pose proof(Z.div_mod(N-nc)16 ltac:(lia));rewrite Hm in H.
 pose proof(Z.div_mod(N+15)16 ltac:(lia)).
 pose proof(Z.mod_pos_bound(N+15)16 ltac:(lia)).
 unfold qc4_panels;repeat split;lia.
Qed.
Print Assumptions qc_next_facts.

From QC4NeonSupport02 Require Export Facts.
From QC4TailSupport02 Require Export Facts.
From QC4NeonOutputSupport01 Require Export Facts.
Lemma qc_neon_pair_flexible : forall d t l zp A Ps w da db,
 0<=d ->d mod 2=0 ->w=8*d+l ->da=d ->db=d+1 ->
 qc4_mac_signed(qc4_mac_signed(qc4_acc_signed d t l zp A Ps)
 (low_bitop(qc4_zget w(qc4_weights(qc4_panel_at Ps t))))(qc4_zget da A))
 (high_bitop(qc4_zget w(qc4_weights(qc4_panel_at Ps t))))(qc4_zget db A)=
 qc4_acc_signed(d+2)t l zp A Ps.
Proof.
 intros d t l zp A Ps w da db Hd He Hw Ha Hb;subst w da db.
 rewrite qc_signed_pair by assumption.
 unfold qc4_mac_signed.
 rewrite (Z.mul_comm (low_bitop(qc4_zget(8*d+l)(qc4_weights(qc4_panel_at Ps t)))) (qc4_zget d A)).
 rewrite (Z.mul_comm (high_bitop(qc4_zget(8*d+l)(qc4_weights(qc4_panel_at Ps t)))) (qc4_zget(d+1)A)).
 reflexivity.
Qed.

Lemma qc_minus_even : forall x y,x mod 2=0 ->y mod 2=0 ->(x-y)mod 2=0.
Proof. intros;rewrite Zminus_mod,H,H0;reflexivity. Qed.
Ltac qc_neon_even := first[assumption|reflexivity|apply qc_plus_even;qc_neon_even|apply qc_minus_even;qc_neon_even].
Ltac qc_neon_macs :=
 rewrite ?qc_neon_lane0,?qc_neon_lane1,?qc_neon_lane2,?qc_neon_lane3;
 unfold qc4_char_field;cbn[Z.eqb];
 repeat multimatch goal with |-context[
 qc4_mac_signed(qc4_mac_signed(qc4_acc_signed ?d ?t ?l ?zp ?A ?Ps)
 (low_bitop(qc4_zget ?w(qc4_weights(qc4_panel_at ?Ps ?t))))(qc4_zget ?da ?A))
 (high_bitop(qc4_zget ?w(qc4_weights(qc4_panel_at ?Ps ?t))))(qc4_zget ?db ?A)] =>
 rewrite(qc_neon_pair_flexible d t l zp A Ps w da db
 ltac:(lia) ltac:(qc_neon_even) ltac:(ring) ltac:(ring) ltac:(ring)) end;
 repeat multimatch goal with |-context[qc4_acc_signed ?d ?t ?l ?zp ?A ?Ps]=>progress ring_simplify d end.
Print Assumptions qc_neon_pair_flexible.

Lemma qc_neon_padded_block : forall K d,0<=d ->d mod 8=0 ->d<rounded_depth K ->d+8<=qc4_a_extent K.
Proof.
 intros K d Hd Hm Hlt;unfold qc4_a_extent.
 pose proof(Z.div_mod d 8 ltac:(lia));rewrite Hm in H.
 pose proof(Z.div_mod(rounded_depth K+7)8 ltac:(lia)).
 pose proof(Z.mod_pos_bound(rounded_depth K+7)8 ltac:(lia));lia.
Qed.
Ltac qc_neon_bounds :=
 try qc_bounds;
 try match goal with Hm:?d mod 8=0 |- _=>
 match goal with HK:0< ?K |- _ =>
 let Hpad:=fresh in pose proof(qc_neon_padded_block K d ltac:(lia) Hm ltac:(lia))as Hpad end end.
Ltac qc_neon_load :=
 unfold qc4_i8_address_ok;
 first[left;repeat split;try reflexivity;qc_neon_bounds;lia
 |right;repeat split;try reflexivity;qc_neon_bounds;lia].
Print Assumptions qc_neon_padded_block.
Lemma qc_neon_output_at : forall K done lane zp A Ps inv lo hi,
 0<=done ->done mod 16=0 ->0<=lane<16 ->
 fp32_neon_min(fp32_neon_max
 (fma_rne(qc4_fp32_mul(fp32_of_Z(shifted_accumulator(qc4_acc_signed(rounded_depth K)(done/16)lane zp A Ps)))inv)
 (qc4_float_field 0(done/16)lane Ps)(qc4_float_field 1(done/16)lane Ps))lo)hi=
 qc4_output K(done+lane)zp A Ps inv lo hi.
Proof.
 intros;rewrite qc_output_tile by assumption;rewrite qc_raw_api;reflexivity.
Qed.
Print Assumptions qc_neon_output_at.
Lemma qc_neon_append_one_at : forall done K zp A Ps inv lo hi j0,
 0<=done ->j0=done+0 ->
 qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K j0 zp A Ps inv lo hi]=
 qc4_values K(done+1)zp A Ps inv lo hi.
Proof. intros;subst j0;apply qc_append_one;assumption. Qed.
Print Assumptions qc_neon_append_one_at.
Lemma qc_neon_append_two_at : forall done K zp A Ps inv lo hi j0 j1,
 0<=done ->j0=done+0 ->j1=done+1 ->
 qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K j0 zp A Ps inv lo hi;qc4_output K j1 zp A Ps inv lo hi]=
 qc4_values K(done+2)zp A Ps inv lo hi.
Proof. intros;subst j0 j1;apply qc_append_two;assumption. Qed.
Print Assumptions qc_neon_append_two_at.
Lemma qc_neon_append_four_at : forall done K zp A Ps inv lo hi j0 j1 j2 j3,
 0<=done ->j0=done+0 ->j1=done+1 ->j2=done+2 ->j3=done+3 ->
 qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K j0 zp A Ps inv lo hi;qc4_output K j1 zp A Ps inv lo hi;qc4_output K j2 zp A Ps inv lo hi;qc4_output K j3 zp A Ps inv lo hi]=
 qc4_values K(done+4)zp A Ps inv lo hi.
Proof. intros;subst j0 j1 j2 j3;apply qc_append_four;assumption. Qed.
Print Assumptions qc_neon_append_four_at.

Ltac qc_neon_outputs :=
 repeat multimatch goal with |-context[
 fp32_neon_min(fp32_neon_max
 (fma_rne(qc4_fp32_mul(fp32_of_Z(shifted_accumulator(qc4_acc_signed(rounded_depth ?K)(?done/16)?lane ?zp ?A ?Ps)))?inv)
 (qc4_float_field 0(?done/16)?lane ?Ps)(qc4_float_field 1(?done/16)?lane ?Ps))?lo)?hi] =>
 rewrite(qc_neon_output_at K done lane zp A Ps inv lo hi ltac:(lia) ltac:(lia) ltac:(lia)) end.
Ltac qc_neon_appends :=
 repeat first[
 multimatch goal with |-context[qc4_fappend(qc4_values ?K ?d ?zp ?A ?Ps ?inv ?lo ?hi)
 [qc4_output ?K ?j0 ?zp ?A ?Ps ?inv ?lo ?hi;qc4_output ?K ?j1 ?zp ?A ?Ps ?inv ?lo ?hi;qc4_output ?K ?j2 ?zp ?A ?Ps ?inv ?lo ?hi;qc4_output ?K ?j3 ?zp ?A ?Ps ?inv ?lo ?hi]]=>
 rewrite(qc_neon_append_four_at d K zp A Ps inv lo hi j0 j1 j2 j3 ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))end
 |multimatch goal with |-context[qc4_fappend(qc4_values ?K ?d ?zp ?A ?Ps ?inv ?lo ?hi)
 [qc4_output ?K ?j0 ?zp ?A ?Ps ?inv ?lo ?hi;qc4_output ?K ?j1 ?zp ?A ?Ps ?inv ?lo ?hi]]=>
 rewrite(qc_neon_append_two_at d K zp A Ps inv lo hi j0 j1 ltac:(lia)ltac:(lia)ltac:(lia))end
 |multimatch goal with |-context[qc4_fappend(qc4_values ?K ?d ?zp ?A ?Ps ?inv ?lo ?hi)
 [qc4_output ?K ?j0 ?zp ?A ?Ps ?inv ?lo ?hi]]=>
 rewrite(qc_neon_append_one_at d K zp A Ps inv lo hi j0 ltac:(lia)ltac:(lia))end].
Ltac qc_neon_final_indices N :=
 repeat multimatch goal with |-context[qc4_values ?K ?i ?zp ?A ?Ps ?inv ?lo ?hi]=>
 progress replace i with N by lia end;
 repeat multimatch goal with |-context[qc4_write_state ?c ?n ?i ?L]=>
 progress replace i with N by lia end.

Ltac qc_neon_constants := try change (4+1) with 5 in *;
 try change (4+2) with 6 in *;
 try change (4+3) with 7 in *;
 try change (8+1) with 9 in *;
 try change (8+2) with 10 in *;
 try change (8+3) with 11 in *;
 try change (12+1) with 13 in *;
 try change (12+2) with 14 in *;
 try change (12+3) with 15 in *.

Ltac qc_neon_load2 :=
 match goal with |-qc4_i8_address_ok ?mode ?p ?ab ?wb ?K ?tile ?j ?Ps =>
 first[
 let Hpad:=fresh in assert(Hpad:j+8<=qc4_a_extent K)by(apply qc_neon_padded_block;lia);
 unfold qc4_i8_address_ok;left;repeat split;lia
 |unfold qc4_i8_address_ok;right;repeat split;lia]end.
Ltac qc_neon_pure :=
 try match goal with Hcap:qc4_data_capacity ?N ?K ?a ?w ?c |- _=>
 let Hp:=fresh in assert(Hp:0<qc4_panels N)by(apply qc_panels_positive;lia)end;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];first[qc_neon_load2|qc_arith3].

From Coq Require Export List Bool Arith Sorting.Permutation.
From SimpleC.SL Require Export Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope sac.
Fixpoint qc_erase (n:nat)(xs:list nat):option(list nat):=
 match xs with []=>None |x::tail=>
 if Nat.eqb n x then Some tail else
 match qc_erase n tail with None=>None|Some rest=>Some(x::rest)end end.
Fixpoint qc_perm_test(xs ys:list nat):bool:=
 match xs with []=>match ys with []=>true|_=>false end
 |x::tail=>match qc_erase x ys with None=>false|Some rest=>qc_perm_test tail rest end end.
Lemma qc_erase_sound : forall n ys zs,qc_erase n ys=Some zs ->Permutation ys(n::zs).
Proof.
 intros n ys;induction ys as[|y ys IH];intros zs H;cbn in H;[discriminate|].
 destruct(Nat.eqb n y)eqn:E.
 - apply Nat.eqb_eq in E;subst y;inversion H;subst;apply Permutation_refl.
 - destruct(qc_erase n ys)as[rest|]eqn:Er;[|discriminate].
   inversion H;subst zs.
   eapply Permutation_trans;[apply perm_skip;apply IH;reflexivity|apply perm_swap].
Qed.
Lemma qc_perm_test_sound : forall xs ys,qc_perm_test xs ys=true ->Permutation xs ys.
Proof.
 induction xs as[|x xs IH];intros ys H;cbn in H.
 - destruct ys;[constructor|discriminate].
 - destruct(qc_erase x ys)as[rest|]eqn:E;[|discriminate].
   eapply Permutation_trans;[apply perm_skip;apply IH;exact H|].
   apply Permutation_sym;apply qc_erase_sound;exact E.
Qed.
Inductive qc_heap_tree := qc_atom(n:nat)|qc_join(l r:qc_heap_tree).
Fixpoint qc_heap_den(env:list Assertion)(t:qc_heap_tree):Assertion:=
 match t with qc_atom i=>nth i env emp|qc_join l r=>qc_heap_den env l ** qc_heap_den env r end.
Fixpoint qc_heap_leaves(t:qc_heap_tree):list nat:=
 match t with qc_atom i=>[i]|qc_join l r=>qc_heap_leaves l++qc_heap_leaves r end.
Fixpoint qc_heap_list(env:list Assertion)(xs:list nat):Assertion:=
 match xs with []=>emp|i::rest=>nth i env emp ** qc_heap_list env rest end.
Lemma qc_heap_list_app : forall env xs ys,
 qc_heap_list env(xs++ys) --||-- qc_heap_list env xs ** qc_heap_list env ys.
Proof.
 intros env xs;induction xs;intro ys;cbn.
 - rewrite logic_equiv_sepcon_comm,sepcon_emp_equiv;reflexivity.
 - rewrite IHxs,logic_equiv_sepcon_assoc;reflexivity.
Qed.
Lemma qc_heap_den_list : forall env t,qc_heap_den env t --||-- qc_heap_list env(qc_heap_leaves t).
Proof.
 intros env t;induction t;cbn.
 - rewrite sepcon_emp_equiv;reflexivity.
 - rewrite IHt1,IHt2,qc_heap_list_app;reflexivity.
Qed.
Lemma qc_heap_perm : forall env xs ys,Permutation xs ys ->qc_heap_list env xs |-- qc_heap_list env ys.
Proof.
 intros env xs ys H;induction H;cbn.
 - apply derivable1_refl.
 - apply derivable1_sepcon_mono;[apply derivable1_refl|assumption].
 - rewrite logic_equiv_sepcon_swap;apply derivable1_refl.
 - eapply derivable1_trans;eassumption.
Qed.
Theorem qc_heap_reflect : forall env l r,
 qc_perm_test(qc_heap_leaves l)(qc_heap_leaves r)=true ->
 qc_heap_den env l |-- qc_heap_den env r.
Proof.
 intros;rewrite !qc_heap_den_list;apply qc_heap_perm;apply qc_perm_test_sound;assumption.
Qed.
Print Assumptions qc_heap_reflect.
Ltac qc_heap_collect t tail :=
 lazymatch t with ?a ** ?b=>let rest:=qc_heap_collect b tail in qc_heap_collect a rest
 |_=>constr:(t::tail)end.
Ltac qc_heap_index t env i :=
 lazymatch env with ?a::?rest=>
 lazymatch t with a=>constr:(i)|_=>qc_heap_index t rest constr:(S i)end
 |[]=>fail "unmatched heap assertion" t end.
Ltac qc_heap_quote t env :=
 lazymatch t with ?a ** ?b=>let l:=qc_heap_quote a env in let r:=qc_heap_quote b env in constr:(qc_join l r)
 |_=>let i:=qc_heap_index t env constr:(O)in constr:(qc_atom i)end.
Ltac qc_reflect_cancel :=
 lazymatch goal with |- ?P |-- ?Q =>
 let env:=qc_heap_collect P constr:(@nil Assertion)in
 let l:=qc_heap_quote P env in let r:=qc_heap_quote Q env in
 apply(qc_heap_reflect env l r);vm_compute;reflexivity end.

Lemma qc_heap_env_nth : forall env env2,Forall2 derivable1 env env2 ->
 forall i,nth i env emp |-- nth i env2 emp.
Proof.
 intros env env2 H;induction H;intro i.
 - destruct i;cbn;apply derivable1_refl.
 - destruct i;cbn;auto.
Qed.
Lemma qc_heap_env_mono : forall env env2,Forall2 derivable1 env env2 ->
 forall t,qc_heap_den env t |-- qc_heap_den env2 t.
Proof.
 intros env env2 H t;induction t;cbn.
 - apply qc_heap_env_nth;assumption.
 - apply derivable1_sepcon_mono;assumption.
Qed.
Theorem qc_heap_reflect_mono : forall env env2 l r,
 Forall2 derivable1 env env2 ->
 qc_perm_test(qc_heap_leaves l)(qc_heap_leaves r)=true ->
 qc_heap_den env l |-- qc_heap_den env2 r.
Proof.
 intros;eapply derivable1_trans;[apply qc_heap_env_mono;exact H|].
 apply qc_heap_reflect;assumption.
Qed.
Print Assumptions qc_heap_reflect_mono.
Ltac qc_can_weaken p q :=
 lazymatch p with q=>constr:(true)|_=>
 lazymatch p with
 |store_char ?a ?v=>lazymatch q with undef_store_char a=>constr:(true)|_=>constr:(false)end
 |store_short ?a ?v=>lazymatch q with undef_store_short a=>constr:(true)|_=>constr:(false)end
 |store_int ?a ?v=>lazymatch q with undef_store_int a=>constr:(true)|_=>constr:(false)end
 |store_float ?a ?v=>lazymatch q with undef_store_float a=>constr:(true)|_=>constr:(false)end
 |store_ptr ?a ?v=>lazymatch q with undef_store_ptr a=>constr:(true)|_=>constr:(false)end
 |_=>constr:(false)end end.
Ltac qc_target_for p target :=
 lazymatch target with []=>fail "no corresponding target assertion" p
 |?q::?rest=>let b:=qc_can_weaken p q in
 lazymatch b with true=>constr:(q)|false=>qc_target_for p rest end end.
Ltac qc_refine_env env target :=
 lazymatch env with []=>constr:(@nil Assertion)
 |?p::?rest=>let q:=qc_target_for p target in let tail:=qc_refine_env rest target in constr:(q::tail)end.
Ltac qc_forall_derive :=
 lazymatch goal with |-Forall2 _ [] []=>constructor
 | |-Forall2 _ (_::_) (_::_)=>constructor;
 [first[apply derivable1_refl|apply store_char_undef_store_char|apply store_short_undef_store_short
 |apply store_int_undef_store_int|apply store_float_undef_store_float|apply store_ptr_undef_store_ptr]
 |qc_forall_derive]end.
Ltac qc_reflect_weaken :=
 lazymatch goal with |-?P |-- ?Q =>
 let env:=qc_heap_collect P constr:(@nil Assertion)in
 let target:=qc_heap_collect Q constr:(@nil Assertion)in
 let env2:=qc_refine_env env target in
 let l:=qc_heap_quote P env in let r:=qc_heap_quote Q env2 in
 apply(qc_heap_reflect_mono env env2 l r);[qc_forall_derive|vm_compute;reflexivity]end.

Ltac qc_reflected_spatial := first[solve[qc_reflect_cancel]|ig_layout;first[solve[qc_reflect_cancel]|solve[qc_reflect_weaken]]].
Ltac qc_frame_reflected :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_pure|qc_reflected_spatial]|qc_reflected_spatial].

Ltac qc_initial_normalize :=
 qc_subst;qc_normalize;
 try match goal with Hcap:qc4_data_capacity ?N ?K ?a ?w ?c |- _=>
 let Hp:=fresh in assert(Hp:0<qc4_panels N)by(apply qc_panels_positive;lia)end;
 rewrite ?Z.quot_0_l,?Z.div_0_l in * by lia;qc_normalize.
Ltac qc_frame_combined :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_neon_pure|qc_reflected_spatial]|qc_reflected_spatial].
