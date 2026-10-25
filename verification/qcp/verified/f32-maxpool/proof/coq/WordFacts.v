From Coq Require Import ZArith Lia Ring.
From MaxPool Require Import KernelState.
Local Open Scope Z_scope.
Lemma mp_u64_identity:forall x,mp_word64 x->mp_u64 x=x.
Proof. intros x H;unfold mp_u64;apply unsigned_last_nbits_eq;unfold mp_word64 in H;change(0<=x<18446744073709551616);lia. Qed.
Lemma mp_u64_bounded:forall x,mp_word64(mp_u64 x).
Proof. intro x;unfold mp_word64,mp_u64;pose proof(unsigned_Lastnbits_range x 64 ltac:(lia));change(0<=unsigned_last_nbits x 64<18446744073709551616)in H;lia. Qed.
Lemma mp_table_at_zero:forall table inc,mp_word64 table->mp_table_at table inc 0=table.
Proof. intros;unfold mp_table_at;rewrite Z.mul_0_r,Z.add_0_r;apply mp_u64_identity;assumption. Qed.
Lemma mp_offset_at_zero:forall offset stride,mp_word64 offset->mp_offset_at offset stride 0=offset.
Proof. intros;unfold mp_offset_at;rewrite Z.mul_0_r,Z.add_0_r;apply mp_u64_identity;assumption. Qed.
Lemma mp_output_at_zero:forall output inc,mp_word64 output->mp_output_at output inc 0=output.
Proof. intros;unfold mp_output_at;rewrite Z.mul_0_r,Z.add_0_r;apply mp_u64_identity;assumption. Qed.
Lemma mp_u64_add_left:forall x y,mp_u64(mp_u64 x+y)=mp_u64(x+y).
Proof. intros;unfold mp_u64;apply unsigned_unsigned_add_l;lia. Qed.
Lemma mp_table_at_step:forall table inc pixel,
 mp_u64(mp_table_at table inc pixel+inc)=mp_table_at table inc(pixel+1).
Proof. intros;unfold mp_table_at;rewrite mp_u64_add_left;f_equal;ring. Qed.
Lemma mp_offset_at_step:forall offset stride pixel,
 mp_u64(mp_offset_at offset stride pixel+stride)=mp_offset_at offset stride(pixel+1).
Proof. intros;unfold mp_offset_at;rewrite mp_u64_add_left;f_equal;ring. Qed.
Lemma mp_output_at_step:forall output inc pixel,
 mp_u64(mp_output_at output inc pixel+inc)=mp_output_at output inc(pixel+1).
Proof. intros;unfold mp_output_at;rewrite mp_u64_add_left;f_equal;ring. Qed.
