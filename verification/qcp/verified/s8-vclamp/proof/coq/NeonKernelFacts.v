From Coq Require Import ZArith Lia.
From S8Clamp Require Export Model NeonFacts.
Local Open Scope Z_scope.
Lemma s8_neon_bulk_exit_index : forall n r,
 0<=r<64 -> Z.rem (n-r) 64=0 -> n-r=s8_bulk_count n.
Proof.
 intros n r Hr Hrem.
 apply (proj1 (Z.rem_mod_eq_0 (n-r) 64 ltac:(lia))) in Hrem.
 assert (Hmod : n mod 64=r).
 { replace n with ((n-r)+r) at 1 by lia.
   rewrite Z.add_mod by lia.
   rewrite Hrem,Z.add_0_l,Z.mod_mod by lia.
   apply Z.mod_small;lia. }
 unfold s8_bulk_count;lia.
Qed.
Lemma s8_neon_bulk_next_multiple : forall n r,
 Z.rem (n-r) 64=0 -> Z.rem (n-(r-64)) 64=0.
Proof.
 intros n r H.
 apply (proj1 (Z.rem_mod_eq_0 (n-r) 64 ltac:(lia))) in H.
 apply (proj2 (Z.rem_mod_eq_0 (n-(r-64)) 64 ltac:(lia))).
 replace (n-(r-64)) with ((n-r)+1*64) by lia.
 rewrite Z.mod_add by lia. exact H.
Qed.
Lemma s8_neon_tail_next_multiple : forall n r,
 Z.rem (n-r-s8_bulk_count n) 8=0 ->
 Z.rem (n-(r-8)-s8_bulk_count n) 8=0.
Proof.
 intros n r H.
 apply (proj1 (Z.rem_mod_eq_0 (n-r-s8_bulk_count n) 8 ltac:(lia))) in H.
 apply (proj2 (Z.rem_mod_eq_0 (n-(r-8)-s8_bulk_count n) 8 ltac:(lia))).
 replace (n-(r-8)-s8_bulk_count n) with ((n-r-s8_bulk_count n)+1*8) by lia.
 rewrite Z.mod_add by lia. exact H.
Qed.
Lemma s8_neon_tail_cases : forall r,
 0<r<8 -> r=1 \/ r=2 \/ r=3 \/ r=4 \/ r=5 \/ r=6 \/ r=7.
Proof. intros;lia. Qed.
Print Assumptions s8_neon_bulk_exit_index.
Print Assumptions s8_neon_bulk_next_multiple.
Print Assumptions s8_neon_tail_next_multiple.
Print Assumptions s8_neon_tail_cases.
