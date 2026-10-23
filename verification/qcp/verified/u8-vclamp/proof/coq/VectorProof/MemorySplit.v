From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma split_input : forall p n vl A,0<=vl<=n ->
 UCharArray.full p n A |-- UCharArray.seg p 0 vl(sublist 0 vl A)**
 UCharArray.full(p+vl*sizeof(UCHAR))(n-vl)(sublist vl n A).
Proof.
 intros;sep_apply_l_atomic(UCharArray.full_split_to_seg p vl n A ltac:(lia)).
 sep_apply_l_atomic(UCharArray.seg_to_full p vl n(sublist vl n A)).
 unfold StoreUCharAsElement.sizeA;entailer!.
Qed.
Print Assumptions split_input.
