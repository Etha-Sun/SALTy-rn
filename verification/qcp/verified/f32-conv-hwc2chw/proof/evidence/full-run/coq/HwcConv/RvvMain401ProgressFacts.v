From HwcConv Require Export HwcProgressModel.
From Coq Require Import ZArith Lia Logic.FunctionalExtensionality.
Local Open Scope Z_scope.
Lemma hcm_decode_bounds : forall output hs cs channels start finish ow p q,
 hc_decode output hs cs channels start finish ow p=Some q ->
 0<=q.(hc_coord_c)<channels /\ start<=q.(hc_coord_y)<finish /\ 0<=q.(hc_coord_x)<ow.
Proof.
 intros output hs cs channels start finish ow p q HD;unfold hc_decode in HD.
 lazymatch type of HD with context[if ?b then _ else _]=>destruct b eqn:HB end;[|discriminate].
 inversion HD;subst q;clear HD.
 repeat match goal with H:andb _ _=true|-_=>apply Bool.andb_true_iff in H;destruct H end.
 repeat match goal with H:Z.leb _ _=true|-_=>apply Z.leb_le in H|H:Z.ltb _ _=true|-_=>apply Z.ltb_lt in H|H:Z.eqb _ _=true|-_=>apply Z.eqb_eq in H end.
 cbn[hc_coord_c hc_coord_y hc_coord_x];repeat split;try lia.
 - apply Z.div_pos;lia.
 - apply Z.div_lt_upper_bound;lia.
Qed.
Lemma hcm_progress_final : forall R O output hs cs channels start finish ow y c x,
 finish<=y ->hc_progress R O output hs cs channels start finish ow y c x=
 hc_final R O output hs cs channels start finish ow.
Proof.
 intros;apply functional_extensionality;intro p;unfold hc_progress,hc_final.
 destruct(hc_decode output hs cs channels start finish ow p)as[q|]eqn:HD;[|reflexivity].
 destruct(hcm_decode_bounds _ _ _ _ _ _ _ _ _ HD)as[HC[HY HX]].
 assert(E:(hc_coord_y q<?y)=true)by(apply Z.ltb_lt;lia);rewrite E;reflexivity.
Qed.
Lemma hcm_progress_next_channel : forall R O output hs cs channels start finish ow y c,
 hc_progress R O output hs cs channels start finish ow y c ow=
 hc_progress R O output hs cs channels start finish ow y(c+4)0.
Proof.
 intros;apply functional_extensionality;intro p;unfold hc_progress.
 destruct(hc_decode output hs cs channels start finish ow p)as[q|]eqn:HD;[|reflexivity].
 destruct(hcm_decode_bounds _ _ _ _ _ _ _ _ _ HD)as[HC[HY HX]].
 assert(E:(hc_coord_x q<?ow)=true)by(apply Z.ltb_lt;lia).
 assert(E0:(hc_coord_x q<?0)=false)by(apply Z.ltb_ge;lia).
 rewrite E,E0;rewrite Bool.andb_true_r,Bool.andb_false_r,Bool.orb_false_r.
 destruct(hc_coord_c q<?c)eqn:EC;[|reflexivity].
 assert(EC4:(hc_coord_c q<?c+4)=true)by(apply Z.ltb_lt;apply Z.ltb_lt in EC;lia).
 rewrite EC4;reflexivity.
Qed.
Lemma hcm_progress_next_row : forall R O output hs cs channels start finish ow y c,
 channels<=c ->hc_progress R O output hs cs channels start finish ow y c 0=
 hc_progress R O output hs cs channels start finish ow(y+2)0 0.
Proof.
 intros;apply functional_extensionality;intro p;unfold hc_progress.
 destruct(hc_decode output hs cs channels start finish ow p)as[q|]eqn:HD;[|reflexivity].
 destruct(hcm_decode_bounds _ _ _ _ _ _ _ _ _ HD)as[HC[HY HX]].
 assert(EC:(hc_coord_c q<?c)=true)by(apply Z.ltb_lt;lia).
 assert(EC0:(hc_coord_c q<?0)=false)by(apply Z.ltb_ge;lia).
 assert(EX0:(hc_coord_x q<?0)=false)by(apply Z.ltb_ge;lia).
 rewrite EC,EC0,EX0;repeat rewrite Bool.andb_false_r;cbn.
 destruct(hc_coord_y q<?y)eqn:EY;[|reflexivity].
 assert(EY2:(hc_coord_y q<?y+2)=true)by(apply Z.ltb_lt;apply Z.ltb_lt in EY;lia).
 rewrite EY2;reflexivity.
Qed.
Print Assumptions hcm_decode_bounds.
Print Assumptions hcm_progress_final.
Print Assumptions hcm_progress_next_channel.
Print Assumptions hcm_progress_next_row.
