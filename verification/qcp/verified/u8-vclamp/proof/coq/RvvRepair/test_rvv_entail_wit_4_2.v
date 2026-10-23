From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic U8KernelLogic.
From U8PackedKernel Require Import Prelude.
From RvvRepair Require Import unit_goal.
From PackedRepair Require Import KernelFacts MemoryFacts.
From PackedStep Require Import PackedObservation ByteBounds SegmentFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_4_2:RvvRepair.unit_goal.test_rvv_entail_wit_4_2.
Proof.
 unfold test_rvv_entail_wit_4_2;right;intros.
 rewrite ?sizeof_uchar in *.
 pose proof(u8_phase_split batch_pre ltac:(lia))as[Hpfx Hrem].
 assert(Hprefix:0<=u8_prefix_n batch_pre<=batch_pre)by(unfold u8_prefix_n;lia).
 pose proof(u8_bounds_modulo lo)as Hlo;pose proof(u8_bounds_modulo hi)as Hhi.
 assert(Hstep:0<retval<=batch_2)by lia.
 subst voutput_min_2;subst voutput_max_2;subst input_2;subst output_2.
 set(off:=batch_pre-batch_2)in *.
 assert(Hoff:off=batch_pre-batch_2)by reflexivity.
 set(R:=sublist off(batch_pre+7)A)in *.
 assert(Hlen:Zlength R=batch_2+7).
 { unfold R;rewrite Zlength_sublist by lia;lia. }
 rewrite ?Z.mul_1_r,?Z.add_0_r in *.
 prop_apply(active_input_bounds(input_pre+off)retval R ltac:(lia)). Intros_p Hbytes.
 fold(words32(fun wi=>word_max(word_min(word_load R retval wi)(u8_bound hi)retval wi)(u8_bound lo)retval wi)).
 rewrite(packed_suffix_list R(u8_bound lo)(u8_bound hi)retval ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)Hbytes).
 assert(Hactive:sublist 0 retval R=sublist off(off+retval)A).
 { unfold R;rewrite nested_sublist by lia;rewrite Z.add_0_r;reflexivity. }
 assert(Htail:sublist retval(batch_2+7)R=sublist(off+retval)(batch_pre+7)A).
 { unfold R;rewrite nested_sublist by lia;f_equal;lia. }
 repeat rewrite Hactive;rewrite Htail.
 replace(batch_pre-(batch_2-retval))with(off+retval)by lia.
 sep_apply_l_atomic(u8_seg_append input_pre off retval(sublist 0 off A)(sublist off(off+retval)A)ltac:(lia)ltac:(lia)).
 sep_apply_l_atomic(u8_full_append output_pre off retval (u8_prefix_list(u8_bound lo)(u8_bound hi)(sublist 0(u8_prefix_n batch_pre)A)++u8_suffix_list(u8_bound lo)(u8_bound hi)(sublist(u8_prefix_n batch_pre)off A))
 (u8_suffix_list(u8_bound lo)(u8_bound hi)(sublist off(off+retval)A))ltac:(lia)ltac:(lia)).
 rewrite <-sublist_split by lia.
 rewrite <-app_assoc.
 rewrite u8_suffix_append by lia.
 entailer!.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_2.
