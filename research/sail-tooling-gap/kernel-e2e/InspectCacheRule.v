Require Import isla.riscv64.riscv64 RvvCachedSteps RvvUpdateExpressions.
Lemma inspect_cache `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8) :
  True ⊢ WPasm (Smt (DefineConst 1 (load_update_expr_0 old byte)) Mk_annot :t: tnil).
Proof.
  iIntros "_". unfold load_update_expr_0.
  lazymatch goal with
  | |- environments.envs_entails _ (WPasm (Smt (DefineConst ?n ?e) ?ann :t: ?es)) =>
    idtac "outer matched";
    lazymatch e with
    | context [Val (Val_Bits ?x) _] => idtac "bits" x
    end
  end.
  Set Printing All.
  directCachedVector.
  Show.
Abort.
