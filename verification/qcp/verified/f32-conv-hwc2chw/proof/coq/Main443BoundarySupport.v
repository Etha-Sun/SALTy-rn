From HwcConv Require Export Main443InitNormalize Main443ProgressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma hmb_addr_mul_l:forall a b,hc_addr64(hc_addr64 a*b)=hc_addr64(a*b).
Proof. intros;unfold hc_addr64.
 rewrite(Z.mul_mod(a mod 18446744073709551616)b 18446744073709551616)by lia.
 rewrite Z.mod_mod by lia;symmetry;apply Z.mul_mod;lia. Qed.
Lemma hmb_addr_mul_r:forall a b,hc_addr64(a*hc_addr64 b)=hc_addr64(a*b).
Proof. intros;unfold hc_addr64.
 rewrite(Z.mul_mod a(b mod 18446744073709551616)18446744073709551616)by lia.
 rewrite Z.mod_mod by lia;symmetry;apply Z.mul_mod;lia. Qed.
Lemma hmb_addr_sub_l:forall a b,hc_addr64(hc_addr64 a-b)=hc_addr64(a-b).
Proof. intros;unfold hc_addr64.
 rewrite(Zminus_mod(a mod 18446744073709551616)b 18446744073709551616)by lia.
 rewrite Z.mod_mod by lia;symmetry;apply Zminus_mod;lia. Qed.
Lemma hmb_addr_sub_r:forall a b,hc_addr64(a-hc_addr64 b)=hc_addr64(a-b).
Proof. intros;unfold hc_addr64.
 rewrite(Zminus_mod a(b mod 18446744073709551616)18446744073709551616)by lia.
 rewrite Z.mod_mod by lia;symmetry;apply Zminus_mod;lia. Qed.
Lemma hmb_valid_row:forall input zero H N row,
 0<=row<H->hc_row_base input zero H N row=input+12*row*N.
Proof. intros;unfold hc_row_base.
 assert(HL:(row<?0)=false)by(apply Z.ltb_ge;lia).
 assert(HR:(H<=?row)=false)by(apply Z.leb_gt;lia);rewrite HL,HR;reflexivity. Qed.
Ltac hmb_mod_nf:=rewrite ?hmi_cast64;
 repeat progress(try rewrite <-Z.add_assoc;
 rewrite ?hmi_addr_add_l,?hmi_addr_add_r,?hmi_addr_idem,
 ?hmb_addr_mul_l,?hmb_addr_mul_r,?hmb_addr_sub_l,?hmb_addr_sub_r).
Ltac hmb_frame:=
 unfold StructPredfloat32x4_t,UndefStructPredfloat32x4_t,
 StructPredfloat32x2_t,UndefStructPredfloat32x2_t in *;
 cbn[float32x4_t_s0 float32x4_t_s1 float32x4_t_s2 float32x4_t_s3
 float32x2_t_s0 float32x2_t_s1]in *;
 rewrite ?hc_local_field_address in *;
 entailer!;try lia.
Lemma hmb_width_bounds:forall F input zero weights params H N top start finish C,
 hc_input_domain F input zero weights params H N top start finish C->
 0<12*N<18446744073709551616 /\ N+1<18446744073709551616 /\
 0<=SupportModel.hc_round_model N<=N.
Proof.
 intros F input zero weights params H N top start finish C HD.
 unfold hc_input_domain in HD;destruct HD as[HH[HN[HC[HT[HY[HE[HF rest]]]]]]].
 unfold hc_footprint,hc_u64_limit in HF;destruct HF as[HP[HCnt HB]].
 assert(HNword:0<12*N<18446744073709551616)by nia.
 split;[exact HNword|];split;[lia|].
 unfold SupportModel.hc_round_model.
 pose proof(Z.mod_pos_bound N 4 ltac:(lia)).
 pose proof(Z.div_mod N 4 ltac:(lia)).
 assert(HQ:0<=N/4)by(apply Z.div_pos;lia);nia.
Qed.
Lemma hmb_valid_read:forall input zero H N row,
 0<N->hc_footprint input(3*H*N+3)->0<=row<H->
 hc_addr64(input+12*N*row)=hc_row_base input zero H N row.
Proof.
 intros input zero H N row HN HF HR.
 rewrite hmb_valid_row by exact HR.
 replace(input+12*N*row)with(input+12*row*N)by ring.
 unfold hc_addr64;rewrite Z.mod_small;[reflexivity|].
 unfold hc_footprint,hc_u64_limit in HF;destruct HF as[HP[HC HB]];nia.
Qed.
Ltac hmb_entry_context:=multimatch goal with
 | HD:hc_input_domain ?F ?input ?zero ?weights ?params ?H ?N ?top ?start ?finish ?C|-_=>
 let B:=fresh "Hwidth"in pose proof(hmb_width_bounds F input zero weights params H N top start finish C HD)as B;
 destruct B as[? [? ?]] end.
Ltac hmb_valid_read_solve:=hmb_mod_nf;
 multimatch goal with
 | |-hc_addr64 ?expr=hc_row_base ?input ?zero ?H ?N ?row=>
 replace expr with(input+12*N*row)by ring;
 apply hmb_valid_read;[lia|first[eassumption|unfold hc_footprint,hc_u64_limit;repeat split;nia]|lia]
 end.
Ltac hmb_rows_initial:=unfold hc_rows_pending,hc_pending_row;
 intros;repeat split;intros;first[lia|reflexivity|hmb_valid_read_solve].
Ltac hmb_pending_outputs:=unfold hc_pending_outputs;intros;hmb_mod_nf;
 split;apply(f_equal hc_addr64);ring.
Ltac hmb_entry_solve:=first[
 solve[hmi_word_goal;first[reflexivity|ring]]|
 solve[hmi_word_goal;hmb_mod_nf;apply(f_equal hc_addr64);ring]|
 solve[hmb_rows_initial]|solve[hmb_pending_outputs]].
