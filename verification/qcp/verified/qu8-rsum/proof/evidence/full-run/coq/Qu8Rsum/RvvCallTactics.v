From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Export Types MemoryModel IntegerFacts VectorFacts VlModel RvvProgramModel RvvBounds FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rs_limits :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac rs_kernel_term_bound t :=
 lazymatch t with
 | rs_active_u32 ?a ?b ?i ?vl=>apply rs_active_u32_bound;[rs_kernel_term_bound a|rs_kernel_term_bound b]
 | rs_splat_u32 ?x ?i ?vl=>apply rs_splat_u32_bound;rs_kernel_term_bound x
 | rs_read_lane ?i ?vl ?idx ?a=>match goal with H:forall j:Z,0<=j<32 ->0<=rs_read_lane j vl idx a<=255|-_=>pose proof(H i ltac:(lia));lia end
 | _=>lia
 end.
Ltac rs_kernel_bound := first[assumption|reflexivity|lia|
 match goal with H:forall j:Z,0<=j<32 ->0<=rs_read_lane j ?vl ?idx ?a<=255|-context[rs_read_lane ?i ?vl ?idx ?a]=>pose proof(H i ltac:(lia));lia end|
 match goal with |-context[rs_active_u32 ?a ?b ?i ?vl]=>let t:=constr:(rs_active_u32 a b i vl)in let H:=fresh in assert(H:0<=t<=4294967295)by(rs_kernel_term_bound t);lia end|
 match goal with |-context[rs_splat_u32 ?a ?i ?vl]=>let t:=constr:(rs_splat_u32 a i vl)in let H:=fresh in assert(H:0<=t<=4294967295)by(rs_kernel_term_bound t);lia end].
Ltac rs_ranges_from q :=
 lazymatch q with
 | store_uchar ?p ?v=>let H:=fresh "Hbyte"in prop_apply(store_uchar_range p v);Intros_p H;change Byte.max_unsigned with 255 in H
 | store_uint ?p ?v=>let H:=fresh "Hword"in prop_apply(store_uint_range p v);Intros_p H;change Int.max_unsigned with 4294967295 in H
 | store_ushort ?p ?v=>let H:=fresh "Hshort"in prop_apply(store_ushort_range p v);Intros_p H
 | sepcon ?a ?b=>rs_ranges_from a;rs_ranges_from b
 | andp ?a ?b=>rs_ranges_from a;rs_ranges_from b
 | _=>idtac end.
Ltac rs_input_range := lazymatch goal with |-?P|--?Q=>
 match P with context[UCharArray.full ?base ?count ?a]=>
 match Q with context[rs_read_lane ?i ?vl ?idx a]=>
 let Hread:=fresh "Hread"in prop_apply(rs_read_lane_all base count a idx vl ltac:(lia)ltac:(lia)ltac:(lia));Intros_p Hread
 end end end.
Ltac rs_collect := lazymatch goal with |-?P|--_=>rs_ranges_from P end.
Ltac rs_fast_pure := unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];rs_kernel_bound.
Ltac rs_vl_context := try match goal with |-context[rs_vl ?n]=>
 let H:=fresh "Hvlrange"in assert(H:0<=rs_vl n<=32 /\ rs_vl n<=n)by(unfold rs_vl;destruct(Z.ltb_spec n 32);lia)end.
Ltac rs_simple_pure := rs_limits;rs_vl_context;first[solve[rs_fast_pure]|solve[rs_input_range;rs_fast_pure]|solve[rs_collect;rs_fast_pure]|solve[entailer!;rs_kernel_bound]|solve[unfold store_uchar,store_uint;entailer!;rs_limits;try change Byte.max_unsigned with 255 in *;rs_kernel_bound]|solve[unfold rs_vl in *;repeat first[match goal with H:context[Z.ltb ?x ?y]|-_=>destruct(Z.ltb_spec x y) end|match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y) end];entailer!;rs_kernel_bound]].
Ltac rs_all_pure q := lazymatch q with
 | coq_prop _=>idtac
 | andp ?a ?b=>rs_all_pure a;rs_all_pure b
 end.
Ltac rs_frame :=
 lazymatch goal with |-?P|--?Q=>
 tryif rs_all_pure Q then rs_simple_pure else
 lazymatch Q with
 | andp ?A ?B=>apply _derivable1_andp_intros;[rs_frame|rs_frame]
 | _=>first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[rs_simple_pure]]
 end end.
