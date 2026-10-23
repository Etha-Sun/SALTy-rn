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
Lemma proof_of_test_rvv_partial_solve_wit_32_pure : RvvRepair.unit_goal.test_rvv_partial_solve_wit_32_pure.
Proof. unfold test_rvv_partial_solve_wit_32_pure; first[solve[right;intros;try pose proof(u8_phase_split batch_pre ltac:(lia))as[Hprefix Hrem];try pose proof(u8_bounds_modulo lo);try pose proof(u8_bounds_modulo hi);subst;unfold u8_prefix_n in *;rewrite ?sizeof_uchar in *;repeat match goal with|-context[unsigned_last_nbits ?x 64]=>rewrite(u64_identity x ltac:(lia))end;unfold unsigned_last_nbits,u8_bound in *;change(2^8)%Z with 256%Z in *;unfold UndefStructPredvuint8m8_t;rewrite ?typed_field_address;rewrite <-?dot_field_address;rewrite ?Z.mul_1_r,?Z.add_0_r;first[solve[direct_frame]|solve[convert_undef;direct_frame]|solve[entailer!]]]|solve[left;intros;try pose proof(u8_phase_split batch_pre ltac:(lia))as[Hprefix Hrem];try pose proof(u8_bounds_modulo lo);try pose proof(u8_bounds_modulo hi);subst;unfold u8_prefix_n in *;rewrite ?sizeof_uchar in *;repeat match goal with|-context[unsigned_last_nbits ?x 64]=>rewrite(u64_identity x ltac:(lia))end;unfold unsigned_last_nbits,u8_bound in *;change(2^8)%Z with 256%Z in *;unfold UndefStructPredvuint8m8_t;rewrite ?typed_field_address;rewrite <-?dot_field_address;rewrite ?Z.mul_1_r,?Z.add_0_r;first[solve[direct_frame]|solve[convert_undef;direct_frame]|solve[entailer!]]]|solve[intros;try pose proof(u8_phase_split batch_pre ltac:(lia))as[Hprefix Hrem];try pose proof(u8_bounds_modulo lo);try pose proof(u8_bounds_modulo hi);subst;unfold u8_prefix_n in *;rewrite ?sizeof_uchar in *;repeat match goal with|-context[unsigned_last_nbits ?x 64]=>rewrite(u64_identity x ltac:(lia))end;unfold unsigned_last_nbits,u8_bound in *;change(2^8)%Z with 256%Z in *;unfold UndefStructPredvuint8m8_t;rewrite ?typed_field_address;rewrite <-?dot_field_address;rewrite ?Z.mul_1_r,?Z.add_0_r;first[solve[direct_frame]|solve[convert_undef;direct_frame]|solve[entailer!]]]]. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_32_pure.
