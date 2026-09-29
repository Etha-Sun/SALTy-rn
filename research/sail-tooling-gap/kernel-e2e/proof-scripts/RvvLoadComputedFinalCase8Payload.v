(* Prepared but not executed in the cancelled attempt. *)
all: try (intros Hrange; rewrite <- a800001ca_shared_exact; iStartProof; repeat lightStep).
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
   clear -H; let assertion := type of H in is_closed_term assertion; timeout 1 (vm_compute in H; first [discriminate H | apply H; reflexivity]) end].
all: try closeFixedGuard.

Ltac normalizeInputRead p f range :=
 match goal with Hread : input8 f !! Z.to_nat ((bv_unsigned ?a - bv_unsigned p) `div` 1) = Some ?v |- _ =>
  let raw := eval cbv delta [a] in a in
  let base := lazymatch raw with bv_add ?b _ => b | _ => raw end in
  let off := lazymatch raw with bv_add _ ?o => o | _ => constr:(BV 64 0) end in
  unify base p;
  let kZ := eval vm_compute in (bv_unsigned off) in
  let k := eval vm_compute in (Z.to_nat kZ) in
  let ha := fresh "ADDRESS_EQ" in
  assert (ha : bv_unsigned a = (bv_unsigned p + kZ)%Z) by
    (clear -range a; try unfold a; bv_solve);
  rewrite ha in Hread;
  replace ((bv_unsigned p + kZ - bv_unsigned p) `div` 1)%Z with kZ in Hread by lia;
  change (Some (f (N.of_nat k)) = Some v) in Hread;
  injection Hread as Hread; try subst v
 end.
all: repeat normalizeInputRead p f Hrange.
all: finishBoundVector 8%nat old f.
all: repeat directCachedAStep; liShow.
Unshelve. all: prepare_sidecond.
all: try bv_solve.
Unshelve. all: try done.
Show.
Qed.
