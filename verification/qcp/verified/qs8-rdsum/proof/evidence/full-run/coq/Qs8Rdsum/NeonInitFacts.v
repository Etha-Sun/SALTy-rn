From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export RvvFacts.
Local Open Scope Z_scope.
Lemma rd_input_offset_bounds : forall M base rows channels stride col,
 (forall p,rd_present M p ->0<=p<=18446744073709551615) ->
 rd_inputs M base rows channels stride -> 0<rows -> 0<base ->
 0<=col<channels+7 -> 0<base+col<=18446744073709551615.
Proof.
 intros M base rows channels stride col HA Hin Hr Hb Hc.
 assert(HP:rd_present M(base+col)).
 { replace(base+col)with(rd_row_address base stride 0 col)by(unfold rd_row_address;ring);apply Hin;lia. }
 specialize(HA _ HP);lia.
Qed.
Lemma rd_gate_live : forall live p expected,0<live ->rd_ptr_gate live p expected ->p=expected.
Proof. intros;unfold rd_ptr_gate in H0;destruct H0;lia. Qed.
Lemma rd_progress_live : forall rows r,0<r ->rd_progress rows r ->rd_mod252(rows-r)=0.
Proof. intros;unfold rd_progress in H0;destruct H0;lia. Qed.
Print Assumptions rd_input_offset_bounds.
Print Assumptions rd_gate_live.
Print Assumptions rd_progress_live.
