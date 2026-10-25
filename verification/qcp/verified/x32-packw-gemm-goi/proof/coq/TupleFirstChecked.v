From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From X32Packw Require Import tuple_first_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedTupleFirst : X32Packw.tuple_first_goal.VC_Correct.
Lemma proof_of_pw_tuple_first_safety_wit_1 : X32Packw.tuple_first_goal.pw_tuple_first_safety_wit_1.
Proof. unfold X32Packw.tuple_first_goal.pw_tuple_first_safety_wit_1;intros;entailer!. Qed.
Lemma proof_of_pw_tuple_first_return_wit_1 : X32Packw.tuple_first_goal.pw_tuple_first_return_wit_1.
Proof. unfold X32Packw.tuple_first_goal.pw_tuple_first_return_wit_1;intros;entailer!. Qed.
End CheckedTupleFirst.
Module TupleFirstAgain : X32Packw.tuple_first_goal.VC_Correct := CheckedTupleFirst.
Print Assumptions TupleFirstAgain.proof_of_pw_tuple_first_safety_wit_1.
Print Assumptions TupleFirstAgain.proof_of_pw_tuple_first_return_wit_1.
