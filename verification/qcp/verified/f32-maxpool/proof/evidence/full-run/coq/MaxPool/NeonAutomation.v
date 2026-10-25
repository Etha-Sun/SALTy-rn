From Coq Require Export ZArith Lia List.
From MaxPool Require Export Types KernelFacts KernelTail WindowFacts WordFacts WindowExtra CompareFacts FastFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_arm mp_max mp_min mp_get mp_ptr_get mp_out mp_data mp_ptr_data
 mp_group_lane mp_after_groups mp_more_groups mp_pixel_before mp_pass_partial mp_pass_complete.
Ltac mp_intro :=
 lazymatch goal with |- _ |-- _=>idtac | |- forall _, _=>intro;mp_intro end.
Ltac mp_integer_constants :=
 try change INT_MAX with 2147483647 in *;
 try change INT_MIN with (-2147483648) in *;
 try change UINT64_MAX with 18446744073709551615 in *;
 rewrite ?sizeof_float in *;
 repeat match goal with H:mp_word64 _ |- _=>unfold mp_word64 in H end.
Ltac mp_pixel_facts :=
 match goal with
 | HG:mp_geometry ?F ?PT ?W ?P ?K ?C ?table ?offset ?stride ?inc ?output ?outinc |- _=>
   let HR:=fresh "Hreadable"in let HW:=fresh "Hwritable"in
   first[
    match goal with HB:?remaining <= P |- _=>
     pose proof(mp_geometry_pixel F PT W P K C table offset stride inc output outinc(P-remaining)HG ltac:(lia))as[HR HW]
    end
   |pose proof(mp_geometry_pixel F PT W P K C table offset stride inc output outinc 0 HG ltac:(lia))as[HR HW]];
   rewrite ?mp_table_at_zero,?mp_offset_at_zero,?mp_output_at_zero in HR,HW by(unfold mp_word64;lia)
 end.
Ltac mp_window_pure :=
 first[
  solve[eapply mp_table_base_present;[eassumption|lia]]
 |solve[eapply mp_table_base_nonnull;eassumption]
 |solve[eapply mp_table_read_present;[eassumption|lia|lia|lia|unfold mp_k_after in *;lia]]
 |solve[eapply mp_table_read_nonnull;[eassumption|lia]]
 |solve[eapply mp_table_more_present;[eassumption|lia|lia|unfold mp_k_after in *;lia]]
 |solve[eapply mp_table_more_nonnull;[eassumption|lia|lia|unfold mp_k_after in *;lia]]
 |solve[eapply mp_write_window_plus_two;[eassumption|lia|lia]]
 |
  solve[eapply mp_row_cursor_window;[eassumption|lia|lia|lia|first[left;reflexivity|right;unfold mp_k_after in *;lia]|lia|lia|lia]]
 |solve[unfold mp_output_cursor;eapply mp_write_window_suffix;[eassumption|lia|lia|lia]]
 |solve[eapply mp_pixel_table_present;[eassumption|unfold mp_pointer_count,mp_consumed,mp_row_index,mp_table_read_cursor,mp_table_cursor;lia]]
 |solve[match goal with HR:mp_pixel_readable _ _ ?p _ _ _ |- ?q<>0=>unify p q;unfold mp_pixel_readable,mp_ptr_window in HR;lia end]
 ].
Ltac mp_pure :=
 mp_integer_constants;unfold derivable1,andp,coq_prop;intros;
 try solve[repeat first[assumption|split|reflexivity];lia];
 subst;try mp_pixel_facts;
 repeat first[solve[assumption|reflexivity|lia|mp_window_pure]|split].
Ltac mp_forget_rhs :=
 repeat match goal with |- ?P |-- ?Q=>
  multimatch Q with context[undef_store_float ?addr]=>
   multimatch P with context[store_float addr ?value]=>
    sep_apply(store_float_undef_store_float addr value)
   end
  end
 end.
Ltac mp_call_frame :=
 subst;unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?mp_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[
  apply _derivable1_andp_intros;
  [mp_pure|mp_forget_rhs;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |mp_forget_rhs;opaque_leaves;sepcon_assoc_change;fast_cancel].
