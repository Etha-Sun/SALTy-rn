Require Import RvvTaggedCache RvvLoadClosing RvvLoadCaseMath RvvCompactActiveLets.
Ltac finishBoundVector k old f :=
 match goal with H : vector_value_eq ?v (load_update_value_31 _ _) |- _ =>
 let hf := fresh "FINAL_VECTOR" in
 assert (hf : v = loaded8 (BV 64 (Z.of_nat k)) old f) by (solveLoadCase k old f);
 subst v
 end.
all: normalizePathGuards.
all: repeat freshGuard.
all: finishBoundVector 0%nat old f.
all: repeat freshCachedAStep; liShow.
Unshelve. all: prepare_sidecond.
all: try bv_solve.
Unshelve. all: try done.
Show.
Qed.
