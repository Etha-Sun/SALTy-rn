From Coq Require Import ZArith Lia.
From U8Tail Require Import LEModel.
Local Open Scope Z_scope.
Definition pack64 a b c d e f g h := a+256*b+65536*c+16777216*d+4294967296*e+1099511627776*f+281474976710656*g+72057594037927936*h.
Lemma register_low32 : forall a b c d e f g h,
 0<=a<=255 ->0<=b<=255 ->0<=c<=255 ->0<=d<=255 ->
 pack64 a b c d e f g h mod 4294967296 = a+256*b+65536*c+16777216*d.
Proof.
 intros. unfold pack64. symmetry.
 apply (Z.mod_unique_pos _ _ (e+256*f+65536*g+16777216*h)); lia.
Qed.
Lemma register_low16 : forall a b c d e f g h,
 0<=a<=255 ->0<=b<=255 ->
 pack64 a b c d e f g h mod 65536 = a+256*b.
Proof.
 intros. unfold pack64. symmetry.
 apply (Z.mod_unique_pos _ _ (c+256*d+65536*e+16777216*f+4294967296*g+1099511627776*h)); lia.
Qed.
Lemma wrong_byte_is_observable :
 le_byte1 (0+256*0+65536*0+16777216*0) <> 1.
Proof. vm_compute. discriminate. Qed.
Print Assumptions register_low32.
Print Assumptions register_low16.
Print Assumptions wrong_byte_is_observable.
