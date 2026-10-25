From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelOuterFacts.
Local Open Scope Z_scope.
Lemma dw_output_row_base_bounds:forall output H N y,
 dw_footprint output(H*N)->0<N->0<=y<H->
 0<=output+4*y*N<18446744073709551616.
Proof.
 intros output H N y[Hp[Hc Hl]]HN Hy;unfold dw_u64_limit in Hl.
 nia.
Qed.
Lemma dw_mod_sub_add_flat:forall a b c m,
 (a mod m-b+c)mod m=(a-b+c)mod m.
Proof. intros;replace(a mod m-b+c)with(a mod m+(c-b))by ring;
 rewrite Zplus_mod_idemp_l;f_equal;ring. Qed.
Lemma dw_mod_add_pair_flat:forall a b c m,
 (a mod m+b+c)mod m=(a+b+c)mod m.
Proof. intros;replace(a mod m+b+c)with(a mod m+(b+c))by ring;
 rewrite Zplus_mod_idemp_l;f_equal;ring. Qed.
Lemma dw_neon_outer_pointers_after_tail_final:forall F input zero weights params output H N rem x n,
 dw_inputs F input zero weights params H N->dw_footprint output(H*N)->
 0<rem<=H->0<=x->1<=n<=4->N=x+n->
 let y:=H-rem in
 let i3:=dw_row_base input zero H N(y+2)+4*(x+4)in
 let i4:=dw_row_base input zero H N(y+3)+4*(x+4)in
 let dec:=4*(x+4)in
 let p0:=unsigned_last_nbits(unsigned_last_nbits i3 64-dec)64 in
 let p1:=unsigned_last_nbits(unsigned_last_nbits i4 64-dec)64 in
 let p2:=unsigned_last_nbits(unsigned_last_nbits p1 64+4*N)64 in
 let p3:=unsigned_last_nbits(unsigned_last_nbits p2 64+4*N)64 in
 let p4:=unsigned_last_nbits(unsigned_last_nbits p3 64+4*N)64 in
 let q0:=output+4*(dw_store_row H y 2*N+x)+4*n in
 let q1:=unsigned_last_nbits(unsigned_last_nbits q0 64+4*N)64 in
 let q2:=unsigned_last_nbits(unsigned_last_nbits q1 64+4*N)64 in
 dw_outer_pointers input zero output H N(dw_doz_model rem 3)p0 p1 p2 p3 p4 q0 q1 q2.
Proof.
 intros F input zero weights params output H N rem x n HI HO Hrem Hx Hn HN.
 cbv zeta.
 destruct(Z_le_dec rem 3)as[Hsmall|Hlarge].
 - unfold dw_outer_pointers,dw_doz_model;left;rewrite Z.max_r by lia;reflexivity.
 - unfold dw_doz_model;rewrite Z.max_l by lia.
   unfold dw_outer_pointers;right.
   pose proof(dw_input_geometry F input zero weights params H N HI)as[HH[HNpos[HFI HFZ]]].
   repeat match goal with|-_/\_=>split end.
   all:intros.
   all:unfold unsigned_last_nbits.
   all:repeat first[rewrite Zplus_mod_idemp_l|rewrite Zminus_mod_idemp_l|rewrite Z.mod_mod by lia|rewrite dw_mod_sub_add_flat|rewrite dw_mod_add_pair_flat].
   all:change(2^64)with 18446744073709551616.
   all:try solve[unfold dw_store_row;rewrite Z.min_l by lia;rewrite HN;ring].
   all:match goal with|- (?p mod 18446744073709551616) = ?q =>
    let HE:=fresh "HpointerEq"in assert(HE:p=q)by(
     unfold dw_store_row;rewrite ?Z.min_l by lia;
     repeat match goal with|-context[dw_row_base ?a ?b ?h ?nn ?row]=>rewrite(dw_row_base_inside a b h nn row ltac:(lia))end;
     rewrite HN;ring);
    rewrite HE;apply Z.mod_small
   end.
   all:first[
    match goal with|-0<=dw_row_base ?a ?b ?h ?nn ?row<18446744073709551616=>
     pose proof(dw_row_address_bounds F input zero weights params H N row 0 HI ltac:(lia))as HB;
     rewrite ?Z.mul_0_r,?Z.add_0_r in HB;unfold dw_u64_limit in HB;lia end
    |match goal with|- 0 <= ?base + 4 * ?row * ?nn < 18446744073709551616 =>
      apply(dw_output_row_base_bounds base H nn row HO HNpos);lia end].

Qed.
Print Assumptions dw_output_row_base_bounds.
Print Assumptions dw_mod_sub_add_flat.
Print Assumptions dw_mod_add_pair_flat.
Print Assumptions dw_neon_outer_pointers_after_tail_final.
