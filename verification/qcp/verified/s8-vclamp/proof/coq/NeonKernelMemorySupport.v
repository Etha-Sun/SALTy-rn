From Coq Require Import ZArith Lia List String.
From S8Clamp Require Export NeonKernelMemory NeonKernelFacts NeonFrame ByteBridge.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma s8_neon_bulk_chunk : forall p k r lo hi A,
 0<=k -> 0<=r -> k+r<=Zlength A ->
 CharArray.full p k(s8_bulk_prefix k lo hi A) **
 CharArray.full(p+k)r(map(fun x=>s8_bulk_lane x lo hi)(s8_window k r A)) |--
 CharArray.full p(k+r)(s8_bulk_prefix(k+r)lo hi A).
Proof. intros. rewrite s8_bulk_prefix_append by assumption. apply s8_full_append;assumption. Qed.
Lemma s8_neon_tail_chunk : forall p k r n lo hi A,
 0<=n -> s8_bulk_count n<=k -> 0<=r -> k+r<=Zlength A ->
 CharArray.full p k(s8_tail_prefix n(k-s8_bulk_count n)lo hi A) **
 CharArray.full(p+k)r(map(fun x=>s8_tail_lane x lo hi)(s8_window k r A)) |--
 CharArray.full p(k+r)(s8_tail_prefix n(k+r-s8_bulk_count n)lo hi A).
Proof.
 intros. pose proof(s8_bulk_count_bounds n H).
 replace(k+r-s8_bulk_count n)with(k-s8_bulk_count n+r)by lia.
 rewrite s8_tail_prefix_append by lia.
 replace(s8_bulk_count n+(k-s8_bulk_count n))with k by lia.
 apply s8_full_append;lia.
Qed.
Lemma s8_neon_tail_finish : forall p k n lo hi A,
 0<=k<=n -> s8_bulk_count n<=k -> 0<=n<=Zlength A ->
 CharArray.full p k(s8_tail_prefix n(k-s8_bulk_count n)lo hi A) **
 CharArray.full(p+k)(n-k)(map(fun x=>s8_tail_lane x lo hi)(s8_window k(n-k)A)) |--
 CharArray.full p n(s8_values n lo hi A).
Proof.
 intros. rewrite <-s8_tail_prefix_full.
 replace(n mod 64)with(k+(n-k)-s8_bulk_count n)by(unfold s8_bulk_count;lia).
 pose proof(s8_neon_tail_chunk p k(n-k)n lo hi A ltac:(lia)H0 ltac:(lia)ltac:(lia))as HH.
 replace(k+(n-k))with n in HH by lia. replace(k+(n-k))with n by lia. exact HH.
Qed.
Lemma s8_neon_map_window_3 : forall(f:Z->Z)k A,
 0<=k -> k+3<=Zlength A -> map f(s8_window k 3 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i)at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 3 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0)] 0).
   rewrite s8_map_window_nth by lia.
   do 3 (destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma s8_neon_map_window_5 : forall(f:Z->Z)k A,
 0<=k -> k+5<=Zlength A -> map f(s8_window k 5 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i)at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 5 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0)] 0).
   rewrite s8_map_window_nth by lia.
   do 5 (destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma s8_neon_map_window_6 : forall(f:Z->Z)k A,
 0<=k -> k+6<=Zlength A -> map f(s8_window k 6 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i)at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 6 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0)] 0).
   rewrite s8_map_window_nth by lia.
   do 6 (destruct i as[|i];[reflexivity|]);lia.
Qed.
Lemma s8_neon_map_window_7 : forall(f:Z->Z)k A,
 0<=k -> k+7<=Zlength A -> map f(s8_window k 7 A)=[f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0); f(Znth(k+6)A 0)].
Proof.
 intros f k A Hk Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite map_length,s8_window_length by lia;reflexivity.
 - intros i Hi. rewrite map_length,s8_window_length in Hi by lia.
   rewrite <-(Nat2Z.id i)at 1.
   change(Znth(Z.of_nat i)(map f(s8_window k 7 A))0=nth i [f(Znth(k+0)A 0); f(Znth(k+1)A 0); f(Znth(k+2)A 0); f(Znth(k+3)A 0); f(Znth(k+4)A 0); f(Znth(k+5)A 0); f(Znth(k+6)A 0)] 0).
   rewrite s8_map_window_nth by lia.
   do 7 (destruct i as[|i];[reflexivity|]);lia.
Qed.
Ltac root_memory_frame :=
 rewrite ?local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac root_memory_or := first[solve[root_memory_frame]
 |solve[Left;root_memory_or]
 |solve[Right;root_memory_or]].
Print Assumptions s8_neon_bulk_chunk.
Print Assumptions s8_neon_tail_chunk.
Print Assumptions s8_neon_tail_finish.
Print Assumptions s8_neon_map_window_3.
Print Assumptions s8_neon_map_window_5.
Print Assumptions s8_neon_map_window_6.
Print Assumptions s8_neon_map_window_7.
