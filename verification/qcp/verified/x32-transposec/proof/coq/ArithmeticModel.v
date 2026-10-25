From Coq Require Import ZArith Lia.
From X32Transpose Require Export WordModel.
Local Open Scope Z_scope.
Definition xt_doz(a b:Z):Z:=if Z.ltb b a then a-b else 0.
Definition xt_round_down(n q:Z):Z:=xt_mod64(n-Z.rem n q).
Lemma xt_round_down_without_wrap:forall n q,0<=n<18446744073709551616->0<q->xt_round_down n q=n-n mod q.
Proof. intros n q Hn Hq;unfold xt_round_down,xt_mod64;rewrite Z.rem_mod_nonneg by lia;apply Z.mod_small;pose proof(Z.mod_pos_bound n q Hq);pose proof(Z.mod_le n q ltac:(lia)Hq);lia. Qed.
Lemma xt_round_down_two:forall n,0<=n<18446744073709551616->xt_round_down n 2=2*(n/2).
Proof. intros;rewrite xt_round_down_without_wrap by lia;pose proof(Z.div_mod n 2 ltac:(lia));lia. Qed.
Print Assumptions xt_round_down_without_wrap.
Print Assumptions xt_round_down_two.
