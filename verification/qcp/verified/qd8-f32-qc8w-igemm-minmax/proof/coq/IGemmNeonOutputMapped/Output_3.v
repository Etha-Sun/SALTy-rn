From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From IGemmNeon Require Import neon_goal.
From Qd8IGemm Require Import IGemmNeonModel.
From IGemmSupport Require Import IGemmFacts.
From Qd8RvvArith Require Import RvvArithmetic.
From Qd8Indirect Require Import IndirectionModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma padded_block : forall K k,0<K -> 0<k<=K -> Z.rem (K-k) 8=0 -> K-k+8<=a_read_extent K.
Proof.
 intros K k HK Hk Hr;rewrite Z.rem_mod_nonneg in Hr by lia;unfold a_read_extent.
 pose proof(Z.div_mod (K+7) 8 ltac:(lia));pose proof(Z.mod_pos_bound (K+7) 8 ltac:(lia));
 pose proof(Z.div_mod (K-k) 8 ltac:(lia));lia.
Qed.
Lemma igemm_cursor_bounds : forall ks p,
 0<p<=ks -> Z.rem ks 8=0 -> 0<=Z.quot (ks-p) 8<Z.quot ks 8.
Proof.
 intros ks p Hp Hr;rewrite Z.rem_mod_nonneg in Hr by lia.
 rewrite !Z.quot_div_nonneg by lia;pose proof(Z.div_mod ks 8 ltac:(lia)).
 split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia].
Qed.
Lemma qd8_output_prefix_zero:forall c N K zp A Ps inv lo hi,
 qd8_output_prefix c N 0 K zp A Ps inv lo hi --||-- FloatArray.undef_full c N.
Proof.
 intros;unfold qd8_output_prefix.
 change(FloatArray.full c 0 nil ** FloatArray.undef_seg c 0 N --||-- FloatArray.undef_full c N).
 rewrite FloatArray.full_empty.
 unfold FloatArray.undef_seg,FloatArray.undef_full,store_undef_array.
 rewrite Z.sub_0_r. split;entailer!.
Qed.
Lemma qd8_output_complete : forall c N K zp A Ps inv lo hi,
 qd8_output_prefix c N N K zp A Ps inv lo hi |--
 qd8_output_ref c K N zp A Ps inv lo hi.
Proof.
 intros;unfold qd8_output_prefix.
 rewrite FloatArray.undef_seg_empty.
 unfold qd8_output_ref.
 Exists (completed_values K N zp A Ps inv lo hi).
 assert (Hr:Forall2 matches_reference
  (completed_values K N zp A Ps inv lo hi)
  (completed_values K N zp A Ps inv lo hi)).
 { generalize (completed_values K N zp A Ps inv lo hi).
   intro L;induction L;constructor;auto.
   left;reflexivity. }
 entailer!.
Qed.
Ltac igemm_context_facts :=
 match goal with H:igemm_shape ?mr ?N ?K ?ks ?es ?rs ?bs ?z ?zd ?off ?ps |- _ =>
 let Hd:=fresh "Hdepth" in let Hq:=fresh "Hentries" in
 let He:=fresh "Hlen" in let Hp:=fresh "Hpanels" in let Hw:=fresh "Hmatrix" in
 destruct (igemm_shape_facts mr N K ks es rs bs z zd off ps H) as [Hd [Hq [He [Hp Hw]]]];
 let HM:=fresh "Hmapping" in
 assert (HM:input_mapping K z zd off es rs bs) by (unfold igemm_shape in H;tauto);
 let HK:=fresh "Hkpos" in let HR:=fresh "Hrefpos" in
 assert (HK:0<K) by (unfold igemm_shape in H;tauto);
 assert (HR:0<Zlength rs) by (unfold igemm_shape in H;tauto);
 let HA:=fresh "Hextent" in pose proof (padded_read_extent_covers_K K ltac:(lia)) as HA;
 let H8:=fresh "Hextent8" in assert(H8:8<=a_read_extent K) by
 (pose proof(padded_block K K HK ltac:(lia));rewrite Z.sub_diag,Z.rem_0_l in * by lia;lia);
 try (match goal with Hr:Z.rem (K- ?k) 8=0 |- _ =>
 let Hb:=fresh "Hblock" in pose proof(padded_block K k HK ltac:(lia) Hr) as Hb end);
 try (match goal with Hp:?p<=ks |- _ =>
 let Hcur:=fresh "Hcursor" in pose proof(igemm_cursor_bounds ks p ltac:(lia) ltac:(lia)) as Hcur;
 destruct Hcur end)
 end.
