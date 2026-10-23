From Coq Require Import ZArith String List Lia.
From S8Clamp Require Export Model MemoryModel NeonFrame NeonFacts NeonKernelMemory NeonKernelFacts ByteBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Ltac s8_int_bounds_in P :=
 lazymatch P with
 | ?P1 ** ?P2 => s8_int_bounds_in P1;s8_int_bounds_in P2
 | (?p # Int |-> ?v) => prop_apply (valid_store_int p v);Intros
 | _ => idtac
 end.
Ltac s8_int_bounds := lazymatch goal with |- ?P |-- _ => s8_int_bounds_in P end.
Ltac s8_neon_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first [assumption|split|reflexivity];lia.
Ltac s8_neon_close :=
 rewrite ?sizeof_char,?sizeof_uchar in *;
 first [solve [s8_neon_pure] | solve [neon_frame] |
        solve [s8_int_bounds;change Byte.min_signed with (-128) in *;
         change Byte.max_signed with 127 in *;entailer!;lia]].
