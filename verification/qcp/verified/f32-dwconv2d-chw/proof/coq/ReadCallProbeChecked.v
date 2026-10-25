From Coq Require Import ZArith Lia.
From DwChw Require Import MemoryFacts OutputInterface dw_maps_strategy_proof dw_output_strategy_proof read_probe_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma dw_probe_window_present : forall F p,dw_window F p 1->dw_present F p.
Proof. intros F p H;pose proof(dw_window_lane F p 1 0 H ltac:(lia))as K;replace(p+4*0)with p in K by lia;exact K. Qed.
Module CheckedReadCallProbe : DwChw.read_probe_unit_goal.VC_Correct.
Include DwChw.dw_maps_strategy_proof.CheckedMaps.
Include DwChw.dw_output_strategy_proof.CheckedOutput.
Lemma proof_of_dw_read_probe_return_wit_1 : DwChw.read_probe_unit_goal.dw_read_probe_return_wit_1.
Proof. unfold DwChw.read_probe_unit_goal.dw_read_probe_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_dw_read_probe_partial_solve_wit_1_pure : DwChw.read_probe_unit_goal.dw_read_probe_partial_solve_wit_1_pure.
Proof. unfold DwChw.read_probe_unit_goal.dw_read_probe_partial_solve_wit_1_pure;left;intros;unfold derivable1,andp,coq_prop;intros;apply dw_probe_window_present;assumption. Qed.
Lemma proof_of_dw_read_probe_partial_solve_wit_1 : DwChw.read_probe_unit_goal.dw_read_probe_partial_solve_wit_1.
Proof. unfold DwChw.read_probe_unit_goal.dw_read_probe_partial_solve_wit_1,DwChw.read_probe_unit_goal.dw_read_probe_partial_solve_wit_1_aux;intros;assert(K:dw_present F p_pre)by(apply dw_probe_window_present;assumption);entailer!. Qed.
End CheckedReadCallProbe.
Print Assumptions CheckedReadCallProbe.proof_of_dw_read_probe_return_wit_1.
Print Assumptions CheckedReadCallProbe.proof_of_dw_read_probe_partial_solve_wit_1_pure.
Print Assumptions CheckedReadCallProbe.proof_of_dw_read_probe_partial_solve_wit_1.
