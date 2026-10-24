From Coq Require Import ZArith Lia Reals.
From compcert.lib Require Import Integers.
From Flocq.IEEE754 Require Import Bits.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition same_bits (x y:fp32) : Prop := x=y.
Definition word32 (u b0 b1 b2 b3:Z) : Prop :=
 u=b0+256*b1+65536*b2+16777216*b3.

Lemma fp32_bits_range : forall v, 0 <= bits_of_fp32 v <= 4294967295.
Proof.
 intros v. pose proof (bits_of_float_value_range v (bits_of_fp32 v) eq_refl).
 change Int.max_unsigned with 4294967295 in H. exact H.
Qed.
Lemma fp32_of_bits_of_fp32 : forall v, fp32_of_bits(bits_of_fp32 v)=v.
Proof.
 intros v. unfold fp32_of_bits,bits_of_fp32,b32_of_bits,bits_of_b32.
 exact (@binary_float_of_bits_of_binary_float 23 8 eq_refl eq_refl eq_refl v).
Qed.
Lemma bits_of_fp32_of_bits : forall u, 0<=u<=4294967295 -> bits_of_fp32(fp32_of_bits u)=u.
Proof.
 intros u Hu. unfold fp32_of_bits,bits_of_fp32,b32_of_bits,bits_of_b32.
 apply bits_of_binary_float_of_bits. change (0<=u<4294967296). lia.
Qed.
Lemma store_float_uint : forall p v,
 store_float p v --||-- store_uint p (bits_of_fp32 v).
Proof.
 intros p v. unfold store_float,bits_of_float_value,store_uint,isvalidptr_float,isvalidptr_int.
 split; entailer!.
Qed.

Lemma float_bytes : forall p v,
 store_float p v |-- EX b0 b1 b2 b3:Z,
  “ aligned_4 p /\ word32(bits_of_fp32 v) b0 b1 b2 b3 ” &&
  store_uchar p b0 ** store_uchar (p+1) b1 ** store_uchar (p+2) b2 ** store_uchar (p+3) b3.
