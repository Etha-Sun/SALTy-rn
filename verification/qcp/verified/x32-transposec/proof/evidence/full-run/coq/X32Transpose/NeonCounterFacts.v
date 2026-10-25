From X32Transpose Require Export NeonProgramModel ProgressFacts.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma xt_doz_twice:forall n k,0<=k->xt_doz(xt_doz n k)2=xt_doz n(k+2).
Proof.
 intros n k Hk;unfold xt_doz.
 destruct(Z.ltb_spec k n);destruct(Z.ltb_spec(k+2)n);cbn;try lia.
 all:destruct(Z.ltb_spec 2(n-k));lia.
Qed.
Lemma xt_neon_finished_rows:forall H bh,
 0<=H<18446744073709551616->0<=bh<=1->(H-bh)mod 2=0->
 H-bh=xt_round_down H 2.
Proof.
 intros H bh HH Hb Heven.
 rewrite xt_round_down_without_wrap by lia.
 pose proof(Z.div_mod H 2 ltac:(lia)).
 pose proof(Z.div_mod(H-bh)2 ltac:(lia)).
 pose proof(Z.mod_pos_bound H 2 ltac:(lia)).
 lia.
Qed.
Lemma xt_neon_advance_progress:forall F G O R k w,
 0<=k<xt_cols G->w=xt_doz(xt_cols G)k->
 xt_progress F G O R k(xt_neon_batch w)(xt_height G)->
 xt_progress F G O R(k+2)0 0.
Proof.
 intros F G O R k w Hk Hw Hprog.
 assert(Hremaining:w=xt_cols G-k).
 { unfold xt_doz in Hw;destruct(Z.ltb_spec k(xt_cols G));lia. }
 unfold xt_progress in *;eapply xt_done_ext;[|exact Hprog].
 intros r c [[Hr1 Hr2][Hc1 Hc2]];unfold xt_region,xt_neon_batch.
 destruct(Z_le_dec 2 w).
 - rewrite Z.min_l by lia;lia.
 - rewrite Z.min_r by lia;lia.
Qed.
Print Assumptions xt_doz_twice.
Print Assumptions xt_neon_finished_rows.
Print Assumptions xt_neon_advance_progress.
