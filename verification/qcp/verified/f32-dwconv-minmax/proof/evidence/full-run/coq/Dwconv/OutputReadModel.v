From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From Dwconv Require Export MemoryInterface.
Import Snaive_C_Rules64.
Definition dw_initialized (O:DwOutput) (p:Z) (v:fp32) : Prop := O p=Some v.
