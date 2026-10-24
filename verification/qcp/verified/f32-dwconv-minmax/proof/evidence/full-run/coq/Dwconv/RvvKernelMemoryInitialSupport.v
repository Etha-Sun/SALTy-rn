(* Local proof tactics adapted from KernelSupport.v SHA256 92c2922c669d775ac1370ea4f90a41ef9c320c7794eed913f60684754f6b58e5. No semantic contracts changed. *)
From Coq Require Import ZArith Lia List Strings.String.
From Dwconv Require Export Types ProgramFacts RvvCursor rvv_unit_goal.
From QcpRvv32 Require Export FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma dwm_local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field
  (RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof. intros;apply eval_addr_expr_congr;apply RE_addr_of_congr.
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity]. Qed.
Ltac dwm_intro := lazymatch goal with
 | |- ?P |-- ?Q=>idtac | |- forall _,_=>intro;dwm_intro | _=>idtac end.
Ltac dwm_subst_z := repeat progress match goal with
 | H : ?x = ?y |- _ => let T := type of x in lazymatch T with Z =>
 first[is_var x;subst x|is_var y;subst y]end end.
Ltac dwm_prepare := dwm_intro;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with(-2147483648)in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 rewrite ?sizeof_float in *;
 unfold dw_same in *;dwm_subst_z;rewrite ?dwm_local_field_address.
Ltac dwm_forget_fields := repeat match goal with |- ?P |-- ?Q =>
 multimatch Q with context[undef_store_float ?p]=>
 multimatch P with context[store_float p ?v]=>
 sep_apply(store_float_undef_store_float p v)end end end.
Ltac dwm_borrow := lazymatch goal with |- ?P |-- ?Q =>
 first[multimatch Q with context[dw_data(dw_pop ?F ?p)]=>
 let H:=fresh "Hpresent"in assert(H:dw_present F p)by assumption;
 sep_apply(proj1(dw_data_pop F p H)) end
 |multimatch Q with context[dw_ptr_data(dw_ptr_pop ?F ?p)]=>
 let H:=fresh "Hpresent"in assert(H:dw_ptr_present F p)by assumption;
 sep_apply(proj1(dw_ptr_data_pop F p H))end]end.
Ltac dwm_spatial :=
 unfold Dwconv.Types.UndefStructPredfloat32x4_t,Dwconv.Types.UndefStructPredfloat32x2_t,
 Dwconv.Types.UndefStructPredvfloat32m4_t,Dwconv.Types.UndefStructPredvbool8_t;
 rewrite ?dwm_local_field_address;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?sizeof_float in *;
 dwm_forget_fields;opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac dwm_frame := repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia
 |dwm_spatial]]|dwm_spatial].
Ltac dwm_call_finish :=
 lazymatch goal with |- _ \/ _=>left|_=>idtac end;
 dwm_prepare;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|split|reflexivity];lia]
 |solve[dwm_frame]
 |dwm_borrow;dwm_frame].

Lemma dwri_unsigned64_word:forall x,unsigned_last_nbits x 64=dw_word x.
Proof. intro x;reflexivity. Qed.
Lemma dwri_word_add_r:forall x y,dw_word(x+dw_word y)=dw_word(x+y).
Proof. intros;unfold dw_word;apply Z.add_mod_idemp_r;lia. Qed.
Lemma dwri_cursor_initial:forall c w,dw_rvv_weight_cursor c c w w.
Proof. intros;right;lia. Qed.
Lemma dwri_aligned_initial:forall c,dw_aligned_cursor c c.
Proof. intros;left;rewrite Z.sub_diag;reflexivity. Qed.
Lemma dwri_table_members:forall F P W D pixel,
 dw_valid F P W D->0<=pixel<dw_width D->forall tap,0<=tap<3->
 dw_ptr_present P(dw_table D pixel+8*tap) /\
 dw_ptr_get P(dw_table D pixel+8*tap)<>0.
Proof.
 intros F P W D pixel Hv Hp tap Ht;split.
 - pose proof(dw_valid_table F P W D pixel Hv Hp)as[Hbase[Hn Htable]];apply Htable;exact Ht.
 - exact(proj1(dw_valid_row F P W D pixel tap Hv Hp Ht)).
Qed.
Print Assumptions dwri_unsigned64_word.
Print Assumptions dwri_word_add_r.
Print Assumptions dwri_cursor_initial.
Print Assumptions dwri_aligned_initial.
Print Assumptions dwri_table_members.
Ltac dwri_frame := repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|apply dwri_cursor_initial|apply dwri_aligned_initial|split|reflexivity];lia
 |dwm_spatial]]|dwm_spatial].
Ltac dwri_setup_rows :=
 dwm_prepare;change Arch64.ptr_size_Z with 8 in *;rewrite ?Z.sub_diag,?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in *;
 rewrite ?dwri_unsigned64_word,?dw_word_add_l,?dwri_word_add_r;
 rewrite dw_table_step by lia;
 unfold dw_input_row,dw_raw_row;
 rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in *;
 change(1*8)with 8 in *;change(8*1)with 8 in *;
 change(2*8)with 16 in *;change(8*2)with 16 in *;
 repeat match goal with|-context[if Z.eqb ?x ?y then _ else _]=>
 destruct(Z.eqb_spec x y);try congruence end;
 dwri_frame.
