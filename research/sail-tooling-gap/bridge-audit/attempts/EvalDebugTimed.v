Require Import isla.riscv64.riscv64.
Require Import WholeStruct BitsProof.
Require Import Bridge.rvv_widen.a800001d2.

(* Performance experiment: cache structural expression evaluation in a
   separately checked opaque lemma. The ISA trace and theorem are unchanged.
   Reduction list follows Islaris automation.v/solve_compute_wp_exp. *)
Ltac solve_compute_wp_exp ::=
  let H := fresh in let x := fresh "x" in move => x H;
  lazymatch goal with |- eval_exp' ?e = _ =>
    let reduced := eval lazy [eval_exp' mapM mbind option_bind eval_unop eval_manyop eval_binop option_fmap option_map fmap mret option_ret guard_or mthrow option_mfail foldl bvn_to_bv decide decide_rel BinNat.N.eq_dec N.eq_dec N_rec N_rect bvn_n sumbool_rec sumbool_rect BinPos.Pos.eq_dec Pos.eq_dec positive_rect positive_rec eq_rect eq_ind_r eq_ind eq_sym bvn_val N.add N.sub Pos.add Pos.succ Pos.sub_mask Pos.double_mask Pos.succ_double_mask Pos.pred_double Pos.double_pred_mask] in (eval_exp' e) in
    let Heval := fresh "Heval" in
    assert (Heval : eval_exp' e = reduced) by
      vm_cast_no_check (eq_refl reduced);
    rewrite Heval
  end;
  autorewrite with isla_coq_rewrite; apply H.

Goal forall `{!islaG Σ} (pc : Z), LiTactic (compute_wp_exp (Manyop (Bvmanyarith Bvadd) [Val (Val_Bits (Z_to_bv 64 pc)) Mk_annot; Val (Val_Bits (BV 64 4)) Mk_annot] Mk_annot)).
intros. eapply compute_wp_exp_hint. Time solve_compute_wp_exp.
Time Qed.
