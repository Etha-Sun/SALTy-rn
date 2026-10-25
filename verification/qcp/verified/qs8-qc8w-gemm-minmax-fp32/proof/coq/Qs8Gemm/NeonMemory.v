From Coq Require Import ZArith Lia.
From Qs8Gemm Require Export NeonSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qs8_padded_block_extent : forall K d,
 0<=d -> d<K -> d mod 8=0 -> d+8<=a_read_extent K.
Proof.
 intros K d Hd HK Hmod;unfold a_read_extent.
 pose proof(Z.div_mod d 8 ltac:(lia)).
 pose proof(Z.div_mod(K+7)8 ltac:(lia)).
 pose proof(Z.mod_pos_bound(K+7)8 ltac:(lia));lia.
Qed.
Lemma qs8_tail_memory_facts : forall n, 0<=n<8 ->
 0<=Z.land n 4 /\ 0<=Z.land n 2 /\ 0<=Z.land n 1 /\ Z.land n 4+Z.land n 2+Z.land n 1=n /\ (Z.land n 4<>0 -> Z.land n 4=4) /\ (Z.land n 2<>0 -> Z.land n 2=2) /\ (Z.land n 1<>0 -> Z.land n 1=1).
Proof.
 intros n H;assert(Hcases:n=0 \/ n=1 \/ n=2 \/ n=3 \/ n=4 \/ n=5 \/ n=6 \/ n=7)by lia.
 repeat match goal with H:_ \/ _|-_=>destruct H end;subst n;vm_compute;intuition congruence.
Qed.
Ltac qs8_neon_tail_facts n :=
 let Hbits:=fresh "Hbits"in pose proof(qs8_tail_memory_facts n ltac:(lia))as Hbits;
 let H4:=fresh "H4lo"in let H2:=fresh "H2lo"in let H1:=fresh "H1lo"in
 let Hsum:=fresh "Hsum"in let H4nz:=fresh "H4nz"in let H2nz:=fresh "H2nz"in let H1nz:=fresh "H1nz"in
 destruct Hbits as(H4&H2&H1&Hsum&H4nz&H2nz&H1nz);
 try(let Hv:=fresh "H4v"in assert(Hv:Z.land n 4=4)by(apply H4nz;assumption));
 try(let Hv:=fresh "H2v"in assert(Hv:Z.land n 2=2)by(apply H2nz;assumption));
 try(let Hv:=fresh "H1v"in assert(Hv:Z.land n 1=1)by(apply H1nz;assumption)).
Print Assumptions qs8_padded_block_extent.
Print Assumptions qs8_tail_memory_facts.
