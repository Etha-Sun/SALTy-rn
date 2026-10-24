From Coq Require Import ZArith Lia.
From Dwconv Require Export ProgramChunkFacts.
Local Open Scope Z_scope.

Lemma dw_packed_weight_lane : forall F D k lane tap,
 k mod 4=0 -> 0<=lane<4 ->
 dw_weight F D (k+lane) tap=
 dw_get F(dw_weights D+16*k+16*(tap+1)+4*lane).
Proof.
 intros F D k lane tap Hk Hlane.
 pose proof(Z.div_mod k 4 ltac:(lia))as Hdiv.
 assert(Hmod:(k+lane) mod 4=lane).
 { replace(k+lane)with(lane+(k/4)*4)by lia.
   rewrite Z.mod_add by lia;apply Z.mod_small;exact Hlane. }
 assert(Hquot:(k+lane)/4=k/4).
 { replace(k+lane)with((k/4)*4+lane)by lia.
   rewrite Z.div_add_l by lia;rewrite(Z.div_small lane 4 Hlane);lia. }
 unfold dw_weight;rewrite Hmod,Hquot;f_equal;lia.
Qed.

Lemma dw_input_chunk_lane : forall F P D pixel k lane tap,
 dw_load_lane F(dw_input_row P D pixel tap+4*k)lane=
 dw_input_value F P D pixel(k+lane)tap.
Proof. intros;unfold dw_input_value,dw_load_lane;f_equal;ring. Qed.

Lemma dw_take_exact_vl : forall c vl,
 0<c -> dw_vl_allowed(dw_take c)vl -> vl=dw_take c.
Proof.
 intros c vl Hc Hvl;apply dw_vl_small;[pose proof(dw_take_positive c Hc);lia|exact Hvl].
Qed.

Lemma dw_rvv_weight_windows : forall F P W D k c,
 dw_valid F P W D -> 0<c<=dw_channels D ->
 k=dw_channels D-c -> k mod 4=0 ->
 forall tap,0<=tap<4 ->
 dw_window F(dw_weights D+16*k+16*tap)(dw_take c).
Proof.
 intros F P W D k c Hv Hc Hk Halign tap Htap.
 destruct Hv as[HC[HP[HW Hpixels]]].
 pose proof(dw_take_positive c ltac:(lia))as Htake.
 pose proof(dw_packed_block_room (dw_channels D) k ltac:(lia) ltac:(lia) Halign)as Hroom.
 replace(dw_weights D+16*k+16*tap)with(dw_weights D+4*(4*k+4*tap))by ring.
 eapply dw_window_shift;[exact HW|lia|lia|lia].
Qed.

Lemma dw_rvv_input_windows : forall F P W D pixel k c,
 dw_valid F P W D -> 0<=pixel<dw_width D -> 0<c<=dw_channels D ->
 k=dw_channels D-c -> forall tap,0<=tap<3 ->
 dw_window F(dw_input_row P D pixel tap+4*k)(dw_take c).
Proof.
 intros F P W D pixel k c Hv Hp Hc Hk tap Htap.
 pose proof(dw_take_positive c ltac:(lia))as Htake.
 eapply dw_window_shift;[exact(proj2(dw_valid_row F P W D pixel tap Hv Hp Htap))|lia|lia|lia].
Qed.

Lemma dw_rvv_output_window : forall F P W D pixel k c,
 dw_valid F P W D -> 0<=pixel<dw_width D -> 0<c<=dw_channels D ->
 k=dw_channels D-c ->
 dw_write_window W(dw_output_at D pixel+4*k)(dw_take c).
Proof.
 intros F P W D pixel k c Hv Hp Hc Hk.
 pose proof(dw_take_positive c ltac:(lia))as Htake.
 eapply dw_write_window_shift;[exact(dw_valid_output F P W D pixel Hv Hp)|lia|lia|lia].
Qed.
Print Assumptions dw_packed_weight_lane.
Print Assumptions dw_input_chunk_lane.
Print Assumptions dw_take_exact_vl.
Print Assumptions dw_rvv_weight_windows.
Print Assumptions dw_rvv_input_windows.
Print Assumptions dw_rvv_output_window.
