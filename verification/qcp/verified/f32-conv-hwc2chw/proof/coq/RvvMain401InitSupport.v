From HwcConv Require Export rvv_unit_goal RvvKernelModel RvvRowsFma3Model KernelPointers FastFrame AddressFacts StoreHalfFacts.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_neon_pixel hc_neon_rows_fold hc_neon_row_group dw_arm_fma dw_arm_max dw_arm_min hc_progress hc_visible.
Lemma hmi_pure_intro:forall(P:Assertion)(A:Prop),A->P|--coq_prop A.
Proof. intros P A HA;unfold derivable1,coq_prop;auto. Qed.
Lemma hmi_window_slice:forall F p n k r,hc_window F p n->0<=k->0<=r->k+r<=n->hc_window F(p+4*k)r.
Proof. unfold hc_window;intros F p n k r[Hp[Hn Hwin]]Hk Hr Hkr;repeat split;try lia.
 intros i Hi;replace(p+4*k+4*i)with(p+4*(k+i))by ring;apply Hwin;lia. Qed.
Lemma hmi_row_resource:forall F input zero weights params H N top start finish C row,
 hc_input_domain F input zero weights params H N top start finish C ->
 hc_footprint(hc_row_base input zero H N row)(3*N+3) /\ hc_window F(hc_row_base input zero H N row)(3*N+3).
Proof.
 intros F input zero weights params H N top start finish C row HD.
 unfold hc_input_domain in HD;destruct HD as[HH[HN[HC[HT[HY[Hcenter[HF[HZ[HW[HP[WI[WZ rest]]]]]]]]]]]].
 unfold hc_row_base;destruct(orb(row<?0)(H<=?row))eqn:HB;[tauto|].
 apply Bool.orb_false_iff in HB;destruct HB as[HR0 HRH].
 apply Z.ltb_ge in HR0;apply Z.leb_gt in HRH.
 split.
 - unfold hc_footprint,hc_u64_limit in *;destruct HF as[HIp[HIN HIB]];repeat split;nia.
 - replace(input+12*row*N)with(input+4*(3*row*N))by ring.
   eapply hmi_window_slice;[exact WI|nia|nia|nia].
Qed.
Lemma hmi_pending_exact:forall input zero H N row p,
 row<H->hc_pending_row input zero H N row p->p=hc_row_base input zero H N row.
Proof. intros input zero H N row p HR[HA HZ].
 destruct(Z_lt_dec row 0)as[HN|HN].
 - rewrite HZ by exact HN;unfold hc_row_base.
   assert(HB:(row<?0)=true)by(apply Z.ltb_lt;lia);rewrite HB;reflexivity.
 - apply HA;lia.
Qed.
Lemma hmi_zero_row:forall input zero H N row,
 H<=row->zero=hc_row_base input zero H N row.
Proof. intros;unfold hc_row_base.
 assert(HB:(H<=?row)=true)by(apply Z.leb_le;lia);rewrite HB,Bool.orb_true_r;reflexivity. Qed.
Lemma hmi_loop_bounds:forall F input zero weights params H N top start finish C y,
 hc_input_domain F input zero weights params H N top start finish C->start<=y<finish->
 0<=y /\ 0<=2*y /\ 2*y+4<18446744073709551616 /\
 0<=2*y+2-top /\ 2*y+4-top<18446744073709551616 /\
 2*y+1-top<H /\ H+4<18446744073709551616.
Proof.
 intros F input zero weights params H N top start finish C y HD HY.
 unfold hc_input_domain in HD;destruct HD as[HH[HN[HC[HT[HS[HE[HF rest]]]]]]].
 unfold hc_footprint,hc_u64_limit in HF;destruct HF as[HP[HNn HB]].
 assert(Hlimit:H+4<18446744073709551616)by nia.
 repeat split;nia.
Qed.
Lemma hmi_row_address:forall F input zero weights params H N top start finish C row,
 hc_input_domain F input zero weights params H N top start finish C->
 hc_addr64(hc_row_base input zero H N row)=hc_row_base input zero H N row.
Proof.
 intros;pose proof(hmi_row_resource _ _ _ _ _ _ _ _ _ _ _ row H0)as[HF HW].
 assert(HN:0<N)by(unfold hc_input_domain in H0;tauto).
 unfold hc_addr64;apply Z.mod_small;unfold hc_footprint,hc_u64_limit in HF;lia.
Qed.
Lemma hmi_weight_resource:forall F input zero weights params H N top start finish C,
 hc_input_domain F input zero weights params H N top start finish C->
 hc_footprint weights 112 /\ hc_window F weights 112.
Proof.
 intros F input zero weights params H N top start finish C HD.
 unfold hc_input_domain in HD;destruct HD as[HH[HN[HC[HT[HY[HE[HF[HZ[HW[HP[WI[WZ[WW WP]]]]]]]]]]]]].
 assert(HQ:1<=(C+3)/4)by(apply Z.div_le_lower_bound;lia).
 split.
 - unfold hc_footprint,hc_u64_limit in HW|-*;destruct HW as[Hw[Hcnt HB]];repeat split;nia.
 - replace weights with(weights+4*0)by ring;eapply hmi_window_slice;[exact WW|lia|lia|nia].
Qed.
Ltac hmi_constants:=try change(sizeof(FLOAT))with 4 in *;try change Arch64.ptr_size_Z with 8 in *.
Ltac hmi_zero:=rewrite ?Z.sub_diag,?Z.quot_0_l,?Z.rem_0_l,?Z.mul_0_r,?Z.mul_0_l,?Z.add_0_r,?Z.add_0_l in * by lia.
Ltac hmi_prepare:=intros;hmi_constants;hmi_zero.

