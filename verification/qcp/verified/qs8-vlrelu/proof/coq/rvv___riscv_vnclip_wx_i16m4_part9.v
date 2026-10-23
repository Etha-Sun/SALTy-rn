From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Import Types NeonFrame RvvModel rvv___riscv_vnclip_wx_i16m4_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart9.
Lemma proof_of___riscv_vnclip_wx_i16m4_safety_wit_9 : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_safety_wit_9.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_safety_wit_9;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_safety_wit_18 : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_safety_wit_18.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_safety_wit_18;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_safety_wit_27 : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_safety_wit_27.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_safety_wit_27;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_partial_solve_wit_2_pure : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_2_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_2_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_partial_solve_wit_6 : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_6.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_6, Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_6_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_partial_solve_wit_11_pure : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_11_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_11_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_partial_solve_wit_15 : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_15.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_15, Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_15_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_partial_solve_wit_20_pure : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_20_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_20_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_partial_solve_wit_24 : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_24.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_24, Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_24_aux;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
Lemma proof_of___riscv_vnclip_wx_i16m4_partial_solve_wit_29_pure : Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_29_pure.
Proof. unfold Qs8Lrelu.rvv___riscv_vnclip_wx_i16m4_goal.__riscv_vnclip_wx_i16m4_partial_solve_wit_29_pure;try left;intros;
 subst;
 unfold UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
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
End CheckedPart9.
