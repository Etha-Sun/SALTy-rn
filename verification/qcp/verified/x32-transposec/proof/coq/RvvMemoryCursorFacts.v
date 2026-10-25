From Coq Require Import ZArith Bool Lia.
From X32Transpose Require Export AddressFacts.
Local Open Scope Z_scope.

Lemma xt_input_base_bound:forall F W G,
 xt_valid F W G->0<xt_height G->0<=xt_input G<18446744073709551616.
Proof.
 intros F W G Hv Hh;pose proof(xt_cols_positive G).
 pose proof(xt_input_address_bounds F W G 0 0 Hv ltac:(lia)ltac:(lia)).
 unfold xt_input_address in *;lia.
Qed.
Lemma xt_output_base_bound:forall F W G,
 xt_valid F W G->0<xt_height G->0<=xt_output_base G<18446744073709551616.
Proof.
 intros F W G Hv Hh;pose proof(xt_cols_positive G).
 pose proof(xt_output_address_bounds F W G 0 0 Hv ltac:(lia)ltac:(lia)).
 unfold xt_output_address in *;lia.
Qed.
Lemma xt_input_cursor_mod:forall G k r,
 0<=xt_input G<18446744073709551616->
 xt_current_input G k r=xt_mod64(xt_input G+4*k+r*xt_input_stride G).
Proof.
 intros G k r Hb;unfold xt_current_input.
 destruct(andb(Z.eqb k 0)(Z.eqb r 0))eqn:He;[|reflexivity].
 apply andb_true_iff in He;destruct He as[Hk Hr];apply Z.eqb_eq in Hk,Hr;subst.
 rewrite Z.mul_0_r,Z.mul_0_l,!Z.add_0_r;unfold xt_mod64;symmetry;apply Z.mod_small;exact Hb.
Qed.
Lemma xt_output_cursor_mod:forall G k r,
 0<=xt_output_base G<18446744073709551616->
 xt_current_output G k r=xt_mod64(xt_output_base G+k*xt_output_stride G+4*r).
Proof.
 intros G k r Hb;unfold xt_current_output.
 destruct(andb(Z.eqb k 0)(Z.eqb r 0))eqn:He;[|reflexivity].
 apply andb_true_iff in He;destruct He as[Hk Hr];apply Z.eqb_eq in Hk,Hr;subst.
 rewrite Z.mul_0_l,Z.mul_0_r,!Z.add_0_r;unfold xt_mod64;symmetry;apply Z.mod_small;exact Hb.
Qed.
Lemma xt_input_cursor_next_row:forall F W G k r,
 xt_valid F W G->0<xt_height G->
 unsigned_last_nbits(unsigned_last_nbits(xt_current_input G k r)64+xt_input_stride G)64=
 xt_current_input G k(r+1).
Proof.
 intros F W G k r Hv Hh;pose proof(xt_input_base_bound F W G Hv Hh)as Hb.
 rewrite !xt_input_cursor_mod by exact Hb.
 unfold unsigned_last_nbits,xt_mod64;change(2^64)with 18446744073709551616.
 rewrite Z.mod_mod by lia;rewrite Z.add_mod_idemp_l by lia.
 f_equal;ring.
Qed.
Lemma xt_output_cursor_end_bound:forall F W G k r,
 xt_valid F W G->0<xt_height G->0<=k<xt_cols G->0<=r<=xt_height G->
 0<xt_output_base G+k*xt_output_stride G+4*r<18446744073709551616.
Proof.
 intros F W G k r[He[HF HS]]Hh Hk Hr;specialize(HS Hh).
 destruct He as[Hw[Hheight[Hsi[Hso Rest]]]].
 destruct HS as[Hp[Ho[Ha[Hb[Hc[Hd[Hin[Hout Rest2]]]]]]]].
 assert(k*xt_output_stride G<=(xt_cols G-1)*xt_output_stride G)by nia;nia.
Qed.
Lemma xt_output_cursor_next_row:forall F W G k r,
 xt_valid F W G->0<xt_height G->0<=k<xt_cols G->0<=r<xt_height G->
 xt_current_output G k r+4=xt_current_output G k(r+1).
Proof.
 intros F W G k r Hv Hh Hk Hr;pose proof(xt_output_base_bound F W G Hv Hh)as Hb.
 rewrite !xt_output_cursor_mod by exact Hb;unfold xt_mod64.
 rewrite !Z.mod_small by(pose proof(xt_output_cursor_end_bound F W G k r Hv Hh Hk ltac:(lia));
  pose proof(xt_output_cursor_end_bound F W G k(r+1)Hv Hh Hk ltac:(lia));lia).
 ring.
Qed.
Lemma xt_input_cursor_next_columns:forall F W G k vl,
 xt_valid F W G->0<xt_height G->0<=k->0<=vl->k+vl<=xt_cols G->
 xt_current_input G k 0+4*vl=xt_current_input G(k+vl)0.
Proof.
 intros F W G k vl Hv Hh Hk Hvl Hend.
 rewrite(xt_current_input_exact F W G k 0 Hv ltac:(lia)ltac:(lia)).
 rewrite(xt_current_input_exact F W G(k+vl)0 Hv ltac:(lia)ltac:(lia)).
 unfold xt_input_address;ring.
Qed.
Lemma xt_output_cursor_next_columns:forall F W G k vl,
 xt_valid F W G->0<xt_height G->
 unsigned_last_nbits(unsigned_last_nbits(xt_current_output G k 0)64+
   unsigned_last_nbits(vl*xt_output_stride G)64)64=
 xt_current_output G(k+vl)0.
Proof.
 intros F W G k vl Hv Hh;pose proof(xt_output_base_bound F W G Hv Hh)as Hb.
 rewrite !xt_output_cursor_mod by exact Hb.
 unfold unsigned_last_nbits,xt_mod64;change(2^64)with 18446744073709551616.
 rewrite Z.mod_mod by lia;rewrite Z.add_mod_idemp_l,Z.add_mod_idemp_r by lia.
 f_equal;ring.
Qed.
Print Assumptions xt_input_base_bound.
Print Assumptions xt_output_base_bound.
Print Assumptions xt_input_cursor_mod.
Print Assumptions xt_output_cursor_mod.
Print Assumptions xt_input_cursor_next_row.
Print Assumptions xt_output_cursor_end_bound.
Print Assumptions xt_output_cursor_next_row.
Print Assumptions xt_input_cursor_next_columns.
Print Assumptions xt_output_cursor_next_columns.
