From Coq Require Import ZArith Lia.
From QcpNeonLoop Require Import neon_loop_unit_goal InvariantFacts TailMemory.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma proof_of_test_neon_return_wit_4 : test_neon_return_wit_4.
Proof.
 unfold test_neon_return_wit_4; left; intros.
 unfold fp32_length in *.
 subst batch input_a input_b output.
 assert (Htotal: batch_pre ÷ 4 = k).
 { replace batch_pre with (k*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 rewrite Htotal in *.
 replace (0 ÷ 4) with 0 by reflexivity.
 replace (0+3) with 3 by reflexivity.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (float_input_merge input_a_pre k (k+3) A ltac:(lia) ltac:(lia)) as HA.
 pose proof (float_input_merge input_b_pre k (k+3) B ltac:(lia) ltac:(lia)) as HB.
 replace (k+3-k) with 3 in HA,HB by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA,HB.
 sep_apply HA. sep_apply HB.
 unfold FloatArray.undef_full, store_undef_array.
 cbn [Z.to_nat store_undef_array_rec]. entailer!.
Qed.
Print Assumptions proof_of_test_neon_return_wit_4.
