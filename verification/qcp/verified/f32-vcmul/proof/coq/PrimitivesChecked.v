From Coq Require Import ZArith Lia.
From VCMul Require Import Model FastFrame primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac primitive_frame :=
 unfold same_fp32 in *; subst;
 unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,UndefStructPredvfloat32m4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
Module CheckedPrimitives : VC_Correct.
Lemma proof_of_qcp_vcmul_mul_return_wit_1 : qcp_vcmul_mul_return_wit_1.
Proof. unfold qcp_vcmul_mul_return_wit_1; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_add_return_wit_1 : qcp_vcmul_add_return_wit_1.
Proof. unfold qcp_vcmul_add_return_wit_1; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_sub_return_wit_1 : qcp_vcmul_sub_return_wit_1.
Proof. unfold qcp_vcmul_sub_return_wit_1; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_mla_return_wit_1 : qcp_vcmul_mla_return_wit_1.
Proof. unfold qcp_vcmul_mla_return_wit_1; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_mls_return_wit_1 : qcp_vcmul_mls_return_wit_1.
Proof. unfold qcp_vcmul_mls_return_wit_1; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_active_mul_return_wit_1 : qcp_vcmul_active_mul_return_wit_1.
Proof. unfold qcp_vcmul_active_mul_return_wit_1; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_active_mul_return_wit_2 : qcp_vcmul_active_mul_return_wit_2.
Proof. unfold qcp_vcmul_active_mul_return_wit_2; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_active_add_return_wit_1 : qcp_vcmul_active_add_return_wit_1.
Proof. unfold qcp_vcmul_active_add_return_wit_1; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_active_add_return_wit_2 : qcp_vcmul_active_add_return_wit_2.
Proof. unfold qcp_vcmul_active_add_return_wit_2; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_active_sub_return_wit_1 : qcp_vcmul_active_sub_return_wit_1.
Proof. unfold qcp_vcmul_active_sub_return_wit_1; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_vcmul_active_sub_return_wit_2 : qcp_vcmul_active_sub_return_wit_2.
Proof. unfold qcp_vcmul_active_sub_return_wit_2; try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia. Qed.
Lemma proof_of_vmulq_f32_return_wit_1 : vmulq_f32_return_wit_1.
Proof. unfold vmulq_f32_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmulq_f32_partial_solve_wit_1 : vmulq_f32_partial_solve_wit_1.
Proof. unfold vmulq_f32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmulq_f32_partial_solve_wit_2 : vmulq_f32_partial_solve_wit_2.
Proof. unfold vmulq_f32_partial_solve_wit_2; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmulq_f32_partial_solve_wit_3 : vmulq_f32_partial_solve_wit_3.
Proof. unfold vmulq_f32_partial_solve_wit_3; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmulq_f32_partial_solve_wit_4 : vmulq_f32_partial_solve_wit_4.
Proof. unfold vmulq_f32_partial_solve_wit_4; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmulq_f32_partial_solve_wit_5 : vmulq_f32_partial_solve_wit_5.
Proof. unfold vmulq_f32_partial_solve_wit_5; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlaq_f32_return_wit_1 : vmlaq_f32_return_wit_1.
Proof. unfold vmlaq_f32_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlaq_f32_partial_solve_wit_1 : vmlaq_f32_partial_solve_wit_1.
Proof. unfold vmlaq_f32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlaq_f32_partial_solve_wit_2 : vmlaq_f32_partial_solve_wit_2.
Proof. unfold vmlaq_f32_partial_solve_wit_2; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlaq_f32_partial_solve_wit_3 : vmlaq_f32_partial_solve_wit_3.
Proof. unfold vmlaq_f32_partial_solve_wit_3; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlaq_f32_partial_solve_wit_4 : vmlaq_f32_partial_solve_wit_4.
Proof. unfold vmlaq_f32_partial_solve_wit_4; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlaq_f32_partial_solve_wit_5 : vmlaq_f32_partial_solve_wit_5.
Proof. unfold vmlaq_f32_partial_solve_wit_5; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlsq_f32_return_wit_1 : vmlsq_f32_return_wit_1.
Proof. unfold vmlsq_f32_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlsq_f32_partial_solve_wit_1 : vmlsq_f32_partial_solve_wit_1.
Proof. unfold vmlsq_f32_partial_solve_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlsq_f32_partial_solve_wit_2 : vmlsq_f32_partial_solve_wit_2.
Proof. unfold vmlsq_f32_partial_solve_wit_2; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlsq_f32_partial_solve_wit_3 : vmlsq_f32_partial_solve_wit_3.
Proof. unfold vmlsq_f32_partial_solve_wit_3; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlsq_f32_partial_solve_wit_4 : vmlsq_f32_partial_solve_wit_4.
Proof. unfold vmlsq_f32_partial_solve_wit_4; try left; intros; primitive_frame. Qed.
Lemma proof_of_vmlsq_f32_partial_solve_wit_5 : vmlsq_f32_partial_solve_wit_5.
Proof. unfold vmlsq_f32_partial_solve_wit_5; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_1 : __riscv_vfmul_vv_f32m4_safety_wit_1.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_1; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_2 : __riscv_vfmul_vv_f32m4_safety_wit_2.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_2; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_3 : __riscv_vfmul_vv_f32m4_safety_wit_3.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_3; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_4 : __riscv_vfmul_vv_f32m4_safety_wit_4.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_4; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_5 : __riscv_vfmul_vv_f32m4_safety_wit_5.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_5; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_6 : __riscv_vfmul_vv_f32m4_safety_wit_6.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_6; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_7 : __riscv_vfmul_vv_f32m4_safety_wit_7.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_7; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_8 : __riscv_vfmul_vv_f32m4_safety_wit_8.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_8; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_9 : __riscv_vfmul_vv_f32m4_safety_wit_9.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_9; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_10 : __riscv_vfmul_vv_f32m4_safety_wit_10.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_10; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_11 : __riscv_vfmul_vv_f32m4_safety_wit_11.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_11; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_12 : __riscv_vfmul_vv_f32m4_safety_wit_12.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_12; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_13 : __riscv_vfmul_vv_f32m4_safety_wit_13.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_13; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_14 : __riscv_vfmul_vv_f32m4_safety_wit_14.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_14; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_15 : __riscv_vfmul_vv_f32m4_safety_wit_15.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_15; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_safety_wit_16 : __riscv_vfmul_vv_f32m4_safety_wit_16.
Proof. unfold __riscv_vfmul_vv_f32m4_safety_wit_16; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_return_wit_1 : __riscv_vfmul_vv_f32m4_return_wit_1.
Proof. unfold __riscv_vfmul_vv_f32m4_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_1_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_1_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_1_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_1 : __riscv_vfmul_vv_f32m4_partial_solve_wit_1.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_1, __riscv_vfmul_vv_f32m4_partial_solve_wit_1_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_2_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_2_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_2_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_2 : __riscv_vfmul_vv_f32m4_partial_solve_wit_2.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_2, __riscv_vfmul_vv_f32m4_partial_solve_wit_2_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_3_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_3_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_3_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_3 : __riscv_vfmul_vv_f32m4_partial_solve_wit_3.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_3, __riscv_vfmul_vv_f32m4_partial_solve_wit_3_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_4_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_4_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_4_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_4 : __riscv_vfmul_vv_f32m4_partial_solve_wit_4.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_4, __riscv_vfmul_vv_f32m4_partial_solve_wit_4_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_5_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_5_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_5_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_5 : __riscv_vfmul_vv_f32m4_partial_solve_wit_5.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_5, __riscv_vfmul_vv_f32m4_partial_solve_wit_5_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_6_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_6_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_6_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_6 : __riscv_vfmul_vv_f32m4_partial_solve_wit_6.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_6, __riscv_vfmul_vv_f32m4_partial_solve_wit_6_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_7_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_7_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_7_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_7 : __riscv_vfmul_vv_f32m4_partial_solve_wit_7.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_7, __riscv_vfmul_vv_f32m4_partial_solve_wit_7_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_8_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_8_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_8_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_8 : __riscv_vfmul_vv_f32m4_partial_solve_wit_8.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_8, __riscv_vfmul_vv_f32m4_partial_solve_wit_8_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_9_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_9_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_9_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_9 : __riscv_vfmul_vv_f32m4_partial_solve_wit_9.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_9, __riscv_vfmul_vv_f32m4_partial_solve_wit_9_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_10_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_10_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_10_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_10 : __riscv_vfmul_vv_f32m4_partial_solve_wit_10.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_10, __riscv_vfmul_vv_f32m4_partial_solve_wit_10_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_11_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_11_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_11_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_11 : __riscv_vfmul_vv_f32m4_partial_solve_wit_11.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_11, __riscv_vfmul_vv_f32m4_partial_solve_wit_11_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_12_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_12_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_12_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_12 : __riscv_vfmul_vv_f32m4_partial_solve_wit_12.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_12, __riscv_vfmul_vv_f32m4_partial_solve_wit_12_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_13_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_13_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_13_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_13 : __riscv_vfmul_vv_f32m4_partial_solve_wit_13.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_13, __riscv_vfmul_vv_f32m4_partial_solve_wit_13_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_14_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_14_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_14_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_14 : __riscv_vfmul_vv_f32m4_partial_solve_wit_14.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_14, __riscv_vfmul_vv_f32m4_partial_solve_wit_14_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_15_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_15_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_15_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_15 : __riscv_vfmul_vv_f32m4_partial_solve_wit_15.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_15, __riscv_vfmul_vv_f32m4_partial_solve_wit_15_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_16_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_16_pure.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_16_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_16 : __riscv_vfmul_vv_f32m4_partial_solve_wit_16.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_16, __riscv_vfmul_vv_f32m4_partial_solve_wit_16_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_17 : __riscv_vfmul_vv_f32m4_partial_solve_wit_17.
Proof. unfold __riscv_vfmul_vv_f32m4_partial_solve_wit_17; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_1 : __riscv_vfadd_vv_f32m4_safety_wit_1.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_1; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_2 : __riscv_vfadd_vv_f32m4_safety_wit_2.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_2; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_3 : __riscv_vfadd_vv_f32m4_safety_wit_3.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_3; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_4 : __riscv_vfadd_vv_f32m4_safety_wit_4.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_4; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_5 : __riscv_vfadd_vv_f32m4_safety_wit_5.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_5; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_6 : __riscv_vfadd_vv_f32m4_safety_wit_6.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_6; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_7 : __riscv_vfadd_vv_f32m4_safety_wit_7.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_7; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_8 : __riscv_vfadd_vv_f32m4_safety_wit_8.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_8; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_9 : __riscv_vfadd_vv_f32m4_safety_wit_9.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_9; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_10 : __riscv_vfadd_vv_f32m4_safety_wit_10.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_10; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_11 : __riscv_vfadd_vv_f32m4_safety_wit_11.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_11; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_12 : __riscv_vfadd_vv_f32m4_safety_wit_12.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_12; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_13 : __riscv_vfadd_vv_f32m4_safety_wit_13.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_13; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_14 : __riscv_vfadd_vv_f32m4_safety_wit_14.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_14; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_15 : __riscv_vfadd_vv_f32m4_safety_wit_15.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_15; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_safety_wit_16 : __riscv_vfadd_vv_f32m4_safety_wit_16.
Proof. unfold __riscv_vfadd_vv_f32m4_safety_wit_16; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_return_wit_1 : __riscv_vfadd_vv_f32m4_return_wit_1.
Proof. unfold __riscv_vfadd_vv_f32m4_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_1_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_1_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_1_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_1 : __riscv_vfadd_vv_f32m4_partial_solve_wit_1.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_1, __riscv_vfadd_vv_f32m4_partial_solve_wit_1_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_2_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_2_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_2_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_2 : __riscv_vfadd_vv_f32m4_partial_solve_wit_2.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_2, __riscv_vfadd_vv_f32m4_partial_solve_wit_2_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_3_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_3_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_3_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_3 : __riscv_vfadd_vv_f32m4_partial_solve_wit_3.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_3, __riscv_vfadd_vv_f32m4_partial_solve_wit_3_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_4_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_4_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_4_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_4 : __riscv_vfadd_vv_f32m4_partial_solve_wit_4.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_4, __riscv_vfadd_vv_f32m4_partial_solve_wit_4_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_5_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_5_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_5_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_5 : __riscv_vfadd_vv_f32m4_partial_solve_wit_5.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_5, __riscv_vfadd_vv_f32m4_partial_solve_wit_5_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_6_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_6_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_6_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_6 : __riscv_vfadd_vv_f32m4_partial_solve_wit_6.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_6, __riscv_vfadd_vv_f32m4_partial_solve_wit_6_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_7_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_7_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_7_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_7 : __riscv_vfadd_vv_f32m4_partial_solve_wit_7.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_7, __riscv_vfadd_vv_f32m4_partial_solve_wit_7_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_8_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_8_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_8_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_8 : __riscv_vfadd_vv_f32m4_partial_solve_wit_8.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_8, __riscv_vfadd_vv_f32m4_partial_solve_wit_8_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_9_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_9_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_9_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_9 : __riscv_vfadd_vv_f32m4_partial_solve_wit_9.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_9, __riscv_vfadd_vv_f32m4_partial_solve_wit_9_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_10_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_10_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_10_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_10 : __riscv_vfadd_vv_f32m4_partial_solve_wit_10.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_10, __riscv_vfadd_vv_f32m4_partial_solve_wit_10_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_11_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_11_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_11_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_11 : __riscv_vfadd_vv_f32m4_partial_solve_wit_11.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_11, __riscv_vfadd_vv_f32m4_partial_solve_wit_11_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_12_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_12_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_12_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_12 : __riscv_vfadd_vv_f32m4_partial_solve_wit_12.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_12, __riscv_vfadd_vv_f32m4_partial_solve_wit_12_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_13_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_13_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_13_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_13 : __riscv_vfadd_vv_f32m4_partial_solve_wit_13.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_13, __riscv_vfadd_vv_f32m4_partial_solve_wit_13_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_14_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_14_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_14_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_14 : __riscv_vfadd_vv_f32m4_partial_solve_wit_14.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_14, __riscv_vfadd_vv_f32m4_partial_solve_wit_14_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_15_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_15_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_15_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_15 : __riscv_vfadd_vv_f32m4_partial_solve_wit_15.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_15, __riscv_vfadd_vv_f32m4_partial_solve_wit_15_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_16_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_16_pure.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_16_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_16 : __riscv_vfadd_vv_f32m4_partial_solve_wit_16.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_16, __riscv_vfadd_vv_f32m4_partial_solve_wit_16_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_17 : __riscv_vfadd_vv_f32m4_partial_solve_wit_17.
Proof. unfold __riscv_vfadd_vv_f32m4_partial_solve_wit_17; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_1 : __riscv_vfsub_vv_f32m4_safety_wit_1.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_1; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_2 : __riscv_vfsub_vv_f32m4_safety_wit_2.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_2; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_3 : __riscv_vfsub_vv_f32m4_safety_wit_3.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_3; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_4 : __riscv_vfsub_vv_f32m4_safety_wit_4.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_4; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_5 : __riscv_vfsub_vv_f32m4_safety_wit_5.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_5; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_6 : __riscv_vfsub_vv_f32m4_safety_wit_6.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_6; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_7 : __riscv_vfsub_vv_f32m4_safety_wit_7.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_7; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_8 : __riscv_vfsub_vv_f32m4_safety_wit_8.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_8; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_9 : __riscv_vfsub_vv_f32m4_safety_wit_9.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_9; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_10 : __riscv_vfsub_vv_f32m4_safety_wit_10.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_10; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_11 : __riscv_vfsub_vv_f32m4_safety_wit_11.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_11; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_12 : __riscv_vfsub_vv_f32m4_safety_wit_12.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_12; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_13 : __riscv_vfsub_vv_f32m4_safety_wit_13.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_13; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_14 : __riscv_vfsub_vv_f32m4_safety_wit_14.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_14; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_15 : __riscv_vfsub_vv_f32m4_safety_wit_15.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_15; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_safety_wit_16 : __riscv_vfsub_vv_f32m4_safety_wit_16.
Proof. unfold __riscv_vfsub_vv_f32m4_safety_wit_16; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_return_wit_1 : __riscv_vfsub_vv_f32m4_return_wit_1.
Proof. unfold __riscv_vfsub_vv_f32m4_return_wit_1; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_1_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_1_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_1_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_1 : __riscv_vfsub_vv_f32m4_partial_solve_wit_1.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_1, __riscv_vfsub_vv_f32m4_partial_solve_wit_1_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_2_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_2_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_2_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_2 : __riscv_vfsub_vv_f32m4_partial_solve_wit_2.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_2, __riscv_vfsub_vv_f32m4_partial_solve_wit_2_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_3_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_3_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_3_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_3 : __riscv_vfsub_vv_f32m4_partial_solve_wit_3.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_3, __riscv_vfsub_vv_f32m4_partial_solve_wit_3_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_4_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_4_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_4_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_4 : __riscv_vfsub_vv_f32m4_partial_solve_wit_4.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_4, __riscv_vfsub_vv_f32m4_partial_solve_wit_4_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_5_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_5_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_5_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_5 : __riscv_vfsub_vv_f32m4_partial_solve_wit_5.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_5, __riscv_vfsub_vv_f32m4_partial_solve_wit_5_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_6_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_6_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_6_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_6 : __riscv_vfsub_vv_f32m4_partial_solve_wit_6.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_6, __riscv_vfsub_vv_f32m4_partial_solve_wit_6_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_7_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_7_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_7_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_7 : __riscv_vfsub_vv_f32m4_partial_solve_wit_7.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_7, __riscv_vfsub_vv_f32m4_partial_solve_wit_7_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_8_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_8_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_8_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_8 : __riscv_vfsub_vv_f32m4_partial_solve_wit_8.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_8, __riscv_vfsub_vv_f32m4_partial_solve_wit_8_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_9_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_9_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_9_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_9 : __riscv_vfsub_vv_f32m4_partial_solve_wit_9.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_9, __riscv_vfsub_vv_f32m4_partial_solve_wit_9_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_10_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_10_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_10_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_10 : __riscv_vfsub_vv_f32m4_partial_solve_wit_10.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_10, __riscv_vfsub_vv_f32m4_partial_solve_wit_10_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_11_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_11_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_11_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_11 : __riscv_vfsub_vv_f32m4_partial_solve_wit_11.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_11, __riscv_vfsub_vv_f32m4_partial_solve_wit_11_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_12_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_12_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_12_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_12 : __riscv_vfsub_vv_f32m4_partial_solve_wit_12.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_12, __riscv_vfsub_vv_f32m4_partial_solve_wit_12_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_13_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_13_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_13_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_13 : __riscv_vfsub_vv_f32m4_partial_solve_wit_13.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_13, __riscv_vfsub_vv_f32m4_partial_solve_wit_13_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_14_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_14_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_14_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_14 : __riscv_vfsub_vv_f32m4_partial_solve_wit_14.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_14, __riscv_vfsub_vv_f32m4_partial_solve_wit_14_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_15_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_15_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_15_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_15 : __riscv_vfsub_vv_f32m4_partial_solve_wit_15.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_15, __riscv_vfsub_vv_f32m4_partial_solve_wit_15_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_16_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_16_pure.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_16_pure; intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_16 : __riscv_vfsub_vv_f32m4_partial_solve_wit_16.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_16, __riscv_vfsub_vv_f32m4_partial_solve_wit_16_aux; try left; intros; primitive_frame. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_17 : __riscv_vfsub_vv_f32m4_partial_solve_wit_17.
Proof. unfold __riscv_vfsub_vv_f32m4_partial_solve_wit_17; try left; intros; primitive_frame. Qed.
End CheckedPrimitives.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_mul_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_add_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_sub_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_mla_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_mls_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_active_mul_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_active_mul_return_wit_2.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_active_add_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_active_add_return_wit_2.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_active_sub_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_qcp_vcmul_active_sub_return_wit_2.
Print Assumptions CheckedPrimitives.proof_of_vmulq_f32_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_vmulq_f32_partial_solve_wit_1.
Print Assumptions CheckedPrimitives.proof_of_vmulq_f32_partial_solve_wit_2.
Print Assumptions CheckedPrimitives.proof_of_vmulq_f32_partial_solve_wit_3.
Print Assumptions CheckedPrimitives.proof_of_vmulq_f32_partial_solve_wit_4.
Print Assumptions CheckedPrimitives.proof_of_vmulq_f32_partial_solve_wit_5.
Print Assumptions CheckedPrimitives.proof_of_vmlaq_f32_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_vmlaq_f32_partial_solve_wit_1.
Print Assumptions CheckedPrimitives.proof_of_vmlaq_f32_partial_solve_wit_2.
Print Assumptions CheckedPrimitives.proof_of_vmlaq_f32_partial_solve_wit_3.
Print Assumptions CheckedPrimitives.proof_of_vmlaq_f32_partial_solve_wit_4.
Print Assumptions CheckedPrimitives.proof_of_vmlaq_f32_partial_solve_wit_5.
Print Assumptions CheckedPrimitives.proof_of_vmlsq_f32_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of_vmlsq_f32_partial_solve_wit_1.
Print Assumptions CheckedPrimitives.proof_of_vmlsq_f32_partial_solve_wit_2.
Print Assumptions CheckedPrimitives.proof_of_vmlsq_f32_partial_solve_wit_3.
Print Assumptions CheckedPrimitives.proof_of_vmlsq_f32_partial_solve_wit_4.
Print Assumptions CheckedPrimitives.proof_of_vmlsq_f32_partial_solve_wit_5.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_2.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_3.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_4.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_5.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_6.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_7.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_8.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_9.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_10.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_11.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_12.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_13.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_14.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_15.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_safety_wit_16.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_1_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_2_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_2.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_3_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_3.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_4_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_4.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_5_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_5.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_6_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_6.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_7_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_7.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_8_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_8.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_9_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_9.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_10_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_10.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_11_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_11.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_12_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_12.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_13_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_13.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_14_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_14.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_15_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_15.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_16_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_16.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_17.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_2.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_3.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_4.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_5.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_6.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_7.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_8.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_9.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_10.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_11.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_12.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_13.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_14.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_15.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_safety_wit_16.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_1_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_2_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_2.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_3_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_3.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_4_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_4.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_5_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_5.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_6_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_6.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_7_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_7.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_8_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_8.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_9_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_9.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_10_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_10.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_11_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_11.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_12_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_12.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_13_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_13.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_14_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_14.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_15_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_15.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_16_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_16.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_17.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_2.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_3.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_4.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_5.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_6.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_7.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_8.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_9.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_10.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_11.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_12.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_13.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_14.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_15.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_safety_wit_16.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_return_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_1_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_1.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_2_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_2.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_3_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_3.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_4_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_4.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_5_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_5.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_6_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_6.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_7_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_7.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_8_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_8.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_9_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_9.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_10_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_10.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_11_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_11.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_12_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_12.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_13_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_13.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_14_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_14.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_15_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_15.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_16_pure.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_16.
Print Assumptions CheckedPrimitives.proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_17.
