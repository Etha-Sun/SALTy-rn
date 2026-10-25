From Coq Require Import ZArith Lia.
From X32Transpose Require Export NeonProgramModel RvvMemoryCursorFactsDirect.
Local Open Scope Z_scope.
Lemma xt_neon_initial_input_row:forall F W G,
 xt_valid F W G->0<xt_height G->
 unsigned_last_nbits(unsigned_last_nbits(xt_input G)64+xt_input_stride G)64=
 xt_current_input G 0 1.
Proof.
 intros F W G Hv Hh.
 pose proof(xt_input_cursor_next_row F W G 0 0 Hv Hh)as H.
 cbn[xt_current_input]in H;exact H.
Qed.
Lemma xt_neon_initial_output_next:forall F W G w,
 xt_valid F W G->0<xt_height G->
 xt_neon_next G 0 w
  (unsigned_last_nbits(unsigned_last_nbits(xt_output_base G)64+xt_output_stride G)64).
Proof.
 intros F W G w Hv Hh;unfold xt_neon_next;right.
 pose proof(xt_output_cursor_next_columns F W G 0 1 Hv Hh)as H.
 cbn[xt_current_output]in H.
 rewrite Z.mul_1_l in H.
 unfold unsigned_last_nbits in H|-*;change(2^64)with 18446744073709551616 in *.
 rewrite Z.add_mod_idemp_r in H by lia;exact H.
Qed.
Lemma xt_neon_input_reset_nested:forall G,
 unsigned_last_nbits(8-unsigned_last_nbits(xt_round_down(xt_height G)2*xt_input_stride G)64)64=
 xt_neon_input_reset G.
Proof.
 intros;unfold xt_neon_input_reset,unsigned_last_nbits,xt_mod64.
 change(2^64)with 18446744073709551616.
 rewrite Zminus_mod_idemp_r by lia;reflexivity.
Qed.
Lemma xt_neon_output_reset_nested:forall G,
 unsigned_last_nbits(unsigned_last_nbits(2*xt_output_stride G)64-
  unsigned_last_nbits(xt_round_down(xt_height G)2*4)64)64=
 xt_neon_output_reset G.
Proof.
 intros;unfold xt_neon_output_reset,unsigned_last_nbits,xt_mod64.
 change(2^64)with 18446744073709551616.
 rewrite Zminus_mod_idemp_l,Zminus_mod_idemp_r by lia;reflexivity.
Qed.
Print Assumptions xt_neon_initial_input_row.
Print Assumptions xt_neon_initial_output_next.
Print Assumptions xt_neon_input_reset_nested.
Print Assumptions xt_neon_output_reset_nested.
