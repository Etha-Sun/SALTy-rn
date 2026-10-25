From Coq Require Import ZArith Lia.
From Qs8Mul Require Export RecordComputeModel.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
(* Migrated path-only pure fact lift from verified qs8-rdsum.
   Every node keeps the exact original spatial assertion. *)
Lemma qm_short_keep_left:forall (R:Prop)(P Q:Assertion),
 (P|-- “R” && P)->P**Q|-- “R” && (P**Q).
Proof. intros R P Q H;eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - entailer!.
Qed.
Lemma qm_short_keep_right:forall (R:Prop)(P Q:Assertion),
 (Q|-- “R” && Q)->P**Q|-- “R” && (P**Q).
Proof. intros R P Q H;eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[apply derivable1_refl|exact H].
 - entailer!.
Qed.
Lemma qm_short_keep_range:forall p v,
 p # Short |-> v |-- “-32768<=v<=32767” && (p # Short |-> v).
Proof. intros;apply _derivable1_andp_intros;[apply store_short_range|apply derivable1_refl]. Qed.
Ltac qm_short_path value:=lazymatch goal with|-?P|--_=>lazymatch P with
 |?p # Short |-> value=>apply qm_short_keep_range
 |?A ** ?B=>first[eapply qm_short_keep_left;qm_short_path value|eapply qm_short_keep_right;qm_short_path value]
 end end.
Ltac qm_capture_short value name:=lazymatch goal with|-?P|--?Q=>
 let Facts:=constr:(-32768<=value<=32767)in
 eapply(derivable1_trans P(“Facts” && P)Q);[qm_short_path value|Intros_p name]end.
Print Assumptions qm_short_keep_left.
Print Assumptions qm_short_keep_right.
Print Assumptions qm_short_keep_range.
