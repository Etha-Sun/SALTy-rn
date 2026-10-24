From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmSpec Require Import FmaModel IntrinsicModel.
From Qd8Phase Require Import IntegerFold.
From QC4W Require Import NibbleModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Record qc4_panel := { qc4_sums:list Z; qc4_weights:list Z;
 qc4_scales:list fp32; qc4_biases:list fp32 }.
Definition qc4_empty_panel := {| qc4_sums:=[];qc4_weights:=[];qc4_scales:=[];qc4_biases:=[] |}.
Definition qc4_panels N:=(N+15)/16.
Definition qc4_a_extent K:=8*((rounded_depth K+7)/8).
Definition qc4_panel_wf K p:=Zlength(qc4_sums p)=16 /\
 Zlength(qc4_weights p)=8*rounded_depth K /\ Zlength(qc4_scales p)=16 /\ Zlength(qc4_biases p)=16.
Definition qc4_block w K p : Assertion :=
 IntArray.full w 16 (qc4_sums p) **
 CharArray.full (w+64) (8*rounded_depth K) (qc4_weights p) **
 FloatArray.full (w+64+8*rounded_depth K) 16 (qc4_scales p) **
 FloatArray.full (w+128+8*rounded_depth K) 16 (qc4_biases p).
Fixpoint qc4_packed K w ps : Assertion := match ps with
 []=>emp |p::rest=>qc4_block w K p ** qc4_packed K (w+panel_bytes K) rest end.
Definition qc4_weight depth lane ws:=
 let byte:=Znth (16*(depth/2)+lane) ws 0 in
 if Z.eqb (depth mod 2) 0 then low_bitop byte else high_bitop byte.
Fixpoint qc4_acc_nat (depth:nat) ks zp lane (av ws:list Z) := match depth with
 O=>wrap32(ks*zp) |S d=>mac32 (qc4_acc_nat d ks zp lane av ws)
 (Znth (Z.of_nat d) av 0) (qc4_weight (Z.of_nat d) lane ws) end.
Definition qc4_acc depth ks zp lane av ws:=qc4_acc_nat (Z.to_nat depth) ks zp lane av ws.
Definition qc4_raw K lane zp A p inv:=
 fma_rne (fp32_mul (fp32_of_Z (shifted_accumulator
  (qc4_acc (rounded_depth K) (Znth lane (qc4_sums p) 0) zp lane A (qc4_weights p)))) inv)
  (Znth lane (qc4_scales p) fp32_zero) (Znth lane (qc4_biases p) fp32_zero).
Definition qc4_clamp x lo hi:=fp32_neon_min (fp32_neon_max x lo) hi.
Definition qc4_output K col zp A ps inv lo hi:=
 qc4_clamp (qc4_raw K (col mod 16) zp A (Znth (col/16) ps qc4_empty_panel) inv) lo hi.
Definition qc4_values K count zp A ps inv lo hi:=
 map (fun i=>qc4_output K (Z.of_nat i) zp A ps inv lo hi) (seq 0 (Z.to_nat count)).
Theorem qc4_acc_step : forall depth ks zp lane av ws,0<=depth ->
 qc4_acc (depth+1) ks zp lane av ws=
 mac32 (qc4_acc depth ks zp lane av ws) (Znth depth av 0) (qc4_weight depth lane ws).
Proof.
 intros;unfold qc4_acc;rewrite Z2Nat.inj_add by lia;rewrite Nat.add_1_r;cbn.
 rewrite Z2Nat.id by lia;reflexivity.
Qed.
Theorem qc4_acc_pair_step : forall depth ks zp lane av ws,0<=depth ->
 qc4_acc (depth+2) ks zp lane av ws=
 mac32 (mac32 (qc4_acc depth ks zp lane av ws) (Znth depth av 0) (qc4_weight depth lane ws))
 (Znth (depth+1) av 0) (qc4_weight (depth+1) lane ws).
Proof.
 intros;replace (depth+2) with ((depth+1)+1) by lia.
 rewrite qc4_acc_step,qc4_acc_step by lia;reflexivity.
Qed.
Theorem qc4_acc_range : forall depth ks zp lane av ws,
 0<=qc4_acc depth ks zp lane av ws<4294967296.
Proof.
 intros;unfold qc4_acc;destruct (Z.to_nat depth);cbn.
 - apply wrap32_range.
 - apply wrap32_range.
Qed.
Theorem qc4_selected_weight_in_bounds : forall K depth lane,
 0<K -> 0<=depth<rounded_depth K -> 0<=lane<16 ->
 0<=16*(depth/2)+lane<8*rounded_depth K.
Proof.
 intros;pose proof (packed_weight_index_in_panel K depth lane H H0 H1).
 unfold packed_weight_offset,panel_bytes in *;lia.
Qed.
Theorem qc4_extract_weight : forall w K p depth lane,
 0<K -> 0<=depth<rounded_depth K -> 0<=lane<16 ->
 qc4_block w K p |--
 IntArray.full w 16 (qc4_sums p) **
 CharArray.missing_i (w+64) (16*(depth/2)+lane) 0 (8*rounded_depth K) (qc4_weights p) **
 store_char (w+64+16*(depth/2)+lane) (Znth (16*(depth/2)+lane) (qc4_weights p) 0) **
 FloatArray.full (w+64+8*rounded_depth K) 16 (qc4_scales p) **
 FloatArray.full (w+128+8*rounded_depth K) 16 (qc4_biases p).
Proof.
 intros;unfold qc4_block.
 pose proof (qc4_selected_weight_in_bounds K depth lane H H0 H1) as Hb.
 sep_apply (CharArray.full_split_to_missing_i (w+64) (16*(depth/2)+lane) (8*rounded_depth K) (qc4_weights p) 0);[|exact Hb].
 unfold StoreCharAsElement.storeA;rewrite sizeof_char.
 replace (w+64+(16*(depth/2)+lane)*1) with (w+64+16*(depth/2)+lane) by ring.
 entailer!.
Qed.
Print Assumptions qc4_acc_step.
Print Assumptions qc4_acc_pair_step.
Print Assumptions qc4_acc_range.
Print Assumptions qc4_extract_weight.
