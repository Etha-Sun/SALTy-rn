From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluRvvKernelSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon qlr_active_mask.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_23 : Qs8Lrelu.rvv_unit_goal.test_rvv_partial_solve_wit_23.
Proof. unfold Qs8Lrelu.rvv_unit_goal.test_rvv_partial_solve_wit_23;try left;intros;subst;try match goal with |- ?P |-- ?Q => match Q with context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end end;qlr_rvv_close. Qed.
End Checked.
