From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Layout ModeFacts U8Logic U8KernelLogic full10_goal.
From CapabilitySplit Require Import NewModeFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma typed_nested_field_address : forall (R:rvalue_expr) (t f g:string),
 eval_addr_expr (RE_addr_of (LE_dot_field (LE_arrow_field
   (RE_const (eval_addr_expr R) (FET_alias t)) f) g)) =
 eval_addr_expr (RE_addr_of (LE_dot_field (LE_arrow_field R f) g)).
Proof.
 intros; apply eval_addr_expr_congr; apply RE_addr_of_congr;
 apply LE_dot_field_congr; [|reflexivity].
 apply LE_arrow_field_congr; [apply eval_addr|reflexivity].
Qed.
Print Assumptions typed_nested_field_address.
Lemma tail_mask_bounds : forall n, 0<=n<8 ->
 (Z.land n 4<>0 -> 4<=n) /\
 (Z.land n 2<>0 -> 2<=n) /\
 (Z.land n 1<>0 -> 1<=n) /\
 (Z.land n 4<>0 -> Z.land n 2<>0 -> 6<=n) /\
 (Z.land n 4<>0 -> Z.land n 1<>0 -> 5<=n) /\
 (Z.land n 2<>0 -> Z.land n 1<>0 -> 3<=n) /\
 (Z.land n 4<>0 -> Z.land n 2<>0 -> Z.land n 1<>0 -> 7<=n).
Proof.
 intros n Hn.
 assert (Hcases:n=0 \/ n=1 \/ n=2 \/ n=3 \/ n=4 \/ n=5 \/ n=6 \/ n=7) by lia.
 repeat destruct Hcases as [Hcases|Hcases]; subst n; vm_compute in *; intuition discriminate.
Qed.
Print Assumptions tail_mask_bounds.
Ltac opaque_except_undef_rec l := lazymatch l with
 | nil => idtac
 | cons (norm_asrt ?v) ?tail =>
   lazymatch v with
   | UCharArray.undef_full _ _ => idtac
   | _ => let cell := fresh "frame_cell" in let H := fresh "Eframe_cell" in
          remember v as cell eqn:H; clear H
   end; opaque_except_undef_rec tail
 end.
Ltac opaque_except_undef := match goal with |- ?P |-- ?Q =>
 let leaves := All_listasrts P in opaque_except_undef_rec leaves end.
Ltac tail_bounds := match goal with Hbit:(Z.land ?t ?mask <> 0) |- _ =>
 let H4 := fresh "Hmask4" in let H2 := fresh "Hmask2" in let H1 := fresh "Hmask1" in
 let H42 := fresh "Hmask42" in let H41 := fresh "Hmask41" in
 let H21 := fresh "Hmask21" in let H421 := fresh "Hmask421" in
 pose proof (tail_mask_bounds t ltac:(lia)) as H4;
 destruct H4 as [H4 [H2 [H1 [H42 [H41 [H21 H421]]]]]];
 try specialize (H4 ltac:(assumption)); try specialize (H2 ltac:(assumption));
 try specialize (H1 ltac:(assumption));
 try specialize (H42 ltac:(assumption) ltac:(assumption));
 try specialize (H41 ltac:(assumption) ltac:(assumption));
 try specialize (H21 ltac:(assumption) ltac:(assumption));
 try specialize (H421 ltac:(assumption) ltac:(assumption) ltac:(assumption))
 end.
Ltac convert_undef := match goal with |- ?P |-- ?Q =>
 lazymatch P with context [UCharArray.undef_full ?p ?n] =>
 lazymatch Q with context [UCharArray.undef_seg ?q 0 ?m] =>
 replace q with p by lia; replace m with n by lia;
 opaque_except_undef;
 sep_apply_l_atomic (UCharArray.undef_full_to_undef_seg p n)
 end end end.
Ltac direct_frame := first
 [ apply _derivable1_andp_intros; [direct_frame | direct_frame]
 | solve [apply derivable1s_coq_prop_r; lia]
 | solve [opaque_leaves; sepcon_assoc_change; fast_cancel] ].
Ltac array_arithmetic := match goal with
 | |- UCharArray.full ?p ?n ?l |-- UCharArray.full ?q ?m ?l =>
   replace q with p by lia; replace m with n by lia; apply derivable1_refl
 | |- UCharArray.undef_full ?p ?n |-- UCharArray.undef_full ?q ?m =>
   replace q with p by lia; replace m with n by lia; apply derivable1_refl
 end.
Ltac facts batch_pre lo hi :=
 try tail_bounds;
 try (pose proof (u8_phase_split batch_pre ltac:(lia)));
 try (pose proof (Z.mod_pos_bound lo 256 ltac:(lia)));
 try (pose proof (Z.mod_pos_bound hi 256 ltac:(lia)));
 unfold unsigned_last_nbits,u8_bound in *;
 try change (2^8)%Z with 256%Z in *;
 rewrite ?sizeof_uchar in *;
 rewrite ?Z.sub_0_r, ?Z.add_0_l, ?Z.add_0_r, ?Z.mul_1_r, ?Z.mul_0_l in *;
 unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;
 rewrite ?typed_field_address; rewrite <-?nested_field_address; rewrite <-?dot_field_address;
 rewrite ?typed_nested_field_address;
 try convert_undef;
 first [solve [direct_frame] |
  entailer!;
  rewrite ?typed_field_address; rewrite <-?nested_field_address; rewrite <-?dot_field_address;
  rewrite ?typed_nested_field_address;
  first [solve [array_arithmetic] | try (opaque_leaves; sepcon_assoc_change; fast_cancel)]].
Lemma proof_of_test_neon_partial_solve_wit_66 : full10_goal.test_neon_partial_solve_wit_66.
Proof. unfold full10_goal.test_neon_partial_solve_wit_66; intros _; unfold full10_goal.test_neon_partial_solve_wit_66_aux; intros; facts batch_pre lo hi. all: match goal with |- ?G => idtac "REMAINING" G end. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_66.
