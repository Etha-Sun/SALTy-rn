From Qu8Add Require Export NeonKernelAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_array_target_ranges :=
 repeat match goal with
 | HF:Forall (fun x:Z=>0<=x<=255) ?xs |-context[Znth ?i ?xs ?d]=>
  let H:=fresh "Hbyte"in pose proof(qu_Forall_Znth_range xs i d HF ltac:(lia))as H;
  let v:=fresh "byte"in let E:=fresh "Ebyte"in remember(Znth i xs d)as v eqn:E
 end.
Ltac qu_kernel_pure_with_arrays :=
 unfold derivable1,andp,coq_prop;intros;
 qu_rem_bounds;qu_target_ranges;qu_array_target_ranges;
 unfold qu_umin,qu_umax;repeat first[assumption|split|reflexivity];lia.
