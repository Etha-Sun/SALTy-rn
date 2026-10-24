From Coq Require Import ZArith Lia.
From F32F16 Require Import NeonKernelCallsSupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelPart11.
Lemma proof_of_test_neon_partial_solve_wit_304:F32F16.neon_unit_goal.test_neon_partial_solve_wit_304.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_304.
intros.
cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
rewrite ?f16_scale_hi_decimal,?f16_scale_lo_decimal,?sizeof_float,?sizeof_ushort in *.
unfold f16_same_bits,same_bits in *;subst.
rewrite ?f16_local_field_address.
match goal with |- ?P |-- _=>let leaves:=All_listasrts P in f16_opaque_except_output_rec leaves end.
f16_split_output_prefix.
repeat progress rewrite <- logic_equiv_andp_assoc.
apply _derivable1_andp_intros.
- unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
- opaque_leaves;sepcon_assoc_change.
  let rec walk :=
   lazymatch goal with
   | |- ?P |-- ?P=>apply derivable1_refl
   | |- ?P |-- ?q ** ?Q=>
    eapply(derivable1_trans P(q ** _)(q ** Q));
    [pull_cell q|apply derivable1_sepcon_mono;[apply derivable1_refl|walk]]
   end in walk.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_159:F32F16.neon_unit_goal.test_neon_partial_solve_wit_159.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_159; intros;f16_open_input_four;f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23:F32F16.neon_unit_goal.test_neon_partial_solve_wit_23.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_23; intros;f16_open_input_four;f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_66:F32F16.neon_unit_goal.test_neon_partial_solve_wit_66.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_66; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_147:F32F16.neon_unit_goal.test_neon_partial_solve_wit_147.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_147; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_142:F32F16.neon_unit_goal.test_neon_partial_solve_wit_142.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_142; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_247:F32F16.neon_unit_goal.test_neon_partial_solve_wit_247.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_247; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_281:F32F16.neon_unit_goal.test_neon_partial_solve_wit_281.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_281; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_283:F32F16.neon_unit_goal.test_neon_partial_solve_wit_283.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_283; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_234:F32F16.neon_unit_goal.test_neon_partial_solve_wit_234.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_234; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_235:F32F16.neon_unit_goal.test_neon_partial_solve_wit_235.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_235; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_229:F32F16.neon_unit_goal.test_neon_partial_solve_wit_229.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_229; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_201:F32F16.neon_unit_goal.test_neon_partial_solve_wit_201.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_201; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_115:F32F16.neon_unit_goal.test_neon_partial_solve_wit_115.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_115; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_188:F32F16.neon_unit_goal.test_neon_partial_solve_wit_188.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_188; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_118:F32F16.neon_unit_goal.test_neon_partial_solve_wit_118.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_118; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_20:F32F16.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_20; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_14:F32F16.neon_unit_goal.test_neon_partial_solve_wit_14.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_14; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_14:F32F16.neon_unit_goal.test_neon_safety_wit_14.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_14; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_130:F32F16.neon_unit_goal.test_neon_partial_solve_wit_130.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_130; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_7:F32F16.neon_unit_goal.test_neon_safety_wit_7.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_7; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1_pure:F32F16.neon_unit_goal.test_neon_partial_solve_wit_1_pure.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_1_pure; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_1:F32F16.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_1,F32F16.neon_unit_goal.test_neon_partial_solve_wit_1_aux; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_157:F32F16.neon_unit_goal.test_neon_partial_solve_wit_157.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_157,F32F16.neon_unit_goal.test_neon_partial_solve_wit_157_aux; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_151_pure:F32F16.neon_unit_goal.test_neon_partial_solve_wit_151_pure.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_151_pure; f16_kernel_finish. Qed.
End CheckedNeonKernelPart11.
