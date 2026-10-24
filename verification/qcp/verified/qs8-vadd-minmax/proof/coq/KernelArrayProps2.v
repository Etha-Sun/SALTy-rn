From Coq Require Import ZArith List.
From Qs8Add Require Export KernelArrayProps.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qa_array_values_fast p n xs Hname :=
 eapply (add_pure_split (Forall(fun x:Z=>-128<=x<=127)xs));
 [qa_extract_array_values (CharArray.full p n xs)
 |apply coq_prop_andp_left;intro Hname].
