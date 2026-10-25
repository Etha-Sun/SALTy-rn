From Coq Require Import ZArith Lia List.
From X32Packw Require Import PackwModel.
From AUXLib Require Import ListLib.
Open Scope Z_scope.
Definition pw_window_replace (start width total:Z)(NEW OLD:list Z) := sublist 0 start OLD++(NEW++sublist(start+width) total OLD).
Lemma pw_window_replace_length : forall start width total NEW OLD,0<=start ->0<=width ->start+width<=total ->Zlength OLD=total ->Zlength NEW=width ->Zlength(pw_window_replace start width total NEW OLD)=total.
Proof. intros;unfold pw_window_replace;rewrite !Zlength_app;rewrite !Zlength_sublist by lia;lia. Qed.
Lemma pw_window_identity : forall start width total (OLD:list Z),0<=start ->0<=width ->start+width<=total ->Zlength OLD=total ->pw_window_replace start width total (sublist start (start+width) OLD) OLD=OLD.
Proof. intros;unfold pw_window_replace;rewrite <- (sublist_split start total (start+width) OLD) by lia;rewrite <- (sublist_split 0 total start OLD) by lia;rewrite <- H2;apply sublist_self;lia. Qed.
Lemma pw_window_nested : forall start width total (OLD:list Z),0<=start ->0<=width ->start+width<=total ->Zlength OLD=total ->sublist 0 width (sublist start total OLD)=sublist start(start+width) OLD.
Proof. intros;rewrite Zsublist_Zsublist by lia;f_equal;lia. Qed.
Lemma pw_window_suffix : forall start width total (OLD:list Z),0<=start ->0<=width ->start+width<=total ->Zlength OLD=total ->sublist width(total-start)(sublist start total OLD)=sublist(start+width)total OLD.
Proof. intros;rewrite Zsublist_Zsublist by lia;f_equal;lia. Qed.
Print Assumptions pw_window_replace_length.
Print Assumptions pw_window_identity.
Print Assumptions pw_window_nested.
Print Assumptions pw_window_suffix.
