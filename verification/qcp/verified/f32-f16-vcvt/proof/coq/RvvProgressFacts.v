From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
(* Pure ghost introduction/elimination retains the complete arbitrary frame. *)
Lemma f16_progress_intro:forall (N n:Z)(P:Assertion),
 P |-- EX (k:Z), “ (k=N-n) ” && P.
Proof. intros;Exists(N-n);entailer!. Qed.
Lemma f16_progress_elim:forall (N n:Z)(P:Assertion),
 (EX (k:Z), “ (k=N-n) ” && P) |-- P.
Proof. intros;Intros k;entailer!. Qed.
Print Assumptions f16_progress_intro.
Print Assumptions f16_progress_elim.
