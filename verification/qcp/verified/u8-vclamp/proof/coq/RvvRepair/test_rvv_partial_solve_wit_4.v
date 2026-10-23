From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic U8KernelLogic.
From U8PackedKernel Require Import Prelude.
From RvvRepair Require Import unit_goal.
From PackedRepair Require Import KernelFacts AddressFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Ltac direct_frame := first
 [apply _derivable1_andp_intros;[direct_frame|direct_frame]
 |solve[apply derivable1s_coq_prop_r;lia]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]].
Ltac opaque_except_undef_rec l := lazymatch l with
 | nil => idtac
 | cons(norm_asrt ?v)?tail =>
   lazymatch v with
   | UCharArray.undef_full _ _ => idtac
   | _ => let cell:=fresh "frame_cell"in let H:=fresh "Eframe_cell"in remember v as cell eqn:H;clear H
   end;opaque_except_undef_rec tail
 end.
Ltac opaque_except_undef := match goal with|-?P|--?Q=>let leaves:=All_listasrts P in opaque_except_undef_rec leaves end.
Ltac convert_undef := match goal with|-?P|--?Q=>
 lazymatch P with context[UCharArray.undef_full ?p ?n]=>
 lazymatch Q with context[UCharArray.undef_seg ?q 0 ?m]=>
 replace q with p by lia;replace m with n by lia;
 opaque_except_undef;sep_apply_l_atomic(UCharArray.undef_full_to_undef_seg p n)
 end end end.
From PackedControlGate Require Import FinalControlGate.
Lemma proof_of_test_rvv_partial_solve_wit_4 : RvvRepair.unit_goal.test_rvv_partial_solve_wit_4.
Proof. exact FinalControlGate.Checked.proof_of_test_rvv_partial_solve_wit_4. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_4.
