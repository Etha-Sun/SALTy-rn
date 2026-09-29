Require Import isla.riscv64.riscv64 RvvReadByteFast RvvLoadSharedDefs.
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
Goal forall (p : bv 64) (f : N -> bv 8) v,
 (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
 let a := (p + BV 64 7)%bv in
 input8 f !! Z.to_nat ((bv_unsigned a - bv_unsigned p) `div` 1) = Some v ->
 v = f 7%N.
Proof. intros p f v Hrange a Hr. normalizeInputRead p f Hrange. reflexivity. Qed.