Ltac igemm_pure :=
 (rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;rvv_normalize;try lia);rvv_subst;(rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;rvv_normalize;try lia);try igemm_context_facts;unfold total_depth in *;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];first[lia|nia].
Lemma selected_zero : forall z zd off,selected_address z z zd off=zd.
Proof. intros;unfold selected_address;destruct (Z.eq_dec z z);congruence. Qed.
Lemma mapped_unsigned_selection : forall K zero zero_data offset entries refs blocks j,
 input_mapping K zero zero_data offset entries refs blocks ->
 0<=j<Zlength refs -> Znth j entries 0<>zero ->
 unsigned_last_nbits (unsigned_last_nbits (Znth j entries 0) 64+offset) 64=
 selected_address (Znth j entries 0) zero zero_data offset.
Proof.
 intros K zero zero_data offset entries refs blocks j [_ HM] Hj Hne.
 specialize (HM j Hj);destruct HM as [[Ho [He|Hb]] _];[contradiction|].
 unfold ptr_modulus in *.
 rewrite (unsigned_last_nbits_eq (Znth j entries 0) 64) by
  (change (0<=Znth j entries 0<18446744073709551616);lia).
 rewrite (unsigned_last_nbits_eq (Znth j entries 0+offset) 64) by
  (change (0<=Znth j entries 0+offset<18446744073709551616);lia).
 unfold selected_address;destruct (Z.eq_dec (Znth j entries 0) zero);congruence.
Qed.
Ltac igemm_selection :=
 first[rewrite selected_zero;reflexivity|
 match goal with
 H:input_mapping ?K ?z ?zd ?off ?es ?rs ?bs |-
  unsigned_last_nbits (unsigned_last_nbits (Znth ?j ?es 0) 64+ ?off) 64=
  selected_address (Znth ?j ?es 0) ?z ?zd ?off =>
  apply (mapped_unsigned_selection K z zd off es rs bs j H);lia
 end].
Ltac igemm_load :=
 unfold igemm_i8_address_ok,FullModel.panel_bytes;
 first[left;repeat split;try reflexivity;nia|right;repeat split;try reflexivity;nia].
Ltac igemm_pure_selection :=
 (rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;rvv_normalize;try lia);rvv_subst;(rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;rvv_normalize;try lia);try igemm_context_facts;unfold total_depth in *;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 first[lia|nia|congruence|igemm_selection|igemm_load].
Lemma char_borrow : forall x i n xs,0<=i<n ->
 CharArray.full x n xs |-- CharArray.missing_i x i 0 n xs ** store_char (x+i) (Znth i xs 0).
Proof. intros;sep_apply (CharArray.full_split_to_missing_i x i n xs 0 H).
 unfold StoreCharAsElement.storeA;rewrite sizeof_char,Z.mul_1_r;entailer!. Qed.
Lemma ptr_borrow : forall x i n xs,0<=i<n ->
 PtrArray.full x n xs |-- PtrArray.missing_i x i 0 n xs ** store_ptr (x+i*8) (Znth i xs 0).
Proof. intros;sep_apply (PtrArray.full_split_to_missing_i x i n xs 0 H).
 unfold StorePtrAsElement.storeA;change (ptr_size_Z) with 8;entailer!. Qed.
Ltac igemm_borrow :=
 repeat first[
 multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[CharArray.missing_i ?x ?i 0 ?n ?xs] =>
   multimatch P with context[CharArray.full x n xs] =>
    sep_apply (char_borrow x i n xs ltac:(lia)) end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[PtrArray.missing_i ?x ?i 0 ?n ?xs] =>
   multimatch P with context[PtrArray.full x n xs] =>
    sep_apply (ptr_borrow x i n xs ltac:(lia)) end end end].
Lemma char_restore : forall x i n xs,0<=i<n ->
 CharArray.missing_i x i 0 n xs ** store_char (x+i) (Znth i xs 0) |-- CharArray.full x n xs.
Proof.
 intros;eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof (CharArray.missing_i_merge_to_full x i n (Znth i xs 0) xs H) as HM.
 unfold StoreCharAsElement.storeA in HM.
 rewrite sizeof_char,Z.mul_1_r,replace_Znth_Znth in HM by lia;exact HM.
Qed.
Lemma ptr_restore : forall x i n xs,0<=i<n ->
 PtrArray.missing_i x i 0 n xs ** store_ptr (x+i*8) (Znth i xs 0) |-- PtrArray.full x n xs.
Proof.
 intros;eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof (PtrArray.missing_i_merge_to_full x i n (Znth i xs 0) xs H) as HM.
 unfold StorePtrAsElement.storeA in HM;change (ptr_size_Z) with 8 in HM.
 rewrite replace_Znth_Znth in HM by lia;exact HM.
