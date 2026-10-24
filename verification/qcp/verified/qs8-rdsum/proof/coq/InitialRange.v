From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Import Types.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition rd_init_range (A:list Z) : Prop :=
 forall i,0<=i<Zlength A -> -2147483648<=Znth i A 0<=2147483647.
Lemma rd_full_nth_range : forall p n A i,0<=i<n ->
 IntArray.full p n A |-- “ -2147483648<=Znth i A 0<=2147483647 ”.
Proof.
 intros p n A i Hi.
 sep_apply(IntArray.full_split_to_missing_i p i n A 0 Hi).
 unfold StoreIntAsElement.storeA.
 sep_apply(store_int_range (p+i*sizeof(INT)) (Znth i A 0)).
 change Int.min_signed with (-2147483648);change Int.max_signed with 2147483647.
 entailer!.
Qed.
Lemma rd_full_init_range : forall p n A,
 IntArray.full p n A |-- “ rd_init_range A ”.
Proof.
 intros p n A;prop_apply(IntArray.full_Zlength p n A);Intros_p Hlen.
 unfold rd_init_range,derivable1,coq_prop;intros m Hfull i Hi.
 exact(rd_full_nth_range p n A i ltac:(lia) m Hfull).
Qed.
Print Assumptions rd_full_nth_range.
Print Assumptions rd_full_init_range.
