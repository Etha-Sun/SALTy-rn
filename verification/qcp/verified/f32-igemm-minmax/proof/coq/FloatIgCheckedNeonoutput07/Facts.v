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

Import ListNotations.
Lemma ig_output_snoc : forall done D A W lo hi,0<=done ->
 igemm_output done D A W lo hi++[neon_clamp(igemm_acc D D done A W)lo hi]=
 igemm_output(done+1)D A W lo hi.
Proof.
 intros;unfold igemm_output;rewrite Z2Nat.inj_add by lia;rewrite Nat.add_1_r.
 rewrite seq_S,map_app;cbn[map];rewrite Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.
Lemma ig_output_block : forall done D A W lo hi n,0<=done ->
 igemm_output done D A W lo hi++
 map(fun j=>neon_clamp(igemm_acc D D (done+Z.of_nat j) A W)lo hi)(seq 0 n)=
 igemm_output(done+Z.of_nat n)D A W lo hi.
Proof.
 intros done D A W lo hi n Hd;induction n.
 - cbn[seq map Z.of_nat];rewrite app_nil_r,Z.add_0_r;reflexivity.
 - rewrite seq_S,map_app,app_assoc,IHn;cbn[map];rewrite Nat.add_0_l.
   rewrite ig_output_snoc by lia;rewrite Nat2Z.inj_succ.
   replace(done+Z.succ(Z.of_nat n))with(done+Z.of_nat n+1)by lia;reflexivity.
Qed.
Lemma ig_neon_clamp_formula : forall x lo hi,fp32_neon_max(fp32_neon_min x hi)lo=neon_clamp x lo hi.
Proof. reflexivity. Qed.
Lemma ig_write_eight : forall c N done D A W lo hi,0<=done ->
 ig_write_state c N (done+4+4)
 ((igemm_output done D A W lo hi++
 [neon_clamp(igemm_acc D D done A W)lo hi;
 neon_clamp(igemm_acc D D(done+1)A W)lo hi;
 neon_clamp(igemm_acc D D(done+2)A W)lo hi;
 neon_clamp(igemm_acc D D(done+3)A W)lo hi])++
 [neon_clamp(igemm_acc D D(done+4)A W)lo hi;
 neon_clamp(igemm_acc D D(done+5)A W)lo hi;
 neon_clamp(igemm_acc D D(done+6)A W)lo hi;
 neon_clamp(igemm_acc D D(done+7)A W)lo hi])=
 ig_output_prefix c N(done+8)D A W lo hi.
Proof.
 intros;rewrite <-app_assoc.
 pose proof(ig_output_block done D A W lo hi 8 H)as E.
 cbv[seq map Z.of_nat Pos.of_succ_nat Pos.succ]in E.
 rewrite Z.add_0_r in E.
 unfold ig_output_prefix;replace(done+4+4)with(done+8)by lia;rewrite <-E;reflexivity.
Qed.
Ltac ig_output_normalize :=
 unfold bit_same in *;rvv_subst;rvv_normalize;ig_extra;
 repeat match goal with H : Zlength ?refs = ?ks/8 |- _=>rewrite <-H in *;clear H end;
 repeat match goal with |-context[(8*Zlength ?refs)/8]=>
 replace ((8*Zlength refs)/8)with(Zlength refs)in * by(rewrite Z.mul_comm,Z.div_mul by lia;reflexivity) end;
 unfold total_depth in *;
 repeat match goal with |-context[igemm_acc (?x * ?y) (?y * ?x) ?col ?A ?W]=>replace(x*y)with(y*x)by ring end;
 rewrite ?ig_neon_clamp_formula;unfold ig_fappend.
Print Assumptions ig_output_block.
Print Assumptions ig_write_eight.

Ltac ig_tail_split nc :=
 assert(Htail:nc=1 \/ nc=2 \/ nc=3 \/ nc=4 \/ nc=5 \/ nc=6 \/ nc=7)by lia;
 repeat match type of Htail with _ \/ _ =>destruct Htail as[Htail|Htail] end;
 subst nc;cbn [Z.land] in *.
