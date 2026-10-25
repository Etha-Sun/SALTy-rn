From Coq Require Import ZArith List.
From X32Packw Require Export ObservationModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma pw_output_exact_loan:forall W O p x,
 NoDup W->In p W->pw_exact O p x->
 pw_output W O --||--p#UInt|->x **pw_output_rest W O p.
Proof.
 intros W O p x Hnd Hin Hknown;unfold pw_exact in Hknown.
 pose proof(pw_output_loan W O p Hnd Hin)as Hloan.
 rewrite Hknown in Hloan;exact Hloan.
Qed.
Print Assumptions pw_output_exact_loan.
