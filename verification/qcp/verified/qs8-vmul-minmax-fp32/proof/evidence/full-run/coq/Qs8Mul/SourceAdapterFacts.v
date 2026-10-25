From Coq Require Import ZArith Lia.
From Qs8Mul Require Export IntrinsicModel.
Local Open Scope Z_scope.
(* The source-shape guard permits only the same nonvolatile bare lvalue in
   both original vext arguments, with literal shift2 or4. This pure equality
   relates that original16-byte concatenation to the one-owner C adapter.
   It grants no ownership and says nothing about arbitrary aliased pointers. *)
Lemma qm_ext_self_original : forall a b c d e f g h k i,
 (k=2 \/ k=4) -> 0<=i<8 ->
 qm_ext_pair a b c d e f g h a b c d e f g h k i =
 qm_ext8 a b c d e f g h k i.
Proof.
 intros a b c d e f g h k i Hk Hi.
 assert(He:i=0\/i=1\/i=2\/i=3\/i=4\/i=5\/i=6\/i=7)by lia.
 destruct Hk;destruct He as[?|[?|[?|[?|[?|[?|[?|?]]]]]]];subst;reflexivity.
Qed.
Print Assumptions qm_ext_self_original.
