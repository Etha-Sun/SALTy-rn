From X32Packw Require Export AccessModel.
From Coq Require Import ZArith List Bool.
Local Open Scope Z_scope.
Definition pw_header_pre(F:PWMap)(W:list Z)(b p count:Z):Prop:=
 (count=1\/count=2) /\ pw_write_window W p 2 /\ NoDup W /\ pw_map_nodup F /\
 (b=0\/pw_window F b count).
Definition pw_header_run(F:PWMap)(b p count:Z)(O:PWOutput):PWOutput:=
 pw_header F(negb(Z.eqb b 0))(Z.eqb count 2)b p O.
