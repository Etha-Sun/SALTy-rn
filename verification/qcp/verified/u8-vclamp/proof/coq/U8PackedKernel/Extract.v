From Coq Require Import Bool.
Definition is_some {P:Prop}(o:option P):bool:=match o with Some _=>true|None=>false end.
Lemma checked_option {P:Prop}(o:option P):is_some o=true ->P.
Proof. destruct o;[intros;assumption|discriminate]. Qed.
