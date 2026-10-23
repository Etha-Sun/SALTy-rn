From Coq Require Import ZArith Lia.
From Qs8Cvt Require Import Types FastFrame RvvModel rvv___riscv_vfmul_vf_f32m8_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart6.
Lemma proof_of___riscv_vfmul_vf_f32m8_safety_wit_6 : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_6.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_6;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_safety_wit_15 : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_15.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_15;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_safety_wit_24 : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_24.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_24;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_return_wit_1 : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_return_wit_1.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_return_wit_1;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_5_pure : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_5_pure.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_5_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_9 : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_9.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_9, Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_9_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_14_pure : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_14_pure.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_14_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_18 : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_18.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_18, Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_18_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_23_pure : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_23_pure.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_23_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_27 : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_27.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_27, Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_27_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_32_pure : Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_32_pure.
Proof. unfold Qs8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_32_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
End CheckedPart6.
