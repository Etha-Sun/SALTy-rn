From Coq Require Import ZArith List.
From SimpleC.SL Require Import SeparationLogic.
From GemmSpec Require Import FmaModel IntrinsicModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition gget (i:Z)(a:list fp32):fp32 := nth (Z.to_nat i) a fp32_zero.
Definition glane(i:Z)(a b:fp32):fp32 := if Z.eqb i 0 then a else b.
Definition gbit(a b:fp32):Prop := a=b.
Definition gput(i:Z)(v:fp32)(a:list fp32):list fp32 := firstn (Z.to_nat i) a ++ v::skipn (Z.to_nat(i+1)) a.
Fixpoint gacc_nat(t:nat)(j:Z)(a w:list fp32):fp32 :=
 match t with O=>gget j w | S q=>fma_rne (gget(Z.of_nat q)a)(gget(8+8*Z.of_nat q+j)w)(gacc_nat q j a w) end.
Definition gacc(t j:Z)(a w:list fp32):fp32 := gacc_nat(Z.to_nat t)j a w.
Definition gout(k:Z)(a w:list fp32)(lo hi:fp32):list fp32 :=
 map(fun j=>neon_clamp(gacc k (Z.of_nat j)a w)lo hi)(seq 0 8).