Proof.
 intros p v. unfold store_float,bits_of_float_value,store_4byte.
 Intros b0 b1 b2 b3.
 Exists (b0 mod 256) (b1 mod 256) (b2 mod 256) (b3 mod 256).
 unfold store_uchar.
 pose proof (Z.mod_pos_bound b0 256 ltac:(lia)).
 pose proof (Z.mod_pos_bound b1 256 ltac:(lia)).
 pose proof (Z.mod_pos_bound b2 256 ltac:(lia)).
 pose proof (Z.mod_pos_bound b3 256 ltac:(lia)).
 unfold word32,merge_int,LittleEndian.merge_int in *.
 change Byte.max_unsigned with 255.
 unfold isvalidptr_float,isvalidptr_char in *.
 change ((p>=0 /\ p+3<=addr_max_unsigned /\ aligned_4 p) /\ 0<=bits_of_fp32 v<=4294967295) in H.
 change (bits_of_fp32 v mod 4294967296 = b0 mod 256 + b1 mod 256 *256 + b2 mod 256 *65536 + b3 mod 256 *16777216) in H0.
 rewrite Z.mod_small in H0 by lia.
 sep_apply (store_byte_cast' p b0).
 sep_apply (store_byte_cast' (p+1) b1).
 sep_apply (store_byte_cast' (p+2) b2).
 sep_apply (store_byte_cast' (p+3) b3).
 unfold unsigned_last_nbits. change (2^8) with 256.
 entailer!; lia.
Qed.
Print Assumptions fp32_of_bits_of_fp32.
Print Assumptions bits_of_fp32_of_bits.
Print Assumptions float_bytes.

Lemma uint_bytes : forall p u,
 store_uint p u |-- EX b0 b1 b2 b3:Z,
  “ aligned_4 p /\ word32 u b0 b1 b2 b3 ” &&
  store_uchar p b0 ** store_uchar (p+1) b1 ** store_uchar (p+2) b2 ** store_uchar (p+3) b3.
Proof.
 intros p u. unfold store_uint,store_4byte.
 Intros b0 b1 b2 b3.
 Exists (b0 mod 256) (b1 mod 256) (b2 mod 256) (b3 mod 256).
 unfold store_uchar.
 pose proof (Z.mod_pos_bound b0 256 ltac:(lia)).
 pose proof (Z.mod_pos_bound b1 256 ltac:(lia)).
 pose proof (Z.mod_pos_bound b2 256 ltac:(lia)).
 pose proof (Z.mod_pos_bound b3 256 ltac:(lia)).
 unfold word32,merge_int,LittleEndian.merge_int in *.
 change Byte.max_unsigned with 255.
 unfold isvalidptr_int,isvalidptr_char in *.
 change ((p>=0 /\ p+3<=addr_max_unsigned /\ aligned_4 p) /\ u>=0 /\ u<=4294967295) in H.
 change (u mod 4294967296 = b0 mod 256 + b1 mod 256 *256 + b2 mod 256 *65536 + b3 mod 256 *16777216) in H0.
 rewrite Z.mod_small in H0 by lia.
 sep_apply (store_byte_cast' p b0).
 sep_apply (store_byte_cast' (p+1) b1).
 sep_apply (store_byte_cast' (p+2) b2).
 sep_apply (store_byte_cast' (p+3) b3).
 unfold unsigned_last_nbits. change (2^8) with 256.
 entailer!; lia.
Qed.

Lemma bytes_uint : forall p u b0 b1 b2 b3,
 aligned_4 p -> word32 u b0 b1 b2 b3 ->
 store_uchar p b0 ** store_uchar (p+1) b1 ** store_uchar (p+2) b2 ** store_uchar (p+3) b3 |-- store_uint p u.
Proof.
 intros p u b0 b1 b2 b3 Halign Hword.
 unfold store_uchar. Intros.
 unfold store_uint,store_4byte. Exists b0 b1 b2 b3.
 unfold isvalidptr_int,isvalidptr_char in *.
 change Byte.max_unsigned with 255 in *.
 change Int.max_unsigned with 4294967295.
 unfold word32 in Hword.
 entailer!; try lia.
 unfold merge_int,LittleEndian.merge_int.
 change (u mod 4294967296=b0 mod 256+b1 mod 256*256+b2 mod 256*65536+b3 mod 256*16777216).
 repeat rewrite Z.mod_small by lia. lia.
Qed.

Lemma bytes_float : forall p v b0 b1 b2 b3,
 aligned_4 p -> word32 (bits_of_fp32 v) b0 b1 b2 b3 ->
 store_uchar p b0 ** store_uchar (p+1) b1 ** store_uchar (p+2) b2 ** store_uchar (p+3) b3 |-- store_float p v.
Proof.
 intros p v b0 b1 b2 b3 Ha Hw.
 eapply derivable1_trans; [apply (bytes_uint p (bits_of_fp32 v) b0 b1 b2 b3 Ha Hw)|].
 apply (proj2 (store_float_uint p v)).
Qed.

Lemma bytes_float_of_bits : forall p u b0 b1 b2 b3,
 aligned_4 p -> word32 u b0 b1 b2 b3 ->
 store_uchar p b0 ** store_uchar (p+1) b1 ** store_uchar (p+2) b2 ** store_uchar (p+3) b3 |-- store_float p (fp32_of_bits u).
Proof.
 intros p u b0 b1 b2 b3 Ha Hw.
 sep_apply (bytes_uint p u b0 b1 b2 b3 Ha Hw).
 prop_apply (store_uint_range p u). Intros.
 rewrite <- (bits_of_fp32_of_bits u ltac:(change Int.max_unsigned with 4294967295 in *; lia)) at 1.
 apply (proj2 (store_float_uint p (fp32_of_bits u))).
Qed.

Lemma undef_float_bytes : forall p,
 undef_store_float p |-- “ aligned_4 p ” &&
 undef_store_uchar p ** undef_store_uchar (p+1) ** undef_store_uchar (p+2) ** undef_store_uchar (p+3).
Proof.
 intros p. unfold undef_store_float,store_4byte_noninit,undef_store_uchar.
 unfold isvalidptr_float,isvalidptr_char. Intros. entailer!; lia.
Qed.
