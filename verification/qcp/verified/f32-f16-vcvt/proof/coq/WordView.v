From Coq Require Import ZArith Lia List.
Import ListNotations. Local Open Scope Z_scope.
Definition f16_u32_low_pair (lo hi:Z):Z:=lo+65536*hi.
Definition f16_u16_le_bytes (x:Z):list Z:=[x mod 256;x/256].
Definition f16_u32_le_bytes (x:Z):list Z:=[x mod 256;(x/256)mod 256;(x/65536)mod 256;x/16777216].
Lemma f16_low_pair_bounds : forall lo hi,0<=lo<65536 -> 0<=hi<65536 -> 0<=f16_u32_low_pair lo hi<4294967296.
Proof. unfold f16_u32_low_pair;intros;lia. Qed.
Lemma f16_word_view_le : forall lo hi,0<=lo<65536 -> 0<=hi<65536 ->
 f16_u32_le_bytes(f16_u32_low_pair lo hi)=f16_u16_le_bytes lo++f16_u16_le_bytes hi.
Proof.
 intros lo hi Hlo Hhi;unfold f16_u32_low_pair,f16_u32_le_bytes,f16_u16_le_bytes;cbn[app].
 assert(Hloq:0<=lo/256<256)by(split;[apply Z.div_pos|apply Z.div_lt_upper_bound];lia).
 assert(Hhiquot:0<=hi/256<256)by(split;[apply Z.div_pos|apply Z.div_lt_upper_bound];lia).
 assert(Hmod:(lo+65536*hi)mod 256=lo mod 256).
 { rewrite Z.add_mod by lia;rewrite Z.mul_mod by lia;change(65536 mod 256)with 0;rewrite Z.mul_0_l,Z.mod_0_l,Z.add_0_r,Z.mod_mod by lia;reflexivity. }
 assert(Hdiv256:(lo+65536*hi)/256=lo/256+256*hi).
 { replace(65536*hi)with((256*hi)*256)by ring;rewrite Z.div_add by lia;reflexivity. }
 assert(Hdiv65536:(lo+65536*hi)/65536=hi).
 { rewrite Z.mul_comm with(n:=65536);rewrite Z.div_add by lia;rewrite Z.div_small by lia;lia. }
 assert(Hdiv16777216:(lo+65536*hi)/16777216=hi/256).
 { replace 16777216 with(65536*256)by reflexivity;rewrite <- Z.div_div by lia;rewrite Hdiv65536;reflexivity. }
 rewrite Hmod,Hdiv256,Hdiv65536,Hdiv16777216.
 rewrite Z.add_mod by lia;rewrite Z.mul_mod by lia;change(256 mod 256)with 0;rewrite Z.mul_0_l,Z.mod_0_l,Z.add_0_r by lia;repeat rewrite(Z.mod_small (lo/256) 256 Hloq);reflexivity.
Qed.
Print Assumptions f16_low_pair_bounds.
Print Assumptions f16_word_view_le.
