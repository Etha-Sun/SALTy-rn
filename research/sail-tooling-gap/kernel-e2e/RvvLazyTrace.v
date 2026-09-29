Require Import isla.riscv64.riscv64 StructAssume.
From iris.proofmode Require Import environments.
(* Preserve deferred substitutions in the suffix. Only reduce the event that
   the next lifting rule will inspect. All conversions remain kernel checked. *)
Arguments subst_trace : simpl never.
Ltac lazyTraceHead :=
  lazymatch goal with
  | |- envs_entails ?D (WPasm ?es) =>
    lazymatch es with
    | subst_trace _ _ _ =>
      let es' := eval hnf in es in
      lazymatch es' with
      | ?e :t: ?tail =>
        let e' := eval cbn in e in
        change (envs_entails D (WPasm (e' :t: tail)))
      | tcases ?ts => change (envs_entails D (WPasm (tcases ts)))
      | tnil => change (envs_entails D (WPasm tnil))
      end
    end
  end.
Ltac lazyKernelAStep := first [lazyTraceHead | kernelAStep].
