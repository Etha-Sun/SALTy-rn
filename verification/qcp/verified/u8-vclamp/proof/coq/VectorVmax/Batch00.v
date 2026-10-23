From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic.
From LeaderAutomation Require Import FastFrame.
From VectorProof Require Import AddressFacts MemorySplit.
From VectorVmax Require Import unit_goal.
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
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_1:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_1.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_1)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_1;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_1";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_1";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_2:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_2.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_2)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_2;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_2";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_2";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_3:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_3.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_3)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_3;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_3";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_3";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_4:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_4.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_4)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_4;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_4";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_4";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_5:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_5.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_5)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_5;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_5";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_5";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_6:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_6.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_6)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_6;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_6";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_6";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_7:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_7.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_7)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_7;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_7";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_7";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_8:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_8.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_8)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_8;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_8";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_8";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_9:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_9.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_9)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_9;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_9";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_9";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_10:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_10.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_10)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_10;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_10";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_10";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_11:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_11.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_11)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_11;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_11";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_11";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_12:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_12.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_12)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_12;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_12";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_12";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_13:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_13.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_13)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_13;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_13";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_13";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_14:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_14.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_14)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_14;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_14";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_14";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_15:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_15.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_15)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_15;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_15";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_15";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_16:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_16.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_16)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_16;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_16";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_16";exact None). Defined.
