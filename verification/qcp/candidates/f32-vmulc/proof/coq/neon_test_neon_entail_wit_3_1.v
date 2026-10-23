From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
From ByValue Require Import neon_copy_checked.
From VMulc Require Import Model neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac generic_copy :=
 unfold VMulc.Model.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; try csimpl;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1, andp, coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel]
 |forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel].
Lemma proof_of_test_neon_entail_wit_3_1 : test_neon_entail_wit_3_1.
Proof. unfold test_neon_entail_wit_3_1; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; subst batch; repeat match goal with H: context[Z.land] |- _ => vm_compute in H end; exfalso; congruence. Qed.
