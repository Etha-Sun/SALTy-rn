From Coq Require Import ZArith Lia.
From DwChw Require Import NeonKernelFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_4_5:
 DwChw.neon_unit_goal.test_neon_entail_wit_4_5.
Proof.
 unfold DwChw.neon_unit_goal.test_neon_entail_wit_4_5;left;intros;exfalso.
 clear -PreH2 PreH13 PreH34 PreH36 PreH46 PreH47.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 assert(Hmod:w mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact PreH36).
 pose proof(Z.div_mod w 4 ltac:(lia))as Hdiv;rewrite Hmod in Hdiv.
 assert(Hcases:w=4\/w=8\/w=12\/w=16)by lia.
 destruct Hcases as[->|[->|[->| -> ]]];vm_compute in PreH46,PreH47;lia.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_4_5.
