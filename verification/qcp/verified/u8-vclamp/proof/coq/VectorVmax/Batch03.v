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
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_8:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_8.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_8)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_8,__riscv_vmaxu_vx_u8m8_partial_solve_wit_8_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_8";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_8";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_9_pure:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_9_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_9_pure)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_9_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_9_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_9_pure";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_9:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_9.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_9)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_9,__riscv_vmaxu_vx_u8m8_partial_solve_wit_9_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_9";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_9";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_10_pure:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_10_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_10_pure)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_10_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_10_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_10_pure";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_10:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_10.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_10)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_10,__riscv_vmaxu_vx_u8m8_partial_solve_wit_10_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_10";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_10";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_11_pure:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_11_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_11_pure)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_11_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_11_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_11_pure";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_11:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_11.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_11)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_11,__riscv_vmaxu_vx_u8m8_partial_solve_wit_11_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_11";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_11";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_12_pure:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_12_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_12_pure)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_12_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_12_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_12_pure";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_12:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_12.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_12)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_12,__riscv_vmaxu_vx_u8m8_partial_solve_wit_12_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_12";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_12";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_13_pure:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_13_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_13_pure)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_13_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_13_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_13_pure";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_13:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_13.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_13)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_13,__riscv_vmaxu_vx_u8m8_partial_solve_wit_13_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_13";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_13";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_14_pure:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_14_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_14_pure)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_14_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_14_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_14_pure";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_14:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_14.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_14)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_14,__riscv_vmaxu_vx_u8m8_partial_solve_wit_14_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_14";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_14";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_15_pure:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_15_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_15_pure)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_15_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_15_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_15_pure";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_15:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_15.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_15)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_15,__riscv_vmaxu_vx_u8m8_partial_solve_wit_15_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_15";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_15";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_16_pure:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_16_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_16_pure)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_16_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_16_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_16_pure";exact None). Defined.
