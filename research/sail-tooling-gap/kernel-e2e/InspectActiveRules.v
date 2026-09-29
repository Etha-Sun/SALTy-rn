Require Import isla.riscv64.riscv64 RvvCachedSteps RvvTaggedResume RvvActiveCache.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
 True ⊢ WPasm (Smt (DefineConst 1 (load_active_expr_0 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_active_expr_0. directActiveCachedVector.
Abort.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
 True ⊢ WPasm (Smt (DefineConst 1 (load_active_expr_1 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_active_expr_1. directActiveCachedVector.
Abort.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
 True ⊢ WPasm (Smt (DefineConst 1 (load_active_expr_2 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_active_expr_2. directActiveCachedVector.
Abort.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
 True ⊢ WPasm (Smt (DefineConst 1 (load_active_expr_3 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_active_expr_3. directActiveCachedVector.
Abort.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
 True ⊢ WPasm (Smt (DefineConst 1 (load_active_expr_4 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_active_expr_4. directActiveCachedVector.
Abort.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
 True ⊢ WPasm (Smt (DefineConst 1 (load_active_expr_5 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_active_expr_5. directActiveCachedVector.
Abort.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
 True ⊢ WPasm (Smt (DefineConst 1 (load_active_expr_6 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_active_expr_6. directActiveCachedVector.
Abort.
Goal forall `{!islaG Σ} `{!threadG} (old : bv 65536) (byte : bv 8),
 True ⊢ WPasm (Smt (DefineConst 1 (load_active_expr_7 old byte)) Mk_annot :t: tnil).
intros. iIntros "_". unfold load_active_expr_7. directActiveCachedVector.
Abort.
