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
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_24:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_24.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_24)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_24,__riscv_vle8_v_u8m8_partial_solve_wit_24_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_24";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_24";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_25_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_25_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_25_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_25_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_25_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_25_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_25:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_25.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_25)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_25,__riscv_vle8_v_u8m8_partial_solve_wit_25_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_25";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_25";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_26_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_26_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_26_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_26_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_26_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_26_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_26:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_26.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_26)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_26,__riscv_vle8_v_u8m8_partial_solve_wit_26_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_26";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_26";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_27_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_27_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_27_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_27_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_27_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_27_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_27:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_27.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_27)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_27,__riscv_vle8_v_u8m8_partial_solve_wit_27_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_27";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_27";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_28_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_28_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_28_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_28_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_28_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_28_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_28:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_28.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_28)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_28,__riscv_vle8_v_u8m8_partial_solve_wit_28_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_28";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_28";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_29_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_29_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_29_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_29_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_29_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_29_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_29:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_29.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_29)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_29,__riscv_vle8_v_u8m8_partial_solve_wit_29_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_29";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_29";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_30_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_30_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_30_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_30_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_30_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_30_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_30:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_30.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_30)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_30,__riscv_vle8_v_u8m8_partial_solve_wit_30_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_30";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_30";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_31_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_31_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_31_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_31_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_31_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_31_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_31:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_31.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_31)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_31,__riscv_vle8_v_u8m8_partial_solve_wit_31_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_31";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_31";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_32_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_32_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_32_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_32_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_32_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_32_pure";exact None). Defined.
