From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import Types.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition rd_init_range (A:list Z) : Prop :=
 forall i,0<=i<Zlength A -> 0<=Znth i A 0<=4294967295.
Lemma rd_full_nth_range : forall p n A i,0<=i<n ->
 UIntArray.full p n A |-- “ 0<=Znth i A 0<=4294967295 ”.
Proof.
 intros p n A i Hi.
 sep_apply(UIntArray.full_split_to_missing_i p i n A 0 Hi).
 unfold StoreUIntAsElement.storeA.
 sep_apply(store_uint_range (p+i*sizeof(INT)) (Znth i A 0)).
 change Int.max_unsigned with 4294967295.
 entailer!.
Qed.
Lemma rd_full_init_range : forall p n A,
 UIntArray.full p n A |-- “ rd_init_range A ”.
Proof.
 intros p n A;prop_apply(UIntArray.full_Zlength p n A);Intros_p Hlen.
 unfold rd_init_range,derivable1,coq_prop;intros m Hfull i Hi.
 exact(rd_full_nth_range p n A i ltac:(lia) m Hfull).
Qed.
Print Assumptions rd_full_nth_range.
Print Assumptions rd_full_init_range.
