From Coq Require Import ZArith List.
From FullDomainRvv Require Import FullState ActiveVector.
Local Open Scope Z_scope.
Definition row_acc_values (A W:list fp32)(k row b d vl:Z) (z0 z1 z2 z3 z4 z5 z6 z7:fp32) : Prop :=
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (full_acc A W k row b 0 d) (full_acc A W k row b 1 d) (full_acc A W k row b 2 d) (full_acc A W k row b 3 d) (full_acc A W k row b 4 d) (full_acc A W k row b 5 d) (full_acc A W k row b 6 d) (full_acc A W k row b 7 d).
Lemma row_acc_values_expand : forall (A W:list fp32)(k row b d vl:Z) (z0 z1 z2 z3 z4 z5 z6 z7:fp32),
 row_acc_values A W k row b d vl z0 z1 z2 z3 z4 z5 z6 z7 <->
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (full_acc A W k row b 0 d) (full_acc A W k row b 1 d) (full_acc A W k row b 2 d) (full_acc A W k row b 3 d) (full_acc A W k row b 4 d) (full_acc A W k row b 5 d) (full_acc A W k row b 6 d) (full_acc A W k row b 7 d).
Proof. reflexivity. Qed.
Print Assumptions row_acc_values_expand.
Definition row_result_values (A W:list fp32)(k row done:Z)(lo hi:fp32)(vl:Z) (z0 z1 z2 z3 z4 z5 z6 z7:fp32) : Prop :=
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (full_cell A W k row (done+0) lo hi) (full_cell A W k row (done+1) lo hi) (full_cell A W k row (done+2) lo hi) (full_cell A W k row (done+3) lo hi) (full_cell A W k row (done+4) lo hi) (full_cell A W k row (done+5) lo hi) (full_cell A W k row (done+6) lo hi) (full_cell A W k row (done+7) lo hi).
Lemma row_result_values_expand : forall (A W:list fp32)(k row done:Z)(lo hi:fp32)(vl:Z) (z0 z1 z2 z3 z4 z5 z6 z7:fp32),
 row_result_values A W k row done lo hi vl z0 z1 z2 z3 z4 z5 z6 z7 <->
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 (full_cell A W k row (done+0) lo hi) (full_cell A W k row (done+1) lo hi) (full_cell A W k row (done+2) lo hi) (full_cell A W k row (done+3) lo hi) (full_cell A W k row (done+4) lo hi) (full_cell A W k row (done+5) lo hi) (full_cell A W k row (done+6) lo hi) (full_cell A W k row (done+7) lo hi).
Proof. reflexivity. Qed.
Print Assumptions row_result_values_expand.