Qed.
Ltac igemm_restore :=
 repeat first[
 multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[CharArray.full ?x ?n ?xs] =>
   multimatch P with context[CharArray.missing_i x ?i 0 n xs] =>
    sep_apply (char_restore x i n xs ltac:(lia)) end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[PtrArray.full ?x ?n ?xs] =>
   multimatch P with context[PtrArray.missing_i x ?i 0 n xs] =>
    sep_apply (ptr_restore x i n xs ltac:(lia)) end end end].
Ltac igemm_address_normalize :=
 try (match goal with H:Znth ?j ?es 0 = ?z |- context[selected_address (Znth ?j ?es 0) ?z _ _] => rewrite H in * end);
 rewrite ?selected_zero in *;
 try (match goal with HM:input_mapping ?K ?z ?zd ?off ?es ?rs ?bs |- context[unsigned_last_nbits (unsigned_last_nbits (Znth ?j ?es 0) 64+ ?off) 64] =>
 rewrite (mapped_unsigned_selection K z zd off es rs bs j HM) by lia end);

 try (match goal with H:selected_address ?x ?z ?zd ?off = ?addr |- _ =>
  let E:=fresh "Ezero" in
  assert (E:selected_address z z zd off=addr) by congruence;
  rewrite E in *;clear E end);
 try (match goal with H:selected_address _ _ _ _ = _ |- _ => rewrite H in * end).
Ltac igemm_frame :=
 (rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;rvv_normalize;try lia);rvv_subst;(rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;rvv_normalize;try lia);try igemm_context_facts;
 igemm_address_normalize;rewrite ?qd8_output_prefix_zero;
 rvv_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
  [igemm_pure_selection|igemm_borrow;igemm_restore;(rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;rvv_normalize;try lia);qd8_cancel]
 |igemm_borrow;igemm_restore;(rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;rvv_normalize;try lia);qd8_cancel].
Ltac tail_cases nc :=
 assert (Hcases:nc=1 \/ nc=2 \/ nc=3 \/ nc=4 \/ nc=5 \/ nc=6 \/ nc=7) by lia;
 repeat match goal with H : _ \/ _ |- _ => destruct H end;
 subst nc;
 repeat match goal with
 | H : context[Z.land ?x ?y] |- _ =>
   let v:=eval vm_compute in (Z.land x y) in change (Z.land x y) with v in H
 | |- context[Z.land ?x ?y] =>
   let v:=eval vm_compute in (Z.land x y) in change (Z.land x y) with v
 end.

Import ListNotations.
From GemmSpec Require Import FmaModel IntrinsicModel.
Lemma completed_values_snoc : forall K done zp A Ps inv lo hi,
 0<=done ->
 completed_values K done zp A Ps inv lo hi ++
 [output_cell K done zp A Ps inv lo hi] =
 completed_values K (done+1) zp A Ps inv lo hi.
Proof.
 intros;unfold completed_values.
 rewrite Z2Nat.inj_add by lia;rewrite Nat.add_1_r.
 rewrite seq_S,map_app;cbn [map].
 rewrite Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.
Lemma output_cell_panel : forall K done lane zp A Ps inv lo hi,
 0<=done -> Z.rem done 8=0 -> 0<=lane<8 ->
 output_cell K (done+lane) zp A Ps inv lo hi =
 qd8_final_lane K (Z.quot done 8) lane zp A Ps inv lo hi.
Proof.
 intros K done lane zp A Ps inv lo hi Hd Hr Hj.
 rewrite Z.rem_mod_nonneg in Hr by lia.
 rewrite Z.quot_div_nonneg by lia.
 assert (Hm:(done+lane) mod 8=lane).
 { rewrite Z.add_mod by lia;rewrite Hr,Z.add_0_l.
   rewrite Z.mod_mod by lia;apply Z.mod_small;lia. }
 assert (Hq:(done+lane)/8=done/8).
 { pose proof (Z.div_mod done 8 ltac:(lia)).
   replace done with ((done/8)*8) at 1 by lia.
   rewrite Z.div_add_l by lia;rewrite (Z.div_small lane 8) by lia;lia. }
 unfold output_cell,qd8_final_lane,qd8_unclamped.
 rewrite Hm,Hq;reflexivity.
Qed.
Lemma completed_values_panel_block : forall K done zp A Ps inv lo hi n,
 0<=done -> Z.rem done 8=0 -> (n<=8)%nat ->
 completed_values K done zp A Ps inv lo hi ++
 map (fun j=>qd8_final_lane K (Z.quot done 8) (Z.of_nat j) zp A Ps inv lo hi)
     (seq 0 n) =
 completed_values K (done+Z.of_nat n) zp A Ps inv lo hi.
