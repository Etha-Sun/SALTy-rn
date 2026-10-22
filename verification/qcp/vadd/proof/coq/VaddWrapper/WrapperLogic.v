From Coq Require Import ZArith String.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Local Open Scope string_scope.
Definition UndefStructPredxnn_f32_default_params (p:Z) : Assertion :=
  &(p # "xnn_f32_default_params" ->ₛ "unused") # Char |->_ .
