From SimpleC.EE.QCP_demos_human Require Import int_array_strategy_proof uint_array_strategy_proof undef_uint_array_strategy_proof array_shape_strategy_proof.
From Probe1 Require Import p1_ptr_goal p1_ptr_checked.

Module VC_Correctness : VC_Correct.
  Include int_array_strategy_proof.
  Include uint_array_strategy_proof.
  Include undef_uint_array_strategy_proof.
  Include array_shape_strategy_proof.
  Include p1_ptr_checked.
End VC_Correctness.

Print Assumptions VC_Correctness.proof_of_vload_return_wit_1.
Print Assumptions VC_Correctness.proof_of_vstore_partial_solve_wit_1.
