Require Import isla.riscv64.riscv64.
Require Import WholeStruct BitsProof.
Require Import Bridge.rvv_widen.a800001d2.

Ltac solve_compute_wp_exp ::= abstract (
  let H := fresh in move => ? H;
  lazy [eval_exp' mapM mbind option_bind eval_unop eval_manyop eval_binop option_fmap option_map fmap mret option_ret guard_or mthrow option_mfail foldl bvn_to_bv decide decide_rel BinNat.N.eq_dec N.eq_dec N_rec N_rect bvn_n sumbool_rec sumbool_rect BinPos.Pos.eq_dec Pos.eq_dec positive_rect positive_rec eq_rect eq_ind_r eq_ind eq_sym bvn_val N.add N.sub Pos.add Pos.succ Pos.sub_mask Pos.double_mask Pos.succ_double_mask Pos.pred_double Pos.double_pred_mask];
  lazymatch goal with | |- Some _ = _ => idtac | |- ?G => idtac "solve_compute_wp_exp failed:" G; fail end;
  autorewrite with isla_coq_rewrite;
  apply H).

Goal forall `{!islaG Σ} (pc : Z), LiTactic (compute_wp_exp (Manyop (Bvmanyarith Bvadd) [Val (Val_Bits (Z_to_bv 64 pc)) Mk_annot; Val (Val_Bits (BV 64 4)) Mk_annot] Mk_annot)).
intros. eapply compute_wp_exp_hint. Time solve_compute_wp_exp.
Time Qed.
