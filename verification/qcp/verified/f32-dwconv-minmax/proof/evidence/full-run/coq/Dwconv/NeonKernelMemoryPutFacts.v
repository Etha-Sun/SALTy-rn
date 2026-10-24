From Coq Require Import ZArith Lia.
From Dwconv Require Export NeonKernelMemoryStoreSupport.
Local Open Scope Z_scope.
Lemma dwm_neon_put1:forall F P D pixel k lo hi O,0<=k->
 dw_neon_progress F P D pixel(k+1)lo hi O=
 dw_output_put(dw_neon_progress F P D pixel k lo hi O)
 (dw_output_at D pixel+4*k)(dw_neon_value F P D pixel k lo hi).
Proof.
 intros;rewrite dwm_neon_write1 by lia;rewrite Z.add_0_r;reflexivity.
Qed.
Print Assumptions dwm_neon_put1.
