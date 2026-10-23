From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic.
From LeaderAutomation Require Import FastFrame.
From VectorProof Require Import AddressFacts MemorySplit.
From VectorVle Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac direct_frame := first
 [apply _derivable1_andp_intros;[direct_frame|direct_frame]
 |solve[apply derivable1s_coq_prop_r;lia]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]].
Ltac norm_addresses := rewrite ?typed_field_address;rewrite <-?dot_field_address;
 rewrite ?sizeof_uchar,?Z.mul_1_r,?Z.add_0_r in *.
Ltac input_split := match goal with|-?P|--?Q=>
 lazymatch P with context[UCharArray.full ?p ?n ?A]=>
 lazymatch Q with context[UCharArray.seg ?q 0 ?vl _]=>
 unify q p;sep_apply_l_atomic(split_input p n vl A ltac:(lia)) end end end.
Ltac work := intros;subst;
 first[solve[repeat apply derivable1s_truep_intros;apply derivable1s_coq_prop_r;lia]
 |solve[input_split;norm_addresses;direct_frame]
 |solve[norm_addresses;direct_frame]
 |solve[unfold UndefStructPredvuint8m8_t;norm_addresses;direct_frame]
 |solve[entailer!]].
Definition attempt___riscv_vle8_v_u8m8_return_wit_1:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_return_wit_1.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_return_wit_1)by(unfold __riscv_vle8_v_u8m8_return_wit_1;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_return_wit_1";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_return_wit_1";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_1_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_1_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_1_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_1_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_1_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_1_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_1:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_1.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_1)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_1,__riscv_vle8_v_u8m8_partial_solve_wit_1_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_1";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_1";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_2_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_2_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_2_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_2_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_2_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_2_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_2:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_2.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_2)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_2,__riscv_vle8_v_u8m8_partial_solve_wit_2_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_2";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_2";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_3_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_3_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_3_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_3_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_3_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_3_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_3:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_3.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_3)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_3,__riscv_vle8_v_u8m8_partial_solve_wit_3_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_3";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_3";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_4_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_4_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_4_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_4_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_4_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_4_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_4:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_4.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_4)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_4,__riscv_vle8_v_u8m8_partial_solve_wit_4_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_4";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_4";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_5_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_5_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_5_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_5_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_5_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_5_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_5:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_5.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_5)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_5,__riscv_vle8_v_u8m8_partial_solve_wit_5_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_5";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_5";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_6_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_6_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_6_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_6_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_6_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_6_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_6:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_6.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_6)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_6,__riscv_vle8_v_u8m8_partial_solve_wit_6_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_6";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_6";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_7_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_7_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_7_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_7_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_7_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_7_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_7:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_7.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_7)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_7,__riscv_vle8_v_u8m8_partial_solve_wit_7_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_7";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_7";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_8_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_8_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_8_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_8_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_8_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_8_pure";exact None). Defined.
