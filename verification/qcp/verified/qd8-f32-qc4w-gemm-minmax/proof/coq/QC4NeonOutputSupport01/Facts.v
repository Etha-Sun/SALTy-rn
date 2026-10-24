From Coq Require Import ZArith List Lia.
From QC4W Require Export NeonModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
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
Lemma qc_append_one : forall done K zp A Ps inv lo hi,0<=done ->
 qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K(done+0)zp A Ps inv lo hi]=
 qc4_values K(done+1)zp A Ps inv lo hi.
Proof.
 intros;pose proof(qc_output_block done K zp A Ps inv lo hi 1%nat H)as E.
 cbn[seq map Z.of_nat Pos.of_succ_nat Pos.succ]in E.
 unfold qc4_fappend;exact E.
Qed.
Print Assumptions qc_append_one.
Lemma qc_write_one : forall c N done K zp A Ps inv lo hi,0<=done ->
 qc4_write_state c N(done+1)(qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K(done+0)zp A Ps inv lo hi])=
 qc4_output_prefix c N(done+1)K zp A Ps inv lo hi.
Proof. intros;rewrite qc_append_one by assumption;reflexivity. Qed.
Print Assumptions qc_write_one.
Lemma qc_append_two : forall done K zp A Ps inv lo hi,0<=done ->
 qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K(done+0)zp A Ps inv lo hi;qc4_output K(done+1)zp A Ps inv lo hi]=
 qc4_values K(done+2)zp A Ps inv lo hi.
Proof.
 intros;pose proof(qc_output_block done K zp A Ps inv lo hi 2%nat H)as E.
 cbn[seq map Z.of_nat Pos.of_succ_nat Pos.succ]in E.
 unfold qc4_fappend;exact E.
Qed.
Print Assumptions qc_append_two.
Lemma qc_write_two : forall c N done K zp A Ps inv lo hi,0<=done ->
 qc4_write_state c N(done+2)(qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K(done+0)zp A Ps inv lo hi;qc4_output K(done+1)zp A Ps inv lo hi])=
 qc4_output_prefix c N(done+2)K zp A Ps inv lo hi.
Proof. intros;rewrite qc_append_two by assumption;reflexivity. Qed.
Print Assumptions qc_write_two.
Lemma qc_append_four : forall done K zp A Ps inv lo hi,0<=done ->
 qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K(done+0)zp A Ps inv lo hi;qc4_output K(done+1)zp A Ps inv lo hi;qc4_output K(done+2)zp A Ps inv lo hi;qc4_output K(done+3)zp A Ps inv lo hi]=
 qc4_values K(done+4)zp A Ps inv lo hi.
Proof.
 intros;pose proof(qc_output_block done K zp A Ps inv lo hi 4%nat H)as E.
 cbn[seq map Z.of_nat Pos.of_succ_nat Pos.succ]in E.
 unfold qc4_fappend;exact E.
Qed.
Print Assumptions qc_append_four.
Lemma qc_write_four : forall c N done K zp A Ps inv lo hi,0<=done ->
 qc4_write_state c N(done+4)(qc4_fappend(qc4_values K done zp A Ps inv lo hi)[qc4_output K(done+0)zp A Ps inv lo hi;qc4_output K(done+1)zp A Ps inv lo hi;qc4_output K(done+2)zp A Ps inv lo hi;qc4_output K(done+3)zp A Ps inv lo hi])=
 qc4_output_prefix c N(done+4)K zp A Ps inv lo hi.
Proof. intros;rewrite qc_append_four by assumption;reflexivity. Qed.
Print Assumptions qc_write_four.
