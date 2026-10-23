From Coq Require Import ZArith List.
From Coq Require Import ZArith List String Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
From GemmSpec Require Export FmaModel IntrinsicModel.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition rvv_at (xs:list fp32)(i:Z) := nth (Z.to_nat i) xs fp32_zero.
Definition rvv_nanth (x:fp32):Z := if Binary.is_nan 24 128 x then 1 else 0.
Definition rvv_merge (x scalar:fp32)(m:Z) := if Z.eqb m 0 then x else scalar.
Definition rvv_acc (A W:list fp32)(j d:Z):fp32 :=
 fold_left (fun acc t => fma_rne (rvv_at A (Z.of_nat t)) (rvv_at W (8+8*Z.of_nat t+j)) acc)
 (seq 0 (Z.to_nat d)) (rvv_at W j).
Definition rvv_output (A W:list fp32)(d:Z)(lo hi:fp32):list fp32 :=
 map (fun j => neon_clamp (rvv_acc A W (Z.of_nat j) d) lo hi) (seq 0 8).
Definition UndefStructPredvfloat32m4_t (p:Z):Assertion :=
 (&(p # "vfloat32m4_t" ->ₛ "s0")) # Float |->_  **
 (&(p # "vfloat32m4_t" ->ₛ "s1")) # Float |->_  **
 (&(p # "vfloat32m4_t" ->ₛ "s2")) # Float |->_  **
 (&(p # "vfloat32m4_t" ->ₛ "s3")) # Float |->_  **
 (&(p # "vfloat32m4_t" ->ₛ "s4")) # Float |->_  **
 (&(p # "vfloat32m4_t" ->ₛ "s5")) # Float |->_  **
 (&(p # "vfloat32m4_t" ->ₛ "s6")) # Float |->_  **
 (&(p # "vfloat32m4_t" ->ₛ "s7")) # Float |->_ .
Definition UndefStructPredvbool8_t (p:Z):Assertion :=
 (&(p # "vbool8_t" ->ₛ "s0")) # Int |->_  **
 (&(p # "vbool8_t" ->ₛ "s1")) # Int |->_  **
 (&(p # "vbool8_t" ->ₛ "s2")) # Int |->_  **
 (&(p # "vbool8_t" ->ₛ "s3")) # Int |->_  **
 (&(p # "vbool8_t" ->ₛ "s4")) # Int |->_  **
 (&(p # "vbool8_t" ->ₛ "s5")) # Int |->_  **
 (&(p # "vbool8_t" ->ₛ "s6")) # Int |->_  **
 (&(p # "vbool8_t" ->ₛ "s7")) # Int |->_ .
