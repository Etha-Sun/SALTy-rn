From Coq Require Export ZArith Lia List.
From MaxPool Require Export Types WordFacts CompareFacts FastFrame NanArrayFacts propagate_goal.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac na_intro:=lazymatch goal with |- _ |-- _ => idtac | |- forall _,_ => intro;na_intro end.
Ltac na_constants:=try change INT_MAX with (2147483647:Z)in *;try change INT_MIN with (-2147483648)in *;try change UINT_MAX with (4294967295:Z)in *;try change UINT64_MAX with (18446744073709551615:Z)in *.
Ltac na_pure:=na_constants;unfold derivable1,andp,coq_prop;intros;subst;
 repeat first[solve[assumption|reflexivity|lia|ring]|split].
Ltac na_forget:=repeat match goal with |-?P |-- ?Q=>
 multimatch Q with context[undef_store_float ?addr]=>multimatch P with context[store_float addr ?v]=>sep_apply(store_float_undef_store_float addr v)end end end.
Ltac na_frame:=subst;unfold UndefStructPredvfloat32m8_t,UndefStructPredvuint32m8_t,UndefStructPredvbool4_t;
 rewrite ?mp_local_field_address;repeat progress rewrite<-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[na_pure|na_forget;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |na_forget;opaque_leaves;sepcon_assoc_change;fast_cancel].
