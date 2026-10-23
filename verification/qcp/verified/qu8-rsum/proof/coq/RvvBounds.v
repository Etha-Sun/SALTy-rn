From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Rsum Require Export VectorFacts ByteWindow MemoryModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rs_splat_u32_bound : forall x i vl,
 0<=x<=4294967295 -> 0<=rs_splat_u32 x i vl<=4294967295.
Proof. intros;unfold rs_splat_u32;destruct(Z.ltb i vl);lia. Qed.
Lemma rs_bytes_nth_range : forall base n A i,
 0<=i<n -> UCharArray.full base n A |-- “0<=Znth i A 0<=255”.
Proof.
 intros base n A i Hi.
 eapply derivable1_trans;[exact(byte_window_extract base i n A 0 Hi)|].
 unfold store_uchar;entailer!;change Byte.max_unsigned with 255 in *;lia.
Qed.
Print Assumptions rs_splat_u32_bound.
Print Assumptions rs_bytes_nth_range.
Lemma rs_read_lane_range : forall base n A idx vl i,
 0<=idx -> idx+vl<=n -> 0<=vl<=32 -> 0<=i<32 ->
 UCharArray.full base n A |-- “0<=rs_read_lane i vl idx A<=255”.
Proof.
 intros base n A idx vl i Hi Hn Hv Hlane;unfold rs_read_lane.
 destruct(Z.ltb_spec i vl).
 - apply rs_bytes_nth_range;lia.
 - entailer!;lia.
Qed.
Lemma rs_read_lane_all : forall base n A idx vl,
 0<=idx -> idx+vl<=n -> 0<=vl<=32 ->
 UCharArray.full base n A |-- “forall i:Z,0<=i<32 -> 0<=rs_read_lane i vl idx A<=255”.
Proof.
 intros base n A idx vl Hi Hn Hv.
 unfold derivable1,coq_prop;intros h Hh i Hlane.
 exact(rs_read_lane_range base n A idx vl i Hi Hn Hv Hlane h Hh).
Qed.
Print Assumptions rs_read_lane_range.
Print Assumptions rs_read_lane_all.
