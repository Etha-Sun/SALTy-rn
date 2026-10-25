From Coq Require Import ZArith Lia List.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qs8_activate :=
 repeat match goal with H:qs8_active_z ?v ?i ?r ?x |- _ =>
  let E:=fresh "Elane" in
  assert(E:r=x) by (apply H;lia);clear H
 end;subst.
Ltac qs8_init_lane :=
 unfold qs8_active_z;intro;qs8_activate;
 rewrite qs8_acc_one;unfold qs8_char,qs8_zget;cbn -[qs8_mac qs8_bias];reflexivity.
Lemma checked_init_2_1:test_rvv_entail_wit_2_1.
Proof.
 unfold test_rvv_entail_wit_2_1;right;intros;qs8_normalize2;qs8_domain_facts.
 replace (kc_pre-(kc_pre-1)) with 1 by lia.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat apply conj;
   first[assumption|reflexivity|qs8_init_lane|unfold qs8_min in *;lia].
 - sep_apply(qs8_prefix_zero c_pre nc_pre kc_pre A Ps magic offset lo hi);opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions checked_init_2_1.
Lemma checked_init_2_2:test_rvv_entail_wit_2_2.
Proof.
 unfold test_rvv_entail_wit_2_2;right;intros;qs8_normalize2;qs8_domain_facts.
 replace (kc_pre-(kc_pre-1)) with 1 by lia.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat apply conj;
   first[assumption|reflexivity|qs8_init_lane|unfold qs8_min in *;lia].
 - sep_apply(qs8_prefix_zero c_pre nc_pre kc_pre A Ps magic offset lo hi);opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions checked_init_2_2.
Lemma checked_init_3_1:test_rvv_entail_wit_3_1.
Proof.
 unfold test_rvv_entail_wit_3_1;right;intros;qs8_normalize2;qs8_domain_facts.
 replace (kc_pre-(kc_pre-1)) with 1 by lia.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat apply conj;
   first[assumption|reflexivity|qs8_init_lane|unfold qs8_min in *;lia].
 - entailer!.
Qed.
Print Assumptions checked_init_3_1.
Lemma checked_init_3_2:test_rvv_entail_wit_3_2.
Proof.
 unfold test_rvv_entail_wit_3_2;right;intros;qs8_normalize2;qs8_domain_facts.
 replace (kc_pre-(kc_pre-1)) with 1 by lia.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat apply conj;
   first[assumption|reflexivity|qs8_init_lane|unfold qs8_min in *;lia].
 - entailer!.
Qed.
Print Assumptions checked_init_3_2.
