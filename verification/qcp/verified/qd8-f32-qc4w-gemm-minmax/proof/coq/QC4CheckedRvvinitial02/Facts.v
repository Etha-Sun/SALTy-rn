From Coq Require Export ZArith List Lia Strings.String.
From QC4Rvv Require Export rvv_goal.
From QC4W Require Export Layouts ApiModel.
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
Ltac qc_normalize := rewrite ?sizeof_char,?sizeof_short,?sizeof_int,?sizeof_float,?sizeof_ptr in *;
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
 try qc_bounds;try match goal with H:0 < ?N |- _=>pose proof(qc_panels_positive N H)end;
 unfold qc4_active16_z in *;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 rewrite ?qc_acc_initial;
 try match goal with |- context[qc4_output_prefix ?c ?N 0 ?K ?zp ?A ?Ps ?inv ?lo ?hi] =>
 sep_apply(qc_empty_output c N K zp A Ps inv lo hi)end.
Ltac qc_active_initial :=
 unfold qc4_active_z in *;intros;
 repeat multimatch goal with H:?i < ?vl -> _ |- _ =>
 let Hi:=fresh in assert(Hi:i<vl)by lia;specialize(H Hi) end;
 congruence.
Ltac qc_initial_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 first[qc_arith3|qc_active_initial].
Ltac qc_initial_frame :=
 ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_initial_pure|ig_cancel]|ig_cancel].
Print Assumptions qc_empty_output.
Print Assumptions qc_finished_output.
Print Assumptions qc_acc_initial.
