From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import Types MemoryModel IntegerFacts VectorFacts VlModel RvvProgramModel NeonBounds NeonSupport FastFrame neon_unit_goal.
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
 | rs_pair_u8 ?a ?x ?y=>pose proof(rs_pair_u8_bound a x y);lia
 | rs_mul_u8 ?a ?b=>pose proof(rs_mul_u8_bound a b);lia
 | rs_pair_u16 ?a ?x ?y=>apply rs_pair_u16_bound;lia
 | rs_add_u32 ?a ?b=>apply rs_add_u32_bound;[rs_kernel_term_bound a|rs_kernel_term_bound b]
 | _=>lia
 end.
Ltac rs_kernel_bound := first[assumption|reflexivity|lia|
 match goal with |-context[rs_active_u32 ?a ?b ?i ?vl]=>let t:=constr:(rs_active_u32 a b i vl)in let H:=fresh in assert(H:0<=t<=4294967295)by(rs_kernel_term_bound t);lia end|
 match goal with |-context[rs_splat_u32 ?a ?i ?vl]=>let t:=constr:(rs_splat_u32 a i vl)in let H:=fresh in assert(H:0<=t<=4294967295)by(rs_kernel_term_bound t);lia end].
Ltac rs_count_context :=
 repeat match goal with H:context[rs_rem2048 ?n]|-_=>
   progress (tryif match goal with H0:0<=rs_rem2048 n<2048|-_=>idtac end then idtac else pose proof(rs_rem2048_bound n)) end;
 repeat match goal with H:context[rs_count16 ?x]|-_=>
   progress (tryif match goal with H0:0<=rs_count16 x<=128|-_=>idtac end then idtac else let Hc:=fresh in assert(Hc:0<=rs_count16 x<=128)by(apply rs_count16_bound;lia)) end.
Ltac rs_simple_pure := rs_limits;rs_count_context; first[solve[entailer!;rs_kernel_bound]|solve[unfold store_uchar,store_uint,store_ushort;entailer!;rs_limits;try change Byte.max_unsigned with 255 in *;rs_kernel_bound]|solve[unfold rs_vl in *;repeat first[match goal with H:context[Z.ltb ?x ?y]|-_=>destruct(Z.ltb_spec x y) end|match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y) end];entailer!;rs_kernel_bound]].
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
Lemma proof_of_test_neon_partial_solve_wit_5_pure : Qu8Rsum.neon_unit_goal.test_neon_partial_solve_wit_5_pure.
Proof. unfold Qu8Rsum.neon_unit_goal.test_neon_partial_solve_wit_5_pure;try left;intros;subst;unfold UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint32m8_t,UndefStructPredvuint32m1_t;rewrite ?local_field_address;rs_limits;repeat progress rewrite <-logic_equiv_andp_assoc;rs_frame. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_5_pure.
