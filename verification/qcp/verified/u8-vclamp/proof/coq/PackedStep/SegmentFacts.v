From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma u8_element_size : StoreUCharAsElement.sizeA=1.
Proof. unfold StoreUCharAsElement.sizeA;apply sizeof_uchar. Qed.
Lemma u8_seg_append : forall p off step old fresh,
 0<=off ->0<=step ->
 UCharArray.seg p 0 off old **UCharArray.seg(p+off)0 step fresh |--
 UCharArray.seg p 0(off+step)(old++fresh).
Proof.
 intros.
 pose proof(UCharArray.seg_0_shift p off(off+step)fresh)as Hshift.
 rewrite ?u8_element_size,?sizeof_uchar in Hshift.
 replace(p+off*1)with(p+off)in Hshift by lia.
 replace(off+step-off)with step in Hshift by lia.
 rewrite <- Hshift.
 apply UCharArray.seg_merge_to_seg;lia.
Qed.
Lemma u8_full_append : forall p off step old fresh,
 0<=off ->0<=step ->
 UCharArray.seg p 0 off old **UCharArray.full(p+off)step fresh |--
 UCharArray.seg p 0(off+step)(old++fresh).
Proof.
 intros;sep_apply_l_atomic(UCharArray.full_to_seg(p+off)step fresh).
 sep_apply_l_atomic(u8_seg_append p off step old fresh ltac:(lia)ltac:(lia));entailer!.
Qed.
Print Assumptions u8_seg_append.
Print Assumptions u8_full_append.
