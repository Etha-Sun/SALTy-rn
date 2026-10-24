From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Export Model Types ProgramModel ProgressModel StoreModel StoreFacts RvvModel RvvFacts RvvBounds InitialRange OutputModel FastFrame.
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
 0<=k -> k<=q -> 0<=i<4 -> q+i<channels ->
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
