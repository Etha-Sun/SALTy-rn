From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Export NeonFacts ByteWindow ByteFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rs_byte_nth_range : forall base n A i,
 0<=i<n -> CharArray.full base n A |-- “-128<=Znth i A 0<=127”.
Proof.
 intros base n A i Hi.
 eapply derivable1_trans;[exact(byte_window_extract base i n A 0 Hi)|].
 unfold store_char;entailer!;change Byte.min_signed with (-128) in *;
 change Byte.max_signed with 127 in *;lia.
Qed.
Lemma rs_bytes_all_range : forall base n A,
 CharArray.full base n A |-- “forall i:Z,0<=i<n -> -128<=Znth i A 0<=127”.
Proof.
 intros base n A;unfold derivable1,coq_prop;intros h Hh i Hi.
 exact(rs_byte_nth_range base n A i Hi h Hh).
Qed.
Lemma rs_mul_s8_range : forall a b,-128<=rs_mul_s8 a b<=127.
Proof.
 intros;unfold rs_mul_s8;pose proof(signed_Lastnbits_range(a*b)8 ltac:(lia))as H;
 change(-128<=signed_last_nbits(a*b)8<128)in H;lia.
Qed.
Lemma rs_pair_s8_range : forall a x y,-32768<=rs_pair_s8 a x y<=32767.
Proof.
 intros;unfold rs_pair_s8,rs_s16;pose proof(signed_Lastnbits_range(a+x+y)16 ltac:(lia))as H;
 change(-32768<=signed_last_nbits(a+x+y)16<32768)in H;lia.
Qed.
Lemma rs_count16_bound : forall x,0<=x<=2048 -> 0<=rs_count16 x<=128.
Proof.
 intros x H;unfold rs_count16;split.
 - apply Z.div_pos;lia.
 - apply Z.div_le_upper_bound;lia.
Qed.
Lemma rs_count16_strict : forall x,0<=x<2048 -> 0<=rs_count16 x<128.
Proof.
 intros x H;unfold rs_count16;split.
 - apply Z.div_pos;lia.
 - apply Z.div_lt_upper_bound;lia.
Qed.
Print Assumptions rs_byte_nth_range.
Print Assumptions rs_bytes_all_range.
Print Assumptions rs_mul_s8_range.
Print Assumptions rs_pair_s8_range.
Print Assumptions rs_count16_bound.
Print Assumptions rs_count16_strict.
Lemma rs_rem2048_le : forall n,0<=n -> rs_rem2048 n<=n.
Proof. intros;unfold rs_rem2048;apply Z.mod_le;lia. Qed.
Print Assumptions rs_rem2048_le.
Ltac rs_neon_unroll :=
 unfold UndefStructPredint8x16_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t;
 rewrite ?local_field_address;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?Z.quot_1_r,?Z.div_1_r in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac rs_neon_math_facts :=
 try match goal with H:context[rs_count16 ?x] |- _ =>
  try match x with context[rs_rem2048 ?n] =>
   let Hrem:=fresh "Hremainder"in pose proof(rs_rem2048_bound n)as Hrem;
   let Hle:=fresh "Hremainder_le"in assert(Hle:rs_rem2048 n<=n)by(apply rs_rem2048_le;lia) end;
  let Hcount:=fresh "Hcount16"in
  assert(Hcount:0<=rs_count16 x<=128)by(apply rs_count16_bound;lia)
 end.
Ltac rs_array_facts_rec l :=
 lazymatch l with
 | nil => idtac
 | cons(norm_asrt(CharArray.full ?p ?n ?A)) ?tail =>
   prop_apply(rs_bytes_all_range p n A);
   let Hrange:=fresh "Hbyte_values"in Intros_p Hrange;
   rs_array_facts_rec tail
 | cons _ ?tail => rs_array_facts_rec tail
 end.
Ltac rs_neon_array_facts :=
 match goal with |- ?P |-- _ =>
 let leaves:=All_listasrts P in rs_array_facts_rec leaves end.
Ltac rs_neon_ranges_from q :=
 lazymatch q with
 | store_char ?p ?v=>let H:=fresh "Hchar"in prop_apply(store_char_range p v);Intros_p H;
   change Byte.min_signed with (-128) in H;change Byte.max_signed with 127 in H
 | store_short ?p ?v=>let H:=fresh "Hshort"in prop_apply(store_short_range p v);Intros_p H
 | store_int ?p ?v=>let H:=fresh "Hint"in prop_apply(store_int_range p v);Intros_p H;
   change Int.min_signed with (-2147483648) in H;change Int.max_signed with 2147483647 in H
 | sepcon ?a ?b=>rs_neon_ranges_from a;rs_neon_ranges_from b
 | andp ?a ?b=>rs_neon_ranges_from a;rs_neon_ranges_from b
 | _=>idtac end.
Ltac rs_neon_collect := lazymatch goal with |-?P|--_=>rs_neon_ranges_from P end.
Ltac rs_neon_arith :=
 first[assumption|reflexivity|lia|nia
 |match goal with
  | |- context[rs_mul_s8 ?a ?b] =>
    let H:=fresh "Hmul8"in pose proof(rs_mul_s8_range a b)as H;nia
  | |- context[rs_pair_s8 ?a ?x ?y] =>
    let H:=fresh "Hpair8"in pose proof(rs_pair_s8_range a x y)as H;nia
  | H:forall i:Z,0 <= i < ?n -> -128<=Znth i ?A 0<=127 |- context[Znth ?i ?A 0] =>
    let Hb:=fresh "Hbyte"in assert(Hb:-128<=Znth i A 0<=127)by(apply H;lia);nia
 end].
Ltac rs_neon_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|split|reflexivity];rs_neon_arith.
Ltac rs_neon_frame :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[rs_neon_pure]
 |solve[apply _derivable1_andp_intros;
 [rs_neon_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]].
Ltac rs_neon_simple :=
 intros;subst;rs_neon_unroll;rs_neon_math_facts;try rs_neon_array_facts;
 first[solve[rs_neon_frame]|solve[rs_neon_collect;rs_neon_frame]|solve[entailer!;try lia;try nia;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]].
