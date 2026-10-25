From Coq Require Import ZArith Lia.
From Flocq.IEEE754 Require Import Binary.
From Flocq.Core Require Import Raux.
From DwChw Require Export VectorModel.
Local Open Scope Z_scope.
Lemma dw_fp_match_active : forall i vl x y,
 i<vl -> dw_fp_match i vl x y -> x=y.
Proof. unfold dw_fp_match;intros;destruct H0;[lia|assumption]. Qed.
Lemma dw_ne_self_nan : forall x,
 dw_ne_value x x=dw_rvv_nanmask x.
Proof.
 intro x;destruct x as[s|s|s p Hp|s m e Hv];
 unfold dw_ne_value,dw_rvv_nanmask,dw_nan,fp32_compare.
 - destruct s;reflexivity.
 - destruct s;reflexivity.
 - reflexivity.
 - rewrite Binary.Bcompare_correct by reflexivity.
   rewrite Rcompare_Eq by reflexivity;reflexivity.
Qed.
Lemma dw_mask_self_active : forall vl m A i,
 dw_mask_matches vl m A A -> 0<=i<vl ->
 dw_mask_bit m i=dw_rvv_nanmask(A i).
Proof. intros vl m A i H Hi;rewrite H by exact Hi;apply dw_ne_self_nan. Qed.
Lemma dw_fp8_at_0 : forall x0 x1 x2 x3 x4 x5 x6 x7:fp32, dw_fp8 x0 x1 x2 x3 x4 x5 x6 x7 0=x0.
Proof. reflexivity. Qed.
Lemma dw_fp8_at_1 : forall x0 x1 x2 x3 x4 x5 x6 x7:fp32, dw_fp8 x0 x1 x2 x3 x4 x5 x6 x7 1=x1.
Proof. reflexivity. Qed.
Lemma dw_fp8_at_2 : forall x0 x1 x2 x3 x4 x5 x6 x7:fp32, dw_fp8 x0 x1 x2 x3 x4 x5 x6 x7 2=x2.
Proof. reflexivity. Qed.
Lemma dw_fp8_at_3 : forall x0 x1 x2 x3 x4 x5 x6 x7:fp32, dw_fp8 x0 x1 x2 x3 x4 x5 x6 x7 3=x3.
Proof. reflexivity. Qed.
Lemma dw_fp8_at_4 : forall x0 x1 x2 x3 x4 x5 x6 x7:fp32, dw_fp8 x0 x1 x2 x3 x4 x5 x6 x7 4=x4.
Proof. reflexivity. Qed.
Lemma dw_fp8_at_5 : forall x0 x1 x2 x3 x4 x5 x6 x7:fp32, dw_fp8 x0 x1 x2 x3 x4 x5 x6 x7 5=x5.
Proof. reflexivity. Qed.
Lemma dw_fp8_at_6 : forall x0 x1 x2 x3 x4 x5 x6 x7:fp32, dw_fp8 x0 x1 x2 x3 x4 x5 x6 x7 6=x6.
Proof. reflexivity. Qed.
Lemma dw_fp8_at_7 : forall x0 x1 x2 x3 x4 x5 x6 x7:fp32, dw_fp8 x0 x1 x2 x3 x4 x5 x6 x7 7=x7.
Proof. reflexivity. Qed.
#[export] Hint Rewrite dw_fp8_at_0 dw_fp8_at_1 dw_fp8_at_2 dw_fp8_at_3 dw_fp8_at_4 dw_fp8_at_5 dw_fp8_at_6 dw_fp8_at_7 : dw_fields.
Print Assumptions dw_fp_match_active.
Print Assumptions dw_ne_self_nan.
Print Assumptions dw_mask_self_active.
Print Assumptions dw_fp8_at_0.
Print Assumptions dw_fp8_at_1.
Print Assumptions dw_fp8_at_2.
Print Assumptions dw_fp8_at_3.
Print Assumptions dw_fp8_at_4.
Print Assumptions dw_fp8_at_5.
Print Assumptions dw_fp8_at_6.
Print Assumptions dw_fp8_at_7.
