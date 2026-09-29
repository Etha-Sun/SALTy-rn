Require Import isla.riscv64.riscv64 RvvDirectAssert.
Goal forall `{!islaG Σ} `{!threadG}, True ⊢ WPasm (Smt (Assert (Binop (Bvcomp Bvsgt) (Val (Val_Bits (BV 128 1)) Mk_annot) (Val (Val_Bits (BV 128 2)) Mk_annot) Mk_annot)) Mk_annot :t: tnil).
Proof. intros. iIntros "_". directAssert.
Show.
match goal with H : bool_decide _ = true |- _ => apply bool_decide_eq_true in H end.
exfalso. bv_solve.
Unshelve. all: try done.
Show.
Abort.
