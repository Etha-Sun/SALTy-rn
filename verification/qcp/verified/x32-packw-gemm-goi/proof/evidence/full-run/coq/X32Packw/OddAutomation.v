From Coq Require Import ZArith List Lia Ring.
From X32Packw Require Export TileAccessFacts neon_odd_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac pw_odd_normalize:=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold pw_offset in *;subst;
 repeat rewrite Z.sub_diag in *;
 repeat rewrite Z.sub_0_r in *;
 repeat rewrite pw_odd_run_zero in *.
Ltac pw_odd_facts:=
 try multimatch goal with
 | H:pw_odd_pre ?F ?W ?a ?p ?kc,Hk : (?k <= ?kc), Hnz : (?k <> 0) |- _ =>
  let Hr:=fresh"Hread"in pose proof(pw_odd_next_read F W a p kc(kc-k)H ltac:(lia))as Hr;
  let Hw:=fresh"Hwrite"in pose proof(pw_odd_next_write F W a p kc(kc-k)H ltac:(lia))as Hw
 end;
 try match goal with H:pw_odd_pre _ _ _ _ _ |- _=>
  let Hcopy:=fresh"Hparts"in pose proof H as Hcopy;unfold pw_odd_pre in Hcopy end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end.
Ltac pw_odd_auto:=pw_odd_normalize;pw_odd_facts;solve[entailer!].
