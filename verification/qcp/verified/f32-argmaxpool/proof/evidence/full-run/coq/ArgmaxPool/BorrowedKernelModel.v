From Coq Require Import ZArith.
From Flocq.IEEE754 Require Import Bits.
From ArgmaxPool Require Export RvvKernelModel NeonKernelModel.
(* This predicate is structural equality of the original binary32 datum,
   including NaN sign/payload/signaling bit. It is not IEEE compare equality. *)
Lemma apk_same_bits_exact:forall x y,ap_same_bits x y->x=y.
Proof. intros;exact H. Qed.
Lemma apk_same_bits_encoding:forall x y,ap_same_bits x y->bits_of_fp32 x=bits_of_fp32 y.
Proof. intros;apply apk_same_bits_exact in H;now subst y. Qed.
Lemma apk_fp32_bits_roundtrip:forall x,fp32_of_bits(bits_of_fp32 x)=x.
Proof.
 intros;unfold fp32_of_bits,bits_of_fp32,b32_of_bits,bits_of_b32.
 exact(binary_float_of_bits_of_binary_float 23 8 eq_refl eq_refl eq_refl x).
Qed.
Lemma apk_neon_select_payload:forall m a b r,
 ap_same_bits r(ap_select_f32 m a b)->
 r=ap_select_f32 m a b /\
 bits_of_fp32 r=bits_of_fp32(ap_select_f32 m a b) /\
 fp32_of_bits(bits_of_fp32 r)=ap_select_f32 m a b.
Proof.
 intros;apply apk_same_bits_exact in H;subst r.
 split;[reflexivity|split;[reflexivity|apply apk_fp32_bits_roundtrip]].
Qed.
Print Assumptions apk_same_bits_exact.
Print Assumptions apk_same_bits_encoding.
Print Assumptions apk_fp32_bits_roundtrip.
Print Assumptions apk_neon_select_payload.
