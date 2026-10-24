From Coq Require Import ZArith Lia.
From F32F16 Require Import NeonKernelCallsSupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelPart15.
Lemma proof_of_test_neon_partial_solve_wit_79:F32F16.neon_unit_goal.test_neon_partial_solve_wit_79.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_79; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_310:F32F16.neon_unit_goal.test_neon_partial_solve_wit_310.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_310.
intros.
cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
rewrite ?f16_scale_hi_decimal,?f16_scale_lo_decimal,?sizeof_float,?sizeof_ushort in *.
unfold f16_same_bits,same_bits in *;subst.
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
Lemma proof_of_test_neon_partial_solve_wit_69:F32F16.neon_unit_goal.test_neon_partial_solve_wit_69.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_69; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_45:F32F16.neon_unit_goal.test_neon_partial_solve_wit_45.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_45; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_47:F32F16.neon_unit_goal.test_neon_partial_solve_wit_47.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_47; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_256:F32F16.neon_unit_goal.test_neon_partial_solve_wit_256.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_256; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_293:F32F16.neon_unit_goal.test_neon_partial_solve_wit_293.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_293; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_288:F32F16.neon_unit_goal.test_neon_partial_solve_wit_288.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_288; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_270:F32F16.neon_unit_goal.test_neon_partial_solve_wit_270.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_270; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_269:F32F16.neon_unit_goal.test_neon_partial_solve_wit_269.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_269; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_257:F32F16.neon_unit_goal.test_neon_partial_solve_wit_257.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_257; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_227:F32F16.neon_unit_goal.test_neon_partial_solve_wit_227.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_227; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_193:F32F16.neon_unit_goal.test_neon_partial_solve_wit_193.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_193; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_204:F32F16.neon_unit_goal.test_neon_partial_solve_wit_204.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_204; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_106:F32F16.neon_unit_goal.test_neon_partial_solve_wit_106.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_106; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_24:F32F16.neon_unit_goal.test_neon_partial_solve_wit_24.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_24; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_164:F32F16.neon_unit_goal.test_neon_partial_solve_wit_164.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_164; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_18:F32F16.neon_unit_goal.test_neon_safety_wit_18.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_18; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_25:F32F16.neon_unit_goal.test_neon_safety_wit_25.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_25; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_70:F32F16.neon_unit_goal.test_neon_safety_wit_70.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_70; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_149:F32F16.neon_unit_goal.test_neon_partial_solve_wit_149.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_149,F32F16.neon_unit_goal.test_neon_partial_solve_wit_149_aux; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3_pure:F32F16.neon_unit_goal.test_neon_partial_solve_wit_3_pure.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_3_pure; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_49:F32F16.neon_unit_goal.test_neon_safety_wit_49.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_49; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_40:F32F16.neon_unit_goal.test_neon_safety_wit_40.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_40; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_149_pure:F32F16.neon_unit_goal.test_neon_partial_solve_wit_149_pure.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_149_pure; f16_kernel_finish. Qed.
End CheckedNeonKernelPart15.
