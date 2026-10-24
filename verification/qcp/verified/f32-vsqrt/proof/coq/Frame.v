From Coq Require Import ZArith Lia List.
From Sqrt Require Export Model Types Pack StoreFacts.
From QcpRvv32 Require Export FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac sqrt_intro := lazymatch goal with
 | |- ?P |-- ?Q => idtac
 | |- forall _, _ => intro; sqrt_intro
 | |- _ => idtac end.
Ltac sqrt_prepare :=
 sqrt_intro;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with(-2147483648)in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac sqrt_frame :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac sqrt_store_open :=
 lazymatch goal with |- ?P |-- ?Q =>
 first[multimatch P with context[FloatArray.undef_full ?p ?n]=>
 let Hb:=fresh "Hbound"in assert(Hb:0<n)by lia;
 let Hm:=fresh "Hmemory"in pose proof(sqrt_undef_head_full p n Hb)as Hm;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hm;
 try change(1+1)%Z with 2%Z in Hm;try change(2+1)%Z with 3%Z in Hm;try change(3+1)%Z with 4%Z in Hm;sep_apply Hm end
 |multimatch P with context[FloatArray.undef_seg ?p ?lo ?hi]=>
 let Hb:=fresh "Hbound"in assert(Hb:lo<hi)by lia;
 let Hm:=fresh "Hmemory"in pose proof(sqrt_undef_head p lo hi Hb)as Hm;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hm;
 try change(1+1)%Z with 2%Z in Hm;try change(2+1)%Z with 3%Z in Hm;try change(3+1)%Z with 4%Z in Hm;sep_apply Hm end]
 end.
Ltac sqrt_store_close :=
 rewrite ?FloatArray.undef_seg_empty;
 lazymatch goal with |- ?P |-- ?Q =>
 multimatch Q with
 | context[FloatArray.full ?p 4%Z(sqrt_pack4 ?x0 ?x1 ?x2 ?x3)]=>let Hm:=fresh "Hmemory"in pose proof(sqrt_cells4_full p x0 x1 x2 x3)as Hm;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hm;
 try change(1+1)%Z with 2%Z in Hm;try change(2+1)%Z with 3%Z in Hm;try change(3+1)%Z with 4%Z in Hm;sep_apply Hm
 | context[FloatArray.full ?p 2%Z(sqrt_pack2 ?x0 ?x1)]=>let Hm:=fresh "Hmemory"in pose proof(sqrt_cells2_full p x0 x1)as Hm;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hm;
 try change(1+1)%Z with 2%Z in Hm;try change(2+1)%Z with 3%Z in Hm;try change(3+1)%Z with 4%Z in Hm;sep_apply Hm
 | context[FloatArray.full ?p 1%Z(sqrt_pack1 ?x0)]=>let Hm:=fresh "Hmemory"in pose proof(sqrt_cells1_full p x0)as Hm;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hm;
 try change(1+1)%Z with 2%Z in Hm;try change(2+1)%Z with 3%Z in Hm;try change(3+1)%Z with 4%Z in Hm;sep_apply Hm
 end end.
Ltac sqrt_store_finish :=
 lazymatch goal with |- _ \/ _ => left | _ => idtac end;
 sqrt_prepare;
 try change(1+1)%Z with 2%Z in *;
 try change(2+1)%Z with 3%Z in *;
 try change(3+1)%Z with 4%Z in *;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia]
 |solve[sqrt_frame]
 |solve[sqrt_store_open; sqrt_frame]
 |sqrt_store_close;first[solve[entailer!]|sqrt_frame]].
