From Coq Require Import ZArith List Bool Lia.
From HwcConv Require Export HwcTileWriteValuesFacts.
Local Open Scope Z_scope.

Lemma hc_tile_mod_affine:forall a b r,b<>0->(a*b+r)mod b=r mod b.
Proof. intros;replace(a*b+r)with(r+a*b)by ring;apply Z.mod_add;assumption. Qed.

Lemma hc_tile_decode_bounds : forall output hs cs channels start finish ow p q,
 0<hs -> 0<cs -> 0<ow ->
 hc_decode output hs cs channels start finish ow p=Some q ->
 0<=q.(hc_coord_c)<channels /\ start<=q.(hc_coord_y)<finish /\
 0<=q.(hc_coord_x)<ow /\
 p=hc_output_address output hs cs q.(hc_coord_c)q.(hc_coord_y)q.(hc_coord_x).
Proof.
 intros output hs cs channels start finish ow p q Hhs Hcs How HD.
 unfold hc_decode in HD.
 lazymatch type of HD with context[if ?b then _ else _]=>destruct b eqn:HB end;[|discriminate].
 inversion HD;subst q;clear HD.
 repeat match goal with H:andb _ _=true|-_=>apply Bool.andb_true_iff in H;destruct H end.
 repeat match goal with
 |H:Z.leb _ _=true|-_=>apply Z.leb_le in H
 |H:Z.ltb _ _=true|-_=>apply Z.ltb_lt in H
 |H:Z.eqb _ _=true|-_=>apply Z.eqb_eq in H
 end.
 cbn[hc_coord_c hc_coord_y hc_coord_x].
 split;[tauto|]. split;[tauto|]. split.
 - split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia].
 - unfold hc_output_address.
   pose proof(Z.div_mod(p-output)cs ltac:(lia)).
   pose proof(Z.div_mod((p-output)mod cs)hs ltac:(lia)).
   pose proof(Z.div_mod(((p-output)mod cs)mod hs)4 ltac:(lia)).
   nia.
Qed.

Lemma hc_tile_decode_address : forall output hs cs channels start finish ow c y x,
 0<=start /\ start<=y<finish -> 0<=c<channels -> 0<=x<ow ->
 0<ow -> 4*ow<=hs -> finish*hs<=cs ->
 hc_decode output hs cs channels start finish ow
 (hc_output_address output hs cs c y x)=Some(hc_coordinate c y x).
Proof.
 intros output hs cs channels start finish ow c y x HY HC HX HOW HHS HCS.
 assert(Hhs:0<hs)by lia;assert(Hcs:0<cs)by nia.
 assert(Hx:0<=4*x<hs)by nia.
 assert(Hrow:0<=y*hs+4*x<cs)by nia.
 unfold hc_decode,hc_output_address.
 replace(output+c*cs+y*hs+4*x-output)with(c*cs+(y*hs+4*x))by ring.
 rewrite Z.div_add_l by lia;rewrite Z.div_small by exact Hrow.
 rewrite hc_tile_mod_affine by lia;rewrite Z.mod_small by exact Hrow.
 rewrite Z.div_add_l by lia;rewrite Z.div_small by exact Hx.
 rewrite hc_tile_mod_affine by lia;rewrite Z.mod_small by exact Hx.
 replace(4*x)with(x*4)by ring;rewrite Z.mod_mul by lia;rewrite Z.div_mul by lia.
 replace(c+0)with c by lia;replace(y+0)with y by lia.
 assert(Hd:0<=c*cs+(y*hs+x*4))by nia.
 assert(Hdb:(0<=?c*cs+(y*hs+x*4))=true)by(apply Z.leb_le;exact Hd).
 assert(Hcb:(0<=?c)=true)by(apply Z.leb_le;lia).
 assert(Hcu:(c<?channels)=true)by(apply Z.ltb_lt;lia).
 assert(Hyl:(start<=?y)=true)by(apply Z.leb_le;lia).
 assert(Hyu:(y<?finish)=true)by(apply Z.ltb_lt;lia).
 assert(Hxb:(0<=?x*4)=true)by(apply Z.leb_le;nia).
 assert(Hxu:(x*4<?4*ow)=true)by(apply Z.ltb_lt;nia).
 rewrite Hdb,Hcb,Hcu,Hyl,Hyu,Hxb,Hxu;reflexivity.
Qed.

