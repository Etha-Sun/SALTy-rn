From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Packed32Model.
From PackedCodecVC Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: PackedCodecVC.unit_goal.VC_Correct.
Lemma proof_of_qcp_pack4_return_wit_1 : qcp_pack4_return_wit_1.
Proof. unfold qcp_pack4_return_wit_1;left;pre_process;unfold pack4;entailer!;unfold UINT_MAX;lia. Qed.
Lemma proof_of_qcp_word_byte_safety_wit_1 : qcp_word_byte_safety_wit_1.
Proof. unfold qcp_word_byte_safety_wit_1;pre_process;entailer!;lia. Qed.
Lemma proof_of_qcp_word_byte_return_wit_1 : qcp_word_byte_return_wit_1.
Proof.
 unfold qcp_word_byte_return_wit_1;left;pre_process.
 assert(Hbit:unsigned_last_nbits(Z.shiftr w_pre(8*lane_pre))8=word_byte w_pre lane_pre).
 { unfold unsigned_last_nbits,word_byte;rewrite Z.shiftr_div_pow2 by lia;reflexivity. }
 pose proof(Z.mod_pos_bound(Z.shiftr w_pre(8*lane_pre))256 ltac:(lia))as Hb.
 unfold unsigned_last_nbits in *;change(2^8)with 256 in *;entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_pack4_return_wit_1.
Print Assumptions Checked.proof_of_qcp_word_byte_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_word_byte_return_wit_1.
