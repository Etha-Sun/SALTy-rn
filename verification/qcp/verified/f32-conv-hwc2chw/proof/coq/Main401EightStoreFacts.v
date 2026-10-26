From Coq Require Import ZArith List Lia.
From HwcConv Require Export HwcTileFacts Main401StoreValuesFacts4.
Local Open Scope Z_scope.
Local Opaque hc_progress hc_visible hc_output_put hc_rvv_raw hc_vget.
Lemma hm401_eight_stores_progress : forall Raw O output hs cs channels start finish ow y c x n
 (A00 A01 A02 A03 A10 A11 A12 A13:Recordvfloat32m1_t),
 0<=start->start<=y<finish->0<=c<channels->c mod 4=0->
 0<=x->0<=n->x+n<=ow->0<ow->4*ow<=hs->finish*hs<=cs->
(forall i,0<=i<n->hc_vget A00 i=Raw c 0(y+0)(x+i))->
(forall i,0<=i<n->hc_vget A01 i=Raw c 1(y+0)(x+i))->
(forall i,0<=i<n->hc_vget A02 i=Raw c 2(y+0)(x+i))->
(forall i,0<=i<n->hc_vget A03 i=Raw c 3(y+0)(x+i))->
(forall i,0<=i<n->hc_vget A10 i=Raw c 0(y+1)(x+i))->
(forall i,0<=i<n->hc_vget A11 i=Raw c 1(y+1)(x+i))->
(forall i,0<=i<n->hc_vget A12 i=Raw c 2(y+1)(x+i))->
(forall i,0<=i<n->hc_vget A13 i=Raw c 3(y+1)(x+i))->
hc_store_rvv(hc_store_rvv(hc_store_rvv(hc_store_rvv(hc_store_rvv(hc_store_rvv(hc_store_rvv(hc_store_rvv(hc_progress(hc_visible Raw channels)O output hs cs channels start finish ow y c x)(hc_output_address output hs cs(hc_store_channel channels c 0)(hc_store_row finish y 1)x)A10 n)(hc_output_address output hs cs(hc_store_channel channels c 1)(hc_store_row finish y 1)x)A11 n)(hc_output_address output hs cs(hc_store_channel channels c 2)(hc_store_row finish y 1)x)A12 n)(hc_output_address output hs cs(hc_store_channel channels c 3)(hc_store_row finish y 1)x)A13 n)(hc_output_address output hs cs(hc_store_channel channels c 0)(hc_store_row finish y 0)x)A00 n)(hc_output_address output hs cs(hc_store_channel channels c 1)(hc_store_row finish y 0)x)A01 n)(hc_output_address output hs cs(hc_store_channel channels c 2)(hc_store_row finish y 0)x)A02 n)(hc_output_address output hs cs(hc_store_channel channels c 3)(hc_store_row finish y 0)x)A03 n=hc_progress(hc_visible Raw channels)O output hs cs channels start finish ow y c(x+n).
Proof.
 intros Raw O output hs cs channels start finish ow y c x n A00 A01 A02 A03 A10 A11 A12 A13 HS HY HC HM HX HN HXN HOW HHS HCS H00 H01 H02 H03 H10 H11 H12 H13.
 rewrite(hm401_store_rvv_tile_values Raw _ _ A10 c y x n 1 0 HN H10).
 rewrite(hm401_store_rvv_tile_values Raw _ _ A11 c y x n 1 1 HN H11).
 rewrite(hm401_store_rvv_tile_values Raw _ _ A12 c y x n 1 2 HN H12).
 rewrite(hm401_store_rvv_tile_values Raw _ _ A13 c y x n 1 3 HN H13).
 rewrite(hm401_store_rvv_tile_values Raw _ _ A00 c y x n 0 0 HN H00).
 rewrite(hm401_store_rvv_tile_values Raw _ _ A01 c y x n 0 1 HN H01).
 rewrite(hm401_store_rvv_tile_values Raw _ _ A02 c y x n 0 2 HN H02).
 rewrite(hm401_store_rvv_tile_values Raw _ _ A03 c y x n 0 3 HN H03).
 change(hc_write_tile(hc_progress(hc_visible Raw channels)O output hs cs channels start finish ow y c x)output hs cs channels finish y c x(hc_tile_values Raw c y x n 0)(hc_tile_values Raw c y x n 1)=hc_progress(hc_visible Raw channels)O output hs cs channels start finish ow y c(x+n)).
 apply hc_tile_progress_step;assumption.
Qed.
Print Assumptions hm401_eight_stores_progress.
