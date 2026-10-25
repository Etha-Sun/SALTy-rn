From Coq Require Import ZArith List.
From DwChw Require Export Types VectorModel MemoryModel.
Import ListNotations.
Local Open Scope Z_scope.
(* Value functions for the published source-reviewed ISA boundary. The C
   structures are proof representations; they do not assert physical ABI. *)
Definition dw_fp2 (x0 x1:fp32)(i:Z):fp32:=nth(Z.to_nat i)[x0;x1]fp32_zero.
Definition dw_fp4 (x0 x1 x2 x3:fp32)(i:Z):fp32:=nth(Z.to_nat i)[x0;x1;x2;x3]fp32_zero.
Definition dw_u4 (x0 x1 x2 x3:Z)(i:Z):Z:=nth(Z.to_nat i)[x0;x1;x2;x3]0.
Definition dw_arm_dup(x:fp32)(_i:Z):fp32:=x.
Definition dw_arm_low(A:Z->fp32)(i:Z):fp32:=A i.
Definition dw_arm_high(A:Z->fp32)(i:Z):fp32:=A(i+2).
Definition dw_arm_dup_lane(A:Z->fp32)(lane _i:Z):fp32:=A lane.
Definition dw_arm_ext(A B:Z->fp32)(k i:Z):fp32:=if Z.ltb(i+k)4 then A(i+k)else B(i+k-4).
Definition dw_arm_fma_lane(C A B:Z->fp32)(lane i:Z):fp32:=dw_arm_fma(C i)(A i)(B lane).
Definition dw_arm_max_lane(A B:Z->fp32)(i:Z):fp32:=dw_arm_max(A i)(B i).
Definition dw_arm_min_lane(A B:Z->fp32)(i:Z):fp32:=dw_arm_min(A i)(B i).
Definition dw_arm_and(A B:Z->Z)(i:Z):Z:=Z.land(A i)(B i).
Definition dw_arm_to_bits(A:Z->fp32)(i:Z):Z:=bits_of_fp32(A i).
Definition dw_arm_from_bits(A:Z->Z)(i:Z):fp32:=fp32_of_bits(A i).
Definition dw_rvv_fma_lane(C A:Z->fp32)(x:fp32)(i:Z):fp32:=dw_rvv_fma(C i)x(A i).
Definition dw_rvv_slide_up(A:Z->fp32)(x:fp32)(i:Z):fp32:=if Z.eqb i 0 then x else A(i-1).
Definition dw_rvv_slide_down(A:Z->fp32)(x:fp32)(vl i:Z):fp32:=if Z.ltb(i+1)vl then A(i+1)else x.
Definition dw_load(F:DwROMap)(p i:Z):fp32:=dw_get F(p+4*i).
(* Store functions use one mutable output map, including intentionally
   overlapping output rows. They never allocate multiple resources for aliases. *)
Fixpoint dw_write_nat(k:nat)(x:fp32)(O:list(option fp32)):list(option fp32):=
 match k,O with
 | Datatypes.O,[]=>[] | Datatypes.O,_::xs=>Some x::xs
 | S k,[]=>[] | S k,y::ys=>y::dw_write_nat k x ys
 end.
Definition dw_write(O:list(option fp32))(k:Z)(x:fp32):list(option fp32):=dw_write_nat(Z.to_nat k)x O.
Fixpoint dw_store_n(count:nat)(O:list(option fp32))(k:Z)(A:Z->fp32):list(option fp32):=
 match count with Datatypes.O=>O|S n=>dw_write(dw_store_n n O k A)(k+Z.of_nat n)(A(Z.of_nat n))end.
Definition dw_store(O:list(option fp32))(k vl:Z)(A:Z->fp32):list(option fp32):=dw_store_n(Z.to_nat vl)O k A.
(* The NEON mask table is an integer-word object, not a float read map. Its
   unsigned loads observe the same32 bits; signed/unsigned cell retagging is
   a separate pending checked frontend obligation. *)
Definition dw_load_u32(T:Z->Z)(p i:Z):Z:=T(p+4*i).
