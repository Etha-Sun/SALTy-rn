From Coq Require Import ZArith Lia List.
From F32F16 Require Export KernelSupport.
From QcpNeon Require Import NeonBridge.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma f16_float_segment_open_four:forall (p lo hi:Z) (l:list fp32) (d:fp32),4<=hi-lo ->
 FloatArray.seg p lo hi l |--
 (p+lo*sizeof(FLOAT)+0*sizeof(FLOAT)) # Float |-> Znth 0 l d **
 (p+lo*sizeof(FLOAT)+1*sizeof(FLOAT)) # Float |-> Znth 1 l d **
 (p+lo*sizeof(FLOAT)+2*sizeof(FLOAT)) # Float |-> Znth 2 l d **
 (p+lo*sizeof(FLOAT)+3*sizeof(FLOAT)) # Float |-> Znth 3 l d **
 FloatArray.seg p (lo+4) hi (fp32_slice 4 (hi-lo) l).
Proof.
 intros p lo hi l d Hb;unfold fp32_slice.
 sep_apply(FloatArray.seg_to_full p lo hi l).
 sep_apply(float_full_open4(p+lo*sizeof(FLOAT))(hi-lo)l d Hb).
 rewrite <- (FloatArray.seg_shift p lo 4(hi-lo)(sublist 4(hi-lo)l)).
 replace(lo+(hi-lo))with hi by lia;entailer!.
Qed.
Print Assumptions f16_float_segment_open_four.
Ltac f16_open_input_four :=
 match goal with |- ?P |-- ?Q =>
 multimatch Q with context[Znth 0 ?l ?d] =>
 first[multimatch P with context[FloatArray.full ?p ?n l] =>
 let Hb:=fresh "Hread"in assert(Hb:4<=n)by lia;sep_apply(float_full_open4 p n l d Hb)end
 |multimatch P with context[FloatArray.seg ?p ?lo ?hi l] =>
 let Hb:=fresh "Hread"in assert(Hb:4<=hi-lo)by lia;sep_apply(f16_float_segment_open_four p lo hi l d Hb)end]
 end end.
Ltac f16_split_output_prefix :=
 match goal with |- ?P |-- ?Q =>
 multimatch Q with context[UShortArray.undef_full ?p ?m] =>
 multimatch P with context[UShortArray.undef_full p ?n] =>
 let Hb:=fresh "Hsplit"in assert(Hb:0<=m<=n)by lia;
 sep_apply(UShortArray.undef_full_split_to_undef_full p m n Hb);
 cbn[StoreUShortAsElement.sizeA];rewrite ?sizeof_ushort;
 replace(p+m*2)with(p+2*m)by ring
 end end end.
Ltac f16_opaque_except_output_rec l :=
 lazymatch l with
 | nil=>idtac
 | cons(norm_asrt ?v)?tail=>
   lazymatch v with
   | UShortArray.undef_full _ _=>idtac
   | _=>try(let cell:=fresh "framecell"in let H:=fresh "Eframecell"in remember v as cell eqn:H;clear H)
   end;f16_opaque_except_output_rec tail
 end.
Ltac f16_split_output_fast :=
 intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?f16_scale_hi_decimal,?f16_scale_lo_decimal,?sizeof_float,?sizeof_ushort in *;
 unfold f16_same_bits,same_bits in *;subst;
 match goal with |- ?P |-- _=>let leaves:=All_listasrts P in f16_opaque_except_output_rec leaves end;
 f16_split_output_prefix;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
