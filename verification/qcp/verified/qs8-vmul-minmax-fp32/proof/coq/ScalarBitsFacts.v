From Coq Require Import ZArith Lia.
From Qs8Mul Require Export Model Bits NanFacts ArithmeticFacts ScalarCompareFacts.
Local Open Scope Z_scope.
Definition qm_copy_fp32(x:fp32):fp32:=x.
Definition qm_extract_i32(F:Z -> Z):Z:=F 0.
Lemma qm_signed_mask31 : forall u,0<=u<4294967296 ->
 Z.land(qm_signed_bits u)2147483647=Z.land u 2147483647.
Proof.
 intros u Hu;unfold qm_signed_bits;destruct(Z.ltb u 2147483648)eqn:E;[reflexivity|].
 change 2147483647 with (Z.ones 31).
 rewrite !Z.land_ones by lia.
 rewrite Zminus_mod.
 replace (4294967296 mod 2^31) with 0 by (vm_compute;reflexivity).
 rewrite Z.sub_0_r,Z.mod_mod by lia;reflexivity.
Qed.
Lemma qm_integer_nan_classifier : forall scale,
 qm_ne scale scale =
 if Z.ltb 2139095040 (Z.land(qm_signed_bits(bits_of_fp32 scale))2147483647) then 1 else 0.
Proof.
 intro scale;rewrite qm_signed_mask31 by (pose proof(fp32_bits_range scale);lia).
 rewrite qm_self_ne;unfold qm_nan_bits,qm_abs_bits;reflexivity.
Qed.
Lemma qm_checked_nan_branch : forall scale result,
 result=qm_ne scale scale -> (result<>0 <-> fp32_ne scale scale).
Proof.
 intros scale result Hr;rewrite Hr,qm_scalar_nan_branch.
 pose proof(qm_nan_cases(bits_of_fp32 scale))as H;rewrite <-qm_self_ne in H;destruct H;lia.
Qed.
Lemma qm_valid_qnan_self_ne : fp32_ne(fp32_of_bits 2143289344)(fp32_of_bits 2143289344).
Proof.
 apply(proj2(qm_scalar_self_ne_is_nan _)).
 apply(proj1(qm_nan_fp32 _)).
 rewrite bits_of_fp32_of_bits by lia;vm_compute;reflexivity.
Qed.
Lemma qm_self_ne_cannot_be_rejected :
 ~(forall x:fp32,fp32_ne x x -> False).
Proof. intro H;exact(H _ qm_valid_qnan_self_ne). Qed.
Print Assumptions qm_signed_mask31.
Print Assumptions qm_integer_nan_classifier.
Print Assumptions qm_checked_nan_branch.
Print Assumptions qm_valid_qnan_self_ne.
Print Assumptions qm_self_ne_cannot_be_rejected.
