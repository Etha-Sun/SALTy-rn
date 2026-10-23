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
Definition attempt_test_rvv_partial_solve_wit_12 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_12.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_12)by(unfold test_rvv_partial_solve_wit_12;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_12";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_12";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_13 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_13.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_13)by(unfold test_rvv_partial_solve_wit_13;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_13";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_13";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_14_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_14_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_14_pure)by(unfold test_rvv_partial_solve_wit_14_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_14_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_14_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_14 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_14.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_14)by(unfold test_rvv_partial_solve_wit_14,test_rvv_partial_solve_wit_14_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_14";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_14";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_15_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_15_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_15_pure)by(unfold test_rvv_partial_solve_wit_15_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_15_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_15_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_15 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_15.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_15)by(unfold test_rvv_partial_solve_wit_15,test_rvv_partial_solve_wit_15_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_15";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_15";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_16_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_16_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_16_pure)by(unfold test_rvv_partial_solve_wit_16_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_16_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_16_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_16 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_16.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_16)by(unfold test_rvv_partial_solve_wit_16,test_rvv_partial_solve_wit_16_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_16";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_16";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_17 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_17.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_17)by(unfold test_rvv_partial_solve_wit_17;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_17";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_17";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_18_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_18_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_18_pure)by(unfold test_rvv_partial_solve_wit_18_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_18_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_18_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_18 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_18.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_18)by(unfold test_rvv_partial_solve_wit_18,test_rvv_partial_solve_wit_18_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_18";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_18";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_19 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_19.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_19)by(unfold test_rvv_partial_solve_wit_19;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_19";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_19";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_20_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_20_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_20_pure)by(unfold test_rvv_partial_solve_wit_20_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_20_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_20_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_20 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_20.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_20)by(unfold test_rvv_partial_solve_wit_20,test_rvv_partial_solve_wit_20_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_20";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_20";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_21 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_21.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_21)by(unfold test_rvv_partial_solve_wit_21;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_21";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_21";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_22 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_22.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_22)by(unfold test_rvv_partial_solve_wit_22;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_22";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_22";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_23_pure : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_23_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_23_pure)by(unfold test_rvv_partial_solve_wit_23_pure;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_23_pure";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_23_pure";exact None). Defined.
Definition attempt_test_rvv_partial_solve_wit_23 : option U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_23.
Proof. let H:=fresh "checked"in tryif(assert(H:U8PackedKernel.unit_goal.test_rvv_partial_solve_wit_23)by(unfold test_rvv_partial_solve_wit_23,test_rvv_partial_solve_wit_23_aux;first[solve[timeout 10(right;work)]|solve[timeout 10(left;work)]|solve[timeout 10 work]]))then(idtac "CVC_PASS test_rvv_partial_solve_wit_23";exact(Some H))else(idtac "CVC_PENDING test_rvv_partial_solve_wit_23";exact None). Defined.
