Require Import isla.riscv64.riscv64 RvvDirectAssert RvvFreshGuard RvvGuardFix.
Goal forall `{!islaG Σ} `{!threadG}, True ⊢ WPasm (Smt (Assert (Val (Val_Bool false) Mk_annot)) Mk_annot :t: tnil).
Proof. intros. iIntros "_". directAssert. exfalso; prepare_sidecond; bv_solve. Qed.
Goal forall `{!islaG Σ} `{!threadG}, True ⊢ WPasm (Smt (Assert (Binop (Bvcomp Bvsgt) (Val (Val_Bits (BV 128 1)) Mk_annot) (Val (Val_Bits (BV 128 2)) Mk_annot) Mk_annot)) Mk_annot :t: tnil).
Proof. intros. iIntros "_". directAssert. exfalso; prepare_sidecond; bv_solve. Qed.
