Require Import isla.riscv64.riscv64 RvvCachedSteps RvvUpdateExpressions RvvTaggedCache.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
  True ⊢ WPasm (Smt (DefineConst 1 (load_update_expr_0 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_update_expr_0. directCachedVector.
Show.
Abort.