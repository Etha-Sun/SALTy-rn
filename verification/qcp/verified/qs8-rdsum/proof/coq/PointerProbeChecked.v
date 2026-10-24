From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rdsum Require Import ProbeFacts FastFrame pointer_loop_probe_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac probe_limits := rewrite ?sizeof_char,?sizeof_int in *;repeat rewrite Z.mul_1_r in *;repeat rewrite Z.add_0_r in *;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac probe_addresses :=
 match goal with Hin:rd_inputs ?m ?base 2 ?N ?stride,Hn:?n <= ?N |- _ =>
 let Hk:=fresh "Hk"in assert(Hk:0<=N-n<N)by lia;
 let Hpair:=fresh "Hpair"in pose proof(rd_probe_present_pair m base N stride(N-n)Hin Hk)as Hpair;destruct Hpair;
 prop_apply(rd_mem_addresses m);let Ha:=fresh "Haddr"in Intros_p Ha;
 let E:=fresh "Epointer"in pose proof(rd_probe_pointer_normalize m base N stride(N-n)Ha Hin Hk)as E;try rewrite E in *
 end.
Module CheckedPointerProbe : Qs8Rdsum.pointer_loop_probe_goal.VC_Correct.
Lemma proof_of_rdsum_pointer_probe_safety_wit_1 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_1.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_1;intros;probe_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_pointer_probe_safety_wit_2 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_2.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_2;intros;probe_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_pointer_probe_safety_wit_3 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_3.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_3;intros;probe_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_pointer_probe_safety_wit_4 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_4.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_4;intros;probe_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_pointer_probe_safety_wit_5 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_5.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_safety_wit_5;intros;probe_limits;entailer!;lia. Qed.
Lemma proof_of_rdsum_pointer_probe_entail_wit_1 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_entail_wit_1.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_entail_wit_1;left;intros out0 zero0 stride0 base0 N A F;intros;probe_limits;prop_apply(IntArray.full_Zlength out0 N A);Intros_p Hlen;rewrite Z.sub_diag,rd_probe_initial;entailer!;lia. Qed.
Lemma proof_of_rdsum_pointer_probe_entail_wit_2 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_entail_wit_2.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_entail_wit_2;left;intros;probe_limits;subst retval_5 retval_4 retval_3 retval_2 retval input output;probe_addresses;replace(input_pre+(n_pre-n)+stride_pre)with(input_pre+stride_pre+(n_pre-n))in * by ring;rewrite rd_probe_store_step by lia;entailer!;lia. Qed.
Lemma proof_of_rdsum_pointer_probe_entail_wit_3 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_entail_wit_3.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_entail_wit_3;left;intros;probe_limits;replace(n_pre-(n-1))with(n_pre-n+1)by ring;entailer!;lia. Qed.
Lemma proof_of_rdsum_pointer_probe_return_wit_1 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_return_wit_1.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_return_wit_1;left;intros;probe_limits;assert(n=0)by lia;subst n;rewrite Z.sub_0_r,rd_probe_finish by lia;apply derivable1_refl. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_1_pure : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_1_pure.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_1_pure;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_1 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_1.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_1, Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_1_aux;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_2_pure : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_2_pure.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_2_pure;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_2 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_2.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_2, Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_2_aux;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_3_pure : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_3_pure.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_3_pure;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_3 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_3.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_3, Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_3_aux;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_4_pure : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_4_pure.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_4_pure;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_4 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_4.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_4, Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_4_aux;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_5_pure : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_5_pure.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_5_pure;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_5 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_5.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_5, Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_5_aux;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_6_pure : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_6_pure.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_6_pure;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_pointer_probe_partial_solve_wit_6 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_6.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_6, Qs8Rdsum.pointer_loop_probe_goal.rdsum_pointer_probe_partial_solve_wit_6_aux;try left;intros;probe_limits;subst;try probe_addresses;first[solve[entailer!;try lia;try congruence;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]. Qed.
Lemma proof_of_rdsum_scalar_tail_probe_return_wit_1 : Qs8Rdsum.pointer_loop_probe_goal.rdsum_scalar_tail_probe_return_wit_1.
Proof. unfold Qs8Rdsum.pointer_loop_probe_goal.rdsum_scalar_tail_probe_return_wit_1;left;intros;rewrite signed_unsigned_add_l,signed_unsigned_add_r by lia;fold rs_s32;apply derivable1_refl. Qed.
End CheckedPointerProbe.
