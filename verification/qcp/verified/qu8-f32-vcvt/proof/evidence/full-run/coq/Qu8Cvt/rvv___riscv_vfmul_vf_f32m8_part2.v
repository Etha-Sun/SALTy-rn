From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame RvvModel rvv___riscv_vfmul_vf_f32m8_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart2.
Lemma proof_of___riscv_vfmul_vf_f32m8_safety_wit_2 : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_2.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_2;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_safety_wit_11 : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_11.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_11;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_safety_wit_20 : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_20.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_20;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_safety_wit_29 : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_29.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_safety_wit_29;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_3_pure : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_3_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_3_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_7 : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_7.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_7, Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_7_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_12_pure : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_12_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_12_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_16 : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_16.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_16, Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_16_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_21_pure : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_21_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_21_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_25 : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_25.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_25, Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_25_aux;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
Lemma proof_of___riscv_vfmul_vf_f32m8_partial_solve_wit_30_pure : Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_30_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vfmul_vf_f32m8_goal.__riscv_vfmul_vf_f32m8_partial_solve_wit_30_pure;try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
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
End CheckedPart2.
