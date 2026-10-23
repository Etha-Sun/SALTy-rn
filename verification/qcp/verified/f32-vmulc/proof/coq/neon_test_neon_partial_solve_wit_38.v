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
Lemma proof_of_test_neon_partial_solve_wit_38 : test_neon_partial_solve_wit_38.
Proof. unfold test_neon_partial_solve_wit_38; intros _; unfold test_neon_partial_solve_wit_38_aux; intros; rewrite ?rvv_local_field_address; csimpl; sep_apply_l_atomic (float_undef_open1 output (Z.quot batch 4)); [dump_pre_spatial;lia|unfold StoreFloatAsElement.undefstoreA;replace (output+0*sizeof(FLOAT)) with output by lia;generic_copy]. Qed.
