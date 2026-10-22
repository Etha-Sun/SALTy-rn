Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeon Require Import NeonBridge neon_bridge_strategy_goal neon_bridge_strategy_proof load_call_unit_goal.
From QcpVadd Require Import intrinsics_checked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedLoadCall : load_call_unit_goal.VC_Correct.
Include CheckedNeonBridge.
Lemma proof_of_load_call_return_wit_1 : load_call_return_wit_1.
Proof. unfold load_call_return_wit_1; pre_process; entailer!. Qed.
Lemma proof_of_load_call_partial_solve_wit_1 : load_call_partial_solve_wit_1.
Proof.
  unfold load_call_partial_solve_wit_1.
  intros n p r contents default Hge. unfold fp32_slice.
  sep_apply_l_atomic (float_full_open4 p n contents default).
  - dump_pre_spatial. lia.
  - entailer!.
Qed.
Lemma proof_of_load_local_return_wit_1 : load_local_return_wit_1.
Proof. unfold load_local_return_wit_1; pre_process; entailer!. Qed.
Lemma proof_of_load_local_partial_solve_wit_1 : load_local_partial_solve_wit_1.
Proof.
  unfold load_local_partial_solve_wit_1.
  intros n out p contents default Hge. unfold fp32_slice, UndefStructPredfloat32x4_t; csimpl.
  sep_apply_l_atomic (float_full_open4 p n contents default).
  - dump_pre_spatial. lia.
  - entailer!.
Qed.
Lemma proof_of_store_call_return_wit_1 : store_call_return_wit_1.
Proof. unfold store_call_return_wit_1; pre_process; entailer!. Qed.
Lemma proof_of_store_call_partial_solve_wit_1 : store_call_partial_solve_wit_1.
Proof.
  unfold store_call_partial_solve_wit_1; intros n a p x3 x2 x1 x0 Hge.
  sep_apply_l_atomic (float_undef_open4 p n).
  - dump_pre_spatial. lia.
  - entailer!.
Qed.
End CheckedLoadCall.
Print Assumptions CheckedLoadCall.proof_of_load_call_partial_solve_wit_1.
Print Assumptions CheckedLoadCall.proof_of_load_local_partial_solve_wit_1.
Print Assumptions CheckedLoadCall.proof_of_store_call_partial_solve_wit_1.
