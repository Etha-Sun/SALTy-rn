From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame RvvModel rvv___riscv_vzext_vf2_u16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart7.
Lemma proof_of___riscv_vzext_vf2_u16m4_safety_wit_7 : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_safety_wit_7.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_safety_wit_7;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_safety_wit_16 : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_safety_wit_16.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_safety_wit_16;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_safety_wit_25 : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_safety_wit_25.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_safety_wit_25;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_partial_solve_wit_1_pure : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_1_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_1_pure;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_partial_solve_wit_5 : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_5.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_5, Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_5_aux;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_partial_solve_wit_10_pure : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_10_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_10_pure;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_partial_solve_wit_14 : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_14.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_14, Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_14_aux;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_partial_solve_wit_19_pure : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_19_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_19_pure;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_partial_solve_wit_23 : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_23.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_23, Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_23_aux;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_partial_solve_wit_28_pure : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_28_pure.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_28_pure;try left;intros;
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
Lemma proof_of___riscv_vzext_vf2_u16m4_partial_solve_wit_32 : Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_32.
Proof. unfold Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_32, Qu8Cvt.rvv___riscv_vzext_vf2_u16m4_goal.__riscv_vzext_vf2_u16m4_partial_solve_wit_32_aux;try left;intros;
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
End CheckedPart7.
