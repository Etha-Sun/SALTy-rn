From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From IGemmRvv Require Import rvv_goal.
From IGemmSupport Require Import IGemmFacts.
From Qd8RvvArith Require Import RvvArithmetic.
From Qd8Indirect Require Import IndirectionModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac igemm_context_facts :=
 match goal with H:igemm_shape ?mr ?N ?K ?ks ?es ?rs ?bs ?z ?zd ?off ?ps |- _ =>
 let Hd:=fresh "Hdepth" in let Hq:=fresh "Hentries" in
 let He:=fresh "Hlen" in let Hp:=fresh "Hpanels" in let Hw:=fresh "Hmatrix" in
 destruct (igemm_shape_facts mr N K ks es rs bs z zd off ps H) as [Hd [Hq [He [Hp Hw]]]];
 let HK:=fresh "Hkpos" in let HR:=fresh "Hrefpos" in
 assert (HK:0<K) by (unfold igemm_shape in H;tauto);
 assert (HR:0<Zlength rs) by (unfold igemm_shape in H;tauto);
 let HA:=fresh "Hextent" in pose proof (padded_read_extent_covers_K K ltac:(lia)) as HA
 end.
Ltac igemm_pure :=
 (rvv_normalize;try lia);try igemm_context_facts;unfold total_depth in *;
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
Ltac igemm_pure_selection :=
 (rvv_normalize;try lia);try igemm_context_facts;unfold total_depth in *;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 first[lia|nia|igemm_selection].
Lemma selected_initial_acc : forall K tile lane vl zp A Ps,
 qd8_active_z vl lane
 (qd8_selected_z vl lane
  (qd8_wrap_signed (qd8_selected_z vl lane (qd8_ks tile lane Ps)*zp)))
 (qd8_acc_signed K 0 tile lane zp A Ps).
Proof.
 intros K tile lane vl zp A Ps Hj;unfold qd8_selected_z.
 assert (E:(lane <? vl)=true) by (apply Z.ltb_lt;exact Hj).
 rewrite E;reflexivity.
Qed.

Lemma igemm_selected_acc_step : forall K zero zero_data offset entries refs blocks
 j k tile lane vl acc zp Ps,
 0<K -> input_mapping K zero zero_data offset entries refs blocks ->
 0<=j<Zlength refs -> 0<=k<K ->
 qd8_active_z vl lane acc
  (qd8_acc_signed (total_depth K refs) (j*K+k) tile lane zp
   (flat_inputs blocks refs K) Ps) ->
 qd8_active_z vl lane
 (qd8_selected_z vl lane
  (qd8_mac_signed acc (Znth k (input_window blocks refs K j) 0)
   (qd8_selected_z vl lane
    (qd8_selected_z vl lane
     (qd8_zget (8*(j*K+k)+lane) (weights (panel_at Ps tile)))))))
 (qd8_acc_signed (total_depth K refs) (j*K+k+1) tile lane zp
  (flat_inputs blocks refs K) Ps).
Proof.
 intros K zero zero_data offset entries refs blocks j k tile lane vl acc zp Ps
 HK HM Hj Hk HA Hlane.
 unfold qd8_selected_z.
 assert (E:(lane <? vl)=true) by (apply Z.ltb_lt;exact Hlane).
 rewrite E,HA by exact Hlane.
 rewrite <- (flat_inputs_window_byte K zero zero_data offset entries refs blocks j k HK HM Hj Hk).
 apply qd8_rvv_acc_step;nia.
Qed.

Lemma igemm_entry_index_next : forall ks p,
 8<=p<=ks ->
 Z.quot (ks-(p-8)) 8=Z.quot (ks-p) 8+1.
Proof.
 intros;rewrite !Z.quot_div_nonneg by lia.
 replace (ks-(p-8)) with ((ks-p)+1*8) by ring.
 rewrite Z.div_add by lia;reflexivity.
Qed.

Lemma igemm_entry_depth_next : forall K ks p,
 8<=p<=ks ->
 Z.quot (ks-(p-8)) 8*K=Z.quot (ks-p) 8*K+K.
Proof. intros;rewrite igemm_entry_index_next by assumption;ring. Qed.

Lemma igemm_mapped_selection_no_wrap : forall K zero zero_data offset entries refs blocks j,
 input_mapping K zero zero_data offset entries refs blocks ->
 0<=j<Zlength refs -> Znth j entries 0<>zero ->
 unsigned_last_nbits (Znth j entries 0+offset) 64=input_address blocks refs j.
Proof.
 intros K zero zero_data offset entries refs blocks j HM Hj Hne.
 pose proof (mapped_input_address K zero zero_data offset entries refs blocks j HM Hj) as Ha.
 unfold selected_address in Ha;destruct (Z.eq_dec (Znth j entries 0) zero);[contradiction|].
 destruct HM as [_ HM];specialize (HM j Hj);destruct HM as [[Ho [He|Hb]] _];[contradiction|].
 rewrite unsigned_last_nbits_eq;[exact Ha|].
 unfold ptr_modulus in *;change (0<=Znth j entries 0+offset<18446744073709551616);lia.
Qed.

