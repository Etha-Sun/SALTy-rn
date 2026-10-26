From Coq Require Import ZArith List Lia.
From ExpMinusMax Require Export CAddFacts.
Import ListNotations.
Local Open Scope Z_scope.
Record EMAcc:Type:=em_acc{em_acc0:fp32;em_acc1:fp32;em_acc2:fp32;em_acc3:fp32}.
Definition em_acc_zero:EMAcc:=em_acc fp32_zero fp32_zero fp32_zero fp32_zero.
Definition em_acc_related(a b:EMAcc):Prop:=em_rel(em_acc0 a)(em_acc0 b)/\em_rel(em_acc1 a)(em_acc1 b)/\em_rel(em_acc2 a)(em_acc2 b)/\em_rel(em_acc3 a)(em_acc3 b).
Definition em_arm_acc_step(a:EMAcc)(v0 v1 v2 v3:fp32):EMAcc:=
 em_acc(em_arm_add(em_acc0 a)v0)(em_arm_add(em_acc1 a)v1)(em_arm_add(em_acc2 a)v2)(em_arm_add(em_acc3 a)v3).
Definition em_rvv_acc_step(a:EMAcc)(v0 v1 v2 v3:fp32):EMAcc:=
 em_acc(em_rvv_add(em_acc0 a)v0)(em_rvv_add(em_acc1 a)v1)(em_rvv_add(em_acc2 a)v2)(em_rvv_add(em_acc3 a)v3).
Definition em_arm_pair_sum(a:EMAcc):fp32:=em_arm_add(em_arm_add(em_acc0 a)(em_acc1 a))(em_arm_add(em_acc2 a)(em_acc3 a)).
Definition em_rvv_pair_sum(a:EMAcc):fp32:=fp32_add(fp32_add(em_acc0 a)(em_acc1 a))(fp32_add(em_acc2 a)(em_acc3 a)).
(* The tail is exactly the original two-lane add, C +=, then the final lane C +=. *)
Definition em_arm_tail(sum:fp32)(r:Z)(v0 v1 v2:fp32):fp32:=
 if Z.eqb r 3 then fp32_add(fp32_add sum(em_arm_add v0 v1))v2 else
 if Z.eqb r 2 then fp32_add sum(em_arm_add v0 v1) else
 if Z.eqb r 1 then fp32_add sum v0 else sum.
Definition em_rvv_tail(sum:fp32)(r:Z)(v0 v1 v2:fp32):fp32:=
 if Z.eqb r 3 then fp32_add(fp32_add sum(fp32_add v0 v1))v2 else
 if Z.eqb r 2 then fp32_add sum(fp32_add v0 v1) else
 if Z.eqb r 1 then fp32_add sum v0 else sum.
Fixpoint em_arm_accumulate(groups:nat)(get:Z->fp32)(maximum:fp32)(a:EMAcc)(k:Z):EMAcc:=
 match groups with O=>a|S g=>em_arm_accumulate g get maximum
 (em_arm_acc_step a(em_arm_value(get k)maximum)(em_arm_value(get(k+1))maximum)(em_arm_value(get(k+2))maximum)(em_arm_value(get(k+3))maximum))(k+4)end.
Fixpoint em_rvv_accumulate(groups:nat)(get:Z->fp32)(maximum:fp32)(a:EMAcc)(k:Z):EMAcc:=
 match groups with O=>a|S g=>em_rvv_accumulate g get maximum
 (em_rvv_acc_step a(em_rvv_value(get k)maximum)(em_rvv_value(get(k+1))maximum)(em_rvv_value(get(k+2))maximum)(em_rvv_value(get(k+3))maximum))(k+4)end.
Definition em_arm_sum(n:Z)(get:Z->fp32)(maximum:fp32):fp32:=
 let g:=n/4 in let k:=4*g in let a:=em_arm_accumulate(Z.to_nat g)get maximum em_acc_zero 0 in
 em_arm_tail(em_arm_pair_sum a)(n mod 4)(em_arm_value(get k)maximum)(em_arm_value(get(k+1))maximum)(em_arm_value(get(k+2))maximum).
Definition em_rvv_sum(n:Z)(get:Z->fp32)(maximum:fp32):fp32:=
 let g:=n/4 in let k:=4*g in let a:=em_rvv_accumulate(Z.to_nat g)get maximum em_acc_zero 0 in
 em_rvv_tail(em_rvv_pair_sum a)(n mod 4)(em_rvv_value(get k)maximum)(em_rvv_value(get(k+1))maximum)(em_rvv_value(get(k+2))maximum).
