Require Import QcpVadd.array_read_checked.
From Sqrt Require Import array_read_goal.
Module CheckedRead : Sqrt.array_read_goal.VC_Correct := QcpVadd.array_read_checked.CheckedArrayRead.
Print Assumptions CheckedRead.proof_of_qcp_vadd_read_return_wit_1.
Print Assumptions CheckedRead.proof_of_qcp_vadd_read_partial_solve_wit_1.
