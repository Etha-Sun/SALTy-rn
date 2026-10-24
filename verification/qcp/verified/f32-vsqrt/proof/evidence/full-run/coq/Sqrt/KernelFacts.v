From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From Sqrt Require Import Model Pack Borrowed.
Import ListNotations.
Local Open Scope Z_scope.
Local Opaque sqrt_arm sqrt_rvv sqrt_core sqrt_lane.
Lemma sqrt_prefix_length:forall(f:fp32->fp32)n A,
 0<=n -> n<=Zlength A -> Zlength(firstn(Z.to_nat n)(map f A))=n.
Proof.
 intros f n A Hn Hlen;rewrite Zlength_correct,length_firstn,length_map.
 rewrite Nat.min_l by(rewrite Zlength_correct in Hlen;lia);lia.
Qed.
Lemma sqrt_arm_values_length:forall n A,0<=n ->n<=Zlength A ->
 Zlength(sqrt_arm_values n A)=n.
Proof. intros;unfold sqrt_arm_values;apply sqrt_prefix_length;assumption. Qed.
Lemma sqrt_rvv_values_length:forall n A,0<=n ->n<=Zlength A ->
 Zlength(sqrt_rvv_values n A)=n.
Proof. intros;unfold sqrt_rvv_values;apply sqrt_prefix_length;assumption. Qed.
Lemma sqrt_prefix_append:forall(f:fp32->fp32)k r A,
 0<=k ->0<=r -> k+r<=Zlength A ->
 firstn(Z.to_nat(k+r))(map f A)=
 firstn(Z.to_nat k)(map f A)++firstn(Z.to_nat r)(map f(sublist k(k+r)A)).
Proof.
 intros f k r A Hk Hr Hend;unfold sublist.
 rewrite skipn_firstn_comm,Z2Nat.inj_add by lia.
 replace(Z.to_nat k+Z.to_nat r-Z.to_nat k)%nat with(Z.to_nat r)by lia.
 rewrite <-!firstn_map,<-skipn_map.
 rewrite firstn_firstn,Nat.min_id.
 rewrite <-(firstn_skipn(Z.to_nat k)(firstn(Z.to_nat k+Z.to_nat r)(map f A)))at 1.
 rewrite firstn_firstn,Nat.min_l by lia.
 rewrite skipn_firstn_comm.
 replace(Z.to_nat k+Z.to_nat r-Z.to_nat k)%nat with(Z.to_nat r)by lia.
 reflexivity.
Qed.
Lemma sqrt_arm_values_append:forall k r A,
 0<=k ->0<=r ->k+r<=Zlength A ->
 sqrt_arm_values(k+r)A=sqrt_arm_values k A++sqrt_arm_values r(sublist k(k+r)A).
Proof. intros;unfold sqrt_arm_values;apply sqrt_prefix_append;assumption. Qed.
Lemma sqrt_rvv_values_append:forall k r A,
 0<=k ->0<=r ->k+r<=Zlength A ->
 sqrt_rvv_values(k+r)A=sqrt_rvv_values k A++sqrt_rvv_values r(sublist k(k+r)A).
Proof. intros;unfold sqrt_rvv_values;apply sqrt_prefix_append;assumption. Qed.
Lemma sqrt_pack32_active_nth:forall(k vl:Z)(A:list fp32)(t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31:fp32)(u0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31:fp32)(i:nat),
 (i<32)%nat ->Z.of_nat i<vl ->
 nth i(sqrt_pack32 (sqrt_active 0 vl(sqrt_read_at 0 vl k A t0)u0) (sqrt_active 1 vl(sqrt_read_at 1 vl k A t1)u1) (sqrt_active 2 vl(sqrt_read_at 2 vl k A t2)u2) (sqrt_active 3 vl(sqrt_read_at 3 vl k A t3)u3) (sqrt_active 4 vl(sqrt_read_at 4 vl k A t4)u4) (sqrt_active 5 vl(sqrt_read_at 5 vl k A t5)u5) (sqrt_active 6 vl(sqrt_read_at 6 vl k A t6)u6) (sqrt_active 7 vl(sqrt_read_at 7 vl k A t7)u7) (sqrt_active 8 vl(sqrt_read_at 8 vl k A t8)u8) (sqrt_active 9 vl(sqrt_read_at 9 vl k A t9)u9) (sqrt_active 10 vl(sqrt_read_at 10 vl k A t10)u10) (sqrt_active 11 vl(sqrt_read_at 11 vl k A t11)u11) (sqrt_active 12 vl(sqrt_read_at 12 vl k A t12)u12) (sqrt_active 13 vl(sqrt_read_at 13 vl k A t13)u13) (sqrt_active 14 vl(sqrt_read_at 14 vl k A t14)u14) (sqrt_active 15 vl(sqrt_read_at 15 vl k A t15)u15) (sqrt_active 16 vl(sqrt_read_at 16 vl k A t16)u16) (sqrt_active 17 vl(sqrt_read_at 17 vl k A t17)u17) (sqrt_active 18 vl(sqrt_read_at 18 vl k A t18)u18) (sqrt_active 19 vl(sqrt_read_at 19 vl k A t19)u19) (sqrt_active 20 vl(sqrt_read_at 20 vl k A t20)u20) (sqrt_active 21 vl(sqrt_read_at 21 vl k A t21)u21) (sqrt_active 22 vl(sqrt_read_at 22 vl k A t22)u22) (sqrt_active 23 vl(sqrt_read_at 23 vl k A t23)u23) (sqrt_active 24 vl(sqrt_read_at 24 vl k A t24)u24) (sqrt_active 25 vl(sqrt_read_at 25 vl k A t25)u25) (sqrt_active 26 vl(sqrt_read_at 26 vl k A t26)u26) (sqrt_active 27 vl(sqrt_read_at 27 vl k A t27)u27) (sqrt_active 28 vl(sqrt_read_at 28 vl k A t28)u28) (sqrt_active 29 vl(sqrt_read_at 29 vl k A t29)u29) (sqrt_active 30 vl(sqrt_read_at 30 vl k A t30)u30) (sqrt_active 31 vl(sqrt_read_at 31 vl k A t31)u31))fp32_zero=sqrt_rvv(sqrt_lane(k+Z.of_nat i)A).
