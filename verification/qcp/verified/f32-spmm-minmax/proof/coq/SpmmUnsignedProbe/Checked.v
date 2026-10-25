From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From SpmmSpec Require Import Address.
From SpmmUnsignedProbe Require Import probe_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: VC_Correct.
Lemma proof_of_decrement_safety_wit_1 : decrement_safety_wit_1.
Proof. unfold decrement_safety_wit_1;intros;entailer!;unfold INT_MAX,INT_MIN;lia. Qed.
Lemma proof_of_decrement_return_wit_1 : decrement_return_wit_1.
Proof.
 unfold decrement_return_wit_1;left;intros count stride;entailer!.
 change (word64 (word64(stride*count)-16)=word64(stride*count-16)).
 apply word64_sub_left.
Qed.
Lemma proof_of_restore_safety_wit_1 : restore_safety_wit_1.
Proof. unfold restore_safety_wit_1;intros;entailer!;unfold INT_MAX,INT_MIN;lia. Qed.
Lemma proof_of_restore_return_wit_1 : restore_return_wit_1.
Proof.
 unfold restore_return_wit_1;left;intros count stride base;entailer!.
 change (word64(word64(base+word64(stride*count))-word64(word64(stride*count)-16))=word64(base+16)).
 apply output_strip_restore.
Qed.
End Checked.
Print Assumptions Checked.proof_of_decrement_safety_wit_1.
Print Assumptions Checked.proof_of_decrement_return_wit_1.
Print Assumptions Checked.proof_of_restore_safety_wit_1.
Print Assumptions Checked.proof_of_restore_return_wit_1.
