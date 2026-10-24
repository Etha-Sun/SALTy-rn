From Coq Require Import ZArith List Lia.
From FloatAutomation Require Export Frame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma ig_shape_facts : forall mr N K ks entries refs blocks zero offset W,
 igemm_shape mr N K ks entries refs blocks zero offset W ->
 0<total_depth K refs /\ Z.quot ks 8=Zlength refs /\
 Zlength entries=Zlength refs /\ 0<panel_count N.
Proof.
 intros mr N K ks entries refs blocks zero offset W H.
 destruct H as (Hm&HN&HK&HR&HS&HW&HM).
 destruct HM as [HE HM];unfold total_depth.
 rewrite Z.quot_div_nonneg by lia.
 assert(Hdiv:ks/8=Zlength refs).
 { rewrite HS;replace(8*Zlength refs)with(Zlength refs*8)by ring;rewrite Z.div_mul by lia;reflexivity. }
 rewrite Hdiv.
 repeat split;auto;try nia;now apply panel_count_positive.
Qed.
Lemma ig_selected_zero : forall z off,selected_address z z off=z.
Proof. intros;unfold selected_address;destruct (Z.eq_dec z z);congruence. Qed.
Lemma ig_selected_other : forall entry z off,entry<>z ->
 selected_address entry z off=entry+off.
Proof. intros;unfold selected_address;destruct (Z.eq_dec entry z);congruence. Qed.
Lemma ig_selected_uint64 : forall K zero offset entries refs blocks j,
 input_mapping K zero offset entries refs blocks ->0<=j<Zlength refs ->
 Znth j entries 0<>zero ->
 unsigned_last_nbits(unsigned_last_nbits(Znth j entries 0)64+offset)64=
 selected_address (Znth j entries 0) zero offset.
Proof.
 intros K zero offset entries refs blocks j [_ HM] Hj Hne.
 specialize(HM j Hj);destruct HM as [[Hr [Ho [Ha Hb]]] _].
 rewrite ig_selected_other by assumption.
 destruct Hb as [He|Hb];[contradiction|].
 assert(E:unsigned_last_nbits(Znth j entries 0)64=Znth j entries 0).
 { apply unsigned_last_nbits_eq;change(0<=Znth j entries 0<18446744073709551616);unfold ptr_modulus in Hr;lia. }
 rewrite E;apply unsigned_last_nbits_eq.
 change(0<=Znth j entries 0+offset<18446744073709551616);unfold ptr_modulus in *;lia.
Qed.
Ltac ig_extra :=
 first [match goal with H:igemm_shape ?mr ?N ?K ?ks ?entries ?refs ?blocks ?zero ?offset ?W |- _ =>
  let Hd:=fresh in let Hs:=fresh in let He:=fresh in let Hp:=fresh in
  destruct(ig_shape_facts mr N K ks entries refs blocks zero offset W H)as[Hd[Hs[He Hp]]]
 end|idtac];
 rewrite ?ig_selected_zero in *;
 repeat first [progress(rewrite Z.quot_div_nonneg in * by lia)|progress(rewrite Z.rem_mod_nonneg in * by lia)|progress rvv_normalize].
Ltac ig_math_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 unfold packed_length,total_depth in *;nia.
Print Assumptions ig_shape_facts.
Print Assumptions ig_selected_uint64.

Ltac ig_selected_rewrite :=
 repeat multimatch goal with
 | H:input_mapping ?K ?zero ?off ?entries ?refs ?blocks |-
 context[unsigned_last_nbits(unsigned_last_nbits(Znth ?j ?entries 0)64+?off)64] =>
 let E:=fresh "Hselected" in
 assert(E:unsigned_last_nbits(unsigned_last_nbits(Znth j entries 0)64+off)64=
 selected_address(Znth j entries 0)zero off)
 by(eapply ig_selected_uint64;[exact H|lia|assumption]);rewrite E
 end.

Inductive ig_div_seen(x b:Z):Prop:=ig_div_seen_intro:ig_div_seen x b.
Ltac ig_one_div x b :=
 lazymatch goal with _:ig_div_seen x b |- _=>fail|_=>
 let Hb:=fresh in assert(Hb:0<b)by lia;
 let E:=fresh "Hdiv" in pose proof(Z.div_mod x b ltac:(lia))as E;
 let B:=fresh "Hrem" in pose proof(Z.mod_pos_bound x b Hb)as B;
 let M:=fresh in assert(M:ig_div_seen x b)by constructor
 end.
