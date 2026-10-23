From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Lemma frame_self_wand (P Q:Assertion) : P |-- P ** (Q -* Q).
Proof.
 apply sepcon_cancel_res_emp.
 apply_sepcon_adjoint. entailer!.
Qed.
Print Assumptions frame_self_wand.
