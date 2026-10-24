From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import GemmFullRvvVC15.unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_safety_wit_31 : test_rvv_safety_wit_31.
Proof. unfold test_rvv_safety_wit_31; try left; intros.
 try unfold FullDomainRvv.MachineDomain.machine_capacity in *;
 try unfold FullDomainRvv.FullModel.panel_cols, FullDomainRvv.FullModel.panel_wbase in *;
 repeat rewrite Z.sub_diag in *;
 repeat rewrite Z.div_0_l in * by lia;
 repeat rewrite Z.mod_0_l in * by lia;
 repeat rewrite Z.min_l in * by lia;
 repeat rewrite Z.min_r in * by lia;
 repeat apply _derivable1_andp_intros;
 apply derivable1s_coq_prop_r;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 first [lia | nia | congruence].
Qed.
Print Assumptions proof_of_test_rvv_safety_wit_31.
