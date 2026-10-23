From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* Representation changes preserve the actual byte, with no address alignment
   premise. Bounds concern representable byte values, never clamp parameters. *)
Definition byte_unsigned (x:Z) := unsigned_last_nbits x 8.
Definition byte_signed (x:Z) := signed_last_nbits x 8.
Lemma byte_unsigned_range : forall x, 0 <= byte_unsigned x <= 255.
Proof. intros. pose proof (unsigned_Lastnbits_range x 8 ltac:(lia)). change (0 <= unsigned_last_nbits x 8 <= 255). change (0 <= unsigned_last_nbits x 8 < 256) in H. lia. Qed.
Lemma byte_signed_range : forall x, -128 <= byte_signed x <= 127.
Proof. intros. pose proof (signed_Lastnbits_range x 8 ltac:(lia)). change (-128 <= signed_last_nbits x 8 <= 127). change (-128 <= signed_last_nbits x 8 < 128) in H. lia. Qed.
Lemma byte_signed_unsigned : forall x, byte_signed (byte_unsigned x) = byte_signed x.
Proof. intros. apply signed_unsigned_revolutive; lia. Qed.
Lemma byte_unsigned_signed : forall x, byte_unsigned (byte_signed x) = byte_unsigned x.
Proof. intros. apply unsigned_signed_revolutive; lia. Qed.
Lemma byte_signed_id : forall x, -128 <= x <= 127 -> byte_signed x = x.
Proof. intros. apply signed_last_nbits_eq; [lia|]. change (-128 <= x < 128). lia. Qed.
Lemma byte_unsigned_id : forall x, 0 <= x <= 255 -> byte_unsigned x = x.
Proof. intros. apply unsigned_last_nbits_eq. change (0 <= x < 256). lia. Qed.
Lemma byte_roundtrip_signed : forall x, -128 <= x <= 127 -> byte_signed (byte_unsigned x) = x.
Proof. intros. rewrite byte_signed_unsigned. now apply byte_signed_id. Qed.
Lemma byte_roundtrip_unsigned : forall x, 0 <= x <= 255 -> byte_unsigned (byte_signed x) = x.
Proof. intros. rewrite byte_unsigned_signed. now apply byte_unsigned_id. Qed.
Lemma byte_map_roundtrip_signed : forall xs,
 Forall (fun x => -128 <= x <= 127) xs ->
 map byte_signed (map byte_unsigned xs) = xs.
Proof. intros xs H. induction H; simpl; [reflexivity|]. rewrite byte_roundtrip_signed by assumption. now rewrite IHForall. Qed.
Lemma byte_map_roundtrip_unsigned : forall xs,
 Forall (fun x => 0 <= x <= 255) xs ->
 map byte_unsigned (map byte_signed xs) = xs.
Proof. intros xs H. induction H; simpl; [reflexivity|]. rewrite byte_roundtrip_unsigned by assumption. now rewrite IHForall. Qed.
Lemma byte_undef_signed_unsigned : forall p,
 p # Char |->_ --||-- p # UChar |->_ .
Proof. intros. split; apply derivable1_refl. Qed.
Lemma byte_cell_signed_unsigned : forall p x,
 p # Char |-> x |-- p # UChar |-> byte_unsigned x.
Proof. intros. apply store_char_cast. Qed.
Lemma byte_cell_unsigned_signed : forall p x,
 p # UChar |-> x |-- p # Char |-> byte_signed x.
Proof. intros. apply store_uchar_cast. Qed.
Lemma byte_cell_signed_roundtrip : forall p x, -128<=x<=127 ->
 p # UChar |-> byte_unsigned x |-- p # Char |-> x.
Proof. intros. rewrite <- (byte_roundtrip_signed x H) at 2. apply byte_cell_unsigned_signed. Qed.
Lemma byte_array_rec_signed_unsigned : forall xs p lo hi,
 store_array_rec StoreCharAsElement.storeA p lo hi xs |--
 store_array_rec StoreUCharAsElement.storeA p lo hi (map byte_unsigned xs).
Proof.
 induction xs; intros; simpl; [apply derivable1_refl|].
 apply derivable1_sepcon_mono; [|apply IHxs].
 unfold StoreCharAsElement.storeA,StoreUCharAsElement.storeA.
 rewrite sizeof_char,sizeof_uchar. apply byte_cell_signed_unsigned.
Qed.
Lemma byte_array_rec_unsigned_signed : forall xs p lo hi,
 store_array_rec StoreUCharAsElement.storeA p lo hi xs |--
 store_array_rec StoreCharAsElement.storeA p lo hi (map byte_signed xs).
Proof.
 induction xs; intros; simpl; [apply derivable1_refl|].
 apply derivable1_sepcon_mono; [|apply IHxs].
 unfold StoreCharAsElement.storeA,StoreUCharAsElement.storeA.
 rewrite sizeof_char,sizeof_uchar. apply byte_cell_unsigned_signed.
