From Coq Require Export ZArith List Lia.
From FloatAutomation Require Export Frame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac ig_pure := unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|apply conj];lia.
