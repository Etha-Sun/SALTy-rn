From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export RvvFacts LoadModel OutputModel InitialRange ListFacts.
Local Open Scope Z_scope.
Lemma rd_read_lane_range : forall M p i vl,
 (forall q,rd_present M q -> -128<=rd_get M q<=127) ->
 rd_window M p vl -> 0<=i -> -128<=rd_read_lane M p i vl<=127.
Proof. intros;unfold rd_read_lane;destruct(Z.ltb_spec i vl);[apply H;apply H0;lia|lia]. Qed.
Lemma rd_active_wadd16_range : forall a b i vl,
 -32768<=rd_active_wadd16 a b i vl<=32767.
Proof. intros;unfold rd_active_wadd16,rd_wadd16;destruct(Z.ltb i vl);[apply rd_s16_bound|lia]. Qed.
Lemma rd_active_wadd32_range : forall a b i vl,
 -2147483648<=a<=2147483647 -> -2147483648<=b<=2147483647 ->
 -2147483648<=rd_active_wadd32 a b i vl<=2147483647.
Proof. intros;unfold rd_active_wadd32;destruct(Z.ltb i vl);[rewrite rs_add_s32_wrap by assumption;apply rs_s32_bound|lia]. Qed.
Lemma rd_out_lane_range : forall A idx i vl,
 rd_init_range A -> 0<=idx -> 0<=i -> idx+vl<=Zlength A ->
 -2147483648<=rd_out_lane A idx i vl<=2147483647.
Proof. intros;unfold rd_out_lane;destruct(Z.ltb_spec i vl);[apply H;lia|lia]. Qed.
Lemma rd_partial_unwritten_lane : forall M base rows channels stride Init k i,
 0<=k<=i -> i<channels -> Zlength Init=channels ->
 Znth i(rd_partial M base rows channels stride k Init)0=Znth i Init 0.
Proof. intros;unfold rd_partial;change(Znth i(rd_mix Init(rd_results M base rows channels stride Init)k)0=Znth i Init 0);apply rd_mix_suffix;try lia;rewrite rd_results_length by lia;lia. Qed.
Lemma rd_partial_out_lane_range : forall M base rows channels stride Init k i vl,
 rd_init_range Init -> Zlength Init=channels -> 0<=k -> 0<=i -> k+vl<=channels ->
 -2147483648<=rd_out_lane(rd_partial M base rows channels stride k Init)k i vl<=2147483647.
Proof. intros;unfold rd_out_lane;destruct(Z.ltb_spec i vl);[rewrite rd_partial_unwritten_lane by lia;apply H;lia|lia]. Qed.
Print Assumptions rd_read_lane_range.
Print Assumptions rd_active_wadd16_range.
Print Assumptions rd_active_wadd32_range.
Print Assumptions rd_out_lane_range.
Print Assumptions rd_partial_unwritten_lane.
Print Assumptions rd_partial_out_lane_range.
