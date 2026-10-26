From HwcConv Require Export Main443BoundarySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Fixpoint hmb_advance(k:nat)(p stride:Z):Z:=match k with
 |O=>unsigned_last_nbits p 64
 |S j=>unsigned_last_nbits(hmb_advance j p stride+stride)64 end.
Lemma hmb_advance_norm:forall k p stride,
 hmb_advance k p stride=hc_addr64(p+Z.of_nat k*stride).
Proof. induction k;intros;cbn[hmb_advance].
 - rewrite hmi_cast64;f_equal;ring.
 - rewrite IHk,hmi_cast64,hmi_addr_add_l.
   apply(f_equal hc_addr64);rewrite Nat2Z.inj_succ;ring.
Qed.
Lemma hmb_next_outputs:forall output hs y finish q,
 q=hc_addr64(output+hs*hc_store_row finish y 1)->
 hc_pending_outputs output hs(y+2)finish(hmb_advance 1 q hs)(hmb_advance 2 q hs).
Proof.
 intros output hs y finish q HQ;unfold hc_pending_outputs;intro HY.
 rewrite HQ;unfold hc_store_row;rewrite Z.min_l by lia.
 rewrite !hmb_advance_norm;cbn[Z.of_nat];hmb_mod_nf.
 split;apply(f_equal hc_addr64);ring.
Qed.
Lemma hmb_next_rows:forall F input zero weights params H N top start finish C y i0 i1 i2 i3 i4,
 hc_input_domain F input zero weights params H N top start finish C->
 start<=y<finish->hc_outer_input input zero H N top y i0 i1 i2 i3 i4->
 hc_rows_pending input zero H N top(y+2)finish i4
 (hmb_advance 1 i4(12*N))(hmb_advance 2 i4(12*N))
 (hmb_advance 3 i4(12*N))(hmb_advance 4 i4(12*N)).
Proof.
 intros F input zero weights params H N top start finish C y i0 i1 i2 i3 i4 HD HY HO.
 unfold hc_rows_pending;intro HYnext.
 pose proof(hmi_loop_bounds F input zero weights params H N top start finish C(y+2)HD ltac:(lia))as HB.
 assert(HN:0<N)by(unfold hc_input_domain in HD;tauto).
 assert(HF:hc_footprint input(3*H*N+3))by(unfold hc_input_domain in HD;tauto).
 assert(HT:0<=top<=1)by(unfold hc_input_domain in HD;tauto).
 assert(HStart:0<=start)by(unfold hc_input_domain in HD;lia).
 assert(HR:0<=2*y+4-top<H)by lia.
 unfold hc_outer_input in HO;destruct HO as[HO0[HO1[HO2[HO3 HO4]]]].
 assert(HI4:i4=input+12*(2*y-top+4)*N).
 { rewrite HO4;apply hmb_valid_row;lia. }
 unfold hc_pending_row;repeat split;intros;try lia.
 all:rewrite ?hmb_advance_norm;cbn[Z.of_nat];rewrite HI4.
 all:first[solve[rewrite hmb_valid_row by lia;ring]|solve[hmb_valid_read_solve]].
Qed.
Ltac hmb_outer_context:=multimatch goal with
 | HD:hc_input_domain ?F ?input ?zero ?weights ?params ?H ?N ?top ?start ?finish ?C,
 HY:Z.le ?start ?y,HE:Z.lt ?y ?finish|-_=>
 let HB:=fresh "Hloop"in pose proof(hmi_loop_bounds F input zero weights params H N top start finish C y HD ltac:(lia))as HB;
 repeat match type of HB with _ /\ _=>let HA:=fresh "Hloop"in destruct HB as[HA HB]end;
 hmi_word_context;hmi_word_goal end.
Ltac hmb_outer_pending:=first[
 solve[eapply hmb_next_outputs;eassumption]|
 solve[eapply hmb_next_rows;[eassumption|lia|eassumption]]].
