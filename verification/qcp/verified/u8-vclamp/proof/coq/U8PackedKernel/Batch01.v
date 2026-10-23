From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic U8KernelLogic.
From LeaderAutomation Require Import FastFrame.
From U8PackedKernel Require Import Prelude unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Ltac finish_pure := repeat apply derivable1s_truep_intros;apply derivable1s_coq_prop_r;lia.
Ltac work := intros;subst;
 first[solve[finish_pure]|rewrite ?sizeof_uchar in *;unfold unsigned_last_nbits,u8_bound in *;
 replace(2^8)%Z with 256%Z in * by reflexivity;
 rewrite ?Z.mul_1_r,?Z.add_0_r in *;
 first[solve[finish_pure]|solve[entailer!]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]].
Definition attempt_test_rvv_entail_wit_3 : option U8PackedKernel.unit_goal.test_rvv_entail_wit_3.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_entail_wit_3)by(unfold test_rvv_entail_wit_3;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_entail_wit_3";exact(Some H))else(idtac "CVC_PENDING test_rvv_entail_wit_3";exact None). Defined.
Definition attempt_test_rvv_entail_wit_4 : option U8PackedKernel.unit_goal.test_rvv_entail_wit_4.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_entail_wit_4)by(unfold test_rvv_entail_wit_4;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_entail_wit_4";exact(Some H))else(idtac "CVC_PENDING test_rvv_entail_wit_4";exact None). Defined.
Definition attempt_test_rvv_return_wit_1 : option U8PackedKernel.unit_goal.test_rvv_return_wit_1.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_return_wit_1)by(unfold test_rvv_return_wit_1;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_return_wit_1";exact(Some H))else(idtac "CVC_PENDING test_rvv_return_wit_1";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_1 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_1.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_1)by(unfold test_rvv_partial_solve_wit_1;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_1";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_1";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_2 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_2.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_2)by(unfold test_rvv_partial_solve_wit_2;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_2";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_2";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_3 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_3.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_3)by(unfold test_rvv_partial_solve_wit_3;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_3";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_3";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_4 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_4.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_4)by(unfold test_rvv_partial_solve_wit_4;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_4";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_4";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_5 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_5.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_5)by(unfold test_rvv_partial_solve_wit_5;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_5";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_5";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_6_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_6_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_6_pure)by(unfold test_rvv_partial_solve_wit_6_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_6_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_6_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_6 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_6.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_6)by(unfold test_rvv_partial_solve_wit_6,test_rvv_partial_solve_wit_6_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_6";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_6";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_7_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_7_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_7_pure)by(unfold test_rvv_partial_solve_wit_7_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_7_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_7_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_7 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_7.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_7)by(unfold test_rvv_partial_solve_wit_7,test_rvv_partial_solve_wit_7_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_7";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_7";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_8 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_8.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_8)by(unfold test_rvv_partial_solve_wit_8;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_8";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_8";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_9_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_9_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_9_pure)by(unfold test_rvv_partial_solve_wit_9_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_9_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_9_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_9 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_9.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_9)by(unfold test_rvv_partial_solve_wit_9,test_rvv_partial_solve_wit_9_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_9";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_9";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_10 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_10.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_10)by(unfold test_rvv_partial_solve_wit_10;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_10";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_10";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_11_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_11_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_11_pure)by(unfold test_rvv_partial_solve_wit_11_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_11_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_11_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_11 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_11.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_11)by(unfold test_rvv_partial_solve_wit_11,test_rvv_partial_solve_wit_11_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_11";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_11";exact None). Defined.