Qed.
Lemma byte_array_signed_unsigned : forall p n xs,
 CharArray.full p n xs |-- UCharArray.full p n (map byte_unsigned xs).
Proof. intros. apply byte_array_rec_signed_unsigned. Qed.
Lemma byte_array_unsigned_signed : forall p n xs,
 UCharArray.full p n xs |-- CharArray.full p n (map byte_signed xs).
Proof. intros. apply byte_array_rec_unsigned_signed. Qed.
Lemma byte_array_signed_roundtrip : forall p n xs,
 Forall (fun x => -128 <= x <= 127) xs ->
 UCharArray.full p n (map byte_unsigned xs) |-- CharArray.full p n xs.
Proof. intros. rewrite <- (byte_map_roundtrip_signed xs H) at 2. apply byte_array_unsigned_signed. Qed.
Lemma byte_array_unsigned_roundtrip : forall p n xs,
 Forall (fun x => 0 <= x <= 255) xs ->
 CharArray.full p n (map byte_signed xs) |-- UCharArray.full p n xs.
Proof. intros. rewrite <- (byte_map_roundtrip_unsigned xs H) at 2. apply byte_array_signed_unsigned. Qed.

(* Digit lemmas adapted from worker-u8-tail-memory 9dd92b6b; rechecked here. *)
Definition s8_le_byte0 (word:Z) := unsigned_last_nbits word 8.
Definition s8_le_byte1 (word:Z) := unsigned_last_nbits (Z.quot word 256) 8.
Definition s8_le_byte2 (word:Z) := unsigned_last_nbits (Z.quot word 65536) 8.
Definition s8_le_byte3 (word:Z) := unsigned_last_nbits (Z.quot word 16777216) 8.

Lemma s8_low_byte_digit : forall a q,
 0<=a<256 -> unsigned_last_nbits (a+256*q) 8=a.
Proof.
 intros a q Ha; unfold unsigned_last_nbits.
 change (Z.modulo (a+256*q) 256 = a).
 symmetry; apply (Z.mod_unique_pos _ _ q); lia.
Qed.

Lemma s8_pack16_store_bytes : forall a b,
 0<=a<=255 -> 0<=b<=255 ->
 s8_le_byte0 (a+256*b)=a /\ s8_le_byte1 (a+256*b)=b.
Proof.
 intros a b Ha Hb; unfold s8_le_byte0,s8_le_byte1.
 assert (Hq : Z.quot (a+256*b) 256=b).
 { symmetry; apply (Z.quot_unique _ _ _ a); lia. }
 rewrite Hq; split.
 - apply s8_low_byte_digit; lia.
 - apply unsigned_last_nbits_eq; change (0<=b<256);lia.
Qed.

Lemma s8_pack32_store_bytes : forall a b c d,
 0<=a<=255 -> 0<=b<=255 -> 0<=c<=255 -> 0<=d<=255 ->
 let word:=a+256*b+65536*c+16777216*d in
 s8_le_byte0 word=a /\ s8_le_byte1 word=b /\ s8_le_byte2 word=c /\ s8_le_byte3 word=d.
Proof.
 intros a b c d Ha Hb Hc Hd; cbn zeta; unfold s8_le_byte0,s8_le_byte1,s8_le_byte2,s8_le_byte3.
 assert (Hq1 : Z.quot (a+256*b+65536*c+16777216*d) 256=b+256*c+65536*d).
 { symmetry; apply (Z.quot_unique _ _ _ a); lia. }
 assert (Hq2 : Z.quot (a+256*b+65536*c+16777216*d) 65536=c+256*d).
 { symmetry; apply (Z.quot_unique _ _ _ (a+256*b)); lia. }
 assert (Hq3 : Z.quot (a+256*b+65536*c+16777216*d) 16777216=d).
 { symmetry; apply (Z.quot_unique _ _ _ (a+256*b+65536*c)); lia. }
 rewrite Hq1,Hq2,Hq3; repeat split.
 - replace (a+256*b+65536*c+16777216*d) with (a+256*(b+256*c+65536*d)) by ring.
   apply s8_low_byte_digit; lia.
 - replace (b+256*c+65536*d) with (b+256*(c+256*d)) by ring.
   apply s8_low_byte_digit; lia.
 - apply s8_low_byte_digit; lia.
 - apply unsigned_last_nbits_eq; change (0<=d<256);lia.
Qed.

Lemma byte_typed_field_address : forall (R:rvalue_expr)(t f:String.string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr R)(FET_alias t))f)) =
 eval_addr_expr(RE_addr_of(LE_arrow_field R f)).
Proof. intros; apply eval_addr_expr_congr; apply RE_addr_of_congr; apply LE_arrow_field_congr; [apply eval_addr|reflexivity]. Qed.
