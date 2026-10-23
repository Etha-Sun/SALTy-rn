From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame RvvModel rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart6.
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_3_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_3_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_3_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_6_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_6_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_6_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_9_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_9_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_9_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_12_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_12_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_12_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_15_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_15_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_15_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_18_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_18_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_18_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_21_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_21_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_21_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_24_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_24_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_24_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_27_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_27_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_27_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_30_pure : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_30_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_30_pure;try left;intros;
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
Lemma proof_of___riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_33 : Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_33.
Proof. unfold Qu8Cvt.rvv___riscv_vreinterpret_v_u16m4_i16m4_goal.__riscv_vreinterpret_v_u16m4_i16m4_partial_solve_wit_33;try left;intros;
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
End CheckedPart6.
