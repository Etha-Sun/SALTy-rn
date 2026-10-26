From HwcConv Require Export HwcRvv336MaskBounds.
Import Snaive_C_Rules64. Local Open Scope Z_scope.
Lemma hr_count_casts:forall p width x,
 hc_footprint p(3*width+3)->0<width->0<=x<(width+1)/2->
 unsigned_last_nbits(width+1)64=width+1 /\
 unsigned_last_nbits((width+1)/2-x)64=(width+1)/2-x /\
 0<(width+1)/2-x.
Proof.
 intros p width x HF HW HX;unfold hc_footprint,hc_u64_limit in HF.
 assert(HQ:(width+1)/2<=width+1)by(apply Z.div_le_upper_bound;lia).
 split.
 - apply unsigned_last_nbits_eq;change(2^64)with 18446744073709551616;lia.
 - split;[apply unsigned_last_nbits_eq;change(2^64)with 18446744073709551616;lia|lia].
Qed.
Lemma hr_end32_cast:forall vl,0<vl<=4->unsigned_last_nbits(vl-1)32=vl-1.
Proof. intros;apply unsigned_last_nbits_eq;change(2^32)with 4294967296;lia. Qed.
Print Assumptions hr_count_casts.
Print Assumptions hr_end32_cast.
