From Coq Require Import ZArith Bool.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import Binary BinarySingleNaN.
From GemmSpec Require Import FmaModel IntrinsicModel.
Local Open Scope Z_scope.

(* Unordered-or-not-equal: NaN is unordered, hence x!=x exactly detects NaN.
   This is the value semantics of vmfne(v,v) and scalar bound!=bound. *)
Definition repair_une (a b:fp32):bool :=
 match fp32_compare a b with Some Eq=>false|_=>true end.
Definition repair_merge (base inserted:fp32)(mask:bool):fp32 :=
 if mask then inserted else base.
Definition repaired_min_using (replacement x hi:fp32):fp32 :=
 if repair_une hi hi then replacement else
 let mask:=repair_une x x in
 let computed:=fp32_min_number x hi in
 repair_merge computed replacement mask.
Definition repaired_max_using (replacement x lo:fp32):fp32 :=
 if repair_une lo lo then replacement else
 let mask:=repair_une x x in
 let computed:=fp32_max_number x lo in
 repair_merge computed replacement mask.
Definition repaired_clamp_using (replacement x lo hi:fp32):fp32 :=
 repaired_max_using replacement(repaired_min_using replacement x hi)lo.
Definition repaired_clamp:=repaired_clamp_using canonical_qnan.

Lemma repair_une_self_is_nan : forall x:fp32,
 repair_une x x=Binary.is_nan 24 128 x.
Proof.
 intros x;unfold repair_une,fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare.
 destruct x as[s|s|s p H|s m e H];
  cbn [Binary.B2BSN BinarySingleNaN.B2SF Binary.is_nan SpecFloat.SFcompare];
  try reflexivity.
 - destruct s;reflexivity.
 - destruct s;cbn [SpecFloat.SFcompare];rewrite Z.compare_refl;
   rewrite Pos.compare_refl;reflexivity.
Qed.
Lemma canonical_qnan_is_nan : Binary.is_nan 24 128 canonical_qnan=true.
Proof. reflexivity. Qed.

Lemma repaired_min_mask_form : forall replacement x hi,
 repaired_min_using replacement x hi=
 if orb(Binary.is_nan 24 128 x)(Binary.is_nan 24 128 hi)
 then replacement else fp32_min_number x hi.
Proof.
 intros;unfold repaired_min_using,repair_merge;rewrite !repair_une_self_is_nan.
 destruct(Binary.is_nan 24 128 x),(Binary.is_nan 24 128 hi);reflexivity.
Qed.
Lemma repaired_max_mask_form : forall replacement x lo,
 repaired_max_using replacement x lo=
 if orb(Binary.is_nan 24 128 x)(Binary.is_nan 24 128 lo)
 then replacement else fp32_max_number x lo.
Proof.
 intros;unfold repaired_max_using,repair_merge;rewrite !repair_une_self_is_nan.
 destruct(Binary.is_nan 24 128 x),(Binary.is_nan 24 128 lo);reflexivity.
Qed.
Lemma repaired_min_matches_neon : forall x hi,
 repaired_min_using canonical_qnan x hi=fp32_neon_min x hi.
Proof. intros;rewrite repaired_min_mask_form;reflexivity. Qed.
Lemma repaired_max_matches_neon : forall x lo,
 repaired_max_using canonical_qnan x lo=fp32_neon_max x lo.
Proof. intros;rewrite repaired_max_mask_form;reflexivity. Qed.
Theorem repaired_clamp_matches_neon : forall x lo hi:fp32,
 repaired_clamp x lo hi=neon_clamp x lo hi.
Proof.
 intros;unfold repaired_clamp,repaired_clamp_using,neon_clamp.
 now rewrite repaired_min_matches_neon,repaired_max_matches_neon.
Qed.
Theorem repaired_clamp_bits_match : forall x lo hi:fp32,
 bits_of_fp32(repaired_clamp x lo hi)=bits_of_fp32(neon_clamp x lo hi).
Proof. intros;now rewrite repaired_clamp_matches_neon. Qed.

(* Stronger-than-requested output observation: exact identity outside NaNs.
   The existing kernel observation also identifies +/-0. *)
Definition repair_observed (a b:fp32):Prop :=
 a=b\/(Binary.is_nan 24 128 a=true /\ Binary.is_nan 24 128 b=true).
Lemma repaired_max_any_nan_choice : forall replacement x lo,
 Binary.is_nan 24 128 replacement=true ->
 repair_observed(repaired_max_using replacement x lo)(fp32_neon_max x lo).
Proof.
 intros replacement x lo Hn;rewrite repaired_max_mask_form;unfold fp32_neon_max.
 destruct(orb(Binary.is_nan 24 128 x)(Binary.is_nan 24 128 lo));
  unfold repair_observed;[right;split;[assumption|exact canonical_qnan_is_nan]|left;reflexivity].
Qed.
Theorem repaired_clamp_any_nan_choice_observed : forall replacement x lo hi,
 Binary.is_nan 24 128 replacement=true ->
 repair_observed(repaired_clamp_using replacement x lo hi)(neon_clamp x lo hi).
Proof.
 intros replacement x lo hi Hn;unfold repaired_clamp_using,neon_clamp.
 rewrite repaired_min_mask_form;unfold fp32_neon_min.
 destruct(orb(Binary.is_nan 24 128 x)(Binary.is_nan 24 128 hi)).
 - rewrite repaired_max_mask_form;unfold fp32_neon_max.
   rewrite Hn,canonical_qnan_is_nan;cbn;unfold repair_observed;right;split;assumption||reflexivity.
 - now apply repaired_max_any_nan_choice.
Qed.

Print Assumptions repair_une_self_is_nan.
Print Assumptions canonical_qnan_is_nan.
Print Assumptions repaired_min_mask_form.
Print Assumptions repaired_max_mask_form.
Print Assumptions repaired_min_matches_neon.
Print Assumptions repaired_max_matches_neon.
Print Assumptions repaired_clamp_matches_neon.
Print Assumptions repaired_clamp_bits_match.
Print Assumptions repaired_max_any_nan_choice.
Print Assumptions repaired_clamp_any_nan_choice_observed.
