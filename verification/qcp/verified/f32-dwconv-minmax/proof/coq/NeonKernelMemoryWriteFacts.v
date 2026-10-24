From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemoryExpression.
Import ListNotations Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma dwm_neon_write1:forall F P D pixel k lo hi O,0<=k->
 dw_neon_progress F P D pixel(k+1)lo hi O=
 dw_write_values(dw_neon_progress F P D pixel k lo hi O)
 (dw_output_at D pixel+4*k)([dw_neon_value F P D pixel(k+0)lo hi]).
Proof.
 intros F P D pixel k lo hi O Hk.
 unfold dw_neon_progress,dw_neon_value;rewrite dw_progress_chunk by lia.
 change(Z.to_nat 1)with 1%nat.
 cbn[seq map]; try unfold dw_pack2; try unfold dw_pack4.
 repeat rewrite Nat2Z.inj_succ;rewrite ?Z2Nat.id by lia.
 repeat first[solve[reflexivity|lia]|f_equal].
 all:match goal with|-?G=>idtac "WRITE_REMAIN" G end.
Qed.
Print Assumptions dwm_neon_write1.
Lemma dwm_neon_write2:forall F P D pixel k lo hi O,0<=k->
 dw_neon_progress F P D pixel(k+2)lo hi O=
 dw_write_values(dw_neon_progress F P D pixel k lo hi O)
 (dw_output_at D pixel+4*k)(dw_pack2 (dw_neon_value F P D pixel(k+0)lo hi) (dw_neon_value F P D pixel(k+1)lo hi)).
Proof.
 intros F P D pixel k lo hi O Hk.
 unfold dw_neon_progress,dw_neon_value;rewrite dw_progress_chunk by lia.
 change(Z.to_nat 2)with 2%nat.
 cbn[seq map]; try unfold dw_pack2; try unfold dw_pack4.
 repeat rewrite Nat2Z.inj_succ;rewrite ?Z2Nat.id by lia.
 repeat first[solve[reflexivity|lia]|f_equal].
 all:match goal with|-?G=>idtac "WRITE_REMAIN" G end.
Qed.
Print Assumptions dwm_neon_write2.
Lemma dwm_neon_write4:forall F P D pixel k lo hi O,0<=k->
 dw_neon_progress F P D pixel(k+4)lo hi O=
 dw_write_values(dw_neon_progress F P D pixel k lo hi O)
 (dw_output_at D pixel+4*k)(dw_pack4 (dw_neon_value F P D pixel(k+0)lo hi) (dw_neon_value F P D pixel(k+1)lo hi) (dw_neon_value F P D pixel(k+2)lo hi) (dw_neon_value F P D pixel(k+3)lo hi)).
Proof.
 intros F P D pixel k lo hi O Hk.
 unfold dw_neon_progress,dw_neon_value;rewrite dw_progress_chunk by lia.
 change(Z.to_nat 4)with 4%nat.
 cbn[seq map]; try unfold dw_pack2; try unfold dw_pack4.
 repeat rewrite Nat2Z.inj_succ;rewrite ?Z2Nat.id by lia.
 repeat first[solve[reflexivity|lia]|f_equal].
 all:match goal with|-?G=>idtac "WRITE_REMAIN" G end.
Qed.
Print Assumptions dwm_neon_write4.
