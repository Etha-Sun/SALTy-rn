From Coq Require Import ZArith Reals List.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Export Mem SeparationLogic.
From QcpVadd Require Export VaddBits.
Definition rvv_read_value (i vl : Z) (contents : list fp32) : fp32 :=
 if Z.ltb i vl then Znth i contents fp32_zero else fp32_of_real (0.0%R).
