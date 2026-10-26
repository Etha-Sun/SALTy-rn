From HwcConv Require Import HwcProgressModel NeonViewsModel.
From Coq Require Import ZArith List Lia Logic.FunctionalExtensionality.
Import ListNotations. Local Open Scope Z_scope.
Lemma hcm_low_zip1 : forall O p Z A B, hc_neon_zip1 Z A B ->
 hc_store_low2 O p Z=hc_write_values O p [hc_fget A 0;hc_fget B 0].
Proof. intros O p Z A B HZ;unfold hc_neon_zip1 in HZ;subst Z;reflexivity. Qed.
Lemma hcm_high_zip1 : forall O p Z A B, hc_neon_zip1 Z A B ->
 hc_store_high2 O p Z=hc_write_values O p [hc_fget A 1;hc_fget B 1].
Proof. intros O p Z A B HZ;unfold hc_neon_zip1 in HZ;subst Z;reflexivity. Qed.
Lemma hcm_low_zip2 : forall O p Z A B, hc_neon_zip2 Z A B ->
 hc_store_low2 O p Z=hc_write_values O p [hc_fget A 2;hc_fget B 2].
Proof. intros O p Z A B HZ;unfold hc_neon_zip2 in HZ;subst Z;reflexivity. Qed.
Lemma hcm_high_zip2 : forall O p Z A B, hc_neon_zip2 Z A B ->
 hc_store_high2 O p Z=hc_write_values O p [hc_fget A 3;hc_fget B 3].
Proof. intros O p Z A B HZ;unfold hc_neon_zip2 in HZ;subst Z;reflexivity. Qed.
Lemma hcm_tile_two_values : forall Raw c y x dy lane,
 hc_tile_values Raw c y x 2 dy lane=[Raw c lane(y+dy)x;Raw c lane(y+dy)(x+1)].
Proof. intros;unfold hc_tile_values;change(Z.to_nat 2)with 2%nat;cbn[seq map Z.of_nat];try rewrite Z.add_0_r;reflexivity. Qed.
Lemma hcm_zip_tile_two : forall Raw O output hs cs channels finish y c x A B C D Z0 Z1 Z2 Z3,
 (forall lane,0<=lane<4->hc_fget A lane=Raw c lane y x)->
 (forall lane,0<=lane<4->hc_fget B lane=Raw c lane y(x+1))->
 (forall lane,0<=lane<4->hc_fget C lane=Raw c lane(y+1)x)->
 (forall lane,0<=lane<4->hc_fget D lane=Raw c lane(y+1)(x+1))->
 hc_neon_zip1 Z0 A B->hc_neon_zip2 Z1 A B->
 hc_neon_zip1 Z2 C D->hc_neon_zip2 Z3 C D->
 let p:=fun lane dy=>hc_output_address output hs cs(hc_store_channel channels c lane)(hc_store_row finish y dy)x in
hc_store_high2(hc_store_low2(hc_store_high2(hc_store_low2(hc_store_high2(hc_store_low2(hc_store_high2(hc_store_low2(O)(p 0 1)Z2)(p 1 1)Z2)(p 2 1)Z3)(p 3 1)Z3)(p 0 0)Z0)(p 1 0)Z0)(p 2 0)Z1)(p 3 0)Z1=hc_write_tile O output hs cs channels finish y c x(hc_tile_values Raw c y x 2 0)(hc_tile_values Raw c y x 2 1).
Proof.
 intros Raw O output hs cs channels finish y c x A B C D Z0 Z1 Z2 Z3 HA HB HC HD HZ0 HZ1 HZ2 HZ3 p.
 rewrite(hcm_high_zip2 _ (p 3 0) Z1 A B)by assumption.
 rewrite(hcm_low_zip2 _ (p 2 0) Z1 A B)by assumption.
 rewrite(hcm_high_zip1 _ (p 1 0) Z0 A B)by assumption.
 rewrite(hcm_low_zip1 _ (p 0 0) Z0 A B)by assumption.
 rewrite(hcm_high_zip2 _ (p 3 1) Z3 C D)by assumption.
 rewrite(hcm_low_zip2 _ (p 2 1) Z3 C D)by assumption.
 rewrite(hcm_high_zip1 _ (p 1 1) Z2 C D)by assumption.
 rewrite(hcm_low_zip1 _ (p 0 1) Z2 C D)by assumption.
 unfold hc_write_tile;repeat rewrite hcm_tile_two_values;rewrite Z.add_0_r.
 rewrite(HA 0 ltac:(lia)).
 rewrite(HA 1 ltac:(lia)).
 rewrite(HA 2 ltac:(lia)).
 rewrite(HA 3 ltac:(lia)).
 rewrite(HB 0 ltac:(lia)).
 rewrite(HB 1 ltac:(lia)).
 rewrite(HB 2 ltac:(lia)).
 rewrite(HB 3 ltac:(lia)).
 rewrite(HC 0 ltac:(lia)).
 rewrite(HC 1 ltac:(lia)).
 rewrite(HC 2 ltac:(lia)).
 rewrite(HC 3 ltac:(lia)).
 rewrite(HD 0 ltac:(lia)).
 rewrite(HD 1 ltac:(lia)).
 rewrite(HD 2 ltac:(lia)).
 rewrite(HD 3 ltac:(lia)).
 reflexivity.
Qed.
Print Assumptions hcm_low_zip1.
Print Assumptions hcm_high_zip1.
Print Assumptions hcm_low_zip2.
Print Assumptions hcm_high_zip2.
Print Assumptions hcm_tile_two_values.
Print Assumptions hcm_zip_tile_two.
