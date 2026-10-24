From Coq Require Import ZArith List.
From SimpleC.SL Require Import SeparationLogic.
From GemmNeon Require Import KernelModel.
Local Open Scope Z_scope.
Definition gpartial(n k:Z)(a w:list fp32)(lo hi:fp32)(old:list fp32):list fp32 :=
 firstn (Z.to_nat n)(gout k a w lo hi) ++ skipn (Z.to_nat n)old.
