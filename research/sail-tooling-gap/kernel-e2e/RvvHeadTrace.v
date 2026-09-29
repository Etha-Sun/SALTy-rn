Require Import isla.riscv64.riscv64 StructAssume.
From iris.proofmode Require Import environments.
Arguments subst_trace : simpl never.
Ltac traceHead es :=
  lazymatch es with
  | ?e :t: ?tail => constr:(e :t: tail)
  | tnil => constr:(tnil)
  | tcases ?ts => constr:(tcases ts)
  | TRACE_LET ?t => traceHead t
  | subst_trace ?v ?x ?t =>
    let t' := traceHead t in
    lazymatch t' with
    | ?e :t: ?tail => constr:(subst_val_event v x e :t: subst_trace v x tail)
    | tnil => constr:(tnil)
    | tcases ?ts => constr:(tcases (map (subst_trace v x) ts))
    end
  | ?def =>
    let body := eval cbv delta [def] in es in
    traceHead body
  end.
Ltac headTraceStep :=
  lazymatch goal with
  | |- envs_entails ?D (WPasm ?es) =>
    lazymatch es with
    | subst_trace _ _ _ =>
      let es' := traceHead es in
      lazymatch es' with
      | ?e :t: ?tail =>
        let e' := eval cbn in e in
        change (envs_entails D (WPasm (e' :t: tail)))
      | tcases ?ts => change (envs_entails D (WPasm (tcases ts)))
      | tnil => change (envs_entails D (WPasm tnil))
      end
    end
  end.
Ltac headKernelAStep := first [headTraceStep | kernelAStep].
