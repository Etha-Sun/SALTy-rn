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
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_16:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_16.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_16)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_16,__riscv_vle8_v_u8m8_partial_solve_wit_16_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_16";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_16";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_17_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_17_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_17_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_17_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_17_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_17_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_17:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_17.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_17)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_17,__riscv_vle8_v_u8m8_partial_solve_wit_17_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_17";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_17";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_18_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_18_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_18_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_18_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_18_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_18_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_18:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_18.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_18)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_18,__riscv_vle8_v_u8m8_partial_solve_wit_18_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_18";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_18";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_19_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_19_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_19_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_19_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_19_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_19_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_19:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_19.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_19)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_19,__riscv_vle8_v_u8m8_partial_solve_wit_19_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_19";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_19";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_20_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_20_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_20_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_20_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_20_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_20_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_20:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_20.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_20)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_20,__riscv_vle8_v_u8m8_partial_solve_wit_20_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_20";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_20";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_21_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_21_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_21_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_21_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_21_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_21_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_21:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_21.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_21)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_21,__riscv_vle8_v_u8m8_partial_solve_wit_21_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_21";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_21";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_22_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_22_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_22_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_22_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_22_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_22_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_22:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_22.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_22)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_22,__riscv_vle8_v_u8m8_partial_solve_wit_22_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_22";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_22";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_23_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_23_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_23_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_23_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_23_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_23_pure";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_23:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_23.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_23)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_23,__riscv_vle8_v_u8m8_partial_solve_wit_23_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_23";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_23";exact None). Defined.
Definition attempt___riscv_vle8_v_u8m8_partial_solve_wit_24_pure:option VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_24_pure.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVle.unit_goal.__riscv_vle8_v_u8m8_partial_solve_wit_24_pure)by(unfold __riscv_vle8_v_u8m8_partial_solve_wit_24_pure;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vle8_v_u8m8_partial_solve_wit_24_pure";exact(Some H))else(idtac "CVC_PENDING __riscv_vle8_v_u8m8_partial_solve_wit_24_pure";exact None). Defined.
