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
 (rvv_normalize;try lia);rvv_subst;(rvv_normalize;try lia);try igemm_context_facts;unfold total_depth in *;
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
 (rvv_normalize;try lia);rvv_subst;(rvv_normalize;try lia);try igemm_context_facts;unfold total_depth in *;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 first[lia|nia|congruence|igemm_selection].
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
Ltac igemm_frame :=
 (rvv_normalize;try lia);rvv_subst;(rvv_normalize;try lia);try igemm_context_facts;
 rvv_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
  [igemm_pure_selection|igemm_borrow;igemm_restore;(rvv_normalize;try lia);qd8_cancel]
 |igemm_borrow;igemm_restore;(rvv_normalize;try lia);qd8_cancel].
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_97:rvv_goal.test_rvv_partial_solve_wit_97.
Proof. unfold rvv_goal.test_rvv_partial_solve_wit_97;try match goal with |- _ \/ _ => left end;intros;timeout 1800 igemm_frame. Qed.
End Checked.
