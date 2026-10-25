From Coq Require Import ZArith List Lia.
From X32Packw Require Export ProgramFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition pw_pair_pre(F:PWMap)(W:list Z)(a b p count:Z):Prop:=
 0<count<18446744073709551616 /\ 0<a /\ 0<b /\ 0<p /\
 a+4*count<18446744073709551616 /\ b+4*count<18446744073709551616 /\
 p+8*count<18446744073709551616 /\
 pw_window F a count /\ pw_window F b count /\
 pw_write_window W p(2*count) /\ NoDup W.
Definition pw_odd_pre(F:PWMap)(W:list Z)(a p count:Z):Prop:=
 0<count<18446744073709551616 /\ 0<a /\ 0<p /\
 a+4*count<18446744073709551616 /\ p+8*count<18446744073709551616 /\
 pw_window F a count /\ pw_write_window W p(2*count) /\ NoDup W.

Definition pw_offset(p delta:Z):Z:=p+delta.
