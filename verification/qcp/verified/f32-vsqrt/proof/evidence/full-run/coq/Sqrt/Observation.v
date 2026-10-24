From Coq Require Import ZArith Lia Bool List.
From Flocq.IEEE754 Require Import Binary.
From Sqrt Require Import Model Bits NanFacts.
Local Open Scope Z_scope.
Lemma sqrt_lor_word : forall u q,
 0<=u<=4294967295 -> 0<=q<=4294967295 -> 0<=Z.lor u q<=4294967295.
Proof.
 intros u q Hu Hq.
 assert (Hmask : Z.land (Z.lor u q) 4294967295 = Z.lor u q).
 { rewrite Z.land_lor_distr_l.
   replace 4294967295 with (Z.ones 32) by reflexivity.
   rewrite !Z.land_ones by lia.
   change (Z.lor (u mod 4294967296) (q mod 4294967296)=Z.lor u q).
   rewrite !Z.mod_small by lia. reflexivity. }
 replace 4294967295 with (Z.ones 32) in Hmask by reflexivity.
 rewrite Z.land_ones in Hmask by lia.
 change (Z.lor u q mod 4294967296=Z.lor u q) in Hmask.
 pose proof (Z.mod_pos_bound (Z.lor u q) 4294967296 ltac:(lia)). lia.
Qed.
Lemma sqrt_quiet_bits : forall x,
 bits_of_fp32 (sqrt_quiet x)=Z.lor (bits_of_fp32 x) 4194304.
Proof. intro x;unfold sqrt_quiet;apply bits_of_fp32_of_bits.
 apply sqrt_lor_word;[apply fp32_bits_range|lia]. Qed.
Lemma sqrt_quiet_nan : forall x,
 fp32_isNaN x -> fp32_isNaN (sqrt_quiet x).
Proof.
 intros x H;apply (proj1(sqrt_nan_fp32 _));rewrite sqrt_quiet_bits.
 apply sqrt_quiet_preserves_nan;apply (proj2(sqrt_nan_fp32 _));assumption.
Qed.
Lemma sqrt_core_nan : forall x, fp32_isNaN x -> fp32_isNaN (sqrt_core x).
Proof.
 intros x H;destruct x;cbn in H;try discriminate.
 unfold sqrt_core,Binary.Bsqrt,fp32_isNaN;reflexivity.
Qed.
Lemma sqrt_same_value_reflexive : forall x, sqrt_same_value x x.
Proof.
 intros x. destruct x as [s|s|s payload|s m e Hvalid].
 - left;destruct s;reflexivity.
 - left;destruct s;reflexivity.
 - right;split;reflexivity.
 - left;destruct s;unfold fp32_eq,fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare;simpl;
   rewrite Z.compare_refl,Pos.compare_cont_refl;reflexivity.
Qed.
Lemma sqrt_cross_isa : forall x, sqrt_same_value (sqrt_arm x)(sqrt_rvv x).
Proof.
 intro x;unfold sqrt_arm.
 destruct(Z.eqb_spec(sqrt_nan_bits(bits_of_fp32 x))1)as[Hnan|Hnot].
 - assert(Hx:fp32_isNaN x)by(apply(proj1(sqrt_nan_fp32 x));assumption).
   pose proof(sqrt_core_nan x Hx)as Hcore;unfold fp32_isNaN in Hcore.
   unfold sqrt_rvv;rewrite Hcore;right;split.
   + apply sqrt_quiet_nan;assumption.
   + exact sqrt_canonical_is_nan.
 - fold(sqrt_rvv x);apply sqrt_same_value_reflexive.
Qed.
Lemma sqrt_prefix_related : forall n a,
 sqrt_outputs_related (sqrt_arm_values n a)(sqrt_rvv_values n a).
Proof.
 intros n a;unfold sqrt_outputs_related,sqrt_arm_values,sqrt_rvv_values.
 generalize(Z.to_nat n);induction a as[|x xs IH];intros k;destruct k;simpl;constructor;auto using sqrt_cross_isa.
Qed.
Print Assumptions sqrt_cross_isa.
Print Assumptions sqrt_prefix_related.
