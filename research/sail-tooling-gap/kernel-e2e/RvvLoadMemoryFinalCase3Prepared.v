Require Import RvvTaggedCache RvvLoadClosing RvvLoadCaseMath RvvCompactActiveLets.
Ltac finishBoundVector k old f :=
 match goal with H : vector_value_eq ?v (load_update_value_31 _ _) |- _ =>
 let hf := fresh "FINAL_VECTOR" in
 assert (hf : v = loaded8 (BV 64 (Z.of_nat k)) old f) by (solveLoadCase k old f);
 subst v
 end.
Ltac unaliasBoolGuard :=
 match goal with H : ?b = ?v |- _ =>
   lazymatch type of b with bool => is_var b;
     let rhs := eval cbv delta [b] in b in progress change (rhs = v) in H end
 end.
all: repeat unaliasBoolGuard.
all: normalizePathGuards.
Ltac closeFixedGuard :=
 solve [exfalso; match goal with H : context [bv_signed _] |- _ =>
   clear -H; timeout 1 (vm_compute in H; first [discriminate H | apply H; reflexivity]) end].
all: try closeFixedGuard.

all: finishBoundVector 3%nat old f.
all: repeat directCachedAStep; liShow.
Unshelve. all: prepare_sidecond.
all: try bv_solve.
Unshelve. all: try done.
Show.
Qed.
