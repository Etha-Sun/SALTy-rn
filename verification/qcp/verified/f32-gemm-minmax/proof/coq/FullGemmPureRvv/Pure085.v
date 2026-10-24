From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import GemmFullRvvVC15.unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_75_pure : test_rvv_partial_solve_wit_75_pure.
Proof. unfold test_rvv_partial_solve_wit_75_pure; intros.
 repeat apply _derivable1_andp_intros;
 apply derivable1s_coq_prop_r;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 first [lia | nia | congruence].
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_75_pure.
