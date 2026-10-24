From Coq Require Import ZArith Lia.
From F32F16 Require Import NeonKernelCallsSupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelPart0.
Lemma proof_of_test_neon_partial_solve_wit_99:F32F16.neon_unit_goal.test_neon_partial_solve_wit_99.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_99.
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
Lemma proof_of_test_neon_partial_solve_wit_67:F32F16.neon_unit_goal.test_neon_partial_solve_wit_67.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_67; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_62:F32F16.neon_unit_goal.test_neon_partial_solve_wit_62.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_62; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_286:F32F16.neon_unit_goal.test_neon_partial_solve_wit_286.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_286; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_285:F32F16.neon_unit_goal.test_neon_partial_solve_wit_285.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_285; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_236:F32F16.neon_unit_goal.test_neon_partial_solve_wit_236.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_236; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_271:F32F16.neon_unit_goal.test_neon_partial_solve_wit_271.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_271; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_137:F32F16.neon_unit_goal.test_neon_partial_solve_wit_137.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_137; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_287:F32F16.neon_unit_goal.test_neon_partial_solve_wit_287.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_287; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_208:F32F16.neon_unit_goal.test_neon_partial_solve_wit_208.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_208; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_203:F32F16.neon_unit_goal.test_neon_partial_solve_wit_203.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_203; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_30:F32F16.neon_unit_goal.test_neon_partial_solve_wit_30.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_30; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_198:F32F16.neon_unit_goal.test_neon_partial_solve_wit_198.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_198; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_175:F32F16.neon_unit_goal.test_neon_partial_solve_wit_175.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_175; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_114:F32F16.neon_unit_goal.test_neon_partial_solve_wit_114.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_114; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_171:F32F16.neon_unit_goal.test_neon_partial_solve_wit_171.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_171; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_72:F32F16.neon_unit_goal.test_neon_partial_solve_wit_72.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_72; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8:F32F16.neon_unit_goal.test_neon_partial_solve_wit_8.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_8; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_30:F32F16.neon_unit_goal.test_neon_safety_wit_30.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_30; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_24:F32F16.neon_unit_goal.test_neon_safety_wit_24.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_24; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_6:F32F16.neon_unit_goal.test_neon_safety_wit_6.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_6; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_152:F32F16.neon_unit_goal.test_neon_partial_solve_wit_152.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_152,F32F16.neon_unit_goal.test_neon_partial_solve_wit_152_aux; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4_pure:F32F16.neon_unit_goal.test_neon_partial_solve_wit_4_pure.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_4_pure; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_22:F32F16.neon_unit_goal.test_neon_safety_wit_22.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_22; f16_kernel_finish. Qed.
End CheckedNeonKernelPart0.
