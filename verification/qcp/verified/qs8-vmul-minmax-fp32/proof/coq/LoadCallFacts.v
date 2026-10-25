From Coq Require Import ZArith Lia.
From Qs8Mul Require Export AdapterTactics ProgramModel.
Local Open Scope Z_scope.
Lemma qm_read_window_shift : forall M p n k vl,
 rd_window M p n -> 0<=k -> 0<=vl -> k+vl<=n -> rd_window M (p+k) vl.
Proof. unfold rd_window;intros M p n k vl H Hk Hv Hkn i Hi.
 replace (p+k+i) with (p+(k+i)) by lia. apply H;lia. Qed.
Lemma qm_inputs_read_left : forall M A B N k vl,
 qm_inputs M A B N ->0<=k ->0<=vl ->k+vl<=N ->rd_window M (A+k) vl.
Proof. intros M A B N k vl [HA HB] Hk Hv Hkn;eapply qm_read_window_shift;[exact HA|lia|lia|lia]. Qed.
Lemma qm_inputs_read_right : forall M A B N k vl,
 qm_inputs M A B N ->0<=k ->0<=vl ->k+vl<=N ->rd_window M (B+k) vl.
Proof. intros M A B N k vl [HA HB] Hk Hv Hkn;eapply qm_read_window_shift;[exact HB|lia|lia|lia]. Qed.
Print Assumptions qm_read_window_shift.
Print Assumptions qm_inputs_read_left.
Print Assumptions qm_inputs_read_right.
