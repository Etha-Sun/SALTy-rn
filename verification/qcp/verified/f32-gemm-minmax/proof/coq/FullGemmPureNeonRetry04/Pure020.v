From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullModel MachineDomain.
Require Import FullDomainNeonVC.neon_full_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_249_pure : test_neon_partial_solve_wit_249_pure.
Proof. unfold test_neon_partial_solve_wit_249_pure; try left; intros.
 try unfold FullDomainRvv.MachineDomain.machine_capacity in *;
 try unfold FullDomainRvv.FullModel.panel_cols, FullDomainRvv.FullModel.panel_wbase in *;
 repeat rewrite Z.sub_diag in *;
 repeat rewrite Z.div_0_l in * by lia;
 repeat rewrite Z.mod_0_l in * by lia;
 repeat rewrite Z.min_l in * by lia;
 repeat rewrite Z.min_r in * by lia;
 try subst a_stride_pre;
 repeat rewrite Z.add_assoc in *;
 repeat apply _derivable1_andp_intros;
 apply derivable1s_coq_prop_r;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 first [lia | nia | congruence | (repeat f_equal; lia)].
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_249_pure.
