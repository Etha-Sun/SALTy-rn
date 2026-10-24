From Coq Require Import ZArith Lia.
From FullDomainNeonVC Require Import neon_full_goal.
From FullDomainNeon Require Import FullNeonModel.
From FullDomainRvv Require Import FullState FullModel.
From FullNeonLoopProof Require Import AddressFacts.
From FullNeonOuterProof Require Import PrefixAddress PointerBounds.
From FullGemmGeometry Require Import PanelProgress.
From GemmNeon Require Import CopyFacts.
From LeaderAutomation Require Import FastFrame.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_9_1 : test_neon_entail_wit_9_1.
Proof.
 unfold test_neon_entail_wit_9_1;left;intros.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 prop_apply(full_nonnegative a_pre kc_pre A ltac:(lia));Intros_p HA.
 prop_apply(output_prefix_nonnegative c_pre mr_pre nc_pre (kc_pre÷4)
 (nc_pre-nc+8) A W lo hi ltac:(lia)ltac:(lia));Intros_p HC.
 pose proof(input_reset_bounds a_pre a0 kc_pre mr_pre 0 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(assumption))as[[A0lo A0hi][A0rlo A0rhi]].
 pose proof(output_next_bounds c_pre c0 nc_pre nc mr_pre 0 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(assumption))as[[C0lo C0hi][C0nlo C0nhi]].
 pose proof(input_reset_bounds a_pre a1 kc_pre mr_pre 1 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(assumption))as[[A1lo A1hi][A1rlo A1rhi]].
 pose proof(output_next_bounds c_pre c1 nc_pre nc mr_pre 1 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(assumption))as[[C1lo C1hi][C1nlo C1nhi]].
 pose proof(input_reset_bounds a_pre a2 kc_pre mr_pre 2 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(assumption))as[[A2lo A2hi][A2rlo A2rhi]].
 pose proof(output_next_bounds c_pre c2 nc_pre nc mr_pre 2 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(assumption))as[[C2lo C2hi][C2nlo C2nhi]].
 pose proof(input_reset_bounds a_pre a3 kc_pre mr_pre 3 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(assumption))as[[A3lo A3hi][A3rlo A3rhi]].
 pose proof(output_next_bounds c_pre c3 nc_pre nc mr_pre 3 18446744073709551615
 ltac:(assumption)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(assumption)ltac:(assumption))as[[C3lo C3hi][C3nlo C3nhi]].
 subst cn_stride.
 repeat multimatch goal with |-context[unsigned_last_nbits ?x 64]=>
 rewrite(unsigned_last_nbits_eq x 64)by(replace(2^64)with 18446744073709551616 by reflexivity;lia)end.
 pose proof(Z.quot_rem kc_pre 4 ltac:(lia))as HK.
 match goal with H:Z.rem kc_pre 4=0 |- _=>rewrite H in HK end.
 pose proof(panel_progress_arith nc_pre nc ltac:(lia)ltac:(assumption))as[HW[Hcount Hother]].
 rewrite HW in Hcount;rewrite Z.min_l in Hcount by lia.
 assert(Hnextrem:Z.rem(nc_pre-(nc-8))8=0).
 {pose proof(Z.quot_rem(nc_pre-nc)8 ltac:(lia))as E.
 match goal with H:Z.rem(nc_pre-nc)8=0 |- _=>rewrite H in E end.
 replace(nc_pre-(nc-8))with((((nc_pre-nc)÷8)+1)*8)by lia.
 apply Z.rem_mul;lia. }
 split_pure_spatial.
 - replace(nc_pre-(nc-8))with(nc_pre-nc+8)by lia.
   opaque_leaves;sepcon_assoc_change;fast_cancel.
 - unfold derivable1,andp,coq_prop;intros;
   repeat first[assumption|split|reflexivity|unfold fulln_outer_ptrs;right];try lia.
   all: rewrite ?Hcount;try lia.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_9_1.
