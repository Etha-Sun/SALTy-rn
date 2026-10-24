From Coq Require Import ZArith Lia List.
From QcpNeon Require Export NeonBridge.
From QcpNeonLoop Require Export LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From F32F16 Require Export KernelSupport ProgramFacts NeonResult NeonEightFacts NeonOutput PackModel neon_unit_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

Lemma f16_pure_keep_left : forall (R:Prop) (P Q:Assertion),
 (P |-- “R” && P) -> P ** Q |-- “R” && (P ** Q).
Proof.
 intros R P Q H; eapply derivable1_trans.
 - apply derivable1_sepcon_mono; [exact H|apply derivable1_refl].
 - entailer!.
Qed.

Lemma f16_pure_keep_right : forall (R:Prop) (P Q:Assertion),
 (Q |-- “R” && Q) -> P ** Q |-- “R” && (P ** Q).
Proof.
 intros R P Q H; eapply derivable1_trans.
 - apply derivable1_sepcon_mono; [apply derivable1_refl|exact H].
 - entailer!.
Qed.

Lemma f16_float_length_keep : forall p n A,
 FloatArray.full p n A |-- “Zlength A=n” && FloatArray.full p n A.
Proof.
 intros; prop_apply (FloatArray.full_Zlength p n A); Intros_p H; entailer!.
Qed.

(* Follow the known spatial tree.  Avoid unfolding or searching the large
   floating constants in unrelated local cells when extracting input length. *)
Ltac f16_length_in_heap :=
 first [apply f16_float_length_keep
 | eapply f16_pure_keep_left; f16_length_in_heap
 | eapply f16_pure_keep_right; f16_length_in_heap].

Ltac f16_capture_input_length p n a name :=
 match goal with |- ?P |-- ?Q =>
 eapply (derivable1_trans P (“Zlength a=n” && P) Q);
 [f16_length_in_heap | Intros_p name]
 end.

Lemma f16_ushort_full_nonnegative : forall p n L,
 0<n -> UShortArray.full p n L |-- “0<=p”.
Proof.
 intros p n L Hn; destruct L as [|x xs].
 - unfold UShortArray.full, store_array; cbn; entailer!.
 - unfold UShortArray.full, store_array; cbn [store_array_rec].
   unfold StoreUShortAsElement.storeA.
   prop_apply (valid_store_ushort (p+0*sizeof(USHORT)) x); Intros_p Hvalid.
   unfold isvalidptr_short, valid_object, valid_addr_range in Hvalid.
   entailer!.
Qed.

Lemma f16_output_short : forall p k r (A:list fp32) d,
 0<=k -> 0<=r<=4 -> k+4<=Zlength A ->
 UShortArray.full p k (f16_values k A) **
 UShortArray.full (p+k*sizeof(USHORT)) r
   (firstn (Z.to_nat r)
     [f16_arm_lane(Znth 0 (fp32_slice k (Zlength A) A) d);
      f16_arm_lane(Znth 1 (fp32_slice k (Zlength A) A) d);
      f16_arm_lane(Znth 2 (fp32_slice k (Zlength A) A) d);
      f16_arm_lane(Znth 3 (fp32_slice k (Zlength A) A) d)]) |--
 UShortArray.full p (k+r) (f16_values(k+r) A).
Proof.
 intros p k r A d Hk Hr Ha.
 pose proof (UShortArray.full_merge_to_full p k (k+r)
   (f16_values k A)
   (firstn (Z.to_nat r)
     [f16_arm_lane(Znth 0 (fp32_slice k (Zlength A) A) d);
      f16_arm_lane(Znth 1 (fp32_slice k (Zlength A) A) d);
      f16_arm_lane(Znth 2 (fp32_slice k (Zlength A) A) d);
      f16_arm_lane(Znth 3 (fp32_slice k (Zlength A) A) d)]) ltac:(lia)) as HM.
 replace (k+r-k) with r in HM by lia; sep_apply HM.
 rewrite (f16_tail_four k r A d Hk Hr Ha); entailer!.
Qed.

Lemma f16_neon_expression : forall x,
 let bias:=f16_max32
   (f16_and32 (f16_add32 (bits_of_fp32(f16_abs x)) 125829120) 2139095040)
   1073741824 in
 let core:=f16_arm_add
   (f16_arm_mul (f16_arm_mul (f16_abs x) f16_scale_hi) f16_scale_lo)
   (fp32_of_bits bias) in
 f16_or16
   (f16_select16
     (f16_narrow16 (f16_gt32 (bits_of_fp32(f16_abs x)) 2139095040))
     32256
     (f16_add16
       (f16_and16 (f16_narrow16(bits_of_fp32 core)) 4095)
       (f16_and16 (f16_shrn13(bits_of_fp32 core)) 31744)))
   (f16_and16 (f16_shrn16(bits_of_fp32 x)) 32768) = f16_arm_lane x.
