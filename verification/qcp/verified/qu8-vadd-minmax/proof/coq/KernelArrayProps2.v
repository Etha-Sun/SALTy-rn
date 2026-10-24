From Coq Require Import ZArith List.
From Qu8Add Require Export KernelArrayProps.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_array_values_fast p n xs Hname :=
 eapply (add_pure_split (Forall(fun x:Z=>0<=x<=255)xs));
 [qu_extract_array_values (UCharArray.full p n xs)
 |apply coq_prop_andp_left;intro Hname].
