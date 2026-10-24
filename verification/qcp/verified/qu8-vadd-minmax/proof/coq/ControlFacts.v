From Coq Require Import ZArith Lia.
From compcert.lib Require Import Coqlib.
From Qu8Add Require Export Model.
Local Open Scope Z_scope.
Definition qu_control_decode(raw:Z):Z:=
 let t:= -(Z.rem raw 256) in
 let u:=if 127 <? t then t-256 else t in
 if u <? -128 then u+256 else u.
Lemma qu_neg_rem_bounds:forall raw,-255<= -(Z.rem raw 256)<=255.
Proof. intros;pose proof(Z.rem_bound_abs raw 256 ltac:(lia));change(Z.abs(Z.rem raw 256)<256)in H;apply Z.abs_lt in H;lia. Qed.
Lemma qu_neg_rem_mod:forall raw,(-raw) mod 256=(-(Z.rem raw 256)) mod 256.
Proof.
 intros;pose proof(Z.quot_rem raw 256 ltac:(lia))as H.
 replace(-raw)with(-(Z.rem raw 256)+(-(Z.quot raw 256))*256)by nia.
 rewrite Z.mod_add by lia;reflexivity.
Qed.
Lemma qu_s8_small_decode:forall t,-255<=t<=255->
 qu_s8 t=(let u:=if 127 <? t then t-256 else t in if u <? -128 then u+256 else u).
Proof.
 intros t Ht;unfold qu_s8,signed_last_nbits;change ((if zlt (t mod 256) 128 then t mod 256 else t mod 256-256)=(let u:=if 127 <? t then t-256 else t in if u <? -128 then u+256 else u)).
 destruct(Z.ltb_spec 127 t).
 - cbn zeta;rewrite Z.mod_small by lia;destruct(zlt t 128);[lia|];destruct(Z.ltb_spec(t-256)(-128));lia.
 - cbn zeta;destruct(Z.ltb_spec t(-128)).
   + assert(Hmod:t mod 256=t+256).
     { replace t with((t+256)+(-1)*256)at 1 by ring;rewrite Z.mod_add by lia;apply Z.mod_small;lia. }
     rewrite Hmod;destruct(zlt(t+256)128);lia.
   + destruct(Z_le_dec 0 t).
     * rewrite Z.mod_small by lia;destruct(zlt t 128);lia.
     * assert(Hmod:t mod 256=t+256).
       { replace t with((t+256)+(-1)*256)at 1 by ring;rewrite Z.mod_add by lia;apply Z.mod_small;lia. }
       rewrite Hmod;destruct(zlt(t+256)128);lia.
Qed.
Lemma qu_control_decode_correct:forall raw,qu_control_decode raw=qu_ctrl raw.
Proof.
 intros;rewrite qu_ctrl_low;unfold qu_control_decode.
 rewrite <-qu_s8_small_decode by apply qu_neg_rem_bounds.
 unfold qu_s8,signed_last_nbits;change ((if zlt ((-(Z.rem raw 256)) mod 256) 128 then (-(Z.rem raw 256)) mod 256 else (-(Z.rem raw 256)) mod 256-256)=(if zlt ((-raw) mod 256)128 then (-raw) mod 256 else (-raw) mod 256-256)).
 rewrite (qu_neg_rem_mod raw);reflexivity.
Qed.
Lemma qu_control_decode_range:forall raw,-128<=qu_control_decode raw<=127.
Proof. intros;rewrite qu_control_decode_correct;apply qu_ctrl_range. Qed.
Lemma qu_control_decode_neon_observation:forall x raw,
 qu_neon_shift x(qu_control_decode raw)=qu_neon_shift x(qu_negword raw).
Proof. intros;unfold qu_neon_shift;rewrite qu_control_decode_correct,qu_ctrl_neon,qu_s8_id by apply qu_ctrl_range;reflexivity. Qed.
