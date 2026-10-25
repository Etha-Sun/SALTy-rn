From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import NeonMemoryTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qm_lane qm_neon_lane qm_arm_mul qm_arm_add qm_values qm_signed_bits qm_sat8 qm_sat16 qm_sat32.
Lemma proof_of_test_neon_entail_wit_1:Qs8Mul.neon_unit_goal.test_neon_entail_wit_1.
Proof. unfold Qs8Mul.neon_unit_goal.test_neon_entail_wit_1;right;qm_nm_intro.
 rewrite Z.sub_diag;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size];entailer!;
 first[apply Z.mod_1_r|apply Z.rem_1_r|unfold qm_values;reflexivity].
Qed.
Lemma proof_of_test_neon_entail_wit_2:Qs8Mul.neon_unit_goal.test_neon_entail_wit_2.
Proof. unfold Qs8Mul.neon_unit_goal.test_neon_entail_wit_2;right;qm_nm_intro.
 rewrite qm_magic_decimal;entailer!;vm_compute;reflexivity.
Qed.
Lemma proof_of_test_neon_entail_wit_4:Qs8Mul.neon_unit_goal.test_neon_entail_wit_4.
Proof. unfold Qs8Mul.neon_unit_goal.test_neon_entail_wit_4;qm_nm_start.
 assert(Hcases:batch=1\/batch=2\/batch=3\/batch=4\/batch=5\/batch=6\/batch=7)by lia.
 destruct Hcases as[H|[H|[H|[H|[H|[H|H]]]]]].
 - subst batch;Right;entailer!;qm_k_fact.
 - subst batch;Left;Right;entailer!;qm_k_fact.
 - subst batch;Left;Left;Right;entailer!;qm_k_fact.
 - subst batch;Left;Left;Left;Right;entailer!;qm_k_fact.
 - subst batch;Left;Left;Left;Left;Right;entailer!;qm_k_fact.
 - subst batch;Left;Left;Left;Left;Left;Right;entailer!;qm_k_fact.
 - subst batch;Left;Left;Left;Left;Left;Left;entailer!;qm_k_fact.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1.
Print Assumptions proof_of_test_neon_entail_wit_2.
Print Assumptions proof_of_test_neon_entail_wit_4.
