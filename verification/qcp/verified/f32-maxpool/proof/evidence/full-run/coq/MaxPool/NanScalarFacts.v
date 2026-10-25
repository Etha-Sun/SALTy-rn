From Coq Require Import ZArith Lia.
From MaxPool Require Import Model.
Local Open Scope Z_scope.
Lemma mp_scalar_quiet_range:forall a,0<=a<=4294967295->0<=Z.lor a 4194304<=4294967295.
Proof.
 intros a Ha;assert(Hnonneg:0<=Z.lor a 4194304)by(apply Z.lor_nonneg;lia).
 split;[exact Hnonneg|].
 destruct(Z.eq_dec(Z.lor a 4194304)0)as[H0|H0];[lia|].
 assert(Hlog:Z.log2 a<=31).
 { pose proof(Z.log2_le_mono a 4294967295 ltac:(lia))as H;change(Z.log2 a<=31)in H;exact H. }
 assert(Hlt:Z.lor a 4194304<2^32).
 { apply Z.log2_lt_pow2;[lia|]. rewrite Z.log2_lor by lia.
   change(Z.max(Z.log2 a)22<32);lia. }
 change(Z.lor a 4194304<4294967296)in Hlt;lia.
Qed.
Print Assumptions mp_scalar_quiet_range.
