From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelOuterFacts RvvKernelMemoryWrapFacts.
Local Open Scope Z_scope.
Lemma dw_u64_sub_normalize:forall p d,
 unsigned_last_nbits(unsigned_last_nbits p 64-d)64=unsigned_last_nbits(p-d)64.
Proof. intros;unfold unsigned_last_nbits;apply Zminus_mod_idemp_l. Qed.
Lemma dw_u64_sub_cancel:forall b d,0<=b<18446744073709551616->
 unsigned_last_nbits(unsigned_last_nbits(b+d)64-d)64=b.
Proof. intros;rewrite dw_u64_sub_normalize;replace(b+d-d)with b by ring;
 apply unsigned_last_nbits_eq;change(0<=b<18446744073709551616);assumption. Qed.
Lemma dw_neon_outer_pointers_after_tail_direct:forall F input zero weights params output H N rem x n,
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
   unfold dw_inputs,dw_footprint,dw_u64_limit in HI,HO.
   repeat match type of HI with _/\_=>destruct HI as[? HI]end.
   destruct HO as[?[? ?]].
   unfold dw_store_row;rewrite Z.min_l by lia.
   repeat match goal with |-context[dw_row_base ?a ?b ?h ?nn ?y]=>rewrite(dw_row_base_inside a b h nn y ltac:(lia))end.
   rewrite !dw_u64_sub_cancel by nia.
   repeat split;intros.
   all:try solve[ring].
   all:repeat rewrite dw_u64_add_no_wrap by nia.
   all:nia.
Qed.
Print Assumptions dw_u64_sub_normalize.
Print Assumptions dw_u64_sub_cancel.
Print Assumptions dw_neon_outer_pointers_after_tail_direct.
