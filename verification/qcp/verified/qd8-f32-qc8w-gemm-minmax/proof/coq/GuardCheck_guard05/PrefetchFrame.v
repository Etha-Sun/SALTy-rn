From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Guard Require Import neon_guard_goal.
From Qd8Frame Require Import KernelFrame.
From GuardCursor Require Import GuardCursor.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_56 : neon_guard_goal.test_neon_partial_solve_wit_56.
Proof.
 unfold neon_guard_goal.test_neon_partial_solve_wit_56,neon_guard_goal.test_neon_partial_solve_wit_56_aux.
 intros Hpure;intros;clear Hpure.
 pose proof PreH1 as Hguard_original.
 pose proof PreH23 as Hcursor_original.
 rewrite sizeof_char in PreH1,PreH23.
 assert (Ew:w=w_pre+(Z.quot (nc_pre-nc) 8)*(96+8*kc_pre)+32+8*(kc_pre-k)).
 { rewrite PreH23;ring. }
 pose proof (current_loaded_pointer_range nc_pre kc_pre a_pre w_pre c_pre
   (Z.quot (nc_pre-nc) 8) k w Ps PreH7 PreH8 PreH16 PreH17
   (conj PreH19 PreH20) Ew) as Hr.
 pose proof PreH1 as Hguard_cast.
 change (unsigned_last_nbits (w+64) 64<=UINT64_MAX-448) in PreH1.
 rewrite (uintptr_cast_identity (w+64) Hr) in PreH1.
 qd8_layout.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros mem Hheap;clear Hheap.
   assert (Blo:0<=w+512) by (clear -Hr;lia).
   assert (Bhi:w+512<=UINT64_MAX) by (clear -PreH1;lia).
   assert (Blo_char:0<=w+(64+448)*sizeof(CHAR)) by (rewrite sizeof_char;exact Blo).
   assert (Bhi_char:w+(64+448)*sizeof(CHAR)<=UINT64_MAX) by (rewrite sizeof_char;exact Bhi).
   exact (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj (conj Blo_char Bhi_char) Bhi) Blo) Hguard_original) PreH2) PreH3) PreH4) PreH5) PreH6) PreH7) PreH8) PreH9) PreH10) PreH11) PreH12) PreH13) PreH14) PreH15) PreH16) PreH17) PreH18) PreH19) PreH20) PreH21) PreH22) Hcursor_original).
 - rewrite ?sizeof_char,?sizeof_float,?sizeof_int.
   rewrite ?Z.add_0_r,?Z.add_0_l,?Z.add_assoc.
   qd8_cancel.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_56.
