From Coq Require Import ZArith List Lia.
From Qd8RvvMath Require Export RvvMath.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rvv_extent_covers : forall K,0<K -> K<=a_read_extent K.
Proof.
 intros K HK;unfold a_read_extent.
 pose proof (Z.div_mod (K+7) 8 ltac:(lia)).
 pose proof (Z.mod_pos_bound (K+7) 8 ltac:(lia));lia.
Qed.
Lemma rvv_panels_positive : forall N,0<N -> 0<panels N.
Proof.
 intros N HN;unfold panels.
 pose proof (Z.div_mod (N+7) 8 ltac:(lia)).
 pose proof (Z.mod_pos_bound (N+7) 8 ltac:(lia));lia.
Qed.
Lemma rvv_domain_facts : forall mr N K Ps,
 domain_shape mr N K Ps -> 0<Zlength Ps /\ qd8_matrix_wf K Ps.
Proof.
 intros mr N K Ps (Hm&HN&HK&Hlen&Hwf);split.
 - rewrite Hlen;now apply rvv_panels_positive.
 - exact Hwf.
Qed.
Lemma rvv_uint64_identity : forall x,
 0<=x<=UINT64_MAX -> unsigned_last_nbits x 64=x.
Proof.
 intros x Hr;apply unsigned_last_nbits_eq.
 change (0<=x<18446744073709551616).
 change (0<=x<=18446744073709551615) in Hr;lia.
Qed.
Ltac rvv_facts :=
 match goal with
 | H:domain_shape ?mr ?N ?K ?Ps |- _ =>
   let Hn:=fresh "Hpanels" in let Hw:=fresh "Hmatrix" in
   destruct (rvv_domain_facts mr N K Ps H) as [Hn Hw]
 end;
 match goal with
 | H:0 < ?K |- _ =>
   let He:=fresh "Hextent" in pose proof (rvv_extent_covers K H) as He
 end.
Ltac rvv_arithmetic_facts K :=
 first [rvv_facts|idtac];
 let He:=fresh "Hextent" in
 assert (He:K<=a_read_extent K) by (apply rvv_extent_covers;lia).
Ltac rvv_subst := repeat match goal with H : ?x = ?y |- _ => is_var x;subst x end.
Ltac rvv_normalize :=
 rewrite ?sizeof_char,?sizeof_float,?sizeof_int in *;
 rewrite ?Z.sub_diag,?Z.quot_0_l,?Z.rem_0_l,
  ?Z.mul_0_l,?Z.mul_0_r,?Z.mul_1_l,?Z.mul_1_r,
  ?Z.add_0_l,?Z.add_0_r,?Z.sub_0_r,?replace_Znth_Znth in *.
Print Assumptions rvv_extent_covers.
Print Assumptions rvv_panels_positive.
Print Assumptions rvv_domain_facts.
Print Assumptions rvv_uint64_identity.
