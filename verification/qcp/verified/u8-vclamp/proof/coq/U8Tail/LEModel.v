From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
Local Open Scope Z_scope.
Definition le_byte0 (word:Z) := unsigned_last_nbits word 8.
Definition le_byte1 (word:Z) := unsigned_last_nbits (Z.quot word 256) 8.
Definition le_byte2 (word:Z) := unsigned_last_nbits (Z.quot word 65536) 8.
Definition le_byte3 (word:Z) := unsigned_last_nbits (Z.quot word 16777216) 8.

Lemma low_byte_digit : forall a q,
 0<=a<256 -> unsigned_last_nbits (a+256*q) 8=a.
Proof.
 intros a q Ha; unfold unsigned_last_nbits.
 change (Z.modulo (a+256*q) 256 = a).
 symmetry; apply (Z.mod_unique_pos _ _ q); lia.
Qed.

Lemma pack16_store_bytes : forall a b,
 0<=a<=255 -> 0<=b<=255 ->
 le_byte0 (a+256*b)=a /\ le_byte1 (a+256*b)=b.
Proof.
 intros a b Ha Hb; unfold le_byte0,le_byte1.
 assert (Hq : Z.quot (a+256*b) 256=b).
 { symmetry; apply (Z.quot_unique _ _ _ a); lia. }
 rewrite Hq; split.
 - apply low_byte_digit; lia.
 - apply unsigned_last_nbits_eq; change (0<=b<256);lia.
Qed.

Lemma pack32_store_bytes : forall a b c d,
 0<=a<=255 -> 0<=b<=255 -> 0<=c<=255 -> 0<=d<=255 ->
 let word:=a+256*b+65536*c+16777216*d in
 le_byte0 word=a /\ le_byte1 word=b /\ le_byte2 word=c /\ le_byte3 word=d.
Proof.
 intros a b c d Ha Hb Hc Hd; cbn zeta; unfold le_byte0,le_byte1,le_byte2,le_byte3.
 assert (Hq1 : Z.quot (a+256*b+65536*c+16777216*d) 256=b+256*c+65536*d).
 { symmetry; apply (Z.quot_unique _ _ _ a); lia. }
 assert (Hq2 : Z.quot (a+256*b+65536*c+16777216*d) 65536=c+256*d).
 { symmetry; apply (Z.quot_unique _ _ _ (a+256*b)); lia. }
 assert (Hq3 : Z.quot (a+256*b+65536*c+16777216*d) 16777216=d).
 { symmetry; apply (Z.quot_unique _ _ _ (a+256*b+65536*c)); lia. }
 rewrite Hq1,Hq2,Hq3; repeat split.
 - replace (a+256*b+65536*c+16777216*d) with (a+256*(b+256*c+65536*d)) by ring.
   apply low_byte_digit; lia.
 - replace (b+256*c+65536*d) with (b+256*(c+256*d)) by ring.
   apply low_byte_digit; lia.
 - apply low_byte_digit; lia.
 - apply unsigned_last_nbits_eq; change (0<=d<256);lia.
Qed.
Print Assumptions pack16_store_bytes.
Print Assumptions pack32_store_bytes.
