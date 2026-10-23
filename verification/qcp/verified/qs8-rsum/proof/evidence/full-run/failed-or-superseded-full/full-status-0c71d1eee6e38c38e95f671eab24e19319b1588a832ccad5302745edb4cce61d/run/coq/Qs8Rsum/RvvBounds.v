From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Rsum Require Export VectorFacts ByteWindow MemoryModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rs_splat_s32_bound : forall x i vl,
 -2147483648<=x<=2147483647 -> -2147483648<=rs_splat_s32 x i vl<=2147483647.
Proof. intros;unfold rs_splat_s32;destruct(Z.ltb i vl);lia. Qed.
Lemma rs_bytes_nth_range : forall base n A i,
 0<=i<n -> CharArray.full base n A |-- “-128<=Znth i A 0<=127”.
Proof.
 intros base n A i Hi.
 eapply derivable1_trans;[exact(byte_window_extract base i n A 0 Hi)|].
 unfold store_char;entailer!;change Byte.min_signed with (-128) in *;change Byte.max_signed with 127 in *;lia.
Qed.
Print Assumptions rs_splat_s32_bound.
Print Assumptions rs_bytes_nth_range.
Lemma rs_read_lane_range : forall base n A idx vl i,
 0<=idx -> idx+vl<=n -> 0<=vl<=32 -> 0<=i<32 ->
 CharArray.full base n A |-- “-128<=rs_read_lane i vl idx A<=127”.
Proof.
 intros base n A idx vl i Hi Hn Hv Hlane;unfold rs_read_lane.
 destruct(Z.ltb_spec i vl).
 - apply rs_bytes_nth_range;lia.
 - entailer!;lia.
Qed.
Lemma rs_read_lane_all : forall base n A idx vl,
 0<=idx -> idx+vl<=n -> 0<=vl<=32 ->
 CharArray.full base n A |-- “forall i:Z,0<=i<32 -> -128<=rs_read_lane i vl idx A<=127”.
Proof.
 intros base n A idx vl Hi Hn Hv.
 unfold derivable1,coq_prop;intros h Hh i Hlane.
 exact(rs_read_lane_range base n A idx vl i Hi Hn Hv Hlane h Hh).
Qed.
Print Assumptions rs_read_lane_range.
Print Assumptions rs_read_lane_all.
