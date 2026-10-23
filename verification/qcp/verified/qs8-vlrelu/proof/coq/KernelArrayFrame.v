From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Export KernelSemanticBounds.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qcv_undef_chunk : forall p m n,0<=m<=n ->
 CharArray.undef_full p n |-- CharArray.undef_seg p 0 m ** CharArray.undef_full(p+m)(n-m).
Proof.
 intros;sep_apply(CharArray.undef_full_split_to_undef_full p m n H).
 sep_apply(CharArray.undef_full_to_undef_seg p m).
 rewrite sizeof_char,Z.mul_1_r;apply derivable1_refl.
Qed.
Ltac qcv_opaque_except_rec q l :=
 lazymatch l with
 | nil => idtac
 | cons(norm_asrt ?v)?tail =>
   tryif constr_eq v q then idtac else
   (let cell:=fresh "frame_cell"in let E:=fresh "frame_cell_eq"in remember v as cell eqn:E;clear E);
   qcv_opaque_except_rec q tail
 end.
Ltac qcv_opaque_except q := lazymatch goal with |-?P|--_=>let leaves:=All_listasrts P in qcv_opaque_except_rec q leaves end.
Ltac qcv_rvv_split_output :=
 rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r,?local_field_address in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;
 [qcv_semantic_bounds|
 lazymatch goal with |-?P|--?Q=>
 lazymatch P with context[CharArray.undef_full ?p ?n]=>
 lazymatch Q with context[CharArray.undef_seg ?q ?lo ?m]=>
 let Hpq:=fresh "chunk_address"in assert(Hpq:q=p)by reflexivity;let Hlo:=fresh "chunk_zero"in assert(Hlo:lo=0)by reflexivity;
 let Hbound:=fresh "chunk_bound"in assert(Hbound:0<=m<=n)by lia;
match Q with context[CharArray.undef_full ?tail ?rest]=>
 let He:=fresh "chunk_suffix_address"in assert(He:tail=p+m)by lia;
 replace tail with(p+m)by lia
 end;
 let cell:=fresh "array_cell"in let E:=fresh "array_cell_eq"in
 remember(CharArray.undef_full p n)as cell eqn:E;
 qcv_opaque_except cell;subst cell;sepcon_assoc_change;
 eapply(derivable1_trans _ (CharArray.undef_full p n ** _));
 [pull_cell(CharArray.undef_full p n)|
 eapply(derivable1_trans _ ((CharArray.undef_seg p 0 m ** CharArray.undef_full(p+m)(n-m)) ** _));
 [apply derivable1_sepcon_mono;[apply qcv_undef_chunk;exact Hbound|apply derivable1_refl]|
 opaque_leaves;sepcon_assoc_change;fast_cancel]]
 end end end].

Lemma qcv_undef_full_chunk : forall p m n,0<=m<=n ->
 CharArray.undef_full p n |-- CharArray.undef_full p m ** CharArray.undef_full(p+m)(n-m).
Proof. intros;pose proof(CharArray.undef_full_split_to_undef_full p m n H)as HH;rewrite sizeof_char,Z.mul_1_r in HH;exact HH. Qed.
Ltac qcv_neon_split_output :=
 rewrite ?sizeof_char,?Z.mul_1_r,?Z.add_0_r,?local_field_address in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;
 [qcv_semantic_bounds|
 lazymatch goal with |-?P|--?Q=>
 lazymatch P with context[CharArray.undef_full ?p ?n]=>
 lazymatch Q with context[CharArray.undef_full ?q ?m]=>
 let Hpq:=fresh "chunk_address"in assert(Hpq:q=p)by reflexivity;
 let Hbound:=fresh "chunk_bound"in assert(Hbound:0<=m<=n)by lia;
match Q with context[CharArray.undef_full ?tail ?rest]=>
 let He:=fresh "chunk_suffix_address"in assert(He:tail=p+m)by lia;
 replace tail with(p+m)by lia
 end;
 let cell:=fresh "array_cell"in let E:=fresh "array_cell_eq"in
 remember(CharArray.undef_full p n)as cell eqn:E;
 qcv_opaque_except cell;subst cell;sepcon_assoc_change;
 eapply(derivable1_trans _ (CharArray.undef_full p n ** _));
 [pull_cell(CharArray.undef_full p n)|
 eapply(derivable1_trans _ ((CharArray.undef_full p m ** CharArray.undef_full(p+m)(n-m)) ** _));
 [apply derivable1_sepcon_mono;[apply qcv_undef_full_chunk;exact Hbound|apply derivable1_refl]|
 opaque_leaves;sepcon_assoc_change;fast_cancel]]
 end end end].
