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
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_17:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_17.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_17)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_17;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_17";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_17";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_18:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_18.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_18)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_18;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_18";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_18";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_19:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_19.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_19)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_19;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_19";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_19";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_20:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_20.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_20)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_20;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_20";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_20";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_21:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_21.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_21)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_21;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_21";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_21";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_22:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_22.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_22)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_22;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_22";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_22";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_23:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_23.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_23)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_23;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_23";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_23";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_24:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_24.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_24)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_24;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_24";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_24";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_25:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_25.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_25)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_25;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_25";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_25";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_26:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_26.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_26)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_26;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_26";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_26";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_27:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_27.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_27)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_27;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_27";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_27";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_28:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_28.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_28)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_28;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_28";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_28";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_29:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_29.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_29)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_29;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_29";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_29";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_30:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_30.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_30)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_30;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_30";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_30";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_31:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_31.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_31)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_31;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_31";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_31";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_safety_wit_32:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_32.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_safety_wit_32)by(unfold __riscv_vmaxu_vx_u8m8_safety_wit_32;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_safety_wit_32";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_safety_wit_32";exact None). Defined.
