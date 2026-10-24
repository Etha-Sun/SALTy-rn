From Coq Require Import ZArith Lia.
From F32F16 Require Import NeonKernelCallsSupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelPart1.
Lemma proof_of_test_neon_partial_solve_wit_86:F32F16.neon_unit_goal.test_neon_partial_solve_wit_86.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_86; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_148:F32F16.neon_unit_goal.test_neon_partial_solve_wit_148.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_148.
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
Lemma proof_of_test_neon_partial_solve_wit_309:F32F16.neon_unit_goal.test_neon_partial_solve_wit_309.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_309; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_64:F32F16.neon_unit_goal.test_neon_partial_solve_wit_64.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_64; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44:F32F16.neon_unit_goal.test_neon_partial_solve_wit_44.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_44; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_275:F32F16.neon_unit_goal.test_neon_partial_solve_wit_275.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_275; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_144:F32F16.neon_unit_goal.test_neon_partial_solve_wit_144.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_144; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_134:F32F16.neon_unit_goal.test_neon_partial_solve_wit_134.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_134; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_39:F32F16.neon_unit_goal.test_neon_partial_solve_wit_39.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_39; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_135:F32F16.neon_unit_goal.test_neon_partial_solve_wit_135.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_135; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_206:F32F16.neon_unit_goal.test_neon_partial_solve_wit_206.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_206; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_214:F32F16.neon_unit_goal.test_neon_partial_solve_wit_214.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_214; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_111:F32F16.neon_unit_goal.test_neon_partial_solve_wit_111.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_111; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_123:F32F16.neon_unit_goal.test_neon_partial_solve_wit_123.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_123; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_120:F32F16.neon_unit_goal.test_neon_partial_solve_wit_120.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_120; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_104:F32F16.neon_unit_goal.test_neon_partial_solve_wit_104.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_104; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_103:F32F16.neon_unit_goal.test_neon_partial_solve_wit_103.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_103; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_231:F32F16.neon_unit_goal.test_neon_partial_solve_wit_231.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_231; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_61:F32F16.neon_unit_goal.test_neon_safety_wit_61.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_61; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_249:F32F16.neon_unit_goal.test_neon_partial_solve_wit_249.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_249; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_124:F32F16.neon_unit_goal.test_neon_partial_solve_wit_124.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_124; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_50:F32F16.neon_unit_goal.test_neon_safety_wit_50.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_50; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_48:F32F16.neon_unit_goal.test_neon_safety_wit_48.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_48; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3:F32F16.neon_unit_goal.test_neon_partial_solve_wit_3.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_3,F32F16.neon_unit_goal.test_neon_partial_solve_wit_3_aux; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_37:F32F16.neon_unit_goal.test_neon_safety_wit_37.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_37; f16_kernel_finish. Qed.
End CheckedNeonKernelPart1.
