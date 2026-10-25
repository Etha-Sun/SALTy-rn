From MaxPool Require Export NeonMemoryPointerFacts.
Local Open Scope Z_scope.
Lemma mpm_row_add_offset:forall PT table offset K group row,
 unsigned_last_nbits(unsigned_last_nbits(mp_row_pointer PT table K group row)64+offset)64=
 mp_row_cursor PT table offset K group row 0.
Proof.
 intros;unfold mp_row_pointer,mp_row_cursor,mp_row_base,mp_u64.
 rewrite unsigned_unsigned_add_l by lia;rewrite Z.mul_0_r,Z.add_0_r;reflexivity.
Qed.
Print Assumptions mpm_row_add_offset.
