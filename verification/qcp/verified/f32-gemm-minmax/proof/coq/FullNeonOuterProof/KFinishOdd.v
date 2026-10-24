From Coq Require Import ZArith Lia.
From FullDomainNeonVC Require Import neon_full_goal.
From FullNeonOuterProof Require Import LastCell KFinishEven.
From FullNeonLoopProof Require Import Tail61Assoc LoopFacts KStep.
From FullGemmGeometry Require Import Geometry.
From GemmNeon Require Import CopyFacts LayoutModel KernelModel.
From LeaderAutomation Require Import FastFrame.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_5_1 : test_neon_entail_wit_5_1.
Proof.
 unfold test_neon_entail_wit_5_1;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 assert(Hk:k=4).
 {pose proof(Z.quot_rem k 4 ltac:(lia))as E;rewrite PreH33 in E;lia. }
 subst k.
 pose proof(quotient4_depth kc_pre 4 ltac:(lia)ltac:(assumption)ltac:(reflexivity))as[Hd Hrest].
 change((kc_pre-4)÷4=kc_pre÷4-1)in Hd.
 rewrite Hd in *.
 pose proof(Z.quot_rem kc_pre 4 ltac:(lia))as HK;rewrite PreH7 in HK.
 assert(HKpos:0<kc_pre÷4)by lia.
 rewrite <- !last_step_clamped by assumption.
 rewrite !weight_at_panel by lia.
 subst a0 a1 a2 a3 w.
 rewrite !scaled_offset4_add,!scaled_offset4.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];try lia;try ring.
 - repeat multimatch goal with |-context[KernelModel.gget ?i ?xs]=>Tail61Assoc.normalize_index i end.
   unfold UndefStructPredfloat32x4_t.
   rewrite ?neon_local_field_address.
   sepcon_assoc_change.
   forget_fields_direct.
   match goal with |- ?P |-- ?Q =>multimatch Q with context[undef_store_uint64 ?p]=>
   multimatch P with context[store_uint64 p ?v]=>forget_uint64_direct p v end end end.
   LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_5_1.