Ltac ig_div_facts := repeat multimatch goal with
 |H:context[Z.div ?x ?b] |- _=>ig_one_div x b
 | |-context[Z.div ?x ?b]=>ig_one_div x b
 end.


Ltac ig_after_pure :=
 repeat first[assumption|reflexivity|apply conj];
 repeat rewrite Z.rem_mod_nonneg in * by lia;
 unfold packed_length,total_depth in *;nia.
Lemma float_borrow : forall x i n xs,0<=i<n ->
 FloatArray.full x n xs |-- FloatArray.missing_i x i 0 n xs ** store_float (x+i*4) (Znth i xs fp32_zero).
Proof. intros;sep_apply (FloatArray.full_split_to_missing_i x i n xs fp32_zero H).
 unfold StoreFloatAsElement.storeA;rewrite sizeof_float;entailer!. Qed.
Lemma ptr_borrow : forall x i n xs,0<=i<n ->
 PtrArray.full x n xs |-- PtrArray.missing_i x i 0 n xs ** store_ptr (x+i*8) (Znth i xs 0).
Proof. intros;sep_apply (PtrArray.full_split_to_missing_i x i n xs 0 H).
 unfold StorePtrAsElement.storeA;change (ptr_size_Z) with 8;entailer!. Qed.
Ltac igemm_borrow :=
 repeat first[
 multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[FloatArray.missing_i ?x ?i 0 ?n ?xs] =>
   multimatch P with context[FloatArray.full x n xs] =>
    sep_apply (float_borrow x i n xs ltac:(lia)) end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[PtrArray.missing_i ?x ?i 0 ?n ?xs] =>
   multimatch P with context[PtrArray.full x n xs] =>
    sep_apply (ptr_borrow x i n xs ltac:(lia)) end end end].
Lemma float_restore : forall x i n xs,0<=i<n ->
 FloatArray.missing_i x i 0 n xs ** store_float (x+i*4) (Znth i xs fp32_zero) |-- FloatArray.full x n xs.
Proof.
 intros;eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof (FloatArray.missing_i_merge_to_full x i n (Znth i xs fp32_zero) xs H) as HM.
 unfold StoreFloatAsElement.storeA in HM.
 rewrite sizeof_float,replace_Znth_Znth in HM by lia;exact HM.
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
  multimatch Q with context[FloatArray.full ?x ?n ?xs] =>
   multimatch P with context[FloatArray.missing_i x ?i 0 n xs] =>
    sep_apply (float_restore x i n xs ltac:(lia)) end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[PtrArray.full ?x ?n ?xs] =>
   multimatch P with context[PtrArray.missing_i x ?i 0 n xs] =>
    sep_apply (ptr_restore x i n xs ltac:(lia)) end end end].

Ltac ig_math_frame :=
 rewrite ?sizeof_ptr in *;unfold Arch64.ptr_size_Z in *;
 rvv_subst;rvv_normalize;try change (Z.of_nat Arch64.ptr_size) with 8 in *;ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;ig_after_pure
 |igemm_borrow;igemm_restore;rvv_normalize;ig_cancel]|igemm_borrow;igemm_restore;rvv_normalize;ig_cancel].
Ltac ig_zero_selected := repeat match goal with
 H : ?e = ?z |- context [selected_address ?e ?z ?off] =>
 rewrite H;rewrite ig_selected_zero
 end.

Ltac ig_copy_shape := match goal with
 H:igemm_shape _ _ _ _ _ _ _ _ _ _ |- _=>let C:=fresh in pose proof H as C;unfold igemm_shape in C;decompose [and] C;clear C end.
Ltac ig_copy_capacity := match goal with
 H:igemm_capacity _ _ _ _ _ _ _ |- _=>let C:=fresh in pose proof H as C;unfold igemm_capacity,ptr_modulus in C;decompose [and] C;clear C end.
Ltac ig_more_div := repeat multimatch goal with
 |H:context[Z.modulo ?x ?b] |- _=>ig_one_div x b
 |H:context[Z.div ?x ?b] |- _=>ig_one_div x b
 | |-context[Z.div ?x ?b]=>ig_one_div x b
 end.
