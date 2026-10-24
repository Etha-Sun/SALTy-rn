From Coq Require Import ZArith Lia.
From F32F16 Require Export Observation VectorSupport ProgramModel.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac f16_wrapper_finish :=
 try left;intros;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold f16_get in *;rewrite ?replace_Znth_Znth in *;
 rewrite ?f16_values_equal in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 try (rewrite ?Z.quot_div_nonneg in * by lia);
 try (rewrite ?Z.div_mul in * by lia);
 try (rewrite ?Z.rem_mul in * by lia);
 try lazymatch goal with
 | |- ?P |-- ?Q => lazymatch Q with context[UShortArray.missing_i ?p ?i 0 ?n ?xs] =>
   let Hbound:=fresh "Hbound"in assert(Hbound:0<=i<n)by lia;
   sep_apply(UShortArray.full_split_to_missing_i p i n xs 0 Hbound);
   unfold StoreUShortAsElement.storeA; rewrite ?sizeof_ushort
 end end;
 first[solve[entailer!]|f16_vector_finish].

Ltac f16_wrapper_pure :=
 repeat match goal with |- _ |-- _ && _ => apply _derivable1_andp_intros end;
 first[solve[apply derivable1_andp_elim2]
 |solve[unfold derivable1,coq_prop;intros;first[assumption|reflexivity|lia|apply f16_values_equal]]].
