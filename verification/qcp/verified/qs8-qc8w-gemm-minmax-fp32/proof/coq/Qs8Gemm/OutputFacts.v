From Coq Require Import ZArith Lia List.
From Qs8Gemm Require Import Model MemoryFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma qs8_completed_succ : forall K n A Ps magic off lo hi, 0<=n ->
 completed_values K (n+1) A Ps magic off lo hi =
 completed_values K n A Ps magic off lo hi ++ [qs8_final K n A Ps magic off lo hi].
Proof.
 intros K n A Ps magic off lo hi Hn;unfold completed_values.
 rewrite Z2Nat.inj_add by lia;cbn [Z.to_nat].
 rewrite Nat.add_1_r,seq_S,map_app;cbn -[Z.to_nat qs8_final].
 rewrite ?Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.
Lemma qs8_tile_index : forall d i, 0<=d -> d mod 8=0 -> 0<=i<8 ->
 (d+i)/8=d/8 /\ (d+i) mod 8=i.
Proof.
 intros d i Hd Hmod Hi.
 pose proof(Z.div_mod d 8 ltac:(lia)) as HE.
 split.
 - symmetry;apply Z.div_unique with (r:=i);lia.
 - symmetry;apply Z.mod_unique with (q:=d/8);lia.
Qed.
Lemma qs8_final_tile : forall K d i A Ps magic off lo hi,
 0<=d -> d mod 8=0 -> 0<=i<8 ->
 qs8_final K (d+i) A Ps magic off lo hi =
 qs8_quant(qs8_acc K (d/8) i A Ps)(qs8_scale(d/8)i Ps)magic off lo hi.
Proof.
 intros;pose proof(qs8_tile_index d i H H0 H1) as [Hd Hm].
 unfold qs8_final;rewrite Hd,Hm;reflexivity.
Qed.
Print Assumptions qs8_completed_succ.
Print Assumptions qs8_final_tile.
