From Coq Require Import ZArith Lia List.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import RvvSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qs8_activate :=
 repeat match goal with H:qs8_active_z ?v ?i ?r ?x |- _ =>
  let E:=fresh "Elane" in
  assert(E:r=x) by (apply H;lia);clear H
 end;subst.
Ltac qs8_step_lane K kk :=
 unfold qs8_active_z;intro;qs8_activate;
 replace (K-(kk-1)) with ((K-kk)+1) by lia;
 rewrite qs8_acc_step by lia;
 unfold qs8_char,qs8_zget;cbn [Z.eqb];rewrite ?Z.add_0_r;reflexivity.
Lemma checked_inner_step : test_rvv_entail_wit_1.
Proof.
 unfold test_rvv_entail_wit_1;right;intros;qs8_normalize2.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat apply conj;qs8_step_lane kc_pre k.
 - entailer!.
Qed.
Print Assumptions checked_inner_step.
