From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame RvvModel rvv___riscv_vadd_vx_u16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart8.
Lemma proof_of___riscv_vadd_vx_u16m4_safety_wit_8 : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_safety_wit_8.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_safety_wit_8;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_safety_wit_17 : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_safety_wit_17.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_safety_wit_17;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_safety_wit_26 : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_safety_wit_26.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_safety_wit_26;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_partial_solve_wit_1 : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_1.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_1, Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_1_aux;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_partial_solve_wit_6_pure : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_6_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_6_pure;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_partial_solve_wit_10 : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_10.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_10, Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_10_aux;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_partial_solve_wit_15_pure : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_15_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_15_pure;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_partial_solve_wit_19 : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_19.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_19, Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_19_aux;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_partial_solve_wit_24_pure : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_24_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_24_pure;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_partial_solve_wit_28 : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_28.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_28, Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_28_aux;try left;intros;
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
Lemma proof_of___riscv_vadd_vx_u16m4_partial_solve_wit_33 : Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_33.
Proof. unfold Qu8Cvt.rvv___riscv_vadd_vx_u16m4_goal.__riscv_vadd_vx_u16m4_partial_solve_wit_33;try left;intros;
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
End CheckedPart8.