Proof. reflexivity. Qed.

Ltac f16_memory_prepare :=
 unfold fp32_length in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 rewrite ?f16_scale_hi_decimal, ?f16_scale_lo_decimal in *;
 repeat rewrite f16_neon_expression in *.

Ltac f16_opaque_stack_frames_rec leaves :=
 lazymatch leaves with
 | nil => idtac
 | cons (norm_asrt ?v) ?tail =>
   try (lazymatch v with context[eval_addr_expr ?e] =>
     let cell:=fresh "stack_cell" in let H:=fresh "Estack_cell" in
     remember v as cell eqn:H; clear H
   end);
   f16_opaque_stack_frames_rec tail
 | cons (@dependent_asrt ?t ?body) ?tail =>
   try (lazymatch body with context[eval_addr_expr ?e] =>
     let v:=constr:(EX (x:t), body x) in
     let cell:=fresh "stack_cell" in let H:=fresh "Estack_cell" in
     remember v as cell eqn:H; clear H
   end);
   f16_opaque_stack_frames_rec tail
 | cons ?other ?tail => f16_opaque_stack_frames_rec tail
 end.

Ltac f16_opaque_stack_frames :=
 match goal with |- ?P |-- ?Q =>
 let leaves:=All_listasrts P in f16_opaque_stack_frames_rec leaves
 end.

Ltac f16_opaque_data_arrays :=
 repeat match goal with |- ?P |-- ?Q =>
   multimatch P with
   | context[FloatArray.full ?p ?n ?xs] =>
     let cell:=fresh "array_cell" in let H:=fresh "Earray_cell" in
     remember (FloatArray.full p n xs) as cell eqn:H; clear H
   | context[FloatArray.seg ?p ?lo ?hi ?xs] =>
     let cell:=fresh "array_cell" in let H:=fresh "Earray_cell" in
     remember (FloatArray.seg p lo hi xs) as cell eqn:H; clear H
   | context[UShortArray.full ?p ?n ?xs] =>
     let cell:=fresh "array_cell" in let H:=fresh "Earray_cell" in
     remember (UShortArray.full p n xs) as cell eqn:H; clear H
   | context[UShortArray.undef_full ?p ?n] =>
     let cell:=fresh "array_cell" in let H:=fresh "Earray_cell" in
     remember (UShortArray.undef_full p n) as cell eqn:H; clear H
   end
 end.

Ltac f16_memory_finish_frame :=
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
   [unfold derivable1,andp,coq_prop;intros;
    repeat first[assumption|split|reflexivity];lia
   |f16_opaque_data_arrays;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |f16_opaque_data_arrays;opaque_leaves;sepcon_assoc_change;fast_cancel].

Ltac f16_choose_initial_case :=
 first [solve [Exists 0;
   unfold UShortArray.full, store_array;
   cbn [f16_values List.firstn Z.to_nat store_array_rec]; entailer!; try lia]
 | rewrite <- derivable1_orp_intros1; f16_choose_initial_case
 | rewrite <- derivable1_orp_intros2; f16_choose_initial_case].

Ltac f16_choose_step_case next :=
 first [solve [Exists next; f16_memory_finish_frame]
 | solve [Exists next; entailer!; try lia]
 | rewrite <- derivable1_orp_intros1; f16_choose_step_case next
 | rewrite <- derivable1_orp_intros2; f16_choose_step_case next].

Lemma f16_byte_quot_total : forall k batch total,
 0<=batch -> Z.rem batch 4=0 -> k*4+batch=total ->
 total ÷ 4 = k + batch ÷ 4.
Proof.
 intros k batch total Hb Hr He.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hq.
 replace total with ((k+batch ÷ 4)*4) by lia.
 rewrite Z.quot_mul by lia; reflexivity.
Qed.

Lemma f16_byte_quot_sub : forall batch step,
 0<=batch -> Z.rem batch 4=0 ->
 (batch-step*4) ÷ 4=batch ÷ 4-step /\
 Z.rem (batch-step*4) 4=0.
Proof.
 intros batch step Hb Hr.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hq.
 replace (batch-step*4) with ((batch ÷ 4-step)*4) by lia.
 rewrite Z.quot_mul, Z.rem_mul by lia; split; reflexivity.
Qed.

Print Assumptions f16_byte_quot_total.
Print Assumptions f16_byte_quot_sub.
