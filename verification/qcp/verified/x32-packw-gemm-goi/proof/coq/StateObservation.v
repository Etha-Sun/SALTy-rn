From Coq Require Import ZArith FunctionalExtensionality.
From X32Packw Require Export ProgramIdempotence.
Local Open Scope Z_scope.
(* These are the mathematical consequences of the concrete post-state used by
   both actual kernel contracts. UnitInterfaces separately binds every actual
   generated C field to a checked ordinary Coq provider. *)
Theorem pw_kernel_posts_full_map:forall F G O left right,
 left=pw_program F G O->right=pw_program F G O->forall q,left q=right q.
Proof. intros;subst;reflexivity. Qed.
Theorem pw_static_memory_frames:forall F G oldL oldR q,
 pw_program F G oldL q=pw_program F G oldR q \/
 (pw_program F G oldL q=oldL q /\pw_program F G oldR q=oldR q).
Proof. intros;apply pw_program_static. Qed.
Theorem pw_kernel_posts_equal_initial_maps:forall F G oldL oldR,
 (forall q,oldL q=oldR q)->pw_program F G oldL=pw_program F G oldR.
Proof.
 intros;assert(oldL=oldR)by(apply functional_extensionality;assumption);subst;reflexivity.
Qed.
Print Assumptions pw_kernel_posts_full_map.
Print Assumptions pw_static_memory_frames.
Print Assumptions pw_kernel_posts_equal_initial_maps.