Ltac ig_unwrap := repeat match goal with
 | |-context[unsigned_last_nbits ?x 64] =>
 let E:=fresh in assert(E:unsigned_last_nbits x 64=x)
 by(apply unsigned_last_nbits_eq;change(0<=x<18446744073709551616);nia);rewrite E
 end.
Ltac ig_addresses := repeat multimatch goal with
 H:input_mapping ?K ?zero ?off ?entries ?refs ?blocks |-
 context[selected_address (Znth ?j ?entries 0) ?zero ?off]=>
 rewrite (mapped_input_address K zero off entries refs blocks j H ltac:(lia))
 end.
Ltac ig_open_window := multimatch goal with
 H:input_mapping ?K ?zero ?off ?entries ?refs ?blocks |- ?L |-- ?R =>
 multimatch R with context[FloatArray.full (input_address blocks refs ?j) K (input_window blocks refs K ?j)]=>
 multimatch L with context[input_pool blocks]=>
 sep_apply (open_mapped_input K zero off entries refs blocks j H ltac:(lia)) end end end.
Ltac ig_close_window := multimatch goal with
 H:input_mapping ?K ?zero ?off ?entries ?refs ?blocks |- ?L |-- ?R =>
 multimatch L with context[FloatArray.full (input_address blocks refs ?j) K (input_window blocks refs K ?j)]=>
 multimatch R with context[input_pool blocks]=>
 sep_apply (close_mapped_input K zero off entries refs blocks j H ltac:(lia)) end end end.
Ltac ig_active_same :=
 match goal with H:active_value ?vl ?lane ?v (igemm_acc ?a ?D ?c ?A ?W) |-
 active_value ?vl ?lane ?v (igemm_acc ?b ?D ?c ?A ?W)=>
 replace b with a by nia;exact H end.
Ltac ig_loop_context :=
 rewrite ?sizeof_ptr in *;try change (Z.of_nat Arch64.ptr_size) with 8 in *;
 try change Arch64.ptr_size_Z with 8 in *;
 rvv_normalize;try lia;ig_extra;try ig_copy_shape;try ig_copy_capacity;
 rvv_subst;try ig_more_div;try ig_unwrap;ig_extra;try ig_more_div;try ig_addresses;
 try ig_open_window;try ig_close_window.
Ltac ig_loop_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 repeat rewrite Z.rem_mod_nonneg in * by lia;
 first[lia|congruence|ig_active_same|nia|unfold total_depth in *;nia].
Ltac ig_loop_frame :=
 ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;[ig_loop_pure|ig_cancel].

Lemma ig_packed_bias_aligned : forall D n col,
 0<=n -> n mod 8=0 -> n<=col<n+8 ->
 packed_bias_index D col=8*(D+1)*(n/8)+(col-n).
Proof.
 intros D n col Hn Hm Hc.
 pose proof(Z.div_mod n 8 ltac:(lia)) as Hd.
 assert(E:col=(col-n)+(n/8)*8) by nia.
 unfold packed_bias_index,panel_wbase.
 rewrite E,Z.div_add,Z.mod_add by lia.
 rewrite Z.div_small,Z.mod_small by lia.
 f_equal;nia.
Qed.
Lemma ig_acc_zero_aligned : forall D n col A W,
 0<=n -> n mod 8=0 -> n<=col<n+8 ->
 igemm_acc 0 D col A W=gget (8*(D+1)*(n/8)+(col-n)) W.
Proof. intros;rewrite igemm_acc_zero,ig_packed_bias_aligned with (n:=n) by assumption;reflexivity. Qed.
Ltac ig_bias_pure :=
 multimatch goal with
 H:?n mod 8=0 |- bit_same (gget ?idx ?W) (igemm_acc 0 ?D ?col ?A ?W)=>
 rewrite (ig_acc_zero_aligned D n col A W) by lia;
 unfold bit_same;
 replace idx with (8*(D+1)*(n/8)+(col-n)) by nia;reflexivity
 end.

Ltac ig_active_bias :=
 multimatch goal with
 H:?n mod 8=0,
 Ha:active_value ?vl ?lane ?v (rvv_at ?W ?idx) |-
 active_value ?vl ?lane ?v (igemm_acc 0 ?D ?col ?A ?W)=>
 rewrite (ig_acc_zero_aligned D n col A W) by lia;
 replace (8*(D+1)*(n/8)+(col-n)) with idx by nia;exact Ha
 end.
