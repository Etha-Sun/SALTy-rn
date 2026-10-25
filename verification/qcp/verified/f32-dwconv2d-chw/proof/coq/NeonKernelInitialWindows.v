From Coq Require Import ZArith Lia.
From DwChw Require Export RvvKernelFacts RvvKernelMemoryWrapFacts.
Local Open Scope Z_scope.
Lemma dw_initial_input_row1_window:forall F input zero weights params H N,
 dw_inputs F input zero weights params H N->2<=H->
 dw_window F (unsigned_last_nbits(unsigned_last_nbits input 64+4*N)64)4.
Proof.
 intros F input zero weights params H N HI HH.
 pose proof(dw_input_geometry _ _ _ _ _ _ _ HI)as[Hh[Hn[HF HZ]]].
 assert(EP:unsigned_last_nbits(unsigned_last_nbits input 64+4*N)64=input+4*N).
 {apply dw_u64_add_no_wrap;unfold dw_footprint,dw_u64_limit in HF;nia. }
 rewrite EP.
 replace(input+4*N)with(dw_row_base input zero H N 1+4*0)by(rewrite dw_row_base_inside by lia;ring).
 eapply dw_row_read_window;[exact HI|lia|lia|lia].
Qed.
Lemma dw_initial_input_row2_window:forall F input zero weights params H N,
 dw_inputs F input zero weights params H N->3<=H->
 dw_window F (unsigned_last_nbits(unsigned_last_nbits(unsigned_last_nbits input 64+4*N)64+4*N)64)4.
Proof.
 intros F input zero weights params H N HI HH.
 pose proof(dw_input_geometry _ _ _ _ _ _ _ HI)as[Hh[Hn[HF HZ]]].
 assert(EP:unsigned_last_nbits(unsigned_last_nbits input 64+4*N)64=input+4*N).
 {apply dw_u64_add_no_wrap;unfold dw_footprint,dw_u64_limit in HF;nia. }
 rewrite EP;rewrite unsigned_last_nbits_eq by(change(0<=input+4*N+4*N<18446744073709551616);unfold dw_footprint,dw_u64_limit in HF;nia).
 replace(input+4*N+4*N)with(dw_row_base input zero H N 2+4*0)by(rewrite dw_row_base_inside by lia;ring).
 eapply dw_row_read_window;[exact HI|lia|lia|lia].
Qed.
Print Assumptions dw_initial_input_row1_window.
Print Assumptions dw_initial_input_row2_window.
