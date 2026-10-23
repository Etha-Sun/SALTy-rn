From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Integers.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma uchar_full_value_bound : forall p n A i,0<=i<n ->
 UCharArray.full p n A |-- “ 0<=Znth i A 0<=255 ”.
Proof.
 intros p n A i Hi.
 sep_apply(UCharArray.full_split_to_missing_i p i n A 0 Hi).
 unfold StoreUCharAsElement.storeA,store_uchar.
 change Byte.max_unsigned with 255 in *;entailer!.
Qed.
Lemma uchar_full_value_bound_preserve : forall p n A i,0<=i<n ->
 UCharArray.full p n A |-- “ 0<=Znth i A 0<=255 ” && UCharArray.full p n A.
Proof.
 intros p n A i Hi.
 pose proof(uchar_full_value_bound p n A i Hi)as Hb.
 unfold andp,coq_prop,derivable1 in *;intros m Hm;split;[now apply(Hb m)|exact Hm].
Qed.
Print Assumptions uchar_full_value_bound.
Print Assumptions uchar_full_value_bound_preserve.
