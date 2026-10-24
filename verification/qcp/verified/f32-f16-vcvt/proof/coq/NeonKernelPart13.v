From Coq Require Import ZArith Lia.
From F32F16 Require Import NeonKernelCallsSupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelPart13.
Lemma proof_of_test_neon_partial_solve_wit_90:F32F16.neon_unit_goal.test_neon_partial_solve_wit_90.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_90; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_305:F32F16.neon_unit_goal.test_neon_partial_solve_wit_305.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_305.
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
Lemma proof_of_test_neon_partial_solve_wit_65:F32F16.neon_unit_goal.test_neon_partial_solve_wit_65.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_65; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_59:F32F16.neon_unit_goal.test_neon_partial_solve_wit_59.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_59; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_295:F32F16.neon_unit_goal.test_neon_partial_solve_wit_295.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_295; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_252:F32F16.neon_unit_goal.test_neon_partial_solve_wit_252.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_252; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_41:F32F16.neon_unit_goal.test_neon_partial_solve_wit_41.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_41; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_243:F32F16.neon_unit_goal.test_neon_partial_solve_wit_243.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_243; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_303:F32F16.neon_unit_goal.test_neon_partial_solve_wit_303.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_303; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_218:F32F16.neon_unit_goal.test_neon_partial_solve_wit_218.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_218; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_246:F32F16.neon_unit_goal.test_neon_partial_solve_wit_246.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_246; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31:F32F16.neon_unit_goal.test_neon_partial_solve_wit_31.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_31; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32:F32F16.neon_unit_goal.test_neon_partial_solve_wit_32.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_32; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_116:F32F16.neon_unit_goal.test_neon_partial_solve_wit_116.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_116; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_196:F32F16.neon_unit_goal.test_neon_partial_solve_wit_196.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_196; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_179:F32F16.neon_unit_goal.test_neon_partial_solve_wit_179.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_179; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_161:F32F16.neon_unit_goal.test_neon_partial_solve_wit_161.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_161; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_19:F32F16.neon_unit_goal.test_neon_safety_wit_19.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_19; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_67:F32F16.neon_unit_goal.test_neon_safety_wit_67.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_67; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_306_pure:F32F16.neon_unit_goal.test_neon_partial_solve_wit_306_pure.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_306_pure; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_250:F32F16.neon_unit_goal.test_neon_partial_solve_wit_250.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_250; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_1:F32F16.neon_unit_goal.test_neon_safety_wit_1.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_1; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_150_pure:F32F16.neon_unit_goal.test_neon_partial_solve_wit_150_pure.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_150_pure; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_41:F32F16.neon_unit_goal.test_neon_safety_wit_41.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_41; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_155_pure:F32F16.neon_unit_goal.test_neon_partial_solve_wit_155_pure.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_155_pure; f16_kernel_finish. Qed.
End CheckedNeonKernelPart13.
