From Coq Require Import ZArith Lia.
From compcert.lib Require Import Coqlib.
From Qu8Add Require Export UnsignedScalarModel.
Local Open Scope Z_scope.
Lemma qu_u16_decode_high : forall x,32768<=x<=65535 -> qu_s16 x=x-65536.
Proof.
 intros x Hx;unfold qu_s16,signed_last_nbits.
 change ((if zlt (x mod 65536) 32768 then x mod 65536 else x mod 65536-65536)=x-65536).
 rewrite Z.mod_small by lia;destruct(zlt x 32768);lia.
Qed.
Lemma qu_direct_cast_target_false_instance : 65535<>qu_s16 65535.
Proof. vm_compute;discriminate. Qed.
Lemma qu_decode_preserves_word : forall x,qu_u16(qu_s16 x)=qu_u16 x.
Proof. intros;unfold qu_u16,qu_s16;apply unsigned_signed_revolutive;lia. Qed.
Lemma qu_valid_u16_decode_preserves_bits : forall x,0<=x<=65535 -> qu_u16(qu_s16 x)=x.
Proof. intros;rewrite qu_decode_preserves_word;apply qu_u16_id;lia. Qed.
