From Coq Require Import ZArith Lia List Bool.
From X32Packw Require Import PackwModel PackwFacts HeaderModel TileModel WindowModel.
From AUXLib Require Import ListLib.
Open Scope Z_scope.
Definition pw_index_header (present:bool)(count bi:Z)(BIAS TOLD:list Z) :=
 if present then pw_copy_prefix count (sublist bi(bi+count) BIAS)(sublist 0 2 TOLD) else pw_zero2.
Definition pw_index_pair (present:bool)(kc gap wa bi oi otot:Z)(W BIAS OLD:list Z) :=
 let TOLD:=sublist oi(oi+(2+(2*kc+gap))) OLD in
 let ROWS:=sublist wa(wa+2*kc) W in
 pw_window_replace oi(2+(2*kc+gap))otot
 (pw_tile_pair kc gap (pw_index_header present 2 bi BIAS TOLD)
 (sublist 0 kc ROWS)(sublist kc(2*kc)ROWS)TOLD)OLD.
Definition pw_index_odd (present:bool)(kc gap wa bi oi otot:Z)(W BIAS OLD:list Z) :=
 let TOLD:=sublist oi(oi+(2+(2*kc+gap))) OLD in
 pw_window_replace oi(2+(2*kc+gap))otot
 (pw_tile_odd kc gap (pw_index_header present 1 bi BIAS TOLD)
 (sublist wa(wa+kc)W)TOLD)OLD.
Lemma pw_rows_join : forall kc (ROWS:list Z),0<=kc ->Zlength ROWS=2*kc ->sublist 0 kc ROWS++sublist kc(2*kc)ROWS=ROWS.
Proof. intros;rewrite <-sublist_split by lia;rewrite <-H0;apply sublist_self;lia. Qed.
Print Assumptions pw_rows_join.
