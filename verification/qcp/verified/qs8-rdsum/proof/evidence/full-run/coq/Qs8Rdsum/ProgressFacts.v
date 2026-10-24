From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export ProgressModel RvvFacts SelectFacts.
Local Open Scope Z_scope.
Lemma rd_old_inner_gate_counter :
 rd_ptr_gate 0 0 352 /\ ~rd_ptr_gate 1 0 352.
Proof. unfold rd_ptr_gate;split;[left;lia|intros[H|H];lia]. Qed.
Lemma rd_inner_gate_live : forall r cb p e,0<cb ->rd_inner_gate r cb p e ->p=e.
Proof. intros;unfold rd_inner_gate in H0;destruct H0 as[[_ Hbad]|Heq];lia. Qed.
Lemma rd_inner_gate_next : forall r cb p e,252<r ->rd_inner_gate r cb p e ->p=e.
Proof. intros;unfold rd_inner_gate in H0;destruct H0 as[[Hbad _]|Heq];lia. Qed.
Lemma rd_full_block_batch : forall r cb,252<r ->0<cb<=rd_min252 r ->Z.rem(rd_min252 r-cb)7=0 ->7<=cb.
Proof.
 intros r cb Hr Hcb Hrem;unfold rd_min252 in *;rewrite Z.min_r in * by lia.
 pose proof(Z.quot_rem (252-cb)7 ltac:(lia));rewrite Hrem in H;lia.
Qed.
Lemma rd_full_block_exit_zero : forall r cb,252<r ->-6<=cb<=0 ->Z.rem(rd_min252 r-cb)7=0 ->cb=0.
Proof.
 intros r cb Hr Hcb Hrem;unfold rd_min252 in Hrem;rewrite Z.min_r in Hrem by lia.
 pose proof(Z.quot_rem (252-cb)7 ltac:(lia));rewrite Hrem in H;lia.
Qed.
Lemma rd_u64_add_left : forall a b,rd_u64(rd_u64 a+b)=rd_u64(a+b).
Proof. intros;unfold rd_u64;apply unsigned_unsigned_add_l;lia. Qed.
Lemma rd_pointer_group_step : forall r cb base stride j zero,
 0<cb<=rd_min252 r -> Z.rem(rd_min252 r-cb)7=0 ->0<=j<7 ->
 rd_inner_gate r(cb-7)
 (rd_u64(rd_select_ptr cb j(rd_u64(base+(rd_min252 r-cb+j)*stride))zero+rd_u64(7*stride)))
 (rd_u64(base+(rd_min252 r-(cb-7)+j)*stride)).
Proof.
 intros r cb base stride j zero Hcb Hstep Hj.
 destruct(Z_le_gt_dec r 252)as[Hr|Hr];destruct(Z_le_gt_dec cb 7)as[Hsmall|Hlarge].
 - left;split;lia.
 - right;rewrite rd_select_live by lia.
   rewrite rd_u64_add;f_equal;ring.
 - assert(Hseven:7<=cb)by(exact(rd_full_block_batch r cb ltac:(lia) Hcb Hstep)).
   right;rewrite rd_select_live by lia;rewrite rd_u64_add;f_equal;ring.
 - right;rewrite rd_select_live by lia;rewrite rd_u64_add;f_equal;ring.
Qed.
Lemma rd_pointer_cast_group_step : forall r cb base stride j zero,
 0<cb<=rd_min252 r -> Z.rem(rd_min252 r-cb)7=0 ->0<=j<7 ->
 rd_inner_gate r(cb-7)
 (rd_u64(rd_u64(rd_select_ptr cb j(rd_u64(base+(rd_min252 r-cb+j)*stride))zero)+rd_u64(7*stride)))
 (rd_u64(base+(rd_min252 r-(cb-7)+j)*stride)).
Proof. intros;rewrite rd_u64_add_left;apply rd_pointer_group_step;assumption. Qed.
Print Assumptions rd_old_inner_gate_counter.
Print Assumptions rd_inner_gate_live.
Print Assumptions rd_inner_gate_next.
Print Assumptions rd_full_block_batch.
Print Assumptions rd_full_block_exit_zero.
Print Assumptions rd_pointer_group_step.
Print Assumptions rd_pointer_cast_group_step.
