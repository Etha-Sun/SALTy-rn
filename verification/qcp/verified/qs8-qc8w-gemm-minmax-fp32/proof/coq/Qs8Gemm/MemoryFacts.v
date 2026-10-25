From Coq Require Import ZArith Lia List.
From Qs8Gemm Require Import Model NaNRepair.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma qs8_extent_bounds : forall K, 0<=K -> K<=a_read_extent K<=K+7.
Proof.
 intros K HK;unfold a_read_extent.
 pose proof(Z.div_mod(K+7)8 ltac:(lia)).
 pose proof(Z.mod_pos_bound(K+7)8 ltac:(lia));lia.
Qed.
Lemma qs8_mac_signed_bits : forall u a b,
 qs8_mac(CastModel.signed32_view u)a b=
 CastModel.signed32_view(IntegerFold.wrap32(u+a*b)).
Proof.
 intros u a b;unfold qs8_mac,qs8_wrap_signed;f_equal.
 pose proof(qs8_wrap_signed_bits u) as H.
 unfold IntegerFold.wrap32,IntegerFold.modulus in *.
 rewrite (Z.add_mod (CastModel.signed32_view u) (a*b)),(Z.add_mod u (a*b)) by lia.
 rewrite H;reflexivity.
Qed.
Lemma qs8_acc_step : forall d t i A Ps, 0<=d ->
 qs8_acc(d+1)t i A Ps=
 qs8_mac(qs8_acc d t i A Ps)(Znth d A 0)(qs8_char 1 t (8*d) i A Ps).
Proof.
 intros d t i A Ps Hd;unfold qs8_acc.
 rewrite qs8_fold_step by exact Hd.
 rewrite qs8_mac_signed_bits;reflexivity.
Qed.
Lemma qs8_acc_initial : forall t i A Ps,
 qs8_acc 0 t i A Ps=qs8_wrap_signed(qs8_bias t i Ps).
Proof. intros;unfold qs8_acc;rewrite qs8_fold_initial;reflexivity. Qed.
Lemma qs8_signed_id : forall x, -2147483648<=x<=2147483647 -> qs8_wrap_signed x=x.
Proof.
 intros x H;unfold qs8_wrap_signed,CastModel.signed32_view.
 change(signed_last_nbits(unsigned_last_nbits x 32)32=x).
 rewrite signed_unsigned_revolutive by lia.
 apply signed_last_nbits_eq;cbn;lia.
Qed.
Lemma qs8_prefix_zero : forall c N K A Ps magic off lo hi,
 CharArray.undef_full c N |-- qs8_output_prefix c N 0 K A Ps magic off lo hi.
Proof.
 intros;change(CharArray.undef_full c N |-- CharArray.full c 0 [] ** CharArray.undef_seg c 0 N).
 rewrite CharArray.full_empty.
 unfold CharArray.undef_full,CharArray.undef_seg,store_undef_array.
 rewrite Z.sub_0_r;entailer!.
Qed.
Lemma qs8_prefix_done : forall c N K A Ps magic off lo hi,
 qs8_output_prefix c N N K A Ps magic off lo hi |-- qs8_output_ref c N K A Ps magic off lo hi.
Proof.
 intros;unfold qs8_output_prefix,qs8_write_state,qs8_output_ref.
 rewrite CharArray.undef_seg_empty;entailer!.
Qed.
Print Assumptions qs8_acc_step.
Print Assumptions qs8_prefix_zero.
Print Assumptions qs8_prefix_done.

Lemma qs8_panels_positive : forall N, 0<N -> 0<panels N.
Proof.
 intros N H;unfold panels.
 pose proof(Z.div_mod(N+7)8 ltac:(lia));pose proof(Z.mod_pos_bound(N+7)8 ltac:(lia));lia.
Qed.
Lemma qs8_mac_normalize : forall x a b,
 qs8_mac(qs8_wrap_signed x)a b=qs8_mac x a b.
Proof.
 intros;unfold qs8_wrap_signed at 1;rewrite qs8_mac_signed_bits.
 unfold qs8_mac,qs8_wrap_signed;f_equal.
 change(IntegerFold.mac32(IntegerFold.wrap32 x)a b=IntegerFold.mac32 x a b).
 apply IntegerFold.mac32_normalize.
Qed.
Lemma qs8_acc_one : forall t i A Ps,
 qs8_acc 1 t i A Ps=qs8_mac(qs8_bias t i Ps)(Znth 0 A 0)(qs8_char 1 t 0 i A Ps).
Proof.
 intros;change(qs8_acc(0+1)t i A Ps=qs8_mac(qs8_bias t i Ps)(Znth 0 A 0)(qs8_char 1 t 0 i A Ps)).
 rewrite qs8_acc_step by lia;rewrite qs8_acc_initial,qs8_mac_normalize;reflexivity.
Qed.