Ltac ig_bias_frame :=
 ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;
  repeat first[assumption|reflexivity|apply conj];repeat rewrite Z.rem_mod_nonneg in * by lia;
  first[lia|ig_active_bias|nia]
 |ig_cancel].
Ltac ig_expand_active := repeat match goal with
 H:active8 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ |- _=>unfold active8 in H;decompose [and] H;clear H end.

Lemma ig_advance_div : forall x p b, b<>0 -> (x-(p-b))/b=(x-p)/b+1.
Proof. intros;replace(x-(p-b))with((x-p)+1*b)by ring;apply Z.div_add;assumption. Qed.
Lemma ig_decrement_mod : forall p b,b<>0 -> (p-b) mod b=p mod b.
Proof. intros;rewrite Zminus_mod,Z.mod_same,Z.sub_0_r,Z.mod_mod by assumption;reflexivity. Qed.

Lemma ig_window_length : forall K zero off entries refs blocks entry,
 0<K ->input_mapping K zero off entries refs blocks ->0<=entry<Zlength refs ->
 Zlength(input_window blocks refs K entry)=K.
Proof. intros;unfold input_window;apply reference_values_length;eapply mapping_reference_valid;eauto. Qed.
Lemma ig_packed_weight_aligned : forall D n lane d,
 0<=n ->n mod 8=0 ->0<=lane<8 ->
 packed_weight_index D (n+lane) d=8*(D+1)*(n/8)+8+8*d+lane.
Proof. intros;unfold packed_weight_index;rewrite ig_packed_bias_aligned with (n:=n) by lia;ring. Qed.
Lemma ig_fma_active_step : forall K zero off entries refs blocks entry k n lane vl
 (acc weight out:fp32) W default,
 0<K ->input_mapping K zero off entries refs blocks ->0<=entry<Zlength refs ->0<=k<K ->
 0<=n ->n mod 8=0 ->0<=lane<8 ->
 active_value vl lane acc (igemm_acc (entry*K+k) (total_depth K refs) (n+lane) (flat_inputs blocks refs K) W) ->
 active_value vl lane weight (rvv_at W (8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k)+lane)) ->
 active_value vl lane out (fma_rne (Znth k (input_window blocks refs K entry) default) weight acc) ->
 active_value vl lane out (igemm_acc (entry*K+k+1) (total_depth K refs) (n+lane) (flat_inputs blocks refs K) W).
Proof.
 intros K zero off entries refs blocks entry k n lane vl acc weight out W default HK HM HE Hk Hn Hmod Hl HA HW HO.
 unfold active_value in *;intro Hv;specialize(HA Hv);specialize(HW Hv);specialize(HO Hv).
 rewrite HO,HA,HW.
 rewrite (igemm_entry_step K zero off entries refs blocks entry k (n+lane) W) by assumption.
 rewrite ig_packed_weight_aligned by assumption.
 unfold rvv_at.
 assert(EZ:Znth k (input_window blocks refs K entry) default=Znth k (input_window blocks refs K entry) fp32_zero).
 { apply Znth_indep;rewrite (ig_window_length K zero off entries refs blocks entry) by assumption;lia. }
 rewrite EZ;reflexivity.
Qed.
Ltac ig_step_lane :=
 multimatch goal with
 HM:input_mapping ?K ?zero ?off ?entries ?refs ?blocks,
 Hmod : (?n mod 8 = 0),
 HO:active_value ?vl ?lane ?out (fma_rne (Znth ?k (input_window ?blocks ?refs ?K ?entry) ?default) ?weight ?acc)
 |- active_value ?vl ?lane ?out (igemm_acc ?depth (total_depth ?K ?refs) ?col (flat_inputs ?blocks ?refs ?K) ?W)=>
 let Ec:=fresh in assert(Ec:n+lane=col)by ring;
 let HS:=fresh in pose proof(ig_fma_active_step K zero off entries refs blocks entry k n lane vl acc weight out W default)as HS;
 try rewrite Ec in HS;
 replace (entry*K+k+1) with depth in HS by ring;
 apply HS;rvv_normalize;first[assumption|lia]
 end.
Ltac ig_step_frame :=
 ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;
  repeat first[assumption|reflexivity|apply conj];repeat rewrite Z.rem_mod_nonneg in * by lia;
  repeat rewrite ig_advance_div by lia;repeat rewrite ig_decrement_mod by lia;
  first[lia|ig_step_lane|nia]
 |ig_cancel].

