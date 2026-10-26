From Coq Require Import ZArith List.
From ArgmaxPool Require Export MemoryModel.
From ArgmaxPool Require Export OutputMemory ReadWindows.
Local Open Scope Z_scope.
(* Atomic proof-annotation views of the original optional previous-output
   conditions.  These definitions preserve the null branch and every original
   readable/window condition; no public C precondition is changed. *)
Definition ap_optional_output_readable(O:APOutput)(p vl:Z):Prop:=p=0\/ap_output_readable O p vl.
Definition ap_optional_index_readable(I:APIndex)(p vl:Z):Prop:=p=0\/ap_index_readable I p vl.
Definition ap_optional_write_window(W:list Z)(p vl:Z):Prop:=p=0\/ap_write_window W p vl.
Lemma ap_optional_output_readable_iff:forall O p vl,
 ap_optional_output_readable O p vl <->p=0\/ap_output_readable O p vl.
Proof. reflexivity. Qed.
Lemma ap_optional_index_readable_iff:forall I p vl,
 ap_optional_index_readable I p vl <->p=0\/ap_index_readable I p vl.
Proof. reflexivity. Qed.
Lemma ap_optional_write_window_iff:forall W p vl,
 ap_optional_write_window W p vl <->p=0\/ap_write_window W p vl.
Proof. reflexivity. Qed.
Lemma ap_optional_output_nonnull:forall O p vl,p<>0->ap_optional_output_readable O p vl->ap_output_readable O p vl.
Proof. unfold ap_optional_output_readable;intros;tauto. Qed.
Lemma ap_optional_index_nonnull:forall I p vl,p<>0->ap_optional_index_readable I p vl->ap_index_readable I p vl.
Proof. unfold ap_optional_index_readable;intros;tauto. Qed.
Lemma ap_optional_window_nonnull:forall W p vl,p<>0->ap_optional_write_window W p vl->ap_write_window W p vl.
Proof. unfold ap_optional_write_window;intros;tauto. Qed.
Print Assumptions ap_optional_output_readable_iff.
Print Assumptions ap_optional_index_readable_iff.
Print Assumptions ap_optional_write_window_iff.
Print Assumptions ap_optional_output_nonnull.
Print Assumptions ap_optional_index_nonnull.
Print Assumptions ap_optional_window_nonnull.
