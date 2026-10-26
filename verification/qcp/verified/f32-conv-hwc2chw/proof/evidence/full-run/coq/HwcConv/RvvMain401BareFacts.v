From HwcConv Require Export RvvMain401ModFacts RvvMain401WindowFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hr401_clipped_no_wrap:forall output hs cs H N C start finish y ch lane dy x,
 hc_output_layout output hs cs H N C finish->0<N->0<=start->start<=y<finish->
 0<=ch<C->0<=lane<4->0<=dy<=1->0<=x<(N+1)/2->
 hc_addr64(hc_output_address output hs cs(hc_store_channel C ch lane)(hc_store_row finish y dy)x)=
 hc_output_address output hs cs(hc_store_channel C ch lane)(hc_store_row finish y dy)x.
Proof.
 intros output hs cs H N C start finish y ch lane dy x HL HN HS HY HC Hlane Hdy HX.
 unfold hc_output_layout in HL;destruct HL as[HO[HHS[HCS Hlim]]].
 assert(HOW:0<(N+1)/2)by(apply Z.div_str_pos;lia).
 pose proof(hcm_store_channel_bounds C ch lane HC Hlane)as HSC.
 pose proof(hcm_store_row_bounds start finish y dy HS HY Hdy)as HSR.
 assert(HR:0<hc_output_address output hs cs(hc_store_channel C ch lane)(hc_store_row finish y dy)x<hc_u64_limit).
 { apply(hcm_output_address_range output hs cs C finish((N+1)/2)(hc_store_channel C ch lane)(hc_store_row finish y dy)x);try assumption;lia. }
 unfold hc_addr64;apply Z.mod_small;unfold hc_u64_limit in HR;lia.
Qed.
Lemma hr401_weight_block_resource:forall F input zero weights params H N top start finish C c,
 hc_input_domain F input zero weights params H N top start finish C->0<c<=C->
 hc_footprint(weights+448*((C-c)/4))112 /\ hc_window F(weights+448*((C-c)/4))112.
Proof.
 intros F input zero weights params H N top start finish C c HD HC.
 assert(HF:hc_footprint weights(112*((C+3)/4)))by(unfold hc_input_domain in HD;tauto).
 assert(HW:hc_window F weights(112*((C+3)/4)))by(unfold hc_input_domain in HD;tauto).
 pose proof(Z.div_mod(C-c)4 ltac:(lia))as HE.
 pose proof(Z.mod_pos_bound(C-c)4 ltac:(lia))as HM.
 assert(HB:0<=(C-c)/4)by(apply Z.div_pos;lia).
 assert(HQ:(C-c)/4+1<=(C+3)/4)by(apply Z.div_le_lower_bound;lia).
 split.
 - unfold hc_footprint,hc_u64_limit in *;destruct HF as[HP[HCount HMax]];repeat split;nia.
 - replace(weights+448*((C-c)/4))with(weights+4*(112*((C-c)/4)))by ring.
   eapply hmi_window_slice;[exact HW|nia|lia|nia].
Qed.
Lemma hr401_footprint_addr:forall p n,hc_footprint p n->0<n->hc_addr64 p=p.
Proof. intros;unfold hc_footprint,hc_u64_limit in H;unfold hc_addr64;apply Z.mod_small;lia. Qed.
