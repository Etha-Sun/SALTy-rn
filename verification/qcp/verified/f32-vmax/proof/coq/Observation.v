From Coq Require Import ZArith Lia List Bool.
From Flocq.IEEE754 Require Import Binary.
From Flocq.Core Require Import Raux.
From FMax Require Import ProgramModel NanFacts.
From NanBridge Require Import BridgeLogic.
Local Open Scope Z_scope.

Lemma mm_self_ne : forall a,
 mm_rvv_ne a a = mm_nan_bits (bits_of_fp32 a).
Proof.
 intro a. unfold mm_rvv_ne.
 destruct (mm_nan_cases (bits_of_fp32 a)) as [H|H]; rewrite H; cbn.
 - rewrite Z.eqb_refl. destruct (Z.eqb (mm_abs_bits (bits_of_fp32 a)) 0); reflexivity.
 - reflexivity.
Qed.
Lemma mm_snan_zero : forall u, mm_nan_bits u=0 -> mm_snan_bits u=0.
Proof. intros u H. unfold mm_snan_bits. rewrite H. reflexivity. Qed.
Lemma mm_arm_nan : forall a b,
 mm_nan_bits (bits_of_fp32 a)=1 \/ mm_nan_bits (bits_of_fp32 b)=1 ->
 fp32_isNaN (mm_arm a b).
Proof.
 intros a b H. unfold mm_arm,mm_arm_bits.
 destruct (Z.eqb_spec (mm_snan_bits (bits_of_fp32 a)) 1) as [Ha|Ha].
 - apply mm_nan_decode,mm_quiet_preserves_nan,mm_snan_implies_nan; assumption.
 - destruct (Z.eqb_spec (mm_snan_bits (bits_of_fp32 b)) 1) as [Hb|Hb].
   + apply mm_nan_decode,mm_quiet_preserves_nan,mm_snan_implies_nan; assumption.
   + destruct (Z.eqb_spec (mm_nan_bits (bits_of_fp32 a)) 1) as [Hna|Hna].
     * apply mm_nan_decode;assumption.
     * destruct H as [H|H]; [contradiction|rewrite H;cbn].
       apply mm_nan_decode;assumption.
Qed.
Lemma mm_repaired_nan : forall a b,
 mm_nan_bits (bits_of_fp32 a)=1 \/ mm_nan_bits (bits_of_fp32 b)=1 ->
 mm_repaired a b=mm_canonical_nan.
Proof.
 intros a b H. unfold mm_repaired. rewrite !mm_self_ne.
 unfold mm_rvv_add.
 destruct (mm_nan_cases (bits_of_fp32 a)) as [Ha|Ha];
 destruct (mm_nan_cases (bits_of_fp32 b)) as [Hb|Hb];
 rewrite Ha,Hb;cbn;try reflexivity.
 destruct H;congruence.
Qed.
Lemma mm_non_nan_equal : forall a b,
 mm_nan_bits (bits_of_fp32 a)=0 -> mm_nan_bits (bits_of_fp32 b)=0 ->
 mm_arm a b=mm_repaired a b.
Proof.
 intros a b Ha Hb. unfold mm_repaired. rewrite !mm_self_ne,Ha,Hb;cbn.
 unfold mm_arm,mm_rvv,mm_arm_bits,mm_rvv_bits.
 rewrite (mm_snan_zero _ Ha),(mm_snan_zero _ Hb),Ha,Hb. reflexivity.
Qed.
Lemma mm_same_value_refl : forall a, same_value a a.
Proof.
 intro a. destruct a as [s|s|s p H|s m e H].
 - left; unfold fp32_eq,fp32_compare;destruct s;reflexivity.
 - left; unfold fp32_eq,fp32_compare;destruct s;reflexivity.
 - right;split;reflexivity.
 - left. unfold fp32_eq,fp32_compare.
   rewrite Binary.Bcompare_correct by reflexivity.
   rewrite Rcompare_Eq by reflexivity. reflexivity.
Qed.
Lemma mm_pointwise_observation : forall a b,
 same_value (mm_arm a b) (mm_repaired a b).
Proof.
 intros a b.
 destruct (mm_nan_cases (bits_of_fp32 a)) as [Ha|Ha];
 destruct (mm_nan_cases (bits_of_fp32 b)) as [Hb|Hb].
 - rewrite (mm_non_nan_equal a b Ha Hb). apply mm_same_value_refl.
 - right;split;[apply mm_arm_nan|rewrite mm_repaired_nan;[apply mm_canonical_is_nan|]];auto.
 - right;split;[apply mm_arm_nan|rewrite mm_repaired_nan;[apply mm_canonical_is_nan|]];auto.
 - right;split;[apply mm_arm_nan|rewrite mm_repaired_nan;[apply mm_canonical_is_nan|]];auto.
Qed.
Lemma mm_list_observation : forall n a b,
 Forall2 same_value (mm_arm_values n a b) (mm_rvv_values n a b).
Proof.
 intros n a b. unfold mm_arm_values,mm_rvv_values.
 generalize (Z.to_nat n),(combine a b). intros k l.
 revert k;induction l as [|[x y] l IH];intros k;destruct k;cbn;constructor;auto.
 apply mm_pointwise_observation.
Qed.
Print Assumptions mm_pointwise_observation.
Print Assumptions mm_list_observation.
