From Coq Require Import ZArith Lia.
From Qs8Mul Require Import Model.
Local Open Scope Z_scope.

Lemma qm_clip_identity:forall lo hi x,lo<=x<=hi -> qm_clip lo hi x=x.
Proof. intros;unfold qm_clip;rewrite Z.min_r,Z.max_r by lia;reflexivity. Qed.
Lemma qm_clip_above:forall lo hi x,lo<=hi -> hi<=x -> qm_clip lo hi x=hi.
Proof. intros;unfold qm_clip;rewrite Z.min_l,Z.max_r by lia;reflexivity. Qed.
Lemma qm_clip_below:forall lo hi x,lo<=hi -> x<=lo -> qm_clip lo hi x=lo.
Proof. intros;unfold qm_clip;rewrite Z.min_r,Z.max_l by lia;reflexivity. Qed.

(* All NaN payloads of either sign and every signed16 zero point. The output
   clamp deliberately retains min-after-max order even for unordered bounds. *)
Lemma qm_positive_nan_quantization:forall u oz lo hi,
 2139095040<u<=2147483647 -> -32768<=oz<=32767 ->
 qm_quant_bits u oz lo hi=Z.min(Z.max 127 lo)hi.
Proof.
 intros u oz lo hi Hu Hz;unfold qm_quant_bits,qm_signed_bits.
 destruct(Z.ltb_spec u 2147483648);[|lia].
 unfold qm_sat32,qm_sat16,qm_sat8.
 rewrite (qm_clip_identity _ _ (u-(1262485504-oz))) by lia.
 rewrite (qm_clip_above (-32768)32767 _) by lia.
 rewrite qm_clip_above by lia;reflexivity.
Qed.
Lemma qm_negative_nan_quantization:forall u oz lo hi,
 4286578688<u<=4294967295 -> -32768<=oz<=32767 ->
 qm_quant_bits u oz lo hi=Z.min(Z.max (-128)lo)hi.
Proof.
 intros u oz lo hi Hu Hz;unfold qm_quant_bits,qm_signed_bits.
 destruct(Z.ltb_spec u 2147483648);[lia|].
 unfold qm_sat32,qm_sat16,qm_sat8.
 rewrite (qm_clip_identity _ _ (u-4294967296-(1262485504-oz))) by lia.
 rewrite (qm_clip_below (-32768)32767 _) by lia.
 rewrite qm_clip_below by lia;reflexivity.
Qed.
Lemma qm_quantization_preserves_only_nan_sign:forall u v oz lo hi,
 -32768<=oz<=32767 ->
 ((2139095040<u<=2147483647 /\ 2139095040<v<=2147483647) \/
  (4286578688<u<=4294967295 /\ 4286578688<v<=4294967295)) ->
 qm_quant_bits u oz lo hi=qm_quant_bits v oz lo hi.
Proof.
 intros u v oz lo hi Hz [[Hu Hv]|[Hu Hv]].
 - rewrite !qm_positive_nan_quantization by assumption;reflexivity.
 - rewrite !qm_negative_nan_quantization by assumption;reflexivity.
Qed.
Lemma qm_restore_negative_nan:forall u oz lo hi,
 4286578688<u<=4294967295 -> -32768<=oz<=32767 ->
 qm_quant_bits u oz lo hi=qm_quant_bits 4290772992 oz lo hi.
Proof.
 intros;apply qm_quantization_preserves_only_nan_sign;[assumption|].
 right;split;lia.
Qed.
Lemma qm_integer_product_range:forall a b az bz,
 -128<=a<=127 -> -128<=b<=127 -> -128<=az<=127 -> -128<=bz<=127 ->
 -65025<=(a-az)*(b-bz)<=65025.
Proof. intros;nia. Qed.
Lemma qm_vl_progress:forall avl vl,0<avl -> qm_vl_allowed avl vl ->
 0<vl /\ vl<=avl /\ vl<=32.
Proof.
 intros avl vl Ha H;unfold qm_vl_allowed in H.
 destruct H as [[H ->]|[[H Hv]|[H ->]]];try lia.
 pose proof(Z.div_le_lower_bound(avl+1)2 1 ltac:(lia)ltac:(lia));lia.
Qed.

Print Assumptions qm_clip_identity.
Print Assumptions qm_clip_above.
Print Assumptions qm_clip_below.
Print Assumptions qm_positive_nan_quantization.
Print Assumptions qm_negative_nan_quantization.
Print Assumptions qm_quantization_preserves_only_nan_sign.
Print Assumptions qm_restore_negative_nan.
Print Assumptions qm_integer_product_range.
Print Assumptions qm_vl_progress.