Proof.
 intros K done zp A Ps inv lo hi n Hd Hr;induction n;intro Hn.
 - cbn [seq map Z.of_nat];rewrite app_nil_r,Z.add_0_r;reflexivity.
 - rewrite seq_S,map_app,app_assoc.
   rewrite IHn by lia.
   cbn [map];rewrite Nat.add_0_l.
   rewrite <-(output_cell_panel K done (Z.of_nat n) zp A Ps inv lo hi) by lia.
   rewrite completed_values_snoc by lia.
   rewrite Nat2Z.inj_succ.
   replace (done+Z.succ (Z.of_nat n)) with (done+Z.of_nat n+1) by lia.
   reflexivity.
Qed.
Lemma qd8_final_lane_formula : forall K tile lane zp A Ps inv lo hi,
 fp32_neon_min (fp32_neon_max
   (fma_rne (fp32_mul (fp32_of_Z (qd8_acc_signed K K tile lane zp A Ps)) inv)
      (qd8_float_field 0 tile lane Ps) (qd8_float_field 1 tile lane Ps)) lo) hi =
 qd8_final_lane K tile lane zp A Ps inv lo hi.
Proof. reflexivity. Qed.
Lemma qd8_write_eight : forall c N done K zp A Ps inv lo hi,
 0<=done -> Z.rem done 8=0 ->
 qd8_write_state c N (done+4+4)
 ((completed_values K done zp A Ps inv lo hi ++
 [qd8_final_lane K (Z.quot done 8) 0 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 1 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 2 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 3 zp A Ps inv lo hi]) ++
 [qd8_final_lane K (Z.quot done 8) 4 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 5 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 6 zp A Ps inv lo hi;
  qd8_final_lane K (Z.quot done 8) 7 zp A Ps inv lo hi]) =
 qd8_output_prefix c N (done+8) K zp A Ps inv lo hi.
Proof.
 intros c N done K zp A Ps inv lo hi Hd Hr.
 rewrite <-app_assoc.
 pose proof (completed_values_panel_block K done zp A Ps inv lo hi 8 Hd Hr ltac:(lia)) as H.
 cbv [seq map Z.of_nat Pos.of_succ_nat Pos.succ] in H.
 unfold qd8_write_state,qd8_output_prefix.
 replace (done+4+4) with (done+8) by lia.
 rewrite <-H.
 reflexivity.
Qed.
Ltac neon_output_normalize p ks_pre kc_pre Refs :=
 subst p;rewrite ?sizeof_ptr in *;change Arch64.ptr_size_Z with 8 in *;
 (rvv_normalize;try lia);
 replace ((ks_pre÷8)*kc_pre) with (total_depth kc_pre Refs) in * by
 (unfold total_depth;match goal with H:Zlength Refs=ks_pre÷8 |- _ => rewrite H end;ring);
 replace (4+1) with 5 by reflexivity;replace (4+2) with 6 by reflexivity;replace (4+3) with 7 by reflexivity;
 rewrite ?qd8_final_lane_formula;unfold qd8_fappend.
Ltac outer_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];first[lia|nia|congruence].
Ltac outer_frame := rvv_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;[outer_pure|qd8_cancel].
Module Checked.
Lemma proof_of_test_neon_entail_wit_6_3:neon_goal.test_neon_entail_wit_6_3.
Proof. unfold neon_goal.test_neon_entail_wit_6_3;left;intros. assert (Hnc:nc=3) by (tail_cases nc;try congruence;lia). subst nc.
 neon_output_normalize p ks_pre kc_pre Refs.
 pose proof(completed_values_panel_block (total_depth kc_pre Refs) (nc_pre-3) zp (flat_inputs Blocks Refs kc_pre) Ps inv lo hi (3%nat) ltac:(lia) ltac:(lia) ltac:(lia)) as Hb;
 cbv [Z.to_nat Pos.to_nat Pos.iter_op Nat.add seq map Z.of_nat Pos.of_succ_nat Pos.succ] in Hb;
 replace (nc_pre-3+3) with nc_pre in Hb by lia;
 unfold qd8_write_state,qd8_output_prefix;
 rewrite ?Z.sub_0_r;rewrite <-Hb;
 repeat rewrite <-app_assoc;cbn[app];
 repeat multimatch goal with |-context[FloatArray.full c_pre ?count ?L] =>
 progress replace count with nc_pre by lia end;
 repeat multimatch goal with |-context[FloatArray.undef_seg c_pre ?count nc_pre] =>
 progress replace count with nc_pre by lia end;
 outer_frame.
Qed.
End Checked.
