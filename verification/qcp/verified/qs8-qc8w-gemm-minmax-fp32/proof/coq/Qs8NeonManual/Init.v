From Coq Require Import ZArith Lia.
From Qs8NeonGoals Require Import G0344 G0370.
From Qs8Gemm Require Import KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qs8_store_int_wrap : forall p b,
 store_int p b |-- store_int p (qs8_wrap_signed b).
Proof.
 intros;unfold store_int;Intros.
 change(compcert.lib.Integers.Int.max_signed)with 2147483647 in *.
 change(compcert.lib.Integers.Int.min_signed)with (-2147483648) in *.
 rewrite qs8_signed_id by (change(-2147483648<=b<=2147483647);lia).
 entailer!.
Qed.
Ltac qs8_initial_stores :=
 repeat multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[store_int ?p (qs8_wrap_signed ?b)] =>
   multimatch P with context[store_int p b] => sep_apply(qs8_store_int_wrap p b) end
  end
 end.
Lemma checked_neon_init:test_neon_entail_wit_1.
Proof.
 unfold test_neon_entail_wit_1;left;intros;qs8_normalize2;qs8_domain_facts.
 rewrite ?qs8_acc_initial.
 change(4+1)with 5;change(4+2)with 6;change(4+3)with 7.
 qs8_initial_stores.
 sep_apply(qs8_prefix_zero c_pre nc_pre kc_pre A Ps magic offset lo hi).
 qs8_kernel_frame.
Qed.
Lemma checked_neon_reinit:test_neon_entail_wit_3.
Proof.
 unfold test_neon_entail_wit_3;left;intros;qs8_normalize2;qs8_domain_facts.
 rewrite ?qs8_acc_initial.
 change(4+1)with 5;change(4+2)with 6;change(4+3)with 7.
 qs8_initial_stores;qs8_kernel_frame.
Qed.
Print Assumptions checked_neon_init.
Print Assumptions checked_neon_reinit.
