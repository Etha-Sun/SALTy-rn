From Coq Require Import ZArith Lia.
From F32F16 Require Import NeonKernelCallsSupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelPart12.
Lemma proof_of_test_neon_partial_solve_wit_93:F32F16.neon_unit_goal.test_neon_partial_solve_wit_93.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_93; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_311:F32F16.neon_unit_goal.test_neon_partial_solve_wit_311.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_311.
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
Lemma proof_of_test_neon_partial_solve_wit_58:F32F16.neon_unit_goal.test_neon_partial_solve_wit_58.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_58; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_53:F32F16.neon_unit_goal.test_neon_partial_solve_wit_53.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_53; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_51:F32F16.neon_unit_goal.test_neon_partial_solve_wit_51.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_51; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_279:F32F16.neon_unit_goal.test_neon_partial_solve_wit_279.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_279; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_253:F32F16.neon_unit_goal.test_neon_partial_solve_wit_253.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_253; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_306:F32F16.neon_unit_goal.test_neon_partial_solve_wit_306.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_306,F32F16.neon_unit_goal.test_neon_partial_solve_wit_306_aux; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_300:F32F16.neon_unit_goal.test_neon_partial_solve_wit_300.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_300; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_278:F32F16.neon_unit_goal.test_neon_partial_solve_wit_278.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_278; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_205:F32F16.neon_unit_goal.test_neon_partial_solve_wit_205.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_205; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35:F32F16.neon_unit_goal.test_neon_partial_solve_wit_35.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_35; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_192:F32F16.neon_unit_goal.test_neon_partial_solve_wit_192.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_192; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29:F32F16.neon_unit_goal.test_neon_partial_solve_wit_29.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_29; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26:F32F16.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_26; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_107:F32F16.neon_unit_goal.test_neon_partial_solve_wit_107.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_107; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_22:F32F16.neon_unit_goal.test_neon_partial_solve_wit_22.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_22; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_76:F32F16.neon_unit_goal.test_neon_partial_solve_wit_76.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_76; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_28:F32F16.neon_unit_goal.test_neon_safety_wit_28.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_28; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_60:F32F16.neon_unit_goal.test_neon_safety_wit_60.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_60; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_32:F32F16.neon_unit_goal.test_neon_safety_wit_32.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_32; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5:F32F16.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold F32F16.neon_unit_goal.test_neon_partial_solve_wit_5; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_12:F32F16.neon_unit_goal.test_neon_safety_wit_12.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_12; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_38:F32F16.neon_unit_goal.test_neon_safety_wit_38.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_38; f16_kernel_finish. Qed.
Lemma proof_of_test_neon_safety_wit_36:F32F16.neon_unit_goal.test_neon_safety_wit_36.
Proof. unfold F32F16.neon_unit_goal.test_neon_safety_wit_36; f16_kernel_finish. Qed.
End CheckedNeonKernelPart12.
