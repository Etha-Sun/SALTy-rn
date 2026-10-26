From HwcConv Require Export neon_pixel_unit_goal NeonPixelBounds StoreHalfFacts FastFrame AddressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_get hc_present hc_neon_rows_acc hc_neon_rows_fold hc_neon_row_group.
Ltac hc_pixel_norm:=
 try change(sizeof(FLOAT))with 4 in *;
 try change(INT_MAX)with 2147483647 in *;try change(INT_MIN)with(-2147483648)in *;
 try change(UINT64_MAX)with 18446744073709551615 in *;
 rewrite ?hc_store_f4_eta in *;
 unfold hc_footprint,hc_u64_limit in *;
 repeat match goal with H:_ /\ _|-_=>destruct H end;
 try match goal with H: ?x < (?n+1)÷2|-_ =>
  let B:=fresh "Bx" in assert(B:0<=2*x<n)by(eapply hc_neon_x_bound;eauto) end;
 repeat progress(rewrite unsigned_last_nbits_eq in * by (try lia;try reflexivity)).
Ltac hc_pixel_window:=
 first[
  match goal with|-hc_window ?F (?p+?i*4) ?r=>
   replace(p+i*4)with(p+4*i)by ring;eapply hc_window_slice;[eassumption|lia|lia|lia]end
 |match goal with|-hc_window ?F (?p+?off) ?r=>
   let k:=eval vm_compute in(off/4)in
   lazymatch k with Z0=>idtac|Zpos _=>idtac|Zneg _=>idtac end;
   replace(p+off)with(p+4*k)by ring;eapply hc_window_slice;[eassumption|lia|lia|lia]end
 |eapply hc_window_shrink;[eassumption|lia]
 |match goal with|-hc_present ?F (?p+?i*4)=>
   replace(p+i*4)with(p+4*i)by ring;eapply hc_window_lane;[eassumption|lia]end
 |eassumption].
Ltac hc_pixel_prepare:=intros;hc_pixel_norm;
 try match goal with|-context[hc_window ?F ?p ?r]=>
 let B:=fresh "Hwindow"in assert(B:hc_window F p r)by hc_pixel_window end;
 try match goal with|-context[hc_present ?F ?p]=>
 let B:=fresh "Hpresent"in assert(B:hc_present F p)by hc_pixel_window end.
Ltac hc_pixel_frame:=unfold StructPredfloat32x4_t,UndefStructPredfloat32x4_t in *;
 cbn[float32x4_t_s0 float32x4_t_s1 float32x4_t_s2 float32x4_t_s3];
 rewrite ?hc_local_field_address;entailer!;try lia.
