From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelColumnFacts NeonKernelInitialRow3.
Local Open Scope Z_scope.
Lemma dw_tail_store_two_bound:forall w,
 4<=w<=16->Z.rem w 4=0->Z.land w 8<>0->8<=w.
Proof.
 intros w Hw Hr H8;assert(Hm:w mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact Hr).
 pose proof(Z.div_mod w 4 ltac:(lia))as HD;rewrite Hm in HD.
 assert(Hcases:w=4\/w=8\/w=12\/w=16)by lia.
 destruct Hcases as[->|[->|[->| -> ]]];vm_compute in H8;lia.
Qed.
Lemma dw_tail_store_last_bound:forall w,
 4<=w<=16->Z.rem w 4=0->Z.land w 8<>0->Z.land w 4<>0->12<=w.
Proof.
 intros w Hw Hr H8 H4;assert(Hm:w mod 4=0)by(rewrite<-Z.rem_mod_nonneg by lia;exact Hr).
 pose proof(Z.div_mod w 4 ltac:(lia))as HD;rewrite Hm in HD.
 assert(Hcases:w=4\/w=8\/w=12\/w=16)by lia.
 destruct Hcases as[->|[->|[->| -> ]]];vm_compute in H8,H4;lia.
Qed.
Lemma dw_output_row_window_offset:forall output H N y j x off n,
 dw_footprint output(H*N)->0<H->0<N->0<=y<H->0<=j->0<=x->0<=off->0<=n->x+off+n<=N->
 dw_write_window(dw_addresses output H N)(output+4*(dw_store_row H y j*N+x)+4*off)n.
Proof.
 intros;replace(output+4*(dw_store_row H y j*N+x)+4*off)with(output+4*(dw_store_row H y j*N+(x+off)))by ring.
 eapply dw_output_row_window;first[eassumption|lia].
Qed.
Print Assumptions dw_tail_store_two_bound.
Print Assumptions dw_tail_store_last_bound.
Print Assumptions dw_output_row_window_offset.
