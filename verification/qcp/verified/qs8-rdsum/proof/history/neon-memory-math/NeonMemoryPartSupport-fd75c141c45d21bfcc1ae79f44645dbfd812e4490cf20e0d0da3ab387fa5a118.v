From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Export Model Types ProgramModel ProgressModel StoreModel StoreFacts RvvModel RvvFacts RvvBounds InitialRange OutputModel FastFrame ControlLoopFacts NeonJoinModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac rd_neon_memory_prepare :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 rewrite ?local_field_address;
 try change UINT64_MAX with 18446744073709551615 in *.
Ltac rd_neon_memory_frame :=
 rd_neon_memory_prepare;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].

Local Opaque rd_partial rd_result_lane rd_column.
Lemma rd_neon_four_store : forall M base rows channels stride k Init,
 0<=k -> k+4<=channels -> Zlength Init=channels ->
 replace_Znth (k+3) (rd_result_lane M base rows stride (k+3) Init)
  (replace_Znth (k+2) (rd_result_lane M base rows stride (k+2) Init)
   (replace_Znth (k+1) (rd_result_lane M base rows stride (k+1) Init)
    (replace_Znth (k+0) (rd_result_lane M base rows stride (k+0) Init)
      (rd_partial M base rows channels stride k Init)))) =
 rd_partial M base rows channels stride (k+4) Init.
Proof.
 intros;rewrite !Z.add_0_r.
 rewrite rd_partial_store_step by lia.
 rewrite rd_partial_store_step by lia.
 replace(k+1+1)with(k+2)by lia.
 rewrite rd_partial_store_step by lia.
 replace(k+2+1)with(k+3)by lia.
 rewrite rd_partial_store_step by lia.
 replace(k+3+1)with(k+4)by lia;reflexivity.
Qed.
Lemma rd_neon_final_lane : forall M base rows channels stride k q i Init,
 0<=k -> k<=q+i -> 0<=i<4 -> q+i<channels ->
 Zlength Init=channels -> rd_init_range Init ->
 rs_add_s32 (Znth (q+i) (rd_partial M base rows channels stride k Init) 0)
  (rd_acc32 M base stride q rows i 4) =
 rd_result_lane M base rows stride (q+i) Init.
Proof.
 intros M base rows channels stride k q i Init Hk Hq Hi Hb Hlen Hrange.
 unfold rd_acc32.
 destruct (Z.ltb_spec i 4);[|lia].
 rewrite rd_partial_suffix by lia.
 rewrite rs_add_s32_wrap.
 - rewrite rs_s32_add_r;reflexivity.
 - apply Hrange;lia.
 - apply rs_s32_bound.
Qed.
Print Assumptions rd_neon_four_store.
Print Assumptions rd_neon_final_lane.

Lemma rd_neon_two_store : forall M base rows channels stride k Init,
 0<=k -> k+2<=channels -> Zlength Init=channels ->
 replace_Znth (k+1) (rd_result_lane M base rows stride (k+1) Init)
  (replace_Znth (k+0) (rd_result_lane M base rows stride (k+0) Init)
    (rd_partial M base rows channels stride k Init)) =
 rd_partial M base rows channels stride (k+2) Init.
Proof.
 intros;rewrite !Z.add_0_r.
 rewrite rd_partial_store_step by lia.
 rewrite rd_partial_store_step by lia.
 replace(k+1+1)with(k+2)by lia;reflexivity.
Qed.
Ltac rd_neon_enumerate c :=
 let H:=fresh "Hcases"in
 assert(H:c=0 \/c=1 \/c=2 \/c=3 \/c=4 \/c=5 \/c=6 \/c=7)by lia;
 destruct H as[H|[H|[H|[H|[H|[H|[H|H]]]]]]];subst c.
Lemma rd_neon_low_bits : forall c,0<=c<8 ->
 0<=rd_bit4 c<=4 /\ 0<=rd_bit2 c<=2 /\ 0<=Z.land c 1<=1 /\
 rd_bit4 c+rd_bit2 c+Z.land c 1=c.
Proof. intros c H;rd_neon_enumerate c;vm_compute;intuition congruence. Qed.
Lemma rd_neon_bit4_nonzero : forall c,0<=c<8 ->Z.land c 4<>0 ->rd_bit4 c=4 /\ 4<=c.
Proof. intros c H Hn;rd_neon_enumerate c;vm_compute in *;intuition congruence. Qed.
Lemma rd_neon_bit2_nonzero : forall c,0<=c<8 ->Z.land c 2<>0 ->rd_bit2 c=2.
Proof. intros c H Hn;rd_neon_enumerate c;vm_compute in *;intuition congruence. Qed.
Lemma rd_neon_u64_step : forall p n,
 0<=p<=18446744073709551615 ->0<=p+n<=18446744073709551615 ->
 unsigned_last_nbits(unsigned_last_nbits p 64+n)64=p+n.
Proof.
 intros;change(rd_u64(rd_u64 p+n)=p+n).
 rewrite !rd_u64_in_range by lia;reflexivity.
Qed.
Print Assumptions rd_neon_two_store.
Print Assumptions rd_neon_low_bits.
Print Assumptions rd_neon_bit4_nonzero.
Print Assumptions rd_neon_bit2_nonzero.
Print Assumptions rd_neon_u64_step.
