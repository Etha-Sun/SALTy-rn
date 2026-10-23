From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import NeonKernelMemorySupport neon_unit_goal.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedNeonKernelMemory.
Lemma proof_of_test_neon_entail_wit_1 : S8Clamp.neon_unit_goal.test_neon_entail_wit_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_1;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_2 : S8Clamp.neon_unit_goal.test_neon_entail_wit_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_2. left;intros. prop_apply(CharArray.full_Zlength input_pre(batch_pre+7)A). Intros_p HA. replace(batch_pre-batch_pre)with 0 by lia. rewrite s8_bulk_prefix_zero,s8_full0_cells. rewrite sizeof_char,sizeof_uchar,Z.rem_0_l by lia. unfold s8_narrow. rewrite ?sizeof_char,?sizeof_uchar in *. rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'. root_memory_frame. Qed.
Lemma proof_of_test_neon_entail_wit_3 : S8Clamp.neon_unit_goal.test_neon_entail_wit_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_3;right;intros. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. subst input output. repeat rewrite Z.quot_1_r.
replace(16+16+16+16)with 64 by reflexivity. replace(16+16+16)with 48 by reflexivity. replace(16+16)with 32 by reflexivity.
match goal with |-context[CharArray.undef_full ?u ?n]=>let HH:=fresh in assert(HH:n=0)by lia;rewrite HH;rewrite CharArray.undef_full_empty end. rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
replace(input_pre+(batch_pre-batch)-input_pre)with (batch_pre-batch) by lia.
pose proof(s8_window_pack16(fun x=>s8_bulk_lane x (s8_narrow RawLo)(s8_narrow RawHi))(batch_pre-batch) A ltac:(lia)ltac:(lia))as Hw0.
unfold s8_bulk_lane in Hw0. rewrite <-Hw0.
replace(input_pre+(batch_pre-batch)+16-input_pre)with ((batch_pre-batch)+16) by lia.
replace(output_pre+(batch_pre-batch)+16)with(output_pre+((batch_pre-batch)+16))by lia.
pose proof(s8_window_pack16(fun x=>s8_bulk_lane x (s8_narrow RawLo)(s8_narrow RawHi))((batch_pre-batch)+16) A ltac:(lia)ltac:(lia))as Hw16.
unfold s8_bulk_lane in Hw16. rewrite <-Hw16.
replace(input_pre+(batch_pre-batch)+32-input_pre)with ((batch_pre-batch)+32) by lia.
replace(output_pre+(batch_pre-batch)+32)with(output_pre+((batch_pre-batch)+32))by lia.
pose proof(s8_window_pack16(fun x=>s8_bulk_lane x (s8_narrow RawLo)(s8_narrow RawHi))((batch_pre-batch)+32) A ltac:(lia)ltac:(lia))as Hw32.
unfold s8_bulk_lane in Hw32. rewrite <-Hw32.
replace(input_pre+(batch_pre-batch)+48-input_pre)with ((batch_pre-batch)+48) by lia.
replace(output_pre+(batch_pre-batch)+48)with(output_pre+((batch_pre-batch)+48))by lia.
pose proof(s8_window_pack16(fun x=>s8_bulk_lane x (s8_narrow RawLo)(s8_narrow RawHi))((batch_pre-batch)+48) A ltac:(lia)ltac:(lia))as Hw48.
unfold s8_bulk_lane in Hw48. rewrite <-Hw48.
pose proof(s8_neon_bulk_chunk output_pre (batch_pre-batch) 16 (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)ltac:(lia)ltac:(lia))as Hm0.
unfold s8_bulk_lane in Hm0. sep_apply_l_atomic Hm0.
pose proof(s8_neon_bulk_chunk output_pre ((batch_pre-batch)+16) 16 (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)ltac:(lia)ltac:(lia))as Hm16.
replace(((batch_pre-batch)+16)+16)with((batch_pre-batch)+32)in Hm16 by lia.
unfold s8_bulk_lane in Hm16. sep_apply_l_atomic Hm16.
pose proof(s8_neon_bulk_chunk output_pre ((batch_pre-batch)+32) 16 (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)ltac:(lia)ltac:(lia))as Hm32.
replace(((batch_pre-batch)+32)+16)with((batch_pre-batch)+48)in Hm32 by lia.
unfold s8_bulk_lane in Hm32. sep_apply_l_atomic Hm32.
pose proof(s8_neon_bulk_chunk output_pre ((batch_pre-batch)+48) 16 (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)ltac:(lia)ltac:(lia))as Hm48.
replace(((batch_pre-batch)+48)+16)with((batch_pre-batch)+64)in Hm48 by lia.
unfold s8_bulk_lane in Hm48. sep_apply_l_atomic Hm48.
pose proof(s8_neon_bulk_next_multiple batch_pre batch ltac:(assumption))as Hnext.
replace(batch_pre-(batch-64))with((batch_pre-batch)+64)in * by lia. root_memory_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_4 : S8Clamp.neon_unit_goal.test_neon_entail_wit_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_4. left;intros. assert(Hidx:batch_pre-batch=s8_bulk_count batch_pre)by(apply s8_neon_bulk_exit_index;lia). assert(Hrem:Z.rem batch_pre 64=batch)by(rewrite Z.rem_mod_nonneg by lia;unfold s8_bulk_count in Hidx;lia). rewrite Hidx. replace(s8_bulk_count batch_pre-s8_bulk_count batch_pre)with 0 by lia. rewrite s8_tail_prefix_zero. rewrite ?sizeof_char,?sizeof_uchar in *. rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'. root_memory_frame. Qed.
Lemma proof_of_test_neon_entail_wit_5 : S8Clamp.neon_unit_goal.test_neon_entail_wit_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_5;right;intros. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. subst input output. rewrite Z.quot_1_r.
match goal with |-context[CharArray.undef_full ?u ?n]=>let HH:=fresh in assert(HH:n=0)by lia;rewrite HH;rewrite CharArray.undef_full_empty end. rewrite ?sepcon_emp_equiv,?sepcon_emp_logic_equiv'.
replace(input_pre+(batch_pre-batch)-input_pre)with (batch_pre-batch) by lia.
pose proof(s8_window_pack8(fun x=>s8_tail_lane x (s8_narrow RawLo)(s8_narrow RawHi))(batch_pre-batch) A ltac:(lia)ltac:(lia))as Hw0.
unfold s8_tail_lane in Hw0. rewrite <-Hw0.
assert(Hmod:Z.rem batch_pre 64=Z.modulo batch_pre 64)by(apply Z.rem_mod_nonneg;lia).
assert(Hk:s8_bulk_count batch_pre<=(batch_pre-batch))by(unfold s8_bulk_count;rewrite <-Hmod;lia).
sep_apply_l_atomic(s8_neon_tail_chunk output_pre (batch_pre-batch) 8 batch_pre (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)Hk ltac:(lia)ltac:(lia)).
pose proof(s8_neon_tail_next_multiple batch_pre batch ltac:(assumption))as Hnext.
replace(batch_pre-(batch-8))with((batch_pre-batch)+8)in * by lia. root_memory_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_6 : S8Clamp.neon_unit_goal.test_neon_entail_wit_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_6;intros. subst input. rewrite sizeof_char,sizeof_uchar,Z.quot_1_r in *. repeat rewrite Z.mul_1_r in *. replace(input_pre+(batch_pre-batch)-input_pre)with(batch_pre-batch)by lia. unfold s8_tail_lane.
 destruct(s8_neon_tail_cases batch ltac:(lia))as[H|[H|[H|[H|[H|[H|H]]]]]];subst batch.
 - Right. rewrite s8_undef1_cells. repeat rewrite Z.mul_1_r. repeat rewrite Z.add_0_r. root_memory_frame.
 - do 1 Left. Right. rewrite s8_undef2_cells. repeat rewrite Z.mul_1_r. repeat rewrite Z.add_0_r. root_memory_frame.
 - do 2 Left. Right. rewrite s8_undef3_cells. repeat rewrite Z.mul_1_r. repeat rewrite Z.add_0_r. root_memory_frame.
 - do 3 Left. Right. rewrite s8_undef4_cells. repeat rewrite Z.mul_1_r. repeat rewrite Z.add_0_r. root_memory_frame.
 - do 4 Left. Right. rewrite s8_undef5_cells. repeat rewrite Z.mul_1_r. repeat rewrite Z.add_0_r. root_memory_frame.
 - do 5 Left. Right. rewrite s8_undef6_cells. repeat rewrite Z.mul_1_r. repeat rewrite Z.add_0_r. root_memory_frame.
 - do 6 Left. rewrite s8_undef7_cells. repeat rewrite Z.mul_1_r. repeat rewrite Z.add_0_r. root_memory_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_7_1 : S8Clamp.neon_unit_goal.test_neon_entail_wit_7_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_7_1;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_7_2 : S8Clamp.neon_unit_goal.test_neon_entail_wit_7_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_7_2;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_7_3 : S8Clamp.neon_unit_goal.test_neon_entail_wit_7_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_7_3;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_7_4 : S8Clamp.neon_unit_goal.test_neon_entail_wit_7_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_7_4;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_7_5 : S8Clamp.neon_unit_goal.test_neon_entail_wit_7_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_7_5;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_7_6 : S8Clamp.neon_unit_goal.test_neon_entail_wit_7_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_7_6;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_7_7 : S8Clamp.neon_unit_goal.test_neon_entail_wit_7_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_7_7;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_1 : S8Clamp.neon_unit_goal.test_neon_entail_wit_8_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_8_1;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_2 : S8Clamp.neon_unit_goal.test_neon_entail_wit_8_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_8_2;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_3 : S8Clamp.neon_unit_goal.test_neon_entail_wit_8_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_8_3;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_4 : S8Clamp.neon_unit_goal.test_neon_entail_wit_8_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_8_4;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_5 : S8Clamp.neon_unit_goal.test_neon_entail_wit_8_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_8_5;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_6 : S8Clamp.neon_unit_goal.test_neon_entail_wit_8_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_8_6;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_8_7 : S8Clamp.neon_unit_goal.test_neon_entail_wit_8_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_8_7;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_9_1 : S8Clamp.neon_unit_goal.test_neon_entail_wit_9_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_9_1;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_9_2 : S8Clamp.neon_unit_goal.test_neon_entail_wit_9_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_9_2;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_9_3 : S8Clamp.neon_unit_goal.test_neon_entail_wit_9_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_9_3;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_9_4 : S8Clamp.neon_unit_goal.test_neon_entail_wit_9_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_9_4;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_9_5 : S8Clamp.neon_unit_goal.test_neon_entail_wit_9_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_9_5;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_9_6 : S8Clamp.neon_unit_goal.test_neon_entail_wit_9_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_9_6;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_9_7 : S8Clamp.neon_unit_goal.test_neon_entail_wit_9_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_9_7;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_10_1 : S8Clamp.neon_unit_goal.test_neon_entail_wit_10_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_10_1;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_10_2 : S8Clamp.neon_unit_goal.test_neon_entail_wit_10_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_10_2;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_10_3 : S8Clamp.neon_unit_goal.test_neon_entail_wit_10_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_10_3;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_10_4 : S8Clamp.neon_unit_goal.test_neon_entail_wit_10_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_10_4;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_10_5 : S8Clamp.neon_unit_goal.test_neon_entail_wit_10_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_10_5;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_10_6 : S8Clamp.neon_unit_goal.test_neon_entail_wit_10_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_10_6;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_10_7 : S8Clamp.neon_unit_goal.test_neon_entail_wit_10_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_10_7;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_11_1 : S8Clamp.neon_unit_goal.test_neon_entail_wit_11_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_11_1;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_11_2 : S8Clamp.neon_unit_goal.test_neon_entail_wit_11_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_11_2;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_11_3 : S8Clamp.neon_unit_goal.test_neon_entail_wit_11_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_11_3;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_11_4 : S8Clamp.neon_unit_goal.test_neon_entail_wit_11_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_11_4;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_11_5 : S8Clamp.neon_unit_goal.test_neon_entail_wit_11_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_11_5;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_11_6 : S8Clamp.neon_unit_goal.test_neon_entail_wit_11_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_11_6;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_11_7 : S8Clamp.neon_unit_goal.test_neon_entail_wit_11_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_11_7;try left;intros;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float,?Z.quot_1_r,?Z.rem_1_r,?Z.mod_1_r in *;repeat match goal with H:context[Z.land _ _] |- _ => progress vm_compute in H end;try congruence;try lia;root_memory_or.
