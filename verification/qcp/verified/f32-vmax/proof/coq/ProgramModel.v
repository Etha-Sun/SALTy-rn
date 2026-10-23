From Coq Require Import ZArith List Bool.
From FMax Require Export VectorModel.
Local Open Scope Z_scope.

(* The RVV sequence is the repaired implementation's two self-NaN masks,
   minNumber, addition, then two merges, in source order. *)
Definition mm_repaired (a b:fp32) : fp32 :=
 let m := mm_rvv a b in
 let n := mm_rvv_add a b in
 let r := if Z.eqb (mm_rvv_ne a a) 0 then m else n in
 if Z.eqb (mm_rvv_ne b b) 0 then r else n.
Definition mm_repaired_active (i vl:Z) (a b:fp32) : fp32 :=
 let m := mm_active_max i vl a b in
 let n := mm_active_add i vl a b in
 let r := mm_active_merge i vl m n (mm_active_ne i vl a a) in
 mm_active_merge i vl r n (mm_active_ne i vl b b).
Definition mm_arm_values (n:Z) (a b:list fp32) : list fp32 :=
 List.firstn (Z.to_nat n) (List.map (fun p => mm_arm (fst p) (snd p)) (List.combine a b)).
Definition mm_rvv_values (n:Z) (a b:list fp32) : list fp32 :=
 List.firstn (Z.to_nat n) (List.map (fun p => mm_repaired (fst p) (snd p)) (List.combine a b)).
Lemma mm_repaired_active_lane : forall i vl a b,
 i < vl -> mm_repaired_active i vl a b = mm_repaired a b.
Proof.
 intros i vl a b H. unfold mm_repaired_active,mm_repaired,
 mm_active_max,mm_active_add,mm_active_ne,mm_active_merge.
 rewrite (proj2 (Z.ltb_lt i vl) H). reflexivity.
Qed.
