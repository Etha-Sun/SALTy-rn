From Coq Require Import ZArith List.
From MaxPool Require Export MemoryModel.
Local Open Scope sac.
(* An anchor is a logical view label, not an extra resource or a restriction
   on the writable-address set. Both directions retain the identical map. *)
Definition mp_owned_output(anchor:Z)(W:list Z)(O:MPOutput):Assertion:=mp_out W O.
Lemma mp_owned_output_unfold:forall anchor W O,
 mp_owned_output anchor W O=mp_out W O.
Proof. reflexivity. Qed.
Lemma mp_owned_output_reanchor:forall a b W O,
 mp_owned_output a W O=mp_owned_output b W O.
Proof. reflexivity. Qed.
