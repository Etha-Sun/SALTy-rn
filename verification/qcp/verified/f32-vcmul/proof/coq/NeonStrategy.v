From Coq Require Import ZArith Lia.
From VCMul Require Import ComplexModel neon_vcmul_strategy_goal.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedNeonStrategy : neon_vcmul_Strategy_Correct.
Lemma neon_vcmul_strategy1_correctness : neon_vcmul_strategy1.
Proof.
 pre_process_default; subst; unfold complex_real_prefix; simpl.
 unfold FloatArray.full, store_array; simpl store_array_rec; entailer!.
Qed.
Lemma neon_vcmul_strategy2_correctness : neon_vcmul_strategy2.
Proof.
 pre_process_default; subst; unfold complex_imag_prefix; simpl.
 unfold FloatArray.full, store_array; simpl store_array_rec; entailer!.
Qed.
Lemma neon_vcmul_strategy3_correctness : neon_vcmul_strategy3.
Proof.
 pre_process_default; subst.
 unfold vcmul_values,complex_real_prefix,complex_imag_prefix.
 pose proof (FloatArray.full_merge_to_full r n (2*n)
  (List.map (complex_real (Z.to_nat n) a b) (List.seq 0 (Z.to_nat n)))
  (List.map (complex_imag (Z.to_nat n) a b) (List.seq 0 (Z.to_nat n)))
  ltac:(lia)) as Hmerge.
 replace (2*n-n)%Z with n in Hmerge by lia.
 exact Hmerge.
Qed.
End CheckedNeonStrategy.
Print Assumptions CheckedNeonStrategy.neon_vcmul_strategy1_correctness.
Print Assumptions CheckedNeonStrategy.neon_vcmul_strategy2_correctness.

Print Assumptions CheckedNeonStrategy.neon_vcmul_strategy3_correctness.
