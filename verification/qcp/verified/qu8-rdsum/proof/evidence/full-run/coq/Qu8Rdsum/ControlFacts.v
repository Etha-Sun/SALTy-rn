From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export ControlModel.
Local Open Scope Z_scope.
Lemma rd_min252_bounds : forall r,0<=r -> 0<=rd_min252 r<=252.
Proof. intros;unfold rd_min252;pose proof(Z.min_spec r 252);lia. Qed.
Lemma rd_quot252_bounds : forall r,0<=r -> 0<=r/252<=r.
Proof. intros;split;[apply Z.div_pos;lia|apply Z.div_le_upper_bound;nia]. Qed.
Lemma rd_quot252_strict : forall r,0<r -> r/252<r.
Proof. intros;apply Z.div_lt_upper_bound;nia. Qed.
Lemma rd_ceil252_bounds : forall r,0<=r -> 0<=rd_ceil252 r<=r.
Proof.
 intros r Hr;unfold rd_ceil252;pose proof(rd_quot252_bounds r Hr).
 destruct(Z.eqb_spec(r mod 252)0);[lia|].
 assert(0<r)by(destruct(Z.eq_dec r 0);subst;[cbn in *;lia|lia]).
 pose proof(rd_quot252_strict r ltac:(lia));lia.
Qed.
Print Assumptions rd_min252_bounds.
Print Assumptions rd_ceil252_bounds.
