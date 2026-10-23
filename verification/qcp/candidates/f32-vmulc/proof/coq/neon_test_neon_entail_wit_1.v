From Coq Require Import ZArith Lia List.
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
From VMulc Require Import NeonResult.
Import ListNotations.
Ltac choose_initial_case :=
 first [solve [Exists 0;
    unfold FloatArray.full, store_array;
    cbn [store_array_rec]; entailer!;
    cbn [vmulc_values List.firstn Z.to_nat store_array_rec]; try entailer!;
    subst; try reflexivity; try lia]
 | rewrite <- derivable1_orp_intros1; choose_initial_case
 | rewrite <- derivable1_orp_intros2; choose_initial_case].

Lemma proof_of_test_neon_entail_wit_1 : test_neon_entail_wit_1.
Proof.
 unfold test_neon_entail_wit_1; intros.
 prop_apply (FloatArray.full_Zlength input_a_pre (batch_pre ÷ 4 + 3) A). Intros_p HA.
 unfold fp32_length.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 pose proof (byte_batch_tail_cases batch_pre ltac:(lia) PreH8) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]]; try lia.
 all: sep_apply (float_initial_split input_a_pre (batch_pre ÷ 4 + 3) A).
 all: choose_initial_case.
Qed.
