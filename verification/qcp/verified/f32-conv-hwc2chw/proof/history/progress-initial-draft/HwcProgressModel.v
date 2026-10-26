From Coq Require Import Logic.FunctionalExtensionality.
From HwcConv Require Export HwcProgramModel.
Import ListNotations. Local Open Scope Z_scope.
Definition HwcPixels:Type:=Z->Z->Z->fp32.
Definition HwcRawPixels:Type:=Z->Z->Z->Z->fp32.
Definition hc_visible(R:HwcRawPixels)(channels:Z):HwcPixels:=fun c y x=>
 R(4*(c/4))(hc_effective_lane channels c)y x.
Record HwcCoordinate:Type:=hc_coordinate{hc_coord_c:Z;hc_coord_y:Z;hc_coord_x:Z}.
Definition hc_decode(output hs cs channels start finish ow p:Z):option HwcCoordinate:=
 let d:=p-output in let c:=d/cs in let r:=d mod cs in let y:=r/hs in let b:=r mod hs in
 if andb(0<=?d)(andb(c<?channels)(andb(start<=?y)(andb(y<?finish)
 (andb(Z.eqb(b mod 4)0)(b<?4*ow)))))
 then Some(hc_coordinate c y(b/4))else None.
Definition hc_progress(R:HwcPixels)(O:HwcOutput)(output hs cs channels start finish ow y c x:Z):HwcOutput:=fun p=>
 match hc_decode output hs cs channels start finish ow p with
 |None=>O p
 |Some q=>
  if orb(q.(hc_coord_y)<?y)
    (andb(q.(hc_coord_y)<?y+2)
      (orb(q.(hc_coord_c)<?c)
        (andb(q.(hc_coord_c)<?c+4)(q.(hc_coord_x)<?x))))
  then Some(R q.(hc_coord_c)q.(hc_coord_y)q.(hc_coord_x))else O p
 end.
Definition hc_final(R:HwcPixels)(O:HwcOutput)(output hs cs channels start finish ow:Z):HwcOutput:=fun p=>
 match hc_decode output hs cs channels start finish ow p with
 |None=>O p|Some q=>Some(R q.(hc_coord_c)q.(hc_coord_y)q.(hc_coord_x))end.
Fixpoint hc_write_values(O:HwcOutput)(p:Z)(xs:list fp32):HwcOutput:=
 match xs with []=>O|v::rest=>hc_write_values(hc_output_put O p v)(p+4)rest end.
Definition hc_store_channel(channels c lane:Z):Z:=c+Z.min lane(channels-c-1).
Definition hc_store_row(finish y dy:Z):Z:=Z.min(y+dy)(finish-1).
Definition hc_write_tile(O:HwcOutput)(output hs cs channels finish y c x:Z)
 (V0 V1:Z->list fp32):HwcOutput:=
 let p:=fun lane dy=>hc_output_address output hs cs(hc_store_channel channels c lane)(hc_store_row finish y dy)x in
 let O:=hc_write_values O(p 0 1)(V1 0)in
 let O:=hc_write_values O(p 1 1)(V1 1)in
 let O:=hc_write_values O(p 2 1)(V1 2)in
 let O:=hc_write_values O(p 3 1)(V1 3)in
 let O:=hc_write_values O(p 0 0)(V0 0)in
 let O:=hc_write_values O(p 1 0)(V0 1)in
 let O:=hc_write_values O(p 2 0)(V0 2)in
 hc_write_values O(p 3 0)(V0 3).
Definition hc_tile_values(R:HwcRawPixels)(c y x n dy lane:Z):list fp32:=
 map(fun k=>R c lane(y+dy)(x+Z.of_nat k))(seq 0(Z.to_nat n)).
Lemma hc_progress_initial:forall R O output hs cs channels start finish ow,
 hc_progress R O output hs cs channels start finish ow start 0 0=O.
Proof.
 intros;apply functional_extensionality;intro p;unfold hc_progress.
 destruct(hc_decode output hs cs channels start finish ow p)as[[c y x]|]eqn:HD;[|reflexivity].
 unfold hc_decode in HD.
 repeat match type of HD with context[if ?b then _ else _]=>destruct b eqn:?;try discriminate end.
 inversion HD;subst;clear HD.
 repeat match goal with H:andb _ _=true|-_=>apply Bool.andb_true_iff in H;destruct H end.
 repeat match goal with H:Z.leb _ _=true|-_=>apply Z.leb_le in H end.
 repeat match goal with H:Z.ltb _ _=true|-_=>apply Z.ltb_lt in H end.
 cbn[hc_coord_c hc_coord_y hc_coord_x].
 rewrite !Z.ltb_ge by lia;cbn;reflexivity.
Qed.
Print Assumptions hc_progress_initial.
