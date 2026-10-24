From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac opaque_leaves_rec l :=
 lazymatch l with
 | nil => idtac
 | cons (norm_asrt ?v) ?tail =>
   try (let cell := fresh "cell" in let H := fresh "Ecell" in
        remember v as cell eqn:H; clear H);
   opaque_leaves_rec tail
 end.
Ltac opaque_leaves :=
 match goal with |- ?P |-- ?Q =>
 let leaves := All_listasrts P in opaque_leaves_rec leaves end.
Lemma rvv_pull_through : forall A P q R : Assertion,
 (P |-- q ** R) -> (A ** P |-- q ** (A ** R)).
Proof.
 intros A P q R H. eapply derivable1_trans.
 - apply derivable1_sepcon_mono; [apply derivable1_refl | exact H].
 - rewrite (logic_equiv_sepcon_swap A q R). apply derivable1_refl.
Qed.
Ltac pull_cell q :=
 lazymatch goal with
 | |- q ** ?tail |-- _ => apply derivable1_refl
 | |- ?a ** q |-- _ => apply derivable1_sepcon_comm
 | |- ?a ** ?tail |-- _ => eapply rvv_pull_through; pull_cell q
 end.
Ltac fast_cancel :=
 lazymatch goal with
 | |- ?P |-- ?P => apply derivable1_refl
 | |- ?P |-- ?q ** ?Q =>
   eapply (derivable1_trans P (q ** _) (q ** Q));
   [pull_cell q | apply derivable1_sepcon_mono; [apply derivable1_refl | fast_cancel]]
 end.

Print Assumptions rvv_pull_through.

From Coq Require Import Strings.String Lia.
From GemmNeon Require Import LayoutModel.
Local Open Scope string_scope.
Lemma neon_local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof.
 intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity].
Qed.
Print Assumptions neon_local_field_address.
Ltac forget_rhs_fields :=
 repeat match goal with |- ?P |-- ?Q =>
  multimatch Q with context[undef_store_float ?p] =>
   multimatch P with context[store_float p ?value] =>
    sep_apply (store_float_undef_store_float p value)
   end
  end
 end.
Ltac copy_frame :=
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?neon_local_field_address;
 try csimpl;
 first [ apply _derivable1_andp_intros;
  [ unfold derivable1, andp, coq_prop; intros;
    repeat first [assumption | split | reflexivity]; lia
  | forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel ]
 | forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel ].
