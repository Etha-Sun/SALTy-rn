Require Import isla.riscv64.riscv64.
Require Import WholeStruct BitsProof.
Require Import Bridge.rvv_widen.a800001d2.

Goal forall `{!islaG Σ} (pc : Z), LiTactic (compute_wp_exp (Manyop (Bvmanyarith Bvadd) [Val (Val_Bits (Z_to_bv 64 pc)) Mk_annot; Val (Val_Bits (BV 64 4)) Mk_annot] Mk_annot)).
intros. eapply compute_wp_exp_hint. Time solve_compute_wp_exp.
Time Qed.
