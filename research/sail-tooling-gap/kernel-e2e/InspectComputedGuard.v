Require Import isla.riscv64.riscv64 RvvAssertNormalize RvvFreshGuard.
Ltac lightGuard := first [
  progress normalizePathGuards
 | solve [exfalso; match goal with H : false = true |- _ => discriminate H end]
 | solve [exfalso; match goal with H : True -> False |- _ => apply H; exact I end]
 | match goal with H : context[bv_signed _] |- _ =>
   let P := type of H in
   lazymatch P with guard_seen _ => fail | _ =>
    tryif (match goal with _ : guard_seen P |- _ => idtac end) then fail else
    first [solve [exfalso; clear -H; timeout 1 (vm_compute in H; first [discriminate H | apply H; reflexivity])]
    | let marker := fresh "LIGHT_GUARD" in pose proof (guard_seen_intro P) as marker]
   end end
 ].
Ltac unaliasBoolGuard :=
 match goal with H : ?b = ?v |- _ =>
   lazymatch type of b with bool => is_var b;
     let rhs := eval cbv delta [b] in b in progress change (rhs = v) in H end
 end.
Goal forall old : bv 65536, True.
Proof.
 intros old.
 pose (minus := bv_sub (bv_zero_extend 128 (BV 64 8)) (BV 128 1)).
 pose (guard := bool_decide (bv_signed (BV 128 0) > bv_signed minus)).
 assert (Htest : guard = true -> False).
 { intro HP. repeat unaliasBoolGuard. normalizePathGuards. lightGuard. }
 exact I.
Qed.
