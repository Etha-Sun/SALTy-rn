From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Guard Require Import neon_guard_goal.
From Qd8Frame Require Import KernelFrame.
From GuardCursor Require Import GuardCursor.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_56_pure : neon_guard_goal.test_neon_partial_solve_wit_56_pure.
Proof.
 unfold neon_guard_goal.test_neon_partial_solve_wit_56_pure;left;intros.
 rewrite sizeof_char in PreH1,PreH23.
 assert (Ew:w=w_pre+(Z.quot (nc_pre-nc) 8)*(96+8*kc_pre)+32+8*(kc_pre-k)).
 { rewrite PreH23;ring. }
 pose proof (current_loaded_pointer_range nc_pre kc_pre a_pre w_pre c_pre
   (Z.quot (nc_pre-nc) 8) k w Ps PreH7 PreH8 PreH16 PreH17
   (conj PreH19 PreH20) Ew) as Hr.
 change (unsigned_last_nbits (w+64) 64<=UINT64_MAX-448) in PreH1.
 rewrite (uintptr_cast_identity (w+64) Hr) in PreH1.
 rewrite sizeof_char.
 unfold derivable1,andp,coq_prop;intros.
 clear -Hr PreH1.
 repeat apply conj;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_56_pure.
