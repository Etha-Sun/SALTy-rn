From Coq Require Export ZArith List Lia Strings.String.
From QC4Neon Require Export neon_goal.
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


Ltac qc_pull_exact q :=
 lazymatch goal with |- ?a ** ?tail |-- _ =>
 first[constr_eq a q;apply derivable1_refl
 |constr_eq tail q;apply derivable1_sepcon_comm
 |eapply rvv_pull_through;qc_pull_exact q] end.
Ltac qc_cancel_exact :=
 lazymatch goal with |-?P |-- ?Q =>
 first[constr_eq P Q;apply derivable1_refl
 |lazymatch Q with ?q ** ?tail =>
 eapply(derivable1_trans P(q ** _)(q ** tail));
 [qc_pull_exact q|apply derivable1_sepcon_mono;[apply derivable1_refl|qc_cancel_exact]]end]end.
Ltac qc_frame_exact :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qc_pure|sepcon_assoc_change;qc_cancel_exact]
 |sepcon_assoc_change;qc_cancel_exact].

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