Qed.
Lemma proof_of_test_neon_entail_wit_12_1 : S8Clamp.neon_unit_goal.test_neon_entail_wit_12_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_12_1;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_12_2 : S8Clamp.neon_unit_goal.test_neon_entail_wit_12_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_12_2;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_12_3 : S8Clamp.neon_unit_goal.test_neon_entail_wit_12_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_12_3;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_12_4 : S8Clamp.neon_unit_goal.test_neon_entail_wit_12_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_12_4;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_12_5 : S8Clamp.neon_unit_goal.test_neon_entail_wit_12_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_12_5;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_12_6 : S8Clamp.neon_unit_goal.test_neon_entail_wit_12_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_12_6;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_entail_wit_12_7 : S8Clamp.neon_unit_goal.test_neon_entail_wit_12_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_entail_wit_12_7;try left;pre_process;subst;rewrite ?sizeof_char,?sizeof_uchar,?sizeof_float in *;rewrite ?Z.rem_1_r,?Z.mod_1_r in *;entailer!;try lia.
Qed.
Lemma proof_of_test_neon_return_wit_1 : S8Clamp.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_return_wit_1;right;intros. assert(batch=7)by lia. subst batch. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. repeat rewrite Z.add_0_r in *. subst output.
try replace((output_pre+(batch_pre-7))+0+0)with((output_pre+(batch_pre-7))+0)by lia.
try replace((output_pre+(batch_pre-7))+0+1)with((output_pre+(batch_pre-7))+1)by lia.
try replace((output_pre+(batch_pre-7))+0+2)with((output_pre+(batch_pre-7))+2)by lia.
try replace((output_pre+(batch_pre-7))+0+3)with((output_pre+(batch_pre-7))+3)by lia.
try replace((output_pre+(batch_pre-7))+2+0)with((output_pre+(batch_pre-7))+2)by lia.
try replace((output_pre+(batch_pre-7))+2+1)with((output_pre+(batch_pre-7))+3)by lia.
try replace((output_pre+(batch_pre-7))+2+2)with((output_pre+(batch_pre-7))+4)by lia.
try replace((output_pre+(batch_pre-7))+2+3)with((output_pre+(batch_pre-7))+5)by lia.
try replace((output_pre+(batch_pre-7))+4+0)with((output_pre+(batch_pre-7))+4)by lia.
try replace((output_pre+(batch_pre-7))+4+1)with((output_pre+(batch_pre-7))+5)by lia.
try replace((output_pre+(batch_pre-7))+4+2)with((output_pre+(batch_pre-7))+6)by lia.
try replace((output_pre+(batch_pre-7))+4+3)with((output_pre+(batch_pre-7))+7)by lia.
repeat rewrite Z.add_0_r in *.
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip (output_pre+(batch_pre-7)) (s8_tail_lane(Znth (batch_pre-7) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-7))+1) (s8_tail_lane(Znth ((batch_pre-7)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-7))+2) (s8_tail_lane(Znth ((batch_pre-7)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-7))+3) (s8_tail_lane(Znth ((batch_pre-7)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-7))+4) (s8_tail_lane(Znth ((batch_pre-7)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-7))+5) (s8_tail_lane(Znth ((batch_pre-7)+5) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
assert(Hcells: ((output_pre+(batch_pre-7))+0) # Char |-> (s8_tail_lane(Znth (batch_pre-7) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-7))+1) # Char |-> (s8_tail_lane(Znth ((batch_pre-7)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-7))+2) # Char |-> (s8_tail_lane(Znth ((batch_pre-7)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-7))+3) # Char |-> (s8_tail_lane(Znth ((batch_pre-7)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-7))+4) # Char |-> (s8_tail_lane(Znth ((batch_pre-7)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-7))+5) # Char |-> (s8_tail_lane(Znth ((batch_pre-7)+5) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-7))+6) # Char |-> (s8_tail_lane(Znth ((batch_pre-7)+6) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) |-- CharArray.full (output_pre+(batch_pre-7)) 7 [(s8_tail_lane(Znth (batch_pre-7) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+5) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+6) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]).
{ rewrite s8_full7_cells. apply derivable1_refl. }
repeat rewrite Z.add_0_r in Hcells.
sep_apply_l_atomic Hcells.
assert(Hwindow: [(s8_tail_lane(Znth (batch_pre-7) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+5) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-7)+6) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]=map(fun x=>s8_tail_lane x (s8_narrow RawLo)(s8_narrow RawHi))(s8_window (batch_pre-7) 7 A)).
{ symmetry. rewrite s8_neon_map_window_7 by lia. repeat rewrite Z.add_0_r. reflexivity. }
assert(Hmod:Z.rem batch_pre 64=Z.modulo batch_pre 64)by(apply Z.rem_mod_nonneg;lia).
assert(Hk:s8_bulk_count batch_pre<=(batch_pre-7))by(unfold s8_bulk_count;rewrite <-Hmod;lia).
pose proof(s8_neon_tail_finish output_pre (batch_pre-7) batch_pre (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)Hk ltac:(lia))as Hfinish.
replace(batch_pre-(batch_pre-7))with 7 in Hfinish by lia. rewrite <-Hwindow in Hfinish.
sep_apply_l_atomic Hfinish. root_memory_frame.
Qed.
Lemma proof_of_test_neon_return_wit_2 : S8Clamp.neon_unit_goal.test_neon_return_wit_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_return_wit_2;right;intros. assert(batch=3)by lia. subst batch. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. repeat rewrite Z.add_0_r in *. subst output.
try replace((output_pre+(batch_pre-3))+0+0)with((output_pre+(batch_pre-3))+0)by lia.
try replace((output_pre+(batch_pre-3))+0+1)with((output_pre+(batch_pre-3))+1)by lia.
try replace((output_pre+(batch_pre-3))+0+2)with((output_pre+(batch_pre-3))+2)by lia.
try replace((output_pre+(batch_pre-3))+0+3)with((output_pre+(batch_pre-3))+3)by lia.
try replace((output_pre+(batch_pre-3))+2+0)with((output_pre+(batch_pre-3))+2)by lia.
try replace((output_pre+(batch_pre-3))+2+1)with((output_pre+(batch_pre-3))+3)by lia.
try replace((output_pre+(batch_pre-3))+2+2)with((output_pre+(batch_pre-3))+4)by lia.
try replace((output_pre+(batch_pre-3))+2+3)with((output_pre+(batch_pre-3))+5)by lia.
try replace((output_pre+(batch_pre-3))+4+0)with((output_pre+(batch_pre-3))+4)by lia.
try replace((output_pre+(batch_pre-3))+4+1)with((output_pre+(batch_pre-3))+5)by lia.
try replace((output_pre+(batch_pre-3))+4+2)with((output_pre+(batch_pre-3))+6)by lia.
try replace((output_pre+(batch_pre-3))+4+3)with((output_pre+(batch_pre-3))+7)by lia.
repeat rewrite Z.add_0_r in *.
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip (output_pre+(batch_pre-3)) (s8_tail_lane(Znth (batch_pre-3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-3))+1) (s8_tail_lane(Znth ((batch_pre-3)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
assert(Hcells: ((output_pre+(batch_pre-3))+0) # Char |-> (s8_tail_lane(Znth (batch_pre-3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-3))+1) # Char |-> (s8_tail_lane(Znth ((batch_pre-3)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-3))+2) # Char |-> (s8_tail_lane(Znth ((batch_pre-3)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) |-- CharArray.full (output_pre+(batch_pre-3)) 3 [(s8_tail_lane(Znth (batch_pre-3) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-3)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-3)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]).
{ rewrite s8_full3_cells. apply derivable1_refl. }
repeat rewrite Z.add_0_r in Hcells.
sep_apply_l_atomic Hcells.
assert(Hwindow: [(s8_tail_lane(Znth (batch_pre-3) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-3)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-3)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]=map(fun x=>s8_tail_lane x (s8_narrow RawLo)(s8_narrow RawHi))(s8_window (batch_pre-3) 3 A)).
{ symmetry. rewrite s8_neon_map_window_3 by lia. repeat rewrite Z.add_0_r. reflexivity. }
assert(Hmod:Z.rem batch_pre 64=Z.modulo batch_pre 64)by(apply Z.rem_mod_nonneg;lia).
assert(Hk:s8_bulk_count batch_pre<=(batch_pre-3))by(unfold s8_bulk_count;rewrite <-Hmod;lia).
pose proof(s8_neon_tail_finish output_pre (batch_pre-3) batch_pre (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)Hk ltac:(lia))as Hfinish.
replace(batch_pre-(batch_pre-3))with 3 in Hfinish by lia. rewrite <-Hwindow in Hfinish.
sep_apply_l_atomic Hfinish. root_memory_frame.
Qed.
Lemma proof_of_test_neon_return_wit_3 : S8Clamp.neon_unit_goal.test_neon_return_wit_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_return_wit_3;right;intros. assert(batch=5)by lia. subst batch. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. repeat rewrite Z.add_0_r in *. subst output.
try replace((output_pre+(batch_pre-5))+0+0)with((output_pre+(batch_pre-5))+0)by lia.
try replace((output_pre+(batch_pre-5))+0+1)with((output_pre+(batch_pre-5))+1)by lia.
try replace((output_pre+(batch_pre-5))+0+2)with((output_pre+(batch_pre-5))+2)by lia.
try replace((output_pre+(batch_pre-5))+0+3)with((output_pre+(batch_pre-5))+3)by lia.
try replace((output_pre+(batch_pre-5))+2+0)with((output_pre+(batch_pre-5))+2)by lia.
try replace((output_pre+(batch_pre-5))+2+1)with((output_pre+(batch_pre-5))+3)by lia.
try replace((output_pre+(batch_pre-5))+2+2)with((output_pre+(batch_pre-5))+4)by lia.
try replace((output_pre+(batch_pre-5))+2+3)with((output_pre+(batch_pre-5))+5)by lia.
try replace((output_pre+(batch_pre-5))+4+0)with((output_pre+(batch_pre-5))+4)by lia.
try replace((output_pre+(batch_pre-5))+4+1)with((output_pre+(batch_pre-5))+5)by lia.
try replace((output_pre+(batch_pre-5))+4+2)with((output_pre+(batch_pre-5))+6)by lia.
try replace((output_pre+(batch_pre-5))+4+3)with((output_pre+(batch_pre-5))+7)by lia.
repeat rewrite Z.add_0_r in *.
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip (output_pre+(batch_pre-5)) (s8_tail_lane(Znth (batch_pre-5) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-5))+1) (s8_tail_lane(Znth ((batch_pre-5)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-5))+2) (s8_tail_lane(Znth ((batch_pre-5)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-5))+3) (s8_tail_lane(Znth ((batch_pre-5)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
assert(Hcells: ((output_pre+(batch_pre-5))+0) # Char |-> (s8_tail_lane(Znth (batch_pre-5) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-5))+1) # Char |-> (s8_tail_lane(Znth ((batch_pre-5)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-5))+2) # Char |-> (s8_tail_lane(Znth ((batch_pre-5)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-5))+3) # Char |-> (s8_tail_lane(Znth ((batch_pre-5)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-5))+4) # Char |-> (s8_tail_lane(Znth ((batch_pre-5)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) |-- CharArray.full (output_pre+(batch_pre-5)) 5 [(s8_tail_lane(Znth (batch_pre-5) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-5)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-5)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-5)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-5)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]).
{ rewrite s8_full5_cells. apply derivable1_refl. }
repeat rewrite Z.add_0_r in Hcells.
sep_apply_l_atomic Hcells.
assert(Hwindow: [(s8_tail_lane(Znth (batch_pre-5) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-5)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-5)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-5)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-5)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]=map(fun x=>s8_tail_lane x (s8_narrow RawLo)(s8_narrow RawHi))(s8_window (batch_pre-5) 5 A)).
{ symmetry. rewrite s8_neon_map_window_5 by lia. repeat rewrite Z.add_0_r. reflexivity. }
assert(Hmod:Z.rem batch_pre 64=Z.modulo batch_pre 64)by(apply Z.rem_mod_nonneg;lia).
assert(Hk:s8_bulk_count batch_pre<=(batch_pre-5))by(unfold s8_bulk_count;rewrite <-Hmod;lia).
pose proof(s8_neon_tail_finish output_pre (batch_pre-5) batch_pre (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)Hk ltac:(lia))as Hfinish.
replace(batch_pre-(batch_pre-5))with 5 in Hfinish by lia. rewrite <-Hwindow in Hfinish.
sep_apply_l_atomic Hfinish. root_memory_frame.
Qed.
Lemma proof_of_test_neon_return_wit_4 : S8Clamp.neon_unit_goal.test_neon_return_wit_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_return_wit_4;right;intros. assert(batch=1)by lia. subst batch. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. repeat rewrite Z.add_0_r in *. subst output.
try replace((output_pre+(batch_pre-1))+0+0)with((output_pre+(batch_pre-1))+0)by lia.
try replace((output_pre+(batch_pre-1))+0+1)with((output_pre+(batch_pre-1))+1)by lia.
try replace((output_pre+(batch_pre-1))+0+2)with((output_pre+(batch_pre-1))+2)by lia.
try replace((output_pre+(batch_pre-1))+0+3)with((output_pre+(batch_pre-1))+3)by lia.
try replace((output_pre+(batch_pre-1))+2+0)with((output_pre+(batch_pre-1))+2)by lia.
try replace((output_pre+(batch_pre-1))+2+1)with((output_pre+(batch_pre-1))+3)by lia.
try replace((output_pre+(batch_pre-1))+2+2)with((output_pre+(batch_pre-1))+4)by lia.
try replace((output_pre+(batch_pre-1))+2+3)with((output_pre+(batch_pre-1))+5)by lia.
try replace((output_pre+(batch_pre-1))+4+0)with((output_pre+(batch_pre-1))+4)by lia.
try replace((output_pre+(batch_pre-1))+4+1)with((output_pre+(batch_pre-1))+5)by lia.
try replace((output_pre+(batch_pre-1))+4+2)with((output_pre+(batch_pre-1))+6)by lia.
try replace((output_pre+(batch_pre-1))+4+3)with((output_pre+(batch_pre-1))+7)by lia.
repeat rewrite Z.add_0_r in *.
assert(Hcells: ((output_pre+(batch_pre-1))+0) # Char |-> (s8_tail_lane(Znth (batch_pre-1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) |-- CharArray.full (output_pre+(batch_pre-1)) 1 [(s8_tail_lane(Znth (batch_pre-1) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]).
{ rewrite s8_full1_cells. apply derivable1_refl. }
repeat rewrite Z.add_0_r in Hcells.
sep_apply_l_atomic Hcells.
assert(Hwindow: [(s8_tail_lane(Znth (batch_pre-1) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]=map(fun x=>s8_tail_lane x (s8_narrow RawLo)(s8_narrow RawHi))(s8_window (batch_pre-1) 1 A)).
{ symmetry. rewrite s8_map_window_1 by lia. repeat rewrite Z.add_0_r. reflexivity. }
assert(Hmod:Z.rem batch_pre 64=Z.modulo batch_pre 64)by(apply Z.rem_mod_nonneg;lia).
assert(Hk:s8_bulk_count batch_pre<=(batch_pre-1))by(unfold s8_bulk_count;rewrite <-Hmod;lia).
pose proof(s8_neon_tail_finish output_pre (batch_pre-1) batch_pre (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)Hk ltac:(lia))as Hfinish.
replace(batch_pre-(batch_pre-1))with 1 in Hfinish by lia. rewrite <-Hwindow in Hfinish.
sep_apply_l_atomic Hfinish. root_memory_frame.
Qed.
Lemma proof_of_test_neon_return_wit_5 : S8Clamp.neon_unit_goal.test_neon_return_wit_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_return_wit_5;right;intros. assert(batch=6)by lia. subst batch. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. repeat rewrite Z.add_0_r in *. subst output.
try replace((output_pre+(batch_pre-6))+0+0)with((output_pre+(batch_pre-6))+0)by lia.
try replace((output_pre+(batch_pre-6))+0+1)with((output_pre+(batch_pre-6))+1)by lia.
try replace((output_pre+(batch_pre-6))+0+2)with((output_pre+(batch_pre-6))+2)by lia.
try replace((output_pre+(batch_pre-6))+0+3)with((output_pre+(batch_pre-6))+3)by lia.
try replace((output_pre+(batch_pre-6))+2+0)with((output_pre+(batch_pre-6))+2)by lia.
try replace((output_pre+(batch_pre-6))+2+1)with((output_pre+(batch_pre-6))+3)by lia.
try replace((output_pre+(batch_pre-6))+2+2)with((output_pre+(batch_pre-6))+4)by lia.
try replace((output_pre+(batch_pre-6))+2+3)with((output_pre+(batch_pre-6))+5)by lia.
try replace((output_pre+(batch_pre-6))+4+0)with((output_pre+(batch_pre-6))+4)by lia.
try replace((output_pre+(batch_pre-6))+4+1)with((output_pre+(batch_pre-6))+5)by lia.
try replace((output_pre+(batch_pre-6))+4+2)with((output_pre+(batch_pre-6))+6)by lia.
try replace((output_pre+(batch_pre-6))+4+3)with((output_pre+(batch_pre-6))+7)by lia.
repeat rewrite Z.add_0_r in *.
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip (output_pre+(batch_pre-6)) (s8_tail_lane(Znth (batch_pre-6) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-6))+1) (s8_tail_lane(Znth ((batch_pre-6)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-6))+2) (s8_tail_lane(Znth ((batch_pre-6)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-6))+3) (s8_tail_lane(Znth ((batch_pre-6)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-6))+4) (s8_tail_lane(Znth ((batch_pre-6)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-6))+5) (s8_tail_lane(Znth ((batch_pre-6)+5) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
assert(Hcells: ((output_pre+(batch_pre-6))+0) # Char |-> (s8_tail_lane(Znth (batch_pre-6) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-6))+1) # Char |-> (s8_tail_lane(Znth ((batch_pre-6)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-6))+2) # Char |-> (s8_tail_lane(Znth ((batch_pre-6)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-6))+3) # Char |-> (s8_tail_lane(Znth ((batch_pre-6)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-6))+4) # Char |-> (s8_tail_lane(Znth ((batch_pre-6)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-6))+5) # Char |-> (s8_tail_lane(Znth ((batch_pre-6)+5) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) |-- CharArray.full (output_pre+(batch_pre-6)) 6 [(s8_tail_lane(Znth (batch_pre-6) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+5) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]).
{ rewrite s8_full6_cells. apply derivable1_refl. }
repeat rewrite Z.add_0_r in Hcells.
sep_apply_l_atomic Hcells.
assert(Hwindow: [(s8_tail_lane(Znth (batch_pre-6) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+4) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-6)+5) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]=map(fun x=>s8_tail_lane x (s8_narrow RawLo)(s8_narrow RawHi))(s8_window (batch_pre-6) 6 A)).
{ symmetry. rewrite s8_neon_map_window_6 by lia. repeat rewrite Z.add_0_r. reflexivity. }
assert(Hmod:Z.rem batch_pre 64=Z.modulo batch_pre 64)by(apply Z.rem_mod_nonneg;lia).
assert(Hk:s8_bulk_count batch_pre<=(batch_pre-6))by(unfold s8_bulk_count;rewrite <-Hmod;lia).
pose proof(s8_neon_tail_finish output_pre (batch_pre-6) batch_pre (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)Hk ltac:(lia))as Hfinish.
replace(batch_pre-(batch_pre-6))with 6 in Hfinish by lia. rewrite <-Hwindow in Hfinish.
sep_apply_l_atomic Hfinish. root_memory_frame.
Qed.
Lemma proof_of_test_neon_return_wit_6 : S8Clamp.neon_unit_goal.test_neon_return_wit_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_return_wit_6;right;intros. assert(batch=2)by lia. subst batch. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. repeat rewrite Z.add_0_r in *. subst output.
try replace((output_pre+(batch_pre-2))+0+0)with((output_pre+(batch_pre-2))+0)by lia.
try replace((output_pre+(batch_pre-2))+0+1)with((output_pre+(batch_pre-2))+1)by lia.
try replace((output_pre+(batch_pre-2))+0+2)with((output_pre+(batch_pre-2))+2)by lia.
try replace((output_pre+(batch_pre-2))+0+3)with((output_pre+(batch_pre-2))+3)by lia.
try replace((output_pre+(batch_pre-2))+2+0)with((output_pre+(batch_pre-2))+2)by lia.
try replace((output_pre+(batch_pre-2))+2+1)with((output_pre+(batch_pre-2))+3)by lia.
try replace((output_pre+(batch_pre-2))+2+2)with((output_pre+(batch_pre-2))+4)by lia.
try replace((output_pre+(batch_pre-2))+2+3)with((output_pre+(batch_pre-2))+5)by lia.
try replace((output_pre+(batch_pre-2))+4+0)with((output_pre+(batch_pre-2))+4)by lia.
try replace((output_pre+(batch_pre-2))+4+1)with((output_pre+(batch_pre-2))+5)by lia.
try replace((output_pre+(batch_pre-2))+4+2)with((output_pre+(batch_pre-2))+6)by lia.
try replace((output_pre+(batch_pre-2))+4+3)with((output_pre+(batch_pre-2))+7)by lia.
repeat rewrite Z.add_0_r in *.
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip (output_pre+(batch_pre-2)) (s8_tail_lane(Znth (batch_pre-2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-2))+1) (s8_tail_lane(Znth ((batch_pre-2)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
assert(Hcells: ((output_pre+(batch_pre-2))+0) # Char |-> (s8_tail_lane(Znth (batch_pre-2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-2))+1) # Char |-> (s8_tail_lane(Znth ((batch_pre-2)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) |-- CharArray.full (output_pre+(batch_pre-2)) 2 [(s8_tail_lane(Znth (batch_pre-2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-2)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]).
{ rewrite s8_full2_cells. apply derivable1_refl. }
repeat rewrite Z.add_0_r in Hcells.
sep_apply_l_atomic Hcells.
assert(Hwindow: [(s8_tail_lane(Znth (batch_pre-2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-2)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]=map(fun x=>s8_tail_lane x (s8_narrow RawLo)(s8_narrow RawHi))(s8_window (batch_pre-2) 2 A)).
{ symmetry. rewrite s8_map_window_2 by lia. repeat rewrite Z.add_0_r. reflexivity. }
assert(Hmod:Z.rem batch_pre 64=Z.modulo batch_pre 64)by(apply Z.rem_mod_nonneg;lia).
assert(Hk:s8_bulk_count batch_pre<=(batch_pre-2))by(unfold s8_bulk_count;rewrite <-Hmod;lia).
pose proof(s8_neon_tail_finish output_pre (batch_pre-2) batch_pre (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)Hk ltac:(lia))as Hfinish.
replace(batch_pre-(batch_pre-2))with 2 in Hfinish by lia. rewrite <-Hwindow in Hfinish.
sep_apply_l_atomic Hfinish. root_memory_frame.
Qed.
Lemma proof_of_test_neon_return_wit_7 : S8Clamp.neon_unit_goal.test_neon_return_wit_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_return_wit_7;right;intros. assert(batch=4)by lia. subst batch. rewrite sizeof_char,sizeof_uchar in *. repeat rewrite Z.mul_1_r in *. repeat rewrite Z.add_0_r in *. subst output.
try replace((output_pre+(batch_pre-4))+0+0)with((output_pre+(batch_pre-4))+0)by lia.
try replace((output_pre+(batch_pre-4))+0+1)with((output_pre+(batch_pre-4))+1)by lia.
try replace((output_pre+(batch_pre-4))+0+2)with((output_pre+(batch_pre-4))+2)by lia.
try replace((output_pre+(batch_pre-4))+0+3)with((output_pre+(batch_pre-4))+3)by lia.
try replace((output_pre+(batch_pre-4))+2+0)with((output_pre+(batch_pre-4))+2)by lia.
try replace((output_pre+(batch_pre-4))+2+1)with((output_pre+(batch_pre-4))+3)by lia.
try replace((output_pre+(batch_pre-4))+2+2)with((output_pre+(batch_pre-4))+4)by lia.
try replace((output_pre+(batch_pre-4))+2+3)with((output_pre+(batch_pre-4))+5)by lia.
try replace((output_pre+(batch_pre-4))+4+0)with((output_pre+(batch_pre-4))+4)by lia.
try replace((output_pre+(batch_pre-4))+4+1)with((output_pre+(batch_pre-4))+5)by lia.
try replace((output_pre+(batch_pre-4))+4+2)with((output_pre+(batch_pre-4))+6)by lia.
try replace((output_pre+(batch_pre-4))+4+3)with((output_pre+(batch_pre-4))+7)by lia.
repeat rewrite Z.add_0_r in *.
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip (output_pre+(batch_pre-4)) (s8_tail_lane(Znth (batch_pre-4) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-4))+1) (s8_tail_lane(Znth ((batch_pre-4)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-4))+2) (s8_tail_lane(Znth ((batch_pre-4)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
sep_apply_l_atomic(ByteBridge.byte_cell_signed_roundtrip ((output_pre+(batch_pre-4))+3) (s8_tail_lane(Znth ((batch_pre-4)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ltac:(lia)).
assert(Hcells: ((output_pre+(batch_pre-4))+0) # Char |-> (s8_tail_lane(Znth (batch_pre-4) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-4))+1) # Char |-> (s8_tail_lane(Znth ((batch_pre-4)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-4))+2) # Char |-> (s8_tail_lane(Znth ((batch_pre-4)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) ** ((output_pre+(batch_pre-4))+3) # Char |-> (s8_tail_lane(Znth ((batch_pre-4)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi)) |-- CharArray.full (output_pre+(batch_pre-4)) 4 [(s8_tail_lane(Znth (batch_pre-4) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-4)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-4)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-4)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]).
{ rewrite s8_full4_cells. apply derivable1_refl. }
repeat rewrite Z.add_0_r in Hcells.
sep_apply_l_atomic Hcells.
assert(Hwindow: [(s8_tail_lane(Znth (batch_pre-4) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-4)+1) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-4)+2) A 0)(s8_narrow RawLo)(s8_narrow RawHi));(s8_tail_lane(Znth ((batch_pre-4)+3) A 0)(s8_narrow RawLo)(s8_narrow RawHi))]=map(fun x=>s8_tail_lane x (s8_narrow RawLo)(s8_narrow RawHi))(s8_window (batch_pre-4) 4 A)).
{ symmetry. rewrite s8_map_window_4 by lia. repeat rewrite Z.add_0_r. reflexivity. }
assert(Hmod:Z.rem batch_pre 64=Z.modulo batch_pre 64)by(apply Z.rem_mod_nonneg;lia).
assert(Hk:s8_bulk_count batch_pre<=(batch_pre-4))by(unfold s8_bulk_count;rewrite <-Hmod;lia).
pose proof(s8_neon_tail_finish output_pre (batch_pre-4) batch_pre (s8_narrow RawLo)(s8_narrow RawHi) A ltac:(lia)Hk ltac:(lia))as Hfinish.
replace(batch_pre-(batch_pre-4))with 4 in Hfinish by lia. rewrite <-Hwindow in Hfinish.
sep_apply_l_atomic Hfinish. root_memory_frame.
Qed.
Lemma proof_of_test_neon_return_wit_8 : S8Clamp.neon_unit_goal.test_neon_return_wit_8.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_return_wit_8. right;intros. assert(batch=0)by lia. subst batch. replace(batch_pre-0)with batch_pre by lia. replace(batch_pre-s8_bulk_count batch_pre)with(Z.modulo batch_pre 64)by(unfold s8_bulk_count;lia). rewrite s8_tail_prefix_full. rewrite CharArray.undef_full_empty,sepcon_emp_equiv. apply derivable1_refl. Qed.
End CheckedNeonKernelMemory.
