From Qu8Cvt Require Import RvvKernelBounds rvv_unit_goal.
From Coq Require Import ZArith Lia List.
From QcpVadd Require Import VaddBits.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac direct_u16_frame :=
 lazymatch goal with
 | |-?P |-- (?Q && ?R)=>apply _derivable1_andp_intros;[direct_u16_frame|direct_u16_frame]
 |_=>first[solve[cvt_pure]|cvt_unsigned_atom|opaque_leaves;sepcon_assoc_change;fast_cancel]
 end.
Lemma proof_of_test_rvv_partial_solve_wit_10 : Qu8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_10.
Proof. unfold Qu8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_10, Qu8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_10_aux;intros _;intros params_pre output_pre input_pre batch_pre Scale RawZ A;intros;
 pose proof(cvt_u16_range(unsigned_last_nbits(0-unsigned_last_nbits RawZ 32)32))as Hseed;
 change(0<=cvt_seed_u16 RawZ<=65535)in Hseed;
 unfold cvt_same,fp32_bits_equal in *;subst;
 rewrite ?sizeof_uchar,?sizeof_float in *;
 unfold UndefStructPreduint16x8_t,UndefStructPredvuint16m4_t;cvt_unroll;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 direct_u16_frame. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_10.
