From Coq Require Import ZArith Lia.
From FullDomainRvv Require Import FullModel.
Local Open Scope Z_scope.
Lemma float_byte_quot : forall base offset,
 (base + offset*4 - base) ÷ 4 = offset.
Proof. intros; replace (base+offset*4-base) with (offset*4) by ring; rewrite Z.quot_mul by lia; reflexivity. Qed.
Lemma float_byte_quot_shift : forall base offset shift,
 (base + offset*4 + shift*4 - base) ÷ 4 = offset+shift.
Proof. intros;replace(base+offset*4+shift*4-base)with((offset+shift)*4)by ring;rewrite Z.quot_mul by lia;reflexivity. Qed.
Lemma panel_prefix_range : forall n r,0<r<=n -> Z.rem(n-r)8=0 ->
 0<=panel_count(n-r)<panel_count n /\ panel_count(n-r)=(n-r)÷8.
Proof.
 intros n r Hr Hrem.
 pose proof(Z.quot_rem(n-r)8 ltac:(lia))as E;rewrite Hrem in E.
 pose proof(Z.quot_pos(n-r)8 ltac:(lia)ltac:(lia))as Q.
 assert(P:panel_count(n-r)=(n-r)÷8).
 { unfold panel_count;symmetry;apply Z.div_unique with(r:=7);lia. }
 pose proof(panel_count_covers n ltac:(lia));split;[rewrite P;nia|exact P].
Qed.
Lemma quotient4_depth : forall kc k,0<=k<=kc -> Z.rem kc 4=0 -> Z.rem k 4=0 ->
 (kc-k)÷4=kc÷4-k÷4 /\ 0<=kc÷4 /\ 0<=k÷4 /\ k=4*(k÷4).
Proof.
 intros kc k H Hkc Hk.
 pose proof(Z.quot_rem kc 4 ltac:(lia))as E1;rewrite Hkc in E1.
 pose proof(Z.quot_rem k 4 ltac:(lia))as E2;rewrite Hk in E2.
 pose proof(Z.quot_pos kc 4 ltac:(lia)ltac:(lia)).
 pose proof(Z.quot_pos k 4 ltac:(lia)ltac:(lia)).
 assert(E:kc-k=(kc÷4-k÷4)*4)by nia;rewrite E,Z.quot_mul by lia;repeat split;nia.
Qed.
Print Assumptions float_byte_quot.
Print Assumptions float_byte_quot_shift.
Print Assumptions panel_prefix_range.
Print Assumptions quotient4_depth.
