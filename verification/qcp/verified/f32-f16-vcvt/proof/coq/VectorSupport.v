From Coq Require Import ZArith Lia Strings.String.
From F32F16 Require Export Bits Model Types IntegerModel VectorModel.
From QcpRvv32 Require Export FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma f16_local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof. intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity]. Qed.
Ltac f16_vector_finish :=
 try left; intros;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold f16_same_bits, same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 first [solve [unfold derivable1, andp, coq_prop, truep; intros;
               repeat first [assumption | split | reflexivity]; lia]
 | unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t,
   UndefStructPreduint32x4_t, UndefStructPredvfloat32m8_t,
   UndefStructPredvuint32m8_t, UndefStructPredvbool4_t,
   UndefStructPreduint16x4_t,UndefStructPreduint16x8_t,UndefStructPredvuint16m4_t;
   rewrite ?f16_local_field_address;
   repeat progress rewrite <- logic_equiv_andp_assoc;
   first [apply _derivable1_andp_intros;
     [unfold derivable1,andp,coq_prop; intros;
      repeat first [assumption|split|reflexivity];lia
     |opaque_leaves;sepcon_assoc_change;fast_cancel]
   |opaque_leaves;sepcon_assoc_change;fast_cancel]].

Ltac f16_active_finish :=
 try left; intros; unfold f16_same_bits, same_bits in *; subst;
 cbv beta zeta delta [f16_active___riscv_vfabs_v_f32m8 f16_active___riscv_vadd_vx_u32m8 f16_active___riscv_vand_vx_u32m8 f16_active___riscv_vmaxu_vx_u32m8 f16_active___riscv_vmsgtu_vx_u32m8_b4 f16_active___riscv_vfmul_vf_f32m8 f16_active___riscv_vfadd_vv_f32m8 f16_active_qcp_f16_rvv_shrn_0 f16_active_qcp_f16_rvv_shrn_13 f16_active_qcp_f16_rvv_shrn_16 f16_active___riscv_vand_vx_u16m4 f16_active___riscv_vadd_vv_u16m4 f16_active___riscv_vmerge_vxm_u16m4 f16_active___riscv_vor_vv_u16m4 f16_gt32] in *;
 repeat match goal with
 | |- context[Z.ltb ?i ?vl] => destruct (Z.ltb_spec i vl)
 | |- context[Z.eqb ?i ?j] => destruct (Z.eqb_spec i j)
 end;
 entailer!; try congruence; try lia;
 try solve [unfold derivable1, andp, coq_prop, truep; intros; repeat split; auto; lia].