Ltac hmi_dispatch:=first[solve[apply hmi_pure_intro;first[assumption|reflexivity|lia]]|
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hmi_dispatch|hmi_dispatch]
 | _=>first[solve[fast_cancel]|apply hmi_pure_intro]end].
Ltac hmi_word_context:=repeat multimatch goal with
 | H:context[unsigned_last_nbits ?v 64]|-_=>let E:=fresh "Hword"in
  assert(E:unsigned_last_nbits v 64=v)by(apply unsigned_last_nbits_eq;change(0<=v<18446744073709551616);lia);
  rewrite E in H;clear E end.
Ltac hmi_context:=
 multimatch goal with
 | HD:hc_input_domain ?F ?input ?zero ?weights ?params ?H ?N ?top ?start ?finish ?C,
 HR:hc_rows_pending ?input ?zero ?H ?N ?top ?y ?finish ?i0 ?i1 ?i2 ?i3 ?i4 |-_=>
 let HB:=fresh "Hloop"in pose proof(hmi_loop_bounds F input zero weights params H N top start finish C y HD ltac:(lia))as HB;
 repeat match type of HB with _ /\ _=>let HA:=fresh "Hloop"in destruct HB as[HA HB]end;
 let HP:=fresh "Hrows"in pose proof(HR ltac:(lia))as HP;
 destruct HP as[? [? [? [? ?]]]];
 let HF:=fresh "Hweight"in pose proof(hmi_weight_resource F input zero weights params H N top start finish C HD)as HF;destruct HF;
 let HF0:=fresh "HF0"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+0)HD)as HF0;destruct HF0;
 let HF1:=fresh "HF1"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+1)HD)as HF1;destruct HF1;
 let HF2:=fresh "HF2"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+2)HD)as HF2;destruct HF2;
 let HF3:=fresh "HF3"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+3)HD)as HF3;destruct HF3;
 let HF4:=fresh "HF4"in pose proof(hmi_row_resource F input zero weights params H N top start finish C(2*y-top+4)HD)as HF4;destruct HF4;
 let HC:=fresh "Hdomain"in pose proof HD as HC;unfold hc_input_domain in HC;
 repeat match type of HC with _ /\ _=>let HH:=fresh "Hdomain"in destruct HC as[HH HC]end
 end;
 repeat progress(rewrite Z.quot_div_nonneg in * by lia);
 hmi_word_context;
 multimatch goal with HO:hc_pending_outputs ?o ?hs ?y ?finish ?p ?q|-_=>
 let HOut:=fresh "Hout"in pose proof(HO ltac:(lia))as HOut;destruct HOut end;
 hmi_zero.
Ltac hmi_row_atoms:=first[assumption|reflexivity|lia|
 solve[eapply hmi_pending_exact;[lia|eassumption]]|
 solve[eapply hmi_zero_row;lia]|
 solve[symmetry;eapply hmi_zero_row;lia]].
Ltac hmi_min:=unfold hc_store_channel,hc_store_row;
 repeat first[rewrite Z.min_l by lia|rewrite Z.min_r by lia];hmi_zero.
Ltac hmi_addr:=repeat multimatch goal with
 | |-context[hc_addr64 ?v]=>let E:=fresh "Haddr"in
  assert(E:hc_addr64 v=v)by(unfold hc_addr64;apply Z.mod_small;lia);rewrite E;clear E end.
Ltac hmi_init_atom:=first[solve[hmi_row_atoms]|solve[
 match goal with
 | HD:hc_input_domain ?F ?input ?zero ?weights ?params ?H ?N ?top ?start ?finish ?C
 |-context[hc_addr64(hc_row_base ?input ?zero ?H ?N ?r)]=>
 rewrite(hmi_row_address F input zero weights params H N top start finish C r HD);hmi_row_atoms end]].
Ltac hmi_init_dispatch:=first[solve[apply hmi_pure_intro;hmi_init_atom]|
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hmi_init_dispatch|hmi_init_dispatch]
 | _=>first[solve[fast_cancel]|apply hmi_pure_intro]end].
Ltac hmi_word_goal:=repeat multimatch goal with
 | |-context[unsigned_last_nbits ?v 64]=>let E:=fresh "Hword"in
  assert(E:unsigned_last_nbits v 64=v)by(apply unsigned_last_nbits_eq;change(0<=v<18446744073709551616);lia);
  rewrite E;clear E end.
Ltac hmi_row_resource_goal:=multimatch goal with
 | HP:hc_pending_row ?input ?zero ?H ?N ?row ?p|-context[?p]=>
 let E:=fresh "Hrowexact"in pose proof(hmi_pending_exact input zero H N row p ltac:(lia)HP)as E;
 rewrite E;eassumption end.
Ltac hmi_weights_addr:=multimatch goal with
 | HF:hc_footprint ?p 112|-?p=hc_addr64 ?p=>
 symmetry;unfold hc_addr64;apply Z.mod_small;
 unfold hc_footprint,hc_u64_limit in HF;lia end.
Ltac hmi_init_atom2:=first[solve[hmi_init_atom]|solve[hmi_row_resource_goal]|solve[hmi_weights_addr]|
 solve[hmi_word_goal;hmi_addr;reflexivity]|
 solve[hmi_min;first[assumption|reflexivity|etransitivity;[eassumption|f_equal;nia]]]].
Ltac hmi_init_dispatch2:=first[solve[apply hmi_pure_intro;hmi_init_atom2]|
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hmi_init_dispatch2|hmi_init_dispatch2]
 | _=>first[solve[fast_cancel]|apply hmi_pure_intro]end].
