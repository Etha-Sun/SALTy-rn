From Coq Require Import ZArith Lia Strings.String.
From Rndne Require Export Bits Model Types VectorModel.
From QcpRvv32 Require Export FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rndne_local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof. intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity]. Qed.
Lemma rndne_active_self_eq : forall i vl x,
 rndne_active_ne i vl x x = rndne_active_self_ne i vl x.
Proof. reflexivity. Qed.
Ltac rndne_vector_finish :=
 try left; intros;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold rndne_same_bits, same_bits in *; subst;
 repeat rewrite <- rndne_active_self_eq in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 first [solve [unfold derivable1, andp, coq_prop, truep; intros;
               repeat first [assumption | split | reflexivity]; lia]
 | unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t,
   UndefStructPreduint32x4_t, UndefStructPredvfloat32m8_t,
   UndefStructPredvuint32m8_t, UndefStructPredvbool4_t;
   rewrite ?rndne_local_field_address;
   repeat progress rewrite <- logic_equiv_andp_assoc;
   first [apply _derivable1_andp_intros;
     [unfold derivable1,andp,coq_prop; intros;
      repeat first [assumption|split|reflexivity];lia
     |opaque_leaves;sepcon_assoc_change;fast_cancel]
   |opaque_leaves;sepcon_assoc_change;fast_cancel]].

Ltac rndne_active_finish :=
 try left; intros; unfold rndne_same_bits, same_bits in *; subst;
 cbv beta zeta delta [rndne_active___riscv_vfabs_v_f32m8 rndne_active___riscv_vfadd_vf_f32m8 rndne_active___riscv_vfsub_vf_f32m8 rndne_active___riscv_vfsgnj_vv_f32m8 rndne_active___riscv_vmfgt_vf_f32m8_b4 rndne_active___riscv_vor_vx_u32m8 rndne_active___riscv_vmerge_vvm_f32m8 rndne_active_self_ne rndne_active_ne] in *;
 repeat match goal with
 | |- context[Z.ltb ?i ?vl] => destruct (Z.ltb_spec i vl)
 | |- context[Z.eqb ?i ?j] => destruct (Z.eqb_spec i j)
 end;
 entailer!; try congruence; try lia;
 try solve [unfold derivable1, andp, coq_prop, truep; intros; repeat split; auto; lia].