Lemma hc_tile_coordinate_unique : forall output hs cs channels start finish ow c y x c' y' x',
 0<=start /\ start<=y<finish -> 0<=c<channels -> 0<=x<ow ->
 0<=start /\ start<=y'<finish -> 0<=c'<channels -> 0<=x'<ow ->
 0<ow ->4*ow<=hs ->finish*hs<=cs ->
 hc_output_address output hs cs c y x=hc_output_address output hs cs c' y' x' ->
 c=c' /\ y=y' /\ x=x'.
Proof.
 intros output hs cs channels start finish ow c y x c' y' x' HY HC HX HY' HC' HX' HOW HHS HCS E.
 pose proof(hc_tile_decode_address output hs cs channels start finish ow c y x HY HC HX HOW HHS HCS)as A.
 pose proof(hc_tile_decode_address output hs cs channels start finish ow c' y' x' HY' HC' HX' HOW HHS HCS)as B.
 rewrite E in A;rewrite B in A;inversion A;auto.
Qed.
Print Assumptions hc_tile_decode_bounds.
Print Assumptions hc_tile_decode_address.
Print Assumptions hc_tile_coordinate_unique.

(* One row/lane write, with decoding preserving every None or unwritten cell.
   The physical row/channel may differ from the source row/lane. *)
Lemma hc_tile_write_decoded:forall Raw O output hs cs channels start finish ow
 c row x n rawc rawy dy lane p,
 0<=start /\ start<=row<finish ->0<=c<channels ->0<=x ->0<=n ->x+n<=ow ->
 0<ow ->4*ow<=hs ->finish*hs<=cs ->
 hc_write_values O(hc_output_address output hs cs c row x)
 (hc_tile_values Raw rawc rawy x n dy lane)p=
 match hc_decode output hs cs channels start finish ow p with
 |None=>O p
 |Some q=>
  if Z.eq_dec(hc_coord_c q)c then
   if Z.eq_dec(hc_coord_y q)row then
    if Z_le_dec x(hc_coord_x q)then
     if Z_lt_dec(hc_coord_x q)(x+n)then Some(Raw rawc lane(rawy+dy)(hc_coord_x q))else O p
    else O p
   else O p
  else O p
 end.
Proof.
 intros Raw O output hs cs channels start finish ow c row x n rawc rawy dy lane p
 HY HC HX HN HXN HOW HHS HCS.
 assert(Hhs:0<hs)by lia;assert(Hcs:0<cs)by nia.
 assert(Hhit:forall k,(k<length(hc_tile_values Raw rawc rawy x n dy lane))%nat->
 p=hc_output_address output hs cs c row x+4*Z.of_nat k->
 hc_decode output hs cs channels start finish ow p=Some(hc_coordinate c row(x+Z.of_nat k))).
 { intros k Hk E;rewrite hc_tile_values_length in Hk.
   assert(HkZ:0<=Z.of_nat k<n)by(split;[lia|apply Nat2Z.inj_lt in Hk;rewrite Z2Nat.id in Hk by lia;lia]).
   rewrite E;replace(hc_output_address output hs cs c row x+4*Z.of_nat k)
   with(hc_output_address output hs cs c row(x+Z.of_nat k))by(unfold hc_output_address;ring).
   apply hc_tile_decode_address;try assumption;lia. }
 destruct(hc_decode output hs cs channels start finish ow p)as[q|]eqn:HD.
 - pose proof(hc_tile_decode_bounds output hs cs channels start finish ow p q Hhs Hcs HOW HD)
   as[Hqc[Hqy[Hqx Hp]]].
   destruct(Z.eq_dec(hc_coord_c q)c)as[Ec|Ec];
   [destruct(Z.eq_dec(hc_coord_y q)row)as[Ey|Ey]|].
   + destruct(Z_le_dec x(hc_coord_x q))as[Exl|Exl].
     * destruct(Z_lt_dec(hc_coord_x q)(x+n))as[Exh|Exh].
       -- assert(Hj:0<=hc_coord_x q-x<n)by lia.
          assert(HjN:(Z.to_nat(hc_coord_x q-x)<Z.to_nat n)%nat)by(apply Z2Nat.inj_lt;lia).
          rewrite Hp,Ec,Ey.
          replace(hc_output_address output hs cs c row(hc_coord_x q))with
           (hc_output_address output hs cs c row x+4*Z.of_nat(Z.to_nat(hc_coord_x q-x)))
           by(rewrite Z2Nat.id by lia;unfold hc_output_address;ring).
          rewrite hc_write_values_nth by(rewrite hc_tile_values_length;exact HjN).
          rewrite hc_tile_values_nth by exact HjN.
          rewrite Z2Nat.id by lia;replace(x+(hc_coord_x q-x))with(hc_coord_x q)by ring;reflexivity.
       -- apply hc_write_values_frame;intros k Hk E;specialize(Hhit k Hk E).
          try rewrite HD in Hhit;inversion Hhit;subst q;cbn in *;rewrite hc_tile_values_length in Hk;apply Nat2Z.inj_lt in Hk;rewrite Z2Nat.id in Hk by lia;lia.
     * apply hc_write_values_frame;intros k Hk E;specialize(Hhit k Hk E).
       try rewrite HD in Hhit;inversion Hhit;subst q;cbn in *;rewrite hc_tile_values_length in Hk;apply Nat2Z.inj_lt in Hk;rewrite Z2Nat.id in Hk by lia;lia.
   + apply hc_write_values_frame;intros k Hk E;specialize(Hhit k Hk E).
     try rewrite HD in Hhit;inversion Hhit;subst q;cbn in *;congruence.
   + apply hc_write_values_frame;intros k Hk E;specialize(Hhit k Hk E).
     try rewrite HD in Hhit;inversion Hhit;subst q;cbn in *;congruence.
 - apply hc_write_values_frame;intros k Hk E;specialize(Hhit k Hk E).
   try rewrite HD in Hhit;discriminate.
