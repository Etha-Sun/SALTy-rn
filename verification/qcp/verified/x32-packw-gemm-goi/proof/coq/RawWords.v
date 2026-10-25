From Coq Require Import ZArith Bool List Lia.
From SimpleC.SL Require Export Mem SeparationLogic IntLib.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition pw_word(x:Z):Prop:=0<=x<4294967296.
Definition pw_mod64(x:Z):Z:=x mod 18446744073709551616.
