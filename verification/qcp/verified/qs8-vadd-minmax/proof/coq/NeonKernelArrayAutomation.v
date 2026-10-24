From Qs8Add Require Export NeonKernelAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qa_array_target_ranges :=
 repeat match goal with
 | HF:Forall (fun x:Z=>-128<=x<=127) ?xs |-context[Znth ?i ?xs ?d]=>
  let H:=fresh "Hbyte"in pose proof(qa_Forall_Znth_range xs i d HF ltac:(lia))as H;
  let v:=fresh "byte"in let E:=fresh "Ebyte"in remember(Znth i xs d)as v eqn:E
 end.
Ltac qa_kernel_pure_with_arrays :=
 unfold derivable1,andp,coq_prop;intros;
 qa_rem_bounds;qa_target_ranges;qa_array_target_ranges;
 unfold qa_min,qa_max;repeat first[assumption|split|reflexivity];lia.
