From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma actual_qcp_uint_size : sizeof(UINT)=4.
Proof. rewrite sizeof_uint;reflexivity. Qed.
Lemma declared_native_width_does_not_match : sizeof(UINT)<>8.
Proof. rewrite actual_qcp_uint_size;lia. Qed.
Print Assumptions declared_native_width_does_not_match.
