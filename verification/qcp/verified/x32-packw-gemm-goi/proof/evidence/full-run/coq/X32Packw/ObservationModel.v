From Coq Require Import ZArith List.
From X32Packw Require Export ProgramIdempotence ScalarMemory.
Local Open Scope Z_scope.
Definition pw_exact(O:PWOutput)(p x:Z):Prop:=O p=Some x.
Definition pw_observation(F:PWMap)(G:PWCall)(O:PWOutput)(p x:Z):Prop:=
 pw_program F G O p=Some x.