Proof.
 intros.
 do 32(destruct i as[|i];
 [cbn[sqrt_pack32 nth Z.of_nat]in *;
  unfold sqrt_active,sqrt_read_at;
  repeat match goal with |-context[Z.ltb ?j ?v]=>destruct(Z.ltb_spec j v);[|lia]end;
  reflexivity|]).
 lia.
Qed.
Local Transparent sqrt_lane.
Lemma sqrt_pack32_active_prefix:forall(k vl:Z)(A:list fp32)(t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31:fp32)(u0 u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31:fp32),
 0<=vl<=32 ->0<=k ->k+vl<=Zlength A ->
 sqrt_take vl(sqrt_pack32 (sqrt_active 0 vl(sqrt_read_at 0 vl k A t0)u0) (sqrt_active 1 vl(sqrt_read_at 1 vl k A t1)u1) (sqrt_active 2 vl(sqrt_read_at 2 vl k A t2)u2) (sqrt_active 3 vl(sqrt_read_at 3 vl k A t3)u3) (sqrt_active 4 vl(sqrt_read_at 4 vl k A t4)u4) (sqrt_active 5 vl(sqrt_read_at 5 vl k A t5)u5) (sqrt_active 6 vl(sqrt_read_at 6 vl k A t6)u6) (sqrt_active 7 vl(sqrt_read_at 7 vl k A t7)u7) (sqrt_active 8 vl(sqrt_read_at 8 vl k A t8)u8) (sqrt_active 9 vl(sqrt_read_at 9 vl k A t9)u9) (sqrt_active 10 vl(sqrt_read_at 10 vl k A t10)u10) (sqrt_active 11 vl(sqrt_read_at 11 vl k A t11)u11) (sqrt_active 12 vl(sqrt_read_at 12 vl k A t12)u12) (sqrt_active 13 vl(sqrt_read_at 13 vl k A t13)u13) (sqrt_active 14 vl(sqrt_read_at 14 vl k A t14)u14) (sqrt_active 15 vl(sqrt_read_at 15 vl k A t15)u15) (sqrt_active 16 vl(sqrt_read_at 16 vl k A t16)u16) (sqrt_active 17 vl(sqrt_read_at 17 vl k A t17)u17) (sqrt_active 18 vl(sqrt_read_at 18 vl k A t18)u18) (sqrt_active 19 vl(sqrt_read_at 19 vl k A t19)u19) (sqrt_active 20 vl(sqrt_read_at 20 vl k A t20)u20) (sqrt_active 21 vl(sqrt_read_at 21 vl k A t21)u21) (sqrt_active 22 vl(sqrt_read_at 22 vl k A t22)u22) (sqrt_active 23 vl(sqrt_read_at 23 vl k A t23)u23) (sqrt_active 24 vl(sqrt_read_at 24 vl k A t24)u24) (sqrt_active 25 vl(sqrt_read_at 25 vl k A t25)u25) (sqrt_active 26 vl(sqrt_read_at 26 vl k A t26)u26) (sqrt_active 27 vl(sqrt_read_at 27 vl k A t27)u27) (sqrt_active 28 vl(sqrt_read_at 28 vl k A t28)u28) (sqrt_active 29 vl(sqrt_read_at 29 vl k A t29)u29) (sqrt_active 30 vl(sqrt_read_at 30 vl k A t30)u30) (sqrt_active 31 vl(sqrt_read_at 31 vl k A t31)u31))=map sqrt_rvv(sublist k(k+vl)A).
Proof.
 intros;assert(Hsub:Zlength(sublist k(k+vl)A)=vl).
 { rewrite Zlength_sublist by lia;lia. }
 assert(HsubN:length(sublist k(k+vl)A)=Z.to_nat vl).
 { rewrite Zlength_correct in Hsub;lia. }
 unfold sqrt_take;apply(list_eq_nth fp32 _ _ fp32_zero).
 - rewrite length_firstn,length_map;cbn[sqrt_pack32 length].
   rewrite Nat.min_l by lia;lia.
 - intros i Hi;rewrite length_firstn in Hi;cbn[sqrt_pack32 length]in Hi.
   rewrite nth_firstn by lia.
   rewrite sqrt_pack32_active_nth by lia.
   rewrite(map_nth_len fp32 fp32 sqrt_rvv(sublist k(k+vl)A)i fp32_zero fp32_zero)by lia.
   f_equal;unfold sqrt_lane.
   replace(nth i(sublist k(k+vl)A)fp32_zero)with
    (Znth(Z.of_nat i)(sublist k(k+vl)A)fp32_zero)by(unfold Znth;rewrite Nat2Z.id;reflexivity).
   rewrite Znth_sublist by lia.
   replace(k+Z.of_nat i)with(Z.of_nat i+k)by lia;reflexivity.
Qed.
Print Assumptions sqrt_prefix_length.
Print Assumptions sqrt_arm_values_length.
Print Assumptions sqrt_rvv_values_length.
Print Assumptions sqrt_prefix_append.
Print Assumptions sqrt_arm_values_append.
Print Assumptions sqrt_rvv_values_append.
Print Assumptions sqrt_pack32_active_nth.
Print Assumptions sqrt_pack32_active_prefix.
