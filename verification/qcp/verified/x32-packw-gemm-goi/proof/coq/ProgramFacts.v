From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export ProgramModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma pw_pair_run_zero:forall F a b p O,pw_pair_run 0 F a b p O=O.
Proof. reflexivity. Qed.
Lemma pw_pair_run_step:forall n F a b p O,0<=n->
 pw_pair_run(n+1)F a b p O=pw_write_pair(pw_pair_run n F a b p O)(p+8*n)(pw_get F(a+4*n))(pw_get F(b+4*n)).
Proof.
 intros;unfold pw_pair_run;rewrite Z2Nat.inj_add by lia;cbn[Z.to_nat];rewrite Nat.add_1_r;cbn[pw_pair_run_nat];rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma pw_odd_run_zero:forall F a p O,pw_odd_run 0 F a p O=O.
Proof. reflexivity. Qed.
Lemma pw_odd_run_step:forall n F a p O,0<=n->
 pw_odd_run(n+1)F a p O=pw_output_put(pw_odd_run n F a p O)(p+8*n)(pw_get F(a+4*n)).
Proof.
 intros;unfold pw_odd_run;rewrite Z2Nat.inj_add by lia;cbn[Z.to_nat];rewrite Nat.add_1_r;cbn[pw_odd_run_nat];rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma pw_pair_run_chunk:forall count start F a b p O,0<=count->0<=start->
 pw_pair_run(start+count)F a b p O=
 pw_pair_run count F(a+4*start)(b+4*start)(p+8*start)(pw_pair_run start F a b p O).
Proof.
 intros count start F a b p O Hc Hs.
 replace count with(Z.of_nat(Z.to_nat count))by(rewrite Z2Nat.id by lia;reflexivity).
 generalize(Z.to_nat count)as n;intro n;induction n as[|n IH].
 - cbn[Z.of_nat];rewrite Z.add_0_r,pw_pair_run_zero;reflexivity.
 - replace(Z.of_nat(S n))with(Z.of_nat n+1)by lia.
   replace(start+(Z.of_nat n+1))with(start+Z.of_nat n+1)by ring.
   rewrite !pw_pair_run_step by lia;rewrite IH.
   f_equal;try(f_equal;ring);ring.
Qed.
Lemma pw_odd_run_chunk:forall count start F a p O,0<=count->0<=start->
 pw_odd_run(start+count)F a p O=
 pw_odd_run count F(a+4*start)(p+8*start)(pw_odd_run start F a p O).
Proof.
 intros count start F a p O Hc Hs.
 replace count with(Z.of_nat(Z.to_nat count))by(rewrite Z2Nat.id by lia;reflexivity).
 generalize(Z.to_nat count)as n;intro n;induction n as[|n IH].
 - cbn[Z.of_nat];rewrite Z.add_0_r,pw_odd_run_zero;reflexivity.
 - replace(Z.of_nat(S n))with(Z.of_nat n+1)by lia.
   replace(start+(Z.of_nat n+1))with(start+Z.of_nat n+1)by ring.
   rewrite !pw_odd_run_step by lia;rewrite IH.
   f_equal;try(f_equal;ring);ring.
Qed.
Lemma pw_segmented_matches:forall n A B F a b p O,0<=n->
 (forall i,0<=i<n->Znth i A 0=pw_get F(a+4*i))->
 (forall i,0<=i<n->Znth i B 0=pw_get F(b+4*i))->
 pw_segmented n A B p O=pw_pair_run n F a b p O.
Proof.
 intros n A B F a b p O Hn;unfold pw_segmented,pw_pair_run.
 remember(Z.to_nat n)as count eqn:E.
 assert(Hcount:Z.of_nat count=n)by(rewrite E,Z2Nat.id by lia;reflexivity).
 revert n Hn E Hcount;induction count as[|count IH];intros n Hn E Hcount HA HB;[reflexivity|].
 cbn[pw_segmented_nat pw_pair_run_nat].
 rewrite HA,HB by lia.
 rewrite(IH(Z.of_nat count)ltac:(lia)ltac:(rewrite Nat2Z.id;reflexivity)eq_refl).
 - reflexivity.
 - intros;apply HA;lia.
 - intros;apply HB;lia.
Qed.
Lemma pw_strided_matches:forall n A F a p O,0<=n->
 (forall i,0<=i<n->Znth i A 0=pw_get F(a+4*i))->
 pw_strided n A p O=pw_odd_run n F a p O.
Proof.
 intros n A F a p O Hn;unfold pw_strided,pw_odd_run.
 remember(Z.to_nat n)as count eqn:E.
 assert(Hcount:Z.of_nat count=n)by(rewrite E,Z2Nat.id by lia;reflexivity).
 revert n Hn E Hcount;induction count as[|count IH];intros n Hn E Hcount HA;[reflexivity|].
 cbn[pw_strided_nat pw_odd_run_nat];rewrite HA by lia.
 rewrite(IH(Z.of_nat count)ltac:(lia)ltac:(rewrite Nat2Z.id;reflexivity)eq_refl).
 - reflexivity.
 - intros;apply HA;lia.
Qed.
Print Assumptions pw_pair_run_zero.
Print Assumptions pw_pair_run_step.
Print Assumptions pw_odd_run_zero.
Print Assumptions pw_odd_run_step.
Print Assumptions pw_pair_run_chunk.
Print Assumptions pw_odd_run_chunk.
Print Assumptions pw_segmented_matches.
Print Assumptions pw_strided_matches.
