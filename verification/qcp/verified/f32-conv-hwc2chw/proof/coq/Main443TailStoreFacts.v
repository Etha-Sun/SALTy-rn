From HwcConv Require Import Main443TileStoreFacts NeonViewsModel HwcProgressModel.
From Coq Require Import ZArith List Lia.
Import ListNotations. Local Open Scope Z_scope.
Lemma hcm_tile_one_values:forall Raw c y x dy lane,
 hc_tile_values Raw c y x 1 dy lane=[Raw c lane(y+dy)x].
Proof. intros;unfold hc_tile_values;change(Z.to_nat 1)with 1%nat;cbn[seq map Z.of_nat];rewrite Z.add_0_r;reflexivity. Qed.
Lemma hcm_lane_tile_one:forall Raw O output hs cs channels finish y c x A B,
 (forall lane,0<=lane<4->hc_fget A lane=Raw c lane y x)->
 (forall lane,0<=lane<4->hc_fget B lane=Raw c lane(y+1)x)->
 let p:=fun lane dy=>hc_output_address output hs cs(hc_store_channel channels c lane)(hc_store_row finish y dy)x in
hc_neon_store_lane(hc_neon_store_lane(hc_neon_store_lane(hc_neon_store_lane(hc_neon_store_lane(hc_neon_store_lane(hc_neon_store_lane(hc_neon_store_lane(O)(p 0 1)B 0)(p 1 1)B 1)(p 2 1)B 2)(p 3 1)B 3)(p 0 0)A 0)(p 1 0)A 1)(p 2 0)A 2)(p 3 0)A 3=hc_write_tile O output hs cs channels finish y c x(hc_tile_values Raw c y x 1 0)(hc_tile_values Raw c y x 1 1).
Proof.
 intros Raw O output hs cs channels finish y c x A B HA HB p.
 unfold hc_neon_store_lane,hc_write_tile;repeat rewrite hcm_tile_one_values;rewrite Z.add_0_r.
 cbn[hc_write_values].
 rewrite(HA 0 ltac:(lia)).
 rewrite(HA 1 ltac:(lia)).
 rewrite(HA 2 ltac:(lia)).
 rewrite(HA 3 ltac:(lia)).
 rewrite(HB 0 ltac:(lia)).
 rewrite(HB 1 ltac:(lia)).
 rewrite(HB 2 ltac:(lia)).
 rewrite(HB 3 ltac:(lia)).
 reflexivity.
Qed.
Print Assumptions hcm_tile_one_values.
Print Assumptions hcm_lane_tile_one.