Qed.
Print Assumptions hc_tile_write_decoded.

Lemma hc_tile_effective_lane:forall channels c q,
 0<=c<channels->c mod 4=0->c<=q<c+4->q<channels->
 hc_effective_lane channels q=
 if Z.eq_dec q(channels-1)then if Z_lt_dec(channels-c)4 then 3 else q-c else q-c.
Proof.
 intros channels c q HC HM HQ HQU.
 assert(Hqmod:q mod 4=q-c).
 { replace q with(c+(q-c))at 1 by ring.
   rewrite Z.add_mod,HM,Z.add_0_l,Z.mod_mod by lia.
   apply Z.mod_small;lia. }
 unfold hc_effective_lane.
 destruct(Z.eq_dec q(channels-1))as[E|E].
 - assert(Hb:(q=?channels-1)=true)by(apply Z.eqb_eq;exact E);rewrite Hb;cbn[andb].
   destruct(Z_lt_dec(channels-c)4)as[Hr|Hr].
   + assert(Hcm:channels mod 4=channels-c).
     { replace channels with(c+(channels-c))at 1 by ring.
      rewrite Z.add_mod,HM,Z.add_0_l,Z.mod_mod by lia;apply Z.mod_small;lia. }
     rewrite Hcm.
     assert(Hcb:(channels-c=?0)=false)by(apply Z.eqb_neq;lia);rewrite Hcb;reflexivity.
   + assert(Hr4:channels=c+4)by lia.
     assert(Hcm:channels mod 4=0).
     { rewrite Hr4,Z.add_mod,HM by lia;reflexivity. }
     rewrite Hcm;cbn;exact Hqmod.
 - assert(Hb:(q=?channels-1)=false)by(apply Z.eqb_neq;exact E);rewrite Hb;cbn[andb];exact Hqmod.
Qed.
Print Assumptions hc_tile_effective_lane.

Definition hc_tile_row_write O output hs cs channels c row x V:=
 let p lane:=hc_output_address output hs cs(hc_store_channel channels c lane)row x in
 hc_write_values(hc_write_values(hc_write_values(hc_write_values O(p 0)(V 0))(p 1)(V 1))(p 2)(V 2))(p 3)(V 3).

Lemma hc_tile_store_channel_bounds:forall channels c lane,
 0<=c<channels->0<=lane<=3->
 0<=hc_store_channel channels c lane<channels /\ c<=hc_store_channel channels c lane<=c+3.
Proof.
 intros;unfold hc_store_channel.
 pose proof(Z.le_min_l lane(channels-c-1));pose proof(Z.le_min_r lane(channels-c-1)).
 assert(Hm:0<=Z.min lane(channels-c-1))by(apply Z.min_glb;lia);lia.
Qed.

Ltac hc_tile_decide :=
 repeat match goal with
 | |-context[Z.eq_dec ?a ?b]=>destruct(Z.eq_dec a b);try lia;try congruence
 | |-context[Z_le_dec ?a ?b]=>destruct(Z_le_dec a b);try lia;try congruence
 | |-context[Z_lt_dec ?a ?b]=>destruct(Z_lt_dec a b);try lia;try congruence
 end.
Ltac hc_tile_mins:=repeat match goal with |-context[Z.min ?a ?b]=>
 first[rewrite(Z.min_l a b)by lia|rewrite(Z.min_r a b)by lia]end.

