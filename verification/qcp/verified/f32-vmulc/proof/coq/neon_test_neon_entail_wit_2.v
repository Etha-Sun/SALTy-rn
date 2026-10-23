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
Ltac choose_step_case k :=
 first [solve [Exists (k+4); entailer!; lia]
 | rewrite <- derivable1_orp_intros1; choose_step_case k
 | rewrite <- derivable1_orp_intros2; choose_step_case k].

Lemma proof_of_test_neon_entail_wit_2 : test_neon_entail_wit_2.
Proof.
 unfold test_neon_entail_wit_2; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k_2 + batch ÷ 4).
 { replace batch_pre with ((k_2 + batch ÷ 4)*4) by lia.
   rewrite Z.quot_mul by lia. reflexivity. }
 assert (Hnewq: (batch-16) ÷ 4 = batch ÷ 4-4).
 { replace (batch-16) with ((batch ÷ 4-4)*4) by lia.
   rewrite Z.quot_mul by lia. reflexivity. }
 assert (Hnewrem: (batch-16) % 4 = 0).
 { replace (batch-16) with ((batch ÷ 4-4)*4) by lia.
   rewrite Z.rem_mul by lia. reflexivity. }
 prop_apply (float_address_nonnegative (input_a+0*4)
   (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) A) __default_fp32)). Intros_p HAaddr.
 prop_apply (float_address_nonnegative (output+0*4)
   (fp32_mul (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) A) __default_fp32)
             c)). Intros_p HOaddr.
 subst input_a output.
 pose proof (float_input_step_four input_a_pre k_2 (batch_pre ÷ 4+3) A __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia)) as HstepA.
 pose proof (vmulc_output_step_four output_pre k_2 (batch_pre ÷ 4) (batch_pre ÷ 4+3) A c __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HstepO.
 unfold float_cells4 in HstepA,HstepO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HstepA,HstepO.
 replace (batch_pre ÷ 4+3-k_2) with (batch ÷ 4+3) in HstepA by lia.
 replace (batch_pre ÷ 4-k_2) with (batch ÷ 4) in HstepO by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HstepA, HstepO.
 sep_apply HstepA. sep_apply HstepO.
 replace (4*4) with 16 by lia.
 rewrite Hnewq.
 replace (batch_pre ÷ 4+3-(k_2+4)) with (batch ÷ 4-4+3) by lia.
 replace (batch_pre ÷ 4-(k_2+4)) with (batch ÷ 4-4) by lia.
 replace (input_a_pre+(k_2+4)*4) with (input_a_pre+k_2*4+16) by lia.
 replace (output_pre+(k_2+4)*4) with (output_pre+k_2*4+16) by lia.
 pose proof (byte_batch_tail_cases (batch-16) ltac:(lia) Hnewrem) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]].
 all: choose_step_case k_2.
Qed.
