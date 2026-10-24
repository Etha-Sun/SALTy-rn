From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export RvvLoopFacts.
Local Open Scope Z_scope.
Lemma rd_pointer_group_step_flat : forall r cb base col rows stride j zero,
 0<cb<=rd_min252 r ->Z.rem(rd_min252 r-cb)7=0 ->0<=j<7 ->
 rd_inner_gate r(cb-7)
 (rd_u64(rd_select_ptr cb j(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+j)*stride))zero+rd_u64(7*stride)))
 (rd_u64(base+col+(rows-r+(rd_min252 r-(cb-7))+j)*stride)).
Proof.
 intros r cb base col rows stride j zero Hcb Hstep Hj.
 pose proof(rd_pointer_group_step r cb(base+col+(rows-r)*stride)stride j zero Hcb Hstep Hj)as HS.
 replace(base+col+(rows-r)*stride+(rd_min252 r-cb+j)*stride)
 with(base+col+(rows-r+(rd_min252 r-cb)+j)*stride)in HS by ring.
 replace(base+col+(rows-r)*stride+(rd_min252 r-(cb-7)+j)*stride)
 with(base+col+(rows-r+(rd_min252 r-(cb-7))+j)*stride)in HS by ring;exact HS.
Qed.
Lemma rd_pointer_cast_group_step_flat : forall r cb base col rows stride j zero,
 0<cb<=rd_min252 r ->Z.rem(rd_min252 r-cb)7=0 ->0<=j<7 ->
 rd_inner_gate r(cb-7)
 (rd_u64(rd_u64(rd_select_ptr cb j(rd_u64(base+col+(rows-r+(rd_min252 r-cb)+j)*stride))zero)+rd_u64(7*stride)))
 (rd_u64(base+col+(rows-r+(rd_min252 r-(cb-7))+j)*stride)).
Proof. intros;rewrite rd_u64_add_left;apply rd_pointer_group_step_flat;assumption. Qed.
Lemma rd_pointer_group_step_flat_zero : forall r cb base col rows stride,
 0<cb<=rd_min252 r ->Z.rem(rd_min252 r-cb)7=0 ->
 rd_inner_gate r(cb-7)
 (rd_u64(rd_u64(base+col+(rows-r+(rd_min252 r-cb))*stride)+rd_u64(7*stride)))
 (rd_u64(base+col+(rows-r+(rd_min252 r-(cb-7)))*stride)).
Proof.
 intros;pose proof(rd_pointer_group_step_flat r cb base col rows stride 0 0 H H0 ltac:(lia))as HS.
 rewrite rd_select_live in HS by lia;rewrite ?Z.add_0_r in HS;exact HS.
Qed.
Print Assumptions rd_pointer_group_step_flat.
Print Assumptions rd_pointer_cast_group_step_flat.
Print Assumptions rd_pointer_group_step_flat_zero.
