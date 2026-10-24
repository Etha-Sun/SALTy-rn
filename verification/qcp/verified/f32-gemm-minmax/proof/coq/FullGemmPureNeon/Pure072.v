From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import FullDomainNeonVC.neon_full_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_safety_wit_73 : test_neon_safety_wit_73.
Proof. unfold test_neon_safety_wit_73; intros.
 repeat apply _derivable1_andp_intros;
 apply derivable1s_coq_prop_r;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 first [lia | nia | congruence].
Qed.
Print Assumptions proof_of_test_neon_safety_wit_73.
