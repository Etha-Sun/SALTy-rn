From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame RvvModel rvv___riscv_vsext_vf2_i32m8_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart1.
Lemma proof_of___riscv_vsext_vf2_i32m8_safety_wit_1 : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_safety_wit_1.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_safety_wit_1;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_safety_wit_10 : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_safety_wit_10.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_safety_wit_10;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_safety_wit_19 : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_safety_wit_19.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_safety_wit_19;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_safety_wit_28 : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_safety_wit_28.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_safety_wit_28;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_partial_solve_wit_2 : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_2.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_2, Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_2_aux;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_partial_solve_wit_7_pure : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_7_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_7_pure;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_partial_solve_wit_11 : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_11.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_11, Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_11_aux;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_partial_solve_wit_16_pure : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_16_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_16_pure;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_partial_solve_wit_20 : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_20.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_20, Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_20_aux;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_partial_solve_wit_25_pure : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_25_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_25_pure;try left;intros;
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
Lemma proof_of___riscv_vsext_vf2_i32m8_partial_solve_wit_29 : Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_29.
Proof. unfold Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_29, Qu8Cvt.rvv___riscv_vsext_vf2_i32m8_goal.__riscv_vsext_vf2_i32m8_partial_solve_wit_29_aux;try left;intros;
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
End CheckedPart1.
