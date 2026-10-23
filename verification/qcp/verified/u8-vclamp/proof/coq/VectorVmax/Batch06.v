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
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_32:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_32.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_32)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_32,__riscv_vmaxu_vx_u8m8_partial_solve_wit_32_aux;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_32";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_32";exact None). Defined.
Definition attempt___riscv_vmaxu_vx_u8m8_partial_solve_wit_33:option VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_33.
Proof. let H:=fresh "checked"in tryif(assert(H:VectorVmax.unit_goal.__riscv_vmaxu_vx_u8m8_partial_solve_wit_33)by(unfold __riscv_vmaxu_vx_u8m8_partial_solve_wit_33;first[solve[timeout 45(left;work)]|solve[timeout 45(right;work)]|solve[timeout 45 work]]))then(idtac "CVC_PASS __riscv_vmaxu_vx_u8m8_partial_solve_wit_33";exact(Some H))else(idtac "CVC_PENDING __riscv_vmaxu_vx_u8m8_partial_solve_wit_33";exact None). Defined.