Lemma hc_tile_row_decoded:forall Raw O output hs cs channels start finish ow
 c row x n rawy dy p q,
 0<=start /\ start<=row<finish ->0<=c<channels ->c mod 4=0->
 0<=x ->0<=n ->x+n<=ow ->0<ow ->4*ow<=hs ->finish*hs<=cs ->
 hc_decode output hs cs channels start finish ow p=Some q ->
 hc_tile_row_write O output hs cs channels c row x(hc_tile_values Raw c rawy x n dy)p=
 if Z.eq_dec(hc_coord_y q)row then
  if Z_le_dec c(hc_coord_c q)then
   if Z_lt_dec(hc_coord_c q)(c+4)then
    if Z_le_dec x(hc_coord_x q)then
     if Z_lt_dec(hc_coord_x q)(x+n)then
      Some(Raw c(hc_effective_lane channels(hc_coord_c q))(rawy+dy)(hc_coord_x q))else O p
    else O p
   else O p
  else O p
 else O p.
Proof.
 intros Raw O output hs cs channels start finish ow c row x n rawy dy p q
 HY HC HM HX HN HXN HOW HHS HCS HD.
 assert(Hhs:0<hs)by lia;assert(Hcs:0<cs)by nia.
 pose proof(hc_tile_decode_bounds output hs cs channels start finish ow p q Hhs Hcs HOW HD)
  as[Hqc[Hqy[Hqx Hp]]].
 assert(Hstore:forall lane,0<=lane<=3->0<=hc_store_channel channels c lane<channels).
 { intros;apply(hc_tile_store_channel_bounds channels c lane HC H). }
 pose proof(hc_tile_store_channel_bounds channels c 0 HC ltac:(lia))as[HS0 HR0].
 pose proof(hc_tile_store_channel_bounds channels c 1 HC ltac:(lia))as[HS1 HR1].
 pose proof(hc_tile_store_channel_bounds channels c 2 HC ltac:(lia))as[HS2 HR2].
 pose proof(hc_tile_store_channel_bounds channels c 3 HC ltac:(lia))as[HS3 HR3].
 unfold hc_tile_row_write;cbn beta zeta.
 repeat rewrite(hc_tile_write_decoded Raw _ output hs cs channels start finish ow _ row x n c rawy dy _ p)by(first[assumption|apply Hstore;lia]).
 rewrite HD.
 destruct(Z_le_dec c(hc_coord_c q))as[Hcl|Hcl];
 destruct(Z_lt_dec(hc_coord_c q)(c+4))as[Hcu|Hcu].
 - rewrite(hc_tile_effective_lane channels c(hc_coord_c q)HC HM ltac:(lia)ltac:(lia)).
   assert(Hcc:channels=c+1\/channels=c+2\/channels=c+3\/c+4<=channels)by lia.
   assert(Hqcases:hc_coord_c q=c\/hc_coord_c q=c+1\/hc_coord_c q=c+2\/hc_coord_c q=c+3)by lia.
   destruct Hcc as[Hcc|[Hcc|[Hcc|Hcc]]];
   destruct Hqcases as[Hqq|[Hqq|[Hqq|Hqq]]];try lia;
   unfold hc_store_channel;hc_tile_mins;hc_tile_decide;
   repeat f_equal;try lia;try reflexivity.
 - hc_tile_decide;reflexivity.
 - hc_tile_decide;reflexivity.
 - hc_tile_decide;reflexivity.
Qed.
Print Assumptions hc_tile_store_channel_bounds.
Print Assumptions hc_tile_row_decoded.

Lemma hc_tile_row_none:forall Raw O output hs cs channels start finish ow
 c row x n rawy dy p,
 0<=start /\ start<=row<finish ->0<=c<channels ->
 0<=x ->0<=n ->x+n<=ow ->0<ow ->4*ow<=hs ->finish*hs<=cs ->
 hc_decode output hs cs channels start finish ow p=None ->
 hc_tile_row_write O output hs cs channels c row x(hc_tile_values Raw c rawy x n dy)p=O p.
Proof.
 intros Raw O output hs cs channels start finish ow c row x n rawy dy p
 HY HC HX HN HXN HOW HHS HCS HD.
 assert(Hstore:forall lane,0<=lane<=3->0<=hc_store_channel channels c lane<channels).
 { intros;apply(hc_tile_store_channel_bounds channels c lane HC H). }
 unfold hc_tile_row_write;cbn beta zeta.
 repeat rewrite(hc_tile_write_decoded Raw _ output hs cs channels start finish ow _ row x n c rawy dy _ p)by(first[assumption|apply Hstore;lia]).
 rewrite HD;reflexivity.
