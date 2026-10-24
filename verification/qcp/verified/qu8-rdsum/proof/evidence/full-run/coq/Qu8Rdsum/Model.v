From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Coqlib.
From SimpleC.SL Require Export IntLib.
Import ListNotations.
Local Open Scope Z_scope.
Definition rs_s16 (x:Z):Z := signed_last_nbits x 16.
Definition rs_u16 (x:Z):Z := unsigned_last_nbits x 16.
Definition rs_s32 (x:Z):Z := signed_last_nbits x 32.
Definition rs_u32 (x:Z):Z := unsigned_last_nbits x 32.
Definition rs_add_s32 (a b:Z):Z :=
 let s:=a+b in if Z.gtb s 2147483647 then s-4294967296
 else if Z.ltb s (-2147483648) then s+4294967296 else s.
Definition rs_add_u32 (a b:Z):Z :=
 let s:=a+b in if Z.gtb s 4294967295 then s-4294967296 else s.
Definition rs_pair_s8 (a x y:Z):Z := rs_s16(a+x+y).
Definition rs_pair_u8 (a x y:Z):Z := rs_u16(a+x+y).
Definition rs_pair_s16 (a x y:Z):Z := rs_add_s32 a (x+y).
Definition rs_pair_u16 (a x y:Z):Z := rs_add_u32 a (x+y).
Definition rs_sum (A:list Z):Z := fold_right Z.add 0 A.
Definition rs_prefix (A:list Z)(n:Z):Z := rs_sum(firstn(Z.to_nat n)A).
