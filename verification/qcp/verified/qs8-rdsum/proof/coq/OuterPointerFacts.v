From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export RvvLoopFacts ControlLoopFacts.
Local Open Scope Z_scope.
Lemma rd_outer_pointer_step_flat : forall r cb rows input stride j p,
 0<r ->-6<=cb<=0 ->Z.rem(rd_min252 r-cb)7=0 ->
 rd_inner_gate r cb p(rd_u64(input+(rows-r+(rd_min252 r-cb)+j)*stride)) ->
 rd_ptr_gate(Z.max 0(r-252))p(rd_u64(input+(rows-Z.max 0(r-252)+j)*stride)).
Proof.
 intros r cb rows input stride j p Hr Hcb Hrem Hgate.
 destruct(Z_le_gt_dec r 252)as[Hsmall|Hlarge].
 - rewrite Z.max_l by lia;left;lia.
 - assert(Ecb:cb=0)by(apply(rd_full_block_exit_zero r cb);lia||assumption).
   apply rd_inner_gate_next in Hgate;[|lia];rewrite Z.max_r by lia;right;subst cb.
   unfold rd_min252 in Hgate;rewrite Z.min_r in Hgate by lia;rewrite Z.sub_0_r in Hgate.
   rewrite Hgate;f_equal;ring.
Qed.
Print Assumptions rd_outer_pointer_step_flat.
