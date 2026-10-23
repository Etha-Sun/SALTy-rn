From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma used_width_eight : sizeof(UINT64)=8. Proof. reflexivity. Qed.
Lemma used_width_not_four : sizeof(UINT64)<>4. Proof. cbv;congruence. Qed.
Print Assumptions used_width_not_four.
