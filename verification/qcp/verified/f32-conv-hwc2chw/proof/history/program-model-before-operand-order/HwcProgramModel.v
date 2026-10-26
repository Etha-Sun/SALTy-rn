From Coq Require Import ZArith List Bool Lia.
From HwcConv Require Export HwcArithmeticFacts MemoryModel OutputMemory.
Import ListNotations. Local Open Scope Z_scope.
Definition hc_u64_limit:Z:=18446744073709551616.
Definition hc_footprint(base count:Z):Prop:=0<base /\ 0<=count /\ base+4*count<=hc_u64_limit.
Definition hc_row_base(input zero H W row:Z):Z:=
 if orb(row<?0)(H<=?row)then zero else input+12*row*W.
Definition hc_image(F:HwcROMap)(input zero H W row col ci:Z):fp32:=
 if col<?0 then fp32_zero else
 hc_get F(hc_row_base input zero H W row+4*(3*col+ci)).
Definition hc_tap(F:HwcROMap)(input zero weights H W top y x block lane dx ci ky:Z):HwcTap:=
 let col:=2*x+dx-1 in
 if W<=?col then None else
 Some(hc_image F input zero H W(2*y-top+ky)col ci,
 hc_get F(weights+4*(112*block+4+(dx*9+ci*3+ky)*4+lane))).
Definition hc_terms(F:HwcROMap)(input zero weights H W top y x block lane:Z):list HwcTap:=
 flat_map(fun dx=>flat_map(fun ci=>map(fun ky=>
 hc_tap F input zero weights H W top y x block lane(Z.of_nat dx)(Z.of_nat ci)(Z.of_nat ky))(seq 0 3))(seq 0 3))(seq 0 3).
Definition hc_neon_pixel(F:HwcROMap)(input zero weights H W top y x block lane:Z)(lo hi:fp32):fp32:=
 hwc_neon_pixel(hc_terms F input zero weights H W top y x block lane)
 (hc_get F(weights+4*(112*block+lane)))lo hi.
Definition hc_rvv_pixel(F:HwcROMap)(input zero weights H W top y x block lane:Z)(lo hi:fp32):fp32:=
 hwc_repaired_rvv_pixel(hc_terms F input zero weights H W top y x block lane)
 (hc_get F(weights+4*(112*block+lane)))lo hi.
(* Original physical lane0..3 stores overwrite the final actual output channel
   with padded lane3. No repeated-padding-weight premise is imposed. *)
Definition hc_effective_lane(channels c:Z):Z:=
 if andb(Z.eqb c(channels-1))(negb(Z.eqb(channels mod 4)0))then 3 else c mod 4.
Definition hc_neon_result(F:HwcROMap)(input zero weights H W top channels c y x:Z)(lo hi:fp32):fp32:=
 hc_neon_pixel F input zero weights H W top y x(c/4)(hc_effective_lane channels c)lo hi.
Definition hc_rvv_result(F:HwcROMap)(input zero weights H W top channels c y x:Z)(lo hi:fp32):fp32:=
 hc_rvv_pixel F input zero weights H W top y x(c/4)(hc_effective_lane channels c)lo hi.
Definition hc_output_address(output hs cs c y x:Z):Z:=output+c*cs+y*hs+4*x.
(* Center row must be present; excluded geometry is not a nonempty operator
   output domain. Footprints, not an INT32 cap, bound uint64 dimensions. *)
Definition hc_input_domain(F:HwcROMap)(input zero weights params H W top start finish channels:Z):Prop:=
 0<H /\ 0<W /\ 0<channels /\ 0<=top<=1 /\ 0<=start<finish /\
 2*(finish-1)+1-top<H /\
 hc_footprint input(3*H*W+3) /\ hc_footprint zero(3*W+3) /\
 hc_footprint weights(112*((channels+3)/4)) /\ hc_footprint params 2 /\
 hc_window F input(3*H*W+3) /\ hc_window F zero(3*W+3) /\
 hc_window F weights(112*((channels+3)/4)) /\ hc_window F params 2.
Definition hc_output_layout(output hs cs H W channels finish:Z):Prop:=
 let ow:=(W+1)/2 in
 0<output /\ 4*ow<=hs /\ finish*hs<=cs /\
 output+(channels-1)*cs+(finish-1)*hs+4*ow<=hc_u64_limit.
Lemma hc_pixel_related:forall F input zero weights H W top y x block lane lo hi,
 dw_rel(hc_neon_pixel F input zero weights H W top y x block lane lo hi)
       (hc_rvv_pixel F input zero weights H W top y x block lane lo hi).
Proof. intros;apply hwc_pixel_related. Qed.
Lemma hc_result_observation:forall F input zero weights H W top channels c y x lo hi,
 dw_observe(hc_neon_result F input zero weights H W top channels c y x lo hi)
           (hc_rvv_result F input zero weights H W top channels c y x lo hi).
Proof. intros;apply hwc_pixel_observation. Qed.
Lemma hc_terms_length:forall F input zero weights H W top y x block lane,
 length(hc_terms F input zero weights H W top y x block lane)=27%nat.
Proof. reflexivity. Qed.
Print Assumptions hc_pixel_related.
Print Assumptions hc_result_observation.
Print Assumptions hc_terms_length.
