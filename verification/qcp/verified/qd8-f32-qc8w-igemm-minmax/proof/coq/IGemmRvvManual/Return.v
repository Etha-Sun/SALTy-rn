From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From IGemmRvv Require Import rvv_goal.
From IGemmSupport Require Import IGemmFacts.
From Qd8RvvArith Require Import RvvArithmetic.
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
 (rvv_normalize;try lia);try igemm_context_facts;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];first[lia|nia].
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
Ltac igemm_frame :=
 (rvv_normalize;try lia);rvv_subst;(rvv_normalize;try lia);try igemm_context_facts;
 rvv_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[igemm_pure|igemm_borrow;(rvv_normalize;try lia);qd8_cancel]|igemm_borrow;(rvv_normalize;try lia);qd8_cancel].
Module Checked.
Lemma proof_of_test_rvv_return_wit_1:rvv_goal.test_rvv_return_wit_1.
Proof.
 unfold rvv_goal.test_rvv_return_wit_1;try left;intros.
 (rvv_normalize;try lia);rvv_subst;(rvv_normalize;try lia).
 sep_apply (qd8_rvv_output_complete c_pre nc_pre (total_depth kc_pre Refs) zp (flat_inputs Blocks Refs kc_pre) Ps inv lo hi).
 igemm_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_return_wit_1.
