Require Import Coq.ZArith.ZArith Coq.Reals.Reals.
From SimpleC.SL Require Import Mem SeparationLogic.
(* Logical equality of the full QCP binary32 values.  Using annotation == on
   fp32 values instead invokes IEEE numeric equality, false for NaNs. *)
Definition fp32_bits_equal (x y : fp32) : Prop := x = y.
Lemma fp32_bits_equal_refl : forall x, fp32_bits_equal x x.
Proof. reflexivity. Qed.
Print Assumptions fp32_bits_equal_refl.
Definition vadd_vl (n : Z) : Z := Z.min n 32.
Definition vadd_active_mul (i vl : Z) (x y : fp32) : fp32 :=
  if Z.ltb i vl then fp32_mul x y else fp32_of_real (0.0%R).
Definition vadd_values (n : Z) (a b : list fp32) : list fp32 :=
  List.firstn (Z.to_nat n)
    (List.map (fun ab => fp32_mul (fst ab) (snd ab)) (List.combine a b)).