Lemma ig_neon_pair : forall K zero off entries refs blocks entry k n lane W,
 0<K ->input_mapping K zero off entries refs blocks ->0<=entry<Zlength refs ->
 0<=k ->k+1<K ->0<=n ->n mod 8=0 ->0<=lane<8 ->
 fma_rne (gget(k+1)(input_window blocks refs K entry))
 (gget(8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k)+8+lane)W)
 (fma_rne(gget k(input_window blocks refs K entry))
 (gget(8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k)+lane)W)
 (igemm_acc(entry*K+k)(total_depth K refs)(n+lane)(flat_inputs blocks refs K)W))=
 igemm_acc(entry*K+k+2)(total_depth K refs)(n+lane)(flat_inputs blocks refs K)W.
Proof.
 intros;rewrite (igemm_entry_pair K zero off entries refs blocks entry k (n+lane) W) by assumption.
 rewrite !ig_packed_weight_aligned by assumption.
 replace(8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k+1)+lane)
 with(8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k)+8+lane)by ring.
 reflexivity.
Qed.
Lemma ig_neon_one : forall K zero off entries refs blocks entry k n lane W,
 0<K ->input_mapping K zero off entries refs blocks ->0<=entry<Zlength refs ->
 0<=k<K ->0<=n ->n mod 8=0 ->0<=lane<8 ->
 fma_rne(gget k(input_window blocks refs K entry))
 (gget(8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k)+lane)W)
 (igemm_acc(entry*K+k)(total_depth K refs)(n+lane)(flat_inputs blocks refs K)W)=
 igemm_acc(entry*K+k+1)(total_depth K refs)(n+lane)(flat_inputs blocks refs K)W.
Proof.
 intros;rewrite (igemm_entry_step K zero off entries refs blocks entry k (n+lane) W) by assumption.
 rewrite ig_packed_weight_aligned by assumption;reflexivity.
Qed.
Ltac ig_neon_pair_lane :=
 multimatch goal with
 HM:input_mapping ?K ?zero ?off ?entries ?refs ?blocks,
 Hmod : (?n mod 8 = 0)
 |- fma_rne _ (gget ?idx2 ?W)
 (fma_rne (gget ?k (input_window ?blocks ?refs ?K ?entry)) (gget ?idx1 ?W) _)=
 igemm_acc ?depth (total_depth ?K ?refs) ?col (flat_inputs ?blocks ?refs ?K) ?W =>
 let HS:=fresh in pose proof(ig_neon_pair K zero off entries refs blocks entry k n (col-n) W
 ltac:(lia) HM ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) Hmod ltac:(lia))as HS;
 replace(n+(col-n))with col in HS by ring;
 replace(8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k)+8+(col-n))with idx2 in HS by ring;
 replace(8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k)+(col-n))with idx1 in HS by ring;
 replace(entry*K+k+2)with depth in HS by nia;exact HS
 end.
Ltac ig_neon_one_lane :=
 multimatch goal with
 HM:input_mapping ?K ?zero ?off ?entries ?refs ?blocks,
 Hmod : (?n mod 8 = 0)
 |- fma_rne (gget ?k (input_window ?blocks ?refs ?K ?entry)) (gget ?idx ?W) _=
 igemm_acc ?depth (total_depth ?K ?refs) ?col (flat_inputs ?blocks ?refs ?K) ?W =>
 let HS:=fresh in pose proof(ig_neon_one K zero off entries refs blocks entry k n (col-n) W
 ltac:(lia) HM ltac:(lia) ltac:(lia) ltac:(lia) Hmod ltac:(lia))as HS;
 replace(n+(col-n))with col in HS by ring;
 replace(8*(total_depth K refs+1)*(n/8)+8+8*(entry*K+k)+(col-n))with idx in HS by ring;
 replace(entry*K+k+1)with depth in HS by nia;exact HS
 end.
Ltac ig_neon_fma_frame :=
 ig_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;
  repeat first[assumption|reflexivity|apply conj];repeat rewrite Z.rem_mod_nonneg in * by lia;
  repeat rewrite ig_advance_div by lia;repeat rewrite ig_decrement_mod by lia;
  unfold bit_same;first[lia|ig_neon_pair_lane|ig_neon_one_lane|nia]
 |ig_cancel].
Print Assumptions ig_neon_pair.
Print Assumptions ig_neon_one.
