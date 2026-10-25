From Coq Require Import ZArith List Lia Reals.
From Qs8Gemm Require Export FloatBits Quantization.
From Qd8Cast Require Import CastModel IntegerFold.
From Qd8Phase Require Import PhaseModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Record panel_data := { biases:list Z; weights:list Z; scales:list fp32 }.
Definition empty_panel := {| biases:=[]; weights:=[]; scales:=[] |}.
Definition panel_at (ps:list panel_data) (tile:Z) := Znth tile ps empty_panel.
Definition panel_bytes (K:Z) := 64+8*K.
Definition panels (N:Z) := (N+7)/8.
Definition a_read_extent (K:Z) := 8*((K+7)/8).
Definition panel_wf (K:Z) (p:panel_data) :=
 Zlength(biases p)=8 /\ Zlength(weights p)=8*K /\ Zlength(scales p)=8.
Definition qs8_block (w K:Z) (p:panel_data) :=
 IntArray.full w 8 (biases p) ** CharArray.full (w+32) (8*K) (weights p) **
 FloatArray.full (w+32+8*K) 8 (scales p).
Fixpoint packed_matrix (K w:Z) (Ps:list panel_data) : Assertion :=
 match Ps with []=>emp | p::rest=>qs8_block w K p ** packed_matrix K (w+panel_bytes K) rest end.
Definition domain_shape (mr N K:Z) (Ps:list panel_data) :=
 mr=1 /\ 0<N /\ N<=18446744073709551615 /\ 0<K /\ K<=18446744073709551615 /\
 Zlength Ps=panels N /\ Forall (panel_wf K) Ps.
Definition data_capacity (N K a w c:Z) :=
 0<=a /\ 0<=w /\ 0<=c /\
 a+a_read_extent K<=18446744073709551615 /\
 w+panels N*panel_bytes K<=18446744073709551615 /\
 c+N<=18446744073709551615.
Definition qs8_zget (i:Z) (L:list Z):=Znth i L 0.
Definition qs8_fget (i:Z) (L:list fp32):=Znth i L fp32_zero.
Definition qs8_bias (t i:Z) (Ps:list panel_data):=qs8_zget i (biases(panel_at Ps t)).
Definition qs8_scale (t i:Z) (Ps:list panel_data):=qs8_fget i (scales(panel_at Ps t)).
Definition qs8_char (mode t j i:Z) (A:list Z) (Ps:list panel_data):=
 qs8_zget (j+i) (if Z.eqb mode 0 then A else weights(panel_at Ps t)).
Definition qs8_i8_address_ok (mode p a w K t j:Z) (Ps:list panel_data):=
 (mode=0 /\ p=a+j /\ 0<=j /\ j+8<=a_read_extent K) \/
 (mode=1 /\ p=w+t*panel_bytes K+32+j /\ 0<=t<Zlength Ps /\ 0<=j /\ j+8<=8*K).
Definition qs8_matrix_wf (K:Z) (Ps:list panel_data):=Forall (panel_wf K) Ps.
Definition qs8_wrap_signed (x:Z):=signed32_view (IntegerFold.wrap32 x).
Definition qs8_mac (acc a b:Z):=qs8_wrap_signed(acc+a*b).
Definition qs8_acc (d tile lane:Z) (A:list Z) (Ps:list panel_data):=
 signed32_view(PhaseModel.lane_acc d (qs8_bias tile lane Ps) 1 lane A (weights(panel_at Ps tile))).
Definition qs8_final (K col:Z) (A:list Z) (Ps:list panel_data) (magic:fp32) (off lo hi:Z):=
 qs8_quant (qs8_acc K (col/8) (col mod 8) A Ps) (qs8_scale (col/8) (col mod 8) Ps) magic off lo hi.
Definition completed_values (K n:Z) (A:list Z) (Ps:list panel_data) (magic:fp32) (off lo hi:Z):=
 map (fun i=>qs8_final K (Z.of_nat i) A Ps magic off lo hi) (seq 0 (Z.to_nat n)).
Definition qs8_write_state (c N done:Z) (L:list Z):=
 CharArray.full c done L ** CharArray.undef_seg c done N.
Definition qs8_output_prefix (c N done K:Z) (A:list Z) (Ps:list panel_data) (magic:fp32) (off lo hi:Z):=
 qs8_write_state c N done (completed_values K done A Ps magic off lo hi).
Definition qs8_output_ref (c N K:Z) (A:list Z) (Ps:list panel_data) (magic:fp32) (off lo hi:Z):=
 CharArray.full c N (completed_values K N A Ps magic off lo hi).
Definition qs8_append (L R:list Z):=L++R.
Definition qs8_take (n:Z) (L:list Z):=sublist 0 n L.
Definition qs8_lane4 (lane x0 x1 x2 x3:Z):=qs8_zget lane [x0;x1;x2;x3].
Definition qs8_select_z (vl i x:Z):=if i <? vl then x else 0.
Definition qs8_select_f (vl i:Z) (x:fp32):=if i <? vl then x else fp32_zero.
Definition qs8_nan (x:fp32):=f16_nan_bits(bits_of_fp32 x).
Definition qs8_merge (a b m:Z):=if Z.eqb m 0 then a else b.
Definition qs8_mask_and (a b:Z):=if andb (negb(Z.eqb a 0)) (negb(Z.eqb b 0)) then 1 else 0.
Definition qs8_gt (a b:Z):=if a <? b then 0 else if Z.eqb a b then 0 else 1.
Definition qs8_eq (a b:Z):=if Z.eqb a b then 1 else 0.
Definition qs8_or32 (a b:Z):=qs8_wrap_signed(Z.lor a b).
Definition qs8_and32 (a b:Z):=qs8_wrap_signed(Z.land a b).
Definition qs8_reinterpret (x:fp32):=signed32_view(bits_of_fp32 x).
Definition qs8_uninterpret (x:Z):=fp32_of_bits(IntegerFold.wrap32 x).
Definition qs8_ext (k i:Z) (L:list Z):=qs8_zget ((k+i) mod 8) L.
Lemma qs8_capacity_positive : forall N K a w c,
 0<N -> 0<K -> data_capacity N K a w c ->
 0<=a /\ 0<=w /\ 0<=c /\ a<=18446744073709551615 /\ c<=18446744073709551615.
Proof. intros;unfold data_capacity,a_read_extent in *;repeat split;try lia.
 assert(0<=(K+7)/8) by (apply Z.div_pos;lia);lia. Qed.
Print Assumptions qs8_capacity_positive.

Definition qs8_active_z (vl lane actual expected:Z):Prop:=lane<vl -> actual=expected.
Definition qs8_active_f (vl lane:Z) (actual expected:fp32):Prop:=lane<vl -> actual=expected.

Definition qs8_min (a b:Z):=Z.min a b.
Definition qs8_max (a b:Z):=Z.max a b.