Ltac igemm_step :=
 match goal with
 HM:input_mapping ?K ?zz ?zd ?off ?es ?rs ?bs |-
 qd8_active_z ?vl ?lane
  (qd8_selected_z _ _ (qd8_mac_signed ?acc
   (Znth ?kk (input_window ?bs ?rs ?K ?jj) 0) _))
  (qd8_acc_signed (total_depth ?K ?rs) ?depth
   ?tile ?lane ?zp (flat_inputs ?bs ?rs ?K) ?ps) =>
 let HS:=fresh "Hstep" in
 pose proof (igemm_selected_acc_step K zz zd off es rs bs jj kk tile lane vl acc zp ps) as HS;
 replace (qd8_acc_signed (total_depth K rs) (jj*K+kk+1) tile lane zp (flat_inputs bs rs K) ps)
 with (qd8_acc_signed (total_depth K rs) depth tile lane zp (flat_inputs bs rs K) ps) in HS by (f_equal;ring);
 rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in HS;
 apply HS;[lia|exact HM|lia|lia|first[assumption|apply selected_initial_acc]]
 end.
Ltac igemm_loop_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 first[lia|nia|congruence|igemm_step|unfold total_depth in *;nia].
Ltac igemm_loop_frame :=
 rvv_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;[igemm_loop_pure|qd8_cancel].
Module Checked.
Lemma proof_of_test_rvv_entail_wit_3_4:rvv_goal.test_rvv_entail_wit_3_4.
Proof. unfold rvv_goal.test_rvv_entail_wit_3_4;intros quantization_params_pre params_pre zero_data_pre zero_pre a_offset_pre c_pre w_pre a_pre ks_pre kc_pre nc_pre mr_pre hi lo inv zp Ps Blocks Refs Entries s7_2 s6_2 s5_2 s4_2 s3_2 s2_2 s1_2 s0_2 z7_2 z6_2 z5_2 z4_2 z3_2 z2_2 z1_2 z0_2 w a p vl c0 bounds_nan nc cn_stride PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47 PreH48 PreH49 PreH50 PreH51 PreH52 PreH53 PreH54.
Right.
Exists (s7_2) (s6_2) (s5_2) (s4_2) (s3_2) (s2_2) (s1_2) (s0_2) ((qd8_selected_z (vl) (7) ((qd8_mac_signed (z7_2) ((Znth (kc_pre - kc_pre ) (input_window (Blocks) (Refs) (kc_pre) (((ks_pre - p ) ÷ 8 ))) 0)) ((qd8_selected_z (vl) (7) ((qd8_selected_z (vl) (7) ((qd8_zget (((8 * ((((ks_pre - p ) ÷ 8 ) * kc_pre ) + (kc_pre - kc_pre ) ) ) + 7 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (6) ((qd8_mac_signed (z6_2) ((Znth (kc_pre - kc_pre ) (input_window (Blocks) (Refs) (kc_pre) (((ks_pre - p ) ÷ 8 ))) 0)) ((qd8_selected_z (vl) (6) ((qd8_selected_z (vl) (6) ((qd8_zget (((8 * ((((ks_pre - p ) ÷ 8 ) * kc_pre ) + (kc_pre - kc_pre ) ) ) + 6 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (5) ((qd8_mac_signed (z5_2) ((Znth (kc_pre - kc_pre ) (input_window (Blocks) (Refs) (kc_pre) (((ks_pre - p ) ÷ 8 ))) 0)) ((qd8_selected_z (vl) (5) ((qd8_selected_z (vl) (5) ((qd8_zget (((8 * ((((ks_pre - p ) ÷ 8 ) * kc_pre ) + (kc_pre - kc_pre ) ) ) + 5 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (4) ((qd8_mac_signed (z4_2) ((Znth (kc_pre - kc_pre ) (input_window (Blocks) (Refs) (kc_pre) (((ks_pre - p ) ÷ 8 ))) 0)) ((qd8_selected_z (vl) (4) ((qd8_selected_z (vl) (4) ((qd8_zget (((8 * ((((ks_pre - p ) ÷ 8 ) * kc_pre ) + (kc_pre - kc_pre ) ) ) + 4 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (3) ((qd8_mac_signed (z3_2) ((Znth (kc_pre - kc_pre ) (input_window (Blocks) (Refs) (kc_pre) (((ks_pre - p ) ÷ 8 ))) 0)) ((qd8_selected_z (vl) (3) ((qd8_selected_z (vl) (3) ((qd8_zget (((8 * ((((ks_pre - p ) ÷ 8 ) * kc_pre ) + (kc_pre - kc_pre ) ) ) + 3 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (2) ((qd8_mac_signed (z2_2) ((Znth (kc_pre - kc_pre ) (input_window (Blocks) (Refs) (kc_pre) (((ks_pre - p ) ÷ 8 ))) 0)) ((qd8_selected_z (vl) (2) ((qd8_selected_z (vl) (2) ((qd8_zget (((8 * ((((ks_pre - p ) ÷ 8 ) * kc_pre ) + (kc_pre - kc_pre ) ) ) + 2 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (1) ((qd8_mac_signed (z1_2) ((Znth (kc_pre - kc_pre ) (input_window (Blocks) (Refs) (kc_pre) (((ks_pre - p ) ÷ 8 ))) 0)) ((qd8_selected_z (vl) (1) ((qd8_selected_z (vl) (1) ((qd8_zget (((8 * ((((ks_pre - p ) ÷ 8 ) * kc_pre ) + (kc_pre - kc_pre ) ) ) + 1 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (0) ((qd8_mac_signed (z0_2) ((Znth (kc_pre - kc_pre ) (input_window (Blocks) (Refs) (kc_pre) (((ks_pre - p ) ÷ 8 ))) 0)) ((qd8_selected_z (vl) (0) ((qd8_selected_z (vl) (0) ((qd8_zget (((8 * ((((ks_pre - p ) ÷ 8 ) * kc_pre ) + (kc_pre - kc_pre ) ) ) + 0 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))).
(rvv_normalize;try lia).
try igemm_context_facts.
timeout 1800 igemm_loop_frame.
Qed.
End Checked.
