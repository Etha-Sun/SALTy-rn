From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export LoopFacts.
Local Open Scope Z_scope.
Lemma spmm_self_compare : forall x:fp32,
 fp32_compare x x=if Binary.is_nan 24 128 x then None else Some Datatypes.Eq.
Proof.
 intros x;unfold fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare.
 destruct x as[s|s|s p H|s m e H];
 cbn [Binary.B2BSN BinarySingleNaN.B2SF Binary.is_nan SpecFloat.SFcompare];try reflexivity.
 - destruct s;reflexivity.
 - destruct s;cbn [SpecFloat.SFcompare];rewrite Z.compare_refl,Pos.compare_refl;reflexivity.
Qed.
Lemma spmm_ne_self_nan : forall x:fp32,fp32_ne x x -> Binary.is_nan 24 128 x=true.
Proof. intros x H;unfold fp32_ne in H;rewrite spmm_self_compare in H;destruct(Binary.is_nan 24 128 x);auto;contradiction. Qed.
Lemma spmm_eq_self_not_nan : forall x:fp32,fp32_eq x x -> Binary.is_nan 24 128 x=false.
Proof. intros x H;unfold fp32_eq in H;rewrite spmm_self_compare in H;destruct(Binary.is_nan 24 128 x);auto;discriminate. Qed.
Print Assumptions spmm_self_compare.
Print Assumptions spmm_ne_self_nan.
Print Assumptions spmm_eq_self_not_nan.
