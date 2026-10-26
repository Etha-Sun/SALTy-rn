From Coq Require Import ZArith List Lia Ring.
From HwcConv Require Export HwcTileWriteValuesFacts RvvKernelModel.
Import ListNotations. Local Open Scope Z_scope.
Lemma hm401_write_values_app : forall xs ys O p,
 hc_write_values O p(xs++ys)=
 hc_write_values(hc_write_values O p xs)(p+4*Z.of_nat(length xs))ys.
Proof.
 induction xs as[|v xs IH];intros ys O p.
 - cbn[hc_write_values];now rewrite Z.add_0_r.
 - cbn[hc_write_values app]. rewrite IH.
   assert(Hlen:Z.of_nat(length(v::xs))=1+Z.of_nat(length xs)).
   { change(Z.of_nat(S(length xs))=1+Z.of_nat(length xs));rewrite Nat2Z.inj_succ;lia. }
   rewrite Hlen;f_equal;ring.
Qed.
Lemma hm401_count_write_values : forall k O p A,
 hc_store_rvv_count O p A k=
 hc_write_values O p(map(fun j=>hc_vget A(Z.of_nat j))(seq 0 k)).
Proof.
 induction k as[|k IH];intros O p A.
 - reflexivity.
 - rewrite seq_S,map_app,hm401_write_values_app,map_length,seq_length.
   cbn[hc_store_rvv_count map hc_write_values].
   rewrite IH. replace(0+k)%nat with k by lia;reflexivity.
Qed.
Lemma hm401_store_rvv_tile_values : forall Raw O p A c y x n dy lane,
 0<=n->(forall i,0<=i<n->hc_vget A i=Raw c lane(y+dy)(x+i))->
 hc_store_rvv O p A n=hc_write_values O p(hc_tile_values Raw c y x n dy lane).
Proof.
 intros Raw O p A c y x n dy lane HN HA.
 unfold hc_store_rvv,hc_tile_values;rewrite hm401_count_write_values.
 f_equal;apply map_ext_in;intros k Hk;apply in_seq in Hk;destruct Hk as[Hk0 Hk].
 apply HA;split;[lia|].
 apply Nat2Z.inj_lt in Hk as Hk'.
 change(Z.of_nat k<Z.of_nat(Z.to_nat n))in Hk'.
 rewrite Z2Nat.id in Hk' by lia;lia.
Qed.
Print Assumptions hm401_write_values_app.
Print Assumptions hm401_count_write_values.
Print Assumptions hm401_store_rvv_tile_values.
