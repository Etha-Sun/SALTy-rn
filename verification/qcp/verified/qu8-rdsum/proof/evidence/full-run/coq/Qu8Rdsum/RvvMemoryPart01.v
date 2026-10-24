From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import rvv_unit_goal Model Types ProgramModel RvvModel RvvFacts StoreModel StoreFacts InitialRange RvvBounds OutputModel IntegerFacts RvvMemoryPartPure RvvMemoryPartExpandChecked FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_store_lane rd_partial rd_active_wadd32 rd_out_lane rd_acc32.
Module CheckedRvvMemoryPart01.
Lemma proof_of_test_rvv_entail_wit_12 : Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_12.
Proof. unfold Qu8Rdsum.rvv_unit_goal.test_rvv_entail_wit_12.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M ip6 ip5 ip4 ip3 ip2 ip1 ip0 r vl input_increment output input channels PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33.
assert(Hzero:r=0)by lia;subst r;rewrite !Z.sub_0_r in *.
 rewrite rd_rvv_store_expanded by (try assumption;lia).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 0 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 1 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 2 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 3 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 4 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 5 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 6 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 7 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 8 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 9 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 10 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 11 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 12 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 13 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 14 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 15 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 16 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 17 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 18 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 19 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 20 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 21 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 22 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 23 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 24 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 25 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 26 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 27 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 28 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 29 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 30 vl Init).
 fold (rd_rvv_final_lane M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels) 31 vl Init).
 rewrite !rd_rvv_final_lane_splat by (try assumption;lia).
 rewrite ?local_field_address.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 remember (UIntArray.full output_pre channels_pre
   (rd_partial M input_pre rows_pre channels_pre input_stride_pre ((channels_pre-channels)+vl) Init))
   as output_heap eqn:Houtput_heap;clear Houtput_heap.
 remember (rd_mem M)as input_heap eqn:Hinput_heap;clear Hinput_heap.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
 - opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
End CheckedRvvMemoryPart01.
