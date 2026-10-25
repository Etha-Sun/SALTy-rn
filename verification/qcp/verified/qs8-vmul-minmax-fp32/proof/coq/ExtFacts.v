From Coq Require Import ZArith Lia.
From Qs8Mul Require Export IntrinsicModel.
Local Open Scope Z_scope.
Lemma qm_ext8_2_0 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 2 0=x2.
Proof. reflexivity. Qed.
Lemma qm_ext8_2_1 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 2 1=x3.
Proof. reflexivity. Qed.
Lemma qm_ext8_2_2 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 2 2=x4.
Proof. reflexivity. Qed.
Lemma qm_ext8_2_3 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 2 3=x5.
Proof. reflexivity. Qed.
Lemma qm_ext8_2_4 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 2 4=x6.
Proof. reflexivity. Qed.
Lemma qm_ext8_2_5 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 2 5=x7.
Proof. reflexivity. Qed.
Lemma qm_ext8_2_6 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 2 6=x0.
Proof. reflexivity. Qed.
Lemma qm_ext8_2_7 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 2 7=x1.
Proof. reflexivity. Qed.
Lemma qm_ext8_4_0 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 4 0=x4.
Proof. reflexivity. Qed.
Lemma qm_ext8_4_1 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 4 1=x5.
Proof. reflexivity. Qed.
Lemma qm_ext8_4_2 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 4 2=x6.
Proof. reflexivity. Qed.
Lemma qm_ext8_4_3 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 4 3=x7.
Proof. reflexivity. Qed.
Lemma qm_ext8_4_4 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 4 4=x0.
Proof. reflexivity. Qed.
Lemma qm_ext8_4_5 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 4 5=x1.
Proof. reflexivity. Qed.
Lemma qm_ext8_4_6 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 4 6=x2.
Proof. reflexivity. Qed.
Lemma qm_ext8_4_7 : forall x0 x1 x2 x3 x4 x5 x6 x7:Z, qm_ext8 x0 x1 x2 x3 x4 x5 x6 x7 4 7=x3.
Proof. reflexivity. Qed.
#[export] Hint Rewrite qm_ext8_2_0 qm_ext8_2_1 qm_ext8_2_2 qm_ext8_2_3 qm_ext8_2_4 qm_ext8_2_5 qm_ext8_2_6 qm_ext8_2_7 qm_ext8_4_0 qm_ext8_4_1 qm_ext8_4_2 qm_ext8_4_3 qm_ext8_4_4 qm_ext8_4_5 qm_ext8_4_6 qm_ext8_4_7 : qm_ext.
Lemma qm_ext_shift_domain : forall k:Z, (k-2)*(k-4)=0 <-> k=2 \/ k=4.
Proof. intros;split;intro H;[apply Z.mul_eq_0 in H;destruct H;[left|right];lia|destruct H;subst;reflexivity]. Qed.
Print Assumptions qm_ext_shift_domain.
