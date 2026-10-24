From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export PointerStepFacts.
Local Open Scope Z_scope.
Lemma rd_pointer_group_step_flat_zero_raw : forall r cb base col rows stride,
 0<cb<=rd_min252 r ->Z.rem(rd_min252 r-cb)7=0 ->
 rd_inner_gate r(cb-7)
 (rd_u64(base+col+(rows-r+(rd_min252 r-cb))*stride+rd_u64(7*stride)))
 (rd_u64(base+col+(rows-r+(rd_min252 r-(cb-7)))*stride)).
Proof. intros;pose proof(rd_pointer_group_step_flat_zero r cb base col rows stride H H0)as HS;rewrite rd_u64_add_left in HS;exact HS. Qed.
Print Assumptions rd_pointer_group_step_flat_zero_raw.
