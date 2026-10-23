Require Import Coq.ZArith.ZArith Coq.Lists.List.
From SimpleC.SL Require Import Mem SeparationLogic.
Definition fp32_length (values:list fp32) : Z := Zlength values.