Qed.
Lemma hc_tile_block_base:forall c q,0<=c->c mod 4=0->c<=q<c+4->4*(q/4)=c.
Proof.
 intros c q HC HM HQ;pose proof(Z.div_mod c 4 ltac:(lia)).
 assert(HE:q/4=c/4)by(symmetry;apply Z.div_unique with(q-c);lia).
 rewrite HE;lia.
Qed.
Ltac hc_tile_bool_decide:=
 repeat first[
  progress hc_tile_decide|
  match goal with
  | |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b);try lia;try congruence
  | |-context[Z.leb ?a ?b]=>destruct(Z.leb_spec a b);try lia;try congruence
  end].

Lemma hc_tile_progress_step:forall Raw O output hs cs channels start finish ow y c x n,
 0<=start->start<=y<finish->0<=c<channels->c mod 4=0->
 0<=x->0<=n->x+n<=ow->0<ow->4*ow<=hs->finish*hs<=cs->
 hc_write_tile(hc_progress(hc_visible Raw channels)O output hs cs channels start finish ow y c x)
 output hs cs channels finish y c x(hc_tile_values Raw c y x n 0)(hc_tile_values Raw c y x n 1)=
 hc_progress(hc_visible Raw channels)O output hs cs channels start finish ow y c(x+n).
Proof.
 intros Raw O output hs cs channels start finish ow y c x n
 Hstart HY HC HM HX HN HXN HOW HHS HCS.
 apply FunctionalExtensionality.functional_extensionality;intro p.
 assert(Hrow0:hc_store_row finish y 0=y).
 { unfold hc_store_row;rewrite Z.add_0_r;apply Z.min_l;lia. }
 assert(Hrow1:start<=hc_store_row finish y 1<finish).
 { unfold hc_store_row;pose proof(Z.le_min_l(y+1)(finish-1));pose proof(Z.le_min_r(y+1)(finish-1)).
  assert(Hm:start<=Z.min(y+1)(finish-1))by(apply Z.min_glb;lia);lia. }
 change(hc_tile_row_write
 (hc_tile_row_write(hc_progress(hc_visible Raw channels)O output hs cs channels start finish ow y c x)
 output hs cs channels c(hc_store_row finish y 1)x(hc_tile_values Raw c y x n 1))
 output hs cs channels c(hc_store_row finish y 0)x(hc_tile_values Raw c y x n 0)p=
 hc_progress(hc_visible Raw channels)O output hs cs channels start finish ow y c(x+n)p).
 rewrite Hrow0.
 destruct(hc_decode output hs cs channels start finish ow p)as[q|]eqn:HD.
 - rewrite(hc_tile_row_decoded Raw _ output hs cs channels start finish ow c y x n y 0 p q)
   by(first[assumption|split;lia|lia]).
   rewrite(hc_tile_row_decoded Raw _ output hs cs channels start finish ow c(hc_store_row finish y 1)x n y 1 p q)
   by(first[assumption|split;lia|lia]).
   unfold hc_progress;rewrite HD.
   assert(Hhs:0<hs)by lia;assert(Hcs:0<cs)by nia.
   pose proof(hc_tile_decode_bounds output hs cs channels start finish ow p q Hhs Hcs HOW HD)as[Hqc[Hqy[Hqx Hp]]].
   assert(Hlast:y+1<finish\/y+1=finish)by lia.
   destruct Hlast as[Hlast|Hlast];unfold hc_store_row;
   [rewrite Z.min_l by lia|rewrite Z.min_r by lia];
   hc_tile_bool_decide;cbn[orb andb];try reflexivity;
   unfold hc_visible;
   replace(4*(hc_coord_c q/4))with c by(symmetry;apply hc_tile_block_base;lia);
   repeat f_equal;try lia;try reflexivity.
 - rewrite(hc_tile_row_none Raw _ output hs cs channels start finish ow c y x n y 0 p)
   by(first[assumption|split;lia|lia]).
   rewrite(hc_tile_row_none Raw _ output hs cs channels start finish ow c(hc_store_row finish y 1)x n y 1 p)
   by(first[assumption|split;lia|lia]).
   unfold hc_progress;rewrite HD;reflexivity.
Qed.
Print Assumptions hc_tile_row_none.
Print Assumptions hc_tile_block_base.
Print Assumptions hc_tile_progress_step.
Print Assumptions hc_tile_mod_affine.
